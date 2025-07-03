Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E5EEB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525782; cv=none; b=gCP2cALWqMrhxxfJOK5+F068KS8V/IOjwr0WbEMmHaDhLnKAcuADzc8n+ktHhr+IX3LdNfqrt6m+E5cRd30FSJlqhW6UHWm2ZYoqDhZe6fiIJ19+ZGVe5NPF2TzPG3VbPYBFIPTO7N0e1nFgD7pHTEXgJNQIBgt8vjLJwmp2pis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525782; c=relaxed/simple;
	bh=cAevsQpXkJf/rFMwcRcpPCO3p8/9HHm9XvinH6Ochmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LH/FGHjF2LbxryBlD0CSfVj7rMvQJ7ZTbXVd99bd07dfKVy/VyDPkZ6QXz1sBlQ5/DhO4gG5f7KgUY76+9hstc7lXpFxt0tSX/jUduhEsPkFLPg5yeFY5h82Nsdwt/Uws9Ocr8dN0AsHHp3PF0DSwwyS21ts/fK5kab/vyivLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeetoT3N; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeetoT3N"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236470b2dceso45589075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751525780; x=1752130580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZigHOECn4qaJ1lW58l9LngcMkl41FGTMjqmol0gepA4=;
        b=OeetoT3NbLxeXNgnNLABROS8Ecf4CPZqTdlgpk1JnPMTqc5qwL7UY3bFVtRTGxQZpa
         COQMve4VLkknZqaXbqj6ePWKMb3iY3SDiWMPpMKrcoBhJ54q61gyr00j9CS5qevWRpUQ
         2KMs+VMCcf67LgzqWzjl6CA5jXy5AjvAGskdE5dKrlAWTMu4embOtalR8QMjxd6koh1w
         cGIDK3h6YtJbi5wP4yb+S4R3yTJlEAXPtxAKWswgz4OxoXn0yVvi2qXnnBSspXjxe3Ii
         5BzdEG15QRng/vQKc5xPRYciF4aQlo/ljazhzo9oC/ReGLX4YUAL8jfvcxG4L0voSCHl
         X9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751525780; x=1752130580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZigHOECn4qaJ1lW58l9LngcMkl41FGTMjqmol0gepA4=;
        b=wxbPOWdH4AxeaedgGHDz+fJHlpkN1ps/VC+uEqcj078ausUcGXshxcKlKPk0F3//Uw
         2TNnRID81vb2qJl8o0xNoK2SbZIL0qB9W7eiFxgYXrQDjVd/OO0jmoTrKjXq4m9SmPer
         MJJqsqwX77O2eYl+ECuj/p1U8xz0eCNrxEYjPys3BVBjoO0ze5u8qKY3udvCMxdPOjsk
         wkOL3+PCakX8SyI/Di1XGmy7iUIqBszME36HZeTqYFEazoheeZVED2CCJ3XBtuThibJa
         mB8ysN125dzhz3Mm/xa2u+etfKOv8VgXkIK69M8BkeUj7QhGLLlVS/tLCuhGSSF7dL+r
         x8ag==
X-Forwarded-Encrypted: i=1; AJvYcCUPkD1Vz4uomZa90TnRfQNhegd2J42BAeFdslqFhiAXHOCGIpbcyl3sWjoG6nC7/hJgq3Nv/bRSoIASe98=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmiOxMBxQh+OwmRCwxJBUGKCrBpX+7Eks6dOvr4h2UUEfSNBdQ
	w68R8MxKFL/SlWgz4av5Xk5unTlBY70ncNg7GGSXMMosKWqqW1e6EZmP
X-Gm-Gg: ASbGnctcNFlTLBSyQwV+CxsSyr2v4Oeryig7+pn2o3JeHJx+aMEmU+0EopViZnnCej9
	uO1tcaeFdYtf7CKpfTA+G6SgPoKgXYmY+Xp+At1Pd2NftCIsfuKasWfeCk5A610+sRDtuwlmI1c
	Dw3VAqG3MEhUa+6aQDj44QiljhKtK2nIbDYf7sGfQHVcPg4EPY5YMkgSuPKIRj6bnCTZFyyp8Kb
	SxRejCZRtI+o1RMcQWvvbaVA06m4rkEU2nJLFiInu+s7FsRUMIqcdy6v2dizEcGrVII6//Qap4j
	sHi8Sd/Cr1N4+/wn8aPFGjuWvJSJdhCPCJA1cVxHy85hfpr5wFLktbZJN2+BeZiqAQ5lG1g8zg=
	=
X-Google-Smtp-Source: AGHT+IGBWMWVc1m9CMmXyTiauW22K9buQdCepkxXFX9TQAbo/jW/0Q44iOnRmWphSr67cKNoAf/HjQ==
X-Received: by 2002:a17:903:1a70:b0:234:ba37:879e with SMTP id d9443c01a7336-23c6e5b0f47mr105442155ad.38.1751525780222;
        Wed, 02 Jul 2025 23:56:20 -0700 (PDT)
Received: from localhost.localdomain ([118.46.108.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bfbesm159281565ad.109.2025.07.02.23.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 23:56:19 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org
Cc: akpm@linux-foundation.org,
	roman.gushchin@linux.dev,
	rientjes@google.com,
	vbabka@suse.cz,
	shakeel.butt@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] mm/percpu: prevent concurrency problem for pcpu_nr_populated read with spin lock
Date: Thu,  3 Jul 2025 15:56:00 +0900
Message-ID: <20250703065600.132221-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_nr_pages() reads pcpu_nr_populated without any protection, which
causes a data race between read/write.

However, since this is an intended race, we should add a data_race
annotation instead of add a spin lock.

Reported-by: syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Fixes: 7e8a6304d541 ("/proc/meminfo: add percpu populated pages count")
Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Change it as suggested by Shakeel Butt
- Link to v1: https://lore.kernel.org/all/20250702082749.141616-1-aha310510@gmail.com/
---
 mm/percpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index b35494c8ede2..782cc148b39c 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3355,7 +3355,7 @@ void __init setup_per_cpu_areas(void)
  */
 unsigned long pcpu_nr_pages(void)
 {
-	return pcpu_nr_populated * pcpu_nr_units;
+	return data_race(READ_ONCE(pcpu_nr_populated) * pcpu_nr_units);
 }
 
 /*
--
