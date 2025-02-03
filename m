Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA9C1D798E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620215; cv=none; b=UjRUbjf9VSD9dpMGk+S4ZCcV2u19jWBdS6w4DkeiNCKT42+kWhCiEikZPBNqUW7eMlVmJNv/tXGJHDeJuJCL/n3NVPXe674avdbWsnn/iRLaqIf+l+rExfpFkkmadioLeMVmykaQtZWlL4Xe7RxmnV+1riBgyKXBzIQeG/R4D7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620215; c=relaxed/simple;
	bh=eQkf/AWZN3jzhqGCXubTSBoFaaW6MkWDOMXPv8rUKBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iy+1EnVJqKj/dIv/KgqjAxC0/6ZAtkiMZ1ZHNRHLANbBmIZeJVw7gMR7i9n91vBsuyMu/41sEVTbNXJjYG/4EstygHG08YH2IQ879foQyNBNj60Y3f4fjSw/NL1Atk5iUNM1/1CQSWQDyhWAN41rrFt89SQAj8E6gs82njaRkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLx7Ol9z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLx7Ol9z"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166360285dso81309725ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738620213; x=1739225013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3w8CBwpnkwJfGW6YGEzRWKwSkPHA+eGHDpFXNygB0=;
        b=GLx7Ol9z6mvT+P41t56SDSIKZ6vDqrCPAN/UQKlZVf6LQvs5+nDlaypBBe2g+FCNx3
         ItaazoWJ9MMgJDRYsHBmJ7SzTRzuBNTtk0RgpWd792Xc9nlns6a16FdP95e4adDZN0zv
         ViGRqs/keoaELdsA9cb/byw9OML7RUnZ4mgE9MPrk/aqCY5O15ZIBsT338ECkh2Vylah
         IEQyHG9vbOCs4EvFkTzmcsfWQbMaLf72GmFYJHfzoANgP9R3rwdeXyRdI+XrZ9Rh24KR
         mxJZEblFVwiW4pP54DTYyZ/D3sacrGSJsyJgyKNXj85qBbuEGwCEl37jvHOLnmHNuUw1
         z9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620213; x=1739225013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE3w8CBwpnkwJfGW6YGEzRWKwSkPHA+eGHDpFXNygB0=;
        b=ac+Jgq94ipNWaB/PtNArUKjrDnaHmc+bpwTNcpGY4tDihDgs7lEpOcbBnxADsF4P/N
         AqcZktfvgMtzJWDWIbGbh7P7sbwsVP5BRpLr2v5n6Dp3lV0uFcS/1liBqZEJaneh7za3
         tK5seKDCkgKAz6vVq89i4xxdG4GgNuiqNaIAT1s0owxjkfo684SYupVBROZZZFeYc9ct
         CEixZE/9dr0UsKDhPMqVAC8RqN8NjDPCGp3zktut++2AXs3CSebSrRNm/IF/VNlvcnsN
         KOiKRcm04B4GLoU79GF5mJ7sDCbsxLLtcvSKU1xxP0k6LBEjs+SozazjTI6nBNla+ney
         s6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUJZhysZvMPQr5xuyrNu2lg+J1TITEcJiNL+fSHpK1uHE80Ow4q1bY8GdVRzVrRJcd3Um0t5xZG2N/B0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIUh1Z6HHXP9jDHJfM02P2LeDEa3OLig8tepizCBzmNNuzGFc
	z+nWmeh7Yb8gk4DQemjqEeFvaf5JbsS3tWYqjvF3Dt2mHCop1cdr
X-Gm-Gg: ASbGncsj8ecDIzcGedMiVGYzY9NGeqY+p5Msn8Mb8M92VEzROYrM8xod6vNjncTbxmd
	gHJKPLNS7OuLO+gCG0JCiyV3dCznjS+CpLLfvEWjNZIcb7m/6UjvaURyvxov+VjVHwJD0l6yS8u
	Vb8jDFBdDpbZ4Jbs/wD8Zw5U0j+Ccc/ctY3P7+J7xPEPaQYok/hTynTzwGqCm8rWqftfvpIzP9j
	8M09dY3t0aMAMQlQpauz+BwkR2MaCfTwn2xCHX1qoRzuaNeeCXECw2KUbcrPzqh5eXjQtgMEMki
	+WvaI21mDzVeb1XtSScped0KLnhX4Y+PH7JH
X-Google-Smtp-Source: AGHT+IHe6FsR3L8EPqDxhFZj159t6h+b0jL85Yxblu8f7CFj23++P7uPXtt9a6hYivFEpLpcpCMBRw==
X-Received: by 2002:a17:902:cec2:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-21dd7c63b82mr352514925ad.20.1738620213476;
        Mon, 03 Feb 2025 14:03:33 -0800 (PST)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ec091sm81837245ad.112.2025.02.03.14.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:03:32 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Subject: [PATCH] drivers/base/bus.c: fix spelling of "subsystem"
Date: Tue,  4 Feb 2025 03:33:09 +0530
Message-ID: <20250203220312.1052986-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling, "subystem" -> "subsystem"

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 drivers/base/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 6b9e65a42cd2..5ea3b03af9ba 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -1291,7 +1291,7 @@ EXPORT_SYMBOL_GPL(subsys_system_register);
  * @groups: default attributes for the root device
  *
  * All 'virtual' subsystems have a /sys/devices/system/<name> root device
- * with the name of the subystem.  The root device can carry subsystem-wide
+ * with the name of the subsystem.  The root device can carry subsystem-wide
  * attributes.  All registered devices are below this single root device.
  * There's no restriction on device naming.  This is for kernel software
  * constructs which need sysfs interface.
-- 
2.47.1

