Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434211CF8B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222197; cv=none; b=Csij4GrR7nSAWy+kp4ofg6swVnLvJsrZf2/DEL87wzMj3yBHjGy3cYeeRrHKCYdmQ5TTkADLY7vUDKcHxLnin8xE4GNnVbkNgX1gPzScmNuRybnUNilsP1KHV2SS7BXOI7w4MhtCg1hXodLZgEz7h0Q7+1S5OgctsQZRsM7uPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222197; c=relaxed/simple;
	bh=csD3xSMbgrDPv5RDbSufZkLmV7nSPfQVdf+sgWjlRKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdMwlUL34GdyPssj1SLTvMCgYeeiUY2cpBehH/LW0xudmKsP6lhiCMMnU9PGHBZi30H28pQTBe8KRybZjmhXwmV9gtcie6564GMmgBQsVYTjoqNJfg9VDgFODrffHTL/NRvFEC6Njr1NBMlfFTLMokjuaGmn5xm7UVTx9DUAabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=MhpdCp/9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="MhpdCp/9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224171d6826so101731795ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222195; x=1744826995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYrGToWVdj+sV2ioOcCHVAVkWswfBeGzYQuytZUWl2c=;
        b=MhpdCp/9Btd595RM53F1CmJ7At2hqM2QsH4nvMhqHWt2n933IPiHbqK5ivWnzdrifv
         jxRrdzQAjIhd300L2hdiuE18QBIr12nPP0GhsCCpmldb8iHZOJB8SrGsb1wZ7eXEdSbi
         ikWCg0C+hSR0JyFg5CznMqKmluKRKDS3kPo/gJHw2rhBlpQ3pQ6w4zNqRo0rLs23z0T9
         IISV1DH2XCeLCVlZ+veV3SdwB+MqaMPyO2hMzatmIngECg2YrMZbWzWe0W2k9842JMaf
         Fhe2EzRTine7st7uILWS+J+zReCbI3txMrnYsfXv+n2rrFU+Eg7etE4frnEZAKvgjtH4
         VIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222195; x=1744826995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYrGToWVdj+sV2ioOcCHVAVkWswfBeGzYQuytZUWl2c=;
        b=jFFScJPa42j2msS2W43BAK/CNbKhQijlOIjVitkR5qVBAtUdFhq8/wdScTIH4Dx5mt
         Zp88zd5AgcKSCsQERaZcUEgB05RxjQVMLSY6Ev4K5SqBsNRq5vbzgKYspGEP3DZa1vtX
         jC0DsZiJfON13z/oQG3GEOr5n3HRVb4Wh3wpCG+rluspT+nzVP9JUiiY1PyEhixYd5a6
         REp29DnsHEJRtyJk3HnS1JlZOc4j0sWyxi+FBG0PDUg1ba/GZ7Z96xHNQoul25P5UoST
         vd2h1Q06QCnJWhU4g5SXJGwRvyXYxnstivChoWOUsN1IlyXFQWR3Z6PG8Hdj1+43IGZO
         2Nfw==
X-Forwarded-Encrypted: i=1; AJvYcCUdxDJcC7e7XTrDs+JxGjIxHyHhMA7A4sKrQ3CV1bhctHQfidM04Dr/uiAhPyWqlk2+Ngvz7PKv9Y3/Dcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxinFs5AH9edqwt5cAT4AFd4sC/mlzM0GDOp9SBTxKjG4X23BRr
	bZK41wGE9m4dZEbIOGPEuq1R/GnsNuvkq24Wx3U9HjO6y2OY826g2ZU6qnnkXKgMo5Q3fbzuZBY
	=
X-Gm-Gg: ASbGncslp8GSc00DDd6nn7sBHJu0Yz2AmbSP4sxmCgv4VeSl7fIw3kEYdaehpPiP7oF
	8/iZE1l7MkZ+Rq1/8Jhs+pkyFE7NkKtmSkvlr7wbQ5WwaVZ72Pp11F+tT7DOrELcIivNsr/AZ35
	7IXetIxko/yqeTvcMhqw2mdqKR3Xj6Qxth0bwtBB42NTVJ7/2/b28Z03PelZhgR0Na8U+Ys81C+
	nYMvrGVUu0Iq9ikZBlqMiXlLAE4eMSOKkwp+gCkIasxy0bQBBRTkWvbwoZd3PI8mtx9cSLvgrLz
	gFw3aJGZhd2z3YFUsv65+eVASZpKc52/JevlrQhO9jhuQbKbBVDilcYtRKebZOu2C5dhC5MVWXb
	m0hnwlg==
