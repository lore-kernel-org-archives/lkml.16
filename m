Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A22D0C8C;
	Thu,  3 Jul 2025 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532697; cv=none; b=gY9bmnboK0C4tOmsFynmBpUCXogua5lLhv1UZBDSjnNG2t0thE6ODEInYdncuf87K2xKm5oupObvgYs3aA1YtdYRAO1CRNzDWFwx9mWQVgTVaYkVg6/pXMPgeIzgB7WLsnTR5pnu2efun/ZU5f40eumBi6RsloHqfzyKq7NZGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532697; c=relaxed/simple;
	bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxGMUcEwXx+GqEhWz0j/F02zSXTn7q9/bDOFML3uGSD9jE5ag3RKyP5E8xXqKzEDxSYpPFtnOgEbIO8bvdaHhFJJwmhmq3+iebV4rzO4onDFGc2gS23snvcMFZ6P8Hjxc3qVHHGJwCLTHVgtqRATbEJjSe1LPx7jcSbZcfSlbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1TlZeQW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1TlZeQW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so13028832a12.1;
        Thu, 03 Jul 2025 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532694; x=1752137494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=Y1TlZeQWAOT0fS4xrZ56DJi+WF5+MbZxDMo3s+crw4IjC6wAUAYazzdZbWo+Qh8aZW
         +myxUeQDYuT31DIee9k7d//tiDL1RJBS5r+SWAzBaabhaQ1OQt8cPEkmAqhm8hTpLFNQ
         GhiEHcQ2FrE9dyfmb2TxZpMo5eGWWK7XxvH6w84GYYp7ae/hjngSppuTxB+s6XGJZD3F
         cuktG/oM6NrN7ziFSLfj7yzfcGSxhA8UXA59bJIrfBFiVhZMTBbbZygHarza7+lOYHAd
         11La6Fi9BhMBu2Lz2CjVc2/UfjHc5+XUdWQoZEPr9ynSz3yCrjk9uu6x6K6c8dFKCPVt
         rx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532694; x=1752137494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsCXwqcLxI8cRSOYueVTYtswWbZ6ub7fGgL17jIiNL4=;
        b=nPSgClLZUunGbjr3iiAWQpXC0E6uSnsOtRwGYCMswBmJTHvMNyjTp2+u0v6PRcJerT
         9DNiNDxHMwMsIMtPgZhjOkQqZqyn6Ufr8Tv0o5ZLCP4grUoOzM0qESnNiDoACYwaOCwQ
         oI+icSWU/6eVV/0pDRirM0Oic8jbAq0VRM4V4uRAv3qjfuUXdbQKMxf+7kpCFYJ4Tb2K
         5Eu7hr7qoB5uh9eraqarDMfImhhTATym4svnqywgDNjgn1t5/Ox8bmk1rOHwNRfSBjsr
         NBlvjwFNaho8+tohDQ7gcA9Q3r6cfmJhfU4rYzHFBfEn8Uccugk2ygLmcW3n6vsI3WnY
         TcqA==
X-Forwarded-Encrypted: i=1; AJvYcCXFNDhqmXqAJ0BtuDaC9mm5IBScPXDaNPriHSIbPGDJhxKl981PyEGTUtULf++pl5Zyuvd49fhUH1OY6Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpllS/ZsYDpaQPakwbwo/n1nF3WBrJWk/9dCestgTTk8HBas2
	JUnWv8bJhofTH1W6X+mbjYLcmVpwsjX+81/gSY3x+P3vS6kexR64b9wS
X-Gm-Gg: ASbGncuid4R+CSMh2jKAvu8SVjcA8Y/O7kEc4TrbEMoVWp5fm2qiGRiX7Z0PCJisnbV
	csa7TDi3kVCfbWfeQ8mc0FBMIqzor/iDb/SgCaXQf7eENhFRfjOGF9yo241qIPMhA9eBfxdAMem
	Dd1qe+8b22+kuF5bxr1xo9Zm97Pimw7Z5USc7gwPNY7g2+Uyd7AKZ80SP2+lb26pzIbz0WBXW+2
	gmCElHupBt7BkuC/MOFwPlq5OWnnTKeipRX3TVB4EYuo0SmUehGgPG7TJm9sUvRNFR8oE9I4FRK
	oPGwWRpLZp+sZRpY1+j9jJkSQcZ5JSgQNF0MqR5E4rHg366OobuEplIJScGeOae6oWWrG4/1ksB
	V+1vUdAOoLYs=
X-Google-Smtp-Source: AGHT+IF/15k0UhDJHrTcrKwLdwkzfbrEugE0iaN0gMVkMiQ4Upn4VgFsHeYzGWOfl44lDF56ZG+LGw==
X-Received: by 2002:a17:907:8b85:b0:ae0:cae0:cb35 with SMTP id a640c23a62f3a-ae3c2ce87b1mr512443266b.37.1751532693871;
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Received: from [192.168.7.84] ([92.120.5.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3b94b3b2esm388690066b.62.2025.07.03.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:51:33 -0700 (PDT)
Message-ID: <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Date: Thu, 3 Jul 2025 11:51:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/2025 11:11 AM, Ahmad Fatoum wrote:
> Hello Laurentiu,
>
> On 10.06.25 18:01, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The AIPSTZ bridge offers some security-related configurations which can
>> be used to restrict master access to certain peripherals on the bridge.
>>
>> Normally, this could be done from a secure environment such as ATF before
>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>> domain is powered off and then powered on. Because of this, it has to be
>> configured each time the power domain is turned on and before any master
>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
> Sorry if this has been asked before, but I hoped the cover letter or patch
> 3/6 would explain if it were.
>
> What is the default configuration for the AIPSTZ before this series?

the default configuration is the reset configuration since AIPSTZ registers go
back to their reset values during domain power cycling.

> I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
> changing the AIPSTZ settings needed for the DSP to work?

AFAIK SDMA transactions to peripherals don't go through AIPS5. They use SPBA, which
is why SDMA works even w/o this series. As for the DSP: transactions to peripherals go
through AIPS5. With the reset configuration, the DSP is not allowed to access said peripherals,
which is why this series was needed.
