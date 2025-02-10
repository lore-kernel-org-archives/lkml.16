Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625A204860
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200379; cv=none; b=olDdAW3goDEN1IErOzynsEAEDvxbDG7fMDm6PIkh0C5ni6r7yKFMa/zNggIFXZ4gUD9oM8cy1OQp5M6CxW+YcUFLhobpIZNvWk4Ky8JPhPeykG+vb/h2A4G2G5IzNOhB3iUMkrWx8LhlVHBvtASPDIlqx6eM1EHIr9RkZfBv3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200379; c=relaxed/simple;
	bh=Do0H0cxpcbgv7snc7/zxpc0UAqgTdXWl2YEFyV50OgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JJqSKUYkQxgsd1SuA7iVSBl+3iOjDQH3YELfQ8LklBB57pmPSFMkM6yCs9c0GK4BGun93ELKbiZ+ihLb6q6EuOIfF1put60qPK/tLIgxch7m3/ldmFYHAfakEkLR1EiYucFpew2OrKAYUFQpFr8s9epqOdE5dLLkKA8ga0wTTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PQtmH1nF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PQtmH1nF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5955307a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739200374; x=1739805174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4wKGfGTnsXTtvaKeBweQpHfiqMKnwO7EBbd/dYuuZM=;
        b=PQtmH1nF2F08/w2ZLHSoGYGPY3frlPkStJNcHSHt8g032kQCLcjRJd+htXyocC7QSW
         Ib0QKkf2CRDcc0DQRSsvZYnsxolgjSESnnVnb3Fvm8/8zqQzixFP30RgCL6VdevW5ioX
         Bdc2RruROcRWqqzidT3dzFuvxiDsyTfTsY7kS2aG4dJtASX5dxgV34HfTHye3cLKktNH
         5LF1qhBO1leJ/c3G4ls01HL70c6xxYoukjdMPgJz9ZdVAp0y1S7Rq3nXToX2klNqc9X1
         My3qIbI4hLwzD/1yshcl1/YHOoZ2VfCkZOGjp4BwoO5PRiqZ7l00pHWwyf366y06l2P9
         ruRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200374; x=1739805174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4wKGfGTnsXTtvaKeBweQpHfiqMKnwO7EBbd/dYuuZM=;
        b=P0lpCTJ+qLGlUZXbeVmVDlj/jWhe3xjXMGKvccStdDF83hcaeMbUd8agYVpJ70+g7T
         U6VFyQdAB+S4aNBrTIMGkdVfIiRBAZEm7DIMCT7DJJcEZL4V3AdNKgu1pky6TwR2F21A
         RO7G1C/+8fLmZOHZ+0rh0/ZMmsIBR4X37bJ0XEuRcbEmz1pGnbSWvFr4OSaymqP64rhC
         kUfgFMsuv8Kzh1F0K/2Z+UFuygIevAvvOYRqNAOxJpd1mWC+TIQrlY0GaAZ/7u55dH7Z
         MEe7dU0pvprHvJ+tAC8sODXBahxzgZvmZ5N8yWBLwibTpg9uirSbeUdwHTEb/ONRpt2m
         FD9w==
X-Forwarded-Encrypted: i=1; AJvYcCVE5uTv8aQCzpa3oSZpK6vC8w0WB5K+ip6oUzHWGe+Pq+aa9hi4FmTzHysmfXf5rD7O7GyBVlefHGWMzEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBlITgIcXnVqVwAgcAiZp6cfXIbBFUjmbt4wkpjPPDgACNuL5
	iUYubmXbqkpTRj+myEAearP3k9wskRbwa+/caVRUyHp9FI6TMKzSWwjdDdQuhT4=
X-Gm-Gg: ASbGncux7hW9biYhx1CGFq6gCFW38Cbu+gvYi/Lzy7IMfKsMB5dwvlSe9tL4CWu0N4x
	7t4FSUWuDo09W0LeX5Z/Hz2i3/7XPyPag6Cnp+XbPkQDMGZYW4WJnjq6lUay+8UVR1/C1kwY1bQ
	CTDJNd9NRGpSxwfmsbkmIrbITudFnN2woRoeFeEdRSOxhWPhNAQNad18vastkvvBjGzYgLOwh2U
	4u8XEgzIOSxgI9mEfHZ/+hRjNXIzX6PMGdBwOe2fXdIcpoywX5+od9evr9G3zK6MPOkqBAr3dYD
	yvB3na4UnsHBTqjvMg==
