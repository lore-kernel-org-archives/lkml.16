Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B21DDC2C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852394; cv=none; b=df+lqm3QbpmzyARzZaoOy2QhjugCX9VcC8egeDEmN/7L5QxwrexH/vPz0N1GEH5ZSFS69451Gx8DFM1eIELUXB5/wgUMUNckYZQH+NbQWVKm8eZyZ5DPS6M9g4whjcW2wKWQu2VCcPVq5M0zdk2kLa+D/GQIMJthDOKVdA2/bWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852394; c=relaxed/simple;
	bh=vkROW2u2D0f4zc8RaZipeWN/JClwzcnOUuYkuWoJr78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhfxzzyfwixMH9puRuk8RBp1qYEL6M89YXlVgHH8vax/WtNi4+4c7guM8N5naZ00JqVoVInBiSV6l2r/NyrpAbtRZb6ycsb9c3fzrbf7JorB5o05gaGwcgHWbqD5Er56PxrGTJ00hEcg3KlXHA6c8/TzPQHr78QExIOTmqx8uDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oaw9ldmZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oaw9ldmZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso26496675e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852391; x=1744457191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGVLW6VD3LfApVXQnt2cnSlmWF36fozhM+r3buwa35M=;
        b=Oaw9ldmZOI48ugmJ5LvtHGRkkOLCDc5jNgJIO/Fb8PlXyhl9lqCH/YDGYquBpS3mOR
         /VjWfgiV1wKnI2LC+wwRIpLEJl3PGyJZnGIF7h+zIwqLnf2jxk6eWxsR2SU6zteWMwE9
         VkeLwtKlEsaWGeW/MlfdUr/hf1cG1duFgRXfv5jbf9Fd3Qu66sn8GDHaFjZNzAYWqOvM
         e/6La/NqMVBIfB9aCcEHTqKyHFpZXTpvfTwxjd0M+7cmKQ+e6NfNIWwlplmP0EO6PVja
         sZI6nDNRJvg9enRHd6QnGIZ14QTg5RGHxW3ic0in0fGPiE0yizvc1g51DD86ems6Y+jO
         4CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852391; x=1744457191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGVLW6VD3LfApVXQnt2cnSlmWF36fozhM+r3buwa35M=;
        b=UwyiBYq0jMEAB+On288vURFczXZcf74X0Mxx0H+qD+iR1mtST+pwSxxmg9vFTyM/hF
         s4GWn+VeYgARxCYUMtMBqOsiHaCfQssfae2GX6NVWxXch1jIRrKsGxxEm79QeFOK7GfK
         YQ2EXLLkT3RZ5Z9lzw4yIO9NS2VX3bFWwDSDvQKKrZqnCvkl7a6xxxtd97MdfIVWBig0
         fmFLTEeGpIkEXOWkM4RiAmFxN/ZzANfkFovH43+kqEBkRE3ABw4SH2+YOjbHeFjkD9PO
         YkpwabQyTO7Z2LX6xvqoB3ml9TGlT+j3IcNIFwVUsBwrQW20PWkBEw8kfO00HnhfDPNJ
         z73g==
X-Forwarded-Encrypted: i=1; AJvYcCV1B8fGj0yFoFYXyzjeyUDxo5JBuYQ0yp4/OHPWaISf49tOmBbPQHZ4LkIA/qyuO/lBnQbqAucYrwjigHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXHinVrPmZmYdRavx+091pm3kXxMCGZPedwGosvRaDoCFxZyd
	SOgS16b+hzgUaNwCShz4mJQtwvR5hdBm1EvB4akUybvzezxDwyQa
X-Gm-Gg: ASbGncuUeuD3vMXQIpfrwHGVLGiauiAQoPGq/8Exqzh2BdHrbDcdd2QLNYDZBsh2YXB
	WklwjlQJe+ESvx3eEolTZSuKiTKZeuHjbp/q7SvorEzqVN2h9PPZajzeKukcHmwitgwu5QV3QY+
	WBvB1zTBVd3Xkgc9x9gtJyOOq3G7nW27OdvIlK0767HQTNvVgl71VPm9s7ODKADg/r9M/1N/5Fs
	BfSqSilr1d/w3LBbPWJA/sLuvjjNgJBIpImdRw6TH4YZL2FP0L5OPgj2L3Gcwd+UZqiWSSCzZL+
	odYlmFYgjM58ITZA8eUKH1WBehS9cStVKzeKiXDpCQ==
X-Google-Smtp-Source: AGHT+IEdbBL3MRIWntQwweT8vuXDk5H23cW+640Zv/021eL9H0iJqHIjtoIY883q8yma3rqIe4a0iA==
X-Received: by 2002:a05:600c:1f87:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43ecf9c788amr39833175e9.23.1743852390464;
        Sat, 05 Apr 2025 04:26:30 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:29 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: add spaces between ternary and binary operators
Date: Sat,  5 Apr 2025 14:26:04 +0300
Message-ID: <ff993a669699e902909063aed03bb6183122c9a7.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743851473.git.karanja99erick@gmail.com>
References: <cover.1743851473.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spacing around binary arithmetic (`+`, `-`) and shift (`>>`) operators
to improve readability and adhere to the Linux kernel coding style.

Reported by checkpatch:

	CHECK: spaces needed around 'operator'

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 928c58be6c9b..666a9f44012d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -155,9 +155,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		/* 4 1.6 Big jump */
 		if (pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_LOW)
-				Adjust_Xtal = Adjust_Xtal+((CFO_ave-CFO_TH_XTAL_LOW)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_ave - CFO_TH_XTAL_LOW) >> 2);
 			else if (CFO_ave < (-CFO_TH_XTAL_LOW))
-				Adjust_Xtal = Adjust_Xtal+((CFO_TH_XTAL_LOW-CFO_ave)>>2);
+				Adjust_Xtal = Adjust_Xtal + ((CFO_TH_XTAL_LOW - CFO_ave) >> 2);
 		}
 
 		/* 4 1.7 Adjust Crystal Cap. */
-- 
2.43.0

