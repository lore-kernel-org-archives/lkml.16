Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66820F082
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864462; cv=none; b=m4LSzdV9d9yEd5WoEMObh5E5qvw5e5Lq2Mg3+Fzvq2GlVBiOJfftiluBkuE7L/Hj5Ydjf94sRlAd5k76G7f+4Uyfhz0RTVyHC4KlBQOdpMHRyANdmQZhi2MLm4OcFHh0y8viApmO+aLlXa7kbcFP3+oN7IdDgC6ZnTE7/igN/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864462; c=relaxed/simple;
	bh=U8K0uf4aWhhzfObYJoePKwQHyJj41+wsc7eB/15CdT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHeMnnaiYaoD0azu9hCARe+M+IqSaBJK5zH1MlLNgBSO0vnOQh13NoHZFFqKz/FYIdpfJc74jo2w2iHhhOKK5xASJn6qdbnVa8OaCT5NbZX6na5NvP1NseqZ3adkiA00dOqsPouS4r7kSOa/2kXOAWhPM9mqZeNn761r1FwQU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=W8l422xP; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W8l422xP"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2cca475546fso3472509fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748864459; x=1749469259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8K0uf4aWhhzfObYJoePKwQHyJj41+wsc7eB/15CdT4=;
        b=W8l422xPONQtWanqExljoiqYDcuuSKIujEdkeeOJis4HmKcTVzt0fdqvaUjHPxPzb6
         ovVADiWgVpkVr0xIGKWqCQvRYeHvUSka4R3UPQybh+jRwnxypLu940mxHbePZtpGxOIh
         Ae4O1VpiNigjaMxdAGh538eEwXsLCXgKrnU8TIUbXoO7x9rEJEV9APRXhEINitUpJhsB
         NpqIJoyVYvGEOxmK3JnoGNLOLnF32TAIY7r2+SrN2doAh5rbcIZ0uXyRszMSR905A3kc
         SgTxN/BmXz9KWkAZlUWWCO+hXyppdX8GgjHRDrgZhrCDgG5uNjBJIKYXPLcaG7Xfx5Qd
         CEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748864459; x=1749469259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8K0uf4aWhhzfObYJoePKwQHyJj41+wsc7eB/15CdT4=;
        b=nWwQ6sZfzk+4rusdt9PkN3nPpU8N5uwnPha02tnkPLIy3sV3Gp6ev1N4/7GJSpdrj0
         CpoispexIEa/v7Aq5VAIfF4qN4H4ne3RtFdVNqXIfNkjKUD5Qax6f78nvuPiK/GvCEJJ
         peWF5JfgmfnPkczt9JEmVjZ6QhCblISM0C7SESlxjVO117vdsyH2d3RzU1qgF/1L6Nb6
         hfoHW/xHGo2+GOhjtYi2i7YnnZaWPbytSkcIpjD/ukCvxUMCMSMmLPqk8GL9h7LJin2S
         h5FRllMVGlaXE8x9dFByeyuxQ3DscDeoR8NR6Yx4/sd1bCWHrYC38+8huW89wbWfogs7
         KpoA==
X-Forwarded-Encrypted: i=1; AJvYcCU0DJMA3DDbe7ULOO5yC3Dxaa89evRo8x7KTU0WqnE1yKnPqmCpy86kL0LrAWP982CAUq3rUgnXl2h+9vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3un5RShAe5PUvgoYfbH45WSTTRd+50U4OACLciVWt2hpcIeN
	az+ukKLhfRloY4jPy4T4Op+hCBT8wS4usrSs12tFZIPow/bi0Kb8VOxKww0nHUFayDrubhEQWh4
	xDasp
X-Gm-Gg: ASbGncuw0wCVbdCEKWw4fmFMLbgXliM2aLRxoRnwsz5jUYSuT6Vq9JASUbcf5FglJXH
	BCR1Sigpdxn5LhbOZYk5nizeK+ABi4hWrfe1YhLY4l01KflM1s1Hr44Tg5ur1IwtJNiZbsCpm5I
	viHMluPOWgftiYGKr5Ksw4PK9aurCNOjFeYE5mq6cWAqg6AC2yk8VXFrqVTpngvLTpfunI2cd9U
	yrJgp/sjyPoN62vvS/M0Yh+/cQh2v4fgVM2R8HyLuKDo8zwlLFJY/ONAzPvaS+yvJmgo1xnTvVz
	4qAJbJx5lW9gvJOxohnNjhPe1ffNenWby0gvfLdeyRs1qEXCx8T4gFyVmmD5K3trIaZSk+HgHNT
	w/ludDOrX9DT+3xZHRF6kJU9fAuw=
X-Google-Smtp-Source: AGHT+IGfF18ffm8VzY6ByMTGaYLJNsId5S1P2oW9/h5gR4uH/hdOQWknfp/QYUyMCIClWhNY/nUI7w==
X-Received: by 2002:a05:6214:248d:b0:6e8:f166:b19c with SMTP id 6a1803df08f44-6faced23964mr189368276d6.41.1748864448996;
        Mon, 02 Jun 2025 04:40:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d498sm60065976d6.27.2025.06.02.04.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 04:40:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uM3X5-00000001XQw-1BjZ;
	Mon, 02 Jun 2025 08:40:47 -0300
Date: Mon, 2 Jun 2025 08:40:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250602114047.GA298147@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <20250530141419.GA292183@ziepe.ca>
 <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>
 <20250530145026.GB293473@ziepe.ca>
 <DAAD0NZOCHS5.9FTVJIOI12QI@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAAD0NZOCHS5.9FTVJIOI12QI@nvidia.com>

On Sat, May 31, 2025 at 09:54:20PM +0900, Alexandre Courbot wrote:

> So if I understood your idea correctly, this would mean creating the
> SGTable and mapping it in one call, eschewing the typestate entirely?

Probably no need for a type state

> And the `SGTable` would own the backing data, and only release it upon
> destruction and unmapping?

But I don't think you can do this, it is not allowed to pin kmalloc
memory for instance so you have to do something as you showed to tie
the lifetime to the kmalloc across the sgtable lifetime.

Jason
