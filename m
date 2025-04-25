Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222BF242D8A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578709; cv=none; b=LPV7aA++OMfs9lMcMW27LCfegu0mQ5aA9wkXZYibVX+rEB7+4vPkwz3O7FGKS7r1RJWoIgXpOmnIGzfcH1SUFcoZVbK6UxzAZe6TYkNACdtOJ0LxJjz1QnKpMEWvScVTbLJo2wdA8BagDoSS89QYQmpWQYTWayRrYUwvtuPP8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578709; c=relaxed/simple;
	bh=xLDn0Tb/Cb3Swpcf3Nkm6pIuZ/uGK86dO2awK/koiaM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D+pWw9zoGnOF6YojggAl5vLQZdBDcp6ljyeHOQwnb/oQqmK0ZimfoifQClOIXiybbIFawKLKU0L6TXsWDe1gqD3spwXFuNjiwQkKK87aCAk/FPXAdADHJU7fkKF+shwvcOaEmZdYDfXpdglN0Ym2VzIhnnUFKCKu8QT6Pd4aaUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lcfc.corp-partner.google.com; spf=pass smtp.mailfrom=lcfc.corp-partner.google.com; dkim=pass (2048-bit key) header.d=lcfc-corp-partner-google-com.20230601.gappssmtp.com header.i=@lcfc-corp-partner-google-com.20230601.gappssmtp.com header.b=rvnLDfIf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lcfc.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lcfc.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lcfc-corp-partner-google-com.20230601.gappssmtp.com header.i=@lcfc-corp-partner-google-com.20230601.gappssmtp.com header.b="rvnLDfIf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so1740153b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lcfc-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745578707; x=1746183507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CL4GUiT5fbCVEgjjh5GO/CMbN+iFWhXsnOF5Al/SGjs=;
        b=rvnLDfIfGtT0ve1AY44Uy3olwyh19KCWnkbIMDO7bZfKFFcKtgnRMGjQ/tE8csBbOJ
         Dp44k0qCPQNTMMkImlLFkU+pVixudEG1dnjsfgFCLTm6dIRC/QD6ymCnsBnPbLOJ2HL9
         bSfboHHoFuf3SONmUKShdMh1GV2E6+dlv5QZREdcPJ5EP+sut5Gi1e/W1WyCSbPprSnp
         ernDmo8K7zkpuRuXYVygnAmJ8MV/WYGyFWUbbO6lI+G0er0oAamd6Dli9nFM0LzwhuX4
         HKGrcRvHGg7ttUYni61EH+yVpV4dgdDgl2Axjqu2Djx3P4vYWl/VcuhqVKaZLB+tfGPg
         cRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745578707; x=1746183507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL4GUiT5fbCVEgjjh5GO/CMbN+iFWhXsnOF5Al/SGjs=;
        b=B1bSo2hCGGtHW2/95K2YlFsx0CLHMQzT6u6+zvk4u+N7I4xpB238YDPu6XTJC/gR4Z
         cqiXcgwaYQvgwKBMh2d7lOgXa1TBksi4yR9RcmxZ4DKITORaMx/HE3FjkMucIlG2Y3ZX
         ZinbEJv/mDKTy9JlI8XbmmuOOwn1s+Okm1doZPbH7OKgXYszEkKaiyX3W4d2Riiiq5Dh
         WUfIGVES0NVpBVmqGfbCk+w+5BdQuQS/dAfnDRCmx/jVkg8dO9rorCruYhnj3vnXhw4r
         VchVENmYbSNAQSTLDTzkw6sK0Eh47tQRoG2xmC9vZ+/quS2V0s5QIOUWRTuZvMfHXOrY
         Y4DQ==
X-Gm-Message-State: AOJu0YzuFYeLHH+VNL7pae7gXmMjLi+4jAlD51VXhCt7HneTcfJ//JdP
	Wyg3p6eqqEA2utgdQ2XLviOsTYpVs6F1MTdhsYuaGfX8fY5jX/QGusc5Wk5UqSSGWveJqrBaSo6
	KR6Xqnw==
X-Gm-Gg: ASbGncu34zAZm2Lw7Dvy1r7EtckEIlvWYDsM282U/OHHICL7vlNI+w4BFHZe0dskGbr
	iBBhDvjcVYPTkLiwQzVqqG6/z63Mcu8PZMH+dOD8vKuWcgvANvwB0UDszZ6YlpFw1N3U3+LXXIE
	rHcdxClTYnLgLIsB26o9ev28ugkRb7SJ/pR5jvfE3tFFm/+LvW9fKXhkOVitVmoltWGFlCHczqU
	H26CXxqGHLSetLFqzhUcjKLoUQ72Iw1CtD9mP69bfvTY25j1tXcWBCeUY3u95fmqiam3dw51oiX
	wZV9pZc2hB0M/DcXDc/iIVQpG58fjEoan/LFBsDY8vbPIaqoI1NauwQAvij6U/Ije0AO774mnpH
	Z3Cwglw0cv45nWJbdXWlY7BrHSw==
X-Google-Smtp-Source: AGHT+IH0dA/IkZvFcO+56poSvwEFwT+v1pAO6NoIaOkc49CSbdZFIu08OG6EPlpiLB7+JcYO8sBIuA==
X-Received: by 2002:a05:6a00:80f:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-73fd74c7b87mr2464918b3a.12.1745578707176;
        Fri, 25 Apr 2025 03:58:27 -0700 (PDT)
Received: from alvin-x13.. (211-21-152-94.hinet-ip.hinet.net. [211.21.152.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25962f61sm2872450b3a.74.2025.04.25.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:58:26 -0700 (PDT)
From: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
Subject: [PATCH] drm/panel: samsung-atna33xc20: extend msleep in atana33xc20_disable to avoid glitch
Date: Fri, 25 Apr 2025 18:58:22 +0800
Message-Id: <20250425105822.4061016-1-alvin1.chen@lcfc.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung-atna40ct03 encouters glitch when powering off, extend msleep
in atana33xc20_disable to 40 can avoid this symptom.

Change-Id: I4d052621d3c3e0fdae0ac472fe5da151f46be237
Signed-off-by: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c..87a4e1c47aaa 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -154,10 +154,10 @@ static int atana33xc20_disable(struct drm_panel *panel)
 	p->el3_was_on = true;
 
 	/*
-	 * Sleeping 20 ms here (after setting the GPIO) avoids a glitch when
+	 * Sleeping 40 ms here (after setting the GPIO) avoids a glitch when
 	 * powering off.
 	 */
-	msleep(20);
+	msleep(40);
 
 	return 0;
 }
-- 
2.34.1

