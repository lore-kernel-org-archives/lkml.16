Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B02550BF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953028; cv=none; b=PGZbVgg0I7AOA9ROK09FRLJ4EQa77sLRW6citi5ZLdH/IusL8HHebrfSd20V1ncOcXl6alMjxi95IMpZ3qs7M6EXIIb3ol+/S7JTDbXzZNpqs+d9VO/OVuqLLrb2VpIJlTJagB/pNs2pdGvm1ztPNpGauHjgxLfF9TR40nK91js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953028; c=relaxed/simple;
	bh=an8fPGi94bYvyE1y8p6iS9mxJmsi4pDjOvkbFbfR8xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Wbokua8ETZK0ofBv29vZPOt3Rdo/ZhNKCRCsAmLykaRVJ6sEzsTvcEwU0TYEc78D6wGDyvR685D3HGyjmsdGdkcCbAoWtcEcuah1w/uKzs8lsZo5DpdFiIwyxJHKoYA09Tm0+8NQpCqeCNXaecFQ6tfjiQz3RIYv8j7VnSXv4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P7pLor1Z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P7pLor1Z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-443d4bff5dfso12435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747953025; x=1748557825; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ty+aRqD69J6N+JcORepKn7zTsLIxgBrk36Nne2pXGUg=;
        b=P7pLor1ZziIkootUbJJvSz7XAf/NwDnBE2osuz6y9eNObUSwxHG+nchHRxK9NNvbjf
         79SQ3DMhe+yCIoagVTFpM8DLk0gf4TB49H1dRtuA3mxsek/410GE2q0YkMobIwO59wvU
         4i6BWDYqEJ/dXK1wQ1cn0XEld8LuIRrwXPEjDgYiYNOjrzm8mUOFU1qhkFfiyunmGDL8
         1LMj9tp8wIJA5VB6VQ1Jc5y940NNqvH/3KdizjPz0SwCL7wYr+2gpzWIX+iXlPv+WGQc
         DSuPxRoLgMsyALqDl+GIKS8SBNnrFwaxWPCoYFyJ6KkBoOV5VN7MWeiw6J1KrECUPQzF
         kFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953025; x=1748557825;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty+aRqD69J6N+JcORepKn7zTsLIxgBrk36Nne2pXGUg=;
        b=wl+BOj+WNPSZRW5U8uH6Pq3rYXrmURtESu9TmI+P5dtMRXN5gFU15KHG6+g/dTTktg
         Y4ZuPbt7J7m3a/IavPFek1z1L1l3oDXqsb9gW/SoJ+CHRDnJF6UsHwzClCREXYfD9ARN
         zWqEpOKUG0Fdl8exOILHRlxleL+7yz7GkP2o4co43q+swAzVwRDlqKG3M09vFDvyVwoN
         nkrVFQaEGDeZiQdXfzvGfQl261RgMTQ5v4rmmodCpU2FIEBaBgWPcXQgy2iowNvhA237
         wBXH8Sp3DUPuStfVA5FXzhAqytgM/1ojocw4+x5n3P3cWAv0Ls4S2Iw6z/nBqxxMJIzD
         KlGw==
X-Forwarded-Encrypted: i=1; AJvYcCXv8mTwh+VXOyQef2n3TW0lhzcn62HB3lTk/RbhGYeXrfB2G5Dp9M4Xt1tiyx23LvP6itF/WQwApHp6ATo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJUgvPhFA8OMCYsPndgP35hf6d35tVvibSFiqJcLT7xYr0GiY
	rVMb0Ff41vclfps3XuDnW3QvXjbvEG8M0QkkqqUsId/TYJlqg5pRl3es833gKNJKEuv888SuvcX
	Yf4ufOnTt
X-Gm-Gg: ASbGnctEdrzh9ZSumwoDjBvKMXFSsAHlFfV08g9K3N+nnudkEpxIxES27u8I1ayLf27
	WbZUjDtLNEgBXeBw5m07+CFTQJrfX5VvU8OCimxxgj/RW538++HFF///xL/iYLg8aDUZLjRFNHS
	YkZ30yDTjoLUng7sN6MlfuY9VOxNf6gzQIPLiU3L3F7pCDsPkNt3gIJiQ7G8eKjv5kfUpe7lgcZ
	l6B9XPh+2F0jFG4M+Vnf4IG4qOq/FWCPxoxRyegf8rsbiI9zXXPtFN5YAUTl2/RIg2QAaO3spla
	r8OM0XA32EYgpRZhx+jhxn3lb+Pc3er0xlU+3BTOI9Du3i1IyGBDR88I5LOhnw==
X-Google-Smtp-Source: AGHT+IFPlgqLSsJn0hFdkgXCDckIMyvribsgHCVZ7kCFHIgpVlh62Mq8zGUO3ZzO28SolV+amUUgkQ==
X-Received: by 2002:a7b:cc95:0:b0:44a:4f96:181b with SMTP id 5b1f17b1804b1-44b85b0c213mr183645e9.4.1747953024675;
        Thu, 22 May 2025 15:30:24 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:1657:8509:a8cc:c0f0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca62b47sm24897561f8f.58.2025.05.22.15.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:30:24 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Fri, 23 May 2025 00:30:17 +0200
Subject: [PATCH] mmu_notifiers: remove leftover stub macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
X-B4-Tracking: v=1; b=H4sIAHilL2gC/x3MQQqEMAwAwK9IzgZqil3xK+Kh1Lgb0CitFUH8u
 2WPc5kbEkfhBH11Q+RTkmxa0NQVhJ/XL6NMxUCGWtOSxXXNqNshs3DEsLDXvGPWnHhCst3HkTX
 knYMy7JFnuf77MD7PC3V/MJ1tAAAA
X-Change-ID: 20250523-mmu-notifier-cleanup-unused-238762302a66
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747953020; l=1255;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=an8fPGi94bYvyE1y8p6iS9mxJmsi4pDjOvkbFbfR8xI=;
 b=MS7DKpAJw5VzTdQyEoZXdreu+InUoIPHOYT+zVwwwU74tLxnVo9CLnmoQmzLwekovU8qtXfdf
 WCADs9xs0NLDfJlkCNy4kinLw/hOinwP3T21nsfzrWbYvd7zBmPqrmg
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Commit ec8832d007cb ("mmu_notifiers: don't invalidate secondary TLBs as
part of mmu_notifier_invalidate_range_end()") removed the main definitions
of {ptep,pmdp_huge,pudp_huge}_clear_flush_notify; just their
!CONFIG_MMU_NOTIFIER stubs are left behind, remove them.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/mmu_notifier.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index bc2402a45741..d1094c2d5fb6 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -654,9 +654,6 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
 #define ptep_clear_young_notify ptep_test_and_clear_young
 #define pmdp_clear_young_notify pmdp_test_and_clear_young
-#define	ptep_clear_flush_notify ptep_clear_flush
-#define pmdp_huge_clear_flush_notify pmdp_huge_clear_flush
-#define pudp_huge_clear_flush_notify pudp_huge_clear_flush
 
 static inline void mmu_notifier_synchronize(void)
 {

---
base-commit: e85dea591fbf900330c796579314bfb7cc399d31
change-id: 20250523-mmu-notifier-cleanup-unused-238762302a66

-- 
Jann Horn <jannh@google.com>

