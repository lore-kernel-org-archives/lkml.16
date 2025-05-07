Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178AB2594B7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620023; cv=none; b=H+aY+SEAYVFVf2dLPptHrymgYrxC9X4CojLUACvb69gJiHeN7sfxtdLrrCkMgX/SDzg13WULh8wgeL2E0mZX6lzK6N1sI2c0Jg+9dNj/+0C6th5lvxRDhaOyDxlTCIj20y1TTcONwe9cCmXax8LtPZ9C6COVTMmW1es7uKdHSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620023; c=relaxed/simple;
	bh=u3YGbEuFNryf6SNWwXAZAEVAEqJ9fVFoDM0PMM9rdH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueWzyudFJSxAvDyeE68woGC+78PgRvpGipEkGtP+2idM2XFe8kS2/y1CS/2kTwChQnmHwWLYR6wFBZVIIjQV0iD/Ppq9qnGkyp2sthrLa+nLjgJoPu5lX7SKQqHsr92gPWlmS2wuNlHzKzkri2vRHNyDNs3wBcFboRYZ4qp72/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XzKgwmCr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XzKgwmCr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so10366994a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746620020; x=1747224820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAeRVsznyaBFX32tf0NMNXsCTB91G1fsVj/Eu7YcKtM=;
        b=XzKgwmCr5eP4SnDRYbZ+ORSsN+XQDM5E7ofz2+1e/Nb872dQea2i812h3Y2qYYAX4u
         00Z+1iIXsua0+v54l4j2rMZrhQuJRQMzYjZZjl8q0hAMmK0n/poLRKvrVh1FDQErc0xa
         Rl3+/D7v6uZtXpDE4qoUCxtJyRuSF4EnlO/vU3NSGbIiku+zmqYq1xHtHuraiflHoNqu
         L3GrwvM2uGx5/cg0CuYRnGkXs+ndDIpVgk1tqKn65xt99kjnOFLEKJQ1A4Zs2Hmj8sMQ
         WmMLtSP3lGugkrqlCjdASWR97Ww3eqiQwBx9GMlhTigvVhFNWS4RJZHxEFjEKUNnLwWa
         1pEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620020; x=1747224820;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAeRVsznyaBFX32tf0NMNXsCTB91G1fsVj/Eu7YcKtM=;
        b=jmGI0sSrtjZS17I63xiBBCyJpU7lDR5A9Eco6D4Qt0y8JoUfxa05Y8+cPBH3Gzv+v8
         RLIAH+96csQpRC2CKaFP+jEWUcvqW8Ysjnoh6FfLKj17Ab1kDPq4J1j3r+RK/TgyY7J9
         GWMUbxXEujxDO2PyfVP65fnbnlxTzicpQVg0AQMMj/6tTzI9hCZqWUxLfvnE6AG4usOc
         bTwa+VGvgdycs0LWbuuPi4zHtSMWA9Z7Yo+w695tyiPRaoyZUI5TnwKeEpGPP7z4AbNf
         XmtbjffNz/y0Z11hwx4yLxPIPYwIQmbcPo+SZSypgJEU8Xw2Thcc2NzoXSpffZR0hOI3
         vK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpmkVrU3YdCkwitRBaWPVZLk5VCte0Z95FgPwuE5eFiti5rMHvO+zpTlDhwli1dO5VgHB3ExKqFrQE1XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymNMjd9rpN9fVtu6sbcf1ZmZkEZaarPOObajemL2TnEzuZnFpj
	m3YLWd1JEoYC/1+4jPUHvi5ZCYT3FSD4qz1fZfjF5uW5sZygBX+cVcn2nrttBvM=
X-Gm-Gg: ASbGncsKP7dV4zOdT2svL1O6czSBuuYWXxTA354pWpL0882zrCEdOLQ+e7vamJle4XW
	MCUHqlF/YE+RpTz+Zz/AnYAfp/Hj18tIHAm/Gtga0fmg7IwG7n/7m68UK7gfhUEGV+Je67o8oxe
	Tw9E359ORtpnXnMjzuqO9kR8oUvKajjFKAJOerW4GldtRuwrEqMrM3tPPKmFerf0p70q1Rcb6p6
	/YQh8frSyKnSqOIWjTSPY1T2EoEgCfSoF3kKkS9+xvR3sAkl4dex357u9cvh5XslxRQliTMVQXa
	HJQlpOFb6GpyeKRPko7xN+VajKLAzygA3yLo4NRnNB5FU/jTPw==
X-Google-Smtp-Source: AGHT+IFVO28GoFjiM4/MmBFYIj2KWMjVMmnj6kvNFljtWXD9DM7W466QdZ6gW2Hfuwox4fn3w5Zq6w==
X-Received: by 2002:a05:6402:2689:b0:5f8:afab:9e14 with SMTP id 4fb4d7f45d1cf-5fbe9fa810amr2639140a12.28.1746620020038;
        Wed, 07 May 2025 05:13:40 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fafa166aebsm6000541a12.17.2025.05.07.05.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 05:13:39 -0700 (PDT)
Message-ID: <410d8930-02d8-4c30-843b-7c964a5e08d7@tuxon.dev>
Date: Wed, 7 May 2025 15:13:38 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] clk: renesas: rzg2l-cpg: Move pointers at the
 beginning of struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdW0eKTfh6QsznWvCEeK5w9W-Zw4ORQ8yaevbYgh6+Ub3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 05.05.2025 18:53, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Move pointers at the beginning of structure definition to avoid padding,
>> if any.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1183,20 +1183,20 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>>  /**
>>   * struct mstp_clock - MSTP gating clock
>>   *
>> + * @priv: CPG/MSTP private data
>> + * @sibling: pointer to the other coupled clock
>>   * @hw: handle between common and hardware-specific interfaces
>>   * @off: register offset
>>   * @bit: ON/MON bit
>>   * @enabled: soft state of the clock, if it is coupled with another clock
>> - * @priv: CPG/MSTP private data
>> - * @sibling: pointer to the other coupled clock
>>   */
>>  struct mstp_clock {
>> +       struct rzg2l_cpg_priv *priv;
>> +       struct mstp_clock *sibling;
> 
> I would move them below hw (which contains only pointers), so
> to_mod_clock() needs no calculations.

OK, I'll change it like this.

Thank you for your review,
Claudiu