X-Google-Smtp-Source: AGHT+IEK70Eq5qB/82U2DF9U8xS5b4ZB61X1lgZd7HvA4AyJf7apGUEqkW/Plc8FI5WzSe9hQgSQUQ==
X-Received: by 2002:a17:906:9c8d:b0:ab3:9923:ef46 with SMTP id a640c23a62f3a-ab789aa088bmr1590639766b.11.1739200374380;
        Mon, 10 Feb 2025 07:12:54 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm895192866b.143.2025.02.10.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:12:54 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH 0/9] Add kernel cmdline option for rt_group_sched
Date: Mon, 10 Feb 2025 16:12:30 +0100
Message-ID: <20250210151239.50055-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Despite RT_GROUP_SCHED is only available on cgroup v1, there are still
some (v1-bound) users of this feature. General purpose distros (e.g.
[1][2][3][4]) cannot enable CONFIG_RT_GROUP_SCHED easily:
- since it prevents creation of RT tasks unless RT runtime is determined
  and distributed into cgroup tree,
- grouping of RT threads is not what is desired by default on such
  systems,
- it prevents use of cgroup v2 with RT tasks.

This changeset aims at deferring the decision whether to have
CONFIG_RT_GROUP_SCHED or not up until the boot time.
By default RT groups are available as originally but the user can
pass rt_group_sched=0 kernel cmdline parameter that disables the
grouping and behavior is like with !CONFIG_RT_GROUP_SCHED (with certain
runtime overhead).

The series is organized as follows:

1) generic ifdefs cleanup, no functional changes,
2) preparing root_task_group to be used in places that take shortcuts in
   the case of !CONFIG_RT_GROUP_SCHED,
3) boot cmdline option that controls cgroup (v1) attributes,
4) conditional bypass of non-root task groups,
5) checks and comments refresh.

The crux are patches:
  sched: Skip non-root task_groups with disabled RT_GROUP
  sched: Bypass bandwitdh checks with runtime disabled RT_GROUP_SCHED

Further notes:
- it is not sched_feat() flag because that can be flipped any time
- runtime disablement is not implemented as infinite per-cgroup RT limit
  since that'd still employ group scheduling which is unlike
  !CONFIG_RT_GROUP_SCHED
- there remain two variants of various functions for
  CONFIG_RT_GROUP_SCHED and !CONFIG_RT_GROUP_SCHED, those could be
  folded into one and runtime evaluated guards in the folded functions
  could be used (I haven't posted it yet due to unclear performance
  benefit)
- I noticed some lockdep issues over rt_runtime_lock but those are also
  in an unpatched kernel (and they seem to have been present since a
  long time with CONFIG_RT_GROUP_SCHED)

Changes from RFC (https://lore.kernel.org/r/20241216201305.19761-1-mkoutny@suse.com/):
- fix macro CONFIG_RT_GROUP_SCHED_DEFAULT_DISABLED invocation
- rebase on torvalds/master

[1] Debian (https://salsa.debian.org/kernel-team/linux/-/blob/debian/latest/debian/config/kernelarch-x86/config),
[2] ArchLinux (https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/main/config),
[3] Fedora (https://src.fedoraproject.org/rpms/kernel/blob/rawhide/f/kernel-x86_64-fedora.config)
[4] openSUSE TW (https://github.com/SUSE/kernel-source/blob/stable/config/x86_64/default)

Michal Koutný (9):
  sched: Convert CONFIG_RT_GROUP_SCHED macros to code conditions
  sched: Remove unneeed macro wrap
  sched: Always initialize rt_rq's task_group
  sched: Add commadline option for RT_GROUP_SCHED toggling
  sched: Skip non-root task_groups with disabled RT_GROUP_SCHED
  sched: Bypass bandwitdh checks with runtime disabled RT_GROUP_SCHED
  sched: Do not construct nor expose RT_GROUP_SCHED structures if
    disabled
  sched: Add RT_GROUP WARN checks for non-root task_groups
  sched: Add annotations to RT_GROUP_SCHED fields

 .../admin-guide/kernel-parameters.txt         |  5 ++
 init/Kconfig                                  | 11 +++
 kernel/sched/core.c                           | 69 +++++++++++++++----
 kernel/sched/rt.c                             | 51 +++++++++-----
 kernel/sched/sched.h                          | 34 +++++++--
 kernel/sched/syscalls.c                       |  5 +-
 6 files changed, 137 insertions(+), 38 deletions(-)


base-commit: 69e858e0b8b2ea07759e995aa383e8780d9d140c
-- 
2.48.1

