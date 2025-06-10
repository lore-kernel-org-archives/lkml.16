Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C1224AFB;
	Tue, 10 Jun 2025 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552852; cv=none; b=okFRR2ec00Yx08irk73Npfpg2OhSOA0Z35EY1+J2hWBTRKBj42FeRcYY/hUTLOGEfet7mVGUdHBxWEWQwNRTAGvtfcQN8glU4HIj2Og9abOOp+PjTWGxiBk9GqlJLT8hHrNatd2Jo7OqQF0pK3iIeclduxYSC+S2scdayhsgF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552852; c=relaxed/simple;
	bh=mQviaa5V2BjjhvHYyZlmKWM1K820SYfQTPKwzwoi/sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo4FGdZNsgnqC08gkjWiGUtRbLf76cOdkvz1EolNR+/oCu9MCksmh6MvpYUJzP60T1pGv2jcl1hJxW1F/+eNTb9NYObYrTN2yPrO3LUWdbDNs9FM4v9f/C/SiJtLAuGjruA/Q//vaCOjlzTAJSoz7L+hJ/hEtbm44Ot1LG+XWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwvM+Z4t; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwvM+Z4t"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4e6d949so29589896d6.0;
        Tue, 10 Jun 2025 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552850; x=1750157650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=lwvM+Z4toaurWTGAyoUHD5xOoVubI9nfEIewQ/b1Fimc1do0zLsSOaVO/VNSgejkRx
         EyZJ+kHSfE04eUitxeSkUg8Ra46OBp3iFwVW4jqE9a3eX/9QsbsScOzwRjUv6Ma7IyxZ
         4hW4DbcfvAHhA6g2vBLF/59wwXQ3ohEDQ9kh+A8ndlumrFkwxT3RH6kuV15XwV62OveT
         /Q0wUSEN1VhP/ADKjeNmM/8MnMPKG+1QxQWE8N88aFwC/2vhz7kzX1PZpehdMxkIyfZ9
         Xr2B8lMcMWQmKDnJ9NC6zah8a7eGhDkqiYgMvZ70dQgeyeVowLNdUorLJV20rINHhtvW
         TuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552850; x=1750157650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aciM/RtAI+o7KSDm0f9yisjYVs/6j85ozLAsY02zURs=;
        b=QDPVJj6af5Fi0ctMHc8gDKKarsmNz/LJ9C6GsdM9non6Lg/AOueH94kbOUwghnDu+e
         j58cYCInxpe+7wpu9/dox0T0QW6ZwfqzCTkbn6VWAQuulmNj1uWLH0wMu0cy7b1wTykl
         L2muqUz1tq2TiAl+3cxWwPAVGO3SIJnyo9UJW34E9lJnQsBN+snvTvtl/Bx/ILksALaj
         9xqv2BWtxJj6LS2obb63sLRiRvLNFT2UkYA7VD5pgWEd5mj22Li8gw7Le9MEjocxOxcw
         akqo429LkKywV7cxgSSqFGayZBhQZ8EPKORmJZVN0xsweGIh18LpeQBnGRCL/go8S8E9
         XDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3aSL2xZ7eGA5iVwgy8WK/NuMMGmfqR8n8ZGItoEBCi5vtMN2Y3G3R5561QwX58JelEOwxxBEWR4+M@vger.kernel.org
X-Gm-Message-State: AOJu0YxFXGEcc4jzHiy/gjzr5yi97ik4eVbwAzoc8qBf/eGZ1zsYZ+hB
	Okvl1Hr//3WqPzeW441NXHnAubnHt2CTQUdrFuR/ZWu0LUjKWmCfDnFB
X-Gm-Gg: ASbGncuXENofQM1J+C7Phwwz2rm0meLXySsUs0lk+Pdfgd6cQNk1+XmqibaQDXWNK5i
	jkyrhnMTRTK6UtodcKnclc3YCpDkfr8+HJqErjZPYTploariqSJbnE9Sqm/a02Fr5BHTHLYreDV
	iYXFS66MLLyQrdsr9EFq7K1S5BQ0MNCO3YdFAdAutt/1bWHdaajSX1jZJepQZ1Jx+fXKD+GlRlX
	JQlJF4aelB2IPrVsCzjUtqOmo/YPwErCQCLdyBHIjYtKCXB46bouYr+NjmT5sC/7WEwW9q8w8FB
	Ej8AMAXuhTWerjMSy6K1Mw6zpCno5NS21mza1g==
X-Google-Smtp-Source: AGHT+IEo8uu+V6aspY6hh94sC7blb0U3CV9AGlaOO83e1hYVMKVKokyGqG4hkNCz9kFeCPCNDFjT6g==
X-Received: by 2002:a05:6214:2022:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fb08f43185mr264918966d6.1.1749552850108;
        Tue, 10 Jun 2025 03:54:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac94afsm64332126d6.44.2025.06.10.03.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:54:09 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:53:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>

On Tue, Jun 10, 2025 at 10:46:23AM +0000, Vladimir Kondratiev wrote:
> >> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> >> +/* generic/MIPS variant */
> 
> >I do not think there is a must to add these defines
> 
> OK, if there is no objections from others, I'll remove it. To clarify,
> we're about removing both #if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
> and #if defined(CONFIG_THEAD_C900_ACLINT_SSWI) ? And, I'll keep logic in Kconfig to select whole .c file if one of variants selected
> 

I think all should be removed and it is OK to use old THEAD_C900_ACLINT_SSWI
as driver config. At least for now, I see no similar case about using defined.
Maybe the subsystem maintainer can give some more meaningful advice.

Regards,
Inochi
