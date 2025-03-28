Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7DA18E743
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743177211; cv=none; b=PxTxna4ks0fUVAcQcUjw+q/iV3aboCu5ogtilkyzpLbHp5zBCXUk5xfXWD2wb61O+Tiwca3JAQ5nPn5FuZWuZ3kPiuWg1jcnBeMcWH1sUCcEdz6eWVl8grdw/lykBPAVPO+2KaNbnh/OG0t0veA5i6l0DvvuVU7O9maLQXSiJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743177211; c=relaxed/simple;
	bh=eU2IFlVcUXhHGCn51zsa+IGEOnlAobgV8IKSyXgb6Jk=;
	h=Message-ID:Date:MIME-Version:Cc:From:Subject:To:Content-Type; b=MCHImmZTzOMXlTz+cu8VS7sslQO6x4nb9CtX7mHVhhqJrRhLLxn5Vijus/4yJmC3WeSytqtwwEIe4Yi5xgOyMkQo/Q6zT1Qdyg8xzic2AQBscIjmtEtRj9/iT6Y2+Z8L9nbl3BpyxDAcfBfFcV4piHGitVNOTQb2xaorVwpP4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bAYmg3OH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bAYmg3OH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso23853155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743177208; x=1743782008; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH26V306Jr52bnWIfYi5tdVx5/+BWzk4/60gsilP3xo=;
        b=bAYmg3OHBbr+ATINBDewj6EAtFdUxqY02eJl9iouhdGBZla1JrPNho/DARvx7V8dNf
         KtxLwisvWUsHwSZaSypHlppCKIXIq1MW0f2iKue/LDgU7P01agBWIsOjxtJsFQ+p+ORE
         tBMABjCuULZkQJ0PO2Lky8dfWR1vGUeSIst5ECtj//JAaZ8QWKU70nj93aA2OSTp6xNk
         mriHCdshwrkmV1BXpYFKK3cLYlajfrS/BtHrw/QZv0dpjlMWD6/E0hnkWtO44/fDro5Z
         lwCcYtZSUyRfAWdsViA/0y4wa5IIz+FMBJWoWv/hAI9KQEEgGdCZbwi1Vdvqqr1w9wm8
         +MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743177208; x=1743782008;
        h=content-transfer-encoding:to:subject:from:cc:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xH26V306Jr52bnWIfYi5tdVx5/+BWzk4/60gsilP3xo=;
        b=oIKHYF/UFJEWTUKNxyRezJVvU5kgB40VSUxn6P6z6qihCt4+olGdizIyjua1YiHHAL
         WjatkLJImF9bPilkIyfq36fmam3KMBjObTqRvDqJvxozw+SFb8j+hP86hsIkiXgot4N+
         w8j2JWH/cqrzd3qWN9RmxjmcNhcDJBL5+2Hth7Vx9WGKbWbluvDTInG8zEFnSV67ju9h
         T6KP+Mj4zHsJKjJpntMFSSqpZ3FmABydNQKyuwj0T3avc6yQBMrhHjzs3h3f+PXjVSQT
         g+bKmTvO7FcnnDHwyeT05KBoc0Ibt/ubtoDuIf5L0lU8ow7khx6ZWxZm3FgwMh7wHJmL
         9cGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatg/EuqRXgZLFbquk+7CH6j0/ro+UtXVIrueXeMf0CZrX2caRUbjliEHLIXnC0n2e2r+DjwdxIzr9etc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXUTVWSckvB2+Vy6a8AbwNY3lVwW63f+u5oF1WHf0KaUDo0FG
	Em71aQ5CZLz/PoT1+Xbg75Qxy8lZ6EwDHw9glpBx7596VQJr6NEf8AQBXUp3qXE=
X-Gm-Gg: ASbGnct9PcyEHC8OnT9if79DhObQsVSxZYI3gC+lkR5TvBDzDy1dnk3Ox4KpqTeEqAy
	K+CqILb+UzwIoW6EueGcdWf+7eFZrpaKTSUyGwX2dOrWp7Gy7TbTv8tSSvzIzoOP5XQkYHAGotB
	Kq2JcgRW78P/cpIftu8yMZ9gnorwNRj4nXkcL17IFJaRALr+33aWogqv7wbXTPPifzuHo3Huzp2
	aose2ibiBqOpgkhcZfAvtDcOCgKhFQfLlTsh9eZ1XGoJFlEnRDWtAu7MuTL4sI4ESAoVtq0h3d9
	Oi8yNdwsss9IYiLYzupnIk3YAxrpe1Q9WUzsEMArN7UFagss
X-Google-Smtp-Source: AGHT+IEcWvB4XH17YKBwR5G/3WuBzltILDk5EXHxrbMYebm02ENTAkVx4A1VRu6HgElE4j5IM048XQ==
X-Received: by 2002:a5d:584c:0:b0:398:9e96:e798 with SMTP id ffacd0b85a97d-39ad17415a2mr7631510f8f.13.1743177207814;
        Fri, 28 Mar 2025 08:53:27 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm2972156f8f.27.2025.03.28.08.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 08:53:27 -0700 (PDT)
