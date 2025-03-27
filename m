Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420720E310
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073157; cv=none; b=m4fB6jAv9EIRKzlYO5xhOrQG7UPjOFBTad34zDNUJ0XKbQroTsDWwAbpFcb5t3iQztt4syd+qMKDVTQgzs/cWXdGN+mGCxrvAqBAsa6/VaIxTGmzfQCl7HtqsKaINBmFOkPcBnZyg2GBMnI+Z4QzW5fNSfurVcH2SnJT1bGmekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073157; c=relaxed/simple;
	bh=lwWCrR/B7oa/IFy0hg/5DLmuq94sNl7F4vnXqp7+MBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulomPVX7inuH51F3OE8UBi8Fj13bxAIU4BulFiysjDmYyetQ5d/D85iNxkJjeoovsWKHz5OeNPCnlyDDakcT0EQ3fITkTir2PnLxYrQ97B/1MgAqZ1XVrIIWx00VcV0+2KzFmr7DXj35rOmgHQbhDpdT7Nla9LuOO7KSfyCKZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a9QWp4XN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a9QWp4XN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so7712905e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743073154; x=1743677954; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvqX6X6Nw79zH+/DuMzJ8U1lMnhunqLpWAm4SYnoS9g=;
        b=a9QWp4XNrccKd72EhJ4rg2e0+nB+knQJTnTOJuYAHns2AlGJWe8zjH+SdHTjz92gpn
         0CL3zwW7yY0IgvJNX/PLhiMqKhQ9ZoaosMiiqwBEJxPOBwccVKc8zA92ZAhsNNDweRbj
         se2U6rA2U3vK6tcz0vMxlsqEPrM6Ptongulqd+akvZXcoWVbxVFNheWc7rBVAoSVnhmA
         vyFsy0iwf9fZblzJ70LBdak6wT4s2aDe+WkJqcQ9ZjLiAw3RuhvFWiiPqMMHiiMVD5lI
         iSTIOLaoixUb6hGMkE2sPjV5so6gAhu+EoYRbYhKn9SEUopbhokMxLeg5ZbAHKR7oPQe
         T62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743073154; x=1743677954;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KvqX6X6Nw79zH+/DuMzJ8U1lMnhunqLpWAm4SYnoS9g=;
        b=iyVEUpCqggP/jGSa/2/rn+vQXWNKwphMcnFsvOtdNK+IhvSYSlARci8Q6rZje06umY
         dn1b8INvBCK9Hz/bKCuWT9P/AmiO/1xCmSW0QF/ZxRK9ZXcsosXg+a5NaSKlc/tzR86K
         KZKlNw9FnKpt91edT8HLr38PSLbX67DgynKS0v26FcxvNct6cM48pxybKvzI2fFpP3hR
         OzJn11PG53WFyRFSqh9ri5e88IVuPDcHDcjqM0gf6fDNFUPzfK/ywc6/+kBBKvv01T0z
         PSWA7YlGdxLhI7/sApsWRVdPQuXu1Jrf2XMCGmOcCP5lAMBZxbSl0XGqb3m16wP10okM
         HcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWrNripZ2LaFXk6z+bOlG+geqGa8rwn3ZmK8lQiHj4MTi1DBt2cf8WFgpSzmx6SdMysb6WWg7W7kxut2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/s9y20iZikEzkrdKKZwILKAofqWUvCg1jgdODqDF+v+cRuGi
	3LC5q0Ot+VeP2v5xDqdJremQdYQrEdyEM/ltm450OkSzTIU8AURyGphlTQGNxhY=
X-Gm-Gg: ASbGncvhLAD92WNh5qZvYmy8GOvE8cu8hxef+sPk7NOxD1BcNlkIZnl0JcIFpSElMgN
	qIljEeMFDWFEv26OuIXRsX7sogvj4VhFo2pSFJ5ffuipLDnb15gbsbA6a8ih74q0mRbjG+gILRG
	YKL0VP88lGRdQbPIWHb466mMZ2l01g0iiw35XR4DFEq1DeZDxPMXWZebgTPR2GM8KdM0ChaG2Zw
	0AHueFpXYapMmEcCapVVbZuzcOydSkjkhtQGH9tC4pt1qca70wKz2tZebFOhlI9twb/Aor8Wvul
	3x868Tw6utAquwGRVPWhmgvnPqQbtA2TB24rWGkuzH6wFpk=
X-Google-Smtp-Source: AGHT+IGr8uD0XY+bX3hu+2/VzY5XGbZMzutnjed6ELJNZ21ytjGuAWchlodTBbktxWfDGrYrlctV0w==
X-Received: by 2002:a05:600c:3b29:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43d85097473mr25180155e9.28.1743073153679;
        Thu, 27 Mar 2025 03:59:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314e110sm34631365e9.39.2025.03.27.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:59:13 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:59:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] printk for 6.15
Message-ID: <Z-Uvf8YsA6q54hv4@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull the latest printk changes from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15

==============================================

- New option "printk.debug_non_panic_cpus" allows to store printk
  messages from non-panic CPUs during panic. It might be useful
  when panic() fails. It is disabled by default because it increases
  the chance to see the messages printed before panic() and on
  the panic-CPU.

- New build option "CONFIG_NULL_TTY_DEFAULT_CONSOLE" allows to build
  kernel without the virtual terminal support which prefers ttynull
  over serial console.

- Do not unblank suspended consoles.

- Some code clean up.

----------------------------------------------------------------
Adam Simonelli (1):
      printk: Add an option to allow ttynull to be a default console device

Donghyeok Choe (1):
      printk/panic: Add option to allow non-panic CPUs to write to the ring buffer.

Marcos Paulo de Souza (5):
      printk: Rename suspend_console to console_suspend_all
      printk: Rename resume_console to console_resume_all
      printk: Rename console_stop to console_suspend
      printk: Rename console_start to console_resume
      printk: Check CON_SUSPEND when unblanking a console

Petr Mladek (1):
      Merge branch 'for-6.15-console-suspend-api-cleanup' into for-linus

 Documentation/admin-guide/kernel-parameters.txt    |  8 ++++
 Documentation/admin-guide/serial-console.rst       |  4 +-
 drivers/gpu/drm/clients/drm_log.c                  |  4 +-
 drivers/tty/Kconfig                                | 19 +++++++-
 drivers/tty/serial/serial_core.c                   |  6 +--
 include/linux/console.h                            |  8 ++--
 kernel/kexec_core.c                                |  4 +-
 kernel/power/hibernate.c                           | 16 +++----
 kernel/power/suspend.c                             |  8 ++--
 kernel/printk/internal.h                           |  1 +
 kernel/printk/printk.c                             | 55 +++++++++++++++++-----
 kernel/printk/printk_ringbuffer.c                  | 13 +++--
 .../pm-graph/config/custom-timeline-functions.cfg  |  4 +-
 tools/power/pm-graph/sleepgraph.py                 |  6 +--
 14 files changed, 110 insertions(+), 46 deletions(-)
