Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2562F4325
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711521; cv=none; b=Uzb6+BtDl2EEDR8fUZ19f7+zPdlqfAtozsAZZMuRLvxws3eJWnt6m773IUTkQo3j5jrYcvS5PDvWD28/JLLO7Nxdqha3ZFO4UVxb9ot4JC7Xm4S13dEsEM1Gki+8IKQt2m5pEs5R/WXUeY47NuwKJfOPTngDYjAD++hf8mhBIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711521; c=relaxed/simple;
	bh=m/lcmjebGIfc8bR30PsxXVtMxU3UnCh95wBX5+3pcGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKM15xc0/1fTaq/nVQ5bYMQ5X1+AWQjYkyZogoIywDkP4cnh0On5imhZYwFDAu56gLhdEkWo6yDzWWF/SezDtiXDjP27yAc6zvpifdA9A8/19St5qzkgirqVJ0hy8u4/iGnst3F+KWiBVaxw7ZKji+rILDiS/N2kBZnMhppg+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UlkPN2pI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UlkPN2pI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad891bb0957so96906266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749711517; x=1750316317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1U1YDmli0q/E+71Ju80ahEU4Ppqicy9FI3KyEE9K0Lo=;
        b=UlkPN2pIjYQY/OyYAS2b29taQOYDZe3He0nF//dCugvZX0ACce/lcn3S164EBthaZ8
         AQY5T2amuBYiL2nVajOG88hIuoBCfFjsHvJcQ8oSV81mzy9Vy9kPyfV9o9r1ZzEUbD6r
         0WUS8PJ3MKuAj45I7BGS5PDYcDfxpKsWD5YyxDvQ3OJO4xQxNh8jHIn8dPtORdBRIpd5
         hjkeugOxernP7rwm/SaeZJnLWukWObqdeuuoG7VGG7cTKLVPrsFhWflbkliTwKMoDTkb
         /bzsbtjhmx9ppv3YyvfpDnZJs+c4jJHiBfW/ngOcDTmBAdgPiXIjr3/UyYpx9jWJQjfa
         sXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711517; x=1750316317;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U1YDmli0q/E+71Ju80ahEU4Ppqicy9FI3KyEE9K0Lo=;
        b=wDNZE5TUwe2UyiaWLaVtQFI5NWZkQftDfI60JH0Qud/uotJgeuSA5JTi16U+swIt/w
         MXpiU9BjaC6d347z2WWQXta01akZIBu5D3PcOk0Hg7vsv8AzaXy6+ShdQBni4FLYLCT8
         0fGynIOw6u/5qHVx+YCSjDz3jRKYKyTLG7QhWFurCmwQk69OXwhDq+EIfiz7Is8p6JQe
         QWCGnqCeCwHgzayImwkyi5q1jDdrUk0TOGqj68XjN1PcoAifU3EzjoSUEi2JjdHbRRsV
         KJ738qrJvzJuYKB6mYsrb+bj7DhuZmTz3g1hPpp/wR/exEUGEvXB4HUhN3cuIZ8UO7yT
         L7sA==
X-Gm-Message-State: AOJu0Ywb29oCE8e9xleCNaB5xiPw33w50yd62+KxL6vOJfvQSSh01Kd/
	sblJIfT6mFXBPdXjpLZlflSIlkctIdkcyJnExDThTwDwFDE6AuUnZB9bzMYis3/eX2fF4bvOoU+
	yHkDE
X-Gm-Gg: ASbGnctORr4bcpTCZbVn8AGe0lhCtWBa6hesv0+EQD5BF8vIhEiVIec2qibXNd+5L2M
	kYodyIkjQiXf/7U3JP7MNk3H8GukqI+qvui9yhu2qgmfqA0igl2d5+j0njB9kzKxAr8RmpOKFIH
	90NlWVsmfkZ1IVV+OBQrDCp7qgCBaiLtyFwj7lRh8I6243rKrAH2N76nlyKRZdqKtyAfuKTccRO
	BqszPWTitG4nJrcMSXyRIlN0gTV7FakZaFamEHxmfmIUG7a3eD13Cxqi83Ux8BuOmThNaEaBeKF
	PvfNkw/vyr1AUeQXqAqDqrW1NYyIcUyFsj6HcRtWHHanO7kd/ixkLgf2j48BUusT83xE1V5wY3q
	3o47g1J5kBa+L
X-Google-Smtp-Source: AGHT+IFbkI+ew7X3F7vPw3QRy41qUPh/GkkEoeMmcRDCBYjm6Fudj+rkaNYMUv7N3Uwd7J1AiHEcHg==
X-Received: by 2002:a17:907:6d1c:b0:ad8:8621:9268 with SMTP id a640c23a62f3a-ade898349c5mr682901666b.59.1749711517197;
        Wed, 11 Jun 2025 23:58:37 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [109.121.142.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeaded78ecsm81112466b.156.2025.06.11.23.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 23:58:36 -0700 (PDT)
Message-ID: <f9e2dcaa-6eff-4eda-8c7c-0d19c2d11e73@suse.com>
Date: Thu, 12 Jun 2025 09:58:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/its: Warn when microcode is old
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/25 03:08, Pawan Gupta wrote:
> A microcode update is required for IBPB to be effective against ITS. On
> Intel, X86_BUG_OLD_MICROCODE is set already when old microcode is detected.
> In such a case system is tainted and a warning is issued.
> 
> Also warn that userspace could be vulnerable to ITS.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>   arch/x86/kernel/cpu/bugs.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7f94e6a5497d9a2d312a76095e48d6b364565777..7aa3ae00e6b4daa5e42217b66c50cd46d6bcc115 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1427,6 +1427,10 @@ static void __init its_select_mitigation(void)
>   		return;
>   	}
>   
> +	/* For IBPB to be effective against ITS */
> +	if (boot_cpu_has_bug(X86_BUG_OLD_MICROCODE))
> +		pr_warn("Old microcode, userspace may be vulnerable to ITS\n");
> +

That check is too coarse and probably has a high chance of false 
positive, i.e

Latest firmware for your CPU is version Z as defined in 
intel-ucode-defs.h, current running version is X which is older than Z , 
but it already contains IBPB fixups for ITS. Then it will trigger a 
false positive.

>   	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
>   	    !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
>   		pr_err("RSB stuff mitigation not supported, using default\n");
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-its-warn-b292b10896e3
> 

