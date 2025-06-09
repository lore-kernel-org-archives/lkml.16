Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7E12E7E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456174; cv=none; b=K5Y5UaHld+xLq8Tn0klj9J8g0N+Umf12/wUuC98enlLcZx3p7oSt8AJf1qgj1c5/kqptVh6RfsN6lmKBjcWfp+GAmXrPZ0gl0zu570bBc0KZ1ceCt4tKVfRrVv5NdKU6rzIbmG0KrKUByNIvOYlLp9jH80bPYVxSFmpyViBCU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456174; c=relaxed/simple;
	bh=7rNEGkBan0eoSoeImZk17eMKapBrfhPQlHCxzftBoV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiohEYyevuAT1v/96R2yZO7iUY2Szu6KNYU2k8XfoBexmCm59nV+3RDX+8bR3nm25Mpx06NlVirRKIKRsArPrdo4Mil9mQ2/tpSlPancYbENB0PJLYwS33+qQtDHSzQrFbaTb6wMe/DI/DyIU5xIfdU/SUUTwado5CC9j43pcdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XOUUZeRh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XOUUZeRh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a522224582so2458716f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749456171; x=1750060971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jEVH42C4V4RM7OPBVpernVaAA5iY2pieNHM7q6gnRY=;
        b=XOUUZeRhcCWPkbpdWFK+777IOH5Lkfe9he9d4M1zr55rqauRYy6W/OJr8mDaJPDoGJ
         vNqDypf3AtZcqX3ESFnJ2Mp/BFFGdR4CwgHzX1+tzcznSVKCi9KcWfDWn9m/3cUEB/4P
         3Uugfv39Z9rtAP0tconqG5JOuMH8HOX6VUcz8GYHMAz2Q2n8dgm1OehIaPMaHYRXoOj/
         Sm3lQO/UhFcAceSHlhx8/Byf6jlWRA4znDkmsPW7jwHd8V+TIJSyUBk0eEplxP/sOKXZ
         lZMqpre9QazG6gR7YOFsAAmxarkWL3MLSm645g0DR6RhFvcE5jTLgPRK0fjv0Ho7So2S
         kEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456171; x=1750060971;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jEVH42C4V4RM7OPBVpernVaAA5iY2pieNHM7q6gnRY=;
        b=kz2HgWUfsnAIpxCTstsSIvQMFuMi/akPIzovl2V3NUWUZk6DcJP37nDKF0lpLNFoxO
         FoeOLLjg7lE7C2xHcqEu48e+cJYbh829B7viEFFodVeYLN30o+aOM/gd0nTpvh5Q1X4L
         J5f5objgMZMLX3pfbTC85QDdTcxvPc+RKPWRcQRPqXhn0XiSxz2UKXD586m//JZOYILP
         GsNF3O7Cn0X3MzGrO3v+CXv2czOZmciNXBVIjpmofZn4WWFSkd0WnU1md7/wGiSTYEgd
         48GmTCOnCGJ0KV4mTX/MrDUOqwpHYC6NT3P33xDkLMzUrfDLgeg1s74BQsThYYOmk/DJ
         dlbg==
X-Forwarded-Encrypted: i=1; AJvYcCWDPfb4eib2GGN2oodxX9/0BBgc76dkI+kCcrMx4MkMaD8hd4DAjm9dtqUylmfQ7VCfP0+FqkhqVTG217k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRaY8AdOfX1UVykbP0DL3G/vHey3x7Rd83o3vtBUrOvhGZpDWu
	MgUdI33uBd+j2J5unqSxZRSv8yTnRqc0jH7elJ+xr448Bbay1CeeOiMF7hrfCjOLreA=
