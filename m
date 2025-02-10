Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0F1B414F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182197; cv=none; b=aL8cjVsvKO6McT+AGroq8+Vx7qaWdJBGPKuSYaWRu3Pe6WxXygqDYZjP8tCioSCFKm7sTpB69vsYbqbYOb5CitSmshmgbZ6gEo/Mw651QITyrl3LSmvK0rzpORogv5wdzItFzy7vHl1phoPSRdVzvAeUIdF7CaCgf7Qq/2dPmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182197; c=relaxed/simple;
	bh=2+mwnfbKufy4OvDFrtmeVvlPKoXLrFJhK38F7xoxAWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qr49mZ9CEf2MC0efwy/wk5N64fUGdFK7V72fjGVOvZbPD2dhHmhcMwf2PwHR0JxXWkUaWy5OwkxZWGwn8BxkNJzCPP5Y29dy915jYmVUa56VMWDYrPBlNVT5b0Oz4hY3QZAkUbG2Bx0bmMkqVIIttwQlSbIj5w2QeCcpXfMashI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXRJRhxB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXRJRhxB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f3e2b4eceso76444065ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739182195; x=1739786995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRIZPtgDP2C8BHY1VNSmDt2ecW2TOJuFsw7UT614zPc=;
        b=bXRJRhxBSvhXioLhy/8mESOTcTVXjbKJRtTujFCyD4VMPZx2F+mspzE1IaRwdqVv7u
         7khdY1/epJym8BelL8dCSrpgxB2aw1WtMVcNbjaW4OtT6g+fdkApuEexztxYk3Huvy+V
         FwhqJ0NZCyncD81cBVcVDuR1CdbfGNIf6wWlCyHCbq4AH12rbGPU7PEtn0P5DNwZICNJ
         AWK6shiSs232Ep/3T/B34s+iN/tkaeGDduZJKruP9UVxnPW1uC7SNOxyk1xTiuKdQ/em
         o4IUnvtpiiNKK/VNjtkAacTR6L8Mhrrf4xyloGVuT5IVS4zelZS0N462i/IGAFg8pZsR
         39SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182195; x=1739786995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRIZPtgDP2C8BHY1VNSmDt2ecW2TOJuFsw7UT614zPc=;
        b=duNBNxug6PCB616V44+rt63rgj0rlSmX1d35ttQxud/nFW1ut5FHR3vNsj2Rzfnl0M
         SEGfBkEAa+GxHtsh8j8cbdhURyIoI0OOOVPFIGvR8FYoJxA28Fo2dQVEgUSZmcXxI6Mq
         HIRFIoiMTj5F5+/HcUHWriqd/Wi4uDMsVhvduIoAAw5NWeumI9MD+NZpEYWC3aWzZAu8
         1e4xur/A6YmWh9kgMMYhUcy8XZnP+avfWcxIOQv3drN1ONJoeXzUbZeXzUIqIn5anSib
         bP+CQ0aLa+vlh69oECWFqsuA6stfmB6vOSO0UKxMfZuSXi8mizmIOzc7OAy2ffIZPX0f
         jYiw==
X-Forwarded-Encrypted: i=1; AJvYcCUcqD9QxrA4s7kuhMO6CTUJbPMJ4uJkAR0YKqCjL2MtGq14JGtWWsnDdM6E2F1DnskW8nrL8k4bjiKamFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3wLb/4lMWDeab5GcPZ3n84HAl10aQlv4sO25Ad7vMAdHkotV
	8CgsOVLQRmyjmEJ6DSFNap61qE8Qx11HMe7ZLUkc4fWLkJsjlHg8
X-Gm-Gg: ASbGncvnSNjxusUq29YeE55HQxq04DZSvBiyPhyet+1uPy3I43OStPwFaSgEQugaX+t
	BJMu6RXujmzRRVnI/BviJSSP78fCQTttoAJD42eQ01zuhlt/bicW5LxIGiud7jUArpBiBekv5fi
	anhV+NZrr19tlFOBuP2i5ZbGVTqOHJcDf5jSd3bgyGmFqz0RnS6aUcCXDLZRa+sABto3Trcfjcx
	WZfejZvFOhD35mIUvx5g+UlWfxbnFW8AtWO0G6B/OQZvoI+DMEGhtafxB/dtWf5Q7r6W2MW/39l
	LpDd9xjmEAppIzx+ywoWX422f/de7SL7E1NZU5bFOeKd
X-Google-Smtp-Source: AGHT+IGvmuwhM8mylIYC4mbU6oGvR0C2pi9xpQjfCFLm41Vg7sGKMUgoorCoRDGPRO1eMmYJYvaS0A==
X-Received: by 2002:a05:6a20:394c:b0:1e0:cadd:f670 with SMTP id adf61e73a8af0-1ee03a2432amr20684351637.5.1739182195260;
        Mon, 10 Feb 2025 02:09:55 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:a0f4:120:366c:bbc8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad550abefadsm1849117a12.34.2025.02.10.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:09:54 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: akpm@linux-foundation.org
Cc: zhengqi.arch@bytedance.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] mm: pgtable: Unlock pml without branches when !start_pte
Date: Mon, 10 Feb 2025 18:09:48 +0800
Message-ID: <20250210100948.312130-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When !start_pte is true, the branch for "start_pte" in "out_ptl" label
section is surely false, and "ptl != pml" must be true since "ptl" is
NULL in this case.

It means both branches in "out_ptl" are redundant, only one thing to be
done is to unlock "pml", make it directly unlock "pml" and return in
this case.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 mm/pt_reclaim.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..f5d5c42a4679 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -42,8 +42,10 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
 
 	pml = pmd_lock(mm, pmd);
 	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
-	if (!start_pte)
-		goto out_ptl;
+	if (!start_pte) {
+		spin_unlock(pml);
+		return;
+	}
 	if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
-- 
2.43.0

