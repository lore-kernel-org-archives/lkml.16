Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657D31A60
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749996707; cv=none; b=dFOJxf1NjihoYG8+zMfOhLAxt3hoPuld8zMq+RUCCFhfKBpALNI+UPTiSCWftIcH8q9gGEhuq2q/1wACxWT4+uswm/NqjaAVryuSy4djKEG7w+0eS1nYrPOf9+/UBgTb1d/jERXDdm7hsf17SFHJf0GIzwC78LinvmFU4AXTMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749996707; c=relaxed/simple;
	bh=j09xSvhYvcfJYpTTYoVZvzPhGa2m5l1X1PCJL7zKBBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i54K4PCa04AmyIXB/SemPHfopuoc01L7cBrhuvN/MMo5NvJDmKH+AsBzB4Xr2jx2uI0ZOEKLP2UEWCdzSuuAW7E6jlTzZlOk4akGXobZL9UItmm3gDlf5+jryvQQ+entSceFMLV1Y3ff0SQV8Oumpjj/TxsxkB3mlv/1NVAdBzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313290ea247so669793a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749996705; x=1750601505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGYFIbfhwG/ewJSvY1vT2DTH4BojWvMhmzCrf4rviWI=;
        b=ivQKIHjM+7rwsTv1+dQ6ew5u2/7aIoMocVLR3D5Yxpe/JC9DVwt4PLiSOOtqByCHuZ
         Ij/ShxXBIIeVKUvTX52b5T7jO0BN+Xt6QxpyRqGnnLmMbvtvjhZqOj0DDMSLlXPjPmC1
         Q4ZEo+LSiD+FeEi6vntvr8SIKug3lIhUeqn07YiBhpZQrdOf248EVIWOjja08mAC3BTp
         El3dmOVo9cM96hHgxpNdTeiMwUc85eog1DNInUJUi60mFodZWN01NdvLkz36GUJ/aZkT
         jq2+s+4ApKJ7X32jm1OlywgXcSLpvVxkK7Jn5cqT8ThRZMx0LgvFj7NLGrFJ2ne8ZlQj
         paQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc4SmOLzNWdr+hITZsEt2TJdaGlXT6kw8S9JvoUQN5p/d7/i4zEUwrcUQ3grFTEszjnmaXtF9g31NvW9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQNSkI1fxMwBvX+Qceqpx6RKhxXPy6wsaiJDInF6hPThFh6i6H
	9Ku/sDfrL0z5OK4YqowzjI3IvkbpWdrO44t+JJ83yfw/escBuA8UQiiN
X-Gm-Gg: ASbGnct05BVrD69ZhvRxGL2w8N0BCjLV8A1UvjkPVEAQE0jw0liRiBmcWPB5+sALOqY
	7ey73WhY0XkdHHXOKCeUsG7w2XznnFLbTj3Lq9odoGXNyEHKvat3ha0N6B/YU2qna+KiV/JvARH
	r0ZgmaZY5ysC7af6xVQ9NrZPXYJcx9WWF+7591HZn4rnc0zHYK/VmcJfzTbyb3jSowYE2Zz4Af5
	IwrFOxwK5k5JJTFFNdn75CR/BgYooiX+nu4i2g2ylcgXHSu8wXiTvTSVSH7r1auRUBqPBcJy22e
	eorrbpguWjsqiKcNvJPc3SGgr8xlmzJpQp14dKuFmptda0BTIlaZvgT7hUOspLDqBnNG
X-Google-Smtp-Source: AGHT+IGGa9UpaHH1Yj95UONqu/2rdm8o9/Vcg4vz+0U3koVu0uwN1twEJ1XBEWaDhjWWABQPAGIbfg==
X-Received: by 2002:a17:90b:540d:b0:312:1d2d:18f8 with SMTP id 98e67ed59e1d1-313f1e50e63mr3448982a91.7.1749996705027;
        Sun, 15 Jun 2025 07:11:45 -0700 (PDT)
Received: from localhost.localdomain ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de783a8sm44233375ad.99.2025.06.15.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 07:11:44 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] arm/probes/uprobes: Remove redundant preempt_disable/enable around kmap_atomic
Date: Sun, 15 Jun 2025 14:11:30 +0000
Message-ID: <20250615141129.653384-2-ysk@kzalloc.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'kmap_atomic' API implicitly disables preemption for the duration
of its use. It merely cleans up the code by removing unnecessary
operations, making it clearer and efficient.

Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 arch/arm/probes/uprobes/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/probes/uprobes/core.c b/arch/arm/probes/uprobes/core.c
index 885e0c5e8c20..ebd17af0d865 100644
--- a/arch/arm/probes/uprobes/core.c
+++ b/arch/arm/probes/uprobes/core.c
@@ -116,16 +116,12 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	void *xol_page_kaddr = kmap_atomic(page);
 	void *dst = xol_page_kaddr + (vaddr & ~PAGE_MASK);
 
-	preempt_disable();
-
 	/* Initialize the slot */
 	memcpy(dst, src, len);
 
 	/* flush caches (dcache/icache) */
 	flush_uprobe_xol_access(page, vaddr, dst, len);
 
-	preempt_enable();
-
 	kunmap_atomic(xol_page_kaddr);
 }
 
-- 
2.48.1

