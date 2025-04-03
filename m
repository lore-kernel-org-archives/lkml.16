Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13F248888
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670757; cv=none; b=k7VAFBg5d8SoYt0ljjzTleWwa8uZTS9KHZja/602DGdR0rtIoCbgqgseHBkITpT+eH7blUyNMaEJsEe2tE2N8L0RyKvmauzYksw7Sv+mbEEC2J1Y6VX9v7C9pO6Afnux6PwYjTisRct5okNl2GrR4c4VjTv+F6mIS1LmczP4M+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670757; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=No5o9aU1Dp6SfmXEel6VxfV0RMSQvHNwioBAksGMaMBk716law24cr4SLxDVa3nvivtYjP4OgBFY9jxYtTf8azsUH5AofVgKOV8xi230aNdbZ07Bbnt1F5WVXuWi8V5l+uSCv++LhPjxQlZJcIfN6MIwUDJQKO9wmEasXXaYNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjHHOqvH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjHHOqvH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1179702a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=AjHHOqvHENCRlXPk94D5ol/0f3FDlfN75O8DcrWoeUFpHApwRG1syizNhakbRO5fd9
         TDldk5wN9yEWwM91+A/7wrcsgtlYWH7NJclHDGw/YCmoqq34vnKJxKf+kf2XGsUvQ4U0
         xiZXtlcQoLA96MXAestzlj1qh/U/HKvumc3cqkvpe9bbs3UUNrR/qHXiqQKOpZjjtGhU
         tfiljiY5j7J4O5kzHSEbShO0vzTEAuvMqPYHpWM8baPIf/a3LCoYpZp9U/SJhxWlT9yH
         sJbeHa2m7EI+TWTyBHbqcp3TiIR+ZiHXMsrV4zLwEbJ3RMyOlU+POuNiyufq7N57pTrx
         Pz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=gU6zGODOPiaEfswR0UUxTk5JxynUZAi7YsCnF05cjOVScUYU0CBa9XEFnUPrfyOrZo
         6X1pEbPajKGcJKd3ptg7qp1AfxPtZyG3AUTyc3uUiHApQLdfiLM4DjyQSiawbHzSva2i
         Hhh6RASD76DaLSrY8aLQ76uNOdEh56LXK4l8u2IT+Vwcy+DAZddJi5XG3hlmCohaUv2x
         3CIYz3mVynerNzgCyiFB3sDoY/WedfyqbX8U0wL3v+nT3fnkhXwX+sf/g6/+19+Kmiav
         WskypFEzwN/eyjBJPIB6nbEoYoRSJ40krqpeGZPota9LSyxRhbbdFYknpth1BbPQobRX
         2rgg==
X-Forwarded-Encrypted: i=1; AJvYcCWolRf38RW9OjkTGY1zNu2tAlnGGm+Y3yNPIC8CwrQElXTEvEXUOGSBGGlrv51w1JpFewdSSfrzrlrJoJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rUFE83+MKPg0NgiFoy2q9pQlvGjYvJBzsdbdM++WiEz4+HD6
	pHaLiDIf/xnal0ZJVri7Nb8VvlDIyP7ARHxlXzNGHDiDeKn64K8UqiTo7v5UoR0=
X-Gm-Gg: ASbGncsknSJZa2vQoaMZSc8lShyx7JCAl1g0ZWmCqqqrAOcB5w7zFcF4Yaq3Tt0srdI
	AP2S10lZFnc31Jz1j7f22GLEE3jnzkc5/tgDThMn6chJQ1eBokIBjXdPu0dpJdW3hFsyMI66LJj
	E4BGHTYoq44TrovbMO59VlIH4DUJggpgAPH6/5dKKB4UF91w7bmOTUH+E2VtqvlAodFVQEJacid
	Be674B4NiJl9LY0TeHEv590syfBi+nLDG9A6MetIEblUOFhDGholAHd6F13DCvtpH0+p+g0O29s
	RzAd9FPJKwA9zuaBefMDq8dPBmueh3Agh8YTBpHM1usfDw1jrwYtd4VgUMbUJlobF0LbznysA2v
	U5DFLwVipoxSdbBo3C7WjjbOkik3n
X-Google-Smtp-Source: AGHT+IF/mj/FrJ8Kxms7tCENqFVdFFdcidKVA2nEXR0Y75YsHneWseB8Fi5sl71j96aNLNBmEO4yJQ==
X-Received: by 2002:a05:6402:2682:b0:5e7:7262:2b75 with SMTP id 4fb4d7f45d1cf-5f087184cddmr1440611a12.11.1743670750284;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:08 +0100
Subject: [PATCH v3 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-16-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog

