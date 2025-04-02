Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1F14375C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598710; cv=none; b=mJTQGA7TXfw0e4dKay9hyzYuIaL3ygyNf6Be8IAvfwQW8oZJ7GnisiaR6bNlHUkOmCNOvg68lPWGyqJ/3JmNORu0bUYQBPjPEzpA5Rs9BJg1frvdSdJltAnSUs2x+cCKWR8nnSrn33MmGHNLRmNB4lFn3Nxi0HaWbB7Erkqoilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598710; c=relaxed/simple;
	bh=vLmCnOaSVqE5u8oYACEx8U1piuuOsquiMf5pfOSJnZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8hjML8YcYEog7LgbG79Q6irqq4v/9qRz4Wd6tLd0xG2hKKnR3J1tLq82vOpEA5zCe7ZFdR63dFMVimtr2t0olrFgOT/7xXq4y1Z5yS1A/GGbG3czLsA7nBKtnSJQDSn+z0rzYstsNtdI2waOpU2Ddi84SWxHyk4YlE+gk6Ulck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O5FQcs9m; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O5FQcs9m"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1447191f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743598706; x=1744203506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb6p77zC9DVNLUO/djgPgrQnwSB5fXDb56w2QJQXimg=;
        b=O5FQcs9mIE+dAcBgCA3ITnPuI00MWRw8PLVr9lPSEzun1F+HQOtKoL/uyoOAY/0MwH
         Qs9JfYC8RNZlg/N0/JiArPVaZW6hnORdKm7NGXJ4v4NjzB3yS3p0K5PbGdH91C8FsnHQ
         V3BfRhYpPJlxng0rX1/YrT0yefigSGumgBqDI1Vd0psbkja/cb3A5l0IgxtKeSFE755q
         fd7atpuaoEpduOF5v5Qbci9F4JF8tncFnqBUu96ie8r08xgAf03oPOf/M/ba+TQ6ow9o
         gL4zgPfnKuj517ZE05eLFJ6LSHCHJOLFUMSCfTdV+U9cbMpJLVCnTDPMiS3lgF2Jg7Ii
         QdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598706; x=1744203506;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb6p77zC9DVNLUO/djgPgrQnwSB5fXDb56w2QJQXimg=;
        b=Dxrjmho35WL6xQu4Jyy30xpsyrjokVJjyTWSO2GY39C401P6oW+EQDXM031F/h3lLE
         4tBOOYscFveh1A6rMe9U49ELE/kvS7YrT7Q9jvfxbVn0S/yOWWrDMSWvWT9OVgRZs8je
         aQBASEVAU2414kRRNJoNghUqcRSgp8vRrbYJZhoPYo2yBwqPcRpbIGkXwLz4VqIRsCCa
         oVEORoFvAloEl8ynx/eV8/BFf2JKzyQv4p9aMl49zY7MO4fFFbc1lRDR5RWasEdRCgdP
         KpgM/h9WAAubrPanoeBP3LZ/z4ZG6HUDJqApgAyzYDFIINEQjqwi6jvCWatGA5zNihIA
         Hovw==
X-Forwarded-Encrypted: i=1; AJvYcCUt7iHL89uspogBDoGR4DsA4av6XMPCUF2F9XF+NOld4rWw7iznimQgGVtjSbDQGKTEjSPu75Ws4d5XM5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD8JcdFcc0iGu8bde3O6+jwzyzjw8vt3PMlaKtj/XiVLWhZeSI
	eNsal5m85xjFnuFkMt080q7kQOo3meZXI+aF+UxAvNsDE/d7wjDIJX2qv67ZTds=
X-Gm-Gg: ASbGnct6hlhByzgSVCy6A9AZCSNND4ZHQrPUajfrX9nvizh2raBiol857akuMcG89Zj
	Cgglp5uYCVkpdNBR7UG4gkntL9ptJov3yVULkIUq4SO20JXvjLBQ4rz2b16rwePMuRkdC59db9Z
	VQ0tKC4A+DJt+YRIv/ghyIZEhRJCrBfGJx+He/2f0Vt+OBVEIBVDxH9Zehau+ZJ1Ftn1DEbCwBe
	WS8GOlhEIrFEHq2IVVbPalhTdutmIgb6D+eNUT3PsuxPHH0MAcwEB5QxvyPdpjzSdaqmQhsirv1
	VXeSfGliCbaRgZYXB9dRe0WuTZXIn7RhbMbvcRmTcAMrMPY=
X-Google-Smtp-Source: AGHT+IFz5CkUfQK8qckCWJEwaGVtA/JUEjtz7Q3wjzQKZZOOePVj1rXFvEqaccHctPNk+KyEgA4qQA==
X-Received: by 2002:a5d:6da1:0:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39c236500aamr6122374f8f.30.1743598706561;
        Wed, 02 Apr 2025 05:58:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e33asm17108765f8f.66.2025.04.02.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:58:26 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:58:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] more printk for 6.15
Message-ID: <Z-00cAEKkfvyNto2@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

please pull few more printk-related changes from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15-2

=====================================

- Silence warnings about candidates for ‘gnu_print’ format attribute.

----------------------------------------------------------------
Andy Shevchenko (6):
      seq_buf: Mark binary printing functions with __printf() attribute
      seq_file: Mark binary printing functions with __printf() attribute
      tracing: Mark binary printing functions with __printf() attribute
      vsnprintf: Mark binary printing functions with __printf() attribute
      vsnprintf: Drop unused const char fmt * in va_format()
      vsnprintf: Silence false positive GCC warning for va_format()

 include/linux/seq_buf.h   |  4 ++--
 include/linux/seq_file.h  |  1 +
 include/linux/string.h    |  4 ++--
 include/linux/trace.h     |  4 ++--
 include/linux/trace_seq.h |  8 ++++----
 kernel/trace/trace.c      | 11 +++--------
 kernel/trace/trace.h      | 16 +++++++++-------
 lib/vsprintf.c            |  9 +++++++--
 8 files changed, 30 insertions(+), 27 deletions(-)
