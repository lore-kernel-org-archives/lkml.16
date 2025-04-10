Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46B1FA262
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273162; cv=none; b=gDoRw8Bv2+fpPkUcgqmfb6NRlMx0cFS7Amro0J77F+XpKQhE5uvfriQ0Tf1HpgKdNuW9gfqNsTUAPOd4sfF3U884LZPP5qXsAIlk9rCDLUj+Gb/RuE+RjlcpAEUw9+w4CtbcMrBEnGYh8Ro39U0OJbcHIdVx5kQU5PfKdnAijwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273162; c=relaxed/simple;
	bh=nWkV06hzLZs0d4VDgM6vwSU+B51VIwbN1xrlKxQrLmY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D/YkDsu0ZwB0kEHfI52R49QK/nm12uWmJjr+XoL2Fe2WAHvCyjyiLNg0tthciy4mKhKFbCnZ6caArgjCsJ4tzSCDnpn+0pnt1sGCU4kbAPRwkBu02oQ9UmGrKmjOwXgNBk+NiGr/2mW0nzOXh0VUpLee61Y32VmqRcfsE2ez+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g922euQT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g922euQT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2241053582dso6837945ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744273158; x=1744877958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WMNK4T/HAXbxP0c5nSxB7WqEQuDCDLUA/LOjFIKTw8=;
        b=g922euQTreOET4oAGCidk9h15LBqjGx1BdtRPrQoBbDNWqiDN70H122gMpO/Kg5BK7
         jo43UECOkdKfF7h3GOx6BUGJmbB8XeiVUAy7JPmPS/md0+6WvSbU7BhpZhl0Ois7wKrA
         gKmv8CPESmvp8IOt2dmDXE7fV+yrI3kUvJ7MsRnmu0EOwc5pOvq+vcTDTk/syEXgtQA5
         OqEwi8ljltABH8vQ2ROqxR6Qg6RmT989Ax1P0rQ1Q1HD9D1cPvlCmOP0Ni4t0wCjP4n/
         4JFCNDK0q+knA+m4uUiZCIECMEyZs2qILILbFpVzxKVbxPtbyeGtFcxydhe2DfVFbcr6
         qflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273158; x=1744877958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WMNK4T/HAXbxP0c5nSxB7WqEQuDCDLUA/LOjFIKTw8=;
        b=CCdRJm4sdu3nsOV1T06Up1KWDpfdoMx2ZOeuB/TjwHURWWN8dypPwQqO5S2mY1NXrz
         rFXL5CWdyaocjVD2mELCPHAIyhUwAxkVFOpsUxktaRlhdztM/3JIQAq80K79hwpgBRdV
         JO3pUFczYtnDqjDdh20jHJjm2iIgDUgDdHR0LQxoGULkDbSBhGw98FuTBcFBR91jLGH9
         LBjj1m/qoG8elor+YS5+BgOvVld5V1WWaI1IybyQdzzy3nQu0dla7cjnvpX4HxMJhyPh
         M2sKsK8OuU/MHAODljP4U4Da4dT8XFnd59BZ7KBxjqz4PBSOQIUd8Rp8he5qq4sa/moJ
         vDXg==
X-Gm-Message-State: AOJu0YwHqEOXyjamY+8me9x7DoSMWiUCh2YkNRFcAkkLaUKEtK/VdEG0
	AqtXZrfORhWFv6e7JN9qkhlt86RBKV2b7lSVmXQ40hPQq9Np/yPX+SIkw6KjC5Y=
X-Gm-Gg: ASbGncvxxTNgVTpQTT6P7QP/VQwR9gFP2mndMcfaUYdOQWr7CjxjCTI0NeKGBvexp0S
	FOgEk1Bap52jX5WQE9OeDxryGO9QRRmELEsX2Ruab7UrwF4uE09FA5dV8eFsio4NQBvIeHLxtmH
	hhWCJAbKp9iYTNFBhbtm+anubCABKQhTJvtQln9vGCPvFpo/D0CAUe9cgB0BaAKTD7gwDZqHtLO
	OZOvrJIq3HvnCNHD1lKMu9SmMPevgkzK0GQHXVyoh6WuHKAoPyIL9Wj0pr8p3vVeJGjwmz8Fy9K
	ugulDCXiFtzHxoBcZjBVpfcSSafIEObryaSzOqJHx9cKZPkTQvYTwnxroJgZvtKmXNx3F0sKwA=
	=
X-Google-Smtp-Source: AGHT+IGtxCPcjlOxTXUr2/79MqVJQWBnBVjOCUpd/dINEd2Wk8WKKzYVYItvH6r2Re1mb6kWmGXZnA==
X-Received: by 2002:a17:903:2a87:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22b37e1af80mr28407585ad.30.1744273158539;
        Thu, 10 Apr 2025 01:19:18 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6284dsm24806755ad.38.2025.04.10.01.19.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Apr 2025 01:19:17 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] mm: memcontrol: fix swap counter leak from offline cgroup
Date: Thu, 10 Apr 2025 16:18:12 +0800
Message-Id: <20250410081812.10073-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 73f839b6d2ed addressed an issue regarding the swap
counter leak that occurred from an offline cgroup. However, the
commit 89ce924f0bd4 modified the parameter from @swap_memcg to
@memcg (presumably this alteration was introduced while resolving
conflicts). Fix this problem by reverting this minor change.

Fixes: 89ce924f0bd4 ("mm: memcontrol: move memsw charge callbacks to v1")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memcontrol-v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 8660908850dc8..4a9cf27a70af0 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -620,7 +620,7 @@ void memcg1_swapout(struct folio *folio, swp_entry_t entry)
 		mem_cgroup_id_get_many(swap_memcg, nr_entries - 1);
 	mod_memcg_state(swap_memcg, MEMCG_SWAP, nr_entries);
 
-	swap_cgroup_record(folio, mem_cgroup_id(memcg), entry);
+	swap_cgroup_record(folio, mem_cgroup_id(swap_memcg), entry);
 
 	folio_unqueue_deferred_split(folio);
 	folio->memcg_data = 0;
-- 
2.20.1

