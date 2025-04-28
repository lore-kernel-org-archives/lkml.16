Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6B136658
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848031; cv=none; b=OAzjXbgo7rK1NhfUlsKxyg6Dxf1yYVwhcBS70HGEuc16rk4B7TAU+CH6xI80BsJ5Mg3vqBgYeQySfWeN2GngDU0pJRNuYVa19kAOHUM6jr/Q/jQUQZJU+/dRVHDrtKjS7KPhyCcqaYHa1szHhfSrfMXbWAz0acidSpXBJdknGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848031; c=relaxed/simple;
	bh=8Ze9MKPRr2ibTiFbLm3WcNCVvEbM/ekMvV4s7tGQnxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMHOs4mJzFZkOY49nbZkOtajXRmP9W+s9t3+LpruNapOy63sPHOPBYlhBCx3HhqSL6D7eZYpOV08te9B2DEvZfJrNjCsypkLQBf7QbLVB8hhqpbZkWEfOtHJLf2h3O0EdQr0DjEZQR232OhiEbSBjZWfFZpDIJWrNZOqSIP7XT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fbfAri0D; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fbfAri0D"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25520a289so754558266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745848027; x=1746452827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsbHP9q7QPdde2LygIdicngaffCZ7TvF689TrjkFFsw=;
        b=fbfAri0DEJAiPZ1Y4eVLbzkIU7dOwOwHXz3h42i6v+8xhJhUwW3/sAE5vaiBM34cdl
         65InoTPgb0jTjSifXnd4jdCD/EHMlLaMFCtRGev8ZDvMYtGjJ0sOXp40ZM7UZC6zDEry
         EbW1oNg9M0iq0mhPOOREnQH4vEhmWJDJfV3zdTuUkmGVFf2Sd6DVHAZsKRnbz0Bt21uc
         lZuz6R5SlDdR1pcamkzv4u4aKr76szotKqnT+uSySlRPPZmyCQkoKrVrMUOgnE2NLNl7
         GqnfYhMZdl6XYmNhJM+SOnf51cpGuhVZ9pxYqQ7jyUg8u3qDbJf5sL/n2yKdbChrKPlw
         mCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848027; x=1746452827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsbHP9q7QPdde2LygIdicngaffCZ7TvF689TrjkFFsw=;
        b=v4ZPBRdlcry66fFoVJFIWvS8eeI8t0ZDYJEl0H9SBgfiK6RqfHf1RKtFt8Mm9MuBGE
         LH0XvdK9J1ccGn507F+h4eosChhgtczrFpfxOI2ty1cBa6A+7mYavN8IXBrcX75AopD1
         OVXbYIzu6HDM9g1bZep7OvFy/GF6QwC729lncHD10sy1fT44+NyS0o5xav14Wf4iLCRJ
         z5iD+ccOTRKBI5aGK0YnsFzjwKGoAywPIo3+OpsKYi4bqSHCoA98anw5NxhQB6pa85E6
         J2ThrR4e22ZwjHqRy+wEyjwvCwsu4N+uuT63cDwS+VZmjmpRTDtSON/Teo+QQRCQl3B2
         eAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxiaPDyxcPpRDxh19zFbQFyj8xqrDCCr0XGCkeN4ZI0uO1JSd8y7bsX+jPkd50XCggqeKLsdcohuwPf9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JzZB4eHVeDkAl2211Kn7KzlQQ5YAoIjHnlko9XDMeuh6JJxW
	jV6xrEbcicsIzAZRhiq65yMYn8pUAOhXoIOXkaa3WiCYOMWDYj6Nsu3C6iuooMo=
X-Gm-Gg: ASbGncuNTHiolzTP7iO/cwATKKCqDAcF/JTotGC0LGwqqhP4Oz9YMOqr7vnwj5/xv/2
	A8Lj/mEX5xOzqhxbtirYSTYvumqA/FGvIXejoiDV3wkvYeGTmFrgdKpJbmr3hToHFLr7JI3ZDTu
	d4tNmYCAi8IWI0wxQMzHQI7yhjeYmWIbgvMkzMDz5SSWAR2Z3VKiPSc5BA/YsqK/6mOCcqJ9omd
	3152D8nXGLAtZFQWQI35m9c7Fu9XgXtBvHeRp+6xu+2aiEiw5/WUWAFieMLr/pU0pZHXaEa71Vi
	w+sOsS2QBbnt0cPJPj3jhijbpIAQL7z0JDHq3VlgQeQZtiRX0ZF9BQ==
X-Google-Smtp-Source: AGHT+IGqzwh1ITeNsAX9KP5aHUN5/8acCZdGikSmJ/7V9wS42pujwbYDhXZIt1HuZsg7+acKpE7tzg==
X-Received: by 2002:a17:907:1b22:b0:aca:a687:a409 with SMTP id a640c23a62f3a-ace71098d4bmr1176725166b.17.1745848027469;
        Mon, 28 Apr 2025 06:47:07 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm622902966b.33.2025.04.28.06.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:47:07 -0700 (PDT)
Message-ID: <65c912cc-3a27-4b0b-913e-784ff6d07221@suse.com>
Date: Mon, 28 Apr 2025 15:47:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add generated modalias to modules.builtin.modinfo
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/26/25 18:16, Alexey Gladkov wrote:
> The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> get information about builtin modules. Among other information about the module,
> information about module aliases is stored. This is very important to determine
> that a particular modalias will be handled by a module that is inside the
> kernel.
> 
> There are several mechanisms for creating modalias for modules:
> 
> The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
> the aliases go into the '.modinfo' section of the module if it is compiled
> separately or into vmlinux.o if it is builtin into the kernel.
> 
> The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> modpost utility. In this case, vmlinux.o no longer has this information and
> does not get it into modules.builtin.modinfo.
> 
> For example:
> 
> $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
> generated by modpost if the module is built separately.

Could you explain what is currently broken because the device-table
alias information isn't available? I think adding this information is
reasonable, both for consistency and so kmod can display accurate
information, but is there more that I'm missing?

-- 
Thanks,
Petr
