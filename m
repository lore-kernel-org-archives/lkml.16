Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9B32D9EDE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030866; cv=none; b=toZR6EU+op7hPUxl/OWxSf10Rpwzt54y/Ymzdylb6xoxR/PoluS62eGXYyuxw9VG+d+rUBSExwx2MeqxTZW5VpZFEfRDa3NhA8PKbsWCZa34hvyM/OWG4rSuvx0/9XE5JS6wqslW+/hBSj3bgfJM6Q7/TGIPGU2Qmma8p7nyJiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030866; c=relaxed/simple;
	bh=VMy2QYvZtXZt3bSoOwLnQuWz3ohhDDM7Vc57rhdFeog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkUX2lF/XGVFoPZSzsMc6B85Y2P0tRiuRusvtnHZGaKIgwhJrCL5Hw19hnYzK22TNcSI/iTbePIVAO7PmyhauDlCZOVXWzGmJsNtorHLAC9eUa+GudKTB1VZKJdRGGrPThl9RVx2DFen0XYdWUsvcTIWjGMZkTDyGicb9nweu8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=F2sGGhti; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NI6wyCok; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="F2sGGhti";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NI6wyCok"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A8FF31400052;
	Fri, 27 Jun 2025 09:27:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Jun 2025 09:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1751030862; x=
	1751117262; bh=/b4iuZGO2uIWibX0BVFmtq5puu53/x9osr3KMvrinfw=; b=F
	2sGGhti0sJo/1dRe8v1sjfMEvaHollSaRCoy89v6Y4YobZMrXYAyBnbVLfPKSDCA
	r3SMtQMu+qPj3ObPSq1ioQTGvAMbSEGER/iOdvS4iQsTBXjU92pBC3BE3YWuxJK2
	Fkcy/FPZjEGUTj7idf47N8Z4ETdKwXX82BWoV19ewVbTs7tZ9KtSodKv+s3qBrd6
	PmNAaGPK2PPwGPHOwNyS2QtmFqkZnO784uDTJ5eiq4S6K7RYagyiBSWGBylEAeAi
	ZTZMZEtDsTafcpbjWAqgiTnCygw2cDYc7L6cTwhRjUrBIuYpRI8uBhmWaDlXFYqk
	+ozl0Vn93WRcGHOSHTNHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751030862; x=1751117262; bh=/b4iuZGO2uIWibX0BVFmtq5puu53/x9osr3
	KMvrinfw=; b=NI6wyCok7BUwWgvJ36RuQG4tS017o4v6W21XC63019fDOkzStNU
	F7FZaFzeqQQP4z7xVJY7vFXpHM3n0wWzcBzUIcz90x7IjFCOissNL19fZEVELfnS
	LpsJK3JL30qkLExbeZMEZCgNBu7wNpqsBnaKU7ucsrjceAQroNP8B+3B4Hf713kZ
	xGdfTSzrd5l/WovXQzxH8udN8Ab+sVv2qvUX0/xAR85wwGy0UTCV6LCrrS+9EsTv
	CGGLq3tAEvHk+odR6pmbQVOSHHj5SQSJmjeH2SThRyOkDy4iyEwzksS0JA8Rk8T5
	sgOj9qnCzbz5yTIl8xVSWN7UmXeSmOq4zUA==
X-ME-Sender: <xms:TZxeaDwYAgHyy4ZR7dluWKBO3Vjo3zEgeOgJix8dfCjf2moLeu00GA>
    <xme:TZxeaLRV8PYObThkDin5KyU-AonibZnqXiUziykNUrXUzOtYdmz5V2O3HzlEK-aSQ
    -gnj-g8BRdWejKvbfE>
X-ME-Received: <xmr:TZxeaNWNpCKHDMrNvlcwsaTiCjG810YGN2fHnB4gdQ8k7f_furE4W1Q2s3s93Pf1DmsL4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepfdfmihhrihhllhcu
    tedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvqe
    enucggtffrrghtthgvrhhnpeffvdevueetudfhhfffveelhfetfeevveekleevjeduudev
    vdduvdelteduvefhkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthht
    ohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrihgvlhesshhurhhrih
    gvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqthgvrghmsehmvghtrgdrtghomh
    dprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
    pdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvg
    hriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsphesrghlihgvnhekrdgu
    vgdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrggurg
    hvrdgrmhhithesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:TZxeaNgtvVIm2zgCajRBHuh9fYB3wLrcr41ym4mTpWYM1Oii1mIvdA>
    <xmx:TZxeaFBZIAERDDpnc4vel2juOSoul2uJfN-coYRHeCft2y59aCwT2g>
    <xmx:TZxeaGKDqsEhpi9ejJVoNQd-qGkut-g3gARcT--RUqfvKTSMFHC-Wg>
    <xmx:TZxeaECOmTRaQaLcimjitifDyzyerk9im8xOwxBFzYuPwl5kdK1VWA>
    <xmx:TpxeaNc1maR6rhlEKHLD6Gn_daT06FkBBLObToJmSlmVL9h58p6-CZ1C>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 09:27:37 -0400 (EDT)
Date: Fri, 27 Jun 2025 16:27:33 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, bp@alien8.de, 
	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com, tglx@linutronix.de, 
	mingo@kernel.org, Rik van Riel <riel@fb.com>
Subject: Re: [RFC PATCH v4 6/8] x86/mm: use RAR for kernel TLB flushes
Message-ID: <um6emftj5lmto2ivddovvxl7lz4uvwduuwq725a3n7qykepmtc@cq6y4yez2hcv>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-7-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200442.1694583-7-riel@surriel.com>

On Thu, Jun 19, 2025 at 04:03:58PM -0400, Rik van Riel wrote:
> From: Rik van Riel <riel@fb.com>
> 
> Use Intel RAR for kernel TLB flushes, when enabled.
> 
> Pass in PCID 0 to smp_call_rar_many() to flush the specified addresses,
> regardless of which PCID they might be cached under in any destination CPU.
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/mm/tlb.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 39f80111e6f1..8931f7029d6c 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -21,6 +21,7 @@
>  #include <asm/apic.h>
>  #include <asm/msr.h>
>  #include <asm/perf_event.h>
> +#include <asm/rar.h>
>  #include <asm/tlb.h>
>  
>  #include "mm_internal.h"
> @@ -1468,6 +1469,18 @@ static void do_flush_tlb_all(void *info)
>  	__flush_tlb_all();
>  }
>  
> +static void rar_full_flush(const cpumask_t *cpumask)
> +{
> +	guard(preempt)();
> +	smp_call_rar_many(cpumask, 0, 0, TLB_FLUSH_ALL);
> +	invpcid_flush_all();

I don't follow why do we need to call invpcid_flush_all() here in addition
to smp_call_rar_many(). Hm?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
