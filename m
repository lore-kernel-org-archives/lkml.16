Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B111BDA8C;
	Sat,  1 Feb 2025 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423898; cv=none; b=fLByKcHfXZjYBTOZ4qcWQjwi4nMqA95Uzt3zYkrQ+0Gf5Z8K5JwnaOZadOdj8sepDSzIFXnZxJtVsIykFPzakT7RTUVSYVKawz68IFu9ex2iPPLl1lkQAcK2ylzlThlSAnOCzaGqnDPcI4L/RvgAnTsI93f4n3eYTdaUt6fGYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423898; c=relaxed/simple;
	bh=BCfoSKNCnyed4pGlqcdaf/sT4JZcLQJ9eWwjsd1k3T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUDWE+oNJnrsCtpCN0MOMo5mGjK2zLJNQVIldIH4D7QreWpken7XjebhwWkLHSWyt4gl1FsqNr36MfHoBXi4x/0ZFbXElP3ca2vuDuN+0BE8RlUEP8LXIo8ipfSTmKuOyOFyvBq2QCsatGni1GtMDr7UKi607wQ6ay5DvvuKOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EJCX1Mk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EJCX1Mk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2E4C4CED3;
	Sat,  1 Feb 2025 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738423898;
	bh=BCfoSKNCnyed4pGlqcdaf/sT4JZcLQJ9eWwjsd1k3T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJCX1Mk8Dmq3aAPY4D3MLsUfCbOAuj9/BvP9obN70pVWwM2hP4YWJT5GdnL1yqzIf
	 +JqQapEUi7XJMu2D6/JKuAkjwJZt4Xc0h1SypS2W0gMHdnwGXCzPPcWchY5M7FK3wr
	 vrNfYgwSmRTLDS8HR3fd/72TByCC1aIeSHDGlWPU=
Date: Sat, 1 Feb 2025 16:31:34 +0100
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
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <2025020115-siesta-regress-96ef@gregkh>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2025020151-leverage-unadorned-fb05@gregkh>
 <Z54PsyY-fNRBwJQ4@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z54PsyY-fNRBwJQ4@cassiopeiae>

On Sat, Feb 01, 2025 at 01:12:35PM +0100, Danilo Krummrich wrote:
> On Sat, Feb 01, 2025 at 09:33:28AM +0100, Greg KH wrote:
> > On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > > +impl Gpu {
> > > +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> > > +        let spec = GpuSpec::new(&bar)?;
> > > +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> > > +
> > > +        dev_info!(
> > > +            pdev.as_ref(),
> > > +            "NVIDIA {:?} ({:#x})",
> > > +            spec.chipset,
> > > +            spec.boot0
> > > +        );
> > 
> > When drivers work properly, they should be quiet, so can you move this
> > to dev_dbg()?
> 
> Sure, the only reason I made this dev_info!() is because, as an initial
> skeleton, the driver isn't doing anything else for now. So, I thought it would
> be nice to have some sign of life.
> 
> Of course, the intention was to remove this, once there's any other sign of
> life.

Ok, that's fine, just a constant reminder I send everyone for new
drivers when I see this happen :)
