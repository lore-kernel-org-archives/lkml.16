Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A5F2FCFC4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268452; cv=none; b=nkI2RYNoPyh7yOiSBEmPoRgD7rgW/UQRk5rckF/atHCZaBMN8h1WwHTnLzJNDGl9BYMglr2TXwaZBcQA+gmgSTIwAsfoden2UdFWvVKUJPmgLEtZJwiVpc/AR1IEgR2zbgTTtWMQlCyC/acqK775cZRYHkPs9HzkJpS36/U7mpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268452; c=relaxed/simple;
	bh=4i7IUlR1GYEmR6zjKB+4nkWLQlvD9f6ku5JrjlUDoK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emcXjgzchj8O90vwI7WDs0OwJLTEUgaAQirQVwSnXug/u8S6MUASYRbLDr9D26opkBPFV54Qb+0yqdugAw9Cy0Rs0zWZNut/YmgkKybFHd/RNdfCzEK3XuvSYQSw4wLQjdNEMmOT2HdgAT/PR5nZqx78kf2JISpTB2xzdtyrcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uy3s8c1Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uy3s8c1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
	b=Uy3s8c1Z/tWilGEAO8tn6yYtWs0GcI3hmmpo+rzXd1AQSzsiOhfgHQlS3J7WMx81NTZcXP
	RccxWUb8qpBRuijt9E5uI+BbmQYA7igpVVPWt98yFJHv+4aLu9Y46sWPu3P9iStY5BshkN
	MFK5YsKW4zXD0AH5FLgSsIlMBbJEs/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-p3ZcXvAtNj2Klv2wl0Ro9g-1; Wed, 18 Jun 2025 13:40:45 -0400
X-MC-Unique: p3ZcXvAtNj2Klv2wl0Ro9g-1
X-Mimecast-MFC-AGG-ID: p3ZcXvAtNj2Klv2wl0Ro9g_1750268444
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so4391033f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268444; x=1750873244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwm1uiBUBcXGnja63XmY2QjIjVtNliVfN8dAKrOXwFc=;
        b=UAZFXW8JA39pMU9h4Z98nDsFpvGJqJ+/CAMhRnJLdN+oi3LQRys0kys9jcj85urw/9
         FUbaymB4T7iY5rExlpjXpGoD+oNPbDrBQ+S/AGq5KlAO0Gy4T3Hql3bM2E3dX5TGGJAC
         X//mJeX+H++S9l2n1QRxuhKFl3hD8CktHH9NeDHHlI5Wqa10naoDMYhubPqvIKaa6UFN
         U022H09/bYQauT0ZWxWTWuT9PGcvTNxpEJRZgEPkAqy4uWHpUq5G9PHzYDzS4u4TXUK+
         5j/Dp085xAHxe+NvpTFtD5LrTr/ycg4SYLGgFsKhybbf9CQNLqs+o6xi/zbBnf6g2MKx
         aHgg==
X-Gm-Message-State: AOJu0Yy1uUs7/+zN6+XhnNHqKTUYwDmF/AWHEALdnDsGkyCKA7J5m0/w
	I9V+AwOFHK5FIVSdFGUBE6dcCMDHJYeKSduogXiycn90IvnxDZWqRKug2Eqiimg0c2xhv0c2SUc
	pC96dPJ7bkg3FCDImgix/AVepuWGjaYu/QExMwbz2dBgIIv5jWrdo98v7w5aO7Mzh65nZYB7RIF
	gsp05h9HZNAkQf7bgjF7fDxx3J1ulIDcyp9G2kck6eGEr9uuN8
X-Gm-Gg: ASbGnct7/5Fcwzeb7D+A7ex+xTIMFHhmalsjEj7m6g/+rjLfsuFCh+e3/UXMzgOGygg
	Cd2XtiblsZKAg7NmWtqqB2E7P3xtUvsjIA3mCjhaHsqv0vNbib0U0y+Yyy941kFSPORRmjb2cBQ
	3HNJp0vb9MgOEcoehjYNMbArbXzO7A7l13mXS4JkjqxTfYEjWaKk0/eZolTZa43qq2szh2L/ccy
	u7q2a4LU3iEtlUdPH72YbVx/ynG7W5hSaWtei3MA8unG6o243JfvNugPoqPD9KjeP6KK4oLy0aq
	exYyRLlaO0pT+b6abD0evOKdIoveA/epiTCGNO1HoMgL99jspGmh3R6OZXuoWJ8fQneFif7FSYG
	DOtdrzg==
X-Received: by 2002:a05:6000:71c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a572367afbmr15684703f8f.4.1750268443823;
        Wed, 18 Jun 2025 10:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEywSnKMkZlpTz2OAMYD8vOZkvPdDtLDDWrsPSDJX8ViTkX0laZRXIHvaFqn8ElXQBewjN+xg==
X-Received: by 2002:a05:6000:71c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a572367afbmr15684628f8f.4.1750268443292;
        Wed, 18 Jun 2025 10:40:43 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a54b7asm17688084f8f.16.2025.06.18.10.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Wed, 18 Jun 2025 19:39:53 +0200
Message-ID: <20250618174014.1168640-11-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c0ec7422837bd..c99a00d4ca27d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -118,20 +118,6 @@ static inline void __ClearPageMovable(struct page *page)
 }
 #endif
 
-static inline bool folio_test_movable(struct folio *folio)
-{
-	return PageMovable(&folio->page);
-}
-
-static inline
-const struct movable_operations *folio_movable_ops(struct folio *folio)
-{
-	VM_BUG_ON(!__folio_test_movable(folio));
-
-	return (const struct movable_operations *)
-		((unsigned long)folio->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-- 
2.49.0

