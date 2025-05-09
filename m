Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAA2206B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788322; cv=none; b=jA0GMh2Kw9tvz6pDwyD0niBHN8FK7gOUyNWz6J6bNq4yG76b+gxmw9aw2ED/taeT7W4R2UxcBA9988T0PREdvkwO4O4waR4TgfweuipZzL+WdH8dtO6udj1N2TEKJ8duc/eKN9G0Za8LG1suNK+YRWZeI4yaP1kibPgGBu+tLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788322; c=relaxed/simple;
	bh=2nk5dPqyhxM88VSx3v0lc2vY03eLZ/CpvYHcyrM+f4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecWq9/wqcERSlibTpWrnZ1R73f1G92cm8vd7U6j46r+63xYXcLUOH/rNSQSjCHnB6RvuC9hYO2fhkt0kGPzWvK2fuAWNL5hPl3jCpApOyqojlmVBDYhJn9DH3onQhN0DYoqVNtQ+2Nd2ZEtuZty3RZNEJm8oZ+We2jPUG9a797g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iEkFmp6o; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iEkFmp6o"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2c663a3daso385244966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746788319; x=1747393119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZbHuHRIDWS4UNIfVAz8PWvS0NgpTKjqW2wDiJXiI4s=;
        b=iEkFmp6oA0+kHrIEOYOlqtVmGVUUGsJ5pw0PcoQM6jye4u+XIo54/kXNrONptCF4aw
         TdwGf8KB5hifwloh/N6mzBnqkw3Mpw9e5+BSEiziHZ9m18WE5z/oGRln2g9Fl7ilC03k
         cOlycibYrDERDw+OHLtPFuaugWoRj5cW5tu9bf7hHBzd1Rq7LxKiNDS/7r/jJIDMYMeW
         bFcaF+6cP9CWGVlIU9/v0MYiTJhsa9ZyF1cCvfjel6KfNAdtLPZtVgBUq3jLNuFHg4im
         bTgruLOU0F5zAZqrPj3Mo9A8RSbUfcd5tyGopggQTEf1NAnHAXTRvWbJzlER+ntNgjm8
         PTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788319; x=1747393119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZbHuHRIDWS4UNIfVAz8PWvS0NgpTKjqW2wDiJXiI4s=;
        b=HGgt/xqBOb2JQIdiKj9CLbwtXvtRHA2U+UPkbnW7dcSwnRVn91VkKMjwLczCcBNE1J
         jCkTpKQw1uMASgAvngicVfyCj4Ua9XkM/1YI1aLxabrUK5/nTqyJjJczZBnoZt2u/gA0
         EVCIpvcMCnmKvYghz0rdf6g6Gr0A8bl1bZc11AXn5v8e1rlCEUGEL228mowbn3MUF15R
         8Qh6e74qo4NNx9Xd8cnn1ynFezVIYo+0jsaIs7lzcjcWKXxMdyM0FzSSj3Vl/cR9ySPh
         ewF67DBYK+EXlLSrU2HXShDS46oZCV9IK398JKaIE+EU7WvTQZh3ElPlIJjVFj+e1GSU
         +y/A==
X-Forwarded-Encrypted: i=1; AJvYcCWRnSn+WdgJdZwK0q/AtmnCV1OSBUx/wpa8YrCES72nrX6tKUruloeWPcFZciUT/0KLpkJV38Tx0wDBWcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxebEh/VmOrKhN0co4NBREWWQ5YmKJ0cAo/ST0TNkfyJxIXVYM
	aByp5SNmUG1vzFCTcFHg1nh/NIto/iOnnmCKLYXcb6zG+I3B3+uzReujkH+/wTg=
X-Gm-Gg: ASbGncvWsnEuuJfBU57nAZYLDi67roQeTFVkBE7Ehdj9ySFL0Pm2SoEeWosKoenf3Gl
	L1SOKleN7UHzwCETk0iccqvej5Nc8P6aYvNw3mDKtVFxw6hXs+XsbZ9LuKqmeMAbBl85Mo8f/g3
	nDEHZB+hVeRkuH4lXnCZ0BSC6v4z9KoTn6tYavR72gNMKuFmeDcm52E3t2PygzN80A2SoVZcg0b
	685i4trPnzApc+Z/3BunQJxKpkHeHl+ASkrLQnAvzb5XhZOl0DwShn0eeAsIWiKOWsQcoHBhx7r
	xKPIUk1jOB6uhAlQVfafSEaO7VlmHTA7BfXgtvKpC6uCTLpj
X-Google-Smtp-Source: AGHT+IE8zKJ0SlPd06ZZ9+XoxKnWzap/lSuxcblf1RpgkOVSS1IxrVf5VthK9xYufsLEWTuocUBDwA==
X-Received: by 2002:a17:907:8992:b0:ad2:16ce:7c3b with SMTP id a640c23a62f3a-ad218f54cc4mr280469866b.22.1746788319022;
        Fri, 09 May 2025 03:58:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746ca6sm132664766b.99.2025.05.09.03.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:58:38 -0700 (PDT)
Message-ID: <8a14cf38-9a7b-462b-80d1-ec5026b5a565@tuxon.dev>
Date: Fri, 9 May 2025 13:58:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 07.05.2025 18:47, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>> module has one or more MSTOP bits associated with it, and these bits need
>> to be configured along with the module clocks. Setting the MSTOP bits
>> switches the module between normal and standby states.
>>
>> Previously, MSTOP support was abstracted through power domains
>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>
>> Previous Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Clear module MSTOP bits
>> 2/ Set module CLKON bits
>>
>> B/ Switching to Standby State (e.g., during remove):
>> 1/ Clear CLKON bits
>> 2/ Set MSTOP bits
>>
>> However, in some cases (when the clock is disabled through devres), the
>> order may have been (due to the issue described in link section):
>>
>> 1/ Set MSTOP bits
>> 2/ Clear CLKON bits
>>
>> Recently, the hardware team has suggested that the correct order to set
>> the MSTOP and CLKON bits is:
>>
>> Updated Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Set CLKON bits
>> 2/ Clear MSTOP bits
> 
> What is the recommended order in case multiple clocks map to
> the same module? Clear the MSTOP bit(s) after enabling the first clock,
> or clear the MSTOP bit(s) after enabling all clocks?

I can't find anything about this in the HW manual.

> I believe the code implements the former?

The proposed implementation clears the MSTOP after enabling the first clock
taking into account that there might be cases where 2 clocks sharing the
same MSTOP may not be both enabled for a particular functionality.

Thank you for your review,
Claudiu
