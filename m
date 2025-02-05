Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F022DFAF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752933; cv=none; b=p7YW6CSDkjSkP73yqSXcTkGOiL/DVfvXvGkb/dfXsxGpNmZS2bMbFwnw+0dBA/ZCFwL68UDSRGtY/pp4Uk0KvAlJWOKXqQ0GDoIoR8J9sYGcsTt/q4AfTlPm8An+xL++Fp1Vabd1z5ZUMmBt944g+U/RtxyqxPiNBXygH+nLQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752933; c=relaxed/simple;
	bh=QS/KOr2KKixvHFIF0oYhVhXNWXV5cJkAvN6klHAB1f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pLRkCZMSti/Fj/FVjGTBXa1WDr0ANY0GRkF/Wj97Gl7CDjYa/pugzElQ8vEshV55BoKrXJBjsBnYhvUSjIx3sghfIuA2c84Nkcv0LLQ3yL1j3yBx7j5rk33VBytMvsxU+7UleKHRdqlgWFliwwEunI3nRK+Z80qRb04Fix+Su38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rLeI24iN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G0cNKxJz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rLeI24iN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G0cNKxJz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4LVO+yLgGfArkVhpCsxSSnhqiMbhZBebwQpGNkfPxWg=;
	b=rLeI24iNWFCDzT7eEfBz5BQyyA8WnGhX8fB3W7KqU/O3EA4RIQuyv5KsTQXgXiK+5sY6YP
	pDN7qsgwLJorwjBJi+GjZvnAPPEWzoER0aD0CJOuDOSEnfY2Tb2Odi8vA3E8JdhQW6r9P+
	3irMHzq8JFJtzrddZFUGPGiMiiDJQFeOUyHMzbRcMWskRXTmbX5dLZRMJxfolmIp5E2gsy
	WzqlVx6vj6nOXAzuzaVjqgZIsSyHTABc/HRsKlMv//RfXuX69M+FPlh78khwKKVuEUGwII
	3o6MntPaubetkTorvSfIsjipQ3ko46nGAbeAEooNcjD/VAz/J0weQa2+J32lEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4LVO+yLgGfArkVhpCsxSSnhqiMbhZBebwQpGNkfPxWg=;
	b=G0cNKxJzSPoogyKOOTNI8M1p0H7yNvt3iwmbt6vMaFNqIeCMOMYc3lf8+6bS6eBUdaHSdT
	o3XjAOsrQKDZGcAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Kalle Valo <kvalo@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 00/12] Consolidate hrtimer initialization - Part 5
Date: Wed,  5 Feb 2025 11:55:09 +0100
Message-Id: <cover.1738746927.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

All previous users of hrtimer_init() have been converted to use hrtimer_set=
up()
in the previous series:

  https://lore.kernel.org/lkml/cover.1738746821.git.namcao@linutronix.de
  https://lore.kernel.org/lkml/cover.1738746872.git.namcao@linutronix.de
  https://lore.kernel.org/lkml/cover.1738746904.git.namcao@linutronix.de


This series does the final cleanup:

  - Delete hrtimer_init()
  - Convert users who touch hrtimer::function to use hrtimer_update_functio=
n().
    Make hrtimer::function private afterward.
  - Rename the remaining *hrtimer_init*() to *hrtimer_setup*() to keep the
    names consistent

v1 -> v2 https://lore.kernel.org/lkml/cover.1729865740.git.namcao@linutroni=
x.de
  - rebaes onto v6.14-rc1
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.rst                |  4 +-
 .../net/wireless/ralink/rt2x00/rt2800mmio.c   |  2 +-
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |  2 +-
 drivers/tty/serial/xilinx_uartps.c            |  4 +-
 include/linux/hrtimer.h                       |  4 +-
 include/linux/hrtimer_types.h                 |  4 +-
 include/trace/events/timer.h                  |  8 +--
 io_uring/io_uring.c                           |  2 +-
 kernel/time/hrtimer.c                         | 69 +++++--------------
 kernel/time/timer_list.c                      |  2 +-
 tools/perf/tests/shell/trace_btf_enum.sh      |  2 +-
 11 files changed, 35 insertions(+), 68 deletions(-)

--=20
2.39.5

