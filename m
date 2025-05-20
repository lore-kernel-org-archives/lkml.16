Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424924A076
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759344; cv=none; b=OqUoCGZZ040wYMnSDV5LJrmalnQdIyAsN49/B3QPz+rXZv9yCGL0Yi1jVhD7l88GiQxW/w9+Se3yw0ksL+SQSAhYhpJmzACBGAfnt1rXqjKlmYRJKjjZK7my5UV+sAvlujNEZBITaJW5q4rdcJfIos5biRM6z1pGvGmb28SrjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759344; c=relaxed/simple;
	bh=O/zF8BIjJSZZD1bMIMd2l/UU9MCXoY/z3vcgzeUWzss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bDYlUtqrQnk0UVKvCfaKCLRPHRXnj+bdsTIWKUoh4u3D2mbWfaS6eUzuIs47GnDyFeAvcr4VOz13OD3PMkRKl9pI4ysJo+WNWJ+PVIl5asb61y4aAFYocIeLCRoSYeHvdXZHiqTQBrdnWTwEMgouZzXAgVnl1uQDQzDoODbYdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2rKUuBg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2rKUuBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747759341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMmCTr8FV4camAPV2B6Uv6O4Wah81IfL3gtjzE3sMkA=;
	b=h2rKUuBgund69sF5KlRcTACs78XIk7ibnScsIm+jgThKyoy7Cd0eP5I5MOoyZBf/M4ZR44
	80HVQ+qVkQ3GxD3b5m4otngSzjaUCLQBpC0oMRBZgmCCRbPy2dYNbpcjM4wUFlD6bkmF13
	GXwAqzCzpA8zecO5jghWW/wW/8bOx1I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-6-XQvmdQN0e7EPE-FSv_wQ-1; Tue, 20 May 2025 12:42:20 -0400
X-MC-Unique: 6-XQvmdQN0e7EPE-FSv_wQ-1
X-Mimecast-MFC-AGG-ID: 6-XQvmdQN0e7EPE-FSv_wQ_1747759339
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a36416aef2so1225783f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759338; x=1748364138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMmCTr8FV4camAPV2B6Uv6O4Wah81IfL3gtjzE3sMkA=;
        b=AZo6ZHTNvy5rW+WEpTIp4RiHvXeVs60+pmg1+PQItzYgumewaT6JIRpnHp7m1P7mWL
         ItPHx2/1pXKGTdagihBaAyaK3GmN+9b4727lwxvwXavFlR/Gvt4zDMuTQzwKuIiwuhKN
         eVTc2i0vtwYnTORTEh57mvdt9XCZyzLUnpulD0/0iV2u4vstHrsl4CDOH1A0RsQZBT2F
         SqSQzm6udimvtaD/Qtoli7NOBJPtoEr5N0cmbTr1Ce6E9UyDt2kqkTW8pLVJUO89KfBe
         vLnR/VWMC4EPM19aOf1mMvGp3k6OZCQ99YOC8rk8p6V8eJd6AUPiFrFeEUyiOIKGAieB
         oUiA==
X-Gm-Message-State: AOJu0Yzedv94+wNXdJ6Vvt6VbV1T/gC30J4EkNU+J3YGfLNq8fGQwJNu
	Tg3OUdrbl3G9U10wgjQip7YIGPX5uTShr26M/xKqcqpH+z8VfeJBVvO4VoqtSmPi+IgHBDd7JFX
	uyfiDgzNlF45d1r9a6ICW02WkmkbC6aFL0/DcCmjTfzB6BMrvA0qtsTuF1qhdNp0EvqZGGlHUUG
	EzL1vhWcP0yHFT/yqPJ9Z1/5PTNLjsS4iPzsz59q0ec1CPZwmM
X-Gm-Gg: ASbGncsUt4HVIRfNyx90ooHgGo+3Bx+jn85CvU6PzafRrBMUXjCdrA4OBYItdHyKJ1O
	uu4pVXh9AHSIZ+cSK8+aO867qz+3K0KZ0+Bk1OG4zIR0uNFFm/GGiT5MtJj6ELqND1VoR5W+9dg
	ZM0mEBdBKg5nBHNjWSDmx2YG1FyPl/kUp9e49y0NteKbiDvgeOZdQnxjik6J1wML7CnOWBk22AG
	LO07mZ7qrg9QxZQiH5emYMZPoubiRk3C78iQLviiix0S9DSMmvr+wBGe76yJg31JKv+lu7GyPUe
	z/l6SQ9a5ykkNYcaLI/cFtcy+iD52xsyXDeRMKSslUtE5s7Yjo7GjDWdHbXMau51jkz7vZBG
X-Received: by 2002:a05:6000:2304:b0:3a3:621a:d3c2 with SMTP id ffacd0b85a97d-3a3621ad425mr10859955f8f.58.1747759338520;
        Tue, 20 May 2025 09:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF01oyCH30NXY3wu6mQba4pmLtfM7r7ivSDHBlg1KpnoWBCJHpNy44l4OgJZ2MH/4+39rTc7g==
X-Received: by 2002:a05:6000:2304:b0:3a3:621a:d3c2 with SMTP id ffacd0b85a97d-3a3621ad425mr10859915f8f.58.1747759338012;
        Tue, 20 May 2025 09:42:18 -0700 (PDT)
Received: from localhost (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca889e6sm17013724f8f.71.2025.05.20.09.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:42:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH v2 0/1] mm/memory_hotplug: introduce and use PG_offline_skippable
Date: Tue, 20 May 2025 18:42:10 +0200
Message-ID: <20250520164216.866543-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a requirement for making PageOffline pages not have a refcount
in the long future ("frozen"), and for reworking non-folio page migration
in the near future.

I have patches mostly ready to go to handle the latter. For turning all
PageOffline() pages frozen, the non-folio page migration and memory
ballooning drivers will have to be reworked first, to no longer rely on
the refcount of PageOffline pages.

Introduce PG_offline_skippable that only applies to PageOffline() pages --
of course, reusing one of the existing PG_ flags for now -- and convert
virtio-mem to make use of the new way: to allow for skipping PageOffline
pages during memory offlining, treating them as if they would not be
allocated.

Note that the existing mechanism relied on the driver (virtio-mem)
dropping its reference during MEM_GOING_OFFLINE, which is complicated and
not compatible with the concept of frozen pages (no refcount).

Tested with virtio-mem on x86, including  partially hotplugging a memory
block (hotplugging 64MiB with a 128 MiB memory block size), and repeatedly
onlining+offlining the memory block. Also tested that forced driver
unloading with partially plugged memory blocks keeps working as is.

Cc: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>

v1 -> v2:
* Handle forced driver unloading of virtio-mem: clear the flag
* Added a comment for a PageOfflineSkippable check
* Added more details to the patch description
* Drop patch #2 ("mm/memory_hotplug: remove -EBUSY handling from
  scan_movable_pages()")

David Hildenbrand (1):
  mm/memory_hotplug: PG_offline_skippable for offlining memory blocks
    with PageOffline pages

 drivers/virtio/virtio_mem.c | 141 ++++++++----------------------------
 include/linux/page-flags.h  |  29 ++++++--
 mm/memory_hotplug.c         |  17 +++--
 mm/page_alloc.c             |   8 +-
 mm/page_isolation.c         |  21 ++----
 5 files changed, 74 insertions(+), 142 deletions(-)

-- 
2.49.0

