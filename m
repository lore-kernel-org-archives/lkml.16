Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB5C268FE4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640964; cv=none; b=qg4pNfz6LhHA4yys9GZLo8Bx2YDO/emSliDvSDWzKCcaLmstnjhgC9a3TQa6StzNSe1RtFBtwKdrEze42wxpHtoLgFU8mlOw0VCMZOh88er9uoP/YZSO2UCm1CAmajTNY8x35wGcLZYFIs9B+4nXPK5iLqLaLtHuw1SJMTEpmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640964; c=relaxed/simple;
	bh=Eih7Jwr9aLKmMT/1FNkqR0A3T8ea2bOMDx9vVGUKU70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=N8MyH4oKX8zO403x4A5QcEtxW2SHKT19nxWyFMr1CZsZsly4/r/FKdf2uB7+++bQNvuq1qTqyttJbKHVDcYr/JOtTG3EE73sG4zi2EkWH9NuZT+kkjHS0ywkE2s8E9+vToKB9fIgJxQxIV2uBhwZ6djOW3Fur9MWKHaVNrdNrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HGjLiBkh; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HGjLiBkh"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250519074918epoutp037367354f7b27d5c47698441583fba3d8~A3jExsfIx2274322743epoutp03p
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:49:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250519074918epoutp037367354f7b27d5c47698441583fba3d8~A3jExsfIx2274322743epoutp03p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747640958;
	bh=4xDbXaFiXjjPLwOIeH7ETthFjn9WSJxyoSC/RyFK+8Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HGjLiBkhx2qWIdDqVjs5/5lu1pomw4YYWFgyp0DpHyGbNRySnUs0tU3t0nVZ835Ao
	 ls8kO8YYCB2oSJNNUKhxG7PBdgoX/6DYJZx+2nwreZ3VcZUKLehOXoX8RWXKVWv6u2
	 9qhi5PHhsnOHscribw3xdd6Ll3mPX834l0tW/Ero=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250519074917epcas2p43eae1add4550fa7a4091b7ebd6193509~A3jEGEBK80407704077epcas2p4R;
	Mon, 19 May 2025 07:49:17 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4b18vw4sTBz2SSKd; Mon, 19 May
	2025 07:49:16 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250519074915epcas2p4ee77d7320363e980b4af70d0dbe3e5d7~A3jCmhAbx0726107261epcas2p4z;
	Mon, 19 May 2025 07:49:15 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250519074915epsmtrp1048df9cbd92f1f2a2da77df17ae15a98~A3jClnqwX0631106311epsmtrp1o;
	Mon, 19 May 2025 07:49:15 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-99-682ae27b7482
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	58.68.07818.B72EA286; Mon, 19 May 2025 16:49:15 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250519074915epsmtip2f110c71e19f4b1c2f2b54bb8a846c8e2~A3jCU42SM1921019210epsmtip2j;
	Mon, 19 May 2025 07:49:15 +0000 (GMT)
Date: Mon, 19 May 2025 16:53:51 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, junhosj.choi@samsung.com,
	hajun.sung@samsung.com, joonki.min@samsung.com, d7271.choe@samsung.com,
	jkkkkk.choi@samsung.com, jt1217.kim@samsung.com, qperret@google.com,
	willdeacon@google.com, dhyun.cha@samsung.com, kn_hong.choi@samsung.com,
	mankyum.kim@samsung.com, Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [QUESTION] arch_counter_register() restricts CNTPT access when
 booted in EL1, even if EL2 is supported
Message-ID: <aCrjj1A8udt1UJLc@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <86y0utdqg7.wl-maz@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSvG71I60Mg65VRhbX9k5kt5j3Wdbi
	9YXfTBZN+y8xW5w/OJ3d4urud8wWEybvYbf43dTMajHh/WZGi02Pr7FaXN41h83i2rWn7BY7
	55xktTizaRuLxeZNU5kt2n++ZrFYfOATu4Ogx4JNpR6bVnWyedy5tofN4925c+wem5fUe/Rt
	WcXo8XmTXAB7FJdNSmpOZllqkb5dAldG9+2HrAUnZCtOP+lnbWD8INbFyMEhIWAi8a+JpYuR
	i0NIYDejxISbTaxdjJxAcRmJ2ysvQ9nCEvdbjrBCFN1nlOhdcIwdJMEioCrx/nITI4jNJqAr
	se3EPzBbREBR4tOFk4wgDcwCN5kljvcdYwZJCAuUShzZdoWpi5Gdg1dAWWKqBcTMy4wSf64u
	YQMp4RUQlDg58wkLiM0soC7xZ94lZpBDmQWkJZb/44AIy0s0b50NNpFTQFvi/ddTrBMYBWch
	6Z6FpHsWQvcsJN0LGFlWMUqmFhTnpucmGxYY5qWW6xUn5haX5qXrJefnbmIEx6KWxg7Gd9+a
	9A8xMnEwHmKU4GBWEuFdtVkjQ4g3JbGyKrUoP76oNCe1+BCjNAeLkjjvSsOIdCGB9MSS1OzU
	1ILUIpgsEwenVAOT7b0J//cej0qaWPbZ1Ktwyf4HIk7rFX69X/tiw9Y1xo73/KW9659KXF41
	qbxxdfmEpytdNvsJlr57NpPBct9Sy2Y/zb1bbblLzlxymlpycNH3Rr3KR9Hqcnediu/ETIrk
	674pdXfd/Z3i/DMYs58vVG42VPIrTDs4xS3opLSAYcQbM+sZwT0l6Tcmqk5pLG5p5FwvEbdF
	VdBGgL3ywAO7FqOrN63r5nxoqp4bsspYZ8Lm5TZPMkpc3ebflz11UHaTxwH/VMPYFyLvX3be
	Y9tXdj/ShDWjSi0wenPO0d2Lo19ZXFhjK+O7Yum7k81cd/YE3emYJHy5aqHcknUz10nk1Ho+
	vaF1sEO76OH67fJdSizFGYmGWsxFxYkABKOiUjQDAAA=
