Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D6DDBC;
	Sun, 22 Jun 2025 00:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750553093; cv=none; b=Ghiag5dGHwS8C3zsbzaLJvCnGVF+I7yy+7UPkjhoUWmrbDRghF6gz2RN3QqyQlC14BBrKifADRWKYk+pXUqkuqdt2G3VMuZKZxc1/wqFJBlThNVQhwWTecWcBTyru1/+F5V/QMIAfssyybkxYF4OkdWfY5Kau7E2eWZ6zMUW4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750553093; c=relaxed/simple;
	bh=kCrs+ZCrFs4Pzq9Km0+OaUBaSfs8ILusAWrORG6OB9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bCp88woo8Bc5CegWlmBZzNhXvxvxVx8rob5WRrA7Jla0hNsCmSQ6H2mk2TmMvmXds1m6WqRmn8Wi/Hjy0KRBZ0sk9GeD8846N/vFk31rQH/epdIjwNnDlB6EodAin/eQmryY8wXU7KuGO/2yTC73uMJoaVwUkH1dyTzg0Du/eAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9MClDa6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9MClDa6"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so3542835a12.2;
        Sat, 21 Jun 2025 17:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750553091; x=1751157891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9seqvFVjHSHj8qBAizqEN5td7cNupZ5qJ9c3mcC8dzI=;
        b=m9MClDa6aPLvLI41dCW9hOjO8UQ5lk0XcSyaLb/KcqkMk/PJ4JFkCTUh7HqG3xm4kw
         g2y2jzigjthaV0ZAMNhsCfjBInO3e58lF2PHqkxOp5SPSn3TItbcFLxaUZFWngq8ZZ+n
         PVAT+OkmMjm26zVkV4Z76dg1blzzRyuM66lOIq4vc3776zHiHopxnzXlWBarKveBH5nu
         9SUAHqmXMVrDRA3KvNMdBwsOG2CtQnfR4cS+Vg9c4/CmnYomsBUv44tkVqyos6pdY64h
         rfSKwIZ7VQTN9UlvtALpauUKvn7DzzVvIQZJDU8Oeba/l1Cr+xyNCuhWuquRY5Rf3wOh
         etZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750553091; x=1751157891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9seqvFVjHSHj8qBAizqEN5td7cNupZ5qJ9c3mcC8dzI=;
        b=WObdgTIcLVQDtjg9iL0HrwjkoVjhpr5d7xxCymMW5RKlvPoi2EbhVaFJcbIUvb2MRv
         FiEEVxge5vTZj9BM6Q7h8VYKzCcKnKu2r7FiNSNtSsVBSXwuFkfJSm2JVEs2Irl8YJAL
         sOPjDWIPk/K/yHVZSc178R3HEyi9r587Li+p0Br6u5pXHSMHzOiBCKk4MR1Y+nh3St6n
         YLjDEuSxArwOUAYnFeDbJCSo7hASrn5aPndTZ1VdEtCc5JwNej6rDpf4kjr+4dXxCRUM
         G3S5e3/Tb8RZsj6Wmpv3+K+/f8SwVGU2SkZ7qk8znUT/VI1Fpxb3fkdTinTiJxapwafX
         uV3w==
X-Forwarded-Encrypted: i=1; AJvYcCW4Kcf+JR03tLXD+aPNkp/1G8i3esA/Zuk5wC8JmBkR9Mv5GCGZ95FZASk1+mUaTY67AYqi70rzf8A=@vger.kernel.org, AJvYcCWZuQOzWYPMKG1Bjfqhm2VNBn31RAqc+1dF3YqB/H3fxRQBtkBK/m1OF3LZSUEnMmInYsrBgoTxbR5BboQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDn2pTRg9kn0F9G/H7c35HU6BGilMmqViFIPY25uyqqDBF0Qb
	yVGCO4Rje44n134ITLvBOdEqZEPKsyu2IgKIpBZjrxztKFS2xEqKHtlI
