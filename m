Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E8822C35B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129560; cv=none; b=cww6553widSKnUdip6359aZLJ+sK1RW70M0KwN5Yc56wT++FIn9fbaTs7HeVn7astuVAU876H2b0tFoNyeEqFGnYEM90SHDsh3NqSx0C+U83EQoave1Mn3Cii2FWjRmr/Jl8Ow+lkKVIoraIua2xpNAwanIDmqY3E4nI3yGp6jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129560; c=relaxed/simple;
	bh=ljFPIOq3znfMAq1hPUQc5glriASqAaiOXMDYR6i6u48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JS45sbOLycaR9pKN+mPgEWe+ObVnPzZd+aFh5tc8Hjxgdyme6JifDswOdTkQkgDi5UNDdbz1Y3zbQPnkqtVpkgObSLaBkWq7xOoswUd8/KC4j+w2DXyDTPhSyOpPb7Oafzp59BPwPRq8USIpU7GSLzkFNGdsgbpkbT/ZsNGGXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYSPj+Ke; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYSPj+Ke"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so4372435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744129557; x=1744734357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFphVcqK3mFE7z2xyqgIGdTaijWdMSkT/C4V2pISyXU=;
        b=eYSPj+Kes8bLRHabUmJ0gn2WrliHC1zORE4e26cCsDtm65ZJ55AZGmUewn8sgUH7LJ
         /gBOs+RBRBeAvS94Yz1NP7RxSJYeu7w6949M0x/uRuYiPUDnis09fpaCARnFQV8eu96Z
         VG2MsepuGlcGlmPCcJEighzg2Z/lXYUikFTz0ttfl8VdAAgx4m69tOBjey5fctaUSjqu
         GvkUBldDd/WQKmOVPIaaSjkLPTw14xeuWnELcfBSCWwYHngXu/d/4LLVZokszjWZcBNV
         X5onQIadAY2tFoWXuh/+8Wg+j9ToOkORTWCRptreCb28gSe3XpzlruKVVwF8NAPZcBIN
         cvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129557; x=1744734357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFphVcqK3mFE7z2xyqgIGdTaijWdMSkT/C4V2pISyXU=;
        b=g0qhGEA6LR065cgG1dygLOkaz8djDxOD0GYNyhzn8OD/RJOD2J15iGZccbNkLSnfgW
         469Mr3Zlt5BbmXaiW2OC2AAJDkuT9vOr76u+CPUurAaw61DD7ZSqfVUIZaBMqC0Ayw3e
         GDVpPJNmO1XwNOoNsJUi4bhJKQTJnBB84suMXKi+7BmD7CBkRnD5z5JVSTiV2yKdnmzK
         f4+W7S8FtxESk0RrOfaqwirJxl2G3Yg5oy1WCICTw412bejnHzYnMwnRuVQhHk1qUuxk
         ABNvWCvKK2XNOdJDWFJCTyQ4HBfEKcU58hPM57uBuTyZpaGwTNVm7cNOoaYSv/xDvnAV
         aZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCUN1PN38bXpvvl+jrExYmxHNArSrX4RMI3l2t2Tr2QswO7F63elzlC1XtaPD/4qDYU0BDWCk1s1Q/CG5r0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HnPzd2OYcq4t9fxVD/SKvTrCbTSTFlArhyFLi1U0Wqhy4xcU
	yxKyojOOaqCuP8dHwOGC1bAJtYqGkvxsi4FwKs6FYCM1fA9frutzUWBxK1G0nPk=
X-Gm-Gg: ASbGnctN0HeCZm7EjHKnx5TuVcK3F9erFwte4nx6YwibgAFYvZ9vcB6ovgBCXIH5uVP
	rU/6P16AqwxPVub4HODr05L18mXDO8g9+E4ny6M2YnuJUVXFjfLkgM1BtILdz4azyZF5/oc9dOC
	58GfpPKNfFs8SV0azsqtJeBgyxGaUAsgREYV5BxjhxkQ7+xnNGYFH4xC2cG142lKnFgdtQliDCQ
	60bYZ5cngkq9rb9Zv5vd/+iY6pcZiQnqQJmje/4+0hWUMzHAGuK3L+O768OpK0UyhbHfXihMw1D
	SQa7/VqNnKTdjfN86fuaAFsKBo7CEP4mBxBThnd0jxpRmq0Z+c3F/7K0LD7rHMceocHpIjcGrA=
	=
X-Google-Smtp-Source: AGHT+IHcjPw7vTVflIx/On2eYRJY4Tq9MrtcT3MQ3yA+ESz6rLfbUvrWYzlL9vvcgtQLsbxNYvAtHw==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-43ecfa18ba7mr56191265e9.6.1744129557114;
        Tue, 08 Apr 2025 09:25:57 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm164763125e9.9.2025.04.08.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:25:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk+dt@kernel.org, linux-fsd@tesla.com, robh@kernel.org, 
 conor+dt@kernel.org, richardcochran@gmail.com, alim.akhtar@samsung.com, 
 Swathi K S <swathi.ks@samsung.com>
Cc: jayati.sahu@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
In-Reply-To: <20250307044904.59077-1-swathi.ks@samsung.com>
References: <CGME20250307045516epcas5p3b4006a5e2005beda04170179dc92ad16@epcas5p3.samsung.com>
 <20250307044904.59077-1-swathi.ks@samsung.com>
Subject: Re: [PATCH v8 0/2] arm64: dts: fsd: Add Ethernet support for FSD
 SoC
Message-Id: <174412955552.86459.1583748766350981659.b4-ty@linaro.org>
Date: Tue, 08 Apr 2025 18:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 07 Mar 2025 10:19:02 +0530, Swathi K S wrote:
> FSD platform has two instances of EQoS IP, one is in FSYS0 block and
> another one is in PERIC block. This patch series add required DT file
> modifications for the same.
> 
> Changes since v1:
> 1. Addressed the format related corrections.
> 2. Addressed the MAC address correction.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      https://git.kernel.org/krzk/linux/c/1d62af229b18bff2430ea5dde0e129d43515e12c
[2/2] arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC
      https://git.kernel.org/krzk/linux/c/ebeab0be707ddcffd2b7f6ff4f9bd8e0c1c49fdd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

