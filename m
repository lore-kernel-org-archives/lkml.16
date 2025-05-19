Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1B19DFA2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747618767; cv=none; b=Qln58WCuKfV59tAzZ/SEMm6+PvVK+Tosggz1jYJ5OcfzGq58ENaF5qj6vxsHnkCSkxRXSPio3th3qr8jhn8g7ILTw0zgcfdZ6gy5DIfFvk7zMlNeoRVUFO9l2/8vY0VCelvlpa9HNWO7maWnH9LMIWjnnX8kSWgYJp3m1ESlir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747618767; c=relaxed/simple;
	bh=FqFnmQCiDMIe9susAfgCBgtwo2XNBCGc6p0CqxnwaNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=dupneZd/60op3MJzonLvfVZ29TB0NRcdzEZduViGO7bNxu1FzfE6i6oPXW7IGwaLZ1dfl2OvgbTbuNVfs9+gaUwhA/kW8Uw4Tyx2axPEEOkQiVWpySTXfywIlwQo+fME08hesreCPs/Bac+OfvxPQBXoDDdQcfiZ+KCmVMbfjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=f+oexBJ5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="f+oexBJ5"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250519013916epoutp01a6c3ac6ebaac3aa4b0289f6edd1e3d38~AygALa-Wd0269902699epoutp01q
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:39:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250519013916epoutp01a6c3ac6ebaac3aa4b0289f6edd1e3d38~AygALa-Wd0269902699epoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747618756;
	bh=koWRqPWdZXwVHGb5yKu339ufnZ++npqeF+rm45O/smw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f+oexBJ5fDg+Gy6K0uAqvYcY7jMJZ3gbF08KcXp1XMao2Q9Wo5l0iwEsVjir9C5gc
	 2Mx6HA0y15YESLIcGXQdJgplQYSOI5kCszvu1J5aqLx5IMdcfzsyo71cjiPUMGGQNH
	 CEEBdXij5hhUPlY1giZicdMLtzl9V+t9Fp+brrMk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250519013916epcas2p4d4821f3d2c10a852bf75350169dab786~Ayf-aGS5s1073510735epcas2p40;
	Mon, 19 May 2025 01:39:16 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4b10hz1BQJz2SSKf; Mon, 19 May
	2025 01:39:15 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250519013914epcas2p1b139e745f575c040a233f925e6de8a60~Ayf9ub2WA1477414774epcas2p1C;
	Mon, 19 May 2025 01:39:14 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250519013914epsmtrp2915b7f510757015efd50dc753794ae06~Ayf9tiJxG2446524465epsmtrp24;
	Mon, 19 May 2025 01:39:14 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-be-682a8bc2f774
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	1E.E9.19478.2CB8A286; Mon, 19 May 2025 10:39:14 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250519013914epsmtip25b92b45f76f47a4d5f2573c281c462ac~Ayf9dTLZP2276422764epsmtip2e;
	Mon, 19 May 2025 01:39:14 +0000 (GMT)
Date: Mon, 19 May 2025 10:43:49 +0900
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
Message-ID: <aCqM1Z2ApdvGYfb9@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <86frh4gazr.wl-maz@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsWy7bCSvO6hbq0Mg/5D3BbX9k5kt5j3Wdbi
	9YXfTBZN+y8xW5w/OJ3d4urud8wWEybvYbf43dTMajHh/WZGi02Pr7FaXN41h83i2rWn7BY7
	55xktTizaRuLxeZNU5kt2n++ZrFYfOATu4Ogx4JNpR6bVnWyedy5tofN4925c+wem5fUe/Rt
	WcXo8XmTXAB7FJdNSmpOZllqkb5dAlfG2WOvmQuuiVVs3LODuYHxtWAXIyeHhICJxIGvx1m7
	GLk4hAS2M0rMmv2PESIhI3F75WVWCFtY4n7LEaii+4wSV47PBStiEVCVePb/GwuIzSagK7Ht
	BESziICixKcLJxlBGpgFbjJLHO87xgySEBYolTiy7QoTiM0roCzxZ/9rqKkzGCUeX17BApEQ
	lDg58wmYzSygLvFn3iWgZg4gW1pi+T8OiLC8RPPW2WAzOQW0Jd68OMg0gVFwFpLuWUi6ZyF0
	z0LSvYCRZRWjaGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcCRqBe1gXLb+r94hRiYOxkOMEhzM
	SiK8qzZrZAjxpiRWVqUW5ccXleakFh9ilOZgURLnVc7pTBESSE8sSc1OTS1ILYLJMnFwSjUw
	MaQb3QuVZt06U8LEY23k/J1NGQ85Ug42fFozs/bQhllf/i7M9p28JbixfCmL7YVvTkKqH7Ry
	ry+4aeN+1G36QY3PUgG/0recTLQ52qbfmR7Ju8XQ6HDE3oI1MX9enJRn/tRzOETdo9mt9/rP
	qG3eHHfEipq2dO/Xe5jeXvZkyd8L1dcVN1yI2ld8usg05W+j6OSqP5WZYa1yhutcTit9EnSS
	eL2Ff8f/s0eCpFqETizNkbx1hCfyYlPTfhO2ws8CZs+Dsxj2FDoIX+N/Xbe129b02m7jYA5T
	563fqgMfOPVuVbG7FCf4uTpbv8U2jjWuKu4J577HDy9WeSW0+byb8OTJn4S3dlM/uAtIi6co
	sRRnJBpqMRcVJwIAS6BOmzMDAAA=
