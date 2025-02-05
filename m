Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3BE207E0E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783982; cv=none; b=GGQhyc16cS9xodtoP2tvHSF4iOqT3W0mfrPQkaOY1U5n3AWmVBeNsw4RHY/tBUIrI4C72ks1yHBPSslNvy4OFEnNPsEO1fS2aS8bZEGcVEgqGjgl/AeM/V9eRIQvXJx2GLdmna0Jp0xGCdohgMisKgW7S1XNajhKC9RNsUbCfWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783982; c=relaxed/simple;
	bh=p9IfmBkML/+h4zidU1zNnqGBFIPCMEc1S9CanTk6ZQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to1UGrNpoCRdeDE8q431fjbcUTBqW04W4G40PdFdCClL//tCYua7Q6Pu83NGEyKfOsZvDJRl72T8SZkjMAWTmriyNALOXgaNX3Ee2HtQWE7vMpeUTJeW1zZQFywkEUOsBrXXIdnLQ2bRJwW5qxa1/RiALgpkokgMidu1e1ojVuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJCReSFD; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJCReSFD"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab70043cd05so39312066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738783979; x=1739388779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/diWf3Ne11QncyO86if84fhx289XRB6QA3E34QVttl8=;
        b=bJCReSFD/38Kzhcd6GjwX5rx2FgJkUT/N/9/VWawEmhdtqIKi6Q6HvPGd+wsmaKIUB
         F+Df8DuqKFwupRkfi9n1qVG7Ky6JlzulGwsZnXKLiRefxiVmyOtXnVxjGokE5Q5NVCBn
         Thi6uvL5/VHsL+VKU8SJBg1BFH8sJ+ffrD0siIYyp9g+4XGYLlO05aauO0/W9A/p6InT
         f8EqEY8PMcOzjX6sLMmsFDQ/H7uvkbNn/kLcYy6I9cAgoE5mApgiJKLo7fdW2lHlIsPx
         zPkgY8ZXgXM4I+ftY55ItvQqFvbhcZPB+FAw3gaVWwBXWEyZ5EWaU5fqZhiag/Sie9fo
         8ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783979; x=1739388779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/diWf3Ne11QncyO86if84fhx289XRB6QA3E34QVttl8=;
        b=TahuraJmQkkweR7PHEQ2TYUFFCfEhZ0BJqpfsP6UN8/4BGIQRU9O/rlefbt1EyiPYl
         MarC4wXy1G+ABCcEH5nDwlFkn0O6NymFiA3YxT2lfvolZEXoK+wtP1gMppOPrebJJ4Zs
         +iFrULSQ7qajwnlBvTqok9xQBc7GZds+w0aY6TS76vrm+9Ao0sz9bVbtR5pO7WWFPQ/I
         apfvi+WRG1MHuZuwnO/CVEVgvNcFDMS1/7yNhKU6T7Aepyyo3T//75NgCGmsXgo16ree
         Ozlt62uwcleKVaBIsgU1uHTg487yj6nFM9GnsIX8q7Bpprzg1uNxNLMAvH2l4qdoO5Ul
         nf0A==
X-Forwarded-Encrypted: i=1; AJvYcCUytPvPDW/Vnz3v03/nTKP553IXGwasAo6ZBpLX+PCtL4pTF/4luHBzFzRwfzBy22PNpf6luReLSiYFtyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBHV1KMsZgFgW+q9ZTTtZVqd/ClvMQo2s9lp7nvknu8vt0iBf
	0fIsC+ARFcSS6k0CQW/yDfvj9oe46RSPnlEHcoxnLhmQbjl5s5yF
X-Gm-Gg: ASbGncst8PDr5V+77zeSRQh73TA1e320RGPiwSlMNPhAxhccJIyoJBpO35NqVIWz0fJ
	2iJt11ruJRhUIftnSRqRoonZNVPfVt7VmfSCACCgNTUjJNsab9k2wsGc0Yu5k8yPR2saYaj4JGp
	pa8F9not+8lJlkyk0/cIbDN78h8AWpmIooovgnT6f9y23ohxSLCJ/7uB+xXVQawIIDRnbaTAbZI
	GxJ2tesV0abD5jSgf+hKTi3p34TtQWiHSY/jONLg8VdtTdXGOodn3ZpWJtcRWBgI6mjXuQlhXhz
	NjZJUxc8x99/ffIz5S0XSO2BJuTr8l8=
X-Google-Smtp-Source: AGHT+IGm1LrNQ1WxECz8EmcH8PaJJZS4GvDFkkEhiET/QnLWNJ27G8bMpK15OATOj4JQaKrV/yFOVw==
X-Received: by 2002:a17:907:3da6:b0:ab3:8b1:12aa with SMTP id a640c23a62f3a-ab75e24a877mr469553566b.8.1738783978658;
        Wed, 05 Feb 2025 11:32:58 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06e5sm1167625566b.63.2025.02.05.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:32:58 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v4 2/5] exit: hoist get_pid() in release_task() outside of tasklist_lock
Date: Wed,  5 Feb 2025 20:32:18 +0100
Message-ID: <20250205193221.402150-3-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205193221.402150-1-mjguzik@gmail.com>
References: <20250205193221.402150-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reduces hold time as get_pid() contains an atomic

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index c79b41509cd3..b5c0cbc6bdfb 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -248,9 +248,10 @@ void release_task(struct task_struct *p)
 
 	cgroup_release(p);
 
+	thread_pid = get_pid(p->thread_pid);
+
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
-	thread_pid = get_pid(p->thread_pid);
 	__exit_signal(p);
 
 	/*
-- 
2.43.0