X-Gm-Gg: ASbGncuxKG0mZXNWuVzse1iv0Hx+oz1y0FVQd7Etxh/47j5q7qo7vIixhBzwhGutoVa
	Zu5rAvU0IIZ/MpcgL9Lj069BzIQAH7Ni0f/tHE2sJYIL10Z8llFTGeTEEKGkcejZa4zdJXJlkJx
	UsO+joft+42z2CKaKyfN26afZyh4P4VedcxO+w0dtjlFOvxdmeHnWSF5VUL+Jtk9hZF6oEBZyD5
	REFzH93SZPXVfCyhEZVUJQiS5oIo+01gbW60ZUzAzZ0BjaVtSbOKoKrgFrMd1VnAnfVaGhm2k82
	vEw4NkbqHqnyiVUd9RDRbVX1WVdKlutbZWmvp+okqWWikJDQL4PYEZokAfPMYdDw5vO6PTfL1uW
	Mn9Sw2Q8ZByhUFkVWCOOTuQY6rgbwbv4YnGQM2LlKqvlhVQ==
X-Google-Smtp-Source: AGHT+IEIDOfIsZ9YDpsivWP+Szc2Gqabf0O6jEy+YJN7YNlJ3K+YooA00VbkYe+2gMs5AGVF0/sPwQ==
X-Received: by 2002:a17:90b:1642:b0:313:5d2f:5505 with SMTP id 98e67ed59e1d1-3159d8c143bmr14134416a91.16.1750553091209;
        Sat, 21 Jun 2025 17:44:51 -0700 (PDT)
