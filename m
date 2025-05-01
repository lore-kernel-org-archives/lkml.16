Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836C13AA2E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746111496; cv=none; b=iF41UK8MTwcjonBGKuFJkDwKucZUUfgvDVhelWsjZGLUxr020FnrQaeCuLmuaQXTAaRCWIHxXoF/Esd+QKtJnyA0yTPy1KYcwFHWSQ6ajexMAR+y9Xeba1QmFm+Vi6cFn5gatkUKotXUY2PJ1TF8lSuIWL/W9zKrVU6bgCO6k2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746111496; c=relaxed/simple;
	bh=V1joOFcDKFkUZyg+pcJskQtotFhHWbN6rAFaeiXPBQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLQxrdBVCGshTNDOf2b7wZU5joAiflz6HKciUZ6nHZKKYSxBPAi0YX1ggT3kyUdGD5mwDd7io1m/uxgORrFtSmCSNiVVJwtsHe1WYiScVlVIi0WK9B3cuFHZmFm0WAnXC6+sy0awMBMpOalehEX5GhXR4i78O95rqqllJcbNzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jJRymtAk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jJRymtAk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1464475e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111493; x=1746716293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mLe4zwtnrWwvuhMvKPLaMTBMKnmL/Fmm9gXqaNFuns=;
        b=jJRymtAk8hpMv37IzzaEN6nf6ETbSnf3iAOn172gLkr1Z8lmTPCRk16Xd7yaAihACN
         6GhMxE/iu5LRvWPKmPV9lUOHdBxtzlaSsfhY3EhlyqKX9NOKeRZAx8dYlDhfbgEPK8hy
         7xIuz1WPJPONufb4Y8507c+bqsvAhL+4261aH8gizafgaFFYdkmZWML+7qD64kS5iAy2
         YNk2dEdl4/x1BWFrbl5iuzoovEefuvE5GkTU6ezbUQoUW03dJpBaZZHyhw08AYVBdA31
         x964PUHRdlk4zj1Fcvz+7WTgbgVIZ4EOx0qWm9s9UK5t7Iiw9ou0TVC6vidW30/pB8WT
         hbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111493; x=1746716293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mLe4zwtnrWwvuhMvKPLaMTBMKnmL/Fmm9gXqaNFuns=;
        b=l1gxWv8KPdDvSoddx6mJdMzn35lZIAMzyMKzThbnsIcKCyZEjc8Q3VOzUQJzI/GUEY
         5EHOMuJWC8ShTzxNQLSxvIo7321CwPc5FFRXVX6X2IrRd5uOeN8j/kewjRtydq+ftr54
         6zXoJdhYSjk2bsLbNTgIkm/X1EEWGGMmrXtmwNYIA2D/7PwrdjdWLGf6n4VkbcIFvsrd
         Y7KRhWmivfLzvHhges/tIrFEMUhnR1KDEDgKqvpCu2+M9NSvqeu7SpCVsJClWDIA8KH/
         xBOHw3quGYiYZ9qZ4vHcgMsd9iESj/AC9E6Unsg2Y9Bg5X4kLboAVpIeRbcGLpHPwmUk
         uhUw==
X-Forwarded-Encrypted: i=1; AJvYcCXS0o9plPZZOrQM4c9/+suGqeOasFEnBi6O2pMZ4ft+63TgEW9GvjtulcsKtU7gS7rTmcwWxexR27daaF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymryoFcp3GrV+Le0MAkruBgqRA4oT9EOAUTQcrNSNuRnF+Xgv4
	ybz9AetR+RUzUzJPSuHvK0SUlJKHqmxFL8aqLF9sMik1hBI5Zae71+iZ+l1Skak=
X-Gm-Gg: ASbGncv6ZmtQCFWkH93AzOYI/7UcYWBMFp+0BDQgh8Q4NQgoBsOVLD2lMYYmE3nghaZ
	B3l0bLfUZ03DCNBrj+6NPWNh8PW59RQZz2SEhN/D96gaCKc6qLkN/yddDD4zdJJKOBcm8TAZC5l
	8Z1XTSdJY6A3jpxx+lwyT16OCLCHM1DKxJ2wSGDroB5BUsis/Ej2F8VuS4Lz0h7xTt9TEq+743k
	UlsUMI5IKT5ekqGWxa+a2bXjzgU3FeRdHfFfYMhBOP5BC4aNe0t/XrgCqLn0YSg+dStN2wgInJV
	oXdPzfeKIxi4m/SRzMzNO4H/3ThwGTPPPPfw2px7inbBy4kHcyv9rr1DJNUi
