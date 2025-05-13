Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F228DF0E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155835; cv=none; b=Fqjs3n/FqNZurdz+3YO14yEqpMrAZOW+UC6V07OvPTCezLHF4+wqMEpGdAoKlxrv7K5+aK7njgvL1k1EfjBe0Aj8T+4CECJRsMLbUQhG1O4UzuVB/FBhfHPEGdm5gjhc4kNXUX8s9DB9PZkEd7I/srIobbAv9d4/DN+wS0c+q5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155835; c=relaxed/simple;
	bh=yktsR3ZeQzzSy0jShweyCKjgs6hQnMgeyiIZVyv/Pp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AU80LbfzbeUsrDJSBumSbVZM/6OvhIzZft1GXAbgXTd/vOUPm07P8lJdeZgsqYm5DYYXetKL3PKf5RTptqve+RC/9p9Qaz6rWnomMHU8Lk+mwjYLkFR+9oJcEuiR4JtbjZAIqJv0e+r9WsN/JSigR4rnMHudtQfXP/ugGRdh0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev; spf=pass smtp.mailfrom=jakerice.dev; dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b=2ZOk3Adk; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b="2ZOk3Adk"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so74228996d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jakerice-dev.20230601.gappssmtp.com; s=20230601; t=1747155831; x=1747760631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VPC8QqNcp612VN/6Z55kijxODKphGub2fhmJjGDqhU=;
        b=2ZOk3Adk0BB2nv1JE/hMeEdaqZIYiCO8NRvrc31VVTOm53L5Gf0/VXfadYrddmvmX3
         2hYHBiXSBfvWg0CzDT1/3kTAxD6Y2kn4ZCB34PcNEtjVYBYlhhbmaEBf70MY27Ui4FnL
         6L+qZyBqPmhLhOeJNqw9WxyeVp4PrfiG6NNlzowOMx8nbLW0yzt8yPywK3n49zI3WQwT
         0HTJMyXal1GFliW9BKPqJuYEzbgYvKTfAJnsG+/y4qOT0cq4NtsR8yDYbxoe4gZAGsip
         9+PAVV+5Ua7izf9MrHM9IBT749sXT4EqmwluolHpRMzBP1divkyxVVykJRekDsG+/H3X
         hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155831; x=1747760631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VPC8QqNcp612VN/6Z55kijxODKphGub2fhmJjGDqhU=;
        b=ry9GhiHD581Q40wIaK8dNFfNTIBXSl54CLfS8RrBg7QuyJICbSTQTqk5euW1c86F0O
         oVjmW9L+ErOruag9JANOhxwKrTLGGtSQMlqxe9KXUI29qCTPpeQ4UIeZopLj8Mz0xOdl
         QgtMzdw6qcFQ1oaIA40sVt/awRDSelB7bCoemLyl3EYIjj/4dc8808QjA6XAm2SCyw7W
         ybAbeL4SfpTi9QO+HrCazztpPXJa39tNBmIcZEmOajxojwIhnYEHtl1LXyoKYjG6du1V
         g930su5SdnzLII1dzCqnTQ/LT5qeJQGk2jtHkyBjte7U6T16ykL/lWroqHsOR2IAdZsC
         NmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyIJ8lL3Cl9BX/F0QO4RiQp0ggQfawJmQSZObvDQDQuwF2aGvJPyAaYK6wEu9rQdYTSgh1EMcFWlPhkVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ayzxE4FA6JAwg5raZdcBTpq5BPs0aBF8yf4oPc6EYX5TDuyo
	h5CKmdLEen6wO0VunmfORi0n1nsfbDx1xG6kej6Mj6+y6nFuWsSbVngglmmOmCwlSaN0NZSSsLr
	E4ik=
X-Gm-Gg: ASbGnctYQyx5EG/O8upHQ3EhDAwbnkYm7Nu5iACUq3BuuTt3q9OtWMmYvmd5LE+P83l
	FYuGshSGFo2w88kGp/s4eetHl9g4gI93l/7t5DDhkkoj8lDVQBfUv2c9nScEJvxEb4yHMiAb7ET
	Akjwo1G08ow+VkZXCmfUqOFcvl/2NH59yygiDqb1ymWa9x6iWVEbGuEHrSHpBPM7Zf67b23Btv7
	Q3JY4dm1QoQUUnSPvIoEKseFr+0tax354KVkGAxeUdqTWvku3+zJBF0agrnQ//jI1MNKUNrQjCz
	55+B49NCLXyOht5k1VpeEF8eLNvAI3YowdFaZq5MRTGZJYXWOB+SmHoDqokrwv3ZcEaHEGqHhcG
	rJZATo6RuwYIf6krMqa1k
X-Google-Smtp-Source: AGHT+IG/K8JwYBp71eM6Hr+wn3dcg6NSAj+pupBSTJ1J/GCkVfllbnxHOGonjnYK2DrDme958SMxqg==
X-Received: by 2002:a05:6214:300e:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6f896ea8bfemr2020826d6.36.1747155830835;
        Tue, 13 May 2025 10:03:50 -0700 (PDT)
Received: from localhost (c-67-162-238-230.hsd1.md.comcast.net. [67.162.238.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a4721dsm68488106d6.93.2025.05.13.10.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 10:03:50 -0700 (PDT)
From: Jake Rice <jake@jakerice.dev>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: tj@kernel.org,
	arighi@nvidia.com,
	changwoo@igalia.com,
	ggherdovich@suse.com,
	me@mostlynerdless.de,
	ake@jakerice.dev,
	abovard@linux.ibm.com,
	devaanshk840@gmail.com,
	cengiz@kernel.wtf,
	linux-kernel@vger.kernel.org,
	Jake Rice <jake@jakerice.dev>
Subject: [PATCH] Documentation: scheduler: Changed lowercase acronyms to uppercase
Date: Tue, 13 May 2025 13:03:44 -0400
Message-Id: <20250513170344.3621-1-jake@jakerice.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Everywhere else in this doc, the dispatch queue acronym (DSQ) is
uppercase. There were a couple places where the acronym was written in
lowercase. I changed them to uppercase to make it homogeneous.

Signed-off-by: Jake Rice <jake@jakerice.dev>
---
 Documentation/scheduler/sched-ext.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index 0b2654e2164b..878762b6379d 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -197,8 +197,8 @@ Dispatch Queues
 To match the impedance between the scheduler core and the BPF scheduler,
 sched_ext uses DSQs (dispatch queues) which can operate as both a FIFO and a
 priority queue. By default, there is one global FIFO (``SCX_DSQ_GLOBAL``),
-and one local dsq per CPU (``SCX_DSQ_LOCAL``). The BPF scheduler can manage
-an arbitrary number of dsq's using ``scx_bpf_create_dsq()`` and
+and one local DSQ per CPU (``SCX_DSQ_LOCAL``). The BPF scheduler can manage
+an arbitrary number of DSQs using ``scx_bpf_create_dsq()`` and
 ``scx_bpf_destroy_dsq()``.
 
 A CPU always executes a task from its local DSQ. A task is "inserted" into a
-- 
2.34.1

