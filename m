Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C672B9BB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850741; cv=none; b=AQJL9jwK2yiFI2sG9Gqc/tx1Q/CqyDacqSZjYHX9LF5HVaegtvLI0BzPnlF9IsyafJ3JfNlXAUMpxSCajpSpKlcMlawbYbP9Z6R29LUp2wtY0DMOWd0pe+fvX5a7Eo8RbHX4PzoyIR9FgriI/m+xZVF69neQ76jLrvQsbWuMrz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850741; c=relaxed/simple;
	bh=3aL+YmiC+SS2Eb9QJHfwgiTSyIEZCDR+E6UJpe0GC8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6ARM2H6rV1gVkbLZd8UxX+9+KHW64cYbgMMSnTv1Ul8ieEhDJUW2D1AceO8CzYP6ZntuOY7a9G09S1y2jm0BDVUe66uXMlxsCUxeZqxnTx4tFo6905y0Vd5z9sYB/qxQ5GO6I56bBmHoBIlzcS8fglHmy9/emy/QsiVNU7U3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=iVIrIPN7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="iVIrIPN7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7369ce5d323so138797b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850738; x=1745455538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=iVIrIPN75aV/2wJ6qyHVYqkGtcJ+Al+H4lGxA8aPCojj6yF24i01nkb5q0clWsMGJU
         8FD1WSp+7HMSaX74hDplXiLmFsHEn5TkSFsB7ZFAzEoyvUayohsdKVOsqGD/MUSVWN44
         p/A9ZOFywOgd0iq12kpJTtuqjr1YKh3bve8XkD4GuKhx/naKwWkrCOvz9HBA7cJVUEyG
         Ems1gF57EHSGrVByx3ShKG2mMkBG/D1PUXSof5Fkyfl2JznE2piSc64cJofDnVYa2FYY
         ZhVICHlbrjQFPYwhp15dIvEF33HdBdvjkg+dTyg1cBaR/GofAjL7mLefn2vqlsagdYgD
         59tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850738; x=1745455538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkTqioEDhh+jPgNizGJ1BGNiQAOUU2HAAFBf1hjLXTw=;
        b=UDbHzzPizMBSbmLEYP8HPGx8rrQs2EhDGZZ2yvlHkeJ5GDay2N9cF2vrvgIKV6IqQq
         JIuNrZ4/dKjqUNd8MIaWv38pxhB7n8HNZYVMokutvD21d2puOqv9+wztwXagqSGyYQNc
         A68h527HuZDQD7Iwe3dCLK8DA8flixE6H900JsM28nu+g0BAgEfPPbrzxaz3RVA6QNDR
         AKrxMrIuJCjF2yXzbFeiCJP6CodRboD9VuU4KMaoMGHCuVarvKdy2f1jkIs24q8NhPLu
         YPoLbR2dXHDBaoXsEzAW6x7r1is6RKhbLEfnCPBDyY8wU1Skeu4/4a8gKz8lQPfNVZZ0
         ufAA==
X-Forwarded-Encrypted: i=1; AJvYcCVUmOAUYPAqAQ5o8AMZHzMwOZbMwEOJzxxhDctd+VTwFBeKBYjRFOmIfzpVN8k9yE6M5RnpMDLJfn2bB+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFI/kHlEtf71EaoOttRekIubdmLWjXR8azfcFCnYHi3TyloMs
	tUm2zXERYJwsN/S7NiMiMsrHJ8v0SU3pypiMW68M/wVx9vvJPc/Lg+sHAKy/3g==
X-Gm-Gg: ASbGncvEqrsO67+i9/5lTm58cvBTjVuig3nU0lt7KM6ASCz1JgFJ73gb4qu3bz24HBG
	/32yqGalMlFodXj3tUZ8hxzSmk7xnLbGW/Oj9iYvMToulO39NrxG/B/YT/m0s0ZllPmkwz9Cdjo
	l1n1egnRxiU4x3rE27dxUd3Im3KDwjTk7n0lxWOeEiAksJ0pusMp1UPn5WFJjvjttUkcsLGm/pg
	e7FP/bLte0fWz0xuji7LQ3NrnMLBACR2fsqsxOQR9DiynW9/pcAOaJGKN0LwgzFXpHruFP/TkLD
	5IrOGu/GmjUcNqEx2LFdY4N81b8hFtTvnv42g3XY/c3IRhGxlvZIU4iVgtjfAvPNiB7pOevPCqx
	U/+5z2w==
X-Google-Smtp-Source: AGHT+IG5VFKI1/oUFDSbQtBRp63712CBVsmMPFE97cVbpHoI0iyWGDIaBksLAgKcyTM2pnFkSyJsFQ==
X-Received: by 2002:a05:6a21:3513:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-203b3fbba0bmr5886084637.29.1744850738494;
        Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm11126118b3a.38.2025.04.16.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:38 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/14] staging: gpib: gpib_ioctl: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:20 +0000
Message-ID: <20250417004533.86765-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index e903ec1fe274..2d2a268d8573 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -39,7 +39,7 @@ struct gpib_close_dev_ioctl {
 struct gpib_serial_poll_ioctl {
 	unsigned int pad;
 	int sad;
-	uint8_t status_byte;
+	__u8 status_byte;
 };
 
 struct gpib_eos_ioctl {
@@ -87,7 +87,7 @@ struct gpib_select_pci_ioctl {
 };
 
 struct gpib_ppoll_config_ioctl {
-	uint8_t config;
+	__u8 config;
 	unsigned set_ist : 1;
 	unsigned clear_ist : 1;
 };
@@ -109,7 +109,7 @@ struct gpib_select_device_path_ioctl {
 
 // update status byte and request service
 struct gpib_request_service2 {
-	uint8_t status_byte;
+	__u8 status_byte;
 	int new_reason_for_service;
 };
 
@@ -121,7 +121,7 @@ enum gpib_ioctl {
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
 	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
-	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
+	IBRPP = _IOWR(GPIB_CODE, 6, __u8),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
 	IBSRE = _IOW(GPIB_CODE, 10, int),
@@ -133,7 +133,7 @@ enum gpib_ioctl {
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
+	IBRSV = _IOW(GPIB_CODE, 20, __u8),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-- 
2.43.0

