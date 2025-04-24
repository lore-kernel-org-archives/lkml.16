Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6ED225A47
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484279; cv=none; b=apOQRF0ixZ82w9tQfUzcIR+Gfa+z7B5OW46Bxlo77sOGZtbVJdgT98Ko5Tvf5iJg/SyU+vQbw6KUkHUSVqyDGleibcluTuqXUa7uEbD2zBLF7mQE+fQcL1yt9MHy8IpEp7/pO/CISsq4Nitx9i83O6KbhxEy65SGMq1YssjjmzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484279; c=relaxed/simple;
	bh=+lgkbRSJ0iOtxtbXAXv2QUHccF5KvXTmCcVLkBvVWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQnid96iR1LKv1zOiBZfxgdkvbjfs9kz0yiv58LpT6V02tIVWVth0LKPZvlagriAQ7AZXeEvhSE3fMR6Y51l4th8v/BrVwVKjXpk+pQ122Qagdbzh73/KgTwIM6ZHm9FElLgGQpW18jiuO3bwb49z5hcMwkjDRKehSmKgWJgBhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PIcccUr4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PIcccUr4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1095144a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745484275; x=1746089075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQWfbR45iZucEp5TpNYKj0HRMs23v/ORSUAtRdcvJdY=;
        b=PIcccUr4WuJIii8m325QbeIfCG1KYwwZ6kKW2n1VnXAc1FaCOcXWs+bgPMhZD/jLMD
         T+HkwNEzyhgQzWfPIAFNtz2YZYxnmsPQPePEzZkbyXPtnxh9dFEhG+CCzkGfnEUrzgoz
         OvMdkSI2ECM6G0mB40kvKuI3vOMVWrBbLmSA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484275; x=1746089075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQWfbR45iZucEp5TpNYKj0HRMs23v/ORSUAtRdcvJdY=;
        b=YVZQLQTZg73djQcT9//EDPbchvo/dKmbTE45HwkyrJnrYX6HBR9ApSQIRrJLTWaRTO
         L8uANbKIpMIG3JNwtw6HaAcWDzC2tf49lrsqntASLeW+43yrulU6xks9wGJsjf4U0hsv
         oViJ0m/1bW7/p5w2W8BHCuPG0d2ik6meJfH5Y+OtOKZmZsxD5l1zhHme2vYXcdVFoBvc
         bhEHv2DyxVZvV7C9c4tzMA0O3VUEphLT3lAbFlHIXWsYfhKNvqCoSUKb2VY14aVzcxKW
         aIpmCjKuCQ2xuopjUN9AmhOwR0/od2L0z6Xd96o7Lv+g/XpvXE3AmUPNKB2vOkW+uZ2c
         O6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV3kSu3l9hVgc4x19l3cOH/LL/xbGZ8p0NA03qozW0ZBIiKFuTDei7qFVN/Rw4xDDQD79Hm+N1A8xA9D4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWL6n72WSe5+W12whgsq/DILhl+Ozs9+kakzq6nh+u0wsS/gSg
	QAq0O4kDjyFqR/CvUkfnfnB4NuGLx2k2qIcgOQr9SBE1lMiSGVwrtC3gnBXTZw==
X-Gm-Gg: ASbGnct9hSp3E7xrFjo/FKj6pY++ae0VDwMHYhEMBTt7BM25Bh162Ciir3f7GPjBqfV
	wNcuzmx7K7hD1qYs6oxYyxK0vBWDz0uJlbw07elOBaLzc/wC2UZGRoAjgiU+JrDhEP5EXiB4zkC
	BlNKlwEqwYDqHYHJ9rONGqcWJ2hmSbwmHvT4CUOdLAiofY00pfSYGMXTJWHr8YEgWR49dUeXcWe
	dbc/uuyykCDBIsXuglI08/SlXzlNdl9OmnOx2OpHqrHOPGF3yIoXVNio3YOuHjmp+hJX0Ni0Yzi
	/uCzen1W942l8SyQdDOqCRWdTsYSgm8UEpxQor66vpTv5Zpwo9jZo20MlsLmmLCoi/RDPu/eAE0
	h/UfUNGELaOO0adxkDdVAvpJBsa5QtnFVNw==
