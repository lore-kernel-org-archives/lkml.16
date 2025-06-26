Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB582EE607
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968580; cv=none; b=qUcn3o4cFh67YQ4BApSaBk1evIw5ptM6PjfzfLmj6n180Mf47p6HOvxRIIYxtHsqYKYoy/v7E8hKcZNn4E4bqnGLp2vt90ZbeHuqtvZO7btuSZPhzMP5IkNYt9n0tJ9Mg05cUaPyBsgaP1h8Sg4C/5WM08npw8chNn1MnV1CPzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968580; c=relaxed/simple;
	bh=HkPQis1Dt4ouyTuYhnRNzIy+pryxNwshbwjK5ApfU7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pu7idWPAWCIwQW/cDN3JvSu6euS1ri3ImOPTJQVBs23T0iRvQO9MJaeBi0nb9t7WIP1p0ZGElmosWSaibjFIejnZQNFIcHyi211Z3gvQJFyvvRO5+hi42N/T6/8xwlFSaHGONCEcwtuGMbHHCEou8u2mdNa+uPE9OEBJotDnBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHjx1d3v; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHjx1d3v"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70f94fe1e40so28821897b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750968577; x=1751573377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIMOx5cGmleXM2fMTx03wz+aj/K6cEb/ocYWuMPGis0=;
        b=AHjx1d3vCPepKb2aUYfAYalzbDI4sxGPrC+BwjItlVLDcsonoe3rwSjJf8RdS6v1xF
         37v9Ri1JEOqL3BRPuYJS9IWWjBhimEif0MLUy1EArnt/tRFbzEpDfdnjZd/gdOzEtXG2
         aNMC9hiv+SXjvKihbmduTAm/eSrMnce7ctunv4FvI6leq3fOsgLG0cpaLBsSlamlcRag
         vclmNkd7UsL5IxyTgL4Zyf9cz2Y8Uni4whp1UdzpwITJwZNOTkhMt7nIXYSoZdUeDM/P
         vZPSgZQyQ7ooU/iCdp9lZEQpov6VIEb5QjbtHswjVYYOd+pNAwHgZwbL06ii51FQqwvk
         Nw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968577; x=1751573377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIMOx5cGmleXM2fMTx03wz+aj/K6cEb/ocYWuMPGis0=;
        b=MAkih6MSIskuu3a0k5WE+FL+94AngkJvnm/vc5YNUTdD32ujpgzde5wTsdRbiJC94U
         CBsLPKxuVZdLGhutD2lwvu2UuM7w+NCONCpsTFapgXYgPaZ0OGqz8bAgEpEhS4tDM/eP
         hVNvg+T6/reIp2ETibAnsfxxAoeCwlrEhjVHIl9kbJ24O2fO1ZSxABz+hvOpNcE7jWT3
         TcuDyHm12vSx/963/J6Ba/p/MBSaNEje6Zi00MRUgpdJSwOzDkqXyRHCC2//Yh9uVwrQ
         MpwoZfDqjxBv7+xp1VaNmPvtaWcue5VA8f9egQ86v7L0IK83Sr4gv4SsnEdZZ0zbLA8y
         Tv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMCcG4WqYDJ6UzfHU2gxkB2gBioCbrBEl1aHO6rqZ72MdkhOmFeK1znqmcM3zEUg6ZLiC4CVldNh90mKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBXkN8p8fSq/xaNHh6Doy5nyBUYzwd8V/peuJ+NPACZkdzo3IU
	QN4aXRXbNcW+JV6jN5wodMn94jVS8Lk2LjcmXploNbyucMbJ1o57xtj3
X-Gm-Gg: ASbGncutpz5L7La0FmvxtRhVPWLSLpN2Erq/M1G7fFxeFpPA82ajRuKO0SICinPUXmP
	u2o3CNqhbKUdCgrYSwcLTX9/Rn/Jc/KlsB1aAcnKMrZaWdRWKcnZXaZkPgd6iRoJQ7oYkWsA0Sl
	44wNhPA3SPTLpYKIOGPtAtAgo+oYCIRd7jUoZ8tpsLh3GjWWXivKnOFss57FTeOc2GhuEb5iEEv
	gQU05qByUSRBux0uvGLdS5Gyt5pqDDAPVEMpe1zPAK6AwD/LrarUELAnPAPNCdyY7+lCTHTh+r8
	QVg8qJD+2Crt1yO5rZZUG9G45ZQ0N/v4CftfVThGeAua5b30fm+X8kSLIeEWNA==
X-Google-Smtp-Source: AGHT+IGH5/FWGAvbSRuHvuVPzNK/EoQBtG2taFatS0UGzbGcfgd1ZDJkPBU/YBA74mhvL3a5H5bxtw==
X-Received: by 2002:a05:690c:6906:b0:70e:77df:f2f9 with SMTP id 00721157ae682-715095acaacmr75179577b3.15.1750968577087;
        Thu, 26 Jun 2025 13:09:37 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:4b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c90f65sm1321087b3.78.2025.06.26.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:09:36 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: [PATCH 0/2] mm/mempolicy: Cleanup and optimization for weighted interleave
Date: Thu, 26 Jun 2025 13:09:32 -0700
Message-ID: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small patches for weighted interleave bulk allocaton.

The first patch simplifies the delta calculation needed for the allocations,
removing an if-else and performing unconditional additions instead.

The second patch makes a minor improvement to the weighted interleave bulk
allocation function by skipping a call to __alloc_pages_bulk.

Running a quick benchmark by compiling the kernel shows a small increase
in performance. These experiments were run on a machine with 2 nodes, each
with 125GB memory and 40 CPUs.

time numactl -w 0,1 make -j$(nproc)

+----------+---------+------------+---------+
| Time (s) |  6.16   | With patch | % Delta |
+----------+---------+------------+---------+
| Real     |  88.374 |    88.3356 | -0.2019 |
| User     |  3631.7 |   3636.263 |  0.0631 |
| Sys      | 366.029 |    363.792 | -0.7534 |
+----------+---------+------------+---------+

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Joshua Hahn (2):
  mm/mempolicy: Simplify weighted interleave bulk alloc calculations
  mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted
    interleave

 mm/mempolicy.c | 52 ++++++++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 27 deletions(-)


base-commit: bf8761eda0930400291552bd314c9d59b720e899
-- 
2.47.1