X-Google-Smtp-Source: AGHT+IE/D6xC8le1O8RIb9fBr5CSoFsMdqq+jTUu3+zQ9a1NER+VrlgS5xQpGe3OZ558udjp+hnvpQ==
X-Received: by 2002:a05:600c:8712:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-441b2c6fe2cmr20651945e9.1.1746111493078;
        Thu, 01 May 2025 07:58:13 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ae3f5949sm64687355e9.1.2025.05.01.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:58:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	cocci@inria.fr,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] coccinelle: platform_no_drv_owner: Handle also built-in drivers
Date: Thu,  1 May 2025 16:58:11 +0200
Message-ID: <20250501145810.73031-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=V1joOFcDKFkUZyg+pcJskQtotFhHWbN6rAFaeiXPBQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4wC5ODilBI2dqSAZtfoJY8Ucb1HEWBaQgJTd
 O4ninPAPdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOMAgAKCRDBN2bmhouD
 1/BCD/wKQrQXFoFd9Ii9UwEmJEfWPqPfPd1UwnlDz8CzGrz8tcjmsJZ6X32K9aXTi0bfDJX8lV8
 sGLS3qqx8u0ao4srl4f3VSO5NoK+xN5I/HdOKPhYa7LeG6h32416akBAQjzM5i8Q8CH2h+fzQji
 tOQm5XteKJESr5aslHemi+Ie3X81yjtPGTzoQ9V/dwgRrno64IhJm7oPLmU1cmo3WQg8PrBJZQN
 NPAX9KbP21eQ9AqzeMk1PfQM0jqQxKW8KP63u3CB8jCDcPOsxB7kf4Uq2adqWOMDnyWstrS3v38
 uMRQ6eNqkshh3bQ/pIGaDId8CN142eXLp8RQHTuCNUtHIVjQyr0W8LtSJJTdNzBSB0itUM5k1Qt
 lPBdz4vjayHKNUOr4LrbFvL3ZCopOCRVub7PhdCp8I1W9crBZFkpmqG9v6nlRD39NZi/vt688R6
 WicBsxY8zKhGAKEkH1qla81zwnaQkQCGzDZBqUe5jDkqoEAW2to3okRW+dizsHNI4645s45YT9F
 tlUPoOA1k32jDSfDqSVBU3UIUiPI/E5CBZOSkzuuLJy56IdEqYf6jEW4c/nZgHjAKcHMzQ3nXQK
 nIFVyJzEQAjc99wpL6Kl9ciEirpdxPsGhjj6uvYcvShyxZ3SgcwRYE6nOQJP9vJco0eQBnV/hEG OGcThkzxsjmT0sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

builtin_platform_driver() and others also use macro
platform_driver_register() which sets the .owner=THIS_MODULE, so extend
the cocci script to detect these as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 scripts/coccinelle/api/platform_no_drv_owner.cocci | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/coccinelle/api/platform_no_drv_owner.cocci b/scripts/coccinelle/api/platform_no_drv_owner.cocci
index 8fa050eeb7e5..5e869858bda8 100644
--- a/scripts/coccinelle/api/platform_no_drv_owner.cocci
+++ b/scripts/coccinelle/api/platform_no_drv_owner.cocci
@@ -10,12 +10,21 @@ virtual org
 virtual report
 
 @match1@
+declarer name builtin_i2c_driver;
+declarer name builtin_platform_driver;
+declarer name builtin_platform_driver_probe;
 declarer name module_i2c_driver;
 declarer name module_platform_driver;
 declarer name module_platform_driver_probe;
 identifier __driver;
 @@
 (
+	builtin_i2c_driver(__driver);
+|
+	builtin_platform_driver(__driver);
+|
+	builtin_platform_driver_probe(__driver, ...);
+|
 	module_i2c_driver(__driver);
 |
 	module_platform_driver(__driver);
-- 
2.45.2

