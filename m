Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAF21B1A0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706510; cv=none; b=a96qyDP0gIVeNerZlOIhSNWhgM08UyGqlkeGGY4bgWnbUTxFN8UBTaoXY7oWEMfH0RuRvoqKDEDkArtW6PEakWYUIFAI1IPj35szqVCujEODfZoSBB+OLUjZWG63tWtMPQYez6XYZTlP7teiitzGetN7WnqbH3+yOUJ6C+zlSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706510; c=relaxed/simple;
	bh=R6NQemqcM3NqXPAQSUUfjhjmNUwVN2uMax3o5Jo/Xwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPD6mgwhB7d5NE9m76R93kxfWnfzv9Xa1BKhJRKx+YS5/hlNf6B06Lpkxev11Q7NF9OAvKoYehqNF8kdhy8LecARE6He3qFUXix+UEv36bm0g3a50PIIBnYfgeOeyQFNKcQ1JMwTEChP5nUbT3rEQJdjK6TFcehTE/vwwg9pPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZD8zkp8y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZD8zkp8y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso42287655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 14:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738706507; x=1739311307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=;
        b=ZD8zkp8yboDNf291SntDqNcm/65l24gXENUai+lZYP6TkeZ9LZ8Dvj2fVI+DlP8wVD
         uTqPLffQfhxlShWguk0yp5qb0UtAXPZiMfvBg50kzx2AyiM9tJQ5nDsiOqQyqLa5JxlQ
         N0Y7SfWEi9fsCrPrKR6DALuFCtr29gl+iNDPNzuSno8N1bXTuCKFa3ovg3qEPA2Q4V0Q
         iI5P1tD+u3SJseDlgntHrplzbCh4Bs7a5vb+OEasZXoinIqVwIAzYKCcL5mGEdwh9J8p
         jfwJwXtKKK2Ilg2pvV+3igy/Vdpc6aeOWq850L9WJZhsb9YE3TMi1etaspw/HbmsnyyQ
         CTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738706507; x=1739311307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwIsfd/OtVZWLJT6WB9dwos5ZOiOppzZY+Mt6fv0DyY=;
        b=oA5LtICnYggKiJXNElWdYpX+EGsbmbm706GhLYbpin2X//7GpJZwD2Jd9tjzhgxQCm
         27ip7gkpDA8i6W7tjF8jLKoVI84IjDGcJLN4f1OQAWQzv3tIJgGNBr1cf6fbtRQeUVCc
         ul5wYj+4NqoWrvIT96nW33L9xAwzxCrfbqqXzrzB53lMX92CwiIVJ2iwjINE1qjGKkUo
         9qgrDHXW2kzzCbXCTWoHjX+vDrYaKOh7fuwEWVlVYMhcbHcUPnRMX5GsVPzYoi724Pjs
         +bx0Pc7OyMRUNMgziMohMdDt0YDjs0QyyZC+dRGnbSLF2LrIEJ/9X9LlsD0wR5cHjYCz
         5VQA==
X-Forwarded-Encrypted: i=1; AJvYcCV+2zm80qjPtWyVMkz7naOGR/pjHRsAARsX+4kb8G/ZAnsDMdfyDwTqfSWzOeKd4v0LVq5aGTzWe7O9cGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqvaB2bZFCBAOAREjb1FJCL4BzgnWqyV4au29+j0amR1GSJlEi
	FiIZS25H6hlKt85eJ1J1dfszzDd74TSRSSGvg+mZZgn/1B3eFTs0h4bgN6ggt58=
X-Gm-Gg: ASbGncuvCUxKkxbshwMEkphRl2vygNmOxYf8JlpcCs9FTL8j9RwEa6iWkUbyHhjriqb
	X97u1aqdN9tkZ5MzU9sstyULmvwSB9m6uw5NiQJwS9tcqNSL3rSJbuQKTtQfzRhsz91ZtY2Yo2/
	CXGH7zpoYo6D4I7g0/+jLODQjP2gKucNhz2IPiADn7Y01cn1Vf2cp3zU8N0ln6BVKky+SkpYASe
	63bzpC10Z63vgqkdSjxAad+jG7qiAIaMKKrDBj63NT/yLK5dd+O0EMz6QgNvqcf3bcrqOf60m6t
	czFF6RRlK3LW
X-Google-Smtp-Source: AGHT+IH2eC8QjzxubMrfwju/J92XZERQpRmtsPLz6Ay5DOV8VGM1F9TQnHss3+rgoHiESfKlqDj3WA==
X-Received: by 2002:a05:600c:1d0f:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-4390d56e5a6mr1234275e9.25.1738706506951;
        Tue, 04 Feb 2025 14:01:46 -0800 (PST)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec369sm16729579f8f.8.2025.02.04.14.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 14:01:46 -0800 (PST)
Message-ID: <d2f87ea5-fe54-4334-ad68-9b169b2f3774@suse.com>
Date: Tue, 4 Feb 2025 23:01:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry
 over I2C4
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250113110512.506007-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2025 12:05, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add INA231 current sensor for S32G399A-RDB3 boards.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 94f531be4017..802f543cae4a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -40,6 +40,14 @@ &uart1 {
>   	status = "okay";
>   };
>   
> +&i2c4 {
> +	current-sensor@40 {
> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>   &usdhc0 {
>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>   	pinctrl-0 = <&pinctrl_usdhc0>;

