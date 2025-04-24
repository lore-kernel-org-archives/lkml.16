Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9BF27B517
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499592; cv=none; b=OwEDiTkVA+tVICfPOoILXq/v9EkMm7lW6hjEvcSLZEqMhAVBxhD1rspnWt6l51w8o/aITs4+R5i9hbAJvQZn/rB1BrBtAEqgFfp9WMPToE0MEqk6lA+wnFDEOaFH1KjblVlgkOQ9Iy6Y/lUoLPh9Fn9exGc6v6Zu140izgE0HVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499592; c=relaxed/simple;
	bh=LgOj32ZR2p1Cbcje8X1KxFsR/LzGtQoiCDWTf+/EkPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kk+vElbFOIBueGBvziD2PPtcvuTLsmnSQ0Mh6eRL2fbulShSUVhStE2irpdGhpDLaBvDFgm62LVEHvMJiWwJNLjH9bPqh0ztfQAkBT+G+crBNpYNTNmem1qBIfqn/KnxjYjwwIQ7Ru+Vhj9DolxEdUg56p5aQtJAI3LKEZ+8sOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Ubxf29LP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Ubxf29LP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so9699495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499588; x=1746104388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq4MolfPNd+K5bSXscDIAMqQ5BwEg88636RxK2hmqJg=;
        b=Ubxf29LPg56+SuNDmTNIM7CqasNp8TvS65zZ5/oqSkKEi35gNq8tdC8VCq2glypxmd
         anJIMVX0qkj8JNXxVOtvv9DoJFOFObWDkfIklQ1XLmtCzWAOGzY4n+sNH3J0/IbSOf8B
         rccyIqlQTOssIsqDWR36Xw41P/AFw8DtFqmIiG8kk74Z0mzZkTIdIxwH1O/uysHgnSiv
         YNi1WWiMuVX4FE5oJWQePbO8+XHxwik9hn6SvPudtN1ih+RaKmLDttL9TPoEs8mRNqXW
         GOghE80joL3RPi5dKD6vYi49SxZC/hmF6tcAcFNjhR+3HxbefyC6PI28yFesIPXMKmhc
         2bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499588; x=1746104388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq4MolfPNd+K5bSXscDIAMqQ5BwEg88636RxK2hmqJg=;
        b=ao2zEboukAVQOJHAVcc4qPlb5TT7dFDOuaJw2zF6MbGGWyAm8mU2azeFGgyK0cQbW8
         uGySOmX0acu6ey+6tdzA0RrheJb2I9noU4hLDz6ry/dtomQ3dbax+oEKcKBQ+0UWemK9
         xvve49r2eiUDJgSGBEw2OROKaDOERqexgW56v4G9s44kO993ecb5BHISH2jKmDZTIRuM
         awwe7NaG3apmRwQ03JJeMKCa5SuSaMLEcHZ/GoRXdow7YQ0eVTgtqCGryxtlGQTN3y2C
         1v2PZc/YkukuIkjk2KtotocNy55GJ/G3ID+iPlTf++TVymlL09NSBxoZZPApjZiR6Ms8
         H+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUkyGy5FCxnGZwM2e3/86YWJKDiMrjLnCI2WaOP5vtT7PTCbQ+IP+27QHd+s5k0R4mM/WKpIIOQ1XXGA+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3MIlqHNPDOQHgDExkRtj4RKmrONjq8ejptezUzrAqQ9VOaFm
	NLG3BdwU2cMNeKbvgeFZ91aQ+77rsaWyBgVubpfSHBTo8ksk4U7PXDjdd/DloXA=
X-Gm-Gg: ASbGncuWf297w3zbboeeN0sRAegak7Eh7xjjfsPE0PFsCVTC4gjO1kS/NPTA8ymYTG1
	cP4LjSDXOHFwWIZ+Baa8YWcmNaJjJqr+DXqQpnXmoYD8J1sGJZyttjJSpxxBffUGZSrPYBnHJqu
	dDCKrFYS2Bhqr9LicrYHGV0+pSdo4yZt62bXvkoH0uCJXbC1K92yg6bWcDR2pIbbgWa1/HIQOeT
	NcyZHdgSBeGh5DPI1YphPMtvCIN+KvPoZq3r9XuiTBYFuCxBq/HEZ4J7kysvyR5CgTdNI+TyOPg
	G7znnZM5ddJrHyy8tUWZZ/GbUg6a
X-Google-Smtp-Source: AGHT+IFsbpbMlf/oHa4o+M5HvcWy8tOY+l/DnXhzIG3RxZPMjwPTQ6efidUI/BlzMjp/KIlBUhnJsw==
X-Received: by 2002:a05:600c:3b9b:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-4409bdaf8fcmr14760305e9.28.1745499587910;
        Thu, 24 Apr 2025 05:59:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac26dsm20167525e9.21.2025.04.24.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:59:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:59:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Message-ID: <20250424-27a672c1da15353051b52c59@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
 <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>

On Thu, Apr 24, 2025 at 02:35:02PM +0200, Clément Léger wrote:
> 
> 
> On 24/04/2025 13:06, Andrew Jones wrote:
> > On Thu, Apr 17, 2025 at 02:19:51PM +0200, Clément Léger wrote:
> >> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
> >> provided as a separate commit that can be left out if needed.
> >>
> >> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
> >>  1 file changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 379981c2bb21..7b062189b184 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
> >>  	return 0;
> >>  }
> >>  
> >> +static bool sbi_fwft_supported;
> > 
> > At some point we may want an SBI extension bitmap, but this is only the
> > second SBI extension supported boolean that I'm aware of, so I guess we're
> > still OK for now.
> 
> That seems reasonable to have a bitmap rather than duplicating
> *ext*_supported. If that's something that bothers you, I can take care
> of it and use a bitmap. SSE will also have a sse_supported boolean but
> in it's own driver file though.

Up to you. We can always do it later.

Thanks,
drew
