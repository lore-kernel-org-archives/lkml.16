Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432692580EA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204010; cv=none; b=TQdOmjafbWPlqUGeN2pElb5Cbm9kCVc6OfJreQKQXEImuzbacGR7qTon7Rv8zAe1LE/srx2HbDZLEYcDdgwkGRSuWpXMe5OtlPUD6vpxxVwqb3JdUe5qiJCXBIfC2IRBjYN9XcU+uHMRjtObmVCxdLSjFJj88fDO6aYJNLvjkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204010; c=relaxed/simple;
	bh=IpOaBfRshGKYZC+QupWyqrga0M3GEPRYfLPX3zHumy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g9CJYgRUer5Iutn2iJwr5skAaoZft3vj764+gVuU2OkNwmn7gLEwNvy9PZbPWSo+TmdT0a7r5k0zNh5P9mMpwZJ1qtA29a+lxxLThuv0+DYZBEiExf5z0okiBsfvWnLiYVXFTbhoZTERp69FWvHwAL4WyBSJeuTHNgfeotXhJxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tda+KE3S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tda+KE3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739204007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MEQtKpqipC+PTN4Th/631XgtJVl5K1IqFh4MSRtsc+U=;
	b=Tda+KE3SVLg/sqzZrolzmrHj25hn3VDqa7fRBU7bOZgCwOL7a2XOXICypKPMIZjBICOx5C
	FJanoTW/DFglmZAjxOMFpU9IICfC0PJ5W874c1+9DqvWXiArUNRavjtlfRBl6N+qWqJJTz
	AJbE/asnuYUWZP6n5izUvTrViWREi7U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-AhTURPYmOrCAI2VjikAZLw-1; Mon, 10 Feb 2025 11:13:25 -0500
X-MC-Unique: AhTURPYmOrCAI2VjikAZLw-1
X-Mimecast-MFC-AGG-ID: AhTURPYmOrCAI2VjikAZLw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dcb65c717so828066f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204004; x=1739808804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEQtKpqipC+PTN4Th/631XgtJVl5K1IqFh4MSRtsc+U=;
        b=fqu3w7pVCoN4HGqFjwZj6Y+SVSPjr56mm945svSEmhddjdP4DBxQAG/9YstjZ8AvFc
         xnfGRsklot/yXK+SJICS7oGQF2KQ8YiA65Q9VTewNiu1KUo28iyjt15CwwYklcty0jnC
         ZP8ZAzkHguiEkSIfCCLFkoWa/kQNAp4v+7QNSUR3skGSMjPuVsx/mxezH7MpOxbIcNKy
         CWhhQntbJIB+WnzU3s+r9bU6tPUqUK2ZQNmpIMOkcYilqQn9aX1fTpNfkpWJYkoF7U1O
         6/Trnf6ZToLnO3ygVQ3LxUWDC9rV2nDAZSWuJmiuxz6fCRr2oTxOu6oZ42VtUkkqJLDP
         iF/A==
X-Gm-Message-State: AOJu0YxqEDFf46BpXUbf1Q3zjNVTKhlIhkFlnFLE9jAFRzhSczuz+pwo
	v8kKDUgtkRPSzLvrgkClyfCGTj9tD4Xl0A2ziOSCg/BjV3hmuXU3u28ac6033t9AUmx9MIlm1pa
	1VyE5mnBbiJibMH25cKcozYv261U44kx656DlTXmRxITryYxIJI7lFBd0/cOy2xCC5SXUkoRGoe
	YXKHFbsOYxnv9jcBt3Y4Pd1MTprpx1m04s3dnLxh/CksRW
X-Gm-Gg: ASbGncumDwMY1ftRmq1XOEDONtBLp4WoMgeFy6ulVUCSR6jXmQ1ClVc+3iO74vlpeaK
	W0wQQKU0GN43ST6XT3x+PxRPR3S4oPzNqlczj6SjLALF9rANF7HyswoHGng4jl+5wYYrPbgpmUD
	+qfg82Gu30FAAeIM65UOFxohHutZsFzC/QdmhXJsa4ObaBkHiwyHyoqowi6VEqDg7K/pXZsM+Ip
	bdvomdCnKUX5tzMujC8vkid11BQ6/dy+Ft2KNP8WFGuMp3PbVclxdKj8iBvS+l3ujlgMBvZ+ZwV
	zzwjfR9tGBVgbU0j9/MxTCgaIYskcwDzeyO6rEqSqnLJ3/WALiV72XWYdMN/E9RW8Q==
X-Received: by 2002:a5d:5f89:0:b0:38d:d932:d9a0 with SMTP id ffacd0b85a97d-38dd932da55mr5624915f8f.50.1739204004206;
        Mon, 10 Feb 2025 08:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWPX+Zln5vMuClmopd37CoGtJOZXD7uNSKmeC96slnofVRiwq1aRSVWuCax10ArUWCk6GWqA==
X-Received: by 2002:a5d:5f89:0:b0:38d:d932:d9a0 with SMTP id ffacd0b85a97d-38dd932da55mr5624672f8f.50.1739204000328;
        Mon, 10 Feb 2025 08:13:20 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d93369fsm186995865e9.3.2025.02.10.08.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:13:19 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v1] mm/migrate_device: don't add folio to be freed to LRU in migrate_device_finalize()
