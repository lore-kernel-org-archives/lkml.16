Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8062821B1BC;
	Wed, 18 Jun 2025 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278289; cv=none; b=lN1RnWjCb3wBCgbfCqQrq/lILjWDcLPDKSXhCvHkPsbGqlIFp8oW7eW9VECiwiY74LXwIT6vgS3TccY/PeClZYMU1xdwa4kKrn2hJTGLuVe6XCgwDQMC+fKla2uHOo6Yfu/ug2JnEBREfTn48e1/Xc0jlKaipMPL1iU8uvnRwo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278289; c=relaxed/simple;
	bh=4GCmh9V/BO2aKWAz9WhWrIZsBvlc1+u1r1T//FdrIng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEyXLxLEoFyU8ayluiUHPXUMwC5hWqk6j6NlCr0Z0zqsn5ShdPR1g4i9idJuTCTo3JqE9voNVKGRI4w1Fx/yxfkphtQnIOMGp6ylpmRb7qOc8o/QxUrH29MISF8Fkb1GpWPcBbn/uM30xJ8s9xrMPcaEVByYUT0nhs3/74a9SuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIwO3bqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIwO3bqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A218C4CEE7;
	Wed, 18 Jun 2025 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750278289;
	bh=4GCmh9V/BO2aKWAz9WhWrIZsBvlc1+u1r1T//FdrIng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIwO3bqbGcgVbQKaxSRNKuzTcyjApwJpMYcTlI+WLHICeh2mf6GniKw6iNX9jYPXg
	 SiOOUHC9gbmAUPtLGwz5QS/WKxZp1JC1MzUq3DwLkoZ+QV8nxsdBwUvaopf/pKU42V
	 +wqvQHffwVZkUKl0L3TsRrlKLDk2m8XX5gyMweIUGkXlhrtlgvljfkScNlH8I7h6et
	 mS/sGwEuIfDn37HHBtCxsDcUO2fiKm9rNbJODI4ttuOBoxoTxAQeW6PLN+Giwye5CB
	 n2rdBdeDLmKRcD/bNGGb/1g6Th/rQpsOy+1aPjYqG0EtBAHZ39DAVS1p/WTIG4TwD/
	 fCKhKyg8Kyr2w==
Date: Wed, 18 Jun 2025 22:24:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5 23/23] gpu: nova-core: load and run FWSEC-FRTS
Message-ID: <aFMgiYzDXwHXVn8X@cassiopeiae>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-23-14ba7eaf166b@nvidia.com>
 <aFMgLDfNKWPsSoD1@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFMgLDfNKWPsSoD1@cassiopeiae>

On Wed, Jun 18, 2025 at 10:23:15PM +0200, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 11:01:51PM +0900, Alexandre Courbot wrote:
> > @@ -237,6 +237,67 @@ pub(crate) fn new(
> >              },
> >          )?;
> >  
> > +        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
> > +        // reset.
> > +        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() != 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region already exists - GPU needs to be reset to proceed\n"
> > +            );
> > +            return Err(EBUSY);
> > +        }
> > +
> > +        // Reset falcon, load FWSEC-FRTS, and run it.
> > +        gsp_falcon
> > +            .reset(bar)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to reset GSP falcon: {:?}\n", e))?;
> > +        gsp_falcon
> > +            .dma_load(bar, &fwsec_frts)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to load FWSEC-FRTS: {:?}\n", e))?;
> > +        let (mbox0, _) = gsp_falcon
> > +            .boot(bar, Some(0), None)
> > +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to boot FWSEC-FRTS: {:?}\n", e))?;
> > +        if mbox0 != 0 {
> > +            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
> > +            return Err(EIO);
> > +        }
> > +
> > +        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
> > +        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
> > +        if frts_status != 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "FWSEC-FRTS returned with error code {:#x}",
> > +                frts_status
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        // Check the WPR2 has been created as we requested.
> > +        let (wpr2_lo, wpr2_hi) = (
> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u64) << 12,
> > +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u64) << 12,
> > +        );
> > +        if wpr2_hi == 0 {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region not created after running FWSEC-FRTS\n"
> > +            );
> > +
> > +            return Err(EIO);
> > +        } else if wpr2_lo != fb_layout.frts.start {
> > +            dev_err!(
> > +                pdev.as_ref(),
> > +                "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
> > +                wpr2_lo,
> > +                fb_layout.frts.start,
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
> > +        dev_dbg!(pdev.as_ref(), "GPU instance built\n");
> > +
> 
> This makes Gpu::new() quite messy, can we move this to a separate function
> please?

Actually, can't this just be a method of FwsecFirmware?
