Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F218B475
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439153; cv=none; b=k700iVu6EIwgkeqetIA+0KjVB1Ia70EosE1kL4+ntkdXW226FMQVNtGFV9BsVKLMDOPvXpGUvS3keVJ7GamwREvtLoInEhsejZvzimNbfJNI3cnw5DbFDgx47eTHAHNzhkd+hJEcn230rh9I3v7fY+I+h76mrudWxa9Ehhd7E0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439153; c=relaxed/simple;
	bh=Xv+mdSuxde95QgyLMGtMjVr4KIkdT8E7hXUTabzHBSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bqHRUzhiomH8fve5oOPY/Dpa0yiWU3T5CwkkCtNKmYg1xFFuQ44P5k/a7wIB0B2SlOp7H1NVTgMiNeyq6GXvbDyV+P+YRCUxM5gtsbWciJkf1BDvrCG6GSys9kyjZ5IHjjKgBjhTxsP/MRtlPeSpfBtGQa53LECbZqScPPCF318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=cfsr93SM; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="cfsr93SM"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UI4u7H5JdZ1m3UI8uouzA; Sat, 12 Apr 2025 08:24:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439078;
	bh=jaDC2gQqqeZhqpywnDYK4njZ3ZRUz94TlsCDdPOKsVE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cfsr93SMulOME7S3cnJ/xmA/ZseVvIMrwvX/a/jo2yP5CstSmzon31Mc/coYLbLGI
	 q7LcJFDVcBy9DrrvC3BhCodzlwu9vi1HgSK650Tb5glgvHb6iHLrLWPLLzI0bqljuw
	 vaC0DMgwxZUVV6FOvPrWB4OwjyG4hkzrYPRD3hIacy0/XSJ+0JStogTKvaUXcsidCD
	 Twg45T/8UnEEIov1LSryMGfiJ1Z3NFSQ9jexp0ynzjLzRLdcwttt5sdWqpaunBxouh
	 sLvm+EpO25qU2STA4Lip+m8HRRSL2owkLGcybfcaIRrinRrGOyY4E1CDhFUDI2KPY4
	 0SLd6XBVYx75w==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:24:38 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] staging: gpib: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:21:52 -0700
Message-ID: <cover.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style as requested in the gpib TODO file.

Paul Retourné (16):
  staging: gpib: agilent_82357a: fixes multiline comments style
  staging: gpib: cb7210: fixes multiline comments style
  staging: gpib: common: fixes multiline comments style
  staging: gpib: eastwood: fixes multiline comments style
  staging: gpib: fmh_gpib: fixes multiline comments style
  staging: gpib: gpio: fixes multiline comments style
  staging: gpib: hp_82335: fixes multiline comments style
  staging: gpib: hp_82341: fixes multiline comments style
  staging: gpib: include: fixes multiline comments style
  staging: gpib: ines: fixes multiline comments style
  staging: gpib: lpvo_usb_gpib: fixes multiline comments style
  staging: gpib: nec7210: fixes multiline comments style
  staging: gpib: ni_usb: fixes multiline comments style
  staging: gpib: pc2: fixes multiline comments style
  staging: gpib: tms9914: fixes multiline comments style
  staging: gpib: tnt4882: fixes multiline comments style

 .../gpib/agilent_82357a/agilent_82357a.c      |  14 +-
 drivers/staging/gpib/cb7210/cb7210.c          |   9 +-
 drivers/staging/gpib/cb7210/cb7210.h          |  14 +-
 drivers/staging/gpib/common/gpib_os.c         |  47 ++++---
 drivers/staging/gpib/common/iblib.c           |  19 ++-
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  51 +++++---
 drivers/staging/gpib/eastwood/fluke_gpib.h    |  17 ++-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  66 ++++++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |   6 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |   5 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  11 +-
 drivers/staging/gpib/include/gpib_types.h     |  81 ++++++++----
 .../staging/gpib/include/nec7210_registers.h  |   3 +-
 drivers/staging/gpib/include/tms9914.h        |   6 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  86 ++++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 123 +++++++++---------
 drivers/staging/gpib/nec7210/nec7210.c        |  23 ++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  40 ++++--
 drivers/staging/gpib/ni_usb/ni_usb_gpib.h     |  32 +++--
 drivers/staging/gpib/pc2/pc2_gpib.c           |   5 +-
 drivers/staging/gpib/tms9914/tms9914.c        |   9 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  32 +++--
 22 files changed, 421 insertions(+), 278 deletions(-)

-- 
2.49.0

