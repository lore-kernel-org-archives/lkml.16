Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80361990CD;
	Mon, 10 Feb 2025 06:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168703; cv=none; b=DbhnFCwLSr6dJNULfNv3Wu4aQGKpYvVFUMjJloJrWfu6IG1UITionxfvR1Jj2xR0PX36F0Y7zTqbd4zPWSM17+Qu5vDWGep5hlg5rNqBilbVqruFTcng10WIPV2iLaKrWOTUkW3XYcw2VR9o6EwwtmlcIFclzmnt2bkkOxu0ZcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168703; c=relaxed/simple;
	bh=fSEh8wAH74tf2Pgk9r76wl/MA4PVpqat9Ab0u7aTfV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBnnpPrszT/m8h+L/yfoTgOsUPEFRsur9S87Q/kGpSOLdy7wmNqyvAXB+rqvDdj+VF7Cp3QHjklZAObrdTE2KMjuU2F/l4ZGhzQXDWCuLIcYDjH5MY5mYG7mdeIHTAzQ3S5gpn2qcvfeHsv5QDiv9drO6pAr0b47U71XDQv4ChQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VCB7sw5X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VCB7sw5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90853C4CED1;
	Mon, 10 Feb 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739168703;
	bh=fSEh8wAH74tf2Pgk9r76wl/MA4PVpqat9Ab0u7aTfV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VCB7sw5XNiMlm/DHUR77DE//9H7W9gAlGdrTtVwC32UQD74Y/pIw0hroZHzHzozTS
	 ju9CU/kNR469twGAnJ8HRT16YZ8doAnhjqGpdgFfEujoQITAId9UD7m+o6+PFlrv2Z
	 weL+yFZzFWgUIBbEmeAN0BHB1GpJIxXLmE7t5jsg=
Date: Mon, 10 Feb 2025 07:24:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpu: nova-core: add initial driver stub
Message-ID: <2025021011-dangling-retrain-f61e@gregkh>
References: <20250209173048.17398-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209173048.17398-1-dakr@kernel.org>

On Sun, Feb 09, 2025 at 06:30:24PM +0100, Danilo Krummrich wrote:
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n

Tiny nit, if you happen to respin this, "default n" is always the
default, so there's never a need to specify it.

> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
> +        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let request = |name_| {
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))

How does this match up with the MODULE_FIRMWARE() aliases that end up in
a kernel module so that the tools know to add the firmware to the system
in the proper place (i.e. initramfs or something like that)?

I always thought you needed to individually list the firmware files, or
does the rust implementation now somehow handle that in a programatic
way from strings like this?

thanks,

greg k-h
