Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C571D932F;
	Mon, 12 May 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058054; cv=none; b=g0YrnZiyycnPgFYlofu+8dIMi2ih1yFbgT48gIg/Newsj/O5eFOX32fxZh61Wqp2Ti7R+RBEs9AT0dqBtsQ81H39s/wtAYUlLN9tR1hpDuTi2h388T57blsmqQV1P8ApY9ngk6F0o1gL4qkqLBGZiBR4tldzh9Yg/veb5NQr/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058054; c=relaxed/simple;
	bh=kkei6kQ/IroDw4Fur6pVY2ogMklH5DkvVsA3sBxm1tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Frs3RysJjDf9rSTjfTEBCDDY64Df0nVy0GxtpxOBwvXJ//51SA5zA2bzPBWqntLE7OjlnzfB5ojFXIxTFs2zcztY0SCG/tLeRl8+HUVw7tI7dKAQsZIoj18pjdvSyJ2g2usTmQeTfKbfKhM0Kj439r01i+wY8rqMSZLUqyM3/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pyqmf/SL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyqmf/SL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD09C4CEED;
	Mon, 12 May 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747058053;
	bh=kkei6kQ/IroDw4Fur6pVY2ogMklH5DkvVsA3sBxm1tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pyqmf/SLA/LwKJg+pwa5MUD/nxp2c7FWrFKH1D9IT4ZwCUnaDqX7//vN9MD4Yfdbu
	 h9UxRliqc4Mx8pOlV5yDf6KFPUYKL6eJyb6THtLFYOgqMgZHNt949QRSKQGllEkzay
	 rVLMsD/QbYmkgGyqwvxHhb+TAVverxe/Hl2tZAgANNbgCTBsJr/4/ip/L3VvWUjIEm
	 E8dUHxzWVR3/65v7MA10Jznv/WUYteythFNX+gMsTObgJYLZAxwuyqG3gYRPr8+5f8
	 dQbKviVJEISyxF60XIzek9+6zEo79om7Y78KeIR+mcTs9e1Y9Kxjybifz6bNJZTgyW
	 l9q8FedEXwnYw==
Date: Mon, 12 May 2025 15:54:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 9/9] samples: rust: platform: Add property read
 examples
Message-ID: <aCH9f35BJ93ebWiB@pollux>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-10-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504173154.488519-10-remo@buenzli.dev>

