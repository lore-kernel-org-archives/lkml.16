Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C129B23E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916861; cv=none; b=fsh13uiAZ3FBsmD6q6H9yQahYFsII3MZ19/TPYzJSD4P0RseMMuQxsLLiBDFUBIrpMWnlKuZwrFjXVP1PakQJmOBfBwZ9IZkIlwxlyFbMIWfp8plq1fLoVq1V/8qwnaev/Pw8EegyuXK6K9oJ8EckjZ3XSG5+Pe5VDb2Wts6/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916861; c=relaxed/simple;
	bh=hjUS7+lv7mEdO5nqw0NVCgurEghrc60rJTrllIpDBs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8/YkUwpF+rUwSATlxAUmOl7F8jgpgkfXaq9vTuGecvybOqwwJUiBeWt6ehXjgDH4fYBhOTejmYRRAWEuw42E0UYLgZw4hPZeA8w4qq1UMvK61beNR+mFZI5gy57dfp22ItM5Shii+drso27xlnbdkj70I4MK3JDV3R0E/6K27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7eAkQUH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7eAkQUH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so37696395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916856; x=1746521656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bXsC1O65zwEFDNutECfLKHQDmMgv3HVVTgrbBL1zki0=;
        b=H7eAkQUHfpb4A8OqnSPskrE+R+oqaMDTxiyC+XbEVDkuromdsl9Vs4caMY+7Zo6RE2
         fUPAY0f3BKXmFNPANgoFQQzNk3wGN6+wS9LplOXeSDc0I7ay16S/61qiLJeWQK77UVDe
         6GvE0DACShaD4GBaki4+iWV+kSBWUA1al72o+ENhEAxNOm7ncXvrkKksmb6knnzEShkd
         8cBY9Up7Q2CZc6G/ftQiXT+lkaoEeBgCC0YUyXGPAxji+kJfJiWhRYOMefRzGFF/13LZ
         R18f16o1OFNavbj7OvMpTJzIjUWvL/4Y80Isz1tiX1ujI5ytCctRfvJPddS3p609hQSN
         5sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916856; x=1746521656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXsC1O65zwEFDNutECfLKHQDmMgv3HVVTgrbBL1zki0=;
        b=aLOqrraa9lxqKyju/+PIRfrVudob6p/7IxMO3FQ5O+z5EU55GdUL3vEl9drx1OJsC2
         auV4wJ+isg96YFq3pQm55cKOrAy/8HA6g2mU7gdsq2TVqXuem6T30weXpCt8dKVUEmNv
         5v0jnNM0xsol2Kfd+P8IEB4EgYDcbBYBhFuU4bT7M2vLVobvjKAOtpeSKcMlZStI5uLO
         KT9OjZYsHkbC1VnYv6Lbg3V3woMG7EfRkI06uHU1LL0XHO0Vz84aqhla/5UShJNHZxsV
         v7PUxbubjHvYam4BvAr9fiVVYKzrJdoqJMMh6Xm1tq774w0+TiQeLMuPvBM9e7QR6LNM
         BnOg==
X-Gm-Message-State: AOJu0YzPlCzdaEcTKmEbrLnH/F+q0Jq6RkIHnlpB5qDMv5EEouWlCaQY
	giNMd8yQw47tM0pjqkfnvQUba6qPsZlPHENEMnGMBXhwuFIFz5WOu5t/+/tpU1s=
X-Gm-Gg: ASbGncuFVCgiMnNvbeVHU65AjS2h2prOZ7LbHmpLWsiTJr9XPaRFYEMGVDCmW2830dH
	8HGFvnqk8weox464Il9sH+hyuTbbm9atqORs7Djf0c+XGHKMObFZS4zXOnG7Rw2541TiY8NB9kk
	56kVWO2546ANLHRFAx/heySlDJM3u5ZSQfG4JYEW3o0nSXsXFQWnv9GciYxecqD9KZqeHzSS1Nj
	XFjlS0BJw6VsqXgRbxpIIQZtnugEdifrtZNw0lt8TAegL5+EfFCBbFesBTbAd6+LxBDokx6eY9k
	CEG9ZSHJZndX3AoQAWdC5VNCbnZA8+I1fBgM0vGAAXF06xlv7kL+hMjgF22RuM0Tzu9KT9UAI5m
	5Ukk=
X-Google-Smtp-Source: AGHT+IEp1SOZp0eUOdQBhnjykEuSH6woibSWr5d6hjBQoEMUtLvr1eD8OrfatXWpwCc2B0a2kWOx4Q==
X-Received: by 2002:a05:600c:1391:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-441ad4fdb94mr14815515e9.29.1745916856188;
        Tue, 29 Apr 2025 01:54:16 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm148464275e9.21.2025.04.29.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:54:15 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:54:14 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org, S32@nxp.com
