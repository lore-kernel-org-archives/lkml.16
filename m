Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15D1ACE0C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151376; cv=none; b=S6pyR7xjwKzpzdzJ8DIU04H+sJdHIaySI1EOnholiA8X6EEHrwK78ZAgeKSQI5BM8xMRUYCluFis+GQOvQBWULH1GPVlcETwMeKdZqDU23vQk15WA7CyCmclG6n92CjpXLTx/pJCUiGHxcNe4rlzEodGJjefQg2a4n12XQwE0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151376; c=relaxed/simple;
	bh=D7zyA+xvfSPVgIkyhp+oaqUj3TbRMXLr6UE39/JJcCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA338wiCAzVxNkcKzGFsHkgk3HMtcE1XYpk7Hrq7C6TO9hjSkWofALoBA/8b3uiIvnJsQRhD5TpQXqH4xiLNGwKyhqHP2r1EDkdc9mw8WrCKAWINXD8nqfjs8B0v1E3zyS1rn2viDzd95oDy0di4M6/Lmop0O4Ho2LqW3+/1EFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EasnDy3R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EasnDy3R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33656955e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747151373; x=1747756173; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l7qg/6GxjFXWiC5kQXeaivvG2EH2dCIS/N7d/lBrQ9Q=;
        b=EasnDy3RaX5zoLCq2YkP6aMIVrLvJl+VuNsRBBWPAviBqSfo+xafnW1svztakNDpn0
         1Nx4iRAPlZR/zLBgM9M+BO9NJXeTeSWZTGxnFFCOxciyHWAPjN/weKhI+bpOKx29zSGa
         4U63A+VMnPIA3uLI3OxUjY7aE8UZAFBDWnqKtVJH9vix8i0IQM+NRLH79d5pqoqw5YIk
         2GPw5iM9skIt9Nut42zAk+MumwVKimtFM4lLcGPsxns8zfoQOBs2uBZPEHp6x1m09q4I
         GiRYY/jTi30nwRPg8r96jueCZnX0vOox4pzs1403MFALzO1I0mYKOmHH8cdgdrJ0pHdy
         n3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151373; x=1747756173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7qg/6GxjFXWiC5kQXeaivvG2EH2dCIS/N7d/lBrQ9Q=;
        b=AgAMj0TxC0qqdPvcalmFYZU2zacBPGaOZIwjYA+0uMMra9sBuckVFmYeD/PT7ajSLc
         8ifYzZEeiNlU9yvbid5CKqFM2YKMKJCgGnEKQMko/8KlxNtmzdlpRy2bbzauAWIus9Fu
         LFg9X0L/kUX2y0MwEG8RRUph1pFu80XWgPOj+Ma4ASqfmuASnawG2HXdCFEMX0AcFl65
         DTUMxKg/00aWMkrD6i7YUpOmSgDXxUddtELBGdxY1RlQ3k2ccmjOge7xQxoR8jyjtGjx
         xR6IB1+JxVj+g+YS2FCACpT5c2bub1OyqN2vsLTR09mlUZYNHbU0n7spQvQ0XN8zvEa8
         T5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9U5ZjN4KlT/6TaNZL1DA+BqGhnH5TyhoxFrGzkWA90ubVQ8HsgkWGqPHAZbOsYetbbb56ajo98iG6Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tzx9rPL/fGZe+z1BvvAfk9PlvWaHfg0E2gkQLv6rCqEkVEDP
	R1oW+iLrhLWViyquq92/Iw/HksTdyBxVRR/7Iuig1doKgbaCQbGQXu+g6e9GPc+FAxbvNYv/lh2
	a2Jp3dQ==
X-Gm-Gg: ASbGncsrfvCaIgdWX4dJDE0DB+rjYeEUiFmXCuaiwRiWqXZbg3Wr0F6yldHkPn11p21
	hc7BB3PZt03+0GixZast5nFR1GU2mDXpKsQpIWwLD+zlMjnqUAM2tpwCKdrPIYVLGZoBNbU20sv
	B8lRtOz7AfQ63uq9a09j5cAKVPJQAmQs0F9BZIa7KQodVCBAJFnNON+RqrKldS8myT2qgiBIdIi
	7UUKOd6lKpz2bCOgHPq79jVwjUQQWpZI9TIsbRD0zQUa2kSGvUVhgYaNLiZY5OzpGdYzUdzoVbd
	aeqyIjU3efylEydpIY4myAr/EpB4YRwhKpI24bAiltLzkVlZGrzNfu33qzsEGNRPKkCWCbEsZrs
	P6gBNwqAD31cM6w==
X-Google-Smtp-Source: AGHT+IGOxH+5gWmbyyxxmGOMrk+23j8sz87XVh50Wr2hHSe2CGZP4m+YqUI33m8XElSElt+cCQlIDA==
X-Received: by 2002:a05:600c:1c8f:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-442d6d11a67mr146232535e9.4.1747151372773;
        Tue, 13 May 2025 08:49:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85bb20sm22789305e9.0.2025.05.13.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:49:32 -0700 (PDT)
Date: Tue, 13 May 2025 17:49:30 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Message-ID: <aCNqCrBqGSxRGMKd@mai.linaro.org>
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>

On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Changes in v3:
> - Added Rob's review tag (thanks Rob)
> - Rebased on top of next-20250506 to pull in MAINTAINERS updates
> - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com
> 
> Changes in v2:
> - split out this binding change from the big series affecting multiple
>   subsystems unnecessarily (thanks Rob)
> - added description for the four possible interrupts (thanks Rob)
> - added overall description of the IC block
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
> ---

The patch does not apply.

--- MAINTAINERS
+++ MAINTAINERS
@@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml

        ^^^^^^ those bindings are not in my tree

+F:     Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:     arch/arm/boot/dts/vt8500/
 F:     arch/arm/mach-vt8500/
 F:     drivers/clocksource/timer-vt8500.c


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
