Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48622FE04
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847599; cv=none; b=bO27LSyTcujVmdVNOEUorc/0oLKvpc1CHKzkTJICfICR17Fgpj5PnbUG5/9Dsr1SteUc84jvgz8xnPKulbOt+bjlCoKaSaEDnLzRLkoFPHJ6OXhfEl14Dzn1r8QXzN9JdS9SIVLgdAt2+RhIZRNc+zxa3kocKCnmY7Z0Tr2N+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847599; c=relaxed/simple;
	bh=jK8NJOHWZm36URhFMWSvMnun3oLcAHypEDPr90IqvEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M55OgaTY7GyS77LQN+RAxJzDGKGs7lDtB3igA04fvrRszYl9buWofmOnQMd6IAtDokFd5s+cEieyuSnbUNPErIP1Px1Ihq1StJfSWNvFlo8zNuclrCKFbw533ED3PpTilDKB1Ck+ao5pQQuStHoLKX9tQxtlUtizWlgBv+kXrQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=m8wZWj0M; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="m8wZWj0M"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so1239340a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1738847597; x=1739452397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KR6bvb5577L4rReraIvZgFjKc18SS0Qabaw0b2hBG1U=;
        b=m8wZWj0MGc1Yqyjad6/KObv8e3mO1FvdJ0q+xyPn2zjeMUkT9smbgvqHRVoGOpQsZ6
         a7dg8XDc20lHrNDgjst7wff2lZUzb1yzHB0BzCKYi0Z3oEIjMLydFqsAMzayOvzk6AKJ
         CzNy4sh3D2ULOQHOpJXV+nSSM1E2Pr4IaVyu1LGPDBTxrg8aG92zrkF2D/Ub4KdHLMfQ
         CeZs3am5kOdLgCl5LzRFiMq95/DCAncwSUZSJMCw7PTaltS4umsOohYQx8Z3KEhRxCt1
         uAtdCd+4jS40srxzQ6VT81T9g66Yc3wxNJiJXrzMPyLvslJbRYaSLKRRpPR/Sjg5K8b7
         HTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847597; x=1739452397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KR6bvb5577L4rReraIvZgFjKc18SS0Qabaw0b2hBG1U=;
        b=ImhsIA4j6Y31HWFsM9jpmmhQw76rOy+EzekIaj+Ln8QJOoqDtyAgqxnNjU8pMYGvwO
         4HYQbqG2CJkboKJzOou4Lxm7QaTnhKh2k9lSD1kRgO5VdzkqPE9KenoQIvt8Mr/6HQvi
         OjaqRnZQcgrYQ+sYIY/G2GsvziCPIt9eZezORGIexJsqL4wMK2AIwG5tRk80E81PVpFv
         /tnOvzcKnNoynVtIs6YaelzJlwWT/yNPIeX36YUhSYfcrguxlvw9QyRy5OVjtFEnwJrG
         8AbaH51JFogWvmSA83reY7y2G/UqmJ4SdqgmNgV9qSvi3tf9K2xv5UnB6eRvEMPC4Kta
         QcEw==
X-Forwarded-Encrypted: i=1; AJvYcCUTWhlYDGmnMtRK9uZsAeBL5RKAbvDVmVCDxeP26NGj1iGcZLTpI+JlhzjyH40jXGzBDiS0/bdrgkjYa60=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVnxj8HAIZ9YlRzE9kif59lEopqcPwKLQ0pmwK2+gXxgHUQCR
	U0djo9rnTf5ULOteO4lR4weE8i4ebSGo9cv7ABYnqwdyhlq7XUVu9cf79bH+SCs=
X-Gm-Gg: ASbGnctMUVmDUjpgmTU+h1qKcD5Brpo2yScPrV+8t2+kngK6ikIYmR53rwVdp2Ivf/f
	aT3T022WdtLs8rByDn1pa7etd7hITsGrg1iBNDq+WG7JtB0ITzGo5UkgmvWQV0d8rxEseijeQ0Q
	wmJpfT5sGjD2+Yyb5X9NjA5wG+5qRLlver6RjC+fjRGonpDQliAO7CMDihEFJhZMRZXjJP99YOQ
	OlxODcs0X0iRNZKn6yHM17IVckQg6QfLl7+ibWp+JYfg5vdfqAPX4TUjY8Z2Ga0Zm4EpviZP+A6
	mvvNeziQjdsTMRSO9YeaNEnHCleJ/PSaRQVyGSuiKIjDad/TOyusnMMn3kul7mE=
X-Google-Smtp-Source: AGHT+IEeP4W9/tywc5ydRSYsXCTBvBKkM6gGNs7RhK3amCq8atrSM8kmtYxSMdc0gY5vOMT2Nun1AA==
X-Received: by 2002:a17:90b:394e:b0:2ee:44ec:e524 with SMTP id 98e67ed59e1d1-2f9e0834a1fmr10732218a91.35.1738847596801;
        Thu, 06 Feb 2025 05:13:16 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:13:16 -0800 (PST)
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
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
Date: Thu,  6 Feb 2025 21:12:59 +0800
Message-Id: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
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

Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
HX83102 IC, so add the compatible to the hx83102 binding files.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index c649fb085833..d876269e1fac 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -18,6 +18,8 @@ properties:
       - enum:
           # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
           - boe,nv110wum-l60
+          # CSOT pna957qt1-1 10.95" WUXGA TFT LCD panel
+          - csot,pna957qt1-1
           # IVO t109nw41 11.0" WUXGA TFT LCD panel
           - ivo,t109nw41
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
-- 
2.34.1

