Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEFE280CC8;
	Wed, 23 Apr 2025 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420586; cv=none; b=ilmSy5KJuV5nHu0cP/zqik5ob3W9sYFqJF1hvwM/tlHi+NG5wuktUTLQil/H+XWOC/MvGrvuiBImoXXyUWtY8Q6ZzW6iRSBZBLhZg4VS9fU/Po27+xzwOrPoj9DpV8hFF+C10EdI00RO9xsJZxCNoN/kffeC780/Ksr4+tCYmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420586; c=relaxed/simple;
	bh=gz5NPn6ncGhKoKG7PwCxbRreNA35vwbFRsi4H4w0xJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbQznlIHUUlOEj1JUz9raxEtrBaM2ww0eJFzSXr/rW5AHx4hr7t76ULzoZpnYxZn/oM1VNBddtSQ5GpD2nLn3tpSY94R5PEKguK29x7VEe2Qq1y96eV2FsOuyyH6LocDvHxI7Z2AO7hnXzWMAyk4e0epxX9E+L9btK9gafYGMFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs5ps9jj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs5ps9jj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE447C4CEE2;
	Wed, 23 Apr 2025 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745420586;
	bh=gz5NPn6ncGhKoKG7PwCxbRreNA35vwbFRsi4H4w0xJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rs5ps9jjqKqL/4uyBfL+df57g0sl4VdfJoO/9kkFxCOMQJgyE/Dr9++jaScNT4tzV
	 d7S5naC18jgE9OTQ/orroVkWBH6p9paUB5FS1i1Mrxtq4iCPEcRoyy63wU3EqBbJfG
	 6RgFkztGZSeCUZoLHP+1ixBzOX3ccN0bJ2DtUpXz3GTMTK+LUtnAIE/EjfJE3pd/dq
	 qGvuKmcWMCCjEf+QDqB0UiQCX4EtZ9Ivj1g8lBQben2VgI2BJdn4vodC5EGr3QiR8g
	 7CSA82mnHzQKjf0yYx0YasFMMHKUKfTNH+e7mBaSyHdGTZQ+Ju+kvty33dx1j+PCLB
	 yRVfZ94Gy74WA==
Date: Wed, 23 Apr 2025 17:02:58 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aAkBIvfTkKVNbdnm@pollux>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com>
 <aAjz2CYTsAhidiEU@pollux>
 <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88937e2b-6950-4c9d-8f02-50f9b12c7376@nvidia.com>

On Wed, Apr 23, 2025 at 10:52:42AM -0400, Joel Fernandes wrote:
> Hello, Danilo,
> Thanks for all the feedback. Due to the volume of feedback, I will respond
> incrementally in multiple emails so we can discuss as we go - hope that's Ok but
> let me know if that is annoying.

That's perfectly fine, whatever works best for you. :)

> On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> 
> >> +impl Vbios {
> >> +    /// Read bytes from the ROM at the current end of the data vector
> >> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> >> +        let current_len = data.len();
> >> +        let start = ROM_OFFSET + current_len;
> >> +
> >> +        // Ensure length is a multiple of 4 for 32-bit reads
> >> +        if len % core::mem::size_of::<u32>() != 0 {
> >> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> > 
> > Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> > ones instead.
> 
> Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
> from the Bar0 and pass that along, but that should be doable.

You can also pass the pci::Device reference to VBios::probe() directly.

> 
> > 
> >> +            return Err(EINVAL);
> >> +        }
> >> +
> >> +        // Allocate and zero-initialize the required memory
> > 
> > That's obvious from the code, if you feel this needs a comment, better explain
> > what we need it for, why zero-initialize, etc.
> 
> Sure, actually the extends_with() is a performance optimization as we want to do
> only a single allocation and then fill in the allocated data. It has nothing to
> do with 0-initializing per-se. I will adjust the comment, but:
> 
> This code...
> 
> >> +        data.extend_with(len, 0, GFP_KERNEL)?;
> >> +        with_bar!(?bar0, |bar0_ref| {
> >> +            let dst = &mut data[current_len..current_len + len];
> >> +            for (idx, chunk) in dst
> >> +                .chunks_exact_mut(core::mem::size_of::<u32>())
> >> +                .enumerate()
> >> +            {
> >> +                let addr = start + (idx * core::mem::size_of::<u32>());
> >> +                // Convert the u32 to a 4 byte array. We use the .to_ne_bytes()
> >> +                // method out of convenience to convert the 32-bit integer as it
> >> +                // is in memory into a byte array without any endianness
> >> +                // conversion or byte-swapping.
> >> +                chunk.copy_from_slice(&bar0_ref.try_read32(addr)?.to_ne_bytes());
> >> +            }
> >> +            Ok(())
> >> +        })?;
> >> +
> >> +        Ok(())
> >> +    }
> ..actually initially was:
> 
> +        with_bar!(self.bar0, |bar0| {
> +            // Get current length
> +            let current_len = self.data.len();
> +
> +            // Read ROM data bytes push directly to vector
> +            for i in 0..bytes as usize {
> +                // Read byte from the VBIOS ROM and push it to the data vector
> +                let rom_addr = ROM_OFFSET + current_len + i;
> +                let byte = bar0.try_readb(rom_addr)?;
> +                self.data.push(byte, GFP_KERNEL)?;
> 
> Where this bit could result in a lot of allocation.
> 
> There was an unsafe() way of not having to do this but we settled with
> extends_with().
> 
> Thoughts?

If I understand you correctly, you just want to make sure that subsequent push()
calls don't re-allocate? If so, you can just use reserve() [1] and keep the
subsequent push() calls.

[1] https://rust.docs.kernel.org/kernel/alloc/kvec/struct.Vec.html#method.reserve
