Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129B1DDA1B;
	Tue, 22 Apr 2025 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321327; cv=none; b=HyMa9h2fraCsZe7087j4HV6I5QOrt625TWL6/JHjNUVQWS6LUYXAkkHmS139V+6pWjwNJ3BbUp7DVYRkBN+bf+sQTg5aWV5ABlIeIAE0xc40BsNV4BIc0sHEKgcg7OBaeIwF/C4ryVRuGH3DtHdwsSoLvwYyp3MekeWc8/5d200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321327; c=relaxed/simple;
	bh=sFzvrcLNuo2PkNb1OMUX1HpBmhZB3SGh1ZQhHJUtacI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVa8n+Dx+TC/CN3VPVD5YrbUU9z4q+R8Br02QzEY6V3xnmrRtEROU/8WBSxB6v0sCirwBR7LqFP6z1H+1Pk6vUpXTDPRBhAnvn7BZtpmuLRNgVIkXGtjBrGTbp4zSQkp3VB7kwluOwj/d9WTsmtHUpi3c4f4hrJcAe/gjTzbMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTpUjc9H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTpUjc9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD178C4CEE9;
	Tue, 22 Apr 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745321326;
	bh=sFzvrcLNuo2PkNb1OMUX1HpBmhZB3SGh1ZQhHJUtacI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTpUjc9H1QWj4hp6wPMZ8XNNWyzEfsUgBsdBWRqwo843W4B91lTmnPXkYv4n2qa+y
	 tm36inBgiE3pc4vrGO9l3D59slLXY7H6zYd+L/vDpuN7jq8DZa2fTr+5q6piRCeTNO
	 qXig1KcTCFbbcfDmwtEsHvYX3us/8wpYK1j8Eb2n8L7j/3ELRpLg+bpCKIWKXWX2zw
	 7Uvn4SRDuQIGZ9bt3xfbp1140pf0pXbggRDsLlrnzapXcVZmj6pGKVXtdn2Cfbfjxe
	 Vc0rf1bQdeLoIrTCLPkZEIKWSLwGcsJHLgyGWaWVa+67AEULSCeo6lDTQNh+23lFkj
	 Mmh8ZSGShaN1A==
Date: Tue, 22 Apr 2025 13:28:38 +0200
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
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aAd9ZlV5_qokiFYn@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
 <64d869aa-587f-49c6-8626-d2085441bb3b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64d869aa-587f-49c6-8626-d2085441bb3b@nvidia.com>

On Mon, Apr 21, 2025 at 05:45:33PM -0400, Joel Fernandes wrote:
> On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
> > diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/devinit.rs
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Methods for device initialization.
> 
> Let us clarify what devinit means.
> 
> devinit is a sequence of register read/writes after reset that performs tasks
> such as:
> 1. Programming VRAM memory controller timings.
> 2. Power sequencing.
> 3. Clock and PLL configuration.
> 4. Thermal management.
> 5. Performs VRAM memory scrubbing (ECC initialization) - on some GPUs, it scrubs
> only part of memory and then kicks of 'async scrubbing'.
> 
> devinit itself is a 'script' which is interpreted by the PMU microcontroller of
> of the GPU by an interpreter program.
> 
> Note that devinit also needs to run during suspend/resume at runtime.

Thanks for writing this up. I fully agree that those things have to be
documented.

> 
> I talked with Alex and I could add a new patch on top of this patch to add these
> clarifying 'doc' comments as well. I will commit them to my git branch and send
> on top of this as needed, but Alex can feel free to decide to squash them as well.

Fine with both, whatever you guys prefer.

> 
> > +
> > +use kernel::bindings;
> > +use kernel::devres::Devres;
> > +use kernel::prelude::*;
> > +
> > +use crate::driver::Bar0;
> > +use crate::regs;
> > +
> > +/// Wait for devinit FW completion.
> > +///
> > +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
> > +/// considered unusable until this step is completed, so it must be waited on very early during
> > +/// driver initialization.
> > +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
> 
> To reduce acronym soup, we can clarify gfw means 'GPU firmware', it is a broad
> term used for VBIOS ROM components several of which execute before the driver
> loads. Perhaps that part of comment can be 'the GPU firmware (gfw) code'.

Yes, we should absolutely explain acronyms as well as use consistent and defined
terminology when referring to things.

I think we should put both into Documentation/gpu/nova/ and add the
corresponding pointers in the code.

> I find this Rust convention for camel casing long constants very unreadable and
> troubling: Pgc6AonSecureScratchGroup05. I think we should relax this requirement
> for sake of readability. Could the Rust community / maintainers provide some input?
> 
> Apart from readability, it also makes searching for the same register name a
> nightmare with other code bases written in C.
> 
> Couple of ideas discussed:
> 
> 1. May be have a macro that converts
> REG(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK) ->
> regs::Pgc6AonSecureScratchGroup05 ?
> But not sure what it takes on the rust side to implement a macro like that.
> 
> 2. Adding doc comments both in regs.rs during defining the register, and
> possibly at the caller site. This still does address the issue fully.

If that addresses your concern, it sounds totally reasonable to me.
