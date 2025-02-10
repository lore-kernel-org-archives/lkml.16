Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736D24E4BB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216335; cv=none; b=nedWWT0EVXL0g8vHTzALeCyk8B93H9Kcj4ZkP/o8rCONIUTaMzxvJz+HKBHBam4gQ9ZWex/ixnlCbFO2fxNT12RTqB5ZHtgvuw9pubXFtE0ZKl/xgxDS3a9RIGg0deVISBZ04f4pAqvA1gj1c5gOn12I2w5LLHSWS4JPG99uvwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216335; c=relaxed/simple;
	bh=cMJXMPJ9fLW/woS9dzf0yuP4P9GXVUKQkO8wkukVnbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XP1sl8pYMmG1DLwQpz2u3JyHj9NsndR3woTN9FZ8JfdHLwNu5h6aYP+NWGLw8q0pLpDVhYwVV4OAlQDFaj4l2LdiQ4MgZHPXyxYUk8mBnMfuLkzIqZ/aepB+GTZstgQHbYGa/6jYJWmiL+sE8qOOBJi6tqOlVKHm2xSSy+suYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IV3E+oh5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IV3E+oh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
	b=IV3E+oh5JFt2EQeY8n1ETUHLKzoML4cSdzYheRXm99ljPTM3eaV2TS7O7rz2UGMOkIkLuC
	Jpn/fN7+qDXZEsnW/eiee3KnlJOefY05Ool/52g5M+Xw1pzUa5/nvd2kRQewP6nc3dkPKd
	i3efRgAdNc0hBSIbIjzm71lxD3K3yoc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-hpo330YmM5qFutuTJ5YWgw-1; Mon, 10 Feb 2025 14:38:51 -0500
X-MC-Unique: hpo330YmM5qFutuTJ5YWgw-1
X-Mimecast-MFC-AGG-ID: hpo330YmM5qFutuTJ5YWgw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4393786618bso12899735e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216330; x=1739821130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
        b=bGhFBwOkP9HBahocM6dlFeL8LlRYywfFW4DyCYRwa1YWYdgRbI60OL42M80CcQ4Bt+
         87KPu/3ooK1Rfxfspf7W40kW193U3cr6sdCh/83fCZ6Q3P8fagjkM4eEG9Hkcs/msko8
         PBnNmDuQWO8tJMyxXJNSFv18VncBc9TRi8xOhdrvd29vA0zm0cSY82z+B1zbval5BN7Y
         MiErTpgkjTI4Jpi05Pe8grxvzYEagj9Jm4yZ/oahjRYyyLuzRZJjU6Hl0VT6lH2SorVZ
         HNqe3wXj6yoIIQ2rxmuO7KHnzxxSSlHTtfzi8OOLKpxYwIPV6gKEgjIkElT70RXjYHbb
         B0ZA==
X-Gm-Message-State: AOJu0YxjunMTuytsgUyEUBCrenayete2qdV3+ob/R6EJjaL2O35lDBOa
	RfUvVVqb03C6RNSWpqMYxpydV9io5pKTLRvKVrDVYUvXuCn+tCeACv0HBHlUQEiFkQ1f/YCJncF
	rr7JyRGCPnfXRAu8Uq8/WSQzdLwbapiScCkskdPa0VDTtIjgm+BRCcf7mjEjIcQ2ppUJviBCwFC
	In42kOjYAxvUArQzaYMDA/5hlLTPiVw7ZKHSBUikJB2xw4
X-Gm-Gg: ASbGncsh/k7mpOqeBclChl716gzTq7y9n+T+RejpO+yRAwNqA16eKsBbGfIh2tszVV9
	crq1WQRe3ttD5b5ei6MTAJxbF4mMP3W+b9BR+QOH4VHGhyy2Emqb0dtRck2J0p4RCSf+myPT8vM
	uuz8wndY4hAE63zYr/V2fQKdyEW/dETFNCNb6poenmLq1N2dohOxclfADQJ+ZGrZSTf1gvHMLhg
	irJH9wfFK8ucSKUjHkia5COeb0gSrhcaVdVUfOPyfGYE4hJ820RqhRisqvpzxEiiPAaJlX9uj9N
	OaS9E3PeZJyQbi5Cbf3geTBs+XjYl3qVZpF3RXaAIuMEq7WrNVn8+w7fd5QRwn2wHw==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id 5b1f17b1804b1-4394bb0adb6mr17902925e9.8.1739216330003;
        Mon, 10 Feb 2025 11:38:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0Un4mhmMUf8CyrAHOSxNb3M+hrifrlRxr2GMjHtCC/u6kqhVG2aMU260gZj/4uoW1cKICNg==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id 5b1f17b1804b1-4394bb0adb6mr17902495e9.8.1739216329619;
        Mon, 10 Feb 2025 11:38:49 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43947bdc5c4sm26951255e9.23.2025.02.10.11.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:48 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 12/17] mm/rmap: handle device-exclusive entries correctly in page_vma_mkclean_one()
Date: Mon, 10 Feb 2025 20:37:54 +0100
Message-ID: <20250210193801.781278-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

page_vma_mkclean_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7c471c3ea64c4..7b737f0f68fb5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1044,6 +1044,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are clean and not writable from a
+			 * CPU perspective. The MMU notifier takes care of any
+			 * device aspects.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

