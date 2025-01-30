Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047BA1E522;
	Thu, 30 Jan 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246967; cv=none; b=DQThIgonBDNRDiF5w1kdlp89nnvtRcFQk0am6OqlGXoa7Q4BZccI5QKGb/y6RiI9FsDM+LpCJGMgVc1tFpNZvzG3TVPMF3Pcvzv0vqpRW2s2n2rgvEoeI0PNOkGISVqkUE/y5yz8W3bBbTPhEN2t1Qy+Spe62MWZkfg9/KAKy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246967; c=relaxed/simple;
	bh=BzaA+L3AkoSgeI35XiFXPlmilMmMNoIl8rF6OWp33Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYG44F7rZiKULeO2HK9jZZhST2Gga3tBpd7crC0klh/aVE4dEX8IHcJL5F79xaMOc83tqRm6knsCmEKVfNpS7YB7o5qVKnSLrkdxBo5KLXrq3VNtVkQtTmSQPykZvGO59onLzOnrZqAOAA5kbiTz48xftVBXrIxtL67pgcsHlB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XmC540MW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XmC540MW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zBPwFHdewPI4agr5Oh0ubR+XXLYYmNdQxuFDAt/itGs=; b=XmC540MWIRUY45L1ZCKLWbQEFZ
	bFzbA57v/pSPALqI/QMDIzNsLcNmdbaK1Pw7benRStsfZ+yD89AllrhvD/9SSvYZLKwc/HEZap7H5
	Tmo/lLD6pflRJt8WceDAkoaBVdmiYQD+nyRDSzgntYutmfwHb1IDYBwlkL37uXMzFS1lzpeeed0/F
	8aZdMxv6lowImW7mKCVtHuMrQtgvtL8SrMOToNw+4KsytgZA6Unq1YwUnRDciVNwTa9y8RdYAINco
	DUkHdD5f2u4J/1SyNI31E1jbCNH49TJczCyNKDwfzveGbfDpHYm79SEfAtWr90iEO+L7Vq2kTwh2O
	aFiEUMsg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVRI-0000000DRjY-17hY;
	Thu, 30 Jan 2025 14:22:40 +0000
Date: Thu, 30 Jan 2025 14:22:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <Z5uLMC7J4KKjuax4@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>

On Thu, Jan 30, 2025 at 09:21:12AM +0100, Geert Uytterhoeven wrote:
> The long and obscure command line is a red herring: a simple
> "modprobe test_xarray" is all it takes...

That's all I've ever done.  I'm confused/annoyed by all this "let's
wrap everything up in some complex and obscure new thing" practice.

> > You should look at the userspace testing (that this broke) as it has
> > been really useful in certain scenarios.
> 
> BTW, how do I even build tools/testing/radix-tree?
> "make tools/help" doesn't show the radix-tree test.
> "make tools/all" doesn't seem to try to build it.
> Same for "make kselftest-all".

I've never heard of any of those things.  So I didn't try to make any of
them work.

> When trying the above, and ignoring failures due to missing packages
> on my host:
>   - there are several weird build errors,
>   - this doesn't play well with O=,
>   - lots of scary warnings when building for 32-bit,
>   - ...

Really?  Turns out I haven't built for 32-bit on this laptop, so I'm
installing all the packages I need now.  I seem to reemember it being
painful due to liburcu packaging not allowing me to install both a
32-bit and 64-bit package at the same time.

> At least the kunit tests build (and run[1] ;-) most of the time...

That's unworthy.  kunit isn't trying to do anything nearly as hard
as the radix tree tests are.

> [1] test_xarray started failing on m68k recently
>     https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

I really wish Andrew would stop merging xarray patches.
