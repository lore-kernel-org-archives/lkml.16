Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC93020F068
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786184; cv=none; b=rraBch0QhHHWq69WX8NWjQciL9AAwLNNTEZA+4J8kl1sZ70hV1pHqZGd4815HdrdlG8dNERiRADQgHkvWFqqanShNeSr/5XjQFiQ4DKcPwI1i21Gr0hhBAaBhIvoHJqWEcZmnF/5CRSRaiQumZ1aL6rTrD4fm4dMuZD5s+EG1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786184; c=relaxed/simple;
	bh=p9IfmBkML/+h4zidU1zNnqGBFIPCMEc1S9CanTk6ZQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SICuMzvq5afzuMT9oHIn4DXNLCs1/SYL6epXhywtc4tca9qkc/F2uGVsAuS2Ao0l9DxH53wSSlSBX7NAiyVW9B+WbZ28crbRrHVQqeJQ+jIO82EziJk+nQjFRDCAwCJkRkoyLHdxE9xO1WptMNG83McEsIyn2ZX+UYwSwaiBWog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgzr48WF; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgzr48WF"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso40084666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786181; x=1739390981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/diWf3Ne11QncyO86if84fhx289XRB6QA3E34QVttl8=;
        b=jgzr48WFy1Ig5uI40OCDmoBHvCELXRQF55dt018aCCMEco7cq6MDrIlRMgLVpzwmFX
         0zeToafHll2GIgleE9RGVmu4gzLOoSWipe639GyfYFcgkltOAuYOcQ/HbdvI8VvTbVdn
         2SJXxTWHjFQpZePSVaZ9TsnUDKzBZJty/YsISGZR5FcXB4sQw9DjB/h/WHCoEvGME4IY
         10g7n8+D/LQYzivQ/eobk8MFcSnqXvIB5hVFBJnWbpMlLHGgtwiu2eSj4mVAPA0tooui
         JSYz5b27gblYrw07jUvmE9ME+FhlBpPcJGgFICCdYtytLHBxDAqMalFM3vYZlPxurLfj
         UUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786181; x=1739390981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/diWf3Ne11QncyO86if84fhx289XRB6QA3E34QVttl8=;
        b=o8EW/4PL6xVmxuCckLWM3qPnVrc4hvyvd+4ZXobHJ8gGf3qmGHS1Wlqoiz1CT5d/No
         udlOJxmfq2NOkraitVfPKleq9aR03x4kxIRu4CQs79LyvBO/NhBY2yrckAygGLaisqav
         LRbFgLQD0RkMb4k2KPtBZvXrr97KVbmj0VLYpvwWKtuerXycAg8wO9dscG8R7wrCjxef
         VmtdsjAVLnsxN/ZzW199XRs9ocP8MSRfuEylkK/2xqGezx31iks9hQri1Dv4U4+CDW7d
         PTv2agmVk8NYps+xrMkeD8iXVPV/JZA/H9WgVXD8s3FCU6DUUE5CWItt26eYvFYuFTT+
         5Eeg==
X-Forwarded-Encrypted: i=1; AJvYcCUUxnZsemiQYs4LULZb30itzb394GNBmBfOOg0wmbfDZs+tFTfHOlhG/ViNH5gQS66cNuY9wTMnVtJo0R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgO6FhakwQkBSoBo6/UBKU8i4wog556bnZ4xY7QQo7avTaGQM8
	Gbqn03GnNkzK4pVHbrNkvqtbvQ1Gut3z2UZthxlO2LtrS/S+1VCD
X-Gm-Gg: ASbGncv6AzGe9J+n5uWP8jjX4l69NUz2dV3RItFIUZsyMHA5AsNtP1IT4IxjSnY/iCC
	McxjTM0FR3vpBRW2xccoBEwosj23g8GVrgbsyM4yQLR42Oaxy6l7G5ul1lJdTJtD1BuFJKcnooS
	2QD7LQlUOCEnjc/FclZFhuv6YNz80t05nJFYypd3ivr4ZQkltt1fvE1Hx0XHoz9qJBoA/Y+g9VO
	xvTWVvt7mc0vyM9wTlPv79uwsicRiY4/4eXUy/Fn4+ySWH1EAwECTXMJbkxb3xqLYT3YICn4xYN
	ZdLhmJPA/1PzHg7sKtRMqfk7t1BydgM=
X-Google-Smtp-Source: AGHT+IHhm2J6TejI3Q6Hmp1UNNqGIH6Qdf4lJY6zmYuaoxwWi9cVhTvNKwZHZvNjq8bgfHO1UeNWVQ==
X-Received: by 2002:a17:907:8692:b0:ab6:d547:da9b with SMTP id a640c23a62f3a-ab75e23c77amr411221966b.23.1738786180759;
        Wed, 05 Feb 2025 12:09:40 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:39 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 2/5] exit: hoist get_pid() in release_task() outside of tasklist_lock
Date: Wed,  5 Feb 2025 21:09:26 +0100
Message-ID: <20250205200929.406568-3-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205200929.406568-1-mjguzik@gmail.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
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

