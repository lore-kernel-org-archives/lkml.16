Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70271270EB1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790223; cv=none; b=BYLgqNtjAYKPGr2FSYAnb97grmy1R7h7U0bWMxBopyTG0WBELpEfhrj2yTpeTlgdHG+QYZGMGFOAQE06mCYUpuORX6x5LSMQ0cH6NESHziOBOTbJOrC7cAyfq0P/dD2S8N1S2P5aOHEr5RzJE71SY4yWlmtoZXoflouRKf6uc14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790223; c=relaxed/simple;
	bh=VdV008tfzG6KNU0S5Gsb+VG889BxfzCXyOCm56rnkUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrPd8CcqHQqo8JPJosArrGlvxtW+vMS7X6OW8k+fLuIgiqIz95DuspMwEQk3gpo6Pz7TtCH2+4Nmex1lSNaboM8Ej7udiUST+zXg50SiYhirCv+rasZoMqd6EkctZWvhD3+Tg4s5Lb7K6jVO0eUi5Nwu4HBWWAfFkvN75COz+xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dL5sXA/+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL5sXA/+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so19824955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746790220; x=1747395020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmILc32KRA1sm99pcoMQ3XSkwuHQfRNl6IZq9ElsNb8=;
        b=dL5sXA/+BxNCbrkwoUZcaEYRPenoWsCS1jz3yGseh9AqEa7bRJ1boiuk3qumIZJr37
         w59gArdPKP3rCf6dnWGTKfiALWDTcqGq5GiLxpdkTgH6Jr7VrTDg8Lz+4QZ07xRYfjYc
         PS7kj2aSxopLmU7uMLUmjQSNh4+3N1hnNWHwqU8XJTs5Bq2iUvTsFXqnWHfvyisknYEq
         YcpOr8pK84JU59MiWkQiS465J+aMviitf0OOm2kA4fM7s3O+eiaQiqnvA+aAal5Ymmrf
         VW5Q6jNWU3s7thrIel3Jsy4lbkcDfzewGxEeoeLIVB+vEPrWlnulnKIZ+LQoMMS/lSAH
         JwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790220; x=1747395020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmILc32KRA1sm99pcoMQ3XSkwuHQfRNl6IZq9ElsNb8=;
        b=a1NmrBrFHdZ2PD+YVUdeHZisyZ0Be/Q/cty2hICFzTumbikkSKAOofXxmjAXnaUfW/
         UVly0Jth/Y52yvxUikDvZ1Uv44WDFX6yLADqBXOPuKxn0h7sniT838XKdl9RP6wt/6lJ
         ypvXhaPq0OG63aBZUQw+hGYAaUqMQ49y/I+3aO8WkNPaQrPtExpxLwaerGSF/kpee8Yr
         aRrkgqtQrHU/D+4MTlACxGN0TcWaNKz82ow91CFHr+DMcijk4JBYMVwbw8svAI72Ubz9
         DqLfMyePCqulic8Gj5pnPzBkvJXDEhGTMb1lLum1J1jEYeis8l2GOUUyYZq9MF6sHAfJ
         eRQw==
X-Forwarded-Encrypted: i=1; AJvYcCUGXkNy7M1tCzEITcTbYcdpD26A/zPwLu0ltv/wZTfyclYd/hgSMS4mdFH5aDUpoKbGkKKunEe49sBhhHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAzNFLhQTjiheMyMR+1sztYWex5IGlFuL7gCV8Vc1mvPcE4Zm
	XBQPEv56vFqCP4a7JqLviRvh5/0XrEv9BrTzOFyDwQfaNdTLSqZ0
X-Gm-Gg: ASbGnctvrpPFyxY9LH9kn8ALXfWdd+anBP9K1jut4YZlGgOLvxZyYZ5xhyT40unsnaB
	rk59lRbNRg2CGLL7m6oXtD7ALou7KoZLQAbchhJ8dQ+ll5AzTR0cJiF91yq3nR2+YygGun0b2XU
	xpGqs0uASiClb8Z0pnTx/4Avend+BLLWtZuOCCD8UQ0qqBvwekNVey4G7BOA1rvFoznRxaRsYvu
	jytHGOf0MjqM+zbyQ4hzBJVy+a0+zWo8s4DrmU1Qz3sX46QoXrA431fCXdwiaZEmJC6Mr8sY55S
	dGj3G7Tc/t5FdCayVrQbpLXTfJIISMUByY66LXnOfXoiVM0Trh4ESw==
X-Google-Smtp-Source: AGHT+IEX3C473GG3Hwd+yaU0Wn+5NbsMlHdYzeasNLDJog+d2QxZs0QLEGr1LwYpGrbvvMKhFO5ZZg==
X-Received: by 2002:a05:600c:1c8f:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-442d6d1844amr24734045e9.4.1746790219313;
        Fri, 09 May 2025 04:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm35805465e9.31.2025.05.09.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:30:18 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix uapi include header guard name
Date: Fri,  9 May 2025 13:30:14 +0200
Message-ID: <20250509113014.9105-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gpib_user.h was renamed to gpio.h the include guard name was
not changed accordingly.

Change the include guard name to correspond with the file name
and cleanup the comments after the #endif.

Fixes: c7184cbf5530 ("staging: gpib: Rename common include file")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index 4ca3cc9e0cd7..667e2fcc9130 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -4,8 +4,8 @@
  *    copyright		   : (C) 2002 by Frank Mori Hess
  ***************************************************************************/
 
-#ifndef _GPIB_USER_H
-#define _GPIB_USER_H
+#ifndef _GPIB_H
+#define _GPIB_H
 
 #define GPIB_MAX_NUM_BOARDS 16
 #define GPIB_MAX_NUM_DESCRIPTORS 0x1000
@@ -298,6 +298,5 @@ enum gpib_stb {
 	IB_STB_MAV = 0x10	 /* IEEE 488.2 only */
 };
 
-#endif	/* _GPIB_USER_H */
+#endif	/* _GPIB_H */
 
-/* Check for errors */
-- 
2.49.0

