Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3EA27FB16
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235666; cv=none; b=Gum7cG739ugXagSkYNO++ZpPioBU/M5+F/ECXaSUtw+hqeaLogF/bv75wX/4ifwZ8U/6z6Hq3zjtiqMDO0fgc9YA8hU2ZwuCGGHTg9bZZceqOT7flksDdS1tNj4xiGQOa3jjD3ljFK9+kkqo3KkVbeFCi5M5/oapuc5JwT8XUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235666; c=relaxed/simple;
	bh=elkfuVVvmzBU0/m/g9siAuhtrtmuWD37C1fHEj2Tf9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnBvVl9v2B5g7ykBLYEoILnM3CjbB7P7hCyyF8haEXALPrvoHz6PJZTx8A/WxkTk8mhdop2zkbT9nhpa8Z5HoKTrMqcvMcGQgOAq4gQj0fHiCYBFSsdj4CT/yVPUmdnWLsllf5zqinVbAMwxy8DiRDiNYQx/PW9RBIOvF/JCERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCj48nye; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCj48nye"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so4033603f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235663; x=1747840463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=;
        b=yCj48nyef1QVM7kvzkYsxQGV3AUVu+y6IS5dP1mPRhSr5gfSpsoGUvttco3yWoClkQ
         290W2qEk3iqs54QOJzKB/JcutQ3gvJS81RAUPGKNXycdLE+3BrihiBfbKwYjxL//3rg6
         dZ8mnv8EIaBo3iiSGTUCC3D+yZ/tUUvPqAg5zS0PmFyH9KfMe7Ic3zPqIn4bl5QH34WO
         PSubfYFYcbhNOIoZIfCpq9LxzU1OpuF2/hLCX02WKC743S5REYhP1vC0DUm7NERU88BE
         gyd6jMGvizPDunTAIzD2grY8l8uWNDF+B+YWtYRrnxSw9r2tRaP6nzbY3IJB1TQVbHr4
         VRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235663; x=1747840463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7rIwpEJJDGc7CtGo6cVG0GXhb+M6Aw53qeNCXPJhoY=;
        b=CJr9OUTVIXVMkaruRge1dTQRXgJ3Ou64ppbG8SoojKLewWNfzUMKbfL7VBz3bZ+UAW
         dgGsFQg9iukF6cpLl0DASt1sqKN0Ob7MhNsZqGZZw6icpTgGXCrSiFEptD8hhA4baV09
         UjGd+qrWIfSQ/DwFOYJYhA2k9cE568Rj/ixlEGE2o08w0J5Ebx18YJBQKIqB6WP2cqyv
         Tf0gpF3Yvg692bL+Vpc6fT7EbfDZ4MS5PxMqtvuSBUUG2Lo6L83oRxWA+kWTDiNBe5tm
         mresFbIGcXrcNrZlBsumMIEti6831V83+9aIuujuz3sHaornyXsBNRfPz7t7LqUvT90H
         BGYA==
X-Gm-Message-State: AOJu0YzgU3YpZquvxooV0dWK248EZ50NzkAvGBUrWUm4xCLIagNB6O/i
	Rsi1tuJvYkmxBKaNL0aySSsTPPcm9JCXuv6wQ7LeOGQIMiI0nVPdp562ons1MeAbkmwSzg9dm70
	jS9LeyQ==
X-Gm-Gg: ASbGncuIdQ3dkTL4d/fxEIVUnJ4vaa4wuVWfqv4R8HRdnL9KhDY77mQMIQJjzFuVRWJ
	RUAO3t2jgwRlrTuX6EKDaVRMI2hF/RBFsvPJHfPDSmtXZGrpl9TqU67IcwXTFJE7s/19qLT9Gcn
	pQ896bgRLRsEGOc+LYDHmG98V/w9qKeyG4LmTBte4tZyH+6/dq5+EhrPW/uGFApOeB7Tv4R4x6V
	zJLnvZEHamUP8F587X3y22Ma3Cp8K39KD0E4I7ciIEmMdxSfxWShgKJ9Iw1W6Vinrm4a/KfUtHB
	v0HQHtSCXgnHMs7AlWUenuyEVJFR4eSzWUR9rPXqfopip8FBYJYufolph0ogQq90ii7zf+Hry2v
	ko6FH4zdx2igP
X-Google-Smtp-Source: AGHT+IHUCNtRDjNcYlz0tMRh8QL47NI6YxPvlFXOO6n9TgRhi0jcJ/DCL8LLyZKt4qQ5vfFPhvAP+g==
X-Received: by 2002:a05:6000:2283:b0:3a1:f67f:1bc with SMTP id ffacd0b85a97d-3a3493da42fmr3668225f8f.0.1747235662925;
        Wed, 14 May 2025 08:14:22 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4bbf0sm19697335f8f.82.2025.05.14.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:14:21 -0700 (PDT)
Message-ID: <6c08ff11-cf82-4f8f-8e51-3a3a23399010@linaro.org>
Date: Wed, 14 May 2025 17:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Alexey Charkov <alchark@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/25 14:16, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---

I assume this patch will be part of the "timer-vt8500: clean up and add 
watchdog function" series

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