X-CMS-MailID: 20250519074915epcas2p4ee77d7320363e980b4af70d0dbe3e5d7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----oRxFN-IW6TEbmBusn.EXIiq7I5yRwYOXOizBgewo77BvK4Z6=_703b9_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770
References: <CGME20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770@epcas2p2.samsung.com>
	<aCbhBttvi8mvsyGE@perf> <86frh4gazr.wl-maz@kernel.org>
	<aCqM1Z2ApdvGYfb9@perf> <86y0utdqg7.wl-maz@kernel.org>

------oRxFN-IW6TEbmBusn.EXIiq7I5yRwYOXOizBgewo77BvK4Z6=_703b9_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Mon, May 19, 2025 at 08:12:24AM +0100, Marc Zyngier wrote:
> On Mon, 19 May 2025 02:43:49 +0100,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > 
> > [1  <text/plain; utf-8 (8bit)>]
> > On Fri, May 16, 2025 at 10:28:56AM +0100, Marc Zyngier wrote:
> > > On Fri, 16 May 2025 07:53:58 +0100,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > > 
> > > > [1  <text/plain; utf-8 (8bit)>]
> > > > Hi arm arch timer experts,
> > > > 
> > > > While reviewing the arm_arch_timer code in Linux 6.12,
> > > > I noticed that the function arch_counter_register() restricts the
> > > > use of the physical counter (cntpct_el0) on systems where the kernel
> > > > is running in EL1, even if EL2 is supported and cntpct_el0 is
> > > > accessible.
> > > > 
> > > > In our case:
> > > > - We are not using pKVM.
> > > > - The kernel is booted in EL1.
> > > > - We disabled VIRT_PPI and explicitly selected PHYS_NONSECURE_PPI for the timer refering to below code.
> > > 
> > > That's not legal. The architecture guarantees that there is a virtual
> > > timer and a physical timer. No ifs, no buts.
> > > 
> > > [...]
> > > 
> > > > As I understand it, `is_hyp_mode_available()` checks whether the
> > > > kernel booted into EL2 — not whether EL2 is *supported* by the
> > > > hardware.
> > > > 
> > > > Therefore, even on systems where EL2 exists and `cntpct_el0` is
> > > > accessible from EL1, the kernel still forces the use of `cntvct_el0`
> > > > if the boot EL is EL1.
> > > 
> > > Yes, because it isn't architecturally valid to not have a virtual
> > > timer. This isn't about EL2 being present of not. The switch to the
> > > physical timer is purely an optimisation for KVM so that it doesn't
> > > have to switch the virtual timer back and forth when running a guest,
> > > as the virtual timer is the most likely used timer.
> > > 
> > 
> > Thanks for the clarification.
> > 
> > As a follow-up question:
> > 
> > We are working on a system that uses a vendor-specific hypervisor instead of KVM.
> > In this setup, we also want to optimize timer virtualization overhead and are considering using
> > the physical timer (CNTPT) in the host context for performance reasons, just like KVM does.
> > 
> > Would it be acceptable (from the upstream kernel's perspective) to make a similar switch
> > to the physical timer in this case ?
> 
> No. Your hypervisor already has *two* private timers it can freely
> make use of (virtual and physical EL2 timers), and doesn't need to
> encroach on something that a guest (be it Linux or any other guest)
> relies on.
> 
> The alternative is to trap and emulate the EL1 timer for the guest so
> that it *appears* to be functional. But that's obviously bad from a
> performance perspective.
> 
> > Or is this kind of optimization strictly tied to KVM's internal behavior
> > and not something the kernel is expected to support generically?
> 
> It is purely Linux/KVM specific, and only works because we own both
> side of that equation, meaning we can enforce whatever is required to
> make the two work together. This obviously isn't possible with third
> party software. Look at it from a different point of view: how would
> you make this work with, say, Windows? or MacOS?
> 
> On the bright side, the architecture already gives you everything you
> need to implement your hypervisor. Just use it correctly.
> 
> Thanks,
> 
> 	M.

Hi Marc,

Thank you very much for the detailed explanation and your time.
Your clarification about the architectural intent and KVM-specific behavior
was really helpful and made things much clearer on our side.

Best regards,
Youngmin

> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

------oRxFN-IW6TEbmBusn.EXIiq7I5yRwYOXOizBgewo77BvK4Z6=_703b9_
Content-Type: text/plain; charset="utf-8"


------oRxFN-IW6TEbmBusn.EXIiq7I5yRwYOXOizBgewo77BvK4Z6=_703b9_--
