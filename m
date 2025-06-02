Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4462C3262
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881430; cv=none; b=Qr3o3NdC7dQAZYlQD1F+VGv9HbVskC0CColfZbLEObeqyCvnafdWGtLwPolwgwR0fCru9yXVuZH8cL2nSLkmBbXESk6/ui4b/KAPhu3wlk3DKPgxf550yLONk2q/5YXgSJFPZEELbdDIiEuCKOkwokV+14gObDLEto5NkidJjoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881430; c=relaxed/simple;
	bh=VOmGDROPDYBJlPcJiu8eIbIRTSEpG+s5uS9ZPIBk76s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uU7bXs21+Dkv+01iESsbwrZ/xxktoFMH7vR3N5GIroOFOIGfgXvVFz9NIPAdMz5QgHtqIGhglrJk/gZXXvjlZHFhMyVjOxH+3Plt6LWBub7V46yGZscy+i19+GE6DAiDPEZ0BaaHwkZTtQDksj1x0uVAIXQwLqocesTey7yr+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXGUQCE8; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXGUQCE8"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-708d90aa8f9so41547177b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748881427; x=1749486227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx/1udL/q8PlGAipoyIKl9RK0k/YkkPXl+dR5dADJ4o=;
        b=JXGUQCE8slgOc1kET9pJUHKgoJTvxScny3Puwvxt08gpy7SbP2ETKucGm+VJsrGELJ
         KcFt23gsSPyoz03RRHixYZEHX5aDtBC0xIo4nqqGHJv0h/oEuWF3959OcQLth6bvO/0e
         dg96FiMdlsABp6oXOZCbrnm42xiqO2GTVwNs7rEzSUwkqlzH9p3ZegQe1xVhAQ4I04Uh
         LOCIXXD3lAiUunq/cDOqVXpi0WtH/oi7Ot7mebEbw+AWTqWd4O2tJko5tADsv+ERo5Q6
         ucbMIV6eXFWc2dYA935x7PSXzNzKM8JREV1oo9zLNWWe33odQFMG1SyT2VJV4fSC+cYq
         KgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881427; x=1749486227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx/1udL/q8PlGAipoyIKl9RK0k/YkkPXl+dR5dADJ4o=;
        b=KoyRJZp97jXo9ey9Oa+UfFv8Xo22ShS6koytuwPl9iHVpW2VWTUi3hPINs7nMJnHWr
         Fbh8qApmyFM7HRPcyK4eyNFuMNnunEiuFBfUgsF+Pg6zqsELVCP5YujLITj2I60ERfFj
         UBc9b0EdYOV87GeSfBV6pt2I6puDT0XplpwErCYrazgjLXxnAmI7gVi/Q/uiaV9O2eHY
         CdWRWNX0w32Oq7i6kF7Trve93PJnDSzWtaOpuyziakbeGwtCsRleNwbp56uFEtZRVW5W
         RD/LE0uQvUXLVZxD93xXPQrt8bu0mfsvu8KsNlxYGJ5KMGnVnEFCvkGC74cIByln7CC2
         75QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJZLPkJBme7BzlsZ3/pvlqZj8LsHEmWKVL0hPY/3dn8knKSo4N82kQGEQ6jCSKcYBLQnakqDGWc2+uK1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YycSd5hIJowfMEyVf3R48xTm9K7s26Zaki7nJU5Jx6QcuMZ8MLT
	3BX1vxKKeBINf2kc0vzgdeCsh77qqv3fuvG2g1/JemhlIAq3OHQurNSp
X-Gm-Gg: ASbGncsAqx8eChkBtw+Sg7IjTPELVwr7GTQU28JLwkj4Eoanmq0isafAo/JN9UFjmch
	gIYsTimfzRe9oKsmwnvGCo041VCkZTB0uPandT7Kyrd1bukKuSjl0BixSL0tMxh66eHSRvrqLF8
	fEY5hDVVJ+OChpw8tYKavoJgYvPV2AfcfdhSlXJ5vKL+MIOsolkUAK0LZSBZH72y1Yw3nJ6sFJC
	MGU5xwq3u+nOuZcWP+57P8gd46JxpQNbYk5DK3HihLjMLkuKK9uCSIS5HoIFGVumYdDknc23Bd4
	etrvZWhkgxfsTKnxgK5X7iP9lftzJz0sldoDyA0I4nKdsWnr9oE80Koa9IMQ
X-Google-Smtp-Source: AGHT+IE/ggDxXwpcIAkuwoI4AgFW3YcPyj+8gShcZ/7Xs4A4hhvlYvqwuWUj0zwSIhiAAIa5EVD7mw==
X-Received: by 2002:a05:690c:7488:b0:70e:5eda:4810 with SMTP id 00721157ae682-70f97e784dcmr214870587b3.13.1748881427134;
        Mon, 02 Jun 2025 09:23:47 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:8::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad2440fsm21389277b3.123.2025.06.02.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:23:45 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Gregory Price <gourry@gourry.net>
Cc: David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] mm/mempolicy: Fix incorrect freeing of wi_kobj
Date: Mon,  2 Jun 2025 09:23:39 -0700
Message-ID: <20250602162345.2595696-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should not free wi_group->wi_kobj here. In the error path of
add_weighted_interleave_group() where this snippet is called from,
kobj_{del, put} is immediately called right after this section. Thus,
it is not only unnecessary but also incorrect to free it here. 

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506011545.Fduxqxqj-lkp@intel.com/
---
 mm/mempolicy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 72fd72e156b1..3b1dfd08338b 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3708,15 +3708,13 @@ static void wi_state_free(void)
 			lockdep_is_held(&wi_state_lock));
 	if (!old_wi_state) {
 		mutex_unlock(&wi_state_lock);
-		goto out;
+		return;
 	}
 
 	rcu_assign_pointer(wi_state, NULL);
 	mutex_unlock(&wi_state_lock);
 	synchronize_rcu();
 	kfree(old_wi_state);
-out:
-	kfree(&wi_group->wi_kobj);
 }
 
 static struct kobj_attribute wi_auto_attr =
-- 
2.47.1

