Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8E2512F2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226712; cv=none; b=ZRcLJYxKu3WdjqSQuvtJBqyh49eFJb/UHTNdwudnaduj/8nM88eBi6QQYoBXNkBsWF9Z/Uskk8n+FM0W9GYPMPd3NFHzZ5hvOBQSV5tIPwgvGKSA5HeeGHgOyLNoyFQpGAWCAD3UxA5v3WA3puOZWN6zBafB4PNSdXDr5tR7N1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226712; c=relaxed/simple;
	bh=pTRZmgPDUm60FMsGqnRNJP4E0Tz9Yq6UC2rtO3tHUvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bVxK0T/b7bhFqYsR/Gfpsb11bOM/uMFNoLDX7GiVpZ1UI9Fa+AUD2XgRUT3uEOfDl+W9CobECEbiOju6HfzGJlV4RslGJzxFZwO30cuVSAs4hQTnznr1NbtOe7C1pM0ORXcWS29Ttv8qTNmTJ3iJbwoWUz6lEVmEWc8+tEAe/6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=VJ+1P+w1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="VJ+1P+w1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so724335166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1739226708; x=1739831508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xU+5Hff3ByaZYFLomcfM/RhqG5OmVBr1nASPzJa0E9g=;
        b=VJ+1P+w1WObErqQLbmRP6Y57OzKKEh819eK2cTvjj7Yxnb5JGowPzWDy+1r6nNWX8o
         Bs+/UXfmRvs9DyffaeGWWlWavuOO1HuE01kXshAtJPgCheAr25JdxcXKsSeUyImvZoTc
         LkhV5qwRWwdoURCXDZF2SMVBhhdZbY5e4HlFhnTfG2p2QKM1xkxTCTaTzjdSoQA+h42K
         EaOEBWGvJPnmPI4kTVwCh8I3TfBCMZ+3MpHftpcpSv/bevfYWG2GGMII56r3sT43Soxq
         nT+aj78SJwsYLQaDkpubPKzYlEaNu+mZG/bFxRrAY+edHN2OQl2DGKH/lKNDRcJIsXWM
         bePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226708; x=1739831508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU+5Hff3ByaZYFLomcfM/RhqG5OmVBr1nASPzJa0E9g=;
        b=j1XLXm5e9n3kfMYH4pYzbJXfx3DsUHy3umAk6r9yw8O7BL8zHXjsxREtQ+Y2nSGPDR
         M8oFXuJqiFok6RNWW0ogc+QuG6pqrgn2aVfhqMEWtmr8rI+Y4n4E8vBj3F+LlVW52m9B
         yfO/Lh3BCmAomCmlS6t/ythkkVTsw7Mwf+iaun8m5oiVhAa35TFgQ6E1nEY1QawuzfBP
         1pnrOSzfRpoSYVvKX2Y+b86DRVSd40eyDbMiSUtrySOay/p3tSS3YD+jqMxE4aNf/xgj
         SK0a75zVIE88PMXOXxh6CFcOi0YAjI8dXHCeiHEq44ywj3YdYFoWQ7yu72exa+OzpqMy
         ZRgg==
X-Forwarded-Encrypted: i=1; AJvYcCVI8fTx2R+o3IEYYBjjvtLe11yzJ6myvU+oFmyrPGmVXx7qov13pGNgEiz10ZKqljep1t7t6wzLJqKQ1qY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+3U+yJ32z/IIPSNG6SfV14LEronWCZghA7CXz6U6orgtzXF8
	sBem3sEy5LgE0k88j7wBeBr3y9FBQCACT3DNfun3fk1Qbd4mkvhDz6eR/YwqMd4=
X-Gm-Gg: ASbGncvWssY82DoYntZCSfDPnKQRvFDP8PCmVpFSzvn3EkN5BUz2J8o8LxI3LhcNgPP
	QpAaqNyXg9+w+aZ1SxdlBJmoeA1jNMLgIoxe+hc2RbIayGwso5ACOH20WZ2q5pw71C/I/HmHvki
	+gPiBKPgJdDj7i/MyvmYuPJdCJBQK2M/jq9xsJAtxYyC9RiismD50ZiE8Gr5PXcN1457RD1fzd/
	FjPhsu2PvJT+6Ga7iPBadaiU5ppCWKcUMdbmvk41wvtWFha/+6Fp9USA58eX9Bl0wy69aOuwOsB
	WAPtVXYZSmBSBXeQwYeANdnrJTybb7uJEiNfmdkcLVwZ0BVqTSEy6qBANl1WDVY6a0OsDVFuSXE
	OOlpkVBr+cRhCpv4=
