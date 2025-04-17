Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C732AE69
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850739; cv=none; b=tyea6zAu52lyfO+Hy68lYXM3OT6cXGSvQKmQXhDiO0aB4f0pk+Owh2v7jIx8ReeVeGn7r0O5IyY/VzIovmfDw61dnF24lHRvlGFqkx74akfICf/rcvu3hqMgaWTx0rIhTEVEsERg0Mgv9iWZG0wVCgfvEz7drNT4+TyifDA5+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850739; c=relaxed/simple;
	bh=hWtc2TMQzYArSZCTJVqpI6y6EAGLzb1H6co9VghXly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsHz1t5s/i33AUwNO3ghgbe6qdW4pUSjzXidocG/oH1EoEudLX8gfBvZ3R2UyhVR43olhJfFWSMT+Fb7Lle27ZDEOM0ZRMKvtcsTJktS5psSnNmBDQkGJsJ6PgMmHaPuIJxrAsvA6Tk7P+2LJxAcbOJUQ3MNR+4KwFz0eEvWjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=T9VtFkFF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="T9VtFkFF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223f4c06e9fso2295885ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850737; x=1745455537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKNoONM8uHf8I5HWZGCiXygPJAKjFYdPbm+RmwKQe7U=;
        b=T9VtFkFFuJkV91j9aUUIM/nhVPLehAwJOftjc7wlE/tQd7P4Nh7sD6w3C85C/elZZP
         SAR67YuxwlEaRpNrSKVVVcSoNH3r49dNe+QvjuFssfrrmuvLXKBmtoVKZxuWMm4yyc4I
         oulTUTK1L38BD79icJ9kbkr/PTfGTKXuEvWqj+g8rPy0TIzcDuRqCAG4KJKxKWaCpPkh
         lP1qJoWhCz5833V50U0dIgkkyc65NZLm5eoe695HDQsUIU3RPW0j3aKxsQmXhvCeMNWV
         zco3JvCAteI3Y2O26+/wpXkQVuNZp3/hCJVGl3ordOm89zXvno0xKw9YZF0RnhbzLCxu
         mcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850737; x=1745455537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKNoONM8uHf8I5HWZGCiXygPJAKjFYdPbm+RmwKQe7U=;
        b=Amgcp6qkxS1C927T6pTyaFt4OAVQ5IC/+n+som8dtRyDapk/I12pi5TcvF3ICEr1+x
         iokzWvfQlIDIxjwZvyz7U3ul71VThiHM0eNG5QvciMlwXD5kij5X6vz1l17/BRhoKhye
         pCZtZWIxh2QLVIszQCvz+bJk3l+OrkLFUsSUvpALrix9hcNlJW73g2KbRL1Cina/GFNe
         6J2vDv4M2daoMtK6EhEsa68eQlVdgzifCaOnKT4uM9pyGSrPF5SIViv0oYOzyQ/mhb0d
         5GqK6Jn9G/kTk9aACzljmwdgrbfIAizYK2OisxVyTo9fsBOX7I1VVJ/yUaTAf7vAhyC7
         +wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi9fEKJmIFUcdz9Hp6LXghoVBF3JHhOXiFFAxY4b2wwvVqnKEQMexgKUgWqSEf6Pg/qiT2JSWlZfwYHdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfaSoIrE+NJ3rZ0mylS7dCZv9kRxXr6uOew+WcRE6XktuN77n
	hcOY2tkoFPr+T7X3kaRm5B7wLKce4oRFq3OTJzF67/Ckw6tANFj8Jkx8TmiU9w==
X-Gm-Gg: ASbGncvWzWWFGh8nZB7ugxnuFGzbxXWq63XGeyGpsB+y9TX2VrckHMn/3PSqv1M5HtN
	sCWrbksZ8dm7GDpz/t6SfLkKBEhjt0pRtY1D7yrOonBzqLpwpUwP4wWawJ99C4GqiygKEUF+iCp
	+y4/OwycV7nOcOx5eK2yCIlWJAruBi9hzQzRgPindSPtH1UJhf2Yk+6/4aS3S7tjvPwmYevGuQ4
	zntJLTwvuSO7zLsGyAF8kvt1fY6egJIy9RNyzozX1yz9roy8V4yFQ0Pz8W1eQkbDfxyUmRoPyZY
	8kqPgXZNMu9QALHL9QENuABxByEDm8AXNPIkMuhTkwedbszIvppTz7eqhDuR1mbZofDOi7w+YEh
	Judac+/9s5TBCbpb0
X-Google-Smtp-Source: AGHT+IHD/ezfhhhdCFoElxOp6X8UoFGIPbV9GQY9PV9X8L/OMYg7u5S5FApq2IAxkIrVHD6nS2zl0Q==
X-Received: by 2002:a17:902:d488:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22c41d8ee50mr10139005ad.21.1744850737274;
        Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef3e88sm20911265ad.51.2025.04.16.17.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:37 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/14] staging: gpib: u8 and u64 over uint8_t and uint64_t
Date: Thu, 17 Apr 2025 00:45:19 +0000
Message-ID: <20250417004533.86765-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
Linux code style.

v2 as some of the patches in v1 did not apply cleanly. Sending the remaining
ones.

* Patch 1 - Patch 11
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u8' over 'uint8_t'

* Patch 12:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u64' over 'uint64_t'

* Patch 13 - Patch 14:
	Reported by checkpatch.pl
	CHECK: Prefer kernel type 'u8' over 'uint8_t

Michael Rubin (14):
  staging: gpib: gpib_ioctl: u8 over uint8_t
  staging: gpib: gpib_user: u8 over uint8_t
  staging: gpib: agilent_82350b: u8 over uint8_t
  staging: gpib: agilent_82357a: u8 over uint8_t
  staging: gpib: cec: u8 over uint8_t
  staging: gpib: gpib_os: u8 over uint8_t
  staging: gpib: gpib_bitbang: u8 over uint8_t
  staging: gpib: hp_82335: u8 over uint8_t
  staging: gpib: hp_82341: u8 over uint8_t
  staging: gpib: ni_usb: u8 over uint8_t
  staging: gpib: pc2: u8 over uint8_t
  staging: gpib: gpib_ioctl: u64 over uint64_t
  staging: gpib: lpvo_usb_gpib: u8 over uint8_t
  staging: gpib: tnt4882: u8 over uint8_t

 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++++--------
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 ++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           | 16 +++++------
 drivers/staging/gpib/common/gpib_os.c         |  8 +++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 20 ++++++-------
 drivers/staging/gpib/hp_82335/hp82335.c       | 20 ++++++-------
 drivers/staging/gpib/hp_82341/hp_82341.c      | 26 ++++++++---------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  8 +++---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 16 +++++------
 drivers/staging/gpib/pc2/pc2_gpib.c           | 16 +++++------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 28 +++++++++----------
 drivers/staging/gpib/uapi/gpib_ioctl.h        | 16 +++++------
 drivers/staging/gpib/uapi/gpib_user.h         | 26 ++++++++---------
 13 files changed, 121 insertions(+), 121 deletions(-)

-- 
2.43.0

