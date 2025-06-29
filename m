Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1EEEAA;
	Sun, 29 Jun 2025 03:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751166271; cv=none; b=g1DIqLtXebDJnFIP5k0pm3QuYOHVssqYNhOIzA5YgeAsakG7Nr0Tq191O+zwZgBX8Ta68gWbiKXdi4dDfoMo3YFhOLRXFw+6VCgz+lilt/rLxMgQ5L25V82VSRyUbc3IoD90+krRIslq5ytxsYA7lfQwznLfDFzSasPccktuSec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751166271; c=relaxed/simple;
	bh=9537XgEaYRn9c6dm6kDkJQI5HfbS9vPngpB7KIR2YDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=heO/t4SCB9whQnGouQjDbcaAlMfanVWRjiCLM9xD5m+OM+ahlQc59gwxO+7EHlDvU8/sb/fZa/WmNwtHRxKme73nrwuFbh5S2W8QbTW30NsviMsme9xFMqyUbB81pTZX8XFdQsG6H87vBdvzY0lpMtdVDBeR//TtJcpH/W6eTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLHCpZ0M; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLHCpZ0M"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58d95ea53so37274581cf.0;
        Sat, 28 Jun 2025 20:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751166269; x=1751771069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFyMRoWy2zR4mV1W2LVo7H6II6FCwnGnRdzH4Ck0U3w=;
        b=TLHCpZ0MvLPzeQT1F9PaNsOKMPHcDa4PkpEwyJdIKOBc+ZQO2msEOzd07cV63KY0NK
         +whB0GQoBTzhvqIOQWWIufRrcsILe/pfHq8e+svxpB5/hbcZEKF/13KYZvL/a7wFCwTq
         3Lx4wWWNz4i3BQXJf0sfCvtzbLwBATbvPMDVTpuBnxQ5pt5/fXBgAv3iv1tD+5udXKQl
         Yyqb/QpSsk4koQH2POoEdCf0NDKOsbmowEBVNbW20jirFB3qfWtz9tTSWgCjOOPoj9XQ
         aLQq/3Oz9t3vPz1OsCtQ+hj2V/MddotRm7q90H86bNgkgL01uO0szxT2c+jwgyymS22J
         /zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751166269; x=1751771069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFyMRoWy2zR4mV1W2LVo7H6II6FCwnGnRdzH4Ck0U3w=;
        b=WjfbbftwMzQSlTIfSI86Gv5X4PkiPGR3jU0DY53rS9vcfPCHNPiwnyxYyGUUtIU3ox
         QPIi5yudy/hcAjdacq7ulXRwshv4bhvw98Ov+yzL6XhAQaR7HehTesSdN4HqENLPjv4T
         biVjUoQf7ru2SNGu3E42McTL79H6JWb8/r1QkIwL7actel+AkuKckvGfzzpu2hzAZMsg
         w3wiJ+C62MlMTWooFeYjVenjp95O+k1JiBf0NlHsSBBhdiHIF+gzYxAAZRfitpMnROGi
         TmlF1nDHmK3/ZZqsdlo7MoBm47Zz8IUVSiM5e+m+BXCAKzuJkIR6klkvjuKmT/Ij/EeK
         ubXw==
X-Forwarded-Encrypted: i=1; AJvYcCUxr/jAfjWixkUqbRrEDVI6vYcbto4LlaHhyOEyRc5oi6lWaO76Uja2xrPy7ewWAF2SPabCZofchHFF@vger.kernel.org, AJvYcCVlus1ZQKU5Dfp6mjGWfm4l4IqZ6JykOCtlyHQw77R4byucv6W1QYVFDJ4xnXIHsTGlE1vNk3hGYDTRfg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWq6rew6kIz0CoIy4BVy+8jq1/FWg23ZtkgR9eHyL95vhY8W/5
	l73YMWAbGrd06V2CPkW4uhC7XLJi6tX8PXQseEDrvmdx5pIuDMx8BeAF