X-Gm-Gg: ASbGnctqnzIdsCsdWzKoeJLRMqfvVqPeHb8PCeRdbiyyQYLWYpSsQHoNPw/Pw9Q7/Fo
	RnkdUF8J8jQK26ARQslCaMCg5vOSKFFNF9nd0KUzxqfYC7llQWH6Jewib66vA+Dx5CGNyjmnN7y
	5TIKWYrhWsy9tiCQWBeHP8MzOdjM4EriL4mV3XA200kuALX+6bKn81vjP2+PPIuaeKxpdBXa8F5
	+2KnwJm7i8OafIuf37xlXn1y2G4kdpntS1h5QTnMYP9aJ1EsjgWBTuSj0VwGQ56qUvAGSJ5BC8M
	QQ1sV367RO6cTdaKEemqXSvzQmPr/pDAru6dTcJFrJY/PJhEzm/Er69Fo5XlK5iJ9sM=
X-Google-Smtp-Source: AGHT+IFvRF+XgG4wncrB+z3N9gR+KJXYed7DBae2qonjrbB3EvonuPccnEzcGgZ+DZftSs3V+DzeWQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3a531cb90fdmr8885623f8f.51.1749456171200;
        Mon, 09 Jun 2025 01:02:51 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm8868270f8f.76.2025.06.09.01.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:02:50 -0700 (PDT)
Message-ID: <175eedc5-d82a-4b3a-bce6-2caf625597ca@suse.com>
Date: Mon, 9 Jun 2025 11:02:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/20] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, x86@kernel.org, kvm@vger.kernel.org,
 seanjc@google.com, pbonzini@redhat.com, eddie.dong@intel.com,
 kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com,
 kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com,
 rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250523095322.88774-1-chao.gao@intel.com>
 <20250523095322.88774-4-chao.gao@intel.com>
 <d1ec91ad-b368-4993-aadb-18af489ea87e@suse.com> <aEaS3i5JhgFX2MCh@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <aEaS3i5JhgFX2MCh@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/9/25 10:53, Chao Gao wrote:
>>> +config INTEL_TDX_MODULE_UPDATE
>>> +	bool "Intel TDX module runtime update"
>>> +	depends on INTEL_TDX_HOST
>>> +	help
>>> +	  This enables the kernel to support TDX module runtime update. This allows
>>> +	  the admin to upgrade the TDX module to a newer one without the need to
>>> +	  terminate running TDX guests.
>>> +
>>> +	  If unsure, say N.
>>> +
>>
>> WHy should this be conditional?
>>
> 
> Good question. I don't have a strong reason, but here are my considerations:
> 
> 1. Runtime updates aren't strictly necessary for TDX functionalities. Users can
>     update the TDX module via BIOS updates and reboot if service downtime isn't
>     a concern.
> 
> 2. Selecting TDX module updates requires selecting FW_UPLOAD and FW_LOADER,
>     which I think will significantly increase the kernel size if FW_UPLOAD/LOADER
>     won't otherwise be selected.

If size is a consideration (but given the size of machines that are 
likely to run CoCo guests I'd say it's not) then don't make this a 
user-configurable option but rather make it depend on TDX being selected 
and FW_UPLOAD/FW_LOADER being selected.

I'd rather keep the user visible options to a minimum, especially 
something such as this update functionality.

But in any case I'd like to hear other opinions as well.


> 
> It may or may not be wise to assume that most TDX users will enable TDX module
> updates. so, I'm taking a conservative approach by making it optional. The
> resulting code isn't that complex, as CONFIG_INTEL_TDX_MODULE_UPDATE
> appears in only two places:
> 
> 1. in the Makefile:
> 
>    obj-y += seamcall.o tdx.o
>    obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o
> 
> 2. in the seamldr.h:
> 
>    #ifdef CONFIG_INTEL_TDX_MODULE_UPDATE
>    extern struct attribute_group seamldr_group;
>    #define SEAMLDR_GROUP (&seamldr_group)
>    int get_seamldr_info(void);
>    void seamldr_init(struct device *dev);
>    #else
>    #define SEAMLDR_GROUP NULL
>    static inline int get_seamldr_info(void) { return 0; }
>    static inline void seamldr_init(struct device *dev) { }
>    #endif
> 
> That said, I'm open to keeping or dropping the Kconfig option.

