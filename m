Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19321171B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747568026; cv=none; b=QJ0Bby1g1NRWsaEgJDKkk9ZlHibqowO+/eJxWn8lOPeI2mPfDadCAUvWMvPDRtYX59hu60OYtTSGz1ERv3EI7KlK9cWzl1kpaUSx1A5PSaOcGbF/X2YqTFPLAb1Cj7cezGV3T6pGf08mq6qv2POsR3D+MM2o1DSbyQG7BjSlebM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747568026; c=relaxed/simple;
	bh=HiKOzxeOt45QTgKhQrYLef7NcSGu+e/SqcM3but3h/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r98e9ukfRadil5YQ4HDur5u11w5dXbTdTH3XOL2FF87BJUxo05vuspuBid1Ti05cQg5FqVHcALG7San28cda3rdoyyrptX3PFREdQOc5cWYHAUS9vzn+LKHlvFJLS9VCkJDSywuogxEoEPpU0ZKpfpSPbzC4BRtEHYzniQeqhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc5FsHAg; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc5FsHAg"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5241abb9761so1225314e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747568023; x=1748172823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVCyW1p+zUGd8ZnX+1lDj4SV+WumcGrGBjrEJGb8j2c=;
        b=fc5FsHAgEdPcqejE9nLP2TpsGkUVt527kU7++Iv2eQ/xMEpfYjsrn8E80tzTCKeJJp
         ZSTmDtmKlgHM3mYKXkkIJ3LX67OwaqCXvo+BPJ65PjX9NZF6IrRjTRdsuhZgjtocRB4h
         EZ0h4C9lFlIwP1njdM6ueT88eVUH3m0w5lh9il6JSV7lLggeUlFA1X7rdMP5/N9mLjab
         lEi2g75AkUjpM1U2TymZz8et4ufO/q3lTYnLJ/zC7pzFbZ/FaA7sgMYH5TZkDIVlUFrD
         ek2o35hacEIHWGlm/VK0t31EyHUsbqEc/zopXTXI0fNV344kI1bITCnt8NMeOVTTxX4b
         vMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747568023; x=1748172823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVCyW1p+zUGd8ZnX+1lDj4SV+WumcGrGBjrEJGb8j2c=;
        b=vR27d+Z8PXtLaVnLhebkXMeyaFWBqnAiQtUZhpzbdWh6ee85xt1vVayA4xcn3lWWYG
         g7Cc4gRjDwmvyKQCRACpuJXFUJpHGlTsEQNN64y/UDx8oh5eN2+MjAf9cxnDUzRg5hgR
         qclWQTc3TyoZS3tw9CrktcbkIYjf+j5C7P7e4uwhqER3dSaEewY6czjpM0Lv9if0ZERV
         67FyHoEyDPRS0X8IoeTdlTjwWJcebgK9LQR8p41vFs62tethoK4Pi8CqF4/yZI3SOE6f
         7FkQyiNBEeKY1Eys3wPzDyA62yOGOM14IN/m9E7D1P8fg2mhqhyhY7PXvjy/9rn+SOqy
         a9Ig==
X-Gm-Message-State: AOJu0YzLNdf771N/TMcBR4jkZImDbjH2ImSi6LJ+7j+viApBLw76CJMM
	agVJtiQNBLdxVoi8uiSJhQm8Kegxj80I7PqDRQTaAV3FlNA1lkIb0HXP
X-Gm-Gg: ASbGncusNxqOX6gU2X7ShKHBB9KKrOQeC1mbrScGGSc3RM3kzY6sFfobSBxMAV3QVYx
	lVN1Rf3OxErUGw45Cr4AxpEJREsdmOlGLtryqYqkNE2U6O1WrD9Ci5cHJFlsicfOeP66ShFWhHM
	R6FKG71PDoWF90NPF25SbWv7nETPP07hGtduN8HIJCG+C9XwioKDiM5dyA8/bzqg0Ky9RAjsVD5
	E3Uche0a15LZO1jDVrE07CEQaP35XUuiEMLdbFtcBKdnkhBMkGtrRRn4qlaMXWh5CKgK0ZGQmWW
	GC5YTy18y8jZ/qdN5udS8tLJ0AHeOWajFdB6Reqn1dUfJkE+8E58n1n77MzPUl4quakZopd2MuS
	amQotJr4el5kNb8Ss10TW5cDLLPrN
X-Google-Smtp-Source: AGHT+IH53pBVN4QvipvemUUaz6ZOQQiXjb57WHeC8Z/4K6Ho17DqbxRbCOyLWMflRQlj6xJgMVxoHg==
X-Received: by 2002:a05:6122:490a:b0:52b:789:cf93 with SMTP id 71dfb90a1353d-52dba88b0f2mr8203370e0c.5.1747568022688;
        Sun, 18 May 2025 04:33:42 -0700 (PDT)
Received: from Ubuntu.. (syn-097-097-020-058.res.spectrum.com. [97.97.20.58])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba910d55sm5096915e0c.5.2025.05.18.04.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:33:42 -0700 (PDT)
From: Jonathan Velez <jonvelez12345@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Jonathan Velez <jonvelez12345@gmail.com>
Subject: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in dwc3_request struct
Date: Sun, 18 May 2025 11:33:30 +0000
Message-ID: <20250518113330.8976-1-jonvelez12345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

core: Add documentation of "sg" field in the dwc3_request struct.

Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f11570c8ffd0..bb140dde07d6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -942,6 +942,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to the scatter-gather list for transfers
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.43.0

