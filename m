Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA7327F4CF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400169; cv=none; b=hLkLAsOXjW903aSRTqDqo/TLbqc44DtaFuCloV3o4wowQh+yQhG5qtPBNigkxu+SYvsrGAjvRJRgupPN+6Rg/HUJIPMaB7CdUOeW8DnhpW87p5dTmjJsM2qkChSIlkKUUqmuqw7j+YfrsaL/jzgfMcshr4MWLo0/VbKq1jBgwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400169; c=relaxed/simple;
	bh=YWpsO5xUUd8r+lQC+34HlNpUYxi1N7dTXlea29z2cjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZ2VBOZMRkEQuenOgyOYMcteAee5OjNgFRh98HbFlflGIobL9lLDHxc+EUy/fPh7FM5vg+5SjVahrEEvT+vxcbTbHG0F4XQWNJogbFnoscSvfS4Mw8nEIQTXo+iduJHabZW/aZymkUidemwN2qONL8+bY7s/yN0MferQqaNo91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ju8bl2gP; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ju8bl2gP"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b41281b50so69165039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744400167; x=1745004967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8IJA/pmXvNuiKKrx3r2PtlepPD+xmj2yEuRTpmM5lw=;
        b=Ju8bl2gP0mV12mt8bsAgo8oJEj7o9WSc/Fc9K713oROoZXtvxVsveKZW3/74T1VkKE
         QGP0GJEwSMaKwNQY6Bb/kZPm1CQ1w+Vq1Ezt7LYy7SQs12Uvy+lje3GhmjfzALr9FdKe
         1E0nwTdK0BBE7TEDCCsYjDz6UHL+V00CH/p4HomCZPheBZ6xp+moH5UhiEwGKkIRuMPa
         m3bjRlbIwGWzCEQi1mIw6T+170Vkew9P5hgBbm+rV7F+9mFEMzupy4pJYOGB2mMxk8Ah
         WElQHTu4qM2dDVzyitOIgTxa8YTUMLCRpn4Q5E/z40hDlwlWp0/pjuxQ2pzSFvWLF2SF
         gsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400167; x=1745004967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8IJA/pmXvNuiKKrx3r2PtlepPD+xmj2yEuRTpmM5lw=;
        b=NUuRvMHj/dVVJNcUW1vVMnFbpCSedLCCS1sM2/PYev3Iz7+fjgKrVPHphAWAh0eJVI
         1P0cfUS5BX6/km1/9dffTzFsh75btNz4x2BU2VFB5zUJxA4BhXxlO3VYm/Pr9y2lci/o
         wsQb77VFgryJZ5RN6gfIyLWEx03Qg6+h5C448hr+fTD8gUEhSaDiJQxvf/9wId9nNKlo
         PVMISAFK/Xy6hpfbq4oK6cPPSD1ierau1h8HzxlVvyoZhWG5qWa6r3o8LQ4pL/GWVxYC
         kRaUQLwDucnUEHZGN3FK3PO/rFd3sevtAfejwf0PUrjV77jf0WzU66nkXScYlWnHgXB4
         Bwug==
X-Forwarded-Encrypted: i=1; AJvYcCX7+OgZGTWrCPT5yoRbYwMNJ4YqtV5Q8+1Nu9r0EEoCAPkTPJjEVbCg9jIkgbz/1mA6AWulihal44He+cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9DrHj7T4qHixy/UIVitP+97NpEawinSDFHVQtU5qMio1cseot
	1/0PxqfRDqHKJ4RybGQPeNEGPEqIhNr5/dTkX5lH6UB9Ehaq7h8N4nyBRE/PZ3o=
X-Gm-Gg: ASbGnct0xBLj1JYWoDi4FxUDaraySclNs0Gurk67hLGnKiElIf4NftjFvbClcoE5XX3
	hAJO515Us5hALQIOGe2mit+mzh+nyjXfhWkcnSmn3zNKfv2fN6muzCpzqwg4Eo11n9iZrV/Ln4E
	F50MInR6CSBRxhvmcVTMgw9VGXT2qK3OcQD34hObzLNoBTmDmlE3YV/FkskG0dWM+T0AO6c/uir
	mqqaz1HpcHShlrokPpShOXG5dPGU4SJob4+F6BxH7UePZW1f7CHqil7X3BKnaKabxurLOvoEUtE
	gZGeTNU9AUDpwTEdYbOm8U9wGfAn3TY7Hgc2TpN0yNC6C7XbM3WJE2ttei9O4J4ap6pMJ6G35Om
	B1db1rDS2eOY8Voo=
X-Google-Smtp-Source: AGHT+IHpEgSqemBHCC96JM+TCmkYLDtVyLUCKWRb0L7zdDTWhisBDSszCwSCFlcKlvql0c4WxZEtlA==
X-Received: by 2002:a05:6602:3713:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-8617cc3d525mr485687939f.12.1744400166792;
        Fri, 11 Apr 2025 12:36:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861654295d5sm107606839f.19.2025.04.11.12.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:36:06 -0700 (PDT)
Message-ID: <a3b2d0cc-c055-4cf0-9e03-3ea73041642a@riscstar.com>
Date: Fri, 11 Apr 2025 14:36:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] serial: 8250_of: manage bus clock in
 suspend/resume
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com,
 andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
 lkundrak@v3.sk, devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250411154419.1379529-1-elder@riscstar.com>
 <20250411154419.1379529-4-elder@riscstar.com>
 <Z_ltyAO-OBzl0adV@surfacebook.localdomain>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z_ltyAO-OBzl0adV@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 2:30 PM, Andy Shevchenko wrote:
> Fri, Apr 11, 2025 at 10:44:18AM -0500, Alex Elder kirjoitti:
>> Save the bus clock pointer in the of_serial_info structure, and use
>> that to disable the bus clock on suspend and re-enable it on resume.
> 
> ...
> 
>>   	if (!port->uartclk) {
>> -		struct clk *bus_clk;
>> -
>> -		bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>> -		if (IS_ERR(bus_clk)) {
>> -			ret = dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
>> +		info->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
>> +		if (IS_ERR(info->bus_clk)) {
>> +			ret = dev_err_probe(dev, PTR_ERR(info->bus_clk),
>> +					    "failed to get bus clock\n");
>>   			goto err_pmruntime;
>>   		}
>>   
>>   		/* If the bus clock is required, core clock must be named */
>> -		info->clk = devm_clk_get_enabled(dev, bus_clk ? "core" : NULL);
>> +		info->clk = devm_clk_get_enabled(dev, info->bus_clk ? "core" : NULL);
>>   		if (IS_ERR(info->clk)) {
>>   			ret = dev_err_probe(dev, PTR_ERR(info->clk), "failed to get clock\n");
> 
> While the first patch against this file looks okay now, this one inherits the
> same problem (seems like not enought thinking about the code representation).
> 
> Instead of rewritting half of the lines you just introduced (which is also a
> bad practice), add a one-liner that assigns a field to the local variable.

So you want me to re-spin this again so that I use the local variable?

I understand what you're saying based on ease of review, but this
is a simple patch and the change is very understandable, and the
code is no more or less clear when using the local variable.

					-Alex


> 
>>   			goto err_pmruntime;
> 
> 

