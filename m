Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C727E9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965445; cv=none; b=XfSKw4VnncsrrMHsDiW0vGd8CtPeX8pvoiFqL6+ZApoZHHC2/vn4Q4+MpDJEIRybAr4rIcjj/uGym1pTcHCKluSiCiyAze5VZxzFiIDoCqHOtwSvpzVMaJWz8ypr3mjQULlYu4aUwkUkHi8UBHgr7H3gsHQtLQlGuKOkP7vnkVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965445; c=relaxed/simple;
	bh=MuMYYJlONuNOOG6ONkCN/Cp8H25zkOcw4fwPmZU6F4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmjfQp356AzqhTIBiJ8BKqyB86uO5sF2F9s2ZrcIMyPAPuMA23vyHOS7RbXdyC9adOKUMWbW0ekmSgFtBHCuXbD8qKIh2LIOeoXqxSrWGsjRSab7Bx/Y5CBt2OD5jMouSsJjlqFBKiVur9FEn2spzRp0ua2YV5R3Si5DKHhn46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgYZkmZK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgYZkmZK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so6030467a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745965443; x=1746570243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGEUp3ob+JGpdilZp+gx8NdgXFPIJ9r8QmvAiWLd4sQ=;
        b=RgYZkmZKebFD7/D27iaG8Aeg6ttBhTZsoHlNy7Ardeb0LLONK8GfKAtVHCl52JQ56y
         ws1snNOZmfIubX2tiDnZb3ppwYJpxKG2XeAGQviPwtI1+qt00tBQ+nJsBGClzufA6zsk
         UdxfVDa209Sh4m3kE7h4oziLSC9jmBRLDmUPlqGOQXqayuA8iim1Lp1J+ngt9CxDjsrD
         CPVlgMr4zgUrAF/1SetY44+bEPE3e1slfuPz8R0btnVBAQ9Qt9mQLj7GAVEdqphH+4FJ
         R6yEt2xj+mbTGMC+p/EwVGlsGG3jOmiNw/FHFtB75bnNQ9XY7Fimrrq88dpFgh+arZs8
         QN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745965443; x=1746570243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGEUp3ob+JGpdilZp+gx8NdgXFPIJ9r8QmvAiWLd4sQ=;
        b=ESpizqISMEyL9TrlduffiOje51MlHmWsOM3nnTTujRkyY5DKSoPALjTvxJouPhNeZX
         06z7jgoJH6Ww/EqVV8/CwFXZ9nALrYV/IQ4fQKy+rLrhdJSXWuTIzV9UK3x5r6S+EGE/
         Z7xwdJUxId5H1Tq29JSg4kWRBPLzlA7BNpwImog19JchRMd8fYpWbOVuL4UVUvSzohwn
         3escsA47VtXqG/EwvIi7x/oyDhgdY5/6+UpP/ArUCyzjfsJ+09i9LYg2wvuK5XbVb4Q2
         A2s8UlJDl0SCKl58Zk7LQHIhzu3m2LdX7wqmYiFrp28lbVxMSyhC2ihjw2rcnM7oUJbx
         dmig==
X-Gm-Message-State: AOJu0YzYMM5bAEDp3a9LR3Jhi3nPHzadAYAOztyJT8tl92pxtBxrse3d
	Ksm8v7ZaZzGv0n12J5B2zpxw7Abh1PHP2inqE+tg0yWpkYyiOrC6
X-Gm-Gg: ASbGncuL+eVqK1RvWctQ+0tUu9lSh4KHE1S4hf7IsnxPRPHIMVqeKPBlS5pkivi08A2
	HSNBxGzhVpHcjMehNGfzChCBGLTDE6vgUYAOxh5FTqYEEWJw4BmFMs/GFdTm1o5FSC5r9tTMOW3
	0xk5htny8pl6GDPz1niDD7fxJ7AtET2imuFRqV3LTMq5IKRYkNGo8ed0JJsNqE3ciQR1lwlFtNN
	SN0Sz01V2lyfavE9cq4Kro9QhWWnv1cVy1gJw+v8K3S+EgODs922crjpUMNFjv9PCE38KK83+bG
	IHlI3eTu4j4QTH3dZ4os2N2DkFJXv5a/wqYOarzIs4QmMZO06mS9QXAy4LnIV5v3XKFSqr6BfdB
	Xni2GktYVo98fVSbwSjij+5J58oZpdIStiYWeILKbqFEE4g==
X-Google-Smtp-Source: AGHT+IHF69aRwz3TZ1NaDoib+tAud/ycJsSGFVCOO3bK++WRTy36kJlMFxYTEpVOplk/jCEwcufrxQ==
X-Received: by 2002:a17:90b:55d0:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30a332d5c99mr1058275a91.6.1745965443080;
        Tue, 29 Apr 2025 15:24:03 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349e3c37sm68489a91.5.2025.04.29.15.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:24:02 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] nvme-tcp: select tls config when tcp tls is enabled
Date: Wed, 30 Apr 2025 08:23:47 +1000
Message-ID: <20250429222347.2215363-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that TLS support is enabled in the kernel when
NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
used out of the box.

Fixes: 675b453e0241 ("nvmet-tcp: enable TLS handshake upcall")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/nvme/target/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
index fb7446d6d682..4c253b433bf7 100644
--- a/drivers/nvme/target/Kconfig
+++ b/drivers/nvme/target/Kconfig
@@ -98,6 +98,7 @@ config NVME_TARGET_TCP_TLS
 	bool "NVMe over Fabrics TCP target TLS encryption support"
 	depends on NVME_TARGET_TCP
 	select NET_HANDSHAKE
+	select TLS
 	help
 	  Enables TLS encryption for the NVMe TCP target using the netlink handshake API.
 
-- 
2.49.0

