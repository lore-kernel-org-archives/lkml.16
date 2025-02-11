Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865E11EBA14
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739260918; cv=none; b=QQMenvkA6Qt6ebqL5iP+ES6NiX/mNohsmb1pwtxPXJ7taAGd+w8kBYwcWus6u6D14pJZvSbq6NrE5uhSSAf+zxfB/AJ1JrSxh5cXC1edgkt58VW8yru8U2Rxc2InsBmP9jPscg9PRufQgGtrfFodRHO96UpCdyskhLqZiR/YqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739260918; c=relaxed/simple;
	bh=Sw0h0ERtzCmxJJ3TxQyw6/L/aOVV1cHpVOm3kFwUlRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=br6D0/UjXOVWVs4mcFqj7NZ0mBfwFpmRXhuR9gicAGlcxuok4yPyhERQlyCFbinao4kHGWhMV5+2CcE6e28XI8YQbKvKkNmrP25J3dc+shLRsxXHrdFwq9Mn7WGMPXuPF02QOozP/wsawmyEQxv1sYuOAO7LvtjgFMc7Rr6he8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rybCBnv2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rybCBnv2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dcb33cba1so1909267f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739260915; x=1739865715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1ZHsSsY3ITF+AirWxhJUBVeYzgF2p0gvSmDICW/VDI=;
        b=rybCBnv2pu7ItiVUbpaW1Bdnl/fgigd0fsqN3H9CXS1VMU2J6YNoNTAdeD/2rQwXp7
         XTFGS+ewWQ5t1ZVLqsaPpXAwwmk6HKMcg6O7aP2xINvTc9ioVoX97skkJ6Hi+W8bY9LU
         QkF5jQySeBD4xLfCKwoCIRjRpaDMHC1j/h/YUTUsUwY1l7gdUaTng4SGquaguD/6J/q6
         Zu002iZ6MBfGjkJ/ZepibixQ3OSZGEYV9hDucKk5XZ+5tLGoFDs2SenG6C6qYOSmA7Rr
         R4CVczXTBfS4/+NBwlIebRGti04X953fdd+NRqeKEstbxjJpvvG0yuiBunRe4uZhgx8U
         3Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260915; x=1739865715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1ZHsSsY3ITF+AirWxhJUBVeYzgF2p0gvSmDICW/VDI=;
        b=jXgUoWpRiIagxbw4/3WR8jH8ItBD1BimFdtaf3/teCzKXtW246W9vf8k4JCQaGLZjv
         8LER0OV7eOLzY5Jeu+ok6jRtTECgv5hsoGNMTAa6rLprBR/hhFMP4nHtEN4uWTd1XLD4
         /HXt1hj7pJNH+IkpOoDrNItfR6JNpUmQDCQAY/xz94zjf64ZDY/80wm3mphh9XGTtUip
         qLs7n67vOOIxKIPJ+nuyfDBnIdLvnWdNNnE0KQ/8SCapscbWcgPOl701K/q4bxiZMWB7
         0IhXItxw7sycwb6zHbPQpTcoCkfCP8ltRTFE/eRo6RlA1Ky+kjxIyYNdVV+NfHk1K89M
         zY6A==
X-Gm-Message-State: AOJu0YxY4aAuka/rRvlAtD5zeqr8Gx+7E7R+cwIzU3fNmDWmYJxqCtMl
	vXX0Sp8S9he5MOSyaoW4rdZdw5yZ8CuT5gLS/V32gYWAT35ZfMAX+FiLNn7JdVM=
X-Gm-Gg: ASbGncuanAghsseZpYbHDZ+PgesjFtpKq4GnkS8q7cYOr/IyHFMPK6S+5ksxv7gqmAc
	BaXcTanwqtaQQyhu4jFIBnIOGH2k2b9THfh8IjfUrU8EGrnn2EbF1y5IzVVnXUfNErmuaQ1mbOf
	F0A4Dy/aJaGKdS4HwOOUpepeBJKpjis/QS09rdTZR1hoRWPKrzvDnxxcKRKcNog8g2VjCS/Fu3A
	NplYKb7ApSeGECLu3OqSpF9VnGOGkZPKWXo3rLx+dABETe+QJNBQe29Bj+CaH/07EshsBDX03GT
	lKX+oR19E04KwF6JuTMFn3d1j8Z3X/bnsY0IK4bMUOjOysf6OzvZ4f0=
X-Google-Smtp-Source: AGHT+IG9fJqG7RvHCIV9bGkDY2+Kx+4Q02p4YuSEX8d5F3gH89SWSF5+LvjbXgxGduKOkfBEcOeJPw==
X-Received: by 2002:a05:6000:1846:b0:38d:e411:98c2 with SMTP id ffacd0b85a97d-38de41198dfmr2152183f8f.32.1739260914725;
        Tue, 11 Feb 2025 00:01:54 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dd49d2cafsm8698353f8f.16.2025.02.11.00.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:01:54 -0800 (PST)
Message-ID: <15de0ea2-eae6-4f23-9ca1-15836ec95cca@linaro.org>
Date: Tue, 11 Feb 2025 09:01:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/netlink: Prevent Userspace Segmentation Fault by
 Adjusting UAPI Header
To: Zhang Rui <rui.zhang@intel.com>, rafael.j.wysocki@intel.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 lukasz.luba@arm.com, srinivas.pandruvada@intel.com
References: <20250208074907.5679-1-rui.zhang@intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250208074907.5679-1-rui.zhang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/02/2025 08:49, Zhang Rui wrote:
> The intel-lpmd tool [1], which uses the THERMAL_GENL_ATTR_CPU_CAPABILITY
> attribute to receive HFI events from kernel space, encounters a
> segmentation fault after commit 1773572863c4 ("thermal: netlink: Add the
> commands and the events for the thresholds").
> 
> The issue arises because the THERMAL_GENL_ATTR_CPU_CAPABILITY raw value
> was changed while intel_lpmd still uses the old value.
> 
> Although intel_lpmd can be updated to check the THERMAL_GENL_VERSION and
> use the appropriate THERMAL_GENL_ATTR_CPU_CAPABILITY value, the commit
> itself is questionable. The commit introduced a new element in the
> middle of enum thermal_genl_attr, which affects many existing attributes
> and introduces potential risks and unnecessary maintenance burdens for
> userspace thermal netlink event users.
> 
> Solve the issue by moving the newly introduced
> THERMAL_GENL_ATTR_TZ_PREV_TEMP attribute to the end of the
> enum thermal_genl_attr. This ensures that all existing thermal generic
> netlink attributes remain unaffected.
> 
> Link: https://github.com/intel/intel-lpmd [1]
> Fixes: 1773572863c4 ("thermal: netlink: Add the commands and the events for the thresholds")
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---

Right, thanks for the fix

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
