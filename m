Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092731A2C0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168660; cv=none; b=Bu/8zxHtc+l/piJJ+HCnLbibEItyS3lHtiyQRb9zt93hVlu3ErQ1gmbS0hyRPuLPgsc72g30hSvAcd7YqRainq19fP9GvJlNYQfqTY2Gdz5BW8Oz6VRnEllJtCZ+IDwqYPPzLhKCcOeNW/QdfLuBc37pgpYx6+0/BNMRXx/l11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168660; c=relaxed/simple;
	bh=rtY22MgptB+tLy3QVxclIgluL35Op8OhX0cRjsl/mJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNS/RvdM6WIX98xcDv5AABTl8RCeyNjMVZzqgYr9ZsoKtRnDUP33mr1UinxKGIf5OT0ryqOKpp3aZ2Ind5+9UIDGRZuC4aKDNEq1be7G59W3KlJH2yWNXwtitJ020rumixdEpXNWTTeqZNbELNcdlvvcIXRo01cGmqUD9eR7EwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udZ7EYqk; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udZ7EYqk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so4138637a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=udZ7EYqkiqCuXbSiRXCMBZmiDe3QWEWva5a3Tl21XVIONFFX3Ga/CUAOfR4oJNO7Fa
         7wvSQQEP23kKdZ+CiLQncc0Gfz7pFq5bpayn9fMgltnzJutksKItUmRbte5hGgJcLA42
         JP/Jp4ERedHbLVmXjXBUgKWzIDu3LWlVxfJnaKxhNrwn/2Lyiu3my9hjnXrkNawzJVrs
         AbT2qJ59MzOKV/fKVGYE6k9fnCN1Om0tsjVSXQcGff3YJS/oU/8brGL1vuPFAx/hQm0i
         b6BKdcme94J24CtPFbz2DioFe4X0kmvZyfxH7HbhsRvhNXAE7RK/Tnar73n0lyB1L2+h
         q1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=U8JZ6kgxUD95cic0cqQRmy4sTgJTKbSvUf9MB6tX1i8+aM8cvehO217m/LY0/f0gmE
         iFhv85khlU0oV3Uq8+nqzlSplwoFG60Gi65e57yr+/agnJKvUrR/qlUH8vR4zZGYQjkQ
         dXS6D6BDHSEUTZ/iogExvScBBOTwtFMobLN1lSMHX8mbIDPRaDQwfeZ3TnZpYDj6ti0h
         Tv0Zr4aLZGqElgE/xJYZllPqJzHpyty5WbocX4CJfVmab+6HinVN9mbsS4KnYWWdTrfA
         p9GPtCWjkzZmetzHAQ5moGC5RmPSXp90TzFoAENYjzN4GZBTGrgRcN0yDGbINSNrNrlL
         2JMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzR4ozDU+IWpgpQSbRXnsKf/6v9lDwqhxBMP60DTlLaexH5ILc9DnzyZPD0ZkMCKphVmd97R0i+SXmZp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkg50ETZG5BCNaoFss983uCffV5HYsMA0g8uqt6e1bAwKZlV7A
	1K6r04dNJHNmcUPKFJEt6ZC+T4NYfksuZWgoMbOKv96k3IlGGBDHkpZ00vYL15r5xKCzlA5+S4c
	uQWs=
X-Gm-Gg: ASbGncslmbiwgvLVt75SDgo3YQ89b0yWZOCvT2O+gc3Rlo+F1yloLCSBEmuby5hRxae
	2WTHbXbT4QEtuG97F7MHSgUmIBS49eKz0ja73W3PBJMK8BykxigW6Qf8zFyZPAurh3TQ+dkCCRs
	P4g6pZBABBKwcn5svDIXl+F0fBkbSpN9kekMLhKYqr3OpnP4NVhxNgQWvbSHaIUolORug7/A0x4
	P4vUpDR1kwbvfpV8BCRN2xQ3tcTkkXSfL9iBTz+2G2HN7yEIdolOCxXylH1m99qk+sefD4Uginq
	y8OEGNLRQly4jFFhqhDCJSuEjUjyl2YSRNf7TjqH5X/qz6ynjRPIPIknZjPcaj1DyEfbuyXQmWD
	orGiKSKgi1/GXY7h5myhF5dgJJ1C7hcasJg7hImY=
X-Google-Smtp-Source: AGHT+IH35FaKYo+gSI6anwiHIjdD3ef6MXj/ihpM/TgWINmZ8ShobAVb92+tkqSJyQ+wsMpl6rBS1A==
X-Received: by 2002:a05:6402:51ca:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5ed8f9027ffmr7884197a12.27.1743168655554;
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:50 +0000
Subject: [PATCH v2 04/32] mfd: sec: drop non-existing forward declarations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-4-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog

