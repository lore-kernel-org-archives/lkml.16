Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33420371D;
	Tue,  1 Apr 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517530; cv=none; b=VGaNBRBeetgn+JNHZ9LpcFvCM+uc3EqN6tBSeAgDSlYzie6EkoL+znKS6XfGQTKJ13/V9AQKrZISWivsy8k2Otb8ETofFP09JOnIEP6YjIEPDEeqAi48sxh4a/PuzKiNEVavBuKxptFQLGEPNBPOIJo3RAdI5WhsQiQdWTiTUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517530; c=relaxed/simple;
	bh=Arp819bxRknwDeD70osYn6dTlFAlcGvt8KrCRnff2s0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lb6A+Je7mc5XcT1vqqDlPI/1mOw29lIlNrveQ4lPftJMEhYPBfDH+dTQKQOWE6X6fS5ajMZ7hwKJmT+XGCWzWTRCU+UYuUa5ra6o5uC+Hr7dceWuSpxzeFRwsKnGbcJc7LMMoaLKodd1i0QhOoGA44bKp8EUq7JY2WdSqrCN+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJoXH+i9; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJoXH+i9"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2243803b776so37555005ad.0;
        Tue, 01 Apr 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517528; x=1744122328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=KJoXH+i99tWwcgYnL7RUus3LYouTAOAMfpm2g61WyVKwP3/AW6c/OFRHa5/cJ66xMk
         QiKgc1gMAFVVmiJrA84pZnGf08o88otqZQlUCx9QAF4qDiKp559Z4NfsPqQ/0C7h/gdm
         e5rCNocgTjhjTNUR3Gf2nkMELtqssmSpNvXTzHxO1/7fCdhb1qE8cunOaet+OFCwrJaV
         NzMjGkK0hWPT3wUcf8o7pxffxw4/smiOFf7I8QKk1TiONqpEFzJHhP6rQ47avCW1uBEX
         e3SObHC0oq3jNt5M7nvggISNRxtYhk4p0oB6GmsRPTLgYko2QxpPjke/ATJVgjYk7pRe
         MD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517528; x=1744122328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=MTCCtzvp0wWZYr4gs2PgYGrXKz9VEF0QadlwlJVaH3qcRKkTBrnlwhUci0xGSfxfsV
         Z301i0zWtsoGxO6/PCHRBp0nZux5KwPeNwLd8ihqvuqRJtL/JBYxkgrIAe9V+0xbfDbH
         fL9/DpUERlqk/lV19b+ebLAotckvObqZekZeVQkxpIX3Nlx3dHos9oKFS10bLUHkEVf0
         YTO+Rrmx18I5bQ+8avz4PdYnoaObdmc+y0jCQ4wHQuaI5JEP8h8D4vA4YvyrON0X2KiU
         B6r6Jp/t0sY/4OFPnoQpsWLzoZMSdU84R+GGPdhge3ukznzn4xZzJeNPBoyteStt5cen
         iNeA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk7iEnXY05QmBzM8K027dUHhMugNN6F7fzT2oE4mTbYoa9UUeYlBAWdZpsayfcX4ydWH40T7QcaxQadg=@vger.kernel.org, AJvYcCUXJWVK6ViodiZJKsS8Rs8zzUnPZdYu5D40MkXPVgYE3N4kN4dShETG87YCupKpgb+D7lxpKdXv9e58AYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YycASRPyasIWU6PqUT4/ulAcpTNgdKlDOgp5nR42rxCLyJJyuV7
	vMFnQTv5WRtO2YQSZFXy3pDGSHnPn2/8swLqSKGrU93qNIaQWbfp
X-Gm-Gg: ASbGncscADYpkE6+AGpQyw/XtAcl1pSz4Ph7joBsgR/yOZrcLArPSU8LND+Hfih4K5i
	xxhadYCZmXKY3N2juKPSPtB8pnqvwOYcU2nb8Y/9Fslr+YIZBKlKehUAIR5rHKcy7xT6B/zkqon
	ziwXY+1NkP0sWO3KMCvDIX6o/ocIGYxC8lD9Me2zxwTiiNgYWboRAUwkB8swkipaYmgB9JMbLSA
	fr+bewzxDRDTDN7RRph2NvDcjzIOai5jnfhuxtye3SScaw6SwmoTD68VGOcnIdllEGPhAcYlR1M
	skvKUVPxJa/nU3CI5zrcFh7+vCdT9KQ9UPAOnCkQVtKUEI5/YozgdQsROCSO15gcBeCGIOs=
X-Google-Smtp-Source: AGHT+IFV9dBzNcxDUHEuxWuZhPi/1saRFkCoRQug1IzAs4LF+0tMPIs9Zk7YIgX5WGynxkjRbFRZFw==
X-Received: by 2002:a17:902:c408:b0:224:1609:a747 with SMTP id d9443c01a7336-2292f97ba73mr186070825ad.31.1743517527938;
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee22a2sm88704425ad.81.2025.04.01.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Date: Tue,  1 Apr 2025 22:25:10 +0800
Message-Id: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
imx_card_probe() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 sound/soc/fsl/imx-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 905294682996..3686d468506b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -772,6 +772,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].sink =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Playback");
+				if (!data->dapm_routes[i].sink)
+					return -ENOMEM;
 				data->dapm_routes[i].source = "CPU-Playback";
 			}
 		}
@@ -789,6 +791,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].source =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Capture");
+				if (!data->dapm_routes[i].source)
+					return -ENOMEM;
 				data->dapm_routes[i].sink = "CPU-Capture";
 			}
 		}
-- 
2.34.1