Subject: Re: [PATCH v5 0/2] Add the System Timer Module for the NXP S32
 architecture
Message-ID: <aBCTtiAHyJzJPaVh@mai.linaro.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417151623.121109-1-daniel.lezcano@linaro.org>

On Thu, Apr 17, 2025 at 05:16:17PM +0200, Daniel Lezcano wrote:
> These couple of changes bring the System Timer Module - STM which is
> part of the NXP S32 architecture.
> 
> The timer module has one counter and four comparators, an interrupt
> line when one of the comparator matches the counter. That means the
> interrupt is shared across the comparator.
> 
> The number of STM is equal to the number of core available on the
> system. For the s32g2 variant, there are three Cortex-M3 and four
> Cortex-A53, consequently there are seven STM modules dedicated to
> those.
> 
> In addition, there is a STM variant which is read-only, so the counter
> can not be set because it is tied to another STM module dedicated to
> timestamp. These special STM modules are apart and will be handled
> differently as they can not be used as a clockevent. They are not part
> of these changes.
> 
> The choice is to have one STM instance, aka one STM description in the
> device tree, which initialize a clocksource and a clockevent per
> CPU. The latter is assigned to a CPU given the order of their
> description. First is CPU0, second is CPU1, etc ...
> 
> Changelog:
> 
>  - v5
>    - Fixed typos in the comments (Ghennadi Procopciuc)
>    - Added clocks bindings for the module and the register (Ghennadi Procopciuc)
>    - Fixed help in the Kconfig option (Ghennadi Procopciuc)
>    - Changed max_ticks to ULONG_MAX when registering the clockevent
>    - Removed Reviewed-by tag from Krzysztof Kozlowski as the binding changed
> 
>  - v4
>    - Removed useless compatible string (Krzysztof Kozlowski)
>    - Dropped of_match_ptr() (Krzysztof Kozlowski)
> 
>  - v3
>    - Fixed bindings, compatible description and name (Krzysztof Kozlowski)
>    - Fixed bindings filename to fit the compatible (Krzysztof Kozlowski)
>    - Fixed a couple of typos in the driver changelog (Ghennadi Procopciuc)
>    - Enclosed macro into parenthesis (Ghennadi Procopciuc)
>    - Replaced irq_of_parse_and_map() by platform_get_irq() (Ghennadi Procopciuc)
>    - Fixed checkpatch --script reports
>    - Removed debugfs as the driver is not considered complex enough (Arnd Bergmann)
> 
>  - v2:
>    - Fixed errors reported by 'make dt_binding_check' (Rob Herring)
>    - Removed unneeded '|' symbol (Rob Herring)
>    - Removed 'clocks' description (Rob Herring)
>    - Removed 'clock-names' because there is only one description (Rob Herring)
>    - Renamed 'stm@' to 'timer@' in the DT binding example (Rob Herring)
>    - Fixed dt bindings patch subject (Krzysztof Kozlowski)
>    - Dropped 'OneOf' in the DT bindings (Krzysztof Kozlowski)
>    - Dropped the STM instances structure
>    - Use the dev_err_probe() helper (Krzysztof Kozlowski)
>    - Use the dev_err_probe() helper (Krzysztof Kozlowski)
>    - Use devm_clk_get_enabled() (Krzysztof Kozlowski)
>    - Removed unneeded headers (Ghennadi Procopciuc)
>    - Removed unused macro (Ghennadi Procopciuc)
>    - Replaced 'int' by 'unsigned int' (Ghennadi Procopciuc)
>    - Removed dev_set_drvdata() (Ghennadi Procopciuc)
>    - Prevent disabling the entire module and set min delta (Ghennadi Procopciuc)
>    - Factored out the clocksource / clockevent init routine (Ghennadi Procopciuc)
>    - Use devm_request_irq() (Ghennadi Procopciuc.)
>    - Use irq_dispose_mapping() for error rollbacking (Ghennadi Procopciuc)
> 
>  - v1: initial post
> 
> Daniel Lezcano (2):
>   dt-bindings: timer: Add NXP System Timer Module
>   clocksource/drivers/nxp-timer: Add the System Timer Module for the
>     s32gx platforms
> 
>  .../bindings/timer/nxp,s32g2-stm.yaml         |  64 +++
>  drivers/clocksource/Kconfig                   |   8 +
>  drivers/clocksource/Makefile                  |   2 +
>  drivers/clocksource/timer-nxp-stm.c           | 495 ++++++++++++++++++
>  4 files changed, 569 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
>  create mode 100644 drivers/clocksource/timer-nxp-stm.c

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
