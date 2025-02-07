Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151419ADA2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951705; cv=none; b=T0fuoTFQZYzRdFGS71nI9SOEW3rPVgCYiHdXrD/Yve7++94HNNSd5IkzhANB/TXfNAX7nLneO4uWIAY3HrZojx3kvLbQaWU+AQuKSjmY1auu5oB0S3tUz4uHjzga+0c8cDSW41by9iGUOzU1TCAHQhcBDdCEZGT/7pOXxS0eWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951705; c=relaxed/simple;
	bh=xD1OUfJtuv6B5zjsJAFVZPhylVJWJqDhygFWS9FjGiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uebYpwajn5JkZcOWqfP4tcjsPjPxOQaSe06YMcKALYv0ikvoXuYcDkjPd3PBYxp3kXj9ZdlaK5S8A29aAIi+xXhm71wIl73P5u8tMcjXazODHa3ba49aUAJViHFIGWuDWk5FenaHna7EOprhZRw1GUP+1IqbKdCFt/QMSay4vnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Ni6lbl46; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Ni6lbl46"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436a03197b2so16268485e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738951702; x=1739556502; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BwZZ/X+71TKi70TLxyV1+F70qGRY6zHI1hEQ/denga0=;
        b=Ni6lbl46Pqg5c0Ah7iwaM79mTKzZSIWdPMWCDOuPE2Vs17ZvOLLm6Hii4Ob/5O+8Pm
         1GvG7HHxRkgLFOxXAmyBTF7Jnl2WHPYYQ5TbXDWsPdlBomApVpOwhnIZZ2CB7sUUzxD0
         og2aJyBr5ILd1HyBYm2B+ADqHEbcteo749DOEzuNeM7kwBZBK61NPB5resrr+aQvp4yV
         3PJ3t6DsidKToYlzDN7fuE8BMs5lwH5oX5p8Ly+wzbTbqY8VsW6QySf45ucf0r90A0r9
         G+ks6ueTZxyIGvvD76vNBsMcjLyDQ/LNLi+v+7GLwmOpvZLgRXoW/pUQn1eOA0EKabAu
         aNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951702; x=1739556502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BwZZ/X+71TKi70TLxyV1+F70qGRY6zHI1hEQ/denga0=;
        b=NLQE1vzKoHLJr0Ma6h7IBTiewobzf3B7RgjDrHU9WliO8Etkp6CMKBOa9vR88HYdZE
         vjBjaRrPJbmRuPxtTpqG+bDHDsXHw3WsR8Z8S59660a/AR+IpdgB1mhkUuGbw1N0cJwN
         KTF/AxujDm39ZL0GM8lRqPJcUH/idG+07UXDRCiZLRkI3aLAhyK5BpCUliDzqq5bXWhd
         byJO7emDx1Zeylwv1aa2UI2HxP8t/ehpaRX3LsXSvm3mxGrq3KTG6RBnu7HGJzCMdw3a
         6V7dqXl2GiIDNAHJf7eU9IXTwH5h4vH1M6iSgcOIXDBRY0PVjD1uXy1L3v7+Q64/+/Zx
         zShw==
X-Forwarded-Encrypted: i=1; AJvYcCVNyO7P0bYpUPYFhrp+7vt/GQQn3Nlq8aL5T0YOq7/Oe5MFRJCIw6GiQ42+btOQotqO31CFrYJ4sBt/EJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnNz0tquSl5YlOrR+IKBi07FAXakU/0IZwX8kBMMPiLWMpbHd
	QnRYA1YYl+4D7BIQVHS38lT0nxD4hEEPKbde7H1XDATc2ENJBE45wlwANtxtGkg=
X-Gm-Gg: ASbGncv8Fn9j7MaFARzfEQOHUqP7TbyzPBIw3kkgi55n5CbRFhZ+r6Ibh5Ph+aml4Hg
	cfVnQDGL9dsTh+Ha3GdOv4YOKbFEZroBQT+ZvqiUsI+tOfyU8q5Q+CXs7S+kwdO+69Y4CLp4T/j
	4kULg74CrF9jKfPVMoK8IE1s8UoLUA0avfXylVKz8W109ZqEYT+ETNHtXyaOXJijuvGnqa54hku
	Z/GRzmk8uie0VRgU5XpXTo/nhA0DhmONPPU5nNkgbFrQLic1zXYNB+dtpVdukEeYtGPoyuATT6/
	o0/2xC4AmbPOxYgoxI3K
X-Google-Smtp-Source: AGHT+IEfBajudvX7hdtPp1HAswxn8AqeOdOhPbfDZ8El6ut9FpmVZQ6qQnqAjDXWBQXbzvMLEtEweg==
X-Received: by 2002:a05:600c:6c52:b0:434:f335:83b with SMTP id 5b1f17b1804b1-43924a27b10mr42300105e9.5.1738951701728;
        Fri, 07 Feb 2025 10:08:21 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f19247sm79362335e9.1.2025.02.07.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:08:21 -0800 (PST)
Date: Fri, 7 Feb 2025 19:08:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Message-ID: <20250207-7bcda0b97d4beb9d72de12f7@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
 <20250207-f0e7e2b868ef3e9f2a174f29@orel>
 <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdabae33-a1df-41f7-9e1f-9973f252599a@rivosinc.com>

On Fri, Feb 07, 2025 at 06:43:26PM +0100, Clément Léger wrote:
> 
> 
> On 07/02/2025 18:08, Andrew Jones wrote:
> > On Fri, Feb 07, 2025 at 05:47:28PM +0100, Clément Léger wrote:
> >>
> >>
> >> On 07/02/2025 17:19, Andrew Jones wrote:
> >>> We shouldn't probe when we already know vector is unsupported and
> >>> we should probe when we see we don't yet know whether it's supported.
> >>> Furthermore, we should ensure we've set the access type to
> >>> unsupported when we don't have vector at all.
> >>>
> >>> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> >>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>> ---
> >>>  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
> >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> >>> index b7a8ff7ba6df..161964cf2abc 100644
> >>> --- a/arch/riscv/kernel/unaligned_access_speed.c
> >>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >>> @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
> >>>  
> >>>  static int riscv_online_cpu_vec(unsigned int cpu)
> >>>  {
> >>> -	if (!has_vector())
> >>> +	if (!has_vector()) {
> >>> +		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> >>>  		return 0;
> >>> +	}
> >>>  
> >>> -	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
> >>> +	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
> >>>  		return 0;
> >>>  
> >>>  	check_vector_unaligned_access_emulated(NULL);
> >>
> >> Hi Andrew,
> >>
> >> Wouldn't it be easier just not to register the hotplug callback in case
> >> !has_vector() ? In which case just set all possible cpus
> >> vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
> >> at startup.
> > 
> > We could do that, but I have another use for the hotplug callback that
> > you'll see near the end of the series.
> 
> Ok, I saw patch 7/9.
> 
> BTW, what happened to patch 8 ? I thought it was in my spam but even
> lore.kernel.org does not have it:
> https://lore.kernel.org/linux-riscv/20250207161939.46139-11-ajones@ventanamicro.com/T/#t

I see it on lore for lkml, so linux-riscv dropped it for no good reason...
I'll send patch 8 again (this time with feeling) just to linux-riscv and
we'll see if gets through.

https://lore.kernel.org/all/20250207161939.46139-19-ajones@ventanamicro.com/

Thanks,
drew
