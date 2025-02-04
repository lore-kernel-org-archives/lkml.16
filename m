Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133342163A6;
	Tue,  4 Feb 2025 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694792; cv=none; b=M1Gi26NEBRgsVj9voeV0q+SHSeTLVLc0xZpyV2XW6/LnjkvEaPjhagGTTucd7f7O6GtFqvuu8TTRX+/0Mw1wJFEii5NivRiR2mNqgIEKzvsgdjXmPr/C0c4kBuGqY0j06BTX9Mv3XHqJB931bgDuQHF1A8gUJenLQmUDFw38r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694792; c=relaxed/simple;
	bh=pL6LpTgYSVbLGUfW4heiYQ/ikhNIMZk1WKQPE8VKxIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdfnAY0+HnJwrtkCV7zZmt8hWSIRlokPgj8C0+BZxMTQu/sii8wWUDNgx9JgFwKMZwBJc3A8jnl4D8/XgMBV//fxAkFkof2o2uoqxPXDj0kD57W7187RTvq+QwToSxRzB2QSgH8mrG8NQCc87J2VcBMfjXr5caxpSMvJqPyuZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9QYtU32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9QYtU32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578BCC4CEDF;
	Tue,  4 Feb 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738694791;
	bh=pL6LpTgYSVbLGUfW4heiYQ/ikhNIMZk1WKQPE8VKxIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9QYtU32h4vgHedQJzby3d3GuU3j3r0Cv7pzZSWUuxzrWMBIt6FxSZZ7HlNH7kqrh
	 ZNC2GaMGW42gyg9O+126vptKPHrEGrZ29jOdwTiN3MAC7JycGkoahhO4I08aX9N8Pd
	 RT2WC0YNVPaD2cAC0IGrzUx/cZsAXvYc0lpLpXBHejrxZbMn+lluASYxLdXk1vVof9
	 WXPw+tQbV1d8CjzYlrLwCboaU4+BfBd16pDXu1mQR9hWWna5sPXlx6edK7+Q5Oueaq
	 JjU7p5Dcy9hvAHH0dBiVpy4PpCAQ5TagnFLJjOIgsalUy4f/obD0inAshERi55V5Nj
	 BF332P2DzbSIA==
Date: Tue, 4 Feb 2025 19:46:23 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
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
	rust-for-linux@vger.kernel.org, joelagnelf@nvidia.com
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z6Jgf-cVt_AlM6Qd@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203202410.GA3936980@joelbox2>

On Mon, Feb 03, 2025 at 03:24:10PM -0500, Joel Fernandes wrote:
> Hi Danilo,
> 
> On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > +#[pin_data]
> > +pub(crate) struct NovaCore {
> > +    #[pin]
> > +    pub(crate) gpu: Gpu,
> > +}
> 
> I am curious what is the need for pinning here in the patch in its current
> form, is it for future-proofing?

Yes, it is.

It's not always needed, but since I know that further down the road we'll need
at least a few mutexes, it seemed reasonable to already consider it.

> 
> I looked through the sample PCI driver example you had posted and did not see
> pinning there [1]. Thanks for the clarification.
> [1] https://lore.kernel.org/all/20241219170425.12036-12-dakr@kernel.org/
