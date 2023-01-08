# AWS Course

## Semana 1

### Elegir Región

Los datos se almacenan de **Data Center**, estos se conectan y replican dentro de una **Availability Zone**, esta última se conecta y replica dentro de una **Region**.

Región hay muchas, EU, Canada, Sao Paulo, etc.

Para elegir hay que tener atención en:

- Compliance: Leyes que regulen los datos (datos solo pueden estar en cierto país).

- Latency: Tener aplicación más cercana a los usuarios.

- Pricing: Sao Paulo es más caro.

- Service Avaibility: Podría querer que un servicio no sea alcanzable desde ciertas regiones.

### IAM Policy

Crea usuarios con permisos para interactuar con API AWS, se puede asociar a grupos también.

Maneja acceso a cuenta AWS y recursos.

> Estoy usando EC2DynamoFullAccess

## Semana 2

### Cómputo

#### Amazon EC2

Una máquina virtual. AMI (amazon machine image) es cómo se modela la instancia.

[][FOTO2]

Cobros asociados solo a instancias **running** o **stopping** (preparándose para hibernar).

Una instancia posee nombre del tipo `c5.large`.

- `c5` es la familia de la instancia, esta es de quinta generación optimizada para computación general.
- `large` es la cantidad de capacidad de la instancia.

##### Opciones de pago

- On demand: Paga el tiempo que está usándose.
- Reserve Capacity with Reserved Instances: Pagas periódos más largos (1 año - 3 años).
- Spot instance: Se ofrece un precio y si es justo se entrega la instancia, AMAZON puede cancelarla si lo desea, por eso mejor usar para cosas recilientes.


#### Amazon ECS / EKS

Contenedores (como docker), usa por debajo EC2.

#### Amazon Lambda

Se programa una función que actúa bajo gatillos (una subida de archivo, petición http, etc). Actúan en ambientes aislados, corren código de menos de 15 minutos.

Se cobra cantidad de peticiones y tiempo que supere 1ms.

### Redes

#### VPC

#### Subredes

#### Internet Gateway

## Semana 3

### Almacenamiento

#### EC2 instance store

Almacenamiento incluido en EC2

#### EFS (Amazon Elastic File System)



#### EBS (Elastic Block Store)

Es como un disco duro externo, se puede asociar a una EC2.

Los respaldos son Snapshot.

#### S3 (Amazon Simple Storage Service)

Se requiere crear un Bucket para subir archivos, se suben dentro de estos.

### Base de Datos

#### Amazon RDS (Relational Database Service)

Cobra por tiempo que corre

#### Amazon Dynamo DB

Cobra por espacio que usa

#### Amazon Document DB

#### Amazon Neptune

Graph database

#### Amazon QLDB (Quantum Ledger DataBase)

Inmutable registro, las cosas no pueden ser removido.

## Semana 4

### Monitoreo 

#### Amazon Cloud Watch

Perminte hacer Dashboard para monitorear, además de añadir alarmas acorde a las métricas.

### Optimization

#### ELB

Elastic Load Balancer

#### EC2 Auto Scaling
