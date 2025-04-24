Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DB01B040B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531858; cv=none; b=W7n41+H6s43V2ytpRR4m3UYfuaif5o7wJODX6SWhbmbSL+RLYeg9l0ejGaEDLj4F2nDlwXcnUZ9wPoevfIzMGE7y3EvvCJFKZT0Q+e80fMnRhr1/Mq4lXB2nsd5tHK63cQUId586tJx8pYmecsRF1mXYs0ITBs9jqxy0tcCl+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531858; c=relaxed/simple;
	bh=8bsHjJkOJJtj+B5EgE1uZlSkjoCjt3dk18SxFPupzsI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qC3l/9ku2Bk56YU47zY5UGud/LQIdRiP6oSGV1FHZt4cH/1m6FSj4waff3kXBzzR1nThfTAdfFMQwLy2fARhaAIB0uA8KXi29lVNiqBhbvO2vQSfpS7otIPWe+XKGyv5NXJ9jyehgpPseSSxFLl5YLXeFQnwglDFZXpQZDNXXKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaIhiQAP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaIhiQAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745531855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gNFAAkwdWRBtpRVBQdWenlqFkFWJNty+/AexJPWj//I=;
	b=KaIhiQAP+bjlL+ppI8YNP/sV3mAbQvFISOhj/XRHcEzAi2q8vbAU/hh/snqSeGleB9aYPH
	ZnuuEtxyC7RCAqa6aJkWQXYHftp//7zax9jVdSAe8rsP2Dz+w89BU3kBKtHHixTddKJFzX
	2H920JY+sjdwTtJK2AAjluF8nzIWhsM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-2dMnsshlOiSTGgvizffEjw-1; Thu, 24 Apr 2025 17:57:34 -0400
X-MC-Unique: 2dMnsshlOiSTGgvizffEjw-1
X-Mimecast-MFC-AGG-ID: 2dMnsshlOiSTGgvizffEjw_1745531854
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso327180285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531853; x=1746136653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNFAAkwdWRBtpRVBQdWenlqFkFWJNty+/AexJPWj//I=;
        b=inMZzcRMXYXAS09C2qJDJPybhplOMuJ5dx2WrLj2c46p9ZH8ukuXenZjTBb+x5dEOZ
         6N8zb9uTHcixGnT4RuU+GkTFEuEphA8G1Pz+spBtlLGj9gBJvc52WsYS7d5pfBJ60i5C
         I7o2ptPx8ugTCt6pF96WLpMCm11frYGqboF3KJhGjc+cHQ4Rc8JvxuVEtahyboKx+1/Z
         Ew5pCwuT/pcRs9ZhJPMZyaam/QzjpRDzgwLMonlNqB2ooJKK259Ai9XLRaCdzxoBqsSY
         AFbSujb1sVcEeaxScZCg7Se36NNl4LDRbMgKbnu97JzOObuih431m1ITp9Y9x6uy02cE
         4FZQ==
X-Gm-Message-State: AOJu0YzxvW0P6Sk3snL698BroUs8+gaRd0IYJNrqdZ/RPjCUrd6w+C6V
	U+sdez8lxg/14Jes4NWj/wuNPW8xwmWullaci7Ykvf1A5eitTR+MAElE8Y798jq6Kqkn2oOnZxh
	avFlyFVjTyZML+2ORZNJnulhQcFvTKRrE8RtvKmbW+eB5DDNOkFXcEJBtahT8znwu01xgAuiGdR
	fdHkuH909bNu/22jy20po4J2gprDu97xT5ox1hI0OjFgo=
X-Gm-Gg: ASbGncuUE1o96osCdiZ9RLFPjoWWanpmR6+ehHpSCvDZR+96LTX2LF4ingTjgrAjdf5
	MI3JnqbS6bKc8T5BasKYBN4DPcB8Pbyx8gv+5vMGG+T96GCuaDlfNyk4YDh3aBJ1Ukqzt5TMaK3
	/v/cVJXi+FhQLqrNdFINtKQ/DuowU76iTl/v97u1vZr78tSuksniqSTDkZM5SJjykrKiLaGGFT9
	diOXhMI8Ym5RG/kEsvCOYMGYWQDFxPySAIN8x2yGSEsWLlrGoYBxb2wNoAypH/UUGCfeIyNFki3
X-Received: by 2002:a05:620a:191d:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c9606e271amr25350185a.18.1745531853294;
        Thu, 24 Apr 2025 14:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEUqIBKqRuM+uilYhLKP9IyuG1SpIIrfP8BP6vvhC+iiiesMUlQ1uhvKuEqA1nOvdsUhaf/w==
X-Received: by 2002:a05:620a:191d:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c9606e271amr25346385a.18.1745531852845;
        Thu, 24 Apr 2025 14:57:32 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ea2a6dsm138737085a.106.2025.04.24.14.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:57:32 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Mike Rapoport <rppt@kernel.org>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	peterx@redhat.com
Subject: [PATCH 0/2] mm/userfaultfd: Fix uninitialized output field for -EAGAIN race
Date: Thu, 24 Apr 2025 17:57:27 -0400
Message-ID: <20250424215729.194656-1-peterx@redhat.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When discussing some userfaultfd issues with Andrea, Andrea pointed out an
ABI issue with userfaultfd that existed for years.  Luckily the issue
should only be a very corner case one, and the fix (even if changing the
kernel ABI) should only be in the good way, IOW there should have no risk
breaking any userapp but only fixing.

This issue also should not matter if the userapp didn't enable any of the
UFFD_FEATURE_EVENT_* feature.

The first patch contains more information on the issue and the fix.  The
2nd patch is a test case I added which would fail on old kernels (including
current latest branches) but will start working after patch 1 applied.

Thanks,

Peter Xu (2):
  mm/userfaultfd: Fix uninitialized output field for -EAGAIN race
  mm/selftests: Add a test to verify mmap_changing race with -EAGAIN

 fs/userfaultfd.c                             |  28 ++-
 tools/testing/selftests/mm/uffd-unit-tests.c | 203 +++++++++++++++++++
 2 files changed, 225 insertions(+), 6 deletions(-)

-- 
2.48.1