Message-ID: <8aaaca23-ed2c-45d8-b9d2-7c8bbd4a27e5@suse.com>
Date: Fri, 28 Mar 2025 16:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Granados <joel.granados@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thorsten Blum <thorsten.blum@linux.dev>
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [GIT PULL] Modules changes for v6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/ tags/modules-6.15-rc1

for you to fetch changes up to 897c0b4e27135132dc5b348c1a3773d059668489:

  MAINTAINERS: Update the MODULE SUPPORT section (2025-03-28 15:08:20 +0100)

----------------------------------------------------------------
Modules changes for 6.15-rc1

- Use RCU instead of RCU-sched

  The mix of rcu_read_lock(), rcu_read_lock_sched() and preempt_disable()
  in the module code and its users has been replaced with just
  rcu_read_lock().

- The rest of changes are smaller fixes and updates.

The changes have been on linux-next for at least 2 weeks, with the RCU
cleanup present for 2 months. One performance problem was reported with the
RCU change when KASAN + lockdep were enabled, but it was effectively
addressed by the already merged ee57ab5a3212 ("locking/lockdep: Disable
KASAN instrumentation of lockdep.c").

----------------------------------------------------------------
Joel Granados (1):
      tests/module: nix-ify

Petr Pavlu (1):
      MAINTAINERS: Update the MODULE SUPPORT section

Sebastian Andrzej Siewior (27):
      module: Begin to move from RCU-sched to RCU.
      module: Use proper RCU assignment in add_kallsyms().
      module: Use RCU in find_kallsyms_symbol().
      module: Use RCU in module_get_kallsym().
      module: Use RCU in find_module_all().
      module: Use RCU in __find_kallsyms_symbol_value().
      module: Use RCU in module_kallsyms_on_each_symbol().
      module: Remove module_assert_mutex_or_preempt() from try_add_tainted_module().
      module: Use RCU in find_symbol().
      module: Use RCU in __is_module_percpu_address().
      module: Allow __module_address() to be called from RCU section.
      module: Use RCU in search_module_extables().
      module: Use RCU in all users of __module_address().
      module: Use RCU in all users of __module_text_address().
      ARM: module: Use RCU in all users of __module_text_address().
      arm64: module: Use RCU in all users of __module_text_address().
      LoongArch/orc: Use RCU in all users of __module_address().
      LoongArch: ftrace: Use RCU in all users of __module_text_address().
      powerpc/ftrace: Use RCU in all users of __module_text_address().
      cfi: Use RCU while invoking __module_address().
      x86: Use RCU in all users of __module_address().
      jump_label: Use RCU in all users of __module_address().
      jump_label: Use RCU in all users of __module_text_address().
      bpf: Use RCU in all users of __module_text_address().
      kprobes: Use RCU in all users of __module_text_address().
      static_call: Use RCU in all users of __module_text_address().
      bug: Use RCU instead RCU-sched to protect module_bug_list.

Thorsten Blum (3):
      params: Annotate struct module_param_attrs with __counted_by()
      module: Replace deprecated strncpy() with strscpy()
      module: Remove unnecessary size argument when calling strscpy()

 MAINTAINERS                              |   4 +-
 arch/arm/kernel/module-plts.c            |   4 +-
 arch/arm64/kernel/ftrace.c               |   7 +-
 arch/loongarch/kernel/ftrace_dyn.c       |   9 ++-
 arch/loongarch/kernel/unwind_orc.c       |   4 +-
 arch/powerpc/kernel/trace/ftrace.c       |   6 +-
 arch/powerpc/kernel/trace/ftrace_64_pg.c |   6 +-
 arch/x86/kernel/callthunks.c             |   3 +-
 arch/x86/kernel/unwind_orc.c             |   4 +-
 include/linux/kallsyms.h                 |   3 +-
 include/linux/module.h                   |   2 +-
 kernel/cfi.c                             |   5 +-
 kernel/jump_label.c                      |  31 +++++----
 kernel/kprobes.c                         |   2 +-
 kernel/livepatch/core.c                  |   4 +-
 kernel/module/internal.h                 |  11 ----
 kernel/module/kallsyms.c                 |  73 ++++++++-------------
 kernel/module/main.c                     | 109 +++++++++++--------------------
 kernel/module/tracking.c                 |   2 -
 kernel/module/tree_lookup.c              |   8 +--
 kernel/module/version.c                  |  14 ++--
 kernel/params.c                          |  29 ++++----
 kernel/static_call_inline.c              |  13 ++--
 kernel/trace/bpf_trace.c                 |  24 +++----
 kernel/trace/trace_kprobe.c              |   9 +--
 lib/bug.c                                |  22 +++----
 lib/tests/module/gen_test_kallsyms.sh    |   2 +-
 27 files changed, 160 insertions(+), 250 deletions(-)
