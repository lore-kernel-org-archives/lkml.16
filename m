Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00211DED40
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694304; cv=none; b=ByVzNy+LfQv2jg6UNewUh/mu2t0Kr1vB0YKNwFVMeCYUDxbaH6V1u3+S0v7hqu/0nnXO0MY8UtoolpjM73z0rDs02qsF1i07jAzTURZbqJB+6LPxQESpEqfFiRCt9MzXs9y2zHc+TJeIIlv16hOfF2sT25k03/IYFI/xCdq0Vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694304; c=relaxed/simple;
	bh=7No2cTm+Odh5c+f4SRR9TzsUUvLZ8wQ2m0LL4BCpxhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DS44nqkYJ68taoMRKjowRDSVLGYxI6+CgXdL6I//QFG5BEqH5Q1z5/0DZAV1ORIKxI8NeR+LH/8YaL47KA+cXuujGoQm2tg6tVnyIvcgPAnZ52xdtgAdTHWoXo+L4P5fJ2kmYfkyPwuOLPcAIOEHHjaGBctP9b1R5GOipXyP2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THo0bUeb; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THo0bUeb"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ae727e87c26so3454159a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694302; x=1745299102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/T6ljnq1W6k3TS1domzRVfhnwstk8LxHyrkBWe3u8c=;
        b=THo0bUeb1rgQRbeEz6tXqhyY4MgAC9RMCuvzTrHHqRkD0+ce5i1y5a8/g9H+sB3FO+
         jFswBidLKSNnolMPMvEBC+N0L5med00wfAZfol75f7FErc6+75BBY70KQbvxGmon5fFb
         JQZALao9GcrMUP9gkIyrNYK8IhyKTeRl7V0gs6PhNl4sTnvhmOXIF03F4j7X0O1ARkbN
         bN9Q5SeeRhgVAhIQXWNpjIGMazeZduK1jyOKrsp7vJHdMBsOQ80eVNUPs6ZcKkWsf/KG
         rd9VgMQfVz3DVxSXVsFEnsFGw9wCB3Gv7zd1ml+6rf12qUnHYwkKslBtz2h7ORE8wBgH
         UtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694302; x=1745299102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/T6ljnq1W6k3TS1domzRVfhnwstk8LxHyrkBWe3u8c=;
        b=o5NYCwN5o/j4KUQjg5f9ggcb6MDjWzep0P8wYpDxrjAV9UXhQnwCUxpY8Pb4HoVwJ2
         33sdkVLtY5SfvHHg4+u63I6uypfx6VXV1J6FpQCamXAOaz66v4qqJUAhmw1c2Jq7Sz18
         VLl9c+OidhpQtBTezX1quC/NaUrRGmlYvDiIIsziPVdF8gS5McpVZ1ycRbg0etmzLbOy
         K+/UojA5oh3H+87+Tf2ke5AaDjx9CVOioZnS8Aay+7R7fyBTzgtqVYRnls14SRW5SsQc
         Q8HM76mD5eLTPfFzD/5BKZQAnEKBU1L7b5rm5Y0G7HwWRXXQWF5AeL6cHK7BIsIZd7O8
         35DQ==
X-Gm-Message-State: AOJu0Yxt5x1zoK/nyyT7ysWOsfaC0Og+Y0lIj5S3+LpmSFiscgNsynVs
	5+kQPnw5gaoIRxDkucFob78JcdLQRu8JjODeNJfECuyvB7shd49t
X-Gm-Gg: ASbGncvs+K0HxA5qlSACpfzWVZSqR1iIqWnHdzJy3Z7kbeOrRDt3bLw3Fm2t6/8r8CW
	2KXeCiJT9bUuG8iGS5uf+w8gjeVbhOmu2I41/i6MlTLyNKiNnHwE77h4WFU0TEYPV3ipzO3fRFd
	sbMSKgM9VIkTZ2hTmuJd0PrvjLMTfj4ttN4XPU1SftpYxDwpmwxSDC/Ea8migzuIELCgcD9BOrT
	bwrJrqsMGbIsyB7wtyNk/55PFQwhJZrHjEEb2RtbvhRur5SnyHX/kJeG8hP1sIaUxlyACP9/MDm
	9GdWjdFDHNdGdHZ7sv3SSoLN2+iy2iII6o9BoMo7ApXNJpeYx50=
X-Google-Smtp-Source: AGHT+IEaYOLTsd7CaMh9nHic50JbqGkjQUi9ObnkpZkF92e+TjsGJ/rFZb5vJmb6PdYCeDve7ZWibA==
X-Received: by 2002:a17:90b:3d45:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3082367e7c1mr20452309a91.20.1744694301872;
        Mon, 14 Apr 2025 22:18:21 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:21 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
Date: Tue, 15 Apr 2025 13:18:06 +0800
Message-Id: <20250415051808.88091-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset reduces the IBI transaction time by the following
improvements.
1. Receive the request in interrupt context.
2. Emit the STOP as soon as possible.

Stanley Chu (2):
  i3c: master: svc: Receive IBI requests in interrupt context
  i3c: master: svc: Emit STOP asap in the IBI transaction

 drivers/i3c/master/svc-i3c-master.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

-- 
2.34.1

