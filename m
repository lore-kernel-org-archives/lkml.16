Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1911422E412
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847596; cv=none; b=mS6Z8PqAXtwCellUu/sJnT4UEjOYMawp4XHA1pJUd6BPKOhopBoWgUUsC0G8BLGvSDj3qeaggSBqQQBqRZoZZUdn713VHNeDWFFrDPy3lmLmZepIgPTdGQANi9Fib/ex4cV0fT3gh2C0F0SHo5WmFWyppZDF3nCSjDGus0tIkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847596; c=relaxed/simple;
	bh=K9HkvI4uN9Uo+e9aX/9cHbyPDpUHNNB4CZUEDwOkD+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YUg5NoxnfFWI5UHtCMRB1UB+sfeR50Ro4LBLkT35JNWfJ+tSkmymtXS71F5GSV9dLcBgBQ+QVxGl2anfFTEH2/buXoAxSx/Bucv8W5j1glcJ/Kl3NloOF6sFYplpHYjTvhhw488cwLCJ0OXd1dlP2eG5Juw1sz54CFvJ2ce+eSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=DgpG9RED; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="DgpG9RED"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f3c119fe6so10469115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1738847593; x=1739452393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRpcrg83W4YC9Q6eBSOmMfqvqVxhGz5np6EgD/qHnrY=;
        b=DgpG9RED/rOxvgOxcyN9N6uyqH5YNjvFljFynFcpML/I2BUYCRtt07wLnIi9U0Pfr9
         SOGY+Yft2/zdg0CZBsebxgLG9SGWJ4ZG4pgB4hPS3gutUELlxJ4dRU8mmwIVmbP0amAb
         QB8uX+tJGwZRCsKtjs1z25g2r9jriih0GdWC1RKqCImfvSwbLpBDnGECgoSCbxzDtROH
         Ms3N7V5J/1zaI7UoYsa1a0uQDNtgvnDuiXQt7mbEis5y4cSapbyM0ly7tUHjDtu7FKF6
         ctZKHUgFn2+q2TbqPYwwxD+5azEcSF7ferkt/N6itnktxve+CjJ3NPAs1gOYT/HWrTqO
         yH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847593; x=1739452393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRpcrg83W4YC9Q6eBSOmMfqvqVxhGz5np6EgD/qHnrY=;
        b=ozz2g6j20i5+QajIie8rLGqMBbvWhesw0GgTR25wS5PRUXPW9ZWk2d7m92SmEk3pYz
         UXknSvdlc9RO8PfyrU+fFepAxoMKoCP4xTMifr6TO1yi56vW5yUUKFc2JE0f0rUcs8oO
         h3Aw5AECfYgkNEB5nd9w+lqfvS0qsNsyC0MMhBfq+4AdhjRYUDTZDLzh4QnjWGUuPz2M
         l41t2L93Oaf3jtkxHHbozMZf0TB9DevK0DSBME6BVUihK26j8+rcBIVfemI4YmfZ2llO
         UmUNUBLxTVbBAt7Yei8orpY7S139bPLRdPX3VNJKSSeCpMKnaDC8sWPSUT+2VJ8OsjxM
         zI6A==
X-Forwarded-Encrypted: i=1; AJvYcCXYOaKH6Vid+i3CoTHcB25ulmYoN2bRoJwPC+IkctCQsBnIUhzy9E74k1aeDlcMQpdXiX2Vw7Xmhghyvok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVE3IbAwEvNyO5eWuFuv9/XOofmf4epGKVEtH325c8Coid38Y9
	XT4mxJ/lCbqVi+qNeZ4G8kBaQ8mh4XFrTNdEY9mwR9W/iBYY5/try0R+eDTlh+0=
X-Gm-Gg: ASbGncteQFf7rm9GhA88zDN+lAvowPZyrt5Fg9SblaA4/1JsLnG6RCDTshCqqS35rNJ
	GanL80FjfOJbrytKVuzwNli/4MSUKYVsxVPDLGWcHWvPlm1JwICL68i4lY/UA1sHlqp6lJpsXvm
	JIyDj0/jJxaUgoAlRd6AqXHkpvCSPS2sCYSy4P87ibARfTvXaxYuYULxoFHT4Ba6xU3a9/Cf77E
	0JexiFNDCKfreaTqTzR7Yw4LPA8lD8AsqN5YSjdmuAPJzss65isfP11mo/JMYkR8gOWXzXPdMYE
	+FVCrzs88Cc2qd8QNhXpKNSRjfqFYQkkOB5YCKGbfOdZZUHb2ojfPpjjh1qu7Ew=
X-Google-Smtp-Source: AGHT+IHSlKv+WX3I/TgMDMO34ZgxTwNFmFgGoB+Q3vS2y02BNpmlvXFZebCnCofwbuz6K+dOMWGR0w==
X-Received: by 2002:a17:902:e5d1:b0:21f:3a7b:f4eb with SMTP id d9443c01a7336-21f3a7bf984mr34756045ad.22.1738847593324;
        Thu, 06 Feb 2025 05:13:13 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:13:12 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor: add csot
Date: Thu,  6 Feb 2025 21:12:58 +0800
Message-Id: <20250206131300.1295111-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "csot" to the Devicetree Vendor Prefix Registry.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d14899d584..375f1f7c79ef 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -336,6 +336,8 @@ patternProperties:
     description: Crystalfontz America, Inc.
   "^csky,.*":
     description: Hangzhou C-SKY Microsystems Co., Ltd
+  "^csot,.*":
+    description: Guangzhou China Star Optoelectronics Technology Co., Ltd
   "^csq,.*":
     description: Shenzen Chuangsiqi Technology Co.,Ltd.
   "^ctera,.*":
-- 
2.34.1

