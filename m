Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD051D63EF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824335; cv=none; b=ROSIEEaTM/CBQvwHQMlTsQCxsQ/9IwZyqcCfT0kfhhxxT7d4SAgQmrXpvnS+43ngeX/nmbmAR0aCi9hzYk73eo2sbp09uPccDOxFZxWRlIxtftLU5Y0dCJtz0y0+UxWuBNPtp7QhQx5+vQh1cXYIqQVGpUjaRnd8UjI9kVd7AuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824335; c=relaxed/simple;
	bh=ONtMThxFbBwVCi30entgfeXh+UW8TJopEVQWJ8uTSR8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=oyfS0hLBhsSXjAq9sD+dZeZ3rP70BSlRqOonVdV4zF9rTAd/5FR3HVKOgSYgatmG1Rg4NYK8mcy6rKxEX7wlF9xMydFCsPKMU6o57UvydNafGRRUiHDn0sfFHcG6iYFM5lcemFnbCE/PXsL+Ynjmig+6xizMAGfAJZWJjdTVlS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g/yqmF+F; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g/yqmF+F"
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428071203epoutp02f043d8958cef30fb622c3e5388be8639~6afkG8jRp0388703887epoutp02G
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:12:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428071203epoutp02f043d8958cef30fb622c3e5388be8639~6afkG8jRp0388703887epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745824323;
	bh=Rm+sbkuyIl5Y+bos9mHKqEPinYnP6asBDkPxQIs9z0M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=g/yqmF+FCo0GpJmO9FQ9QqGTfJwu1mv5lFSFv+MCnWocQQcSf0xZGSv2FjdY4XpT0
	 K2VjMbK7EmWEz+9miHBvif2kgpRWDSmJ26ZIatGSKAM27+M8oWrb4p4Z+y8SXT5ug4
	 DszhQyykbKrhynpFa4eyFlslyyRKeyKAZdz9G9B4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
	20250428071203epcas1p2c57fb9dece55294359470c95b17bccfd~6afjYt4b90886408864epcas1p2b;
	Mon, 28 Apr 2025 07:12:03 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.36.222]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZmF4d1H7Zz6B9mF; Mon, 28 Apr
	2025 07:12:01 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428071200epcas1p385b2c91ccece320d8e3b1f3105169c14~6afhAgwcz2655326553epcas1p32;
	Mon, 28 Apr 2025 07:12:00 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428071200epsmtrp20acad91f45caad152db194cdceb05064~6afg-pCDC1908819088epsmtrp2X;
	Mon, 28 Apr 2025 07:12:00 +0000 (GMT)
