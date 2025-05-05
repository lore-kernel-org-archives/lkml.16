Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F3202C2A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446139; cv=none; b=nKbO9hiqaupFUW/rEdSAMAy5GfQUZkbDs54YnDYswrXayElk9wSgj6MgAHLbluS4C9zkZ4i+p+tCAGfeQf+C+IdbDNHylrur0uPup3vuW2VQMBhtOWoUKhn2mE8izDSDugqSLFteoGaCvNnFieb/QBzmKXeoIqkQoRYKj3okuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446139; c=relaxed/simple;
	bh=6uoCACOJmSSw6VHJQISiuU+PUgQL9wG4lTf2kczMtmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH2VN/Qu7VN7vEiqSURC9r9A2UpHDHsfdQc48ElvwvTKv+IQBMy1y8H0npkB2cwXvEwtj6rRO1JQkTRfdMV2J/W5aRugCsk9kDtIXE24PRmQWfXXdG5l8iyAbrrr7TftTMPGDK6Zv2A909yhUu527FDJc1tZK6eIF5gxF8YJ5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=viN8Btuu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wgzuWNmY; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="viN8Btuu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wgzuWNmY"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 90C451140229;
	Mon,  5 May 2025 07:55:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 05 May 2025 07:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1746446135; x=
	1746532535; bh=cpefqjd9BmW4xiENnelui4ByDFsbGuS3PDARfVv6UrU=; b=v
	iN8BtuuOHu4o63S1cPg0/4GqtOSXI6iz5YySbtZZ9AF3o0bvfCPxPldiJ/a30IBe
	3/EYG8etcf97LtY1jjYP9JiGxvZqRVNPiVkd20xsLy63oSVOYIzI/MjckoyqioJB
	+BMbCaghl7AOG4zezUbK7plE6tATzf5qm6WxEUm3ybywWqAgebJUIneirQp5ZfL8
	NsNjlAqfFGcf9o0Ma6Tr4/BHV370N2+YkGyb3ygjw7rl4qglFLL2LU0mcDsHl8xH
	ea2WGhisnoT/qRlNW+KlTLULAUsFLp1HeWVEdTV2XGCcnWfowp7iQiDhE1IaSOQZ
	JALF/wFhC3EkitJ5mnzmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746446135; x=1746532535; bh=cpefqjd9BmW4xiENnelui4ByDFsbGuS3PDA
	RfVv6UrU=; b=wgzuWNmYItoeF6fSYHVmNe8jVbgcgT1oFTLmk4K9R5v/9usOoX/
	hGaVmjTQKo3FLSCtBlYl3mMaq6skdVJiBP96gntVC4Gcx961+B9ygGrCTqztCint
	KCMg0tTUN1i6xp7TJJCyJyXt59bwd8pRQBUZCrSO5tj8u4dyCSSVPoqonJk53vFV
	Se1Te0mEKaZf8zsnXwXUWmT5pLXMw6Mv8y+HWhiu3H4n+IYY0MxGlMtlbUFXvwOG
	AfKakaagehe4bpU6WZVLLqm23JWhvClbStY/VJSUwxE9nv6+y4pP0auvPGPkAOTz
	ulT6UR/akxARKmAi2gSrk+2GsxpinJicKBw==
X-ME-Sender: <xms:NacYaHVtiXttb3i48m4BsioioEup-GmV11tN-P886iXxL4HcRrzYFQ>
    <xme:NacYaPnUrLcBrN9eNg6pyaw0WNOsA7V1H9OGljkHH1ClDOWSQ1KHSoRLlUmGdJ3i3
    XQiw8OyseMRBZ-BzWE>
X-ME-Received: <xmr:NacYaDa82raBKCFtk5O86NSfjf_gT0Sl-b5oQD7jN0dZT-Zz-oqymtgUSXeBcVOKOyzRIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedutdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhphgrse
    iihihtohhrrdgtohhmpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:NacYaCUT5vr238cRD8ClSP-mthCZ_h0s4FiyVXM0Hz5MWjFRvi62-w>
    <xmx:NacYaBkpiYGrkuRcG2imEC8ur1ZQ-tb1QHcNltfarGijKlJjcknFkw>
    <xmx:NacYaPeRRXSI-noQ7odSTD70y5YOhktUn1StgQh0M7ZN97mn1L22bQ>
    <xmx:NacYaLGhFDdqUqMnbS1-vsP41RvoOhwT6sIe2Wwz8uJa5iPk-yAKFw>
    <xmx:N6cYaBvKiYUOpYf9czh-Suw3FEHoj2yKJc1OH1iyGYo_TyRfAVff3D1->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 May 2025 07:55:27 -0400 (EDT)
Date: Mon, 5 May 2025 14:55:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, 
	Elena Reshetova <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Juergen Gross <jgross@suse.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN and Intel TDX
Message-ID: <hgqvq2z5ruxtrbtoeddnnxme5krbg27ski3lq7olqybsf5vdig@jdrw4dpk5wfu>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-10-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505110946.1095363-10-mingo@kernel.org>

On Mon, May 05, 2025 at 01:09:40PM +0200, Ingo Molnar wrote:
> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, refresh all the virtualization
> guest Kconfig features, enabling paravirt spinlocks, and
> enabling the guest support code for the following guests:
> 
>  - Xen
>  - Xen_PVH
>  - Jailhouse
>  - ACRN
>  - Intel TDX
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Fei Li <fei1.li@intel.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
