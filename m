Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36892AD11
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943321; cv=none; b=YNxYDCfj/F3/EYTxhuwHbJbg0W1LFtbklDmrhmWsgrqh3ci28VPIJDMhv61SZqFpvd7K0hi3G9pMzaP5tPxr70/Nhvv5qbUAmSDidfxBXf6kRv/M74ZLLxNeYb2Aaf0uHUki6kADqyaxVKWlH0CaaqGgDVuf8S7cvffpXZSXrow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943321; c=relaxed/simple;
	bh=wz4cMmpq1EicNyKcRE7LUubrXH3iHzmxXirobDrt1o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edDG8tVCux+zgfjEgfXGlz0xAV+I5i+H4cFlwqAVI+AlyD+55GV6GUqkYHIi1kiCwedhVNCQStgNP7doGRmSWoJDe9HxJyjnuSRVd9r/pXrk9GHSuUWK3PTt/jQaKjKyZHotXIKh5JdlX+voavxZVX7FAR/9YuXzZJrgPryKk0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ZRxRqdrB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HKdu5GV1; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ZRxRqdrB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HKdu5GV1"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D59F1D00117;
	Thu, 26 Jun 2025 09:08:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 26 Jun 2025 09:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1750943316; x=
	1751029716; bh=GC6wCjzLugQpyX/JBZD8Gf0/3VKgEjS+1r1sT/9UcTQ=; b=Z
	RxRqdrBIzMFB/nfo2MICSgPW+I4748DUSsxFtYunsjIWxcEJXB4ea/SDFnsT1B6f
	xaRp0mFVOJH+93VWutLwanAHmJz+jOBRybt1CxbZSeTUxMNGT+6gg+5kOd1zzmGB
	NNO8N1YELC87DfmswBnlTZ0FLkbsinRh/k37TW0fOTpe3ZcW3/69o4+GbkU0Ang3
	0vSyLIckZ88FxovGg40EOqcg6mt58fLpG4tUZewILBs01G+/NwlwYfKmxJHJxdmm
	IC7lbnOLQ8TvaEvQR3EpURaxzLmbRXX1vEGLGFeep2TQnH8Xo76sX980XUUQtjFd
	ibPTb8FzMPQR6qjIaDaVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750943316; x=1751029716; bh=GC6wCjzLugQpyX/JBZD8Gf0/3VKgEjS+1r1
	sT/9UcTQ=; b=HKdu5GV1Ccx8ZvdYFKwW6wo9lsliMK/n85ZXJqILqq83lnsEJIm
	yxIi9ZCa7ue7is+ixbWXZGe8vQAxu14HUMm69fTXcFnR+/mMCL2iusaF8dBY8kRH
	QcCL1Sd7AWMRjXXwCNVF0dXQTPTY+N/NKTgPfg+RVde6Dkcx+yha4HRQn46i4ZwL
	I5Y/6JRCF1/8Znqc9er3LQ0yzanP5EYjr/d3zQVZoqaibiiO58rW47VUEZjtwDf7
	UEjqHRtYtXIjr34nQkC8gJeNeQSqJ/bJYCU26CF1b7++z7D3lfEIDzIk9YWOPDOM
	iIH608JpjyPvERdgDf8xu03Toq7YO9qVDOw==
X-ME-Sender: <xms:U0ZdaCElqvLsG6GYYzxmHOyVTFca7V3eSSQLptwK25GwznvpIkct5w>
    <xme:U0ZdaDWRL1Be1AqBMZlJwkR7nKCtXKFL1PM7KZKsGiSdcLXnNuRK8MM_t87VgOysb
    rIq8kxC6zgZ3eKXoLw>
X-ME-Received: <xmr:U0ZdaMLJ8qo2vCOSYYe5vkgaB9T_2_DSUWx7GoeVnivNHJRGMjyFAkLCOWC64UBZ-Zqr_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpedfmfhirhhilhhlucet
    rdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgeqne
    cuggftrfgrthhtvghrnhepffdvveeuteduhffhffevlefhteefveevkeelveejudduvedv
    uddvleetudevhfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhivghlsehsuhhrrhhivg
    hlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesmhgvthgrrdgtohhmpd
    hrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
    pdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgruggrvh
    drrghmihhtsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:U0ZdaMGfX2ruENJCB6xKynzG8EfXs1Jo8SrWy6Q87uPe1g8sgtVUsA>
    <xmx:U0ZdaIUvbhR5T-VZlP_VABC0tMNZXVq8GJjnNhf797wGllEW2eM4Og>
    <xmx:U0ZdaPNVHlc5ueEgzFNtfHvCz9CMwzU25_HkvBviBsD5UYB1OR2lkQ>
    <xmx:U0ZdaP17xME3nlU2y65wNuqk3QDtSx92oV85DMEtqdzlc4IzZ9kupw>
    <xmx:VEZdaLEs8OCX1bh_R8lm0mKwFIxCrHgV2X8qjDv6_D2qjFawrLkjEK80>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 09:08:30 -0400 (EDT)
Date: Thu, 26 Jun 2025 16:08:27 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, bp@alien8.de, 
	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com, tglx@linutronix.de, 
	mingo@kernel.org, Rik van Riel <riel@fb.com>
Subject: Re: [RFC PATCH v4 2/8] x86/mm: enable BROADCAST_TLB_FLUSH on Intel,
 too
Message-ID: <5otrbzjvvz7zvqtfdoulm455jj4ut5fzjmsfzjyjkljcc2jp2s@2ealtckhzxow>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-3-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200442.1694583-3-riel@surriel.com>

On Thu, Jun 19, 2025 at 04:03:54PM -0400, Rik van Riel wrote:
> From: Rik van Riel <riel@fb.com>
> 
> Much of the code for Intel RAR and AMD INVLPGB is shared.
> 
> Place both under the same config option.
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/Kconfig.cpu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
> index f928cf6e3252..ab763f69f54d 100644
> --- a/arch/x86/Kconfig.cpu
> +++ b/arch/x86/Kconfig.cpu
> @@ -360,7 +360,7 @@ menuconfig PROCESSOR_SELECT
>  
>  config BROADCAST_TLB_FLUSH
>  	def_bool y
> -	depends on CPU_SUP_AMD && 64BIT
> +	depends on (CPU_SUP_AMD || CPU_SUP_INTEL) && 64BIT && SMP

Maybe split it into few "depends on"?

	depends on 64BIT
	depends on SMP
	depends on CPU_SUP_AMD || CPU_SUP_INTEL

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
