Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7181C4609;
	Thu, 22 May 2025 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927363; cv=none; b=AP91m9tLzXUa3V5wqySpg8+lOsm9pkYypWFVw+1/97gM2PmisD+d94QNbGuQ4UTdzdVkQg+pp2XFuB3HhxUstBDh4PZP0d/YoYeoM2bPeZhn9N2ggKA39JbRpcSnoELyHVFc81qY5ND7VMnb50BVHl0/Ts3CTX4H9HD2BCTt7zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927363; c=relaxed/simple;
	bh=as9t6/lgKXOHxrQJfJ6SgLRsuBjokWtB98bD2VOlxuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfEv7TcffrRFJjRQDa4mm6CvlumyIpHNYw8zG2AwWkp+n6eNHsUnLF3EuBmJXoiF0C2sOXK6tqKFk/BGySL6nY9+boVPOf675oEVg41ANPIgxcHBFIjc1e0T6t3xU7Z2STGd3NGVVsqdXjrsQl2hAY8fiJhApPCNS30cUqozbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzzQyaYC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzzQyaYC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7370a2d1981so6193404b3a.2;
        Thu, 22 May 2025 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747927361; x=1748532161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1957K6cFxBRt0fwwSfz4YzWntiJPaQndxFEoDPvcC3A=;
        b=ZzzQyaYCtog4QOa1UtwQlvm7YwaRvl2w1MmOM6+pZ1HF5RUmC/YL1aGIo4uCsrCPZc
         0JEdAlZ+wlW0lObSdwresz4wTIoLBq7Lgd7gxV6050hck7j+kAtCOdtPiiMKydo+kLhN
         iLxo19O6/BOEw88GQsf6VCWeNbYzPTJdaRXAKJvMUmwh7c970srbzMD03YJG7GoEyw7F
         Vi39XB/pncpFIgL5+ziH+1hW5BbCtNUd36Xw3Cv+zg9luflv9bS7eZ8gdHVeNNO/YAZe
         +ST334CXZm8HKdrby6RRbtQIcYC6xwPjAjC7livW3QnaVz4YZCZEs9hmWIn07tYjPacy
         KGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927361; x=1748532161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1957K6cFxBRt0fwwSfz4YzWntiJPaQndxFEoDPvcC3A=;
        b=DA501qyutq4vxKLwXeta3MtfFFv8XRhURNHHAi65skHD4WePMoz6BDhnGVicmSsBES
         4Texml60YfsMTWD/6hrpiPFHaFClky23c0wXmDI5nUfY1B3x3x8LxgJQMwEUWuEwr6VB
         W3ljX+WNgQvz8dbs5h2N0MHGUn0IgslqO8lgOcaD9t3jEXqCGxymcA0wYuSDn9OXS+oG
         lAV+0NK+WvpTxlmtf7wtgaz+wN9w6QTBbzmY7twBEJkYCxDrExsuej61IeM7ZcbGR+c8
         Zxx7hJGHM+EOXIpeGUfPOrzs2ngKK89bEuhs6RPUj+fh4R3b4ypxqVYhGlgn3/ofTeWI
         +qqw==
X-Forwarded-Encrypted: i=1; AJvYcCW2G1eqFKBa5ANtpJRmKk5yMmVx92IKff9ugIWOSi0PIgLpuXbR92o0+dt2Mj5CzLwmprUGx3Z+5tY3@vger.kernel.org, AJvYcCWdI+zlM3xf5vrND2wu/jce0xsrOr4SkPQih+Rjtrd0igmCOP5OMptZ/KjfW8NgF84Y42y1fpmCux12tPl5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5duT0MQ0gT7RrFaHQEDeQpwxGgQArchaFexJh2sFEOWqvXicj
	jwW4yJHVUEWbWgTM3H2aTKHylRoF95fY9iQHo+Ey2Dir8MAjAGVeSSZZsrXHk0Uo
X-Gm-Gg: ASbGnctIioTh4KXv9MI8hhnV2miWG2GTwFSbaWu+1AeNfmY39i07gR/PSoV5Tmhm6C4
	Q2++uzTo3AATtfSH6IXdGwALFgntghqqlRcvD0StoK316r7Xv3yohBSbbVd53RacszIh5H2dB0V
	YmKEFufvZEllXUH0GiYfJJC+N3vEhjgu4ya++4xiLx23uwdZPPcd56f9Ox0aNuG78EDlBJDIqFh
	k+7xxLcmNrCiEsVn3uxi+2J91sCYYIBlpC1PvHrxFYChIlmPgwsEAHgCpXJ0D0z2Uxak9iw8cEa
	4/B2YWRtyvXDAqCjJqP77IcQHzWhnG4Q9A/1idS5lh2lFM1MEeZrd6jqlIDRImX0eymoI4yHc2J
	GQGWPOKqF9cPHPLUGW7wnGynX8RF/OrA=
X-Google-Smtp-Source: AGHT+IEBkuSl2pK/hXbCE4FOCyNq7q29JNvFBQkJoht0SAbff98heqpXq6EqxJMj2iJndeUl16k4Ww==
X-Received: by 2002:a05:6a21:339e:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-2170ce3cd64mr35721863637.42.1747927360908;
        Thu, 22 May 2025 08:22:40 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf70870sm11301785a12.30.2025.05.22.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:22:40 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	onlywig@gmail.com,
	kever.yang@rock-chips.com,
	manivannan.sadhasivam@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to mayqueen
Date: Thu, 22 May 2025 23:22:20 +0800
Message-ID: <20250522152220.3408999-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The company behind "nutsboard" has been renamed to "mayqueen".
Update the vendor prefix accordingly to reflect the new name.

Website: https://www.mayqueentech.com

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..ee1dfb7aa64f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
@@ -1084,8 +1086,6 @@ patternProperties:
   "^numonyx,.*":
     description: Numonyx (deprecated, use micron)
     deprecated: true
-  "^nutsboard,.*":
-    description: NutsBoard
   "^nuvoton,.*":
     description: Nuvoton Technology Corporation
   "^nvd,.*":
-- 
2.43.0