X-Google-Smtp-Source: AGHT+IHjtW2LQcoXICJ4bXGo/wQbq7YrAWuKqCJ6/w7CIf+NkajZc7njbeyBgfXRV7CZ7jt2R27Isw==
X-Received: by 2002:a17:906:4796:b0:ab7:59a0:dd16 with SMTP id a640c23a62f3a-ab789a6b646mr1696451266b.2.1739226707788;
        Mon, 10 Feb 2025 14:31:47 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f19d800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f19:d800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7afbcdbbesm454870666b.24.2025.02.10.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:31:47 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH v6.13] fs/netfs/read_pgpriv2: skip folio queues without `marks3`
Date: Mon, 10 Feb 2025 23:31:44 +0100
Message-ID: <20250210223144.3481766-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the beginning of the function, folio queues with marks3==0 are
skipped, but after that, the `marks3` field is ignored.  If one such
queue is found, `slot` is set to 64 (because `__ffs(0)==64`), leading
to a buffer overflow in the folioq_folio() call.  The resulting crash
may look like this:

 BUG: kernel NULL pointer dereference, address: 0000000000000000
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: Oops: 0000 [#1] SMP PTI
 CPU: 11 UID: 0 PID: 2909 Comm: kworker/u262:1 Not tainted 6.13.1-cm4all2-vm #415
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
 Workqueue: events_unbound netfs_read_termination_worker
 RIP: 0010:netfs_pgpriv2_write_to_the_cache+0x15a/0x3f0
 Code: 48 85 c0 48 89 44 24 08 0f 84 24 01 00 00 48 8b 80 40 01 00 00 48 8b 7c 24 08 f3 48 0f bc c0 89 44 24 18 89 c0 48 8b 74 c7 08 <48> 8b 06 48 c7 04 24 00 10 00 00 a8 40 74 10 0f b6 4e 40 b8 00 10
 RSP: 0018:ffffbbc440effe18 EFLAGS: 00010203
 RAX: 0000000000000040 RBX: ffff96f8fc034000 RCX: 0000000000000000
 RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffff96f8fc036400
 RBP: 0000000000001000 R08: ffff96f9132bb400 R09: 0000000000001000
 R10: ffff96f8c1263c80 R11: 0000000000000003 R12: 0000000000001000
 R13: ffff96f8fb75ade8 R14: fffffaaf5ca90000 R15: ffff96f8fb75ad00
 FS:  0000000000000000(0000) GS:ffff9703cf0c0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000000 CR3: 000000010c9ca003 CR4: 00000000001706b0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 Call Trace:
  <TASK>
  ? __die+0x1f/0x60
  ? page_fault_oops+0x158/0x450
  ? search_extable+0x22/0x30
  ? netfs_pgpriv2_write_to_the_cache+0x15a/0x3f0
  ? search_module_extables+0xe/0x40
  ? exc_page_fault+0x62/0x120
  ? asm_exc_page_fault+0x22/0x30
  ? netfs_pgpriv2_write_to_the_cache+0x15a/0x3f0
  ? netfs_pgpriv2_write_to_the_cache+0xf6/0x3f0
  netfs_read_termination_worker+0x1f/0x60
  process_one_work+0x138/0x2d0
  worker_thread+0x2a5/0x3b0
  ? __pfx_worker_thread+0x10/0x10
  kthread+0xba/0xe0
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x30/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1a/0x30
  </TASK>

Fixes: ee4cdf7ba857 ("netfs: Speed up buffered reading")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
Note this patch doesn't apply to v6.14 as it was obsoleted by commit
e2d46f2ec332 ("netfs: Change the read result collector to only use one
work item").
---
 fs/netfs/read_pgpriv2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/read_pgpriv2.c b/fs/netfs/read_pgpriv2.c
index 54d5004fec18..e72f5e674834 100644
--- a/fs/netfs/read_pgpriv2.c
+++ b/fs/netfs/read_pgpriv2.c
@@ -181,16 +181,17 @@ void netfs_pgpriv2_write_to_the_cache(struct netfs_io_request *rreq)
 			break;
 
 		folioq_unmark3(folioq, slot);
-		if (!folioq->marks3) {
+		while (!folioq->marks3) {
 			folioq = folioq->next;
 			if (!folioq)
-				break;
+				goto end_of_queue;
 		}
 
 		slot = __ffs(folioq->marks3);
 		folio = folioq_folio(folioq, slot);
 	}
 
+end_of_queue:
 	netfs_issue_write(wreq, &wreq->io_streams[1]);
 	smp_wmb(); /* Write lists before ALL_QUEUED. */
 	set_bit(NETFS_RREQ_ALL_QUEUED, &wreq->flags);
-- 
2.47.2

