Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1684A30;
	Sat,  1 Feb 2025 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738411964; cv=none; b=E9C+RvorTrqiuuWpuHwUbyAaNLAcuKv/31qoWbPAh9rDB43+hJysCZvX/EV00ULKuo84HJZughwajOKjMyHKX01ngxI/Qj34NxrjkZyb2eUBi+kWxMRTayOLfl0KriRgqdVVCfCTysYxjl23uPwRL93tfH++K/2w/aMMRjeSzJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738411964; c=relaxed/simple;
	bh=zqN7AakLlbtVefgeIf3wADi+hbc/wJ/4nlqzKX2S6xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzgH8VCMox3CGY7SUJwudzTwaWYI4undD3V2SVYmZkXEoOURLdkRw5hjw2BO+1S7MJUnZEVVd6SEee8qYyBGFQMoSXnOiCpL39Qkx6QDMMFbQkyyWPspjwRd9SZwMt0ITMaJ4rFxsX43RoF1ZAzPBdJ6MPs9TzihG3FmFGt3IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4YFI8tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4YFI8tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FF6C4CED3;
	Sat,  1 Feb 2025 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738411963;
	bh=zqN7AakLlbtVefgeIf3wADi+hbc/wJ/4nlqzKX2S6xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4YFI8tv35vRm6FBikSeoD+z0U2PU15duxLPkIK9EeJSbci27jlSwjE5KnnOTmmVC
	 67vmY76tlJ1UcdOGKbybLY1VmJ+uFS2QLF1S6lltNYOh+Jw96Wkl3bshnWNlZOKUq6
	 2mDrZnDz+PH2imYaLfPrIkI9UaOjTQ4/Aq+2KlIJyzvEeyNMG64OxqGXKCa/A8jGco
	 CZLuw9bjSOw+NPGL3u/h8fuTdi56vb4WHQmkPwhHaQE1bze8vx53qiI3qe6nziogXw
	 1LzJX2WnjAX8bHWaIbo3yTREe2k4fVKzZj+KKbMt+ikTE6dj9u8PNU3pH/mziZJwos
	 Z3/Tzyqf6WS9Q==
Date: Sat, 1 Feb 2025 13:12:35 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <greg@kroah.com>
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
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z54PsyY-fNRBwJQ4@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2025020151-leverage-unadorned-fb05@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020151-leverage-unadorned-fb05@gregkh>

On Sat, Feb 01, 2025 at 09:33:28AM +0100, Greg KH wrote:
> On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > +impl Gpu {
> > +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> > +        let spec = GpuSpec::new(&bar)?;
> > +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "NVIDIA {:?} ({:#x})",
> > +            spec.chipset,
> > +            spec.boot0
> > +        );
> 
> When drivers work properly, they should be quiet, so can you move this
> to dev_dbg()?

Sure, the only reason I made this dev_info!() is because, as an initial
skeleton, the driver isn't doing anything else for now. So, I thought it would
be nice to have some sign of life.

Of course, the intention was to remove this, once there's any other sign of
life.