X-Google-Smtp-Source: AGHT+IGT5+uwOr+yxY/pgNk55XEAsRW4cr1nQCtxEkyrOG2eZh5gneJ9m1CIWXdz0YIBy7sb9vS8iQ==
X-Received: by 2002:a17:902:db08:b0:220:be86:a421 with SMTP id d9443c01a7336-22ac3fe6feemr61587985ad.38.1744222195517;
        Wed, 09 Apr 2025 11:09:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4659csm1717653b3a.65.2025.04.09.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:09:55 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/23] staging: gpib: u8 over uint8_t and u64 over uint64_t
Date: Wed,  9 Apr 2025 18:09:30 +0000
Message-ID: <20250409180953.398686-1-matchstick@neverthere.org>
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

* Patch 1 - Patch 22:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u8' over 'uint8_t'

* Patch 23:
	Reported by checkpatch.pl.
	CHECK: Prefer kernel type 'u64' over 'uint64_t'

Michael Rubin (23):
  staging: gpib: cb7210: u8 over uint8_t
  staging: gpib: ibsys: u8 over uint8_t
  staging: gpib: fluke_gpib: u8 over uint8_t
  staging: gpib: fmh_gpib: u8 over uint8_t
  staging: gpib: gpib_proto: u8 over uint8_t
  staging: gpib: gpib_types: u8 over uint8_t
  staging: gpib: nec7210: u8 over uint8_t
  staging: gpib: tms9914: u8 over uint8_t
  staging: gpib: ines: u8 over uint8_t
  staging: gpib: gpib_ioctl: u8 over uint8_t
  staging: gpib: gpib_user: u8 over uint8_t
  staging: gpib: agilent_82350b: u8 over uint8_t
  staging: gpib: agilent_82357a: u8 over uint8_t
  staging: gpib: cec: u8 over uint8_t
  staging: gpib: gpib_os: u8 over uint8_t
  staging: gpib: gpib_bitbang: u8 over uint8_t
  staging: gpib: hp_82335: u8 over uint8_t
  staging: gpib: hp_82341: u8 over uint8_t
  staging: gpib: lpvo_usb_gpib: u8 over uint8_t
  staging: gpib: ni_usb: u8 over uint8_t
  staging: gpib: pc2: u8 over uint8_t
  staging: gpib: tnt4882: u8 over uint8_t
  staging: gpib: gpib_ioctl: u64 over uint64_t

 .../gpib/agilent_82350b/agilent_82350b.c      | 22 +++++-----
 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++-----
 drivers/staging/gpib/cb7210/cb7210.c          | 26 ++++++------
 drivers/staging/gpib/cb7210/cb7210.h          | 12 +++---
 drivers/staging/gpib/cec/cec_gpib.c           | 16 ++++----
 drivers/staging/gpib/common/gpib_os.c         |  8 ++--
 drivers/staging/gpib/common/iblib.c           | 12 +++---
 drivers/staging/gpib/common/ibsys.h           |  6 +--
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 28 ++++++-------
 drivers/staging/gpib/eastwood/fluke_gpib.h    | 12 +++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 32 +++++++--------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h      |  6 +--
 drivers/staging/gpib/gpio/gpib_bitbang.c      | 20 +++++-----
 drivers/staging/gpib/hp_82335/hp82335.c       | 20 +++++-----
 drivers/staging/gpib/hp_82341/hp_82341.c      | 26 ++++++------
 drivers/staging/gpib/include/gpib_proto.h     | 14 +++----
 drivers/staging/gpib/include/gpib_types.h     | 18 ++++-----
 drivers/staging/gpib/include/nec7210.h        | 33 ++++++++-------
 drivers/staging/gpib/include/tms9914.h        | 24 +++++------
 drivers/staging/gpib/ines/ines.h              | 20 +++++-----
 drivers/staging/gpib/ines/ines_gpib.c         | 22 +++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  8 ++--
 drivers/staging/gpib/nec7210/nec7210.c        | 40 +++++++++----------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 16 ++++----
 drivers/staging/gpib/pc2/pc2_gpib.c           | 16 ++++----
 drivers/staging/gpib/tms9914/tms9914.c        | 34 ++++++++--------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 28 ++++++-------
 drivers/staging/gpib/uapi/gpib_ioctl.h        | 16 ++++----
 drivers/staging/gpib/uapi/gpib_user.h         | 26 ++++++------
 29 files changed, 290 insertions(+), 291 deletions(-)

-- 
2.43.0

