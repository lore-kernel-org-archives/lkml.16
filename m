Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40942A96
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683589; cv=none; b=r0lkRJBFSEsPcWZKB9IKIntkgZLi/1M9VPbmIIxfFFa7pwvH5sD8izm39BTiKxE/wF68RF3Ut7kQvbykj9wWjHgqgpdFrxbFUpNl8INMZN0eYa6RyvbUnTBRVtCQB5GHH2EPZoz7mH0HcmySqn1RwBqtAstLu4edyiKvpQgYjho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683589; c=relaxed/simple;
	bh=FnfbmfTyanL5Cun+dD1YcvoMBPjIcokYcufblH2DYy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LYKhiEaJpJW92119686Nv1mZ8eHcZdzESQZ2sVzScNRwuTs7HO0S0YrRxdKypBgKkDhiH7cUp6jV4skEELfvZYCP3pqmjwKhVzhY4FUAXZ2pOSZcG8UTapzueyYfWVCKOdqyvCNYFIM8tN+syMDTQT7f9pr5PlvDIKSIg6mfAxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ac78NlYG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ac78NlYG"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1070229e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743683585; x=1744288385; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yE61JSZwEpUDFMjEkbmv0JwWRe8/NoxJlZul41Y8Z3k=;
        b=ac78NlYGwC1bRQMdow7mnJIjrjmpVHXtvIKjDmtZPBGjdTshPHjvfWmAMQxLPYaDP0
         nr7yif/ue3+RR2/lCDJeDoOwmDniYXwl2yFmRiC9Sgh4wMuBvG9jdapdciImJV+IhP/K
         tEqLQ976jp2/IIqpLJ9Dm5HxKAqby6I7eK3xuQhquqa/c1fSyEzyji6Uas1CCFbPSv7B
         +fRiXoRNeUsAF78mSXp80gvcohENWR+pXcPOkQo2QhbERgOlYH6Mexw2/tLvn56tLO5J
         dlL4Da22+7NnedQkA+dUkFCqXDo++vWa1VwTpnOmPvYuB6bI3+I5py7Et85bSDoO/www
         Wpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743683585; x=1744288385;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE61JSZwEpUDFMjEkbmv0JwWRe8/NoxJlZul41Y8Z3k=;
        b=Ten16ZoxytJL8ZgLbGy/SPQvI5Plu9P1FhgkWdgoPQaRZXKs/XlLRp8hv0kJFd6VHy
         aAxRSFowVrEOB5iFh9+UW4Jcs8R0FxOVMIqYpx3CTZ8R44gadL8wyPo5T1DPIjQuJIgw
         O3f3XQKYfGQTYX5qw+P6yero7vZsW29NB7GktW6Yy2b0za91bO39LOzCMDdhrIl59aH4
         /RyC3U+Xj6Ymt70HnRHfcgBCPHz8ApjVJaFTQynyxQ1xc/Rq1ZPynGc76ldeOrTUz7KJ
         DSKd4O5s5v2G3qA/BCqsBsC3inOuhg+aVjtvp4//FnKI45KKSyUt6Ba1Q7mQl5GNXyJ1
         FIsA==
X-Gm-Message-State: AOJu0YzldqHbDJ1XFvD9xHn3MmhewynjC3qyqUO3knAGfKgJJUUaEoDR
	I6rj7azZ9NkUCs8JzrUtGzaBqvr1ZCFZRZVlkWsh+kGhEPhj1v95M1zbeqTVD+XojtzyJmt4/rV
	m/9o=
X-Gm-Gg: ASbGnctciswA0eBj2pr7dkaj2TjThvOnwYeEFDCNH2CKNLKuYBb/eoecpsxiyzV9I/H
	AfoAZ3yV26W8jjQUyuu0IF0R/a4Ef/LUZfap6cRX3bdDjkQRafmppHPIHWWlGQWaSKzKWPczAXR
	HwhJHyVnbJ8QIHyhJv2e+5ZOosAQNacMMUndlaiJmUAiSNNZ+e77MJcZB972FxaorBanYO+LfWd
	wci5xG1SyXr+FYKCAa1odjQwggKC2XuAO4lQ9yZy5n8rqBtd+mcBoOqqwSQqqV0h0pUxcBPfRP5
	PwjOvCVZQwnW5ehO+ttMc+OvKf4yYLQAR7fHr0E7yiMKE1nrMuuj+tSB6Am8bWHRmg==
X-Google-Smtp-Source: AGHT+IH9BkDSsdgdq+MeYUd/rPtLAfQk2repkN/tz0wrYeJgFu2fBJocqU+GW/LW3oTG1kQpXGdjUw==
X-Received: by 2002:a05:651c:220d:b0:30b:b9e4:13c5 with SMTP id 38308e7fff4ca-30ef90ccfd1mr19259601fa.4.1743683584965;
        Thu, 03 Apr 2025 05:33:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bd00csm1978501fa.66.2025.04.03.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:33:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 03 Apr 2025 14:33:03 +0200
Subject: [PATCH] task_stack.h: remove obsolete __HAVE_ARCH_KSTACK_END check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-kstack-end-v1-1-7798e71f34d1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAP5/7mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNj3eziksTkbN3UvBRdSwtDYxNDgzQLM4MUJaCGgqLUtMwKsGHRsbW
 1AO0RXTdcAAAA
X-Change-ID: 20250403-kstack-end-9813410f860d
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Remove __HAVE_ARCH_KSTACK_END as it has been osolete since removal of
metag architecture in v4.17.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/20240311164638.2015063-2-pasha.tatashin@soleen.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Resending Pashas cleanup patch as it fell off the planet
a year ago because it was part of a patch series that
did not go anywhere at the time.

Andrew maybe you can pick this one up?
---
 include/linux/sched/task_stack.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index cffad65bdc6a970084cbcfea1913ba53a12dbb4f..85c5a6392e02776e462b2b76e8e1aeb9e1f91af0 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -106,7 +106,6 @@ static inline unsigned long stack_not_used(struct task_struct *p)
 #endif
 extern void set_task_stack_end_magic(struct task_struct *tsk);
 
-#ifndef __HAVE_ARCH_KSTACK_END
 static inline int kstack_end(void *addr)
 {
 	/* Reliable end of stack detection:
@@ -114,6 +113,5 @@ static inline int kstack_end(void *addr)
 	 */
 	return !(((unsigned long)addr+sizeof(void*)-1) & (THREAD_SIZE-sizeof(void*)));
 }
-#endif
 
 #endif /* _LINUX_SCHED_TASK_STACK_H */

---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250403-kstack-end-9813410f860d

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

