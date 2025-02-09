Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AC169397
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104313; cv=none; b=k8gCeA59gyrZIsWT5sFwk99ufGChYYI7rBRgK1vXcsf9uHFrUEqC40NDn1haZcgo9sZ8CHuR0jft7gEa/05n6Zr5BangQgWnvPdudxLN0/ZIfrV2R2bWfczSzlFe69yfrgPQDsFd9e1qXkBZhqvYxR1hfpqo0qLCX+DVuqHX0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104313; c=relaxed/simple;
	bh=JPRlMDN151Dkg+YWeBexQyF0nH348u8VrvLFjjB0Z+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MJHb5CFv0+GZ+ChFPTkDYOW6p81nQFZs/OMcaoctRFvfj7gf4PMVfxYAyAbYrXpGrV5+J6EBuYNJsTdfWH06ho8lHweINjDUHzB+g3R6VlhXDm4vMFSU+U4wyaZkBJ8jwT2u1RtDOwbhIUssBqE9OnOB+iQGQAmq+otBKEarM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJ2OwCCg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJ2OwCCg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54504bf07cdso1266003e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 04:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739104310; x=1739709110; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8OwQXNcCskyY/XcqMq8DCJkhhtz3Nn5RmLreQUdkXs=;
        b=aJ2OwCCgHNpH/1Yo0xT2nWyc0pJqc70VV2MweEZzOHchlEJ0GUlvgdfBm5ZhUxjF5S
         sOKlZ7PEMebTlvu1v8zKc9T5kBODZeGsanUYK4idkn5aM79M8cr2m6p2sMNgRtnMoHSg
         Os2Bhtf2d2loirznUwqZpthsLzYRDMns2K/wIrRNEaGHuGY+nO6wBQRuanSWFAolMSRv
         RPs59R+S01XTcPDxSyjlhMl5+W/kVLyuJhP1MOPMhjNCopLmRTN2NfiS9Ctsx1WNDMmY
         5wzAkaLY4spVk+05cnBhAONHDvTUjszofL9UcPka2tsLixzmlTikxF+Mqr7oGwLSAXIl
         j8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104310; x=1739709110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8OwQXNcCskyY/XcqMq8DCJkhhtz3Nn5RmLreQUdkXs=;
        b=DjDFLIWo4aR6/IPiUvaY6VxZeMq6Z6BEhYjDhKWqvRgwqI1lDlXTWz+r5ipRUvDKkl
         oVp3mo1MZie0jFBY7WPByZeScom6zevqBuhU0PF9H7jdq3P6JCsijm4GxR8a85rCht9l
         AqPZGKlCpU3+cOLUK/7dwpvYcl4QG9zYjwvWxGZmQvln1wlNXgpX5ozuTqPx9eN0eMEz
         X3aYcvVutEKm8ouAtHLjmMEH5B7bEKCKXTyLBCjGySpsqFNx6hYe2R8ZxU9fGLlcySQ6
         1jZRB/k9COff7ut3Krr/Q6e57Nj+M4BXEJDB/J/cBDILlN34hZ6oTQVI6o8MVenOHe5X
         zCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUGpcOXIZqG28gfw4zlW+SWVsjvQqUQjYLlBLljruWh6Kn1GeTfU/HnAC1p8WB18jx93P/dyR9q3RiJ3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKakEDBf1r+8I5N2hpmOu9aZA6bPedPc2KlabOHLERvQ9BLfsw
	G2kGCtf7pK57WCzxzGGlOuX4kqWxjNp1Hn5D4N7pEDr7H9Zhup5H2IRNPevv9a4=
X-Gm-Gg: ASbGnctK0QT5FMX1axLl9s9aCn/Lxgp2JfyJLnV7kMiWYTAoOeUpg2y6pS4gRRT/ksi
	ytYhaw+IsdvvWNoBPj7ITPpAEASqrR/Qrg9fkQAmTM/4TnYsrY7mWqn8gpJGBJmVpbzxo9iT/Ml
	PuIxNi/7bRWQtlGMZTQ6syQDgDOBQ8KVXWLW+62YgJotEl/6kA8I9GpwqUC4/EOrwFu7tT4n4IV
	FS56CYIykqM0bxgQbyGf6VuSVYma5rOL2xvcTq/LhEagVjSnRkaiG3y+yQdbKyTgTYnv2SPWB3O
	3xnHj1tHX0S991qEvdFMovA=
