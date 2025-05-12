Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD982989A7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077457; cv=none; b=q4M5z1ecsW+QPBx6XN+ONQDr2b3fBwANgi8h86oEoS2qB2CeMx+o29yQkw6nuRdWOkowIUsHaLq46PCr1flspmB3OKWPKvmWTWGR8jw97eKhZrPYM2jHS2pRe90odVeDfh0WxweZ7Lavueyw4m9CEbHxEd2DJASYg8dIAJj173o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077457; c=relaxed/simple;
	bh=DM8G30RWCxGUTepNTSwS9MbBEItCS1h/UpYrlE8rj2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HcOARGz1DP9na7g8jJg3iXAWuU4vH36Cf/S4AG1ef+MIhL/f4OYEnlSqGe6Mh4hSjdQbd1v0hDxNBfvQdbWThhbjBECDGlxV9XrNTdGuJMjLlHYoNx3C4IXZJgRAfncn/o0t4GPM61L4ofmM74ihQPeTFhRq9H9sV8kfzol6wEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRH1VbgJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRH1VbgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747077453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s/18zIVU9SJCaF8Ai1CFMU44OTCynZeUoKhqvxkl5xg=;
	b=eRH1VbgJmPvACaCKBCdZ8udqxQSkMUcmUFIscXOIipSnH/W63S38OycGGbQA3s4UxXM156
	G6+kTjhLYIUSM6X+o9NU8VSWiaT2aAciSnyxp4HPhvfcaKkEjkC6FozxRGuvGTr4dXY1mg
	beQ60vXzavwFiss2/H/vgE6HJPfgfD0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-vX1lO760PPGDbU0n8g2bAg-1; Mon, 12 May 2025 15:17:32 -0400
X-MC-Unique: vX1lO760PPGDbU0n8g2bAg-1
X-Mimecast-MFC-AGG-ID: vX1lO760PPGDbU0n8g2bAg_1747077452
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47693206f16so89623001cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747077452; x=1747682252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/18zIVU9SJCaF8Ai1CFMU44OTCynZeUoKhqvxkl5xg=;
        b=uSfoYc9z0lCxXhoKjHOdh+MyG7XEDOPW5Pty1c5ghY+647yrsssYtj1i7952n0kvhq
         bhlnHWLkBcFtn/Cv2Z4iub7QuHkTHKKQyDgbMoKEId0XSjIvg8yOcRVN/+SFKS+6u5Ev
         llnwUGGzGgRh0HCjZKGWE+uM1TXccodceEZlYi61aQqnJ8Aab6/s88Hr+A/jjlsAZ3k0
         62Yje7A9h9UBmA2a3S0agrRalXMZnH3UWBM1vLB6csQSCKAuM2/7ZQG4jVHAsLRqWyBQ
         Xv2Ll662V81lDduwTcwal1d4GSybDE9AgXU4ZHN2Y8QdsaZH+vbEivw7omRD7uqEOUKy
         y9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU2OqLHoRFBsqYhifG1itq1lqxMhpEXYfZQg78n3StCTEqHkvkNkyOB3NZ73AocM9rBX3dr29n6R86wYNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6njQzxUCYcCzS4o86vRgD+z4qTUy6Fvf7v9LluNNohl44yD7
	vx4EmvkR/7D8BrSE5sV+I8hjQnHoeP+z3w5YQg2Dhlkp8jPqj7HyP+oe75xUdEWb/c55j1eCi4W
	cvEN25L6sMo2Gw15Lpm9oJKH3zI4Us/9VYxdpWqXv02oCpwaVJZaKuLtu252dsVa3tWzscA==