Received: from localhost.localdomain (36-231-187-194.dynamic-ip.hinet.net. [36.231.187.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118ea01sm4658390a12.5.2025.06.21.17.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:44:50 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	wangkefeng.wang@huawei.com,
	vishal.moola@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	linux-mm@kvack.org,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] mm/balloon_compaction: update Chinese docs for movable_ops
Date: Sun, 22 Jun 2025 08:42:47 +0800
Message-ID: <20250622004249.9083-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove Non-LRU Page Migration and Add Movable_ops Page Migration

Reference: https://lore.kernel.org/all/20250618174014.1168640-28-david@redhat.com/
---
 .../translations/zh_CN/mm/page_migration.rst  | 88 +++----------------
 1 file changed, 10 insertions(+), 78 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/page_migration.rst b/Documentation/translations/zh_CN/mm/page_migration.rst
index 8c8461c6cb9f..e4f03228dbd9 100644
--- a/Documentation/translations/zh_CN/mm/page_migration.rst
+++ b/Documentation/translations/zh_CN/mm/page_migration.rst
@@ -114,91 +114,23 @@ migrate_pages()对它的页面列表进行了多次处理。如果当时对一
 
 18. 新的页面被移到LRU中，可以被交换器等再次扫描。
 
-非LRU页面迁移
+movable_ops 页面迁移
 =============
 
-尽管迁移最初的目的是为了减少NUMA的内存访问延迟，但压缩也使用迁移来创建高阶页面。
+选定的特定类型且非 folio 的页面（例如 memory balloon 或 zsmalloc 分配的页面）可以借助 movable_ops 迁移框架实现页面迁移。
 
-目前实现的问题是，它被设计为只迁移*LRU*页。然而，有一些潜在的非LRU页面可以在驱动中
-被迁移，例如，zsmalloc，virtio-balloon页面。
+struct movable_operations 提供了与页面类型相关的回调函数，用于隔离、迁移以及将页面放回。
 
-对于virtio-balloon页面，迁移代码路径的某些部分已经被钩住，并添加了virtio-balloon
-的特定函数来拦截迁移逻辑。这对一个驱动来说太特殊了，所以其他想让自己的页面可移动的驱
-动就必须在迁移路径中添加自己的特定钩子。
+一旦页面被标记为具有 movable_ops，在页面被释放回 buddy 系统之前，不应更改其状态。这包括不得更改或清除页面类型，也不得更改或清除 PG_movable_ops 页面标志。
 
-为了克服这个问题，VM支持非LRU页面迁移，它为非LRU可移动页面提供了通用函数，而在迁移
-路径中没有特定的驱动程序钩子。
+目前，任意驱动程序尚无法直接使用此框架，因为使用该机制需满足以下条件：
 
-如果一个驱动程序想让它的页面可移动，它应该定义三个函数，这些函数是
-struct address_space_operations的函数指针。
+(a) 页面类型；
+(b) 在 page_has_movable_ops() 中根据页面类型标示这些页面可能具有 movable_ops；
+(c) 在 page_has_movable_ops() 中根据页面类型返回对应的 movable_ops；
+(d) 不得将 PG_movable_ops 和 PG_movable_ops_isolated 页面标志用于其他用途。
 
-1. ``bool (*isolate_page) (struct page *page, isolate_mode_t mode);``
-
-   VM对驱动的isolate_page()函数的期望是，如果驱动成功隔离了该页，则返回*true*。
-   返回true后，VM会将该页标记为PG_isolated，这样多个CPU的并发隔离就会跳过该
-   页进行隔离。如果驱动程序不能隔离该页，它应该返回*false*。
-
-   一旦页面被成功隔离，VM就会使用page.lru字段，因此驱动程序不应期望保留这些字段的值。
-
-2. ``int (*migratepage) (struct address_space *mapping,``
-|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
-
-   隔离后，虚拟机用隔离的页面调用驱动的migratepage()。migratepage()的功能是将旧页
-   的内容移动到新页，并设置struct page newpage的字段。请记住，如果你成功迁移了旧页
-   并返回MIGRATEPAGE_SUCCESS，你应该通过page_lock下的__ClearPageMovable()向虚
-   拟机表明旧页不再可移动。如果驱动暂时不能迁移该页，驱动可以返回-EAGAIN。在-EAGAIN
-   时，VM会在短时间内重试页面迁移，因为VM将-EAGAIN理解为 "临时迁移失败"。在返回除
-   -EAGAIN以外的任何错误时，VM将放弃页面迁移而不重试。
-
-   在migratepage()函数中，驱动程序不应该接触page.lru字段。
-
-3. ``void (*putback_page)(struct page *);``
-
-   如果在隔离页上迁移失败，VM应该将隔离页返回给驱动，因此VM用隔离页调用驱动的
-   putback_page()。在这个函数中，驱动应该把隔离页放回自己的数据结构中。
-
-非LRU可移动页标志
-
-   有两个页面标志用于支持非LRU可移动页面。
-
-   * PG_movable
-
-     驱动应该使用下面的函数来使页面在page_lock下可移动。::
-
-	void __SetPageMovable(struct page *page, struct address_space *mapping)
-
-     它需要address_space的参数来注册将被VM调用的migration family函数。确切地说，
-     PG_movable不是struct page的一个真正的标志。相反，VM复用了page->mapping的低
-     位来表示它::
-
-	#define PAGE_MAPPING_MOVABLE 0x2
-	page->mapping = page->mapping | PAGE_MAPPING_MOVABLE;
-
-     所以驱动不应该直接访问page->mapping。相反，驱动应该使用page_mapping()，它可
-     以在页面锁下屏蔽掉page->mapping的低2位，从而获得正确的struct address_space。
-
-     对于非LRU可移动页面的测试，VM支持__PageMovable()函数。然而，它并不能保证识别
-     非LRU可移动页面，因为page->mapping字段与struct page中的其他变量是统一的。如
-     果驱动程序在被虚拟机隔离后释放了页面，尽管page->mapping设置了PAGE_MAPPING_MOVABLE，
-     但它并没有一个稳定的值（看看__ClearPageMovable）。但是__PageMovable()在页
-     面被隔离后，无论页面是LRU还是非LRU可移动的，调用它开销都很低，因为LRU页面在
-     page->mapping中不可能有PAGE_MAPPING_MOVABLE设置。在用pfn扫描中的lock_page()
-     进行更大开销的检查来选择受害者之前，它也很适合只是瞥一眼来测试非LRU可移动的页面。
-
-     为了保证非LRU的可移动页面，VM提供了PageMovable()函数。与__PageMovable()不
-     同，PageMovable()在lock_page()下验证page->mapping和
-     mapping->a_ops->isolate_page。lock_page()可以防止突然破坏page->mapping。
-
-     使用__SetPageMovable()的驱动应该在释放页面之前通过page_lock()下的
-     __ClearMovablePage()清除该标志。
-
-   * PG_isolated
-
-     为了防止几个CPU同时进行隔离，VM在lock_page()下将隔离的页面标记为PG_isolated。
-     因此，如果一个CPU遇到PG_isolated非LRU可移动页面，它可以跳过它。驱动程序不需要
-     操作这个标志，因为VM会自动设置/清除它。请记住，如果驱动程序看到PG_isolated页，
-     这意味着该页已经被VM隔离，所以它不应该碰page.lru字段。PG_isolated标志与
-     PG_reclaim标志是同义的，所以驱动程序不应该为自己的目的使用PG_isolated。
+例如: Balloon 驱动程序可以通过核心内核提供的 balloon-compaction 框架使用该机制。
 
 监测迁移
 ========
-- 
2.48.1