X-Gm-Gg: ASbGncvsLlz5r8tNn87ab2C4odwoDT2zNOW/QoYQjS7cNFkDtgoESAiNUYECRHIP3qZ
	OpyiiSWy//ByUx4LXW4x3s94N5MZM6i9F42SOggliBZJiE+X8kqirVC8L7lW4d7fTyXWic0AjJ1
	pQL3Htb6LSnBlSzUGcod1lp/SEkiaxbGc/eLPfD/kaOc/NgjGkPdfZsnT3Z1TufAqIbZXAa4rTt
	w9MshTy6sdgC229AEIcWj10g0/dxyGP3Y24W3RoA+m5MPghGCO0seYrEoBa+GKcst2cf80Ej578
	y1VPY7YZl+TigWQhVcVpma0CothBt/HLHU2ON+fOLIpWhI5BuW0zu2jRcuPlb8vmg+QT5fchvVE
	ofy5X5XJOBYk/GhhNp06vD8EENPdNMIP3hKoPFOQcTtCSrOKrfJZFOZp55g==
X-Google-Smtp-Source: AGHT+IGF+L4BuRAK0Z7reCA1gOZsE0T/8BqrntZq/k+l3HbnZLE3bWFbe9e3tpGEDcpwxcUaHSoveQ==
X-Received: by 2002:a05:622a:58a:b0:4a7:f698:9e6f with SMTP id d75a77b69052e-4a7fdbd52c9mr146953611cf.11.1751166269062;
        Sat, 28 Jun 2025 20:04:29 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc10620dsm37158431cf.7.2025.06.28.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 20:04:28 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: pip-izony <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: m66592-udc: Ignore feature requests for EP0
Date: Sat, 28 Jun 2025 22:59:53 -0400
Message-ID: <20250629025951.17581-3-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `set_feature() and clear_feature() functions handle requests to set or clear the ENDPOINT_HALT feature.
Currently, these requests are processed for any endpoint, including the control endpoint (EP0).

The ENDPOINT_HALT feature is not defined for control endpoints according to the USB specification 9.4.5.

Fixes: 4cf2503c6801a ("USB: m66592-udc: peripheral controller driver for M66592")
Co-developed-by: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>
Signed-off-by: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/gadget/udc/m66592-udc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 715791737499..38cc11ae80b6 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1010,8 +1010,13 @@ static void clear_feature(struct m66592 *m66592, struct usb_ctrlrequest *ctrl)
 		struct m66592_ep *ep;
 		struct m66592_request *req;
 		u16 w_index = le16_to_cpu(ctrl->wIndex);
+		u16 ep_num = w_index & USB_ENDPOINT_NUMBER_MASK;
 
-		ep = m66592->epaddr2ep[w_index & USB_ENDPOINT_NUMBER_MASK];
+		if (ep_num == 0) {
+			control_end(m66592, 1);
+			break;
+		}
+		ep = m66592->epaddr2ep[ep_num];
 		pipe_stop(m66592, ep->pipenum);
 		control_reg_sqclr(m66592, ep->pipenum);
 
@@ -1067,8 +1072,13 @@ static void set_feature(struct m66592 *m66592, struct usb_ctrlrequest *ctrl)
 	case USB_RECIP_ENDPOINT: {
 		struct m66592_ep *ep;
 		u16 w_index = le16_to_cpu(ctrl->wIndex);
+		u16 ep_num = w_index & USB_ENDPOINT_NUMBER_MASK;
 
-		ep = m66592->epaddr2ep[w_index & USB_ENDPOINT_NUMBER_MASK];
+		if (ep_num == 0) {
+			control_end(m66592, 1);
+			break;
+		}
+		ep = m66592->epaddr2ep[ep_num];
 		pipe_stall(m66592, ep->pipenum);
 
 		control_end(m66592, 1);
-- 
2.43.0

