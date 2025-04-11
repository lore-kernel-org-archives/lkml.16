Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65813C3CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381414; cv=none; b=RnxXTu/CfPQ46ZL4hCzNc+Vd4UO6ODkJU4cLQLWxOwQVwlbG+pHes0sZckOWEaBoJKg+GBJCCOs+ONlYPfcYL3k+qWIbDvlLF4PjYMIBOO6+ilG3omGGofDtjRSdAU8aMPitU1kAADqaREYqSf3Dxzq0OQ/LXfZUZKmGr0zbnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381414; c=relaxed/simple;
	bh=eCECi8hvjc4H1yNEulfKYz4kG15vkMiOtptaPhuEBII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrEOEt56qL4CaOLfjyV/izFHNGM194HQooqV8xIv8gNAmYDMHXeVHskuRolTGtDWOdC6C790/NSOngjhSWU3Hw7NlfNocdCAb5Lz6po7iqbW5dzusTpamTVj5aWAAi6zhkOR/MjagueLtJAXG//mW4sjnbOHYdH2mejlvk/U2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fpIBZJkv; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fpIBZJkv"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2d0364e9231so501770fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744381411; x=1744986211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+E7p0o5spFsIl4UEBEn7tp0i54T+KYSkEhlNQklbq8A=;
        b=fpIBZJkvuBUrKHDt3SJTjsUsjm6oT3NqjjrKxKjji2OZ6w4cXurFb9eIUFok0EuNEY
         +fHaJQK44ihm1pnVUEvllql1ikIkvF0JoF2sphj8OiYz6c8q9/kmY9g1imo5hKdeALRR
         POWEagXWKtciU41gTsDXHsIx1gc0SBglY9rG2nGwVRHevwm06VXLfRzrc/yJ/UNGzeBU
         rj25hsD0caqw929A7Va+NeFk7ds9lLjIJJlg4MZv4XFwMEbuc2ZWUm4+GIXc6dGD6zcy
         SSYmXNH82GzUv0gsTxTLlaN2PHf0BDMAfEnXz8q0iQZwY3hXoKvRvRNiY4Q/aJ3hXoL9
         d7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381411; x=1744986211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+E7p0o5spFsIl4UEBEn7tp0i54T+KYSkEhlNQklbq8A=;
        b=crtlmKSaaO6iGztMKUE2FlHtDroRjD/6UKo+tCZdKTD8q320hvr5Z0Wwb6wiHTsm2J
         KxxzJw3q5AufNfEkHvdhlw6kQbWLdYDSPSYTxxldHAYYN/xycJQJkEr2yyUpcngM7foh
         JfrorrrMHchK0sB92cgpNwq86vFgGDzfYAiGhGUtqZVbKqDoD8BmKZGQ8zwmBzhVJWp+
         bbCF/GsOvzROqZq5ataC62ZsZHJy7e4Eyrwf8hRpmj0TLDWWbIjiilRE+ee6GYKqs86Q
         Pnt4px+a79O7HM1SsAqaynZIGteiqrE9lv+Vz8IVJknfCelvIvXJWw+lPjly3lGTF68i
         H1fw==
X-Forwarded-Encrypted: i=1; AJvYcCVCHtVTMM5016x62rPbz22nsWihATMp34LZiDW7q04FR9dpqMylBeH2AhcofGIBRAH6cifX+JDPfARQJ0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBolUohmgTYAtwfScf5KifVKhzUDE9nv8rgLpihSSpbjI86BYw
	aQq1awtDfhAMR/k1r2EbT5mkpn1wWJQGdwawtY3hIq2kctbJwsEncYdnHNH1q/0=
X-Gm-Gg: ASbGncv+S1nbSPo9NleGXmvk7VnDBFMJdcID20h11xftVejD1/LPiXrlv9UB+Fmp1B2
	7Q2g4iOk0ZannZ2dIKljD3CmLDZmxvwfFq9N51X0pAurz4K9LaEB/CYyQ7xhyOOHa8haKfA24Xp
	RjiOs9TRCDdOBdM1+QPf1LretOVvMQZ5rRcLB+wYFa/tEskePE2krdB1YMAVR0fUj3WpIXZODSs
	OHSOKpKkwnADaT1fiyvsEp0MyYq0+HIRlwyefE73oeu2RvF8oNmvv3wMPdeRk09yZIeJlYYAsp4
	K7oEcVMFTlEmDDhFYxWQ3zocWfcJrH0pRLmiK7fUQ+gC1JX/7CVXOOoqvlALvwjm3X8bLl3Q/8K
	rDizd
X-Google-Smtp-Source: AGHT+IFPIaNYuj9Tjx4dRLkT1R8N8HYwjaMapquLcZYIrOm6BqeSxjwlZBr9Pe67U0+m0146ayQe0A==
X-Received: by 2002:a05:6871:a4c1:b0:29e:5de2:cffb with SMTP id 586e51a60fabf-2d0d5d8262bmr1560654fac.17.1744381411628;
        Fri, 11 Apr 2025 07:23:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968ea1c6sm1133431fac.5.2025.04.11.07.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:23:31 -0700 (PDT)
Message-ID: <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>
Date: Fri, 11 Apr 2025 09:23:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support for
 BPI-F3
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
 <20250411140510-GYA22364@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250411140510-GYA22364@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 9:05 AM, Yixun Lan wrote:
> 
> On 21:14 Fri 11 Apr     , Guodong Xu wrote:
>> Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
>> using PWM14. The backlight is defined as a 'pwm-backlight' device with
>> brightness levels and a default brightness setting. PWM14 is assigned
>> a period length of 2000 nanoseconds.
>>
>> This configuration was used to verify PWM driver changes, with PWM14
>> tested and its waveform confirmed as correct.
>>
>> The node status is set to "disabled", and should be enabled when the
>> display driver is ready.
>>
> .. see comments below
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 816ef1bc358e..d04b57ddeb46 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -28,6 +28,32 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
>> +	pwm_bl: lcd_backlight {
>> +		compatible = "pwm-backlight";
>> +
>> +		pwms = <&pwm14 2000>;
>> +		brightness-levels = <
>> +			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
>> +			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
>> +			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
>> +			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
>> +			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
>> +			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
>> +			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
>> +			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
>> +			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
>> +			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
>> +			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
>> +			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
>> +			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
>> +			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
>> +			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
>> +			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
>> +		>;
>> +		default-brightness-level = <100>;
>> +		status = "disabled";
> I'm confused, has DT in board file with disabled status doesn't make sense?
> it doesn't really useful for placeholder, even worse that functionality may not
> verified, so I'd suggest sending along with display driver while at it..

I think I suggested he include this.  Guodong tested PWM using
a backlight on a display connected to a Banana Pi PBI-F3 board.
The above numbers come directly from the downstream code, which
uses this PWM consistently as a display back light.

But you're right, the exact set of numbers to use is dependent
on the display used, so it's better to add them when the display
gets integrated.

The pwm14 node could update still be added here, but that too
might as well wait until there's something to use it.  So I
think this patch can just be dropped.

					-Alex

> 
>> +	};
>>   };
>>   
>>   &uart0 {
>> @@ -35,3 +61,9 @@ &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	status = "okay";
>>   };
>> +
>> +&pwm14 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pwm14_1_cfg>;
> ..
>> +	status = "disabled";
> ditto
> 
>> +};
>> -- 
>> 2.43.0
>>
> 