Date: Mon, 10 Feb 2025 17:13:17 +0100
Message-ID: <20250210161317.717936-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If migration succeeded, we called
folio_migrate_flags()->mem_cgroup_migrate() to migrate the memcg from
the old to the new folio. This will set memcg_data of the old folio to
0.

Similarly, if migration failed, memcg_data of the dst folio is left
unset.

If we call folio_putback_lru() on such folios (memcg_data == 0), we will
add the folio to be freed to the LRU, making memcg code unhappy. Running
the hmm selftests:

  # ./hmm-tests
  ...
  #  RUN           hmm.hmm_device_private.migrate ...
  [  102.078007][T14893] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x7ff27d200 pfn:0x13cc00
  [  102.079974][T14893] anon flags: 0x17ff00000020018(uptodate|dirty|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
  [  102.082037][T14893] raw: 017ff00000020018 dead000000000100 dead000000000122 ffff8881353896c9
  [  102.083687][T14893] raw: 00000007ff27d200 0000000000000000 00000001ffffffff 0000000000000000
  [  102.085331][T14893] page dumped because: VM_WARN_ON_ONCE_FOLIO(!memcg && !mem_cgroup_disabled())
  [  102.087230][T14893] ------------[ cut here ]------------
  [  102.088279][T14893] WARNING: CPU: 0 PID: 14893 at ./include/linux/memcontrol.h:726 folio_lruvec_lock_irqsave+0x10e/0x170
  [  102.090478][T14893] Modules linked in:
  [  102.091244][T14893] CPU: 0 UID: 0 PID: 14893 Comm: hmm-tests Not tainted 6.13.0-09623-g6c216bc522fd #151
  [  102.093089][T14893] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
  [  102.094848][T14893] RIP: 0010:folio_lruvec_lock_irqsave+0x10e/0x170
  [  102.096104][T14893] Code: ...
  [  102.099908][T14893] RSP: 0018:ffffc900236c37b0 EFLAGS: 00010293
  [  102.101152][T14893] RAX: 0000000000000000 RBX: ffffea0004f30000 RCX: ffffffff8183f426
  [  102.102684][T14893] RDX: ffff8881063cb880 RSI: ffffffff81b8117f RDI: ffff8881063cb880
  [  102.104227][T14893] RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
  [  102.105757][T14893] R10: 0000000000000001 R11: 0000000000000002 R12: ffffc900236c37d8
  [  102.107296][T14893] R13: ffff888277a2bcb0 R14: 000000000000001f R15: 0000000000000000
  [  102.108830][T14893] FS:  00007ff27dbdd740(0000) GS:ffff888277a00000(0000) knlGS:0000000000000000
  [  102.110643][T14893] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [  102.111924][T14893] CR2: 00007ff27d400000 CR3: 000000010866e000 CR4: 0000000000750ef0
  [  102.113478][T14893] PKRU: 55555554
  [  102.114172][T14893] Call Trace:
  [  102.114805][T14893]  <TASK>
  [  102.115397][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
  [  102.116547][T14893]  ? __warn.cold+0x110/0x210
  [  102.117461][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
  [  102.118667][T14893]  ? report_bug+0x1b9/0x320
  [  102.119571][T14893]  ? handle_bug+0x54/0x90
  [  102.120494][T14893]  ? exc_invalid_op+0x17/0x50
  [  102.121433][T14893]  ? asm_exc_invalid_op+0x1a/0x20
  [  102.122435][T14893]  ? __wake_up_klogd.part.0+0x76/0xd0
  [  102.123506][T14893]  ? dump_page+0x4f/0x60
  [  102.124352][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
  [  102.125500][T14893]  folio_batch_move_lru+0xd4/0x200
  [  102.126577][T14893]  ? __pfx_lru_add+0x10/0x10
  [  102.127505][T14893]  __folio_batch_add_and_move+0x391/0x720
  [  102.128633][T14893]  ? __pfx_lru_add+0x10/0x10
  [  102.129550][T14893]  folio_putback_lru+0x16/0x80
  [  102.130564][T14893]  migrate_device_finalize+0x9b/0x530
  [  102.131640][T14893]  dmirror_migrate_to_device.constprop.0+0x7c5/0xad0
  [  102.133047][T14893]  dmirror_fops_unlocked_ioctl+0x89b/0xc80

Likely, nothing else goes wrong: putting the last folio reference will
remove the folio from the LRU again. So besides memcg complaining,
adding the folio to be freed to the LRU is just an unnecessary step.

The new flow resembles what we have in migrate_folio_move(): add the
dst to the lru, remove migration ptes, unlock and unref dst.

Fixes: 8763cb45ab96 ("mm/migrate: new memory migration helper for use with device memory")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate_device.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 9cf26592ac934..5bd888223cc8b 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -840,20 +840,15 @@ void migrate_device_finalize(unsigned long *src_pfns,
 			dst = src;
 		}
 
+		if (!folio_is_zone_device(dst))
+			folio_add_lru(dst);
 		remove_migration_ptes(src, dst, 0);
 		folio_unlock(src);
-
-		if (folio_is_zone_device(src))
-			folio_put(src);
-		else
-			folio_putback_lru(src);
+		folio_put(src);
 
 		if (dst != src) {
 			folio_unlock(dst);
-			if (folio_is_zone_device(dst))
-				folio_put(dst);
-			else
-				folio_putback_lru(dst);
+			folio_put(dst);
 		}
 	}
 }

base-commit: e5b2a356dc8a88708d97bd47cca3b8f7ed7af6cb
-- 
2.48.1

