Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B54C2116FB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231060; cv=none; b=isLFDejZkBHNqsvmMWcQKLdnhEwQ+cmc4Uw1cuRVlaQN5O73NoLo29SUUso8PjJ3Bs//ISCGjRly/ffGcbqvMMrZBm4HzkUqXwW1dNLrDQkmn7DzSmWzmf70b969PlHuZBUC8gYkSB0nZWDdLR9gXjVP0dPx9Z4J7jNC91mTGUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231060; c=relaxed/simple;
	bh=FRYJdumBvt44h1y8yqRI1giZ9C7zU9ZUTiI8NmVVxD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbqouJUxw5tbzpeIUz8T6GKuXzcNarX1nBFCFdr85Mo1SzZKmBm1/lm+ZaSTbs/KJHxE084KYDpJtYI8Mrf5+TntE/Br27bcu49GtMkZTZtxoie90CLxtJ/5gT5vKs958VLPu8wW4aVvdygyVt0gen/OoGGKdbZdjDVnK0tTMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MhxjR8Z5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MhxjR8Z5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so17794166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231055; x=1744835855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=;
        b=MhxjR8Z5/q06//YJ3KB2/hrmLfVQ7FQZQ63meWRU/dkJx1GKccFdGqKQiEZ9C5vw/w
         zxvxvxoh1+jdq91kyAnHGD6d+v4F+lB6qQcQfMTmh9Pk302YCzeT3ecIp/F8xomgx9wc
         qVS4XClxCb5KTaN9PaYECKRoReHlMSuP9//6TfEg/5b5bnUUuyadB6PtJiwARWGOrYGb
         rJu3oEU+2YpZ7fvrY+wyv4TMmFfFQz0/DlXEHpzu/CQOOGqG4sVlkMB+JkNKcuZ1apOL
         CtNrTFkuD1ifVjfIKkKBzzDVLduO6diqxbqn5fPPXeIy6Gz6hUkPUocKfimZwSL4+Psm
         3yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231055; x=1744835855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR6tf5HnTdYjHHauL4mMQJSHDwxOZy1mNmBZNfCuxOo=;
        b=lHVPc/8jcxcoI4Rg9KZn8znB/k+31dCLE3y4bhnAT3jwmRdKhp5F6y3fpGVWdXolEc
         bk8JETmPHVEaSKHI4Me6BQH/9H7iDto9vo871GXuGLJtSNiSK3TlUgetAwWJxgWWf6Kf
         1Z5J/RS04GHE0eRFRizjJRUoYWDdBOvdCQLy329YZr+5YgdgV7pL6jQHie+qqvBXH0X+
         hxjRuSod6MhJipwK4gqmfOCO//57z4/SQGxM0ZFWU9q/gN30uf9SEoLr2BU6DJ3is+XZ
         Bk3Pwem/AF2DdL9TZumSGxUmeEIIokwAT1bXTjd3ARGxZL9SIhODXLSZe2fP/XII8wXC
         IXgw==
X-Forwarded-Encrypted: i=1; AJvYcCULPDgHdyYOmL5POm1mQMxTrcG6GSLKvKcZrxC5sdoDtx0aNReEMIV+nlV+qigRM/6FQWsKUXr8MQwyUpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhXvcU852r/Q+QGHcGcG7AZktNoX3VPvV3TSMAHRS1n2PdKLw
	0SM33MNom5U9yznMpjWFdbrbUl9vRXNXsxxRBbJAtR7Yx+G8GUZAPxknyerrzv4=
X-Gm-Gg: ASbGncsavdJnX6RTlIC8vvAcGg6VbWq2fPBSN4eeqBtwqODWvsyYmp5xsoReYLhaoLR
	hEQvV3oe1R/lLcgMD8Urd62y3UFw/ZPk/PGH4zSM2fG6/hF5CyAu54oiiPlPLypvKjbRF8UAQqm
	yVPTZdY6Sn10F1yGRXye+J+20StxD6nOBdgOKFBa6di6GYt1d5zruihMdwEPz7eJrfsoRLJZ/Vf
	FuYdbo8fkrhJPDg3Gn297iQ/W0341HV2ZsxxK823MZbD0Th5lV2R0nu/JveubBxDxEhkWDH/6i8
	DewJNvbD7l5SNM/Y5S12kHxk3SKqGVA0nNbkb5pWUTcHhu8hm4N05UlsypoT5kMrH43UNv0kpau
	J5hiBtPvoRrsGyTwpuxjk52a8WBc=
X-Google-Smtp-Source: AGHT+IEbXN3PVp3UzNwZ49hOGkb6oYJv8K6BHlu1sHCYFqZcbKKwZNoXvZRHV9zk9VQwcQRJgvnNLQ==
X-Received: by 2002:a17:907:d05:b0:ac3:f1de:a49a with SMTP id a640c23a62f3a-acabd4da153mr7965466b.52.1744231055177;
        Wed, 09 Apr 2025 13:37:35 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:32 +0100
Subject: [PATCH v4 11/32] mfd: sec-common: Fix multiple trivial whitespace
 issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-11-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Rectify a couple of alignment problems reported by Checkpatch.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- update commit message (Lee)

v2:
- make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.604.gff1f9ca942-goog

