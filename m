Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E422D7A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567308; cv=none; b=nvCg8wrnKItRuZM49uoTgrHzeVwRynzIswNcDZXS3e8tE78tIMhIjJjinRA2zPejXoKPoOgObnKOAUa891CDT/d3Nl4YZH4A4y/TJG9PpPNFC6zhjfj4sBuhzPDX7fRObDjcFJ2WvmSHjpjH3CF2W66DlMSyiHbqsT5WdOKK+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567308; c=relaxed/simple;
	bh=BEpBVLrKYDNW41PX/UiVhvehxlZgLkHOBEXUIvYt9NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5LZhBOC1xQeQI5T3yCyJKLIO9F2WciEXuVltEEwm5XAz459GlBLgyRKkghPRGn12tzBNsHmbcUqkn4gkQLKHndgdS2lqeBpFt3u+i9Ql5GwTTxGT9qya6Cf2Jw2MfU9GUnFadqAVZQt0U7Tod4aeUDkGtyHdHqW0q86ErJ5RZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmgQgdS0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmgQgdS0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so1420780a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745567306; x=1746172106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iA/9JB3XSIA5/FvYUzKMHlHlp7APGzZBqZ9kU/r0z8=;
        b=nmgQgdS00wBuOqJfHTJDh/APd+4S6UivwHvlnF1e3p4BEsia948Uz8G8RSA00zgKP0
         mI4YqeD+YQeE6aql5VYdH8miCGEZRas6iag4u2lWGP+iBurxl9V4mNeohYBwzi2j6t0v
         s7wl/E0nCqfjYgSVMYL9mtZjZJAr62acEebBkvgxK6RAkuYX4Bzy94Iz5Vncl1PGjDib
         8hHh6uD0Ft5dqrV6GM85oACmmDG2OsDhBHjDihiXUqE5/eE1xvSRUAuXPkF1M7U5Ctz/
         pGkal/ln7q3KcCLFOCcGVvf8SX2FOgC+mncI12aJUGkcwYsPP4Esa2iNWwiNm11JRgeo
         oboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567306; x=1746172106;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iA/9JB3XSIA5/FvYUzKMHlHlp7APGzZBqZ9kU/r0z8=;
        b=RjFXbQc8JDeKg4R4j6TEpWFJSqTdGcQPqjEwjB4rzU4+uN3tkceNjuPPGLoktjEaDo
         gzfraCfdRJppjwaPbWIoc0/EaFBH34+nifWn140AXCEJX2N+o0Vc8fO912+tzoAIes35
         Kqtpzyli+MLX6ezICfWPduIVPkYzWQn78E4oaIrB5AAtB1tsqlBAMyTkZIs7hoDONTBy
         J8RGbCkzyjtfJdJaQR7hUJ9kTkmZKWJSnmxtcJ8Ia/ShbvEjbStqpv4dsG9qg6zr8Ttl
         egUXX6T1IS38AM6cZG73pqrQk5UycRK0/XVP4nW0rNFtlLCShuJMIbt9/o/eNw8KAhmd
         CItQ==
X-Forwarded-Encrypted: i=1; AJvYcCU87DniOHij8jzeUnEoB7IolSYU2AVLVWcQBQYmujN+6SFxixkLr3qwMcOGzAMJ25eEtm1PmdGmtIEUpg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyITgRDeeObAWinaQI/Wv7zcNzNCZn+PkLhp/81cQkx6t9UZaXM
	ujPEOqQu+C7fugbr49Voqv7Kz1UTe1LTxzugJUMg0sZiBW9EFgsw
X-Gm-Gg: ASbGncuoycJAQlPGGfKyIxAZuvkzRv3FJEIHhCdb+dDXvifCsdLOq/bYud+iOzicill
	QfTq4IAue/tDUyTJfbsweHeCELOBubiQiNAswY83Kq2u+1Ui27J1z4vHkPfkZO9K2Z//DYL4LX+
	IEmGrEIY3ZQfaVsIvr5d9GEyX9ifJTPplddKdeB98F2w03Y6+HUDJY1JfsIQtCnsElc1iRYIxhs
	FVrezuQWqRS8+AKMd1V8rqzHAsi9RicnjmOWTkj9wloTkQaT/eG5pn+XVwQcr5NhRCgN/fAvCtJ
	siIKwuS0H52hFyWa5zd8y7eiyK9waa6SNcUDs7Cd7br/EqJdL4lvx6eO3VoZqvNi1FBh49J1T5j
	ZyiExRA==
X-Google-Smtp-Source: AGHT+IF6j/HVkBjOUOvPkA5NzTOPZcaVE5ZNvR49midYMpk8i+r5A45/NowDAV2RMCh7Dddubp9nSQ==
X-Received: by 2002:a17:90b:4e90:b0:2f5:747:cbd with SMTP id 98e67ed59e1d1-309f7de9616mr2520520a91.18.1745567306043;
        Fri, 25 Apr 2025 00:48:26 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77641eesm931158a91.25.2025.04.25.00.48.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Apr 2025 00:48:25 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH] mm/memory: fix mapcount / refcount sanity check for mTHP reuse
Date: Fri, 25 Apr 2025 15:43:25 +0800
Message-ID: <20250425074325.61833-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

