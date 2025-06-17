Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C3CA4B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190750; cv=none; b=nnF9JsgcMJ6MI1SOM1pm9+KYjTucej8bBgK+pah15nvfFBIAUCTVDrE8qUSyXSmbyaQh57TIY+34hvjnQ01mupif7h8FucT0+zbfy1oPCB6E4/cuOUAcfFLH5q6Yp+VsUfxK3lyfcbz11D7pL2rSdCnxgdHt/eyHcPIDXOyV2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190750; c=relaxed/simple;
	bh=qxrlP5wx3wm5ffqiQ/jHZk1W8SOknrUkEIcDQebObKc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Vs+IiQlK+wT+m36JKF9uqMxL43oug3UilENdFqaCfjCxj3i5gRNKKMhkwGkJjfSyEjvNacCa9FA6H1Imhh0lQQgJfcfYxMf/lVW+UIGkCYO0go5XUq9uWfm6RI7mHBYxiYfEZiuORhFmHo6GJIQOJS3VuBaPfFUDdlqD0FvuNtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjJadWSm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjJadWSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RlptmckFm3OqP+oSzwoFBzQgslgWEXABhcW4F5+Im4Q=;
	b=RjJadWSmBBZsvdWblxDLTL5fyHTcwmKggX/BIHpzpJN+JfmhGx4tIGzKHRRhGOVdsWE2nl
	8iYcOMQ5NGfdGL/uU51lygDb9+mekMAzls35yUEa9+o4ckjyLpBBudovA3z0SFT1qH5Ui5
	mPt8OnGLZauqyCvNfuISB0HUaiUKsOE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-61D-qG_LO2azkjCWVZYVWA-1; Tue, 17 Jun 2025 16:05:46 -0400
X-MC-Unique: 61D-qG_LO2azkjCWVZYVWA-1
X-Mimecast-MFC-AGG-ID: 61D-qG_LO2azkjCWVZYVWA_1750190745
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b40be4525so21160081fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190744; x=1750795544;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlptmckFm3OqP+oSzwoFBzQgslgWEXABhcW4F5+Im4Q=;
        b=HPlV+KeJCOuvbeDJQx4oBzAvW/+ZZuWvMwioLoREaCmH43k5nMPiXcEspaP3QGj8T/
         s9/sMu57QqtcQBqDRMOaI53Sy7pzSpiHQ5iSjG4gggj5sdb+QZscbvmHNDJp077guPM3
         Pf/hkIoj7Lh5gHP2VsCg+Xtj1TczuR6iwuZ7KL87zmKQItHPaDL6iGrGioisBfHboW65
         +YlKCGM4jQRmRI7HTd87l5JMdc6F4b35+OA3SVaTQkFsSQdyQUc4FWEZdtPRCUBMSK4q
         H7RwWI6TQN1yVKYHMfKMHhN6MpvK6Gy8Li8vqKReamwGtRJ9Hk+Yr4/Sc7WADnk+nLfa
         9f1g==
X-Gm-Message-State: AOJu0Yz9ZZV9CfLK5gdIpZsEWjDA+KNf6ZH561xDgt9pVcdFvd0GDAvn
	aISdZ1oRVf2sNZPyfKvGRf/Q+Aevzm863iXvIPEqv4Vrq7KERBa7RClvqpq3Ywj+9RBsd5W4aWQ
	5ZvhfPasnRxH/P0Hi90fXFK0hx/RzADO0dMy19bNJvEb0YV4e+h2clgjdqkg88opcYVG0qV7S+7
	w6EwZojlqsIMWnf59F2pHjwkiwOYl9JKJ/H3SL20BGqP806QGDkbk=
X-Gm-Gg: ASbGncvgY5CSJCI/wKCnH8moCaGTArp1ASwh7FpRxWpQtWz9yxE3s9Dx5jokgujYFyT
	VbyHtcSblo7Lqurkw04T9ZnhBBTkDmUu2TdaPNN7+qZXoF1ccQmTYht0A2bv36xuf+jCBg9Or3L
	om
X-Received: by 2002:a2e:a546:0:b0:32a:648e:7ee3 with SMTP id 38308e7fff4ca-32b4a6dbc53mr51983001fa.25.1750190744394;
        Tue, 17 Jun 2025 13:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjri2HblvmO9lJyZCGwHDbmMcwo6053CGagJL48df8Y1FKZSqhJ0vTHbqp1IKfUUx3LACfZchDU9AbjYbvm54=
X-Received: by 2002:a2e:a546:0:b0:32a:648e:7ee3 with SMTP id
 38308e7fff4ca-32b4a6dbc53mr51982931fa.25.1750190743858; Tue, 17 Jun 2025
 13:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jirka Hladky <jhladky@redhat.com>
Date: Tue, 17 Jun 2025 22:05:30 +0200
X-Gm-Features: AX0GCFtJIZV9BDx3wKDiaSFS31gx1BqxtU5KPeC5BqxT33JbBy0MfTYylJzVdEk
Message-ID: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
Subject: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL pointer dereference)
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I=E2=80=99ve encountered a reproducible kernel panic on 6.16-rc1 and 6.16-r=
c2
involving a NULL pointer dereference in `__migrate_swap_task()` during
CPU migration. This occurred on various AMD and Intel systems while
running a CPU-intensive workload (Linpack, Stress_ng - it's not
specific to a benchmark).

Full trace below:
---
BUG: kernel NULL pointer dereference, address: 00000000000004c8
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 4078b99067 P4D 4078b99067 PUD 0
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
6.16.0-0.rc2.24.eln149.x86_64 #1 PREEMPT(lazy)
Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
RIP: 0010:__migrate_swap_task+0x2f/0x170
Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> 8b
bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
PKRU: 55555554
Call Trace:
 <TASK>
 migrate_swap_stop+0xe8/0x190
 multi_cpu_stop+0xf3/0x130
 ? __pfx_multi_cpu_stop+0x10/0x10
 cpu_stopper_thread+0x97/0x140
 ? __pfx_smpboot_thread_fn+0x10/0x10
 smpboot_thread_fn+0xf3/0x220
 kthread+0xfc/0x240
 ? __pfx_kthread+0x10/0x10
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0xf0/0x110
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
---

**Kernel Version:**
6.16.0-0.rc2.24.eln149.x86_64 (Fedora rawhide)
https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2732950

**Reproducibility:**
Happened multiple times during routine CPU-intensive operations. It
happens with various benchmarks (Stress_ng, Linpack) after several
hours of performance testing. `migration/*` kernel threads hit a NULL
dereference in `__migrate_swap_task`.

**System Info:**
- Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
- BIOS: M07 09/03/2021
- Config: Based on Fedora=E2=80=99s debug kernel (`PREEMPT(lazy)`)

**Crash Cause (tentative):**
NULL dereference at offset `0x4c8` from a task struct pointer in
`__migrate_swap_task`. Possibly an uninitialized or freed
`task_struct` field.

Please let me know if you=E2=80=99d like me to test a patch or if you need
more details.

Thanks,
Jirka

