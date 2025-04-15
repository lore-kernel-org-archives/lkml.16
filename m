Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41805210F49
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685184; cv=none; b=gVWVU2Raok9g1almwidKIzaAM0Lb9C3Sqm5YPMhJOiCoYcXgfE5QHXSs2ZAkz1CVsz6MinEqmpqJj0me++Ymnq0BA2DAd0WFwGm7ilIl7OYPgT6T0sGsL9f3Rf+LuFuvmxcCRI7qMaEzNyocglv5Ei7V97i/oa9zE5K0BQYnw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685184; c=relaxed/simple;
	bh=hQOJab4kVrFQvrssWHzPZOIBnHti4kboAWzr5RL2/NE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hyIlJeUmaLDCrID+In5YMwVbl945yeKHDzqHdsuKNEvMRbcAVtuGMMIGg/gcUNTZwVALUClthtBSzjau4yLsAiHTu/Wheaq4dUyLMCwNB6977Uoi0dHkSPeR5UuAlwCv2zY0CPjuSc+egjkRKaTgXOIKK5K6sUIHfNrc1V34q4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iPUM5rEr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iPUM5rEr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de12bso68172205ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685182; x=1745289982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HknBZVJEEwldsJF0essNl26exDom/3YV3flikzCNEqI=;
        b=iPUM5rEr/GGKMpqJ3O3V/CgT/8xGPNFm2D9Dk5Lbl1S/JDn2b0Vrqrrupmn6ScBgUc
         OQAn+tNj965RFcbbOSd4/0kXpvNZPsECiPL3P0DSPLTgsYDHTGC4CdXhmMwiSpq+ngEl
         fxT+GlQguoMrEnDoDZidaIidCX0Ep2qbB2eZEgOB8p25eIQu35U0TfrgBTA5IlgJPlna
         vzAIKjRLlUTGzqYm3sDpspbZ5E0S+yytWuhm4ixC/7ev9nZuQMDdFFquok8F7nM1wPNG
         uyKoh+MFLq80mCig10xfzbILSxSRsCeoo4LUIy+fPV05O4agQzsex/S1h0A9t6NZPaBm
         rd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685182; x=1745289982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HknBZVJEEwldsJF0essNl26exDom/3YV3flikzCNEqI=;
        b=h6f4u4swVJuz5SaCAolL6CrI4K0IwioncyP/ZQpgpQHHR2dPV817oWjJt+BE3J7XsA
         HfIh17KclkTKYT957Cb0ILhKetaclu493H1XeMPvAgjYM1z9XXXPJqw+ZuYBD4iH8u9B
         wWwDWpHCJt4SsIwpIGC/BAkwe3v3EcKjrxr+rwnsti5CE/ClP5acbxvKUNlbHpW1JOGL
         UEtEeRe3/qtqMBN+7T3ZpNufODxyP9sw67qcRMe3fFwYvSBxW+krYd6YZ822a/c2CTDb
         XnIWnmE0ci8dRVkDKX9zvyG4DW1hCwb20Fd8GWL8Y48f8bwqtQeaRkW0QZtUEOQyp8Kk
         cqlA==
X-Gm-Message-State: AOJu0YzpJ/x9eov6NIT3Qw/wz9ohkEQ6ParYT8NeuFlHfz/aLE2hIZq+
	RbK+FrV0gh9Agx3GM6y3snVHshf8FkGRRPhIK2NPbLpRFtb1qpEN1f4GJbFpMj4=
X-Gm-Gg: ASbGncuAf/2fTu5GCmjD7U5EEFxaDvrLoRC5DDSYu7x3xCEbgePhzT3bnxBEbdj9Typ
	X0klMXtW4UtmahLaKJS9WRkzwHfnG5XNfgus2A/dhNh4RjWWzeCaoVPqSgn+eVi6XhHozxu+WHE
	xZCtdiVhtYRzfOobewVzS8gG/QguxPScVIewaAo+CZjCLJxXdUjhfoomyS9FmeM2Kl8q0mBvwYQ
	hJcCaMVOxY/UVse46zTVXZmvtRH0GuRLr1W3GyCR8c14gCo76K6njcJVJZ0hTOCXNuXzdiB9B4f
	5PNF/7DXMKaE6acUGxM1i7mZt4C7bQ1Y6ooEl1DOmhTytyWlkvQ1VGUfF1OIyW6FkrzEHA40
X-Google-Smtp-Source: AGHT+IF9USZi2XhF57yhEEp9osrqi/g5DdA8y8Taoi4iL31Fzh+/3YgFBVfEBC6Bksa7uUzxyxne4g==
X-Received: by 2002:a17:903:3c44:b0:223:f408:c3e2 with SMTP id d9443c01a7336-22bea4b6136mr205639305ad.14.1744685182592;
        Mon, 14 Apr 2025 19:46:22 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.46.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:46:22 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH RFC 05/28] mm: thp: replace folio_memcg() with folio_memcg_charged()
Date: Tue, 15 Apr 2025 10:45:09 +0800
Message-Id: <20250415024532.26632-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250415024532.26632-1-songmuchun@bytedance.com>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

folio_memcg_charged() is intended for use when the user is unconcerned
about the returned memcg pointer. It is more efficient than folio_memcg().
Therefore, replace folio_memcg() with folio_memcg_charged().

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index df66aa4bc4c2..a81e89987ca2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4048,7 +4048,7 @@ bool __folio_unqueue_deferred_split(struct folio *folio)
 	bool unqueued = false;
 
 	WARN_ON_ONCE(folio_ref_count(folio));
-	WARN_ON_ONCE(!mem_cgroup_disabled() && !folio_memcg(folio));
+	WARN_ON_ONCE(!mem_cgroup_disabled() && !folio_memcg_charged(folio));
 
 	ds_queue = get_deferred_split_queue(folio);
 	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
-- 
2.20.1

