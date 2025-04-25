Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F4235345
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574188; cv=none; b=cc7Lt6VXmpiyJWRfW39QGj/a+vdoiSwBpLRBXvc0XVnHP9a3cjiVF0u/mnInjHBzyQt8IxxKpFD43shaPt3GdCOrnrCl8KdFE3GcV5Twt2e9ETDtk9yWQyepXI8s/E9Hyhdh4QdoSINAJsBkUghBw1TThuzYyeoi499ZbcMDpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574188; c=relaxed/simple;
	bh=N+kCgI7u3QRQyEc36DEg7P9HhLeM6WQ1Qz/8t42K2fs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L05IGypB/J9GTWhHuX26J/lT7U0LU7zkrEQ06xmI/fg+a+QgnyIB0mRC2NRWBjcigP0Q9NZAQuBWRLnCPCgodFQCjV0B3gcMEO5F7JaPZcKek0fo5ecv9b6C2qpufItA7EWXVZ8cuE4Eh8I2HwzCdPEi2TfsCVtFE00hp6IJbtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLwfznpJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLwfznpJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cee550af2so1245085e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574185; x=1746178985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=pLwfznpJgeUBXPM7FYv/2FNpPNTyNSQ19k03y+JbaiooF29m9Il2yNht86vOJNVCfK
         l/T29xuUZ4esGZoGOoYWEsskqSuHWikXZ9zvs0kqPno6C1t1TSOnTYVhnx40emGEBOVd
         KvONf8a+cuTF8YVUbe4FpQ6VjIu2XbbALDVKr5ZgdnCGqKvONlM/sL/ZE2Vzq0my0oeA
         z3RV8frmRA5qIfZNKeKqCGH3mb4oO6ftcL5VcVB8a75nWF5erFPDQLZ0Fe6Qvx1HUzdT
         aB4bnHBQuTkIKp4JXAq9nEdR5GwkIC4DPMnqmj2SAQ/4zTzdQDy6GJqSd7VBV8Ucprmq
         s0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574185; x=1746178985;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JNZR4HYw3LEusKe1YuO93jYjF39HJIbe/sxTu0RO9o=;
        b=Mme1ghMBiL+tZJUqbNIMd8KX68uk9f8+AnHKsbrP0Mm5uy6obSidaYblgXA4sDAUzI
         czK7rvW1gGwytnuy5fVjRMxt4aZUfMOl86pTznzhPnZus8vjfFdjXNlxJcmYItdw8r9b
         YbVgHDJCs/x6OPibFKUE98NQh1KVmVbWcWlKDOKrfaJGQCNXM0juucXT4TWTEXS3pvDe
         U1B+8ax/aonqASKZz4BYvZnSN/fyag2L99iCxwGPIBXbKCoJZBbiPSafqfx4jPp92wp9
         F3CmbuKDo+WiyNN0cZrOqMkQKpGDpODDy7ftPHWjaeFBXTcx25eABYFn46iMcu7Ii7st
         8fSg==
X-Forwarded-Encrypted: i=1; AJvYcCVqtXKpORMnpJoUb0ceujwBuznrtVyG7LjSdp96E6zMJUwumwdFOvNNCaZni4/iWJnBcBEq0QFbqgZac+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLhFm9NFgnlfhl9HD19HdjpKvr4Yf7sPQXcWeKHA0ixYhqL//M
	cMUYqiuiAezEFwC4Ihw3Ik1/9KQRfxmqnDqxKQrIIIofHpzmc1UNv5CzvAutLm6DtWrdJyVa7gC
	h
X-Gm-Gg: ASbGncvkBTJjr6fY+5L90F5oylA9UljZ8kM3jp1El3tbeAf70gZ9J3rX1ThsVvXE9cK
	2VUJrXOFtA4PcGEe/FZgt4+5llnNp5jrCcEYQBjTqETCkm+uN8TOw16bQPXxmr+QaXgV+xoXyG6
	X1h+KF4/EJsuMS9079ZQAWoOYw/hvfmSzbnUxSzD3bdHVx3Z0NsOQUZr4s2YON+EYWgRtRaDzLr
	HBP0cpcWHqoCkm/yb4GGYRwUv2LHIZBN0EpfmxY+Rvmo3cKtNR+xsEfw/zwWvyI6+rtGCZuKk/y
	jhOUmGfJqTuOA455pbS4RtiYxEAWtKBheEbRe+p6GW5ApsofxWwi9bQf1mCMpZ0HSNcS1Q==
X-Google-Smtp-Source: AGHT+IHwjCg2l2T8eQ2xx7s1I6SBtEwT1v0ZPwhP4gH8i9QmjjIyMGHi0pgA/ILdNqanVVT9KFG0TA==
X-Received: by 2002:a05:600c:a016:b0:43d:77c5:9c0e with SMTP id 5b1f17b1804b1-440a65b9f31mr5514995e9.1.1745574184616;
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
References: <20250424084655.105011-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: samsung: sp5v210-aries: Align wifi node name
 with bindings
Message-Id: <174557418347.69534.14818406256257839510.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 10:46:55 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
      https://git.kernel.org/krzk/linux/c/e0d7c81b15e8694ebf9f1976084435728b8936ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

