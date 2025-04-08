Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B83257AC1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151837; cv=none; b=G3uAa1h1KdctadLc7fUmJWzMh+Na09gTYA5MuTpNh7FZsQtELXDsk+2Y9cSCWUWuFXidH4nH5FA2jF7zL0QgVPfM1Gcw30Fb5zrrpD/J2GY9nVCD9klVMDurtLUBFE9lKZg/+PreFCr4yZVVqu3mdSgDG34KrQohOVsLngBJdkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151837; c=relaxed/simple;
	bh=3gUtVacJwPKBgpo4kagQdtl4FHHCzSx2FeviI3WLXV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui2Ova+Kup9DHzUlNgndLMDVrWJ8375MtpOVjfcrfQCmBT/I9nzFXDfHNMNwCpa0PR4EQCrH6/6bZnc3ifXAV2R+3PxiAl602KjBpCiu1Ts2pv0uIzdKB9beBRt19Wnx2b7pOGBBCpc/Ilg5kJedWEBm2Zk1FJ7xYuN35uBuxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hh+xHzU+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hh+xHzU+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5967330b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151835; x=1744756635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HA0A/F9wdD3qtvPDerH40ZSpT7NQGhe4df1MFgMzz4=;
        b=hh+xHzU++UhATjLjQwUNgR2O4ZozQp25dulQHSOj1Sre6V5//nTYQqXjm+zNqdwABm
         RU48ZJpaOb3JZ6m3+MSK/mchOeD/M5L20Su1KeAMTjg/jItm1vrvT2sFSYS0frjIayQK
         KR+SNlZgU1rec+ibALWyQKvwk6PmVrNYajc+VZQuDhTZt7jh0BRHkY88I6fiosjQw4od
         uV9xltshO7EFMYDlNHOFfdj+Zg54LZLT+rt4OubhOIVNhPPmABojoByER45nGG9UGKy5
         nfHuxy9u+h+CeVEk/0ZLABAcNOaCOO14kSGJimE4MLg4u+iLFqbcgKEnznvkwV+pL99R
         VXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151835; x=1744756635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HA0A/F9wdD3qtvPDerH40ZSpT7NQGhe4df1MFgMzz4=;
        b=S7tkcqJ/9qL42trKaQiE0T7iBw871yKvOt294Kcw5ILIE2/lAgsS/2UYlR1oNRuDVC
         5Ofgf+eZP0BQU/m+zvRWciTD1ONDhyFyfiXtw1Adyyu1DmT/0KxmzyDXvxeWvx2dfDHL
         2JbGk6G1j6JSSlI1OThbY7Tu5dkJvuOLraCRdYZVZ2ExxTvtzIDZA31DE6vSA6efsn9a
         loraa4n/m3waVxjOcckC8exkfp8+1hdJ/KHD9M/RF6zrGOKl8WLF77n9J1djtBgQu5Ob
         TXqxKrOVBbdJdU5jmqvWhIDnvt8ZDNdaXL68vK5sE9r7pWtjZi4pjT3NbQUxqb5V1cLC
         8kaA==
X-Forwarded-Encrypted: i=1; AJvYcCUA4ooa/OaXVCN88dAxQ/ykyWjys5t/2nBEOQrNWeYI/DCTGXk06Cc9WbS4ekErG/pqJAeqD8qoCj5MztE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUOSuPZi3T2p+5gk5qFPZnEsk65/dKn8tOeSBfZBqqUYTv8w9
	GeAb1kDvTcASwDMYHD3qXcvfS9jDNjov1yzOZNa880K15rOdXwuDeZZqGedt7g==
X-Gm-Gg: ASbGncswO/KXgd5FD6mejMMwArpeJbwOWeKLNw3980XrzOjDg+6Nvhm8fsSQUmf12r1
	IJ/KTHnCn2z7jEfsyuDpMaFlAL10b5NT9MfzdE5CnJM6AcTFl/NVctseRECICQy3f9ZAeF78la5
	mqRF03GJXnp4iN/j3l0yUIOnIhRIGZwCNnc7qxy9ZJh1rBahG02YK4RvaTtsJ7GEEza3WESL54Y
	HQjJYS6PolaPM3qStNRsP4AjN1j5cliA30Z795kn1/Ow4dbLmMsEYhmPMyJlhv4d7CSrE147yTu
	XMJVwiDfQSBnNcEPKLqi+Zkcee0odHTDq8yKJIL1xh9wzIfXGaiwWGveBpiG1HB/htXkNyBs2zC
	BZkNUba+E2Q==
X-Google-Smtp-Source: AGHT+IEDi/FjKYvlTIxDwvfbDp3AA+CHNnv8e0pqSC+FVoN7hv3SGTobPGucbuwf9xOEIMYmPPYxig==
X-Received: by 2002:a05:6a20:6f90:b0:1f3:3690:bf32 with SMTP id adf61e73a8af0-20159190bd2mr954354637.18.1744151835638;
        Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cffffsm9592187a12.13.2025.04.08.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/18] staging: gpib: hp_82341: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:51 +0000
Message-ID: <20250408223659.187109-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 775103d744ba..f2306245ce4c 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -250,7 +250,7 @@ static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int hp_82341_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void hp_82341_detach(struct gpib_board *board);
 
@@ -619,7 +619,8 @@ static int hp_82341_load_firmware_array(struct hp_82341_priv *hp_priv,
 	return 0;
 }
 
-static int hp_82341_load_firmware(struct hp_82341_priv *hp_priv, const gpib_board_config_t *config)
+static int hp_82341_load_firmware(struct hp_82341_priv *hp_priv,
+				  const struct gpib_board_config *config)
 {
 	if (config->init_data_length == 0) {
 		if (xilinx_done(hp_priv))
@@ -686,7 +687,7 @@ static int clear_xilinx(struct hp_82341_priv *hp_priv)
 	return 0;
 }
 
-static int hp_82341_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct hp_82341_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
-- 
2.43.0

