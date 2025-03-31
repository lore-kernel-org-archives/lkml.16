Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126B214202
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435508; cv=none; b=mKaKRTgPTWNRGNPwTnt1uHkg2U3z41TZ4yUPiLkx4ipokgGYTEqE5Rk5X8kC+C3KHSSWYVTj0jctV4fjqFgWKYXnWei4IrJ9EESjaRiaZpABFRzLsIBVZ+HQ00MOvVFROft1jwAc5LB7HY6+C+6JGxJujgCXwzf66tGH1cKpJhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435508; c=relaxed/simple;
	bh=zwb8oRVeRHVhNEzv8rKOlSfQi5Mp+G5nVvhYW6DYYFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PssKshXZFYQCoBhZC6L9JQOrQtchx2T6511Pm/BXLhAKimx3lgI5Ab6FHY+EjHGTnA+ZH3HOCO33xqs+K+ncFFS7rlq2Bjq7xGUmc6lZM8KWgmDi9GlOYSS7OYpwV671JeLzt0rwyqFTbB9JC6iy1IpDd+2ZIBR7vGpr+G6h1ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvET+f0O; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvET+f0O"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2316644f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435505; x=1744040305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N140jucaTTh3rt58OIrmN32R0bGRGc8RszBHlaKqo8Q=;
        b=lvET+f0OQeUJnP4wWwb5jszRGuY3tAlvy+ZENvjyn63iEImjxCci1eG2jSEYPEY61n
         ma1A/9xRDyYoVVXsiBQaPntfgK1njrwdgLLVg40x1J6L4HEBVQkAFbCU3GX4yOLECwrp
         9rMt+UGrAQ7uF/Gy705ypS9BgEduZc1M2CxBn8oK9zHjn9CJi3LCI+vdmAgCxRo+HiFV
         hgnp8anzADrM6rrYR2Ie0pAa0bQp3Q5k1qlgYGewQhV2EYkcZd8Etz9MVtuxdHBvdQtX
         UQHb0lOkW3QuYLB98bKxS4xmLYIXWd80OBLi/XPRzUfAPy5vwCsqo1L0Axij6blMFeVH
         WMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435505; x=1744040305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N140jucaTTh3rt58OIrmN32R0bGRGc8RszBHlaKqo8Q=;
        b=YIQ0wEe03Y+S6gS2QS96grU4ei+XfeVKNleUcwTIs4NAqqQa7KZuV+3+KkbjDtmqIr
         O/LiZTtvvfuvqmimG7OQywW9DBymQDSgt0I7Br98VPs+ODWgbVhP5CdvLsYQVaZE6Cnq
         RhAVl2BsFbYFPw8J2uBsO7iDeIUuSzE4qFbE5aZJyhLSiMnv69Oqqh9aK5sovGS1koiM
         LiS4cIu4HvRlvBmUB0/RTOZRQQqzTL4ftbGHnF9xRRNLmcHgZaBoftq7/FXrvDBHyyOi
         f07FWQmosisCv23L21zI7y218J0hjj68Y3Vua9KkesLPDzcyNg6Cx2m9Pl4eddeh6Iqc
         ygvg==
X-Forwarded-Encrypted: i=1; AJvYcCW30Olp70Uh9qRf6NKNfEkf8XG8JNN49VuZSjIB8bMLn1kmcS+Gz6i+Hsh+iXt+nGvgh9/lbJAC2r4V6Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8S/rM1sbEj6OM0oxXWLR2ZGojkLhlflLLVIaLF7op7SQG3tV
	AhOMP6Cumlp7TpCaFFwpigIxsc/FFvHaq4c9qg6pWH1ZFiSbDhw5g4hBPPTGdFw=
X-Gm-Gg: ASbGncse6GY8yeJg4anSOWMsn7O2/JjFwpQGXK82I8sviIDj3+xYEZNNocUMIHxqOWh
	CKc++3J1yW2EU0MURcKvbtfh23Ob0mcV6bou3ZqI3MUu3LUNXsxg1Ob1Uzv3iP6HFSaxZvsHVAu
	ZDLeKMVdsw7w0H5vFnk3PLLRgXRjqnDvxSfg9hY5QN97bFa5Hitem9VtsgzLuPB97JWIRrZ/6FX
	uC/Gp7yFZh72sJ1LKZC2iiSbqsZc1TzUmMcCPcyLZMmbm27KL3SSLe1/M3VHw7S9cOWjQYpdbOF
	8NBS4KBnwOXOXbERuCt3V6wSFB16wGRKoEyGYvE=
X-Google-Smtp-Source: AGHT+IFcFeeO6IT8ig6BNd4aS0hdLQhfEuMMA4gGKPi9ztwMYh9Bp3CwAxiRyvO8WIYgBMG6Ncv1uA==
X-Received: by 2002:a05:6000:240a:b0:39c:1401:6805 with SMTP id ffacd0b85a97d-39c14016a52mr6436286f8f.19.1743435504801;
        Mon, 31 Mar 2025 08:38:24 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:23 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 0/5] Clean up patches for rtl8723bs driver
Date: Mon, 31 Mar 2025 18:37:53 +0300
Message-ID: <cover.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address different checkpatch warnings and checks
for the staging/rtl8723bs driver.
The patches can be applied in  any sequence.

Erick Karanja (5):
  staging: rtl8723bs: use preferred comparison order
  staging: rtl8723bs: replace kmalloc + memset with kzalloc
  staging: rtl8723bs: add spaces between ternary and binary operators
  staging: rtl8723bs: no space before tabs
  staging: rtl8723bs: Rename variables

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 1266 ++++++++---------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   64 +-
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |    4 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  |    7 +-
 4 files changed, 668 insertions(+), 673 deletions(-)

-- 
2.43.0

