Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF325224B0C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881432; cv=none; b=Pw9OTxD8qIsQIN79fFMmR0diag6l0rICyS4Zcz0TOvXeU6oHdse2VfIrmnem1eNeQXYg3C0+Gq7gqTp82SrPhgm8pBARboDjDWLXRkwQOjrvdGY3cLeg3OWKuBWPw7RHkTM9hJbTyWFsKLoVrkrmPuioWCxjd7sNMKgoai4OzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881432; c=relaxed/simple;
	bh=MRqXBdAn9zDoJaYcvJl4grJoIUqjqFTPczFxTi9DeAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpxnJkynt55ce1SFCozKcFsOF6f9gCjbLwmK1eSGKRBrYKhAAVnFRTmdcWNKt+w6PJOuc6ZLL3bKfbjH8WKaM3o3T4+r9Su9iX2Gzb0XTBTy9XnuLDGN56tAQpIYxg6PRtWx0lbcEEDNHlhoiY1viQm8hh66fdiJOuG6pgg0XOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmYwRzK+; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmYwRzK+"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ff4faf858cso30949937b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748881430; x=1749486230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6hViexzBOJawxZADAUmG+i5Hyb7f9Zdki0bf4IHNME=;
        b=NmYwRzK+ToYi37xYAZy5M9S3VAGXVkHUJx7ulqeE16azidYVcc8MngbFICqNfMCA5P
         F2CwXEXQW1t6TkvYfF8iUTGypbyP3pWhRHO0lrUhW7AEY5K1lvvwn4fKn84n0ZaTHVpx
         Y7IcoC93RDd5gEl65SoYKvvw+USl3tAzE3gb7tsiqZxqHFb0eus6uiJG6brls63DpJ7y
         5oAcOBe1yY2Hzv/mCE+hCibhZ35Jxf7zb4eaFd+p0EoIl/CG49pkiE4sNNQmN+G26z6i
         BZ30IrikzmCDlEeITG7O5yDF59dh2bZW53J5BUkGAXA+sdDmPEE5DMQzhj3QNDRN71Yy
         d+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881430; x=1749486230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6hViexzBOJawxZADAUmG+i5Hyb7f9Zdki0bf4IHNME=;
        b=IzHKvZ56sC4oE1A7YCc1aGbmrG4m+q0777hk2oWVOyfNuAfAs8GQQC/bLLR6tvNdPV
         PqUJN+UzgZs8dC10M2C8c7GzoF8f7DiBqKPEvywu0mSEvE8KxEIvcgI9I6X2Bg47QW1L
         vZyI71qmR508yZjWTd+TJnq631Wj11ODMf/Ct2MYgxinzyb35UZn/45/KuTCVaRb9+Yj
         /tfigRYhEenOrgJTO0qqWpmwly2KT8rYaAhmcZ4wqBH27stTFHVl6PMRzEfd+c0BkbA3
         XfB8sMbLSyaRfgGPkK0toiKX9l9hFmyn/FWPjcrfxJSb3XyijGNSMQCP0BwpD9QNDvGT
         ierQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAkiTjAJO8bApKmHNdsniDATAnk40+iVuzzlXoNGqNEXSVIjWAtn+z2fA+dz14ZSgHKL6Nqh//ZejnIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYZzEh6AhCY0MfmxeAdwJq2OBRduej30mpHrNoWKNU18iwPOK
	VyyqdhBFTjjw9D5yYDbzgtDykeqazEb/rTlmmJl2LrQKbW9sfTolG4v1
X-Gm-Gg: ASbGncu5RG+NMgllUrMeEW/IXcMQdtR/JtAMngXp7dEIxPL88KKtyYPDbmLMCMkGfhV
	aO3XSZAi3jtk5PI7F/NZo1SP3dvUjkkdBCdKUAR/fR3JMu3eJEJooyPOQ1q10curkHtpPqAeu3g
	WxDWNPL2HrjkDy1SMdMm19dil8wSxosYqFpEHCPPbjolzv0uHQsw06SVOHQFYHf1AezNDa3j9q5
	7y+6wYi0e4lLUgfTvDmJG70LB0NXVck+fJ9s0+MtmaU4YzfbZjlHf6atTiRWDytGHjanpncXCXd
	cmepLt+OpsA1cCCTfG+oDIHiABZyfTownDQN2RV9rbcJdOA=
X-Google-Smtp-Source: AGHT+IFhg/cUFp+Z5nleh6zqNPQkgj7/iV/9zMKVm808PtUFq1TWffftuwjIYHM8E8ba7zLCiBhKWg==
X-Received: by 2002:a05:690c:67c7:b0:70e:7a67:b4c5 with SMTP id 00721157ae682-71097e67ffdmr118360997b3.36.1748881429609;
        Mon, 02 Jun 2025 09:23:49 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abee777sm21191637b3.40.2025.06.02.09.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:23:47 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Gregory Price <gourry@gourry.net>
Cc: David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/2] mm/mempolicy: Skip unnecessary synchronize_rcu()
Date: Mon,  2 Jun 2025 09:23:40 -0700
Message-ID: <20250602162345.2595696-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250602162345.2595696-1-joshua.hahnjy@gmail.com>
References: <20250602162345.2595696-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By unconditionally setting wi_state to NULL and conditionally calling
synchronize_rcu(), we can save an unncessary call when there is no
old_wi_state.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/mempolicy.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 3b1dfd08338b..b0619d0020c9 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3703,18 +3703,15 @@ static void wi_state_free(void)
 	struct weighted_interleave_state *old_wi_state;
 
 	mutex_lock(&wi_state_lock);
-
 	old_wi_state = rcu_dereference_protected(wi_state,
 			lockdep_is_held(&wi_state_lock));
-	if (!old_wi_state) {
-		mutex_unlock(&wi_state_lock);
-		return;
-	}
-
 	rcu_assign_pointer(wi_state, NULL);
 	mutex_unlock(&wi_state_lock);
-	synchronize_rcu();
-	kfree(old_wi_state);
+
+	if (old_wi_state) {
+		synchronize_rcu();
+		kfree(old_wi_state);
+	}
 }
 
 static struct kobj_attribute wi_auto_attr =
-- 
2.47.1

