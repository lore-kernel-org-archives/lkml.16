Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF22222574
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191927; cv=none; b=twk8Ud/FAu5/rn97b4F/ytbPwAT+V/Y/d+PGLZqPx2cqZVNT0/8eVLqmklxiZlrXKkTnUHrHY0ATiCIJ32Ac1Elvqv/KNQNl3l9vJh5BwUSvWbRYKNwQ2VikSFwjJ9q3tUlaQLjzZ0/2fWi9IcZEWeYVobNS6EPe/VNZ+HcB8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191927; c=relaxed/simple;
	bh=vV55kam7n89g+tJ4rn0KN8LW0wJxU903cCYlBxbrzus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tc5NvTiKNjzfy3sRLODrPl2GpIdwXUdwTr097yyda//XnQiZjRzY9em3zjRMMtOfWxsnyEWq1NQtqppj5r6j4m66TEcew+GCOlg9jJYnaJ8b3oMMleZbsZDLPM+figMj057KNPwL4EtrAF/BSk4ca49KCXMPjp+8FCbJbSs78JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKdY4cam; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKdY4cam"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7430e27b2so843451066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191924; x=1739796724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=cKdY4camDS2OqMDEMCO/C/SYIfgfGgISDn16nz32JNJjbUDmYT1fd43kteB7hjr5Sn
         TrK3vSj519TU1G6n/UqFRj0EOtzJujDPv4O4SM3mbkssE8tTbRuComl9QWM9udMAvLyG
         9arzXHQjZED7DlTkHDt2oCKZ5WDWazv0GmWc02/xQyhfNLypWq4ZOjin1OgpdrIxM5wU
         9qm9//KrbtLp2DpTC7Sqq7Zli0GAPV2rSRyk8eJBKpjFrcWrCC13DbRuJZnTmTJN7+I7
         Vr4ajG5QjaZW5mvK5Qn0E1jxmp5xAiRXjzxaDa4wZvugj0PzJqYqxg4CkD42tj7UpTox
         iJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191924; x=1739796724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqD1g4YKIN7d8Jic4AmC6WlJ69pwzDTn8w0IL9Ra7Bs=;
        b=bRqCtUgJlCU9GAekye/hadUA5Qd+F54QhhfpraevGjRGCQAo248itzmR4taEWtCSzt
         nLlD08X2o7DrRRbDmIyHL5Dav9sxTfimtK55rar+GyMNicKQX4IM5hhH5WR2LdmlHn9A
         WSCp/1RP3GJMQCQ+f3CmQE/37ZCylzDwXLIm1YeLzQAivIVwI5yjLhiNBrB+rWaK+dAl
         9XOmFtk5xjxzcWE5mI2ekitFkMzuVsAqw7WE20AlBVrKAmW2EMDK+uY94wC7m5UdOLxD
         Gh4Qd6ukC1ggyd8niKVjK5pdK22SxH3k/YOWUTVEqLCM2o+O2Qx0ah3HpEJNfbWERt5e
         gdbg==
X-Forwarded-Encrypted: i=1; AJvYcCWo3f8aPSo214c/4xydfHDcrBc1F6K6wUZXszSUNdR2wSIDDX3IzMKb5AG9wHngwo23cJA7/5WF2zjQ6jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGt20+2Ii1FgvRGxzmk4Sno69qbrh2X5E2+iTiUJf0C8johKT
	HhVybIWF3pxXZbvCMzYYJbWsyL4WJ33oSbh262PfZZ265VBXB/KJn9IMND6zy7k=
X-Gm-Gg: ASbGnctqaZElR+yat44QTrG4pigZdQktMfkTOg30iKb4yWGJmeAelmR0lWTZzjy8tiN
	lGE67+0YgS40eoxDG7uQG2D0T4bHTJKrIMfBifro8Ix7qCeCxUUr2A7CnMEBvnCzPeP4v1WnFMC
	i8BNrYG44vZOm9xMODU/sgMX47TYBM0pqapSLE8JcZrHfYqt5pBtEJexPORMxZ42ZbF3xaTvoi6
	LCqCzuSKlAI+V7Ij0/Jt4hKTtls4ubA8A43+K1PDqpj5HrL98uzBSqE/zWtDQz5fkpCzbQdiJv5
	2FTwza8nM/Zv7Ny0QPyR9jQdMHyeZS7336HEwJIoSSqwSt7VzMwnmZOYWrsq06iqnTL1uTHMPAA
	=
X-Google-Smtp-Source: AGHT+IEcs4lV823LwIXgoykf1sI1un5zsoFBvpa5yONNWVKm+6SAtdOLZFSfcwD/mDii+zqT48mO9A==
X-Received: by 2002:a17:907:2cc6:b0:ab7:cf4d:9b2d with SMTP id a640c23a62f3a-ab7cf4d9d89mr171928666b.30.1739191923919;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:03 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: align poweroff writes
 with downstream
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-2-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Note: for reboot downstream seems to be incorrectly writing 0x00000002
and not just setting bit 1 (which is the only R/W bit in this
register), so we keep that one as-is here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..86741994bb7c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,7 +1401,8 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {

-- 
2.48.1.502.g6dc24dfdaf-goog