X-AuditID: b6c32a52-f0cb424000004c16-07-680f2a407cc5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.C4.19478.04A2F086; Mon, 28 Apr 2025 16:12:00 +0900 (KST)
Received: from sgsupark03 (unknown [10.246.147.33]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250428071200epsmtip213219b61ffca80641e815ff54fd5aefd~6afg0CLli1354113541epsmtip2I;
	Mon, 28 Apr 2025 07:12:00 +0000 (GMT)
From: "Seongsu Park" <sgsu.park@samsung.com>
To: "'Anshuman Khandual'" <anshuman.khandual@arm.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <suzuki.poulose@arm.com>, <joey.gouly@arm.com>,
	<oliver.upton@linux.dev>, <maz@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <cpgs@samsung.com>
In-Reply-To: <f998cbba-bda0-472b-8f4a-a972a29f21ef@arm.com>
Subject: RE: [PATCH] arm64: kvm: Replace ternary flags with str_on_off()
 helper
Date: Mon, 28 Apr 2025 16:11:59 +0900
Message-ID: <0fd501dbb80c$d5a91d30$80fb5790$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKwPNvFjEbOOPYz+nksCQ06Lg5v7wJYV8DmAgJ6uJCx7MjvUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSvK6DFn+GwZoV0hb7TiRbvF/Ww2jx
	8pCmxZfmNiaLV1sOs1hsenyN1eLyrjlsFjvnnGS1mPrzDZvFzNu3GS1a7pg6cHusmbeG0WPT
	qk42j4UNU5k9Ni+p93ixeSajR9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGV863jDXHCUu2LK
	m3ssDYw/OboYOTkkBEwkHq65xtjFyMUhJLCdUaLx6EcmiISkRPu7yyxdjBxAtrDE4cPFEDXP
	GCWuTt7LClLDJqAj8e3bFBYQW0TgNKNER78xSD2zQJ3EqjVFEPWHGSW6D74Gq+cUsJb41jyb
	GcQWFvCX2LhxK1gvi4CqxNevO8D28gpYSmzaepcRwhaUODnzCVgNs4C2xNObT6FseYntb+cw
	Q9ypIPHz6TJWiBucJKYe3cIOUSMiMbuzjXkCo/AsJKNmIRk1C8moWUhaFjCyrGIUTS0ozk3P
	TS4w1CtOzC0uzUvXS87P3cQIjjytoB2My9b/1TvEyMTBeIhRgoNZSYR3qTV3hhBvSmJlVWpR
	fnxRaU5q8SFGaQ4WJXFe5ZzOFCGB9MSS1OzU1ILUIpgsEwenVAMTl7/+h4MF/o/PH3X6sPTq
	PlPLJR+Np+/RyQuV/8uo9mjOYRs1j2N+IeLBlxZ6H/PYlPik5ltjz93KU7qf/5+/f0L43O2j
	/XZ3k66kx3u+O/dnuYxvA6/lsz+N3xZ5nXqxujdopmiy+MrPX+KebomPtoqbZaX+6eejF2zX
	avo0S01luEQ4eJ+G3fmdx7sqSGTF/YhFWTrfz6t+2ntgPnffk1SOfx4zE4q6vvsprf1tNvXN
	+cbJvW1N7vM3XjVLf1DUOlen/eZ+B9P5efn9p/gsf//rOvC2b/30FrfPa5qfTPjGMLc96H/k
	b67iE4IKngfal1+Wr1tx6EOE3Om47bZFE3/qLyjgM9NOn+emU95epsRSnJFoqMVcVJwIAMJw
	QRQrAwAA
X-CMS-MailID: 20250428071200epcas1p385b2c91ccece320d8e3b1f3105169c14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c
References: <CGME20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c@epcas1p4.samsung.com>
	<1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
	<f998cbba-bda0-472b-8f4a-a972a29f21ef@arm.com>



> On 4/15/25 06:54, Seongsu Park wrote:
> > Replace repetitive ternary expressions with the str_on_off() helper
> > function. This change improves code readability and ensures
> > consistency in tracepoint string formatting
> >
> > Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
> > ---
> >  arch/arm64/kvm/trace_arm.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
> > index c18c1a95831e..9c60f6465c78 100644
> > --- a/arch/arm64/kvm/trace_arm.h
> > +++ b/arch/arm64/kvm/trace_arm.h
> > @@ -176,7 +176,7 @@ TRACE_EVENT(kvm_set_way_flush,
> >  	    ),
> >
> >  	    TP_printk("S/W flush at 0x%016lx (cache %s)",
> > -		      __entry->vcpu_pc, __entry->cache ? "on" : "off")
> > +		      __entry->vcpu_pc, str_on_off(__entry->cache))
> >  );
> >
> >  TRACE_EVENT(kvm_toggle_cache,
> > @@ -196,8 +196,8 @@ TRACE_EVENT(kvm_toggle_cache,
> >  	    ),
> >
> >  	    TP_printk("VM op at 0x%016lx (cache was %s, now %s)",
> > -		      __entry->vcpu_pc, __entry->was ? "on" : "off",
> > -		      __entry->now ? "on" : "off")
> > +		      __entry->vcpu_pc, str_on_off(__entry->was),
> > +		      str_on_off(__entry->now))
> >  );
> >
> >  /*
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Dear Anshuman,

Do you have any feedback?
If you have, please let me know.
I think this patch is appropriate.

Thanks.
Seongsu Park.

