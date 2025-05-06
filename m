Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C41474B8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521654; cv=none; b=fb9HQ1CwFmnhie39cmP/sbFgtbzYw1C5M91aPD1qdnJ+wElDGfNtsunJEVHhCrg1PLEoEn83ze2d4J5FfL8Si4Ae2Qg6F4DUEzTyTsy4qslhg060siTyOAAgZU4HHTpsZ6iaC2wl6tC3whWTJXIACfpnwRXXA2WnaVc76O50+rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521654; c=relaxed/simple;
	bh=wkGsbJpTT6NwcQZnaI3cgMwR5wm69KF8kopHqpBUf1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxCORwhUqZtU9eC9CdnjuxLBGT0m6vLxH8GPrJp1OtwGfrpGjxfVXvZcEtG55Vf9+UPLroTA6khK3E88F+jF4NRkUzoB1DZjTmKF+Yaw5mSLXXfee8jKUaBcsYPPzt6KfFLBEg7sIiXuj+iFOmUxWlI8/STBE8EU9mM3eC6T0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iC7tDMw0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iC7tDMw0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso33513825e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746521651; x=1747126451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0cBa9PVs+oAQ53ekJJBPQ5CTxO23NSJ0+4h1zfsmKE=;
        b=iC7tDMw0UUrXGfEBsuAglOz4oP3qzM0WCBQEqda4p5JON9xfvijq/JPLR8dzfA6QPj
         2n40/DoK5E6q1o7xp7NLMhxP0dAAl/p/2fuux743TRozgA8KE7PVOP4vkBY1whqgJeuM
         h6NAqjwe8lP9RFIDpOi4CDOZL2jktZXbmuIA+XNPb1MlV9aa1Y47xRgVtVkLMe606Hvc
         nTywp0ELEsfNjR5V7FsyNbu87Jbs1aT+FrP4jPIyUKhP/nrOdX0qDNdIwtG/KOSkkq7b
         y/aLrUetaYcqw6GfNUsUapKy4ojaKGOJTKSWD1sycHhN2YpwH2LfTUDQlh8d3qmgrAd4
         cMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521651; x=1747126451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0cBa9PVs+oAQ53ekJJBPQ5CTxO23NSJ0+4h1zfsmKE=;
        b=CNtAFFpAjFyCUIuLCyUIbrmklXwW2JxeiCMKUvQAKNmdVfvlEugT68+CjsLzIFqyYy
         ooSgrLUXKdfIFIDXg880MCSD0iBLxVcwI3SMLIgeqe510DNT4f+TwMJsmqwIRKvFdqhs
         0tEj2Nh1AC/wqi4cZBWK+wSWk3M+MZlRVoaMqIL1/YZBOq0n4HWOwhjMq9xu/BiKE17c
         4kN8nNu/aTsehkBzqFIiSjo7hlJyqyaCF0fNXFaJc3hRIcuNKi9sJfavRdz/4JiTpRY9
         OmhHkre7MpfafBSfsnfmxP2UTUHLgcZtaKh2ubDxLSHadcS02SqLP/gPkW+iIoVwWsVO
         8NPA==
X-Forwarded-Encrypted: i=1; AJvYcCXPc8jj1hy8zJsAJGVvzv3gsp6nIaKmsvUCdZHZtsL0FVnCuzOw+KCV/58m4cg1KHC1BlG3RFys50YCW2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YztRYMJIRr2mEupzvUBLEKeT3oAHOAj5foQPQLZtlHhZZ0FQxSw
	isGFTAW+3MYD2dLy33X1GTBCPSONap8BPfuBMDv9RUw7P61aWBJBvicgZEA9l30=
X-Gm-Gg: ASbGnctHMvFBtbrUJV4j2ahTaxvWByp5xhBkVKLTi2BysrjgcgyEju8MLDoh3ksObCY
	IHBmaPNBB7U3GpQkHG603nCzjRVixsGE5CCINFldHtQdzpkY8vibHbI5NPPaLbLPgUqQSy7etlx
	96RYWBlxY7FRUSDVgQXLP0pme5wtJXaufuDy6vofT4FSyNRk7ddUD40tWHh5RNmexS3U2g16Jfu
	zZGSrdMUOHTLboFN/0pUVCprwhH+6iPFuAnseDUNBAF2S/oJo+ae3nTirWG+4CAjbeZVCPxQSg+
	rgtNjsMfOffxD1GIaAl0w+/c0vWmZcKiMYGmvTHOpEQ9LqsMLJ1cgLsK+5GakKSE79K6URJFurr
	t4Rak
X-Google-Smtp-Source: AGHT+IHXEKsH42KRLrEmKISrJCPG8Apw+QWhDI341ouWaA3XrXnmpLIfMz6s/Acz/PZ//Y59wBBHlA==
X-Received: by 2002:a05:600c:1d0a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-441d053b038mr18104455e9.30.1746521651357;
        Tue, 06 May 2025 01:54:11 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441b89ee593sm158952075e9.24.2025.05.06.01.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:54:10 -0700 (PDT)
Message-ID: <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Date: Tue, 6 May 2025 10:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr> <aBjpBpJAIP89oiit@mai.linaro.org>
 <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/05/2025 20:09, Caleb James DeLisle wrote:
> 
> On 05/05/2025 18:36, Daniel Lezcano wrote:
>> On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
>>> Introduce a clocksource driver for the so-called high-precision timer 
>>> (HPT)
>>> in the EcoNet EN751221 MIPS SoC.
>> As a new driver, please document the timer (up - down ?, SPI/PPI, etc
>> ...) that will help to understand the code more easily, especially the
>> reg_* functions (purposes?).
> 
> 
> Sure thing, I can elaborate the comment in the header of
> timer-econet-en751221.c. Let me know if you'd like it described
> somewhere else as well, such as the help of config ECONET_EN751221_TIMER.

It is ok in the changelog, so it is possible to get the description when 
looking for the patch introducing the new timer.

[ ... ]

>>> +
>>> +    cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>>> +              "clockevents/en75/timer:starting",
>>> +              cevt_init_cpu, NULL);
>> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?
> 
> I see that Ingenic does this. This is the only timer so until it's up,
> sleeping causes a hang. If sleeping is prior to CPUHP_AP_ONLINE_DYN is
> considered a bug then this should be okay, but I'm not informed enough
> to say whether that is the case so I'll follow your guidance here.

Hmm, hard to say without the platform. May be just give a try with 
CPUHP_AP_ONLINE_DYN to check if it works otherwise stick on 
CPUHP_AP_MIPS_GIC_TIMER_STARTING as it is already defined ?

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
