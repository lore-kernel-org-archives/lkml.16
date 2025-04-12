Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B673477
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477025; cv=none; b=Am9lNDFpblg/rVvVeDXcDJen8PFOQI2SyCgOHWb64/2KcxT2fNBhTp2gZDWhjJkNLtJe9Ip2VtfDk3CWp03txTT0peyWZb/HK8y5DPnB2fv/B/dNdNM3Xa9M+mR6ZULWhcg20AffvabqPFKYA0oU2sPpMV1GKwaAKHmbEH/qbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477025; c=relaxed/simple;
	bh=RzycCxqtsOnySu4060tumn57SXIWNnavKbmzSVy10HU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NiOfGp0EImD5XcgpWMHI3wtSjVrNMO/kd7sglsiBq6Jt9hQ94hz+pkgbGi+FWZb0SOnR2R5v2jRjt1LtpAeHeQmH+5b309sPbsoTyH5IYPeJpAaaBWPNcDh3OPxU7Wba/Cugyg7Rs4fglIPcRE4SclKfkwLHWMwHPYYxlNOBoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp3jsYnt; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp3jsYnt"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5f20d512fso55384485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744477023; x=1745081823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=mp3jsYnt0O6CFgGGZKJqKoP4KzaZ03GvcTeQXNRjPqAnWlSxtYp3g8E5CGMbi6d2fj
         hW3phR2RSiphXvW5U28S1SiTOK/Eech2NzxKKUeTagtpc+GvyXn2MLCkU2ucUP3YFqrn
         GxJy+IHFDVC8kntm7+IoT1GftosT6z759aEnAVq/nmXesLZ0zFqKH8iljvUuQJmViYNi
         H1co20PPttEwTkHmoZpJCiOCiXCpFj+SmlsFGt+toON8VQm96p88a41yyNqe1dVK/6Mj
         5YWnobcR5D3RcapIAmzT+F9pHqjv+gUrQcLr2usZRPdSYJGtu+CJNZRRcav8XKCp4KkS
         5TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744477023; x=1745081823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OAUNtzrYtxLdmxfVBvMY5Gk3k0kx42SFNBtSsQElR4=;
        b=dsUyDREtXaO0Da8GaW5y8JSq6P4g0cnn6SGm1ksGFXxEdwCVnjuYx4QJj2rCRixRXY
         fYLuvH2331i0ciB4o63FJojDPIxwSQTwb/jpOLET2jXWSi4EI/w3mh5PSPlWlKr7A7s6
         3F06YNO0/wiR8VFhFU7Xj4LnRD/pCaYW+DgtdX5pI+D2ItJ2Juf+Rgdn5rpmqARkTq5C
         XXxNCTuqrMeOGuOZIC1NwTU/KSO9IUGs5vXq1MMK7hLFn4rfEo4+aVe+kf1dkj1sftZK
         lqg7p7tb15Bz7Cue/QoInrG8R+hh1xnHRAb6vekqiVbv1aurNTN9wswga33oA4Wwsa72
         kfQw==
X-Forwarded-Encrypted: i=1; AJvYcCW5eelHWvrO1YP51sbbILj2M9/z/UtJ6tRfzbOw4DdBSnpctyHE5r1Pm/4rHxkAs7nXeUDS1zbF66uWQ7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0oyCRybCxJXekf/gQ2h8I9pLdjzakfdIjkOHTkg1E/21JFDlS
	oy0xOeWjNMT51zTskquGMbkDM3uRUQ770d4uuWl7RhU1eSj0BVY=
X-Gm-Gg: ASbGncuWK4QxROlH1sKPxnKG8NOPxv+TM2JkHyK9NDbwL1QdZmtTxnBuEPoFuwzclrT
	KWQgjF5cQvPsqoMV3UbR+XOE3ztSod7976yIRiqdye8bDHAiUz0+tt+RhVEBnkNEZtcYA0A5+kl
	ZyVlAAuk+ss4rKxKOsw0ruuqKoOUN/5NOwO69fcAYaWfR8DyqXDDoRY68tJgi4EnioVHteYUoYH
	2NNaF/REi2cMyuvi5v5FR7/GGRmCZs06yQXymbHGJrR6T2kNoC6ldFYHOTHpKwOoXET/4D1+nj3
	PfgdUz1Oq+eknOWOTcm6EjcmX/RAvnGMIlJypPCoN+0FkIui
X-Google-Smtp-Source: AGHT+IH8bGQWXcYiS6oP92AvgrToxoeCNlaJKrS6pTKqr+tWtGd4xgrw6ujWrk7k9KKOoduS3EC6pQ==
X-Received: by 2002:a05:6214:1ccc:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6f230cb46cfmr37544306d6.2.1744477023136;
        Sat, 12 Apr 2025 09:57:03 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea106a2sm52300916d6.115.2025.04.12.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:57:02 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	arnd@arndb.de,
	hdegoede@redhat.com,
	mripard@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drivers: soc: sunxi: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 11:57:00 -0500
Message-Id: <20250412165700.2298733-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_get_address() may return NULL which is later dereferenced.
Fix this bug by adding NULL check

This is similar to the commit c534b63bede6
("drm: vc4: Fix possible null pointer dereference").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs")
---
 drivers/soc/sunxi/sunxi_sram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2781a091a6a6..1853dcc806ea 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -122,6 +122,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 			continue;
 
 		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
+		if (!sram_addr_p)
+			continue;
 
 		seq_printf(s, "sram@%08x\n",
 			   be32_to_cpu(*sram_addr_p));
@@ -134,6 +136,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
 
 			section_addr_p = of_get_address(section_node, 0,
 							NULL, NULL);
+			if (!section_addr_p)
+				continue;
 
 			seq_printf(s, "\tsection@%04x\t(%s)\n",
 				   be32_to_cpu(*section_addr_p),
-- 
2.34.1

