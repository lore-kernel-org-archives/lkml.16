Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A572153EA;
	Wed,  4 Jun 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032932; cv=none; b=f5X8+ZFmp+X5DD5xkj+7vAkLkXw0PD/rrbvI3jCCvwiLgEBVPhovZlH0RZothG40S8ORgOmCVv5J9CKALPjKZ7UOI8uisP0YeM0MAdF6hjm/WS2PhozcweZMjRctJowGW9AAQtfGvYKbpc4kAw3eQNAtYum1GQrp7AFk4cOakrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032932; c=relaxed/simple;
	bh=JBl2S2HcUiHa7eTyy0mmRlKPLkijJl96CchvkFqMJNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkzwAuBLtkl+RQ6qUWU6St+IGScdzz3Tm9wUVpvZEicdEnULd4cV92ZU4KTjmq00WFmz7QuAaX4z+8J21nAQRX4BI4SAadi7AQVysb/lQ0kuNONGyS1u9IG/MaCIe6MIWD12skWgg2iEBUOYZ4UGf0FtjhT0bKyHqZm3F40UuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qP9yIi1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qP9yIi1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401EFC4CEE7;
	Wed,  4 Jun 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749032931;
	bh=JBl2S2HcUiHa7eTyy0mmRlKPLkijJl96CchvkFqMJNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qP9yIi1GWziSK+VEJTpm1vEyrBxdG0uppVJAd6frmyrfEEZs2s5ba3u9NsSupTlTw
	 DztOcoXc8EjQM0TDdtKR1jrVryh2iiC/To4hlWR9VuGAIFk2WrfJYI/YEApkELqkSN
	 /oms3NVAgEpR2Hnr9jYOi5HUvxcJiaEPktU+qL/quWemrVQKOeMZExJhiCLHrmpqoK
	 mtpwUXM2kpVPamsZ+tdNlIM7qIBYb/VI9J4j/uk7jZyr9C6ujVg6oM5MT3ThPMqn/7
	 1yZ0kl9lccbciDhbRaTaw0sndq+0UyUJyHXf7mu7RTHxo32jxQv3ba2Poyru3o9bSt
	 fMx2pRB0wAEbg==
Date: Wed, 4 Jun 2025 12:28:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 18/20] gpu: nova-core: add types for patching firmware
 binaries
Message-ID: <aEAf3GUUz5oxnuk9@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>

On Wed, May 21, 2025 at 03:45:13PM +0900, Alexandre Courbot wrote:
> +/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
> +///
> +/// This is module-local and meant for sub-modules to use internally.
> +struct FirmwareDmaObject<F: FalconFirmware>(DmaObject, PhantomData<F>);
> +
> +/// Trait for signatures to be patched directly into a given firmware.
> +///
> +/// This is module-local and meant for sub-modules to use internally.
> +trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
> +
> +#[expect(unused)]
> +impl<F: FalconFirmware> FirmwareDmaObject<F> {
> +    /// Creates a new `UcodeDmaObject` containing `data`.
> +    fn new(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
> +        DmaObject::from_data(dev, data).map(|dmaobj| Self(dmaobj, PhantomData))
> +    }
> +
> +    /// Patches the firmware at offset `sig_base_img` with `signature`.
> +    fn patch_signature<S: FirmwareSignature<F>>(
> +        &mut self,
> +        signature: &S,
> +        sig_base_img: usize,
> +    ) -> Result<()> {
> +        let signature_bytes = signature.as_ref();
> +        if sig_base_img + signature_bytes.len() > self.0.size() {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: we are the only user of this object, so there cannot be any race.
> +        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
> +
> +        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
> +        unsafe {
> +            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
> +        };
> +
> +        Ok(())
> +    }
> +}

If we can't patch them when the object is created, i.e. in
FirmwareDmaObject::new(), I think we should take self by value in
FirmwareDmaObject::patch_signature() and return a SignedFirmwareDmaObject (which
can just be a transparent wrapper) instead in order to let the type system prove
that we did not forget to call patch_signature().