X-Gm-Gg: ASbGncsAP6TjnWoV47gXA3wdRDYOSP8JKe0rUHMgw0bkt1PPSm2LcPOpV2epFmIHfj7
	f6pJtx8W7cz85RypISUJjxGyzFX1YB0omRiiVVGqBL/DLAsCAtVsfX0i/BlgneNcbPglwNp2Tw6
	M4cG664zI7QuOWvwS/GAFKzzyWydesFB5BvphVlml97oVrBJvyBixp2loboxW6Rik+5JNRnlnJl
	4lKqucXy5nmx6fn96N/iT5QM6rXm/5PpsfJVIoD4XfCBHPHXys2jUcq4S7wv2vKitahX9HlWbJr
	6w8Q02BbTwjU7BvaD/SJB+LNF1M8899djze/SLawggE=
X-Received: by 2002:ac8:5a4b:0:b0:48e:1c13:ecaf with SMTP id d75a77b69052e-4945273c570mr229772381cf.16.1747077451370;
        Mon, 12 May 2025 12:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+7q4UW257no1ZfUNsmnYKJakieEg/UoQSyIMxIM5MObxjq90atPrhvRnYakQEeO5zdg2D9g==
X-Received: by 2002:ac8:5a4b:0:b0:48e:1c13:ecaf with SMTP id d75a77b69052e-4945273c570mr229770951cf.16.1747077449828;
        Mon, 12 May 2025 12:17:29 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494524bbc53sm55635321cf.47.2025.05.12.12.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 12:17:29 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: willy@infradead.org,
	akpm@linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH] XArray: fix kmemleak false positive in xas_shrink()
Date: Mon, 12 May 2025 12:17:07 -0700
Message-ID: <20250512191707.245153-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemleak periodically produces a false positive report that resembles
the following:

unreferenced object 0xffff0000c105ed08 (size 576):
  comm "swapper/0", pid 1, jiffies 4294937478
  hex dump (first 32 bytes):
    00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    d8 e7 0a 8b 00 80 ff ff 20 ed 05 c1 00 00 ff ff  ........ .......
  backtrace (crc 69e99671):
    kmemleak_alloc+0xb4/0xc4
    kmem_cache_alloc_lru+0x1f0/0x244
    xas_alloc+0x2a0/0x3a0
    xas_expand.constprop.0+0x144/0x4dc
    xas_create+0x2b0/0x484
    xas_store+0x60/0xa00
    __xa_alloc+0x194/0x280
    __xa_alloc_cyclic+0x104/0x2e0
    dev_index_reserve+0xd8/0x18c
    register_netdevice+0x5e8/0xf90
    register_netdev+0x28/0x50
    loopback_net_init+0x68/0x114
    ops_init+0x90/0x2c0
    register_pernet_operations+0x20c/0x554
    register_pernet_device+0x3c/0x8c
    net_dev_init+0x5cc/0x7d8

This transient leak can be traced to xas_shrink(): when the xarray's
head is reassigned, kmemleak may have already started scanning the
xarray. When this happens, if kmemleak fails to scan the new xa_head
before it moves, kmemleak will see it as a leak until the xarray is
scanned again.

The report can be reproduced by running the xdp_bonding BPF selftest,
although it doesn't appear consistently due to the bug's transience.
In my testing, the following script has reliably triggered the report in
under an hour on a debug kernel with kmemleak enabled, where KSELFTESTS
is set to the install path for the kernel selftests:

        #!/bin/sh
        set -eu

        echo 1 >/sys/module/kmemleak/parameters/verbose
        echo scan=1 >/sys/kernel/debug/kmemleak

        while :; do
                $KSELFTESTS/bpf/test_progs -t xdp_bonding
        done

To prevent this false positive report, mark the new xa_head in
xas_shrink() as a transient leak.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 lib/xarray.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xarray.c b/lib/xarray.c
index 9644b18af18d1..51314fa157b31 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/export.h>
+#include <linux/kmemleak.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -476,6 +477,7 @@ static void xas_shrink(struct xa_state *xas)
 			break;
 		node = xa_to_node(entry);
 		node->parent = NULL;
+		kmemleak_transient_leak(node);
 	}
 }
 
-- 
2.49.0

