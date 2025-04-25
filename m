Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FC19F462
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598320; cv=none; b=MzpX7GUrhTiJQ7+85MhyqmbCYJ3OmG7IM/vZYdfsETo2p2ffl+DieAMA9qP83XW2kClemqCjGgcf8CJ2MeNMK0nxoldD2x+isZI+78cGA0D/gN4ResQghD3NfK4FxOBgixT7DKzkyEI8gfe6WNaeU02Na1Ya6n6LljIucqa88kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598320; c=relaxed/simple;
	bh=9KY4pmL5Nw8OZrymj3IItPSsmAsd8hOb7aSbkU2GSg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isDhj6R1YH7lVBhPW9f0Qy81fjqUxEDxJu7prpwDZfS9yZVpH/wa/VxRyv5tOojOQJwQ7CVOkJ/QgMBdtgP2V95XsunP3tVE55ML8HhT0/CO6oRC/owCvMlXpNpGJFa+qfyRQsqH11Fw1X0lm3ywlARM2cAkw0TyWxMjgSrpVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc52YM+R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc52YM+R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso18894825e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598316; x=1746203116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsI18Xf/CHKkah4xJmhEWwgp27gCELl2tJyFlsso9N8=;
        b=uc52YM+Rn28X8kAGgcuVHIeNerf7OGo7/o1kEajzAPIWWOBv5ig/nlnmmIBQwrUR31
         MAThTmkZW9RLYQBWwyGa90sXRKhGEdappGCVOGU1F/iAlDkJj0iJO58wgEnV+dOLXgoC
         T9P4GOBZ0bowaLaAPEU28Jg5aeJjoN2GXNMlmc8LR8XmXxLp2oEbjzpRZMtSbuZjRu/l
         6tLnxjOP7Th8+r3igCpEfNA/AF1mWI40mtgvJh6SOP7foyUEAkDllMYDIVvk9oEfPrC6
         ilRBsvEAlJaKtG1tnlZAoUJLQjWVkE9KwyTGR7H6bzsNUEIDdUiZNTkmtpxX/mOEySnH
         pTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598316; x=1746203116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsI18Xf/CHKkah4xJmhEWwgp27gCELl2tJyFlsso9N8=;
        b=n4jHOkaz2NO13izFpb2hiKC6eeMlk81AfhdvkLb2SZjS7DUDHU7xWUtBdYwWPpNMj3
         zudaJyeIhsjFyLhx3daghLfAkbMNIVwyLK50zU8N97u2jOlW4RKkPg9Z6P3SapqCIb1L
         TOnbBaKSPRyYPOvT1ZYcINWouO8wasNyY2/DswHkiNIEFahzsT29FawnLciRFquKT3HH
         c/CUzXrJOexjAKrz2MvEa+8bnjxmXyU0e4UDuOgEqdatdM+7R286sRoUV1ujqtkAyv0Z
         QR+fNYOsmobJ4U1yUlVve/6Jx/09zVStIWbTgdiUKEd651myistrx4nfNiS2WuzmnkMI
         1/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVso04B9vvZiN+6uy+8JVziLb4c8LhEPveqahIYjqpg2LUbevEavqSvmZeDO/KlT8bJ2nCnsIoI7L7ZoCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3RYvRV9zG/dt6hOhK7xaZ1EAJVVve+X6VfiFwPUciJIDz69C
	YFKlaovALitJwTjtrdDv7UALqp3kdYqTLQ9ihmU0qNWw0ryR2AsH8HuholNkPc0=
X-Gm-Gg: ASbGncvXz8UzdADxePjrl0pckhh5YIWoZjvghPpzBPNOU576ix1wnq2l4w9sOzwSzOS
	i+61gIPfAB99zJbWX1PcHcxpdVU5CyCC2vOjD+0wYcg8VacH+xxfYDKeLfZBTDIvGOc0fHX7Q76
	XA5w9QOyt3mK49JfBg7xipDEaR5T3kcPfY8achaEISJdey7SayPfY5aZ9JElVoigAGSbvncSGY+
	wIgfNmSO4643DMxbhbtTeVz2aLFLr8b+9Sy8fUNQGVFx65jrLx0AuE8oiqndOkQW58tMzi7PLCX
	Tt7831CRdIK4SFQmntfTvthgRsB7bmwNwlCjhmnodyalwACdE8yPh6KNW9yqTmtuvr+DaDrS
X-Google-Smtp-Source: AGHT+IGrLFYdx6vKYFjWnvED+XAvogiWSvHljvBsG1OSHxLwoj0z28dlqV0hZlPGnAXdMIGHsFan2A==
X-Received: by 2002:a05:600c:1f91:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-440ab7b7969mr358875e9.10.1745598316424;
        Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:07 +0100
Subject: [PATCH v2 3/5] MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml
 binding file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-3-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=9KY4pmL5Nw8OZrymj3IItPSsmAsd8hOb7aSbkU2GSg4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dmVolJGY3IhYW7Gcg9Nhq39TSkQzR5G4U1I
 kdh8x/qE3+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZgAKCRDO6LjWAjRy
 umGdD/9bfmKSSmqlfgMWlH2Ru/Y7Kwwcqy0/Hob2kOwXVoDJD0mffgzTklwRpwJicItfbCicGPf
 UpDc6vy1Mzh2ZoabFpfMXzruY3O6VR/2e+9U+zYP4ykQ7TigiXvhtD6btQDyL7N3S6gcGMEuW2F
 sxCWynDbmy53H5oHFLDYgB1HhdwZdpcqtCm1qPZ1iUsWH2isE07cObG1NMllAU4s45yS0VOkmt5
 8LGWM8lJSlmF4VCTJx2JhyPIA3f2feTDwTl1o6GL6Nt6C85DRf1SNF2zS4HgPoIXn5Tw7S+qGRm
 WhGW3YoqhNatxRgKnxSihRoPCWOS/fkbvunitf+c3Hg65Jzj++NOEl8ddrxwUb48WO13NlmE9CB
 qD1JDLLQ1dFO9SVL5dfQDzqoZ9RUmQ+wAEuPVIwfeTKqPA2SllpZzzEJDsC7VgKq4f8KZDZ6Jb/
 X9zCuv/dspPGhlvpJyrt/wMXLXmMfxyebMH49ljvoKH55MGYjee3Sn37mFH9yOjTt8cT/3b5DDM
 M6/SIaQryKCbma7K0qXn5FG7ksju4zhxePGIGKeXDePpYBc7G4QLPPIdR1d87kHWFdDnFy7o9re
 y8yt9IcgibaQPqKYhPXf7U8+Tlckdc09J12kfjLdj/tF5jx6QCjBlChiqu8lOKvFBtECH7llYFQ
 jyONRsOJNxsMKHA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add the newly added google,gs101-pmu-intr-gen.yaml file to the
Tensor section.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131432647dd01f22bbf4bf1c8bde9e6..5b2ec4c2023f39a3dd532ac61f0075a0a1555411 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10118,6 +10118,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.850.g28803427d3-goog

