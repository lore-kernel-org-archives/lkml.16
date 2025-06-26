Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E95224D6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944049; cv=none; b=DHFYxeKNVu8XzRarOy8GUd7z98jXBujmnEFcND5Yh7mK4jtd13FusHgdjCOedLa4nM7qSlGaz7BmAu796cEF0bFeO0AlRo5GEdDjoVjogHOa6viOOo81GVnQRkfznqwCPfvqZDgP/K8+ycLC1KQMWF27X0Jl3/BmrXIcyQj96Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944049; c=relaxed/simple;
	bh=AQJQCHmfuUOJ5fPV5xHd1/fpOqYyjo0Fjlog5uL2iyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beyahKOLSS2+5r+O6ugxZ1vt3IeQ2bi6eNVTUnhpkOQItBs4LWTE4v7OQMNY6iYiQyZ0zfzwL0Qe66lKaytvpO9UdaR6IX46E8SGKoQ0kqpuRMbCzxnICPNB3755+49stj4On7tavfiy8P/3WuBhQB/IIMWvJgFhbgYsm7EsPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=EQBJvIrT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e1v/rkGT; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="EQBJvIrT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e1v/rkGT"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 29C2D7A02E0;
	Thu, 26 Jun 2025 09:20:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 26 Jun 2025 09:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1750944046; x=
	1751030446; bh=o7umsiNhqXFeL9cqtTaaZvG0eglvA5cs8iHUgyy8KsE=; b=E
	QBJvIrT3Ano4Zp/e92gEZb/S7T232pFfTGV5kBBi7IkkIBGBVCopt+w7t23iMQxO
	t2BbRHkQHU+xlebaHVCcrnTnl2/4v/K0jrgDOC5sMSS/jqWlaGP6GTtfucRmkUrz
	u+CeEjDSQR3/Rrn5oEPb7n2+mFkP5zi+vI2iRNZtelaNjPTm6/VsEP5Mw/W/7vZv
	e1Vs1+ux/oFJ8U+yXZIdaCPvvixFgUndJk5bXXRJ6sGFYBCZ4+jTkYQGm82falYW
	EHcmVE7MlJ7TS7NE4f+Gmep0TAhBKu3QJvO7u4O+NVCZbA7PFi3t75sFpxkQlSKJ
	/aTHUvU4Eq9LYROXV6FSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750944046; x=1751030446; bh=o7umsiNhqXFeL9cqtTaaZvG0eglvA5cs8iH
	Ugyy8KsE=; b=e1v/rkGTMrxflNbFMg36gTsoXk1hzGdvxDtwIIOA4w2FqiaW7GC
	+ZCKysBGmDAocLtEa3RyaamrXW0pKA+mHKGirFeAmnzKlbRP3ewk8fgtv25qGtNB
	CK91HmEp6DHEAAJMOCaqKsGhrMP9pA76lpkDJXXGF0z3SnyOmM29vCbqJj9prOpS
	vP5bexjy8RMicCSWySpzhnaFtdKqUHEcXVFKxd8s+tcUhXizgvsMm9//T2DChj7S
	XkN8BNpGUCsYtK6t1mpm7Y+u6cr75Rr3/lEZrzpMp+t45dMOZtD/4cFxZXM8l9GN
	NxUAW4Eg9lj36grDeKUfaQD8T5jAzl/CdMg==
X-ME-Sender: <xms:LUldaKw8VA0EzEa31BfUjtqGoJcZUVgRdqP3HC7863j2g9oZcip8ig>
    <xme:LUldaGR55rlzL2wuXEJWGDMbhN2TDHVx3R81RwjH1BJT6DLfBqa_MYw4iySqV61pU
    9qAlNMJIXfhLAW69iA>
X-ME-Received: <xmr:LUldaMXfwc_VN8JRb7JSsBmRgXzsuqrWVSuanlqn-lmE1hW_kURRfAW9ryETxfv3SYPEYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvkecutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:LUldaAixFgkHYwajMj0iCUv_29KzCx0YumEKHsLduKVzvJHn3yu1XA>
    <xmx:LUldaMBUWqEuR2-mDTCImBgA3GwQyAlDi2kaNhEN6PtPLsfajo6xYw>
    <xmx:LUldaBIygf27w2miaGCBykkcLvtDTAgRIJm6DqtAaw3dbmUf5z2RFA>
    <xmx:LUldaDAPNDqLyWroCcBm9c8dKoyan5mcDF806dJXHL9iZ_bKj7aECQ>
    <xmx:LUldaK-EJl5bn5uWIzRTA278fmwCWk0uB1qTRHHR90rDPlAN7ZDrjzdU>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 09:20:40 -0400 (EDT)
Date: Thu, 26 Jun 2025 16:20:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, bp@alien8.de, 
	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com, tglx@linutronix.de, 
	mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC PATCH v4 4/8] x86/apic: Introduce Remote Action Request
 Operations
Message-ID: <mqeuxn4in7pscni5odii2qvzoils5ce3jdzvmp45w3bg462buj@4elenf2mxaro>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-5-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200442.1694583-5-riel@surriel.com>

On Thu, Jun 19, 2025 at 04:03:56PM -0400, Rik van Riel wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> RAR TLB flushing is started by sending a command to the APIC.
> This patch adds Remote Action Request commands.
> 
> Because RAR_VECTOR is hardcoded at 0xe0, POSTED_MSI_NOTIFICATION_VECTOR
> has to be lowered to 0xdf, reducing the number of available vectors by
> 13.
> 
> [riel: refactor after 6 years of changes, lower POSTED_MSI_NOTIFICATION_VECTOR]

But why? Because it is used as FIRST_SYSTEM_VECTOR?

> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/include/asm/apicdef.h     | 1 +
>  arch/x86/include/asm/irq_vectors.h | 7 ++++++-
>  arch/x86/include/asm/smp.h         | 1 +
>  arch/x86/kernel/apic/ipi.c         | 5 +++++
>  arch/x86/kernel/apic/local.h       | 3 +++
>  5 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
> index 094106b6a538..b152d45af91a 100644
> --- a/arch/x86/include/asm/apicdef.h
> +++ b/arch/x86/include/asm/apicdef.h
> @@ -92,6 +92,7 @@
>  #define		APIC_DM_LOWEST		0x00100
>  #define		APIC_DM_SMI		0x00200
>  #define		APIC_DM_REMRD		0x00300
> +#define		APIC_DM_RAR		0x00300

Hm. Do we conflict with APIC_DM_REMRD here?

>  #define		APIC_DM_NMI		0x00400
>  #define		APIC_DM_INIT		0x00500
>  #define		APIC_DM_STARTUP		0x00600

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
