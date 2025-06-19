Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD6184F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750291772; cv=none; b=jeYlLLLJ4A45eQ/zYMyCYycdPNssBFXyuM0WrlvGshrGBDb8mcSDJyT7xTipDDp2UrZ9MS5+qxYNzd5vivdvemkVmlSS350pcloaJVEndPZc3zFcBDiaIH5uYQbY92P1K2DpCEcNA7K6b7y4uVJQRL3B6GP3oTWnyAe8O1km718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750291772; c=relaxed/simple;
	bh=g+WWwyExlFxOt7pdCc47liCfVvTztfDdp5uZ+qjboMk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MJdEHXeTWzDZYuBmpjFQN2xX9vGQpBJDyJHbBWEpw/H4GZIcIN6c3KTLBNTidQVJuz/mgWx8DCccnuxBDpgbjqau/vLOJ2L/pJ1T0TJ9OnM2iLfG4ZCGhJyPidT6kBRKLnuTqzQuQNiK9IaxxpIpNz94IXUDIrz8mo/kVP1WGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E9CXeI4o; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pmalani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E9CXeI4o"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so140582a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750291770; x=1750896570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HQLEtaqNyQ09Ph8eJlSlh7L289gxZdZA63yPXzOJTQ8=;
        b=E9CXeI4osH72yfwpl9lAuO0hQwKvQu6HexkcJ5HSwtBlSR/euDLYcq6NbGQ/8nkCMF
         k4x2YLiRCWiLjBocKLcXEYS6/Fk80Lo/7d4h/GC7fJFx6EN7U/wZOqBGcR00XAmkRn4l
         JNDUuy+z525ZiAzXMvqBbNLyRlMcuhjVs2bRQ9qJ2WM39QrxhFyT5ECZbdZloHzqYrjP
         Spr7jB9OSSStHOKT9AWEk338yQqq+de8uDGpQg2YDk+88DWl3N99OcGFAaUPJJPAUbfo
         tk81snbOlvarEsKNmT/B8iUiGVaxJaSSdfb37nV7MMVYhu0Zm9Wj9A3qwrM3xzc80eXL
         YXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750291770; x=1750896570;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQLEtaqNyQ09Ph8eJlSlh7L289gxZdZA63yPXzOJTQ8=;
        b=OYANn7yKHJVC+1FNbERDVLqA5VJz3Q7uTh3HBONtBnf1w//V72goltjPuvVB/iSU+s
         uhvebzYTelP29R2L8dO2yO1KnHX1VT3gi50uoW5olWV4S4Ih4bgjXq8y3nCm5ubHhyqO
         q7uAf6GhVwrXX2ZPc7WcPhfmw0e7oGYpqZB4MnNfCYROwNqoknUAWMuDEiyq8K08+dy9
         u2CwGEqXdYHad3mGiYyQITGIbGqnsweAz0zYb05x+YrYji3n2zYZtMMFT7y6MXji8IKU
         kqYA562vbHtDw37b4AH3urKEWemBdFJCd9mqcoCf3kemFAW5PSZnbK9SfMRqfTl2+R2R
         VJXw==
X-Forwarded-Encrypted: i=1; AJvYcCXzW1e6nOUnFMMMXosDnN+sfEn2YLR/mx4kpO40qjjdSzzbIG9nJ003GEfUbBPThQoWBUn0bdcH4+nJYm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGEw4wdoc3yzTgMs0OeY/twYvGq+4mdI0Fn35AY8MljJeWMTnS
	ZX8CoqRK0FjvXkrSjyJB8Yo/G3Mk3r0jyIoD//WxvdVUC8ZQtRbkR8aZC9YXBMVryPuD3TcVu+a
	Ix85UC04iAQ==
X-Google-Smtp-Source: AGHT+IEVPV22uL9FvDPeSwJL7aXmPGyFNVyn9NC6hjHk6PanbMIdcjq/wM1aPXRWX50pzKvhDPe3NM4t3h1h
X-Received: from pjbdy12.prod.google.com ([2002:a17:90b:6cc:b0:311:462d:cb60])
 (user=pmalani job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1ccc:b0:313:14b5:2538
 with SMTP id 98e67ed59e1d1-313f1dd9808mr28691317a91.35.1750291770387; Wed, 18
 Jun 2025 17:09:30 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:09:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619000925.415528-1-pmalani@google.com>
Subject: [PATCH v2 0/2] cpufreq: CPPC: idle cpu perf handling
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

This is a short series to address the unreliable feedback performance
counter values that are returned by the CPPC driver when the CPU is
idle.

The first patch exposes idle_cpu() to be accessible to modules, and the
second patch does the actual change of not reading the feedback counters
when we know that the CPU is idle.

v1(single patch): https://lore.kernel.org/all/20250614003601.1600784-1-pmalani@google.com/

Prashant Malani (2):
  sched: Expose idle_cpu() to modules
  cpufreq: CPPC: Dont read counters for idle CPUs

 drivers/cpufreq/cppc_cpufreq.c | 5 +++++
 kernel/sched/syscalls.c        | 1 +
 2 files changed, 6 insertions(+)

-- 
2.50.0.rc2.701.gf1e915cc24-goog

