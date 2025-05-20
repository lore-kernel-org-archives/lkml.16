Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614537DA8C;
	Tue, 20 May 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710403; cv=none; b=WDXPU/FPZ5ZoJnqjxsXd2P/kg1QGYNOvjfWYHaEy1RA+HYfnmCMsiyscV8/9U3plkzvC9pXc72IUMuYLIGcmLngPG41WwSDQMmD7nf708WLnsyiIEbYVHZ/4BYZp5tWi6ZvGc3ggtp5AuO9xJQuvxixyAYIeKMEIwmbnLUnNUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710403; c=relaxed/simple;
	bh=XsIueLsZn4y1ZGQV5uccnm+6TpJSdx1Mu0xFPBkRUDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WoqboxXW1gMqaW6XVMWEayNW9P2JhOlEpv+jbrsHWqLscfPHwETdclZn3hq49GAn0cB8kzvOcFespmcVRdKgElLF+kxaRDgTB7rskI/VoVHbvXyD15pNdOLqgWNigpGU44eEKdrvi32Mx89B2tQOGbhDFnybtsUZ441FC9r0798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaY5UVCG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaY5UVCG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e542e4187so3772715a91.3;
        Mon, 19 May 2025 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747710400; x=1748315200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IhzOUPHPxcQR89KFzyoPmVb3NZLFVUAHNHd1Iu0FB1A=;
        b=IaY5UVCG9JzLkM3kWBNjRahrA+tRmcMTIywvuwXkFeboEA/WPiQ9Mb0s9jep7+wBvG
         sioK1Dio9L7N1m4T7QaybwSwmFrOheXMpd60SxetLRnNzzb/oWIP+M2s42HZpDbCU3KV
         R0ElglRxkp87OpvJY/9O7haC/BokP6iwPXwREtE8SbBpAdHjMZN03GGHnuGmKXdiNdwJ
         geq1ijiMW2HG2ePyrKRMBfm7U8ahqHvGU4x0Cq84fw22nPsCnz9WqjSgZ7JOP1LZz1DK
         doHRphiM0R4D8L+yklIsTf8vA0m15LLTgBfD9IVGN1L71nWwDAA26iH9bMAitkRQWXnR
         Lo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710400; x=1748315200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhzOUPHPxcQR89KFzyoPmVb3NZLFVUAHNHd1Iu0FB1A=;
        b=dH4sCLkN/x8FLuladX7NlIlJX3FNf5/9T7yG2vMNxa8akce3INujd5PagPadDJ1Tg0
         rTEqNwpsdd4Diw9gDjcb668y6AUQGcwiUfUUD9/mj5ROFztCb/L8Ks2XpKaeds83sjqC
         3NQ3TeJg8fqCuOk9keVPHyiePJfveL6zW5DGP7p1ZP+6EaOwjKn1N3iLkdGJNTQM1bDl
         ldf8T/PPjBcYl9bIdoIo1UsXjRu45M7oBXle2SCakN3usacHLM1ZTcH8O8U0QGTHgngG
         ZC7JlAldWayMG3mRgw0vMfI9mXjkhykNWMMJ0l351hKkQ/6w818/bXlc1Kv4777GV/om
         MCew==
X-Forwarded-Encrypted: i=1; AJvYcCUCfE5OZjYCU24eMlmao81+TIHkcu5aAhiWcGVRDyFImDjwSzvCL742kiOXz1RzyNexAdZ3n4hjHGjMpfQ=@vger.kernel.org, AJvYcCVe1cXSSJ4Iv36mB9/wUNQe9pIYvwqDhoz+B16eLKuHQwfd4W7/T/38xS57PtYcXXgBQU1k4KSbxBU=@vger.kernel.org, AJvYcCWfu7zZuoeDa2tMpdA/NdFJPwvSeQyyVrKVaDVq7cXr0bQ+tDbg5ZYQnzmMoA8yGF+c8qFusDTMv1mTPnaA@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqZGYZaPhaJ+yod8UceVvYLKqZ6Y8OXMT40m++uS5EzEcg5dT
	2JqsYNxvviTcpRg24y8cacYDEgqTALqqtZVJ8XxAiVEtphZ2DMuFH4gD
X-Gm-Gg: ASbGncvPu2yH+oPpPrhlqp7rJJ0CEhtmpD4he1UC1SIQQPhy8BHhO0rZV/NWpIwHRuP
	blkDyZfHxcKi6/+l0V+qgIJbzeOhNdNoacpF38vZ7HjjufczUPb22DtEfd/swzq+qAztItzXuw/
	C+7J1eZYWUZHZzkvoUFm8JVjJPnTF2gZOml5nulKzLtSNDyv6UgTi2IeVPyVWmhicKcXxQ3sYIw
	ypn7nYlMH52/P455r5g1Wj9cjh+llNe+wAG56ov+QjMU2xE2ygpX433QUDfObqgUONz9pIwojHv
	OXhDmKusGLXzPsFAgghSiBXSeqIcnY0vhYkWn7qXRqZDD8hvg8hYPc1kPAT/5Z4c9eiL98ea/yW
	4I/SFPLj492XWppY+D1yUUq7R
X-Google-Smtp-Source: AGHT+IHWYUKFxtApFpsecBiJFf+6pr2RKMf5RmMZG99zO1x2G+jQJTuW20B7wqlRYrafOT1UHYCTVg==
X-Received: by 2002:a17:90b:3905:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-30e7d5220e7mr24824561a91.10.1747710400439;
        Mon, 19 May 2025 20:06:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2dc3sm495711a91.2.2025.05.19.20.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 20:06:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1079afa6-72cc-49df-9158-70428fd6918f@roeck-us.net>
Date: Mon, 19 May 2025 20:06:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
To: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
 <a82015f1-0a19-451e-9087-060a1d2c6c4d@roeck-us.net>
 <OS3PR01MB938276CD2B8841B7E76C8B8FD99FA@OS3PR01MB9382.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <OS3PR01MB938276CD2B8841B7E76C8B8FD99FA@OS3PR01MB9382.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 19:54, Shinji Nomoto (Fujitsu) wrote:
> Guenter wrote:
>> This is potentially unsafe if not really supported, which needs to be mentioned.
> 
> Thank you for your comment.
> 
> I will add a note of "potentially unsafe" in v2.
> We are considering installing ACPI power meter on a machine under development, but I believe that the DMI (SYS_VENDOR) check included in the driver has too broad a scope.

Sorry, you lost me. Presumably your system would not be an IBM system.
Nothing prevents you from adding a more specific DMI entry (or more
than one). Many DMI matches are for the system vendor, the board vendor,
the product name, or even the BIOS vendor, date, and/or version. Every
value in enum dmi_field can be matched.

Guenter