X-Google-Smtp-Source: AGHT+IH3VTo3+soWYDQ8rxAU3qcPAmzkeo64vgOFZZWTcEbYsASerEhk4Ug5ZhPthFWa+a4Wj1KzJg==
X-Received: by 2002:a17:907:1c1d:b0:abf:7636:3cab with SMTP id a640c23a62f3a-ace572a282fmr194791866b.29.1745484275431;
        Thu, 24 Apr 2025 01:44:35 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (100.246.90.34.bc.googleusercontent.com. [34.90.246.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c5eaf0sm69377466b.181.2025.04.24.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:44:34 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/2] Fix thread synchronization issues
Date: Thu, 24 Apr 2025 08:44:27 +0000
Message-ID: <20250424084429.3220757-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: ucsi_con_mutex_lock / ucsi_con_mutex_unlock functions are not longer
exported. Thanks to Heikki Krogerus for noticing it.

This patch series addresses deadlock issue and prevents a NULL pointer
access within the UCSI driver.

The first patch resolves a deadlock that occurs during partner device
removal. The deadlock scenario involves:
Thread 1: ucsi_handle_connector_change holding the connector mutex
(con->mutex) while waiting for dp_altmode_work() to complete
Thread 2: dp_altmode_work concurrently attempting to acquire the same mutex
Thread 3: ucsi_poll_worker is indirectly affected as it would be blocked
by the held mutex

The crash log:
 INFO: task kworker/u16:16:7254 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/u16:16  state:D stack:0 pid:7254  ppid:2 flags:0x00000208
 Workqueue: 16130000.spi:ec@0:typec ucsi_poll_worker [typec_ucsi]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_preempt_disabled+0x28/0x40
  __mutex_lock+0x390/0xac0
  __mutex_lock_slowpath+0x18/0x28
  mutex_lock+0x28/0x60
  ucsi_poll_worker+0x24/0x138 [typec_ucsi (HASH:5d4a 1)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20
 INFO: task kworker/2:0:25045 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/2:0     state:D stack:0 pid:25045 ppid:2 flags:0x00000208
 Workqueue: events dp_altmode_work [typec_displayport]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_preempt_disabled+0x28/0x40
  __mutex_lock+0x390/0xac0
  __mutex_lock_slowpath+0x18/0x28
  mutex_lock+0x28/0x60
  ucsi_displayport_enter+0x44/0x160 [typec_ucsi (HASH:5d4a 1)]
  typec_altmode_enter+0x110/0x120
  dp_altmode_work+0xe8/0x170 [typec_displayport (HASH:c690 2)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20
 INFO: task kworker/2:3:25952 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/2:3     state:D stack:0 pid:25952 ppid:2 flags:0x00000208
 Workqueue: events ucsi_handle_connector_change [typec_ucsi]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_timeout+0x44/0x1b8
  wait_for_common+0xe4/0x1d8
  wait_for_completion+0x1c/0x30
  __flush_work+0x22c/0x2a8
  __cancel_work_timer+0x130/0x1d8
  cancel_work_sync+0x18/0x30
  dp_altmode_remove+0x20/0x70 [typec_displayport (HASH:c690 2)]
  typec_remove+0x60/0x120
  device_release_driver_internal+0x164/0x258
  device_release_driver+0x1c/0x30
  bus_remove_device+0x140/0x160
  device_del+0x1c0/0x330
  device_unregister+0x1c/0x40
  typec_unregister_altmode+0x40/0x58
  ucsi_unregister_partner+0x90/0x170 [typec_ucsi (HASH:5d4a 1)]
  ucsi_handle_connector_change+0x184/0x468 [typec_ucsi (HASH:5d4a 1)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20

The second patch prevents a NULL pointer access that occurs if
ucsi_displayport_work is still accessing partner-related data after
the partner has been unregistered.

The crash log:
 BUG: kernel NULL pointer dereference, address: 0000000000000300
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 3 PID: 3413 Comm: kworker/3:3 Tainted: G     U 6.6.76-07480
 Hardware name: Google Brox/Brox, BIOS Google_Brox.16080.59.0 12/18/2024
 Workqueue: events ucsi_displayport_work [typec_ucsi]
 RIP: 0010:typec_altmode_vdm+0x8f/0x4d0 [typec]
 RSP: 0018:ffffa929c825fe28 EFLAGS: 00010246
 RAX: 0000000000000014 RBX: 0000000000000001 RCX: 43032ac4505ac800
 RDX: ffff9d8def8e77c0 RSI: ffff9d8def8db5c8 RDI: ffff9d8def8db5c8
 RBP: ffffa929c825fe50 R08: 0000000000001fff R09: ffffffff9385e1e0
 R10: 0000000000005ffd R11: 00000000ffffdfff R12: ffff9d8ab4b67c08
 R13: 0000000000000000 R14: 0000000000000000 R15: 00000000ff01a144
 FS:  0000000000000000(0000) GS:ffff9d8def8c0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000300 CR3: 0000000148438000 CR4: 0000000000750ee0
 PKRU: 55555554
 Call Trace:
  ? __die_body+0xae/0xb0
  ? page_fault_oops+0x381/0x3e0
  ? prb_read_valid+0x29/0x50
  ? exc_page_fault+0x4f/0xa0
  ? asm_exc_page_fault+0x22/0x30
  ? typec_altmode_vdm+0x8f/0x4d0 [typec (HASH:c6ec 5)]
  ? typec_altmode_vdm+0x87/0x4d0 [typec (HASH:c6ec 5)]
  ucsi_displayport_work+0x34/0x70 [typec_ucsi (HASH:698a 6)]
  worker_thread+0x386/0x930

Andrei Kuchynski (2):
  usb: typec: ucsi: displayport: Fix deadlock
  usb: typec: ucsi: displayport: Fix NULL pointer access

 drivers/usb/typec/ucsi/displayport.c | 21 ++++++++++-------
 drivers/usb/typec/ucsi/ucsi.c        | 34 ++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h        |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)

-- 
2.49.0.805.g082f7c87e0-goog