On Sun, May 04, 2025 at 07:31:54PM +0200, Remo Senekowitsch wrote:
> Add some example usage of the device property read methods for
> DT/ACPI/swnode properties.
> 
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  drivers/of/unittest-data/tests-platform.dtsi |  3 +
>  samples/rust/rust_driver_platform.rs         | 71 +++++++++++++++++++-
>  2 files changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
> index 4171f43cf01cc..50a51f38afb60 100644
> --- a/drivers/of/unittest-data/tests-platform.dtsi
> +++ b/drivers/of/unittest-data/tests-platform.dtsi
> @@ -37,6 +37,9 @@ dev@100 {
>  			test-device@2 {
>  				compatible = "test,rust-device";
>  				reg = <0x2>;
> +
> +				test,u32-prop = <0xdeadbeef>;
> +				test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
>  			};
>  		};
>  
> diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
> index 8b42b3cfb363a..a04ff4afb1325 100644
> --- a/samples/rust/rust_driver_platform.rs
> +++ b/samples/rust/rust_driver_platform.rs
> @@ -2,7 +2,7 @@
>  
>  //! Rust Platform driver sample.
>  
> -use kernel::{c_str, device::Core, of, platform, prelude::*, types::ARef};
> +use kernel::{c_str, device::Core, of, platform, prelude::*, str::CString, types::ARef};
>  
>  struct SampleDriver {
>      pdev: ARef<platform::Device>,
> @@ -25,18 +25,85 @@ fn probe(
>          pdev: &platform::Device<Core>,
>          info: Option<&Self::IdInfo>,
>      ) -> Result<Pin<KBox<Self>>> {
> +        let dev = pdev.as_ref();
> +
>          dev_dbg!(pdev.as_ref(), "Probe Rust Platform driver sample.\n");
>  
>          if let Some(info) = info {
> -            dev_info!(pdev.as_ref(), "Probed with info: '{}'.\n", info.0);
> +            dev_info!(dev, "Probed with info: '{}'.\n", info.0);

You switch to use dev here, but not for dev_dbg() above.

>          }
>  
> +        Self::properties_parse(dev)?;

Let's just use pdev.as_ref() here too.

> +
>          let drvdata = KBox::new(Self { pdev: pdev.into() }, GFP_KERNEL)?;
>  
>          Ok(drvdata.into())
>      }
>  }
>  
> +impl SampleDriver {
> +    fn properties_parse(dev: &kernel::device::Device) -> Result<()> {

Please refer to this as &device::Device, i.e. import kernel::device. You should
also be able to just use Result, without the generic.

> +        let fwnode = dev.fwnode().ok_or(ENOENT)?;
> +
> +        if let Ok(idx) =
> +            fwnode.property_match_string(c_str!("compatible"), c_str!("test,rust-device"))
> +        {
> +            dev_info!(dev, "matched compatible string idx = {}\n", idx);
> +        }
> +
> +        if let Ok(str) = fwnode
> +            .property_read::<CString>(c_str!("compatible"))
> +            .required_by(dev)
> +        {
> +            dev_info!(dev, "compatible string = {:?}\n", str);
> +        }

And else? Why do you ignore a potential error?

> +
> +        let prop = fwnode.property_read_bool(c_str!("test,bool-prop"));
> +        dev_info!(dev, "bool prop is {}\n", prop);

Let's use a consistent style for all those prints, e.g. '$name'='$value'. For
instance:

	let name = c_str!("test,bool-prop");
	let prop = fwnode.property_read_bool(name);
	dev_info!(dev, "'{}'='{}'\n", name, prop);

> +        if fwnode.property_present(c_str!("test,u32-prop")) {
> +            dev_info!(dev, "'test,u32-prop' is present\n");

Given the above, I'd keep this one as it is.

> +        }
> +
> +        let prop = fwnode
> +            .property_read::<u32>(c_str!("test,u32-optional-prop"))
> +            .or(0x12);
> +        dev_info!(
> +            dev,
> +            "'test,u32-optional-prop' is {:#x} (default = {:#x})\n",
> +            prop,
> +            0x12
> +        );
> +
> +        // Missing property without a default will print an error

Maybe additionally add that you discard the Result intentionally in order to not
make properties_parse() fail in this case.

> +        let _ = fwnode
> +            .property_read::<u32>(c_str!("test,u32-required-prop"))
> +            .required_by(dev);
> +
> +        let prop: u32 = fwnode
> +            .property_read(c_str!("test,u32-prop"))
> +            .required_by(dev)?;
> +        dev_info!(dev, "'test,u32-prop' is {:#x}\n", prop);
> +
> +        let prop: [i16; 4] = fwnode
> +            .property_read(c_str!("test,i16-array"))
> +            .required_by(dev)?;
> +        dev_info!(dev, "'test,i16-array' is {:?}\n", prop);
> +        dev_info!(
> +            dev,
> +            "'test,i16-array' length is {}\n",
> +            fwnode.property_count_elem::<u16>(c_str!("test,i16-array"))?,
> +        );
> +
> +        let prop: KVec<i16> = fwnode
> +            .property_read_array_vec(c_str!("test,i16-array"), 4)?
> +            .required_by(dev)?;
> +        dev_info!(dev, "'test,i16-array' is KVec {:?}\n", prop);
> +
> +        Ok(())
> +    }
> +}
> +
>  impl Drop for SampleDriver {
>      fn drop(&mut self) {
>          dev_dbg!(self.pdev.as_ref(), "Remove Rust Platform driver sample.\n");
> -- 
> 2.49.0
> 
