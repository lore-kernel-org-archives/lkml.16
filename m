Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A654315CD74
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766353; cv=none; b=tJyKJ72aPQgc825dTCHOqYs0CIY1gngjNjOXspgSLP0/K8khJafieb+fw6T8mDW91xjkgXjuMZSSngucmvFVeNvV5n42iJc1tOdu7Ejg5eX4pRPcOhqqzcC4Yn69J609hdZH8DAMjT5YXX+zuqnjCztjY+2vH0VjvDmS2b37S70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766353; c=relaxed/simple;
	bh=DMgFGguELIIMFeZnfCavfvUIMwUH1BzOdhi0w6qcoao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d6ZfHsV2OU4jPI3KMrG7+2EVPnAHv1XNyDQKvuu8jjdCWHYcW4il0cWPb774lNvftRLGqnI8F2om50qQLNIfJ3QUu3TuU+W6dQKY2CWf04pbr6/QiXGYBfwb3u6LjeyHfoZPVI7ZBfp5qTyHZ5VygmC9Oclqfb7sBItYqWqwLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GhXHX9pE; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GhXHX9pE"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 787043F2B6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738766347;
	bh=Dme+YavE3h7VKwtVCWsFypxmxtFZq863WhJD/6LnYDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=GhXHX9pE+4J37FUAXH9VWjgMB22PXxqP3qviMwYTTcSU9qqI8sV0SHVb/vUlX++SH
	 NcsKeEryLoCre0X1xwYhfNl5IkrpPm8/k2XCymO5bytC5XrVSUtl3cncuP+zqDmtVo
	 QEkKFGCwVwW1prlY00Te9LMZx0DwaBFAufX1UCTELKq1h9YrEptXKhsf9Q7iD4E3n/
	 cS0/mP84mDzkf3x4LqWW90IkgTFjiUggjciVNplp1njbzlRGA9dDjevKgV0w2yJl0C
	 IAzrPYjhEWe6FpS0mpWmzyBs75TJMBxp1plfMRkocfxip0VgBcUmU4a1YxOk3YEh01
	 5qaQ7N206gKWQ==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa67f03ca86so520119166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766346; x=1739371146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dme+YavE3h7VKwtVCWsFypxmxtFZq863WhJD/6LnYDU=;
        b=dpwF9VDlEqksApv84MItWAZOOTzoQJBhCfsbor3bPYXGn1lcqiU1Guc1LGpVCc0+sJ
         ihgPWi2jetpc8N8Tg/huOIAr8yEhZiEyZ5iIMNewCJZsi9WO8aV09yTUxceSZ6xtfdjj
         aLmjm4aEsE0M1/HOjZMJE0/roNNYwktkFV4gNzNSNovNcLXhU2awRtJ0DbbH/Lmg3z3H
         6upw4cuCcEBTNssm54CrVAvBeCBhf/LrV1FDDq92KT6MwvksqLMCIJ772dQd3LxfrLuH
         uIcjEXvCxeoY0aPc/tXT9LVTxQDgZ1TxuMdSnPkmw5ORmcdOROS14jfPruybxaOFrF/d
         tiug==
X-Gm-Message-State: AOJu0YxxwpEG2BZIqY7iiFhuPGpF3yo6Uw2UK+E8avF/4HW5ZAodhUMi
	iY7DwXEEpMeL95T/ecx1eg1prU65taud/yjCaHila3R6yFNeqHuoRKK1gjrQAeD1ZHUd1TcMk0H
	q1FeQ8MwcTKED5tjzRfwPuZwkZbDq17PLGaMtT4Pu3L9Qz0mTwi801U2OhLqex1Y5eTnY/Nmann
	k5Jg==
X-Gm-Gg: ASbGncthZo7YK4NUxQzZu42vR5viXdRdoXivGCAXIKzH5x41LJGEarAlcr56L8Tpoa+
	qCyIDMtpsSrFQfsft6TABhaJHEbHqMp6usGCoNWhOXxw+yoBYrXK1gBhC86L+cjVObuY4D/hH/I
	hQBanAIAqfi9IC9u0bMkxQASsIYMxvut4CbAFFk0LJi3fe58Q3QXnWngf5HkJZynNkBM+tJ9Z1E
	0Dav0pX55oRGN6c4YPBl/ciJVDaIgBZrJhy5AoNC1CpAJKpe/1BUfZs9K+3obdcjkD/IpIt8DVr
	IHZGsX7nm3nFN49885A=
X-Received: by 2002:a05:6402:3506:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5dcdb775fbamr7771724a12.32.1738766346349;
        Wed, 05 Feb 2025 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF70Az63p7FGVorzWY2EiBTjmxe7ybh3PoNumytu8JuoGgxV7u2ogC9A7h+McO4xrKdNx++6w==
X-Received: by 2002:a05:6402:3506:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5dcdb775fbamr7771650a12.32.1738766345763;
        Wed, 05 Feb 2025 06:39:05 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:6754:ef46:cf8c:ad7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab71166a8e0sm748209766b.158.2025.02.05.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:39:05 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Steffen Persvold <spersvold@gmail.com>,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH v1] riscv: Use of_property_present() to test for non-boolean properties
Date: Wed,  5 Feb 2025 15:39:01 +0100
Message-ID: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of of_property_read_bool() for non-boolean properties is
deprecated and since

commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")

a warning is displayed when used incorrectly. Fix it by switching to
of_property_present() as recommended in the same commit.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/kernel/cacheinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 2d40736fc37c..26b085dbdd07 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
 	if (!np)
 		return -ENOENT;
 
-	if (of_property_read_bool(np, "cache-size"))
+	if (of_property_present(np, "cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-	if (of_property_read_bool(np, "i-cache-size"))
+	if (of_property_present(np, "i-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-	if (of_property_read_bool(np, "d-cache-size"))
+	if (of_property_present(np, "d-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 
 	prev = np;
@@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
 			break;
 		if (level <= levels)
 			break;
-		if (of_property_read_bool(np, "cache-size"))
+		if (of_property_present(np, "cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-		if (of_property_read_bool(np, "i-cache-size"))
+		if (of_property_present(np, "i-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-		if (of_property_read_bool(np, "d-cache-size"))
+		if (of_property_present(np, "d-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
-- 
2.43.0

