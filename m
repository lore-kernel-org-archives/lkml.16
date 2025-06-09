Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5859F9DA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749428694; cv=none; b=P5ehEKRg2+kWHRvbOkn8+FMgne5dvJn88p1C+xPESwQCtxC94gZIV7rieBDBahAC1lwqlfuccpw8SxpUgDAqkpfGdn9GKiE5wa5Wv4abz1zDtt99cWIeYbzy7HjeoVKJOm3iR+rANmq6YeMg7ONO0vwW/VwNSXUJhf44iZrcUhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749428694; c=relaxed/simple;
	bh=rquJSjvGJ+wtF5ZVAETs9UN5d6Si73pw4J23mQTdWoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKVvko3TfFIMdF8wxZps0e1SClGiayf+53mxuq0Q11hgVAb28BkSw5y6Kkg8Qt4anMQeJZrM4BoK8RyakQbuQcnuzPLUlbw1R6dXeGlKeeJllBRTf4h1ifmBDg91SBE2RXEZ9HHQYS6ImVP4Hxcv7eTxIovTRmF/UiCJe6OLl7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgVBWG4k; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgVBWG4k"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c49373c15so2549571a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 17:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749428692; x=1750033492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wJLEqXBcEUC7Pc0ejgv94kJ5npQg3fsCh0doMBAxcs=;
        b=CgVBWG4kPhNukFw189t4gg+0eTx6uJOhpXMU2OM/+HLF0NsRWaqyDzZG8aTgtpnEDN
         vWS/qkqqr21RxodIIg2JY3lAbujaNzStviusoV5KaYWQLfNIscH1EoeREcUVm3tKBs6f
         HwZtrYowxiLkTHlLHS8SWTtAc0g6I9PAQdwbXD1wJ+veTFWkCAk32f1mMxqPVPGQwrNV
         1qLF4ZxTKbMU5tMYK0FIBdkVgMhoDmZnqY1doKmrJSnGYgoJ0ll9QsdtCGiULC/i/80J
         fr7C60BQ5qQG1Vf8Ayj/a9dNWMAPj6I1o5havh2VQvEUA4oj53tflCvaI70Ne5dShN4N
         /Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749428692; x=1750033492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wJLEqXBcEUC7Pc0ejgv94kJ5npQg3fsCh0doMBAxcs=;
        b=B6J44TIuHaCqFyrGrBR+eDLxvqwN6JAUelbBv+MMnQ36UA5rSJGJmuRS4YkPOwYDAo
         SOHI3Av7qdbtCC+/htS30vr7yGRRntDME5J22NqxrtiCOYHf15B+rF99nKhk4yOWECuB
         sJ7Z1gNQHuSWJ8eV4XnY1D+UQ4CU79oUO7PiUMbs0GFMlHq2bA5nwvGFgPhhc0u1DJuU
         A/OX+wC15ssoK7dkmyGjFdXZdd0V1Bv5pLcXtQEN9VdTM60RLDjaeJ8HoMrsQxFyxnsM
         vHISsMgZZaFl0vl7xqU2roS1IPyvqhBymWgw44bSfRbvDw3kRGZkKKbXqVpOYh3CxS7f
         zupA==
X-Gm-Message-State: AOJu0YxwHrgycLAnZqlAQXzZOyIjA7GQ56UJxPByZkQLkkiSUjiB/66+
	PhudcS3X7TZQ1x8QxL8bfIhdzSu/1gtyAamY+rycjN+VU6lbm+damP6U
X-Gm-Gg: ASbGncsLyna8PVq3Sll8rbIVML6356ESxEc+6dVDJEtgULyfsObOomk8b2/ORIDTtDo
	OGkL756cYmoq3S2Baf7j2zmb4MuMWIGNIb/CDKnMh7MTOODSvYXkcSW4I0rqRUElO7sD0kWjUuw
	/E1LMVZvVoGQ9YeL2FHu30gv1qDAQbqGiVll4De00B3crEpcohvW0iTRjVbQXzjbZnAqttxHkpG
	O5WREvoQ3ufARlehku3NFtWwS3RoFOh1NVcwqHJXi4mAhV+83nJr6cD7PYEs56yzaX7wnMxmQ86
	TIk7oOM2LFXLn9QunLi5GiIlkbgC5WO/wngr6F4gphMopgyZW6cVK9XRRXjg/IdCuq/VzPARx+0
	mY+6w
X-Google-Smtp-Source: AGHT+IFqN7/j7XAXflkcFu/S/cedHO1Rqzf7SPPsgEU36u/dj3bhPksNDTlWdFxw1EfqzHQ6ACb/UA==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id 98e67ed59e1d1-313472eb25cmr18500217a91.14.1749428691893;
        Sun, 08 Jun 2025 17:24:51 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm4578602a91.31.2025.06.08.17.24.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Jun 2025 17:24:51 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <baohua@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH] MAINTAINERS: add myself as a THP reviewer
Date: Mon,  9 Jun 2025 12:24:42 +1200
Message-Id: <20250609002442.1856-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <baohua@kernel.org>

I have been actively contributing to mTHP and reviewing related patches
for an extended period, and I would like to continue supporting patch
reviews.

Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 99dcf9036b9d..c6770ebe2927 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15845,6 +15845,7 @@ R:	Liam R. Howlett <Liam.Howlett@oracle.com>
 R:	Nico Pache <npache@redhat.com>
 R:	Ryan Roberts <ryan.roberts@arm.com>
 R:	Dev Jain <dev.jain@arm.com>
+R:	Barry Song <baohua@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.39.3 (Apple Git-146)

