Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D1B221274
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170872; cv=none; b=EgbnWBEA+aOU89yKbQhGVZwUAcXAFUgmoE2MHDzrM0BJ9yLtMTMtQ3cARLDSV2rBdaBxoCPCm2Xqv3etVYfE5Et9YIqqTreGN9Dw2j0xS+16wqh1MgmRdklkM532cOklOTYgzTqzgtaum40sUdeNrj6K+OSNQ+7lJkDHBl3I4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170872; c=relaxed/simple;
	bh=o8UpEgFJOjW5u3JTcnQKEk0Ohg1e2aAlB98/1EInp/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TG2NSV5qTCFH6fuwFxTjGWWfHSomrEnrUVMZX/+7PBlo4qwYN6pJGVzdaYP0Ai+8xjJfT3s8fd3Vk3NCqfrV9hXtQa1LnuYv1YQ+gD+jvv6iVwGDKnxNQuV77/Q++005bXYyz2wx2nMCjOVCScufcCd2bAM0iDDAl8Kpo2Zci8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=EUgPc6B7; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="EUgPc6B7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B0B6B240028
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:27:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1746170868; bh=o8UpEgFJOjW5u3JTcnQKEk0Ohg1e2aAlB98/1EInp/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=EUgPc6B7lVCruRhxGDoAz2eg1NU5gqWFY9S/NOgWLO5KZjcAZzM64iD4OkY35aVWg
	 KgD/4EFPWXXo8fKK40cHJTXxsPjf7NheMBriCnOr1MAlxLw/7k4O455Leq/q7s/kEI
	 jE3HdQLPRhG0J1UciidgXwEUIsCuoZeQocpXc1aY1mnhgF+lb3K1h4Czg7QxxsoGcz
	 ogGS4UkrLCxpSWJjByt5zU/rtXaIF7xUzqI+sRVhIXeCcHZ0Yx9ks53LkY3gX7GogD
	 RPw5I56wwJvV4s+sbNnVRGFr49g6GgaoJ2JT4cL4ZC2Eo2iUreucOEea/HNF2rvIP+
	 +s/hKvJAhtN/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZpjDr22n2z6txp;
	Fri,  2 May 2025 09:27:40 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Joel Becker
 <jlbec@evilplan.org>,  Peter Zijlstra <peterz@infradead.org>,  Ingo Molnar
 <mingo@redhat.com>,  Will Deacon <will@kernel.org>,  Waiman Long
 <longman@redhat.com>,  Fiona Behrens <me@kloenk.dev>,  Daniel Almeida
 <daniel.almeida@collabora.com>,  Breno Leitao <leitao@debian.org>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] rust: configfs: add a sample demonstrating
 configfs usage
