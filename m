Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36D86250
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207356; cv=none; b=aEUKDP32scfZ1njJ7noWDrUqV8igqxwtnOe18xtTptINbTW20Qk0wQoHl77IMJmIP6RZUG9OMzcwR1pZiYz0A9ewQyW3SFO+KnQX/ArTuQc/Fa/JlwX0xA0rUTcR0YGv/xOsGhjX1NML7vpEmmI/vQbSRsqpL5LTykPwbX5/DQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207356; c=relaxed/simple;
	bh=TETE3Eh/Dj1Tk3Wh/9zM+y7XV0I+XwgFnUTTImzIU18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DS4o8bt48F81N5iat/dtCR6I5mPBveS6wfHQG6OM0Akix5i3bGa9S97qcA8U7iB+0Oz6Pw/p7meyvjXuyuQkmr18nmHMgBsdfW0H4mPnlRQR8lLpxlMtrnJ5RReMFu9qtGlQicAlkYC9U1W6pZk66tPmitYYgq1asSoB8FxrNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n7Akhnxa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n7Akhnxa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso1476610a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744207353; x=1744812153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1xd2t1eomzary+L3rYwJOnyFYbGDGFhAt0u2u27uHk=;
        b=n7Akhnxa669tjUdKRvpBJXpsgNjk8YrNDwTd6MnWnnJB1oeFRZZkuY4dBiHHDsd41g
         cNmA7Vry1DwdvCi568Vlw8XvAfWE24YGrn5K35I4pjLmVvQOJ1aQUiH89L0K2vvIIDZC
         gaBTAWKgPgM0EUGzIlnKPNTkDoqK2XuNH1FVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207353; x=1744812153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1xd2t1eomzary+L3rYwJOnyFYbGDGFhAt0u2u27uHk=;
        b=ZtlycENZkH1y36A64qWaYc3d61TS0Bei60uVHzkOF/HEqZrr7UAU+KsLhG7LrPe4Nh
         to2M9RmrLLG5YxFh+X/razYKjS/6AM9LtGmmKZ3qYcATu/N7BbL1K9SL6g5cm0FshJBY
         npyHjYyaV6rQ7vUUWtNe9hnJJz+q3XJaPGLXUjJxQbnkGnfsXrtcU5ZKdYFPMPXMNNT3
         3odqakEJAsLsrqOtH+zVIZcAOxwRXiS3vdd36MAiZ8x7X7DpB+ZWLs5KoGpQLEvE2zpf
         MJOi5bkqgp5c9W1EuiAA1ysyU99T/0uTjssedOfbvQ3DPerv0PN9EbUFk6yQVHU3WY0a
         glFw==
X-Forwarded-Encrypted: i=1; AJvYcCXc5tRbIKl4mK3aHHF81n2CXmtw/qFzuC6dSdxV25siwzeo2Iiqt+iPko05oF4Oyxq2eeMHGl1xQDgoGgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrL3j1ybUTwlQm8zUZc2r+FVZzXr8eN+MJfk/LESmwpK3rMG28
	msBdMTam3RawXBB+i9WcIJHeRwkJJLaTdfsNjhVaEmIgMWKYBTuKvWxzqYf4mg==
X-Gm-Gg: ASbGncuXf5z+hI7CJHO1AYyaEcuubOzIv/xNS8T0kui+CKzaDQN74A07K8jDaOyruuv
	KyqdIq5OOAj+nX/561najxfMJIHEfayHWaefilGpbnQXClFEXJsOKZUJNy3jO8YTXwx2n1dfEVF
	PAzWrfark7gpV13kgs+3+eeuwIN28mgXg561jlgEN1ZEx4Otg/Nrnr5bwq6g0JruGyu8yUS2E5Y
	LSQ/rNYnvtV/FGPmKePD5WSR96hZNtakaNM219mQaV0CU1VJ12s8vTXmhwaxzVs0idwp5R5Yir4
	kTG87hz63v/0N+QahlLe/wnq9ic3d63osD8MMzh5JFMLBtmzDCZ/0K2+GGhj5hqJ2l91J1I5tbN
	+b/lkK7K7ZalBqnpkcoTPcahnCRc/caf1Mw==
X-Google-Smtp-Source: AGHT+IEXhvqVZCCeqJaP0jLELT6/jru+CmtqO/xIOQWOOUkJMZl3YjpjtSTPDf/CJz1YHiks5EHchQ==
X-Received: by 2002:a17:907:97ca:b0:ac3:ef17:f6f0 with SMTP id a640c23a62f3a-aca9bfb0d37mr272271266b.5.1744207352564;
        Wed, 09 Apr 2025 07:02:32 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (185.155.90.34.bc.googleusercontent.com. [34.90.155.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm102657966b.55.2025.04.09.07.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:02:32 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 0/2] Fix thread synchronization issues
Date: Wed,  9 Apr 2025 14:02:19 +0000
Message-ID: <20250409140221.654892-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

 drivers/usb/typec/ucsi/displayport.c | 21 +++++++++-------
 drivers/usb/typec/ucsi/ucsi.c        | 36 ++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h        |  2 ++
 3 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

