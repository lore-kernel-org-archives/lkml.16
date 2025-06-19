Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAB12B71
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750291783; cv=none; b=Jn4aWenl6jNGTn0alBvvYY0x101CBDWTa+pjfEjdwAuGr8MNVXbCgOTTmsy4sGCze7Vb8LaeSy1alNkOmCeeE0PDWkYhRRKtbPpCuuLXbk7RY2ZgoTT/IO3Vf5NleLDjJECuQ2KcD0v9LUGZGyLBO5MjNyhncnoQF6sjkVLCVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750291783; c=relaxed/simple;
	bh=+qIMTdK2NCPkOQxAHBlrFY0gHuAzhR9s7EuV7668bG8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D4b6CsumzVeOPvNfvGYlJ8rzorarfOoEduq/6qukzQNjWlBa79s7KEKfnjoT6mkk4OQzBjhFW+sPcNyzViAAN+C8t3+Qy8hoIXIcIvui9sdTRzyEnue+l72htn/yGCKP5WV4Kl7I+7Mruzk6A9iQaivZi3cUahU0yklGfJ6H5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sr93ppCz; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sr93ppCz"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2354ba59eb6so3812615ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750291782; x=1750896582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpC0/56QK9gvVcyMRwwJWQGp6+fL7PqTqoQ1qu/UYZU=;
        b=sr93ppCz+QPG8IiRwSFt7B+vlHV8uQTbrAQshffn1DlChdirbXpsfWfY4FNKHgAE0S
         JuIsuzWQrDJfeMWIIOLjXcjn3I3PuZBKWDm5M5WmV1q7jREodffDZnchbiweRDKOMCHe
         1atV+3CfQ1szJ0AgVhBZHF+e0tZESMNt+G4w5C3dy+caMWQ9rCAjlXVFBV9cVvg+yUeH
         P5/PfiONXJqLHXIo8kdNpWJD8m3p2Mo9iPe9tA5axLlTLXO0Fa0HqqCPtjuALyJLDwvO
         oCBeNqoBYEviykJc6hDakSLWx3chtv0uLcHWqYxZoKhrLAEkxNLY/zdP79FE/LYKnveg
         3r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750291782; x=1750896582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpC0/56QK9gvVcyMRwwJWQGp6+fL7PqTqoQ1qu/UYZU=;
        b=aRe2WBcy3hHB88WAucW6S2pKXmNPQtI5LZ9YLkObPCrJeW9KC5oDfXCLehHAMlAzRo
         fS4hlhAIJIDPj2oF4VTR/oOaJ73DPpG1qCNZu4NjAUVzfL7aPvQRae83rit7fRMJIEi+
         2XI7wEIWN7Rg+DtIsnNZZYnK1Sx040xitVf5VFjMYhAIEfd7Z1oR0zzWFHlsygcddjSu
         OFbOG728g4Yun2hZ7KjmuHhZgbNZWBb3eWoVe7M447Wr9JtPuhovp2cfjRLKaNh23/5d
         /QCZVuSdc88UaK7OJ3/dY2dgRXCGY1UYeLfyg3jiCUcdtu7d0fgJ/HpoQE6Cv+Jrq5II
         h+1A==
X-Forwarded-Encrypted: i=1; AJvYcCWSghf6f+1aGNzuFsUcQeiwzqmPEOHW8Tqo9XUbip/nhkD4lti/aDvScID9HTy8LdX8MTP1/NO1pwgWRL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLa/t2HO7SoK8RRz7IPRPB5Xxt8WfyzbPZRVe/9itNawFn6h+k
	fzshfFCcowlJI/Qp7aafOqJticLBnxQftiHn3y/HB6FhK53znFD1R+Xb/PQFL6BVNik+BXGvHJj
	tNkqVLddoOw==
X-Google-Smtp-Source: AGHT+IHEEOaCcOMdAMBdQBtaBCFLjNH36AGNabBMUPOCub7dg5uABSx4DqEsASmj5lALImz6DptXxGXuNrcm
X-Received: from pgbx123.prod.google.com ([2002:a63:6381:0:b0:b2f:4c1b:e1a0])
 (user=pmalani job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1cf:b0:234:f4da:7eef
 with SMTP id d9443c01a7336-2366b1773c0mr311198265ad.52.1750291781704; Wed, 18
 Jun 2025 17:09:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:09:16 +0000
In-Reply-To: <20250619000925.415528-1-pmalani@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619000925.415528-1-pmalani@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619000925.415528-2-pmalani@google.com>
Subject: [PATCH v2 1/2] sched: Expose idle_cpu() to modules
From: Prashant Malani <pmalani@google.com>
To: Ben Segall <bsegall@google.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Prashant Malani <pmalani@google.com>
Content-Type: text/plain; charset="UTF-8"

idle_cpu() can be helpful in some drivers which can utilize it to make
performance optimizations based on CPU idle state; since these drivers
can be compiled as modules, that prevents them from using idle_cpu().

So, expose the function to be available to modules.

Signed-off-by: Prashant Malani <pmalani@google.com>
---

Patch first introduced in v2.

 kernel/sched/syscalls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 547c1f05b667..0fd5e2dafcf7 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -216,6 +216,7 @@ int idle_cpu(int cpu)
 
 	return 1;
 }
+EXPORT_SYMBOL_GPL(idle_cpu);
 
 /**
  * available_idle_cpu - is a given CPU idle for enqueuing work.
-- 
2.50.0.rc2.701.gf1e915cc24-goog