X-Google-Smtp-Source: AGHT+IG9VQGgn1dQSrhUpsE6NkhCo+Wpv/wilyOFjWVSBoAz9Ke6a+pKBXKXj5RAgrKqVYsYhf6G2Q==
X-Received: by 2002:a05:6512:2251:b0:545:a89:4dcd with SMTP id 2adb3069b0e04-5450a894ea5mr510568e87.45.1739104309834;
        Sun, 09 Feb 2025 04:31:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177d22sm9857271fa.2.2025.02.09.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:31:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 14:31:45 +0200
Subject: [PATCH v2] phy: core: don't require set_mode() callback for
 phy_get_mode() to work
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-phy-fix-set-moe-v2-1-76e248503856@linaro.org>
X-B4-Tracking: v=1; b=H4sIADCgqGcC/3WNwQ6DIBBEf8XsudsAhhJ76n80HlQW2aQVA4bUG
 P691HuPbybz5oBEkSnBvTkgUubEYamgLg1MflhmQraVQQmlhRQGV7+j4w8m2vAdCK0yenJOkzI
 j1NUaqdan8dlX9py2EPfzIMtf+t+VJUocW+uoazt5M+rx4mWI4RriDH0p5QvGa1MPrwAAAA==
X-Change-ID: 20250107-phy-fix-set-moe-d275cff5e27b
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Damon Ding <damon.ding@rock-chips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JPRlMDN151Dkg+YWeBexQyF0nH348u8VrvLFjjB0Z+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqKAzF9RgnLEDOtedtoch71rBg8o4spnfLYoLV
 8W8gNpzTJyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6igMwAKCRCLPIo+Aiko
 1QQPB/9TPgYOCadLJa0Ek5Xo2f1mwy+t1DLM5jGlcaJ9O2MhzU+vUefpGc+XJiuaixKwI81xlk3
 /E+4em+uGkbBCBYBjGXYx+0cF/kq53NHCgZE/Xw9o/ubyfccYpIwzc8ARzJKOchIv2eLBqW6Bib
 QMD/EfNIowPpCR1HUwT3lLd+OsUmafLXl1RQhmY8teG9Yx3aLLln8UpmLFKy6Iw/yK3F3X/vGQF
 /ukq3EzGlP7m7A3xJzSkCBNF/ClDsdUWKemoM8y0T5TjvzGePi2uwrVRQ5iGgU3xNFC2e0NxgF5
 5h1v/ADSFiYKQ8OygrLYi5JhN1GgZFbeM+xVHLzS/tuAtihW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As reported by Damon Ding, the phy_get_mode() call doesn't work as
expected unless the PHY driver has a .set_mode() call. This prompts PHY
drivers to have empty stubs for .set_mode() for the sake of being able
to get the mode.

Make .set_mode() callback truly optional and update PHY's mode even if
it there is none.

Cc: Damon Ding <damon.ding@rock-chips.com>
Link: https://lore.kernel.org/r/96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com
Tested-by: Damon Ding <damon.ding@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed Damon's name in the commit message (Damon)
- Link to v1: https://lore.kernel.org/r/20250107-phy-fix-set-moe-v1-1-b3dfe9391672@linaro.org
---
 drivers/phy/phy-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8dfdce605a905d7f38205727151258af41f807a9..067316dfcd83a6fc8428cddd27d3b7ebfc270831 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -405,13 +405,14 @@ EXPORT_SYMBOL_GPL(phy_power_off);
 
 int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode)
 {
-	int ret;
+	int ret = 0;
 
-	if (!phy || !phy->ops->set_mode)
+	if (!phy)
 		return 0;
 
 	mutex_lock(&phy->mutex);
-	ret = phy->ops->set_mode(phy, mode, submode);
+	if (phy->ops->set_mode)
+		ret = phy->ops->set_mode(phy, mode, submode);
 	if (!ret)
 		phy->attrs.mode = mode;
 	mutex_unlock(&phy->mutex);

---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250107-phy-fix-set-moe-d275cff5e27b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