The following WARNING was triggered during swap stress test with
mTHP enabled:

[ 6609.335758] ------------[ cut here ]------------
[ 6609.337758] WARNING: CPU: 82 PID: 755116 at mm/memory.c:3794 do_wp_page+0x1084/0x10e0
[ 6609.340922] Modules linked in: zram virtiofs
[ 6609.342699] CPU: 82 UID: 0 PID: 755116 Comm: sh Kdump: loaded Not tainted 6.15.0-rc1+ #1429 PREEMPT(voluntary)
[ 6609.347620] Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
[ 6609.349909] RIP: 0010:do_wp_page+0x1084/0x10e0
[ 6609.351532] Code: ff ff 48 c7 c6 80 ba 49 82 4c 89 ef e8 95 fd fe ff 0f 0b bd f5 ff ff ff e9 43 fb ff ff 41 83 a9 bc 12 00 00 01 e9 5c fb ff ff <0f> 0b e9 a6 fc ff ff 65 ff 00 f0 48 0f b
a 6d 00 1f 0f 83 82 fc ff
[ 6609.357959] RSP: 0000:ffffc90002273d40 EFLAGS: 00010287
[ 6609.359915] RAX: 000000000000000f RBX: 0000000000000000 RCX: 000fffffffe00000
[ 6609.362606] RDX: 0000000000000010 RSI: 000055a119ac1000 RDI: ffffea000ae6ec00
[ 6609.365143] RBP: ffffea000ae6ec68 R08: 84000002b9bb1025 R09: 000055a119ab6000
[ 6609.367569] R10: ffff8881caa2ad80 R11: 0000000000000000 R12: ffff8881caa2ad80
[ 6609.370255] R13: ffffea000ae6ec00 R14: 000055a119ac1c9c R15: ffffc90002273dd8
[ 6609.373007] FS:  00007f08e467f740(0000) GS:ffff88a07c214000(0000) knlGS:0000000000000000
[ 6609.375999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 6609.377946] CR2: 000055a119ac1c9c CR3: 00000001adfd6005 CR4: 0000000000770eb0
[ 6609.380376] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 6609.382853] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 6609.385216] PKRU: 55555554
[ 6609.386141] Call Trace:
[ 6609.387017]  <TASK>
[ 6609.387718]  ? ___pte_offset_map+0x1b/0x110
[ 6609.389056]  __handle_mm_fault+0xa51/0xf00
[ 6609.390363]  ? exc_page_fault+0x6a/0x140
[ 6609.391629]  handle_mm_fault+0x13d/0x360
[ 6609.392856]  do_user_addr_fault+0x2f2/0x7f0
[ 6609.394160]  ? sigprocmask+0x77/0xa0
[ 6609.395375]  exc_page_fault+0x6a/0x140
[ 6609.396735]  asm_exc_page_fault+0x26/0x30
[ 6609.398224] RIP: 0033:0x55a1050bc18b
[ 6609.399567] Code: 8b 3f 4d 85 ff 74 40 41 39 5f 18 75 f2 49 8b 7f 08 44 38 27 75 e9 4c 89 c6 4c 89 45 c8 e8 bd 83 fa ff 4c 8b 45 c8 85 c0 75 d5 <41> 83 47 1c 01 48 83 c4 28 4c 89 f8 5b 4
1 5c 41 5d 41 5e 41 5f 5d
[ 6609.405971] RSP: 002b:00007ffcf5f37d90 EFLAGS: 00010246
[ 6609.407737] RAX: 0000000000000000 RBX: 00000000182768fa RCX: 0000000000000000
[ 6609.410151] RDX: 00000000000000fa RSI: 000055a105175c7b RDI: 000055a119ac1c60
[ 6609.412606] RBP: 00007ffcf5f37de0 R08: 000055a105175c7b R09: 0000000000000000
[ 6609.414998] R10: 000000004d2dfb5a R11: 0000000000000246 R12: 0000000000000050
[ 6609.417193] R13: 00000000000000fa R14: 000055a119abaf60 R15: 000055a119ac1c80
[ 6609.419268]  </TASK>
[ 6609.419928] ---[ end trace 0000000000000000 ]---

The WARN_ON here is simply incorrect. The refcount here must be at least
the mapcount, not the opposite. Each mapcount must have a corresponding
refcount, but the refcount may increase if other components grab the
folio, which is acceptable. Meanwhile, having a mapcount larger than
refcount is a real problem.

So fix the WARN_ON condition.

Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
Reported-by: Kairui Song <kasong@tencent.com>
Closes: https://lore.kernel.org/all/CAMgjq7D+ea3eg9gRCVvRnto3Sv3_H3WVhupX4e=k8T5QAfBHbw@mail.gmail.com/
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 424420349bd3..f18266b5a0a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3789,7 +3789,7 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
 
 	/* Stabilize the mapcount vs. refcount and recheck. */
 	folio_lock_large_mapcount(folio);
-	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
+	VM_WARN_ON_ONCE_FOLIO(folio_large_mapcount(folio) > folio_ref_count(folio), folio);
 
 	if (folio_test_large_maybe_mapped_shared(folio))
 		goto unlock;
-- 
2.49.0

