Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206125D913
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916570; cv=none; b=VWKbuzfXTdwOsgp/+8zI/NF5ll5iggrh44bi3PbLz9mcg1hiBcD8fFHi5AohZgmzWcVrx3b7XWx3UxG1mwZqG3CDdu5L2s1gTHPXVaRFqZUUUhhdN8i1n64rFr5zlAAh3zHb+hK5T/Mc9X+2u9omcxKIhd5v3npu/TV5ah4mgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916570; c=relaxed/simple;
	bh=qQIdLk+FJaJTOLKosG3vFjdckw+iVeZ0wt9NMsX3AJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjnVfaIlhUkVYoNNOQ6AHWX/skUX6ZYDq6x0nNSzLk72/0tUtvXbMfXDY1ura307ZAmWGLAZC04ou3prk5iUzT4KXNt0jBG9IlKAURLWmdclVoXPDUlvJJS1JCD7QW9+iji3kTh/NcIi+pGKcd7CNWxrJao5l7jCBI+MfCQIYGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7vK1rL1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7vK1rL1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so8061578a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916567; x=1746521367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=s7vK1rL1C1ykAxg8McqfapjcTr4o3AEs93znL6fNn3EKhUCKw7SQbeWawn3jmKI4NE
         T4TB9CFT9AodMPoo/KoTVb/jecQBhLzB7V1Q4mIHq6vqwzOpM8lQ1VUwEw5M3IX+0WiV
         XGq6f1LQsxkyLVz+CHo9xmd94YQ65BFDvWH4RodJLD0WX11QXXlHc2/QZB2lcRvP8Ev1
         +5dJec9ZVdM3ADW49YQlPzrJClVj3RGS4ugo4SWot4TK1JM36OQEZHKd7z8QMsJ8Jb3N
         DYtyNyf2O7eRhrQ8xC09SeymsUIwpbfzdCpg2QBWdpR7EhMTUw9f5Fz5wufLnGlnE6LP
         h2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916567; x=1746521367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ3Du2msqS99gBPXd5VzJGX2ImDSOyuqnj7RIZBT6Dg=;
        b=YZPmimetacEOqTh5B7818afYMz+kyIR98ZKvsqg6IWapRYVGORVMXRsL77hBbP1UBg
         lC288T1RK7KJ2wTriGZ9Yn1vCnzbR9FQ/t/jJQuYT5Ab5dtovnMm8H0jIXQO5xRWk+Ic
         qfIzX6OUxocSDfzjhakvayc7Lh4Chmuk7UfGi7VcLeFlee9DmsBAFZFK/WZYJWsHctcR
         pL0S760tfDdR2yE2zrCdAiak4e2Iv1ssYLqn0VJ+imVy4vI1QtodQ3q1qyRmGzekC5Ze
         ztNhW/GyUoDvXQkEOzcG3sl+G7vyOgqqOjOPJw8kzM/L/q3q4j8eFeaJ3faBswmj14q3
         fQjg==
X-Forwarded-Encrypted: i=1; AJvYcCVdVOtFktLiurUAxrKdnWQdZnNgv/5iCD8vkOCsUpOeK90iqc8AejNQEYgjsbTQlOnKjObkCG2ktCOTOX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWoRoIGumyhChQ7VQB9zSgyPzQLpuDY7wUiuLBS6TkDTCzzs2
	tEEnboQRMRcsKaR/nGGwcFiyCuWAXHMq5FG1YO7iAflbmCxwt86fAjyRbpxwbUI=
X-Gm-Gg: ASbGncvPObXE9jW3Coc/+/xjiNdV5ApGQ9EeTy22OiwXdwxB5xBE0qQriIDQPVJ1g9z
	vSw3IlmgvtG+tIpMrDdgH/wjyBbAfBr+sj8PVnTs2Km3zZ+XrGCJpjj+hvbEAVdze8soY9MmmT7
	86H7vTLVhkyvabs93roljkianW6a2kHrtA+Y4Uw8iMcInpswLh3G4gwEkpRxZdpl+e+emt8PUcY
	DCSrDML8eu5RQzJO1CQpPKDIjbPFT5XTh5c8mCi+AG8Hwnx0bnZ9VsueiA7D72s5m1UxUj1hZUY
	pAr3R7FA9pnOM3Y8sY48czhVtu4UPwyXgKKoDCzB01WHhrbdFpA+xbBXL5735wd6Of0O7BXIRGg
	daXtTOHOy1l8fOPNtLSWfsvUd
X-Google-Smtp-Source: AGHT+IGUOSkbNQi0TijAb91lwptPj1wuZauO4Jmzd3aIvKCh68E4hLv9NlgmiXg+nD07/oJegV0vGg==
X-Received: by 2002:a17:906:6a23:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ace84b55d83mr1224307466b.56.1745916567365;
        Tue, 29 Apr 2025 01:49:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7ec0e6331sm3546619a12.78.2025.04.29.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:49:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] phy: exynos5-usbdrd: FIELD_PREP fixes
Date: Tue, 29 Apr 2025 09:49:23 +0100
Message-Id: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJSSEGgC/x2MWwqAIBAArxL73UL5wOgq0YflmgthohBFdPekz
 xmYeaBQZiowNg9kOrnwESv0bQNrsHEjZFcZRCd0p8SAdN3xKBpTuNEz7Q5TpoT9Iska6ZQxEmp
 cpefrH0/z+37CgqzVaAAAAA==
X-Change-ID: 20250428-exynos5-phy-field-prep-1b3ea73d4773
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

These patches fix some recently introduced usage issues of
FIELD_PREP().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on exynos7870
      phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP where appropriate

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 34 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250428-exynos5-phy-field-prep-1b3ea73d4773

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

