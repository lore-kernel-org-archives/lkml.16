Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 02A9C1A072C;
	Thu, 24 Apr 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506120; cv=none; b=Nshexuo6IfKKd7tetQYfp36nKmitMvOW2giEbVTAaVWsMY7vUnkG0AM9teEwsVWIfZG4pgK61Z5Au8oM0w2lMI9zpHjO7XgdeHzW3D6dbO5mEf9rnvq6RCxfLMUJ3j2Rl3xB4PoB0/MehQhinDzS5BiBdgtHn/FSeaJbNHBE3g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506120; c=relaxed/simple;
	bh=4DkczXPMK64EGyk/pN1a7Io8F/dwnFISplSGz9lmrf0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NoPBUtRTo3EQjVuPsZ9wp4RaTh9cYPUW0IjW/zOzr9t+uGlBvEAZbO1N7vjOBg2FGhYID8E8CRR9qDPe2XtdXU0nHu/q0YYPyM/EMsJcrjvtrnNnX+lop0otBUeOGEjdzU2eSZUyrWh0Q93dKpJnNvDVb/ZO8xgfgy7DAscf10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPA id 3B2E160497EAF;
	Thu, 24 Apr 2025 22:48:24 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	john.stultz@linaro.org
Cc: Su Hui <suhui@nfschina.com>,
	eahariha@linux.microsoft.com,
	anna-maria@linutronix.de,
	luiz.von.dentz@intel.com,
	geert@linux-m68k.org,
	ojeda@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 0/3] time: some cleanup for jiffies and alarmtimer
Date: Thu, 24 Apr 2025 22:48:17 +0800
Message-Id: <20250424144819.24884-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some small cleanup for jiffies.c and alarmtimer.c.
Compile test only.

Su Hui (3):
  time/jiffies: change register_refined_jiffies() to void __init
  alarmtimer: remove dead return value in clock2alarm()
  alarmtimer: switch spin_{lock,unlock}_irqsave() to guard()

 include/linux/jiffies.h  |  2 +-
 kernel/time/alarmtimer.c | 90 ++++++++++++++++++----------------------
 kernel/time/jiffies.c    |  5 +--
 3 files changed, 42 insertions(+), 55 deletions(-)

-- 
2.30.2

