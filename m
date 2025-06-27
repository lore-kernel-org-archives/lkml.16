Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7C2C032C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025327; cv=none; b=iwZHG255LIH/67aFeOuroHjWXptmxx32LBP14pn6CvrYoCKbhhvcmXVc9xP7LYUT5WvAH4m8WazBqKbU06yJCvoTZqiG6BUUDeGTWoocDMU8cT9drtlgj9XDvmrPbWOuQ4J008NF2rV4BFoDqeq+QlnT/bFnokRx8Q1mdq5bJg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025327; c=relaxed/simple;
	bh=C9b8bzYVuBNX3jlO+T7eGAcebhKxaIwMsmpVwf5CeyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZS/wbm6FQ3ErA/zOCAotzIcAm3F+UwlwQOhopuxPCAcIJTLCYLmannQeOwlsC9PNXo4jzjZzMgD1NGWVJ7jFRIfjAsIIXOG4nJIcCQ9I+5ITwCpbHV0ieB4zD/UN5ReidNfR2lpo8DFkC/UnZ7lhIe4jLalvVmNfMFTwJefFi/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b0TqHXgg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b0TqHXgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mbSXmwI7TrslY1nGgIlZWbSATN0wGdT0UucOx2x/n00=;
	b=b0TqHXggl4MjjMx5rY1V5sKEukmMXMq6MVdm5EjJ6FshHmWfAKd4eaO6hb2+/iSCemor0j
	SEe2QEF/iOVGHHAIWDErbay+GDBu+xlsRGPGxxuEqZM641rqQFgUPu+nbxcWu1SmJtLKZS
	xBg0wOrTlyEjMJtelIOLtlY11TmBVZM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-jUtCc614M7KIhy6XKG0kPw-1; Fri, 27 Jun 2025 07:55:16 -0400
X-MC-Unique: jUtCc614M7KIhy6XKG0kPw-1
X-Mimecast-MFC-AGG-ID: jUtCc614M7KIhy6XKG0kPw_1751025313
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a52bfda108so1018497f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025313; x=1751630113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbSXmwI7TrslY1nGgIlZWbSATN0wGdT0UucOx2x/n00=;
        b=NmUrDB8ooRhhhxYTcaGnvO/7im1URgxu5qBYy+KOQJ/cJ+O/mudqX5MysYBHq3QRet
         wIz6vDPEXs2k3n36vfsovpX10plOHqKuk12z1D4jPgqxzBOPsrTAKlAB+PvpVQADIqYx
         qqLoGLNw9YvqqvEyAUw01ri71vvrQhwSW1QIXdQ/lkbBTpis1p3I4KJ3KV38UURpa5Ry
         uSqCIeIaF/ed074lXoo294cYrkprtrswQGunLKxheTkxPQIkfXNerfg2OHU8uiR/FiFQ
         HdcPall/KlwZ0QEtqmLKCBGRfo/qv9Q4++KVs1AZvRSbqtinZhVz+HTZyrmOTvvjcppU
         Ta3g==
X-Gm-Message-State: AOJu0YySie3XlK+SdF1EMTjOwt7hm/0Lij2xJfDffoS6fVaGAC4dTrpG
	7Mr3QSSKvN9Zn/sV3drahM2rRYwnvb8qKNgRsHxfo1DZqBGRDM+nMOW2YNGDfrUDLE4BktJ/7nL
	ENqH2thFMi5bVNW1ajbRh4UkkXL5NdWqDrMQh9HbZnReFr3qchOM6aTOzFO4zVEoj9XETSwjanE
	SHvL3glQ91g9jm8nDus7KPV1gTozdQeYdpHToOjF09rOP+Xyeq
X-Gm-Gg: ASbGncuub12kciL6gmBstAYoGGeUnHSAkAdp0aM/Iwmou2Rw0oPLle3XO5Rub0QA0Jm
	QDMDJ2WodcJGHVjFWUXQwVg54/Rw2D2/XWThw6qkt5GSTtB3AvzPC+hNjq0Udbk3ihPcPGfFpS4
	BPW9E9LQQCZgIaH5yqMBT4gS9KaroanRYOiFh7PRAai+CvhuUmbRSLR6pbGPUQzVXIGjUIBft63
	kVPAfB36zxP+325XF85J0AUbjfel0MIevRozsRDRMs5q/DhPb8HxDLLsvCHz3tz99i0A8PsjRM+
	es+id5xIZrSu5IDwyXAO0W2MFiTuJaDnpy1B4Zy7aBcRTVWg4+OkP0XeQ/6YgBwa20xPhZgWX//
	mERKrp94=
X-Received: by 2002:adf:9d92:0:b0:3a5:2575:6b45 with SMTP id ffacd0b85a97d-3a90075fd06mr2360965f8f.48.1751025312896;
        Fri, 27 Jun 2025 04:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFugdJI4CDwGzTOAtHeyUKGxYs4vUwxiYsnRMKAUbK5+L5Bwr4Th3CZuVl0FW8vFIePdmYM4A==
X-Received: by 2002:adf:9d92:0:b0:3a5:2575:6b45 with SMTP id ffacd0b85a97d-3a90075fd06mr2360911f8f.48.1751025312212;
        Fri, 27 Jun 2025 04:55:12 -0700 (PDT)
Received: from localhost (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e6280bsm2537152f8f.94.2025.06.27.04.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:55:11 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>
Subject: [PATCH v1 0/4] mm: folio_pte_batch() improvements
Date: Fri, 27 Jun 2025 13:55:06 +0200
Message-ID: <20250627115510.3273675-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since we added folio_pte_batch() for fork() + munmap() purposes,
a lot more users appeared (and more are being proposed), and more
functionality was added.

Most of the users only need basic functionality, and could benefit from
a non-inlined version.

So let's clean up folio_pte_batch() and split it into a basic
folio_pte_batch() (no flags) and a more advanced folio_pte_batch_ext().
Using either variant will now look much cleaner.

This series will likely conflict with some changes in some
(old+new) folio_pte_batch() users, but conflicts should be trivial to
resolve.

Tested on x86-64. Cross-compile tested.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Harry Yoo <harry.yoo@oracle.com>

David Hildenbrand (4):
  mm: convert FPB_IGNORE_* into FPB_HONOR_*
  mm: smaller folio_pte_batch() improvements
  mm: split folio_pte_batch() into folio_pte_batch() and
    folio_pte_batch_ext()
  mm: remove boolean output parameters from folio_pte_batch_ext()

 mm/internal.h  | 110 +++++++++++++++++++++++++++----------------------
 mm/madvise.c   |  27 +++---------
 mm/memory.c    |  21 ++++------
 mm/mempolicy.c |   5 +--
 mm/mlock.c     |   4 +-
 mm/mremap.c    |   4 +-
 mm/rmap.c      |   4 +-
 mm/util.c      |  29 +++++++++++++
 8 files changed, 105 insertions(+), 99 deletions(-)


base-commit: 0051fec1d393b659ffee707f869f8ffe4d1632e2
-- 
2.49.0

