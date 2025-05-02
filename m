Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDF23C500;
	Fri,  2 May 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187545; cv=none; b=Xf8RrHBpVl248Nf2JTtrQNq8a/jB5IcWl/+kOzFd8gXsA3ZC6kiny+7OTsEuXaq+cdeXLA27rbe5EHr2nHU1crS2eYepz87dMr3wx3QNBtUJIFAz2ylNiO5Bhpk9dy1XvjUD0z/Jsu5AizQ8ua2gPuCLkqKbxDF3PAUilr70Tlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187545; c=relaxed/simple;
	bh=rWCBGbse77+1PvECpwJXdAku0xwgN/Itv99hKe2N5RQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hwhrGYXRW3wH9L+M2PSG4h47o24fIHU38nMGxFeAYEnHQvjk3wVxBeNbGLVkAFXtVRfJNTDowRu6A83/6zU6xdfYUvanYKySIVOBaLx3Y/aO0O8rt14LwaUBMAVCng+GfKTV7CM1xu3JMBdrENDKAzZXHNWt5fF0I+5E/eHJhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBe4QjSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBe4QjSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE475C4CEE4;
	Fri,  2 May 2025 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746187543;
	bh=rWCBGbse77+1PvECpwJXdAku0xwgN/Itv99hKe2N5RQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hBe4QjSbrrPmbtLrsAVFW+g+uUzKeQEaIezTfnpAW33idFWLB+SwAmTaaaA+Dnpxr
	 RIysFdwHb3Vnwn8RonI/1OdfJa8AE48utuAsNSafCBN5Hb2b6k6nvbwIf88/vYl0Gm
	 NdifmAFhjzKFGkONnBzt+w5HCd5AGrjd4Sr2a+4pZpHciUGvpW1pbPkOTSxuZqPpDi
	 64UnoD8KZYeOulcvDp9NTkFaJDakAN3zxXTBF16HokzczzuFJU8VMPorQvGdyO+Z9T
	 QXjxC8mxTq33Y2T00tIfJI1y/e5eUe4wVJIwPg58VEWhNg2HZ4WvBxfxmKOxASTLm+
	 6tt42ylSV3gKA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Peter Zijlstra"
 <peterz@infradead.org>,  "Ingo Molnar" <mingo@redhat.com>,  "Will Deacon"
 <will@kernel.org>,  "Waiman Long" <longman@redhat.com>,  "Fiona Behrens"
 <me@kloenk.dev>,  "Daniel Almeida" <daniel.almeida@collabora.com>,  "Breno
 Leitao" <leitao@debian.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/3] rust: configfs: add a sample demonstrating
 configfs usage
In-Reply-To: <87zffvxyjn.fsf@posteo.net> (Charalampos Mitrodimas's message of
	"Fri, 02 May 2025 07:27:24 +0000")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-2-66c61eb76368@kernel.org>
	<k3dxSDzFAvMtBtQR59u7O6t3cpZeWHCooCQe5AlyYqjsC5LXbl8vX1eivnvUZmGZdr5kxrxqyd74yiu5QnymSw==@protonmail.internalid>
	<87zffvxyjn.fsf@posteo.net>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 14:05:34 +0200
Message-ID: <871pt7z08h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Charalampos Mitrodimas" <charmitro@posteo.net> writes:

> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> Add a sample to the samples folder, demonstrating the intended use of the
>> Rust configfs API.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  samples/rust/Kconfig          |  11 +++
>>  samples/rust/Makefile         |   1 +
>>  samples/rust/rust_configfs.rs | 192 ++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 204 insertions(+)
>>
>> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
>> index cad52b7120b5..be491ad9b3af 100644
>> --- a/samples/rust/Kconfig
>> +++ b/samples/rust/Kconfig
>> @@ -10,6 +10,17 @@ menuconfig SAMPLES_RUST
>>
>>  if SAMPLES_RUST
>>
>> +config SAMPLE_RUST_CONFIGFS
>> +	tristate "Configfs sample"
>> +	depends on CONFIGFS_FS
>> +	help
>> +	  This option builds the Rust configfs sample.
>> +
>> +	  To compile this as a module, choose M here:
>> +	  the module will be called rust_configfs.
>> +
>> +	  If unsure, say N.
>> +
>>  config SAMPLE_RUST_MINIMAL
>>  	tristate "Minimal"
>>  	help
>> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
>> index c6a2479f7d9c..b3c9178d654a 100644
>> --- a/samples/rust/Makefile
>> +++ b/samples/rust/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
>>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
>>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
>>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
>> +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
>>
>>  rust_print-y := rust_print_main.o rust_print_events.o
>>
>> diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
>> new file mode 100644
>> index 000000000000..9c0989072a8f
>> --- /dev/null
>> +++ b/samples/rust/rust_configfs.rs
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Rust configfs sample.
>> +
>> +use kernel::alloc::flags;
>> +use kernel::c_str;
>> +use kernel::configfs;
>> +use kernel::configfs_attrs;
>> +use kernel::new_mutex;
>> +use kernel::page::PAGE_SIZE;
>> +use kernel::prelude::*;
>> +use kernel::sync::Mutex;
>> +
>> +module! {
>> +    type: RustConfigfs,
>> +    name: "rust_configfs",
>> +    author: "Rust for Linux Contributors",
>> +    description: "Rust configfs sample",
>> +    license: "GPL",
>> +}
>> +
>> +#[pin_data]
>> +struct RustConfigfs {
>> +    #[pin]
>> +    config: configfs::Subsystem<Configuration>,
>> +}
>> +
>> +#[pin_data]
>> +struct Configuration {
>> +    message: &'static CStr,
>> +    #[pin]
>> +    bar: Mutex<(KBox<[u8; PAGE_SIZE]>, usize)>,
>> +}
>> +
>> +impl Configuration {
>> +    fn new() -> impl PinInit<Self, Error> {
>> +        try_pin_init!(Self {
>> +            message: c_str!("Hello World\n"),
>> +            bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
>> +        })
>> +    }
>> +}
>> +
>> +impl kernel::InPlaceModule for RustConfigfs {
>> +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
>> +        pr_info!("Rust configfs sample (init)\n");
>> +
>> +        // Define a subsystem with the data type `Configuration`, two
>> +        // attributes, `message` and `bar` and child group type `Child`. `mkdir`
>> +        // in the directory representing this subsystem will create directories
>> +        // backed by the `Child` type.
>> +        let item_type = configfs_attrs! {
>> +            container: configfs::Subsystem<Configuration>,
>> +            data: Configuration,
>> +            child: Child,
>> +            attributes: [
>> +                message: 0,
>> +                bar: 1,
>> +            ],
>> +        };
>> +
>> +        try_pin_init!(Self {
>> +            config <- configfs::Subsystem::new(
>> +                c_str!("rust_configfs"), item_type, Configuration::new()
>> +            ),
>> +        })
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::GroupOperations for Configuration {
>> +    type Child = Child;
>> +
>> +    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<Child>, Error>> {
>> +        // Define a group with data type `Child`, one attribute `baz` and child
>> +        // group type `GrandChild`. `mkdir` in the directory representing this
>> +        // group will create directories backed by the `GrandChild` type.
>> +        let tpe = configfs_attrs! {
>> +            container: configfs::Group<Child>,
>> +            data: Child,
>> +            child: GrandChild,
>> +            attributes: [
>> +                baz: 0,
>> +            ],
>> +        };
>> +
>> +        Ok(configfs::Group::new(name.try_into()?, tpe, Child::new()))
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::AttributeOperations<0> for Configuration {
>> +    type Data = Configuration;
>> +
>> +    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>> +        pr_info!("Show message\n");
>> +        let data = container.message;
>> +        page[0..data.len()].copy_from_slice(data);
>> +        Ok(data.len())
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::AttributeOperations<1> for Configuration {
>> +    type Data = Configuration;
>> +
>> +    fn show(container: &Configuration, page: &mut [u8; PAGE_SIZE]) -> Result<usize> {
>> +        pr_info!("Show bar\n");
>> +        let guard = container.bar.lock();
>> +        let data = guard.0.as_slice();
>> +        let len = guard.1;
>> +        page[0..len].copy_from_slice(&data[0..len]);
>> +        Ok(len)
>> +    }
>> +
>> +    fn store(container: &Configuration, page: &[u8]) -> Result {
>> +        pr_info!("Store bar\n");
>> +        let mut guard = container.bar.lock();
>> +        guard.0[0..page.len()].copy_from_slice(page);
>> +        guard.1 = page.len();
>> +        Ok(())
>> +    }
>> +}
>> +
>> +// `pin_data` cannot handle structs without braces.
>> +#[pin_data]
>> +struct Child {}
>> +
>> +impl Child {
>> +    fn new() -> impl PinInit<Self, Error> {
>> +        try_pin_init!(Self {})
>> +    }
>> +}
>> +
>> +#[vtable]
>> +impl configfs::GroupOperations for Child {
>> +    type Child = GrandChild;
>> +
>> +    fn make_group(&self, name: &CStr) -> Result<impl PinInit<configfs::Group<GrandChild>, Error>> {
>> +        // Define a group with data type `GrandChild`, one attribute `gz`. As no
>
> Hi Andreas,
>
> Maybe you meant "one attribute `gc`" here?

Yes, thanks!


Best regards,
Andreas Hindborg


