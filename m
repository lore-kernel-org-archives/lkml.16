Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA61E1C29
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489264; cv=none; b=QT+g4+FWh17y/Y3pHnIyGDlEAC5gMPya+CDlN8cPt3yuXKqNKydJn9bf/Snf2rpQJ0zNVjNpeWqD+hSLZtaiZ6/VMHLfWMFg/TX7I/FpEZHYWuYM91YQKr1G6buPnqBKP5wqhnLfQObuALuuuO/0wExrpwOuXoH+jBTnwbGKDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489264; c=relaxed/simple;
	bh=okptFoCpZUVkqit49dtIutR468BxciG1BqCQRMkznrU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=grRhWgs/j6d2889GQd5SMX249kJ29ly0ZiHLU/E89dYdDaYIOdqqchE9b5lX4imjBxwpkjqXVne7Yg2LbrEwwI/5DGhBPZL9QQMLuCLh1U2kkwzl2C/Lbwmd4QgesYLxpwCA36HujYqSk3CJntFHh1z7EoJuk8AHq2z9r96mnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMMJhe2m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMMJhe2m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225df540edcso114468665ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743489262; x=1744094062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFeN50Tct7m9TPsMIMcX8t/ayiqPwYq+pDcIP7/ikWY=;
        b=cMMJhe2mWP7dJvOkoLHakc1GBU88BRfVOOs8LUyYELWeE/Buzt75VjlVdxpDmUkTPR
         MQ+tPigMWg4JGMBrfvvXnAT/PgRN/12uJg+m5DlIRQpLmPueS5wXH+GkH8OMKtJviCs6
         tyYlI1TLeTFMbKq8D1vIVV9+eNhj1RNJNMjilVlEGAUTWyEOJ9dEyZxZwwfuUvYaafQN
         p+F80AQA4EzkPbzEUZSgydIftXoV2iV9KvRzbzhY6GJA9OiqdDbmId8d1L/g7clCgIgK
         4C3lRLuxmAeHgFKojW4BKnBaXX8aSc1uOmPEdpSKg+jFITe5N7i4sH2kmm/Qe6FjPItY
         QgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489262; x=1744094062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFeN50Tct7m9TPsMIMcX8t/ayiqPwYq+pDcIP7/ikWY=;
        b=f6pG+ET387e9BFgX/eIaht3m/pHEfPIvDgrXjQi7ZsGbY18PyiA0VqMM66pxvNRpUN
         +he/qz4Y+3UM/8gcpUvrUhKlvEximN97qJnBTU8a4sxMAB7TOKYKPrmf8NIX7l7nIGa1
         erfT6iWMl0hCY1wVUMAVXvqLhLmAbQj1/OQTA10LQ3wiWoJirZju3psltbqacNP/WcSe
         jjbqmrGWZKNsdaOdXlFMpVtfkVuoPnC8z6qa7iPkWdE3RYWiopsWLhtuB0MFY+g8/liG
         xqcPCvTnL8MVFomk0bvmY1aXzO+bdhJK4G8bT+DhhnpQIkHBYSx943TTOZoWb4xhmGM9
         H9Kg==
X-Gm-Message-State: AOJu0Yz9+t4WpIjDfJWxWxTndE4I8Ff90uy+7rca4nJZtmbT+cXNcQyD
	aZD+XyL7nSYPmfFV6hUtZi/ccJy/5t6KJ1t4ymHDF0tLoWEck/FbSeAce9Cv
X-Gm-Gg: ASbGncu8kBLCtt1lDCkN7lWbXQwIAE3nhJ8nf7efqNAQgUJVA0GK8quK0KQssG1nEcf
	ZOVB0S0nT9G3+esvRCBMI2cH01NJ3WZQYvb6aPxacDI982cEbH0n4C/lSz5uUoR3uWecEPmarCi
	oFrU33XCXV0+cNN60N2v9mbXIFV7dqkXhWWxA+fHLoRnPvGN8bAjENUTnwmWQori+Nm14y5Q7tb
	E9/+anThD+AULjHb4GCpkHBae+qPISBk3ocm3VnDilD3vpujDRZ/hdEeL6JAXTaV5TA/8+AQWAV
	syptpF2jrUi8fOnHocbpcOlZGAK1yZTBQiFqm9QpvNxK6qY1gOl3RZw=
X-Google-Smtp-Source: AGHT+IEoQzp2h4CGT78zFhacjN0ZepZnshpdoJ5ahAWiyhTV/wanOTdKOOHVq2/eHxMD0YYhpAmJeQ==
X-Received: by 2002:a05:6a20:7fa7:b0:1ee:ab52:b8cc with SMTP id adf61e73a8af0-1feb5d3a07amr23490613637.21.1743489261961;
        Mon, 31 Mar 2025 23:34:21 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:5c0c:4075:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6a1719sm7396609a12.32.2025.03.31.23.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 23:34:21 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1] i3c: master: svc: Update actual read length
Date: Tue,  1 Apr 2025 14:34:06 +0800
Message-Id: <20250401063406.3728534-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanley Chu <yschu@nuvoton.com>

Some drivers, such as mctp-i3c.c, reuse the i3c_priv_xfer.len as
the actual read len. Therefore, the controller driver should also
update the i3c_priv_xfer.len after the read transfer is completed.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..dd520f5d4c9f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1470,9 +1470,16 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 					  cmd->len, &cmd->actual_len,
 					  cmd->continued);
 		/* cmd->xfer is NULL if I2C or CCC transfer */
-		if (cmd->xfer)
+		if (cmd->xfer) {
 			cmd->xfer->actual_len = cmd->actual_len;
 
+			/*
+			 * Some i3c drivers reuse i3c_priv_xfer.len as
+			 * the actual read length.
+			 */
+			cmd->xfer->len = cmd->actual_len;
+		}
+
 		if (ret)
 			break;
 	}
-- 
2.34.1