In-Reply-To: <20250501-configfs-v6-2-66c61eb76368@kernel.org>
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-2-66c61eb76368@kernel.org>
Date: Fri, 02 May 2025 07:27:24 +0000
Message-ID: <87zffvxyjn.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Add a sample to the samples folder, demonstrating the intended use of the
> Rust configfs API.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  samples/rust/Kconfig          |  11 +++
>  samples/rust/Makefile         |   1 +
>  samples/rust/rust_configfs.rs | 192 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 204 insertions(+)
>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index cad52b7120b5..be491ad9b3af 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -10,6 +10,17 @@ menuconfig SAMPLES_RUST
>  
>  if SAMPLES_RUST
>  
> +config SAMPLE_RUST_CONFIGFS
> +	tristate "Configfs sample"
> +	depends on CONFIGFS_FS
> +	help
> +	  This option builds the Rust configfs sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_configfs.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_MINIMAL
>  	tristate "Minimal"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index c6a2479f7d9c..b3c9178d654a 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
> +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
>  
>  rust_print-y := rust_print_main.o rust_print_events.o
>  
> diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
> new file mode 100644
> index 000000000000..9c0989072a8f
> --- /dev/null
> +++ b/samples/rust/rust_configfs.rs
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust configfs sample.
> +
> +use kernel::alloc::flags;
> +use kernel::c_str;
> +use kernel::configfs;
> +use kernel::configfs_attrs;
> +use kernel::new_mutex;
> +use kernel::page::PAGE_SIZE;
> +use kernel::prelude::*;
> +use kernel::sync::Mutex;
> +
> +module! {
> +    type: RustConfigfs,
> +    name: "rust_configfs",
> +    author: "Rust for Linux Contributors",
> +    description: "Rust configfs sample",
> +    license: "GPL",
> +}
> +
> +#[pin_data]
> +struct RustConfigfs {
> +    #[pin]
> +    config: configfs::Subsystem<Configuration>,
> +}
> +
> +#[pin_data]
> +struct Configuration {
> +    message: &'static CStr,
> +    #[pin]
> +    bar: Mutex<(KBox<[u8; PAGE_SIZE]>, usize)>,
> +}
> +
> +impl Configuration {
> +    fn new() -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {
> +            message: c_str!("Hello World\n"),
> +            bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
> +        })
> +    }
> +}
> +
> +impl kernel::InPlaceModule for RustConfigfs {
> +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> +        pr_info!("Rust configfs sample (init)\n");
> +
> +        // Define a subsystem with the data type `Configuration`, two
> +        // attributes, `message` and `bar` and child group type `Child`. `mkdir`
> +        // in the directory representing this subsystem will create directories
> +        // backed by the `Child` type.
> +        let item_type = configfs_attrs! {
> +            container: configfs::Subsystem<Configuration>,
> +            data: Configuration,
> +            child: Child,
> +            attributes: [
> +                message: 0,
> +                bar: 1,
> +            ],
> +        };
> +
> +        try_pin_init!(Self {
> +            config <- configfs::Subsystem::new(
> +                c_str!("rust_configfs"), item_type, Configuration::new()
> +            ),
> +        })
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::GroupOperations for Configuration {
> +    type Child = Child;
> +
> +    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
> +        // Define a group with data type `Child`, one attribute `baz` and child
> +        // group type `GrandChild`. `mkdir` in the directory representing this
> +        // group will create directories backed by the `GrandChild` type.
> +        let tpe = configfs_attrs! {
> +            container: configfs::Group<Child>,
> +            data: Child,
> +            child: GrandChild,
> +            attributes: [
> +                baz: 0,
> +            ],
> +        };
> +
> +        Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::AttributeOperations<0> for Configuration {
> +    type Data = Configuration;
> +
> +    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
> +        pr_info!("Show message\n");
> +        let data = container.message;
> +        page[0..data.len()].copy_from_slice(data);
> +        Ok(data.len())
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::AttributeOperations<1> for Configuration {
> +    type Data = Configuration;
> +
> +    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
> +        pr_info!("Show bar\n");
> +        let guard = container.bar.lock();
> +        let data = guard.0.as_slice();
> +        let len = guard.1;
> +        page[0..len].copy_from_slice(&data[0..len]);
> +        Ok(len)
> +    }
> +
> +    fn store(container: &Configuration, page: &[u8]) -> Result {
> +        pr_info!("Store bar\n");
> +        let mut guard = container.bar.lock();
> +        guard.0[0..page.len()].copy_from_slice(page);
> +        guard.1 = page.len();
> +        Ok(())
> +    }
> +}
> +
> +// `pin_data` cannot handle structs without braces.
> +#[pin_data]
> +struct Child {}
> +
> +impl Child {
> +    fn new() -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {})
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::GroupOperations for Child {
> +    type Child = GrandChild;
> +
> +    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
> +        // Define a group with data type `GrandChild`, one attribute `gz`. As no

Hi Andreas,

Maybe you meant "one attribute `gc`" here?

C. Mitrodimas

> +        // child type is specified, it will not be possible to create subgroups
> +        // in this group, and `mkdir`in the directory representing this group
> +        // will return an error.
> +        let tpe = configfs_attrs! {
> +            container: configfs::Group<GrandChild>,
> +            data: GrandChild,
> +            attributes: [
> +                gc: 0,
> +            ],
> +        };
> +
> +        Ok(configfs::Group::new(
> +            name.try_into()?,
> +            tpe,
> +            GrandChild::new(),
> +        ))
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::AttributeOperations<0> for Child {
> +    type Data = Child;
> +
> +    fn show(_container: &Child, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
> +        pr_info!("Show baz\n");
> +        let data = c"Hello Baz\n".to_bytes();
> +        page[0..data.len()].copy_from_slice(data);
> +        Ok(data.len())
> +    }
> +}
> +
> +// `pin_data` cannot handle structs without braces.
> +#[pin_data]
> +struct GrandChild {}
> +
> +impl GrandChild {
> +    fn new() -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {})
> +    }
> +}
> +
> +#[vtable]
> +impl configfs::AttributeOperations<0> for GrandChild {
> +    type Data = GrandChild;
> +
> +    fn show(_container: &GrandChild, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
> +        pr_info!("Show grand child\n");
> +        let data = c"Hello GC\n".to_bytes();
> +        page[0..data.len()].copy_from_slice(data);
> +        Ok(data.len())
> +    }
> +}