X-CMS-MailID: 20250519013914epcas2p1b139e745f575c040a233f925e6de8a60
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----hAAegp6m8E3i.QLmwFPLLqEeSfDULVp1uZgKmo5w.8P._xnu=_6bc4c_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770
References: <CGME20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770@epcas2p2.samsung.com>
	<aCbhBttvi8mvsyGE@perf> <86frh4gazr.wl-maz@kernel.org>

------hAAegp6m8E3i.QLmwFPLLqEeSfDULVp1uZgKmo5w.8P._xnu=_6bc4c_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Fri, May 16, 2025 at 10:28:56AM +0100, Marc Zyngier wrote:
> On Fri, 16 May 2025 07:53:58 +0100,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > 
> > [1  <text/plain; utf-8 (8bit)>]
> > Hi arm arch timer experts,
> > 
> > While reviewing the arm_arch_timer code in Linux 6.12,
> > I noticed that the function arch_counter_register() restricts the
> > use of the physical counter (cntpct_el0) on systems where the kernel
> > is running in EL1, even if EL2 is supported and cntpct_el0 is
> > accessible.
> > 
> > In our case:
> > - We are not using pKVM.
> > - The kernel is booted in EL1.
> > - We disabled VIRT_PPI and explicitly selected PHYS_NONSECURE_PPI for the timer refering to below code.
> 
> That's not legal. The architecture guarantees that there is a virtual
> timer and a physical timer. No ifs, no buts.
> 
> [...]
> 
> > As I understand it, `is_hyp_mode_available()` checks whether the
> > kernel booted into EL2 — not whether EL2 is *supported* by the
> > hardware.
> > 
> > Therefore, even on systems where EL2 exists and `cntpct_el0` is
> > accessible from EL1, the kernel still forces the use of `cntvct_el0`
> > if the boot EL is EL1.
> 
> Yes, because it isn't architecturally valid to not have a virtual
> timer. This isn't about EL2 being present of not. The switch to the
> physical timer is purely an optimisation for KVM so that it doesn't
> have to switch the virtual timer back and forth when running a guest,
> as the virtual timer is the most likely used timer.
> 

Thanks for the clarification.

As a follow-up question:

We are working on a system that uses a vendor-specific hypervisor instead of KVM.
In this setup, we also want to optimize timer virtualization overhead and are considering using
the physical timer (CNTPT) in the host context for performance reasons, just like KVM does.

Would it be acceptable (from the upstream kernel's perspective) to make a similar switch
to the physical timer in this case ?

Or is this kind of optimization strictly tied to KVM's internal behavior
and not something the kernel is expected to support generically?

Any guidance or recommendation would be appreciated.

Best regards,
Youngmin

> > Is this restriction to `cntvct_el0` in EL1 an architectural
> > requirement, or simply a conservative default to avoid possible
> > traps on some systems?
> 
> Both. Crucially, it isn't possible to trap the virtual timer on some
> older implementations.
> 
> > If the hardware clearly supports EL2 and allows CNTPT access from
> > EL1, could this restriction be relaxed?
> 
> Absolutely not. Having the virtual timer is a hard requirement from
> both the architecture *and* Linux. Feel free to emulate it from EL2 if
> you want (and can trap it).
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

------hAAegp6m8E3i.QLmwFPLLqEeSfDULVp1uZgKmo5w.8P._xnu=_6bc4c_
Content-Type: text/plain; charset="utf-8"


------hAAegp6m8E3i.QLmwFPLLqEeSfDULVp1uZgKmo5w.8P._xnu=_6bc4c_--
