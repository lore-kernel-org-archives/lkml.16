Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB91B4259;
	Tue, 11 Feb 2025 00:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234569; cv=none; b=PnH5kJYYS5hnKKkmtjbmh6bAAKYjCZTatwgHxr4w6XBX9YA0xwzHqVt+lFA3QWfBmWsyMengnsWpvZBLLE0lRd/sJAEg5cxWo0c7njzWZprKppsvtf0vZPT25H6G34zne70m54XhN0zFUSMsvmEo4Jjl4xaDs6GZWuqILPsQvTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234569; c=relaxed/simple;
	bh=gOl7sypTcjVDSzWEpj5+cpGk9s8h5WVawV/ZWHfCoYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFB0W+IWZDReFat/A33EKLFdwVvEpah7X5vtX3YaesG0oiwfCnpQo5uEjrZf+hPF29owRbrOvEKHAdxXBM91qutubwKZvlbkv3BT44ibwer71INxIUPRxV0J5wNl187N0rev3YLeOieFKPbFGVW/xMpVATyxulzDdWsIYhwBLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUoTlxOh; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUoTlxOh"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c050c6e201so235235985a.0;
        Mon, 10 Feb 2025 16:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739234566; x=1739839366; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ves2PKf6HPc01SFv90D7qof8tDzgHtK1O0RPrNmLMrU=;
        b=VUoTlxOhOClx3+0lerNU34S5pHFGbF5h7xXJlYIJu/hC1URQvGCR1PRc6e7QjgGRDt
         olxJzRfLjUi+ct38HufBXPW/CDvyZMG0aznGhy5f3y71UEkLs31BVDCXGVBzHyjJDi8g
         WVpEiRbXsU6GsWL5sr4iFxBiHf/xWXWy1CFcWX16YoDkdanMvwaDLS2p268eOtTusCha
         fkF9gmzWaH90s17/4wBSMAgEUbg9g4Rmsi2TdZaOo1spaa0lOBlDxqnbHVCttYzh0zOa
         zsOVXQrMwX6sj6hSoxIxlnK/mg9K6mH14ukCR4YmJfHsBex6k5QhMgAwYc4ivPgWctCI
         0GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234566; x=1739839366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ves2PKf6HPc01SFv90D7qof8tDzgHtK1O0RPrNmLMrU=;
        b=tamaLmJ2fenBRkeaqgDgQxPUx8Qohk5Pc+RzuL1dSg+Y9EOJDTOQwqyd8mwwCOQc+i
         F+nt1ggVGOzEoX+p31RvWkytd6MFhx7Bs/Nq0o1tbHzxcgNXJDPYo2L405P85RJSP0nU
         ZCzTkZ64U25ilGaXujtJf+CP9Z8qeSaHubfZutVLu0U4Fv+SvfJ65wUtx9+3hJYWPQth
         r5RrRQj3vvnlb+FyaB9vfK75sK1yaQ0LjM9Jg5FHeQjyiq44/7rxvYB5JtlZC3QFdbRX
         0ixzUo+sMUY0TdtpWrQMmHqLX5J48DJgBbu3An8OTF5ydDL3JQLcrIvod39K5ZNole0i
         m/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Hm1jEL1E6kW0YN4CK5EzYx2zl4uceW1mfx5AF1UspzfeBa4xy+AxtlKobemV8jWFEybtEZ+CRHbvyyff@vger.kernel.org, AJvYcCVnNLoE6kfM7eWv3WoYjMGSeFnJHaO0Oc1c1H42yVop8hRk8BjY+hQm20W4bZArCh5ikDFscctc+gPc@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXTkSIhDPNuc//Zw0MptXHxjJ0ET88o+r+OEeszLvEafdfMNr
	LCMonCFTi7WI0x9NHcWhRZpJP3q8X0SoLrAWPbARR8VQqlEb3xic
X-Gm-Gg: ASbGncvfinpOVtODgUSczPzqaZIZ75uCTyO3RzBdNNS4ZExdjcKPq6J+SIkH+9XTHcl
	Cu2hD5SIMrxO/g2UfBquHX7g1iRyOkbYJKr12hRNVD8yQbZ6iLcLhvL49x1AinAWp/w1QfI4eoN
	w/Ht2TI0V9Q7XJowxVaXcSADug2INEToaKqB+3o5fSLvYKyfpYQfAr+j1H2Qt3/V4CXbdIYygf1
	1Cn3IYEjHWVK2BZ7Yc8nNFkUYS41D15L03WQtdaUFmXEIEAFvAylVN5D5xRCqqz0qw=
X-Google-Smtp-Source: AGHT+IEF3uTLUH2iOgpwnxLI7jl+sTJ/Lafd2yRzSkI96FyLXuh78dVjps2rwiQRrWVM1p/rSY8GKA==
X-Received: by 2002:a05:620a:6a83:b0:7c0:51b1:49b4 with SMTP id af79cd13be357-7c051b14a5fmr986106485a.38.1739234566457;
        Mon, 10 Feb 2025 16:42:46 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041d6628bsm598304585a.0.2025.02.10.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:42:45 -0800 (PST)
Date: Tue, 11 Feb 2025 08:42:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jonathan Corbet <corbet@lwn.net>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
Message-ID: <7qkfqzhytjq2qwo2wg3xtkoqu6id6wduckeeudbn2yt5p5p7xv@2gl5bcny26rk>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-3-inochiama@gmail.com>
 <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <374d3b07-e16c-4468-828a-a2a542cd88ac@rivosinc.com>

On Mon, Feb 10, 2025 at 03:38:58PM +0100, Clément Léger wrote:
> 
> 
> On 06/12/2024 06:58, Inochi Amaoto wrote:
> > Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
> > were ratified in 4dc23d62 ("Added Chapter title to BF16") of
> > the riscv-isa-manual.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 3 +++
> >  arch/riscv/kernel/cpufeature.c | 3 +++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 869da082252a..14cc29f2a723 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -100,6 +100,9 @@
> >  #define RISCV_ISA_EXT_ZICCRSE		91
> >  #define RISCV_ISA_EXT_SVADE		92
> >  #define RISCV_ISA_EXT_SVADU		93
> > +#define RISCV_ISA_EXT_ZFBFMIN		94
> > +#define RISCV_ISA_EXT_ZVFBFMIN		95
> > +#define RISCV_ISA_EXT_ZVFBFWMA		96
> >  
> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >  
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index c0916ed318c2..5cfcab139568 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> > +	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
> 
> Hi Inochi,
> 
> You could add a validation callback to that extension:
> 
> static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
> 			       const unsigned long *isa_bitmap)
> {
> 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
> 		return 0;
> 
> 	return -EPROBE_DEFER;
> }
> 
>   ...
>   __RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN,
> riscv_ext_f_depends),
> 
> 
> But I'm ok with the current state of that patch since I have the same
> thing coming for other extensions as well. 


I think it is good for me to add the check, and I wonder it is possible
to add the extra check for zvfbfmin and zvfbfwma like this:

static int riscv_ext_zvfbfmin_validate(const struct riscv_isa_ext_data *data,
				       const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_v))
		return 0;

	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32F))
		return 0;

	return -EPROBE_DEFER;
}

static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
				       const unsigned long *isa_bitmap)
{
	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZFBFMIN) &&
	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVFBFMIN))
		return 0;

	return -EPROBE_DEFER;
}

> So with or without my previous comment fixed:
> 
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> 
> Thanks,
> 
> Clément
> 

Thanks,

Regards,
Inochi

> >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >  	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> > @@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
> >  	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
> > +	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
> > +	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
> >  	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
> >  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> >  	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> 
