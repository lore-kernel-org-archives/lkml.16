Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C048226D07
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053565; cv=none; b=puJEfX2tDlBLlehKDcLEfmxIB507S7uVQiglESxnYjF3oFZBcF5wJTOQj4ZCk7R0prJDhUNxfzXoWBfbtfp/CJebFQa+4lltk0OG3cZ+Bb9FnvCqowZGSZfgRMitiOLTzvEkUEsVpEkFTpEougoOZ43+hzeCG3uLValSJubLRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053565; c=relaxed/simple;
	bh=F1u4A3II7J516T2IMIxcmX6L0E0d9Mdz2jTNW4o7BAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tb9I8ufnJ7b6psxV6hTki7R6M39AaK8iahYROKKvxpIRzsVT/T0eKdb0G5zcXINWeRzJEAb3QAMQtAoBgtcOBZ6rtWUPYNBvdtoKlBvN552Yba+35Sv33bgKDZxirghUHgt51S4Mt1xODsBzxiV/mLE05TdVgXFv803hyzN7AzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JFx/TjIf; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JFx/TjIf"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-3d8f9657bb3so182855ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053562; x=1746658362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKzn8c1gT7pxjQ3957pT3uUayQRNh7QQtDCxX/k+loY=;
        b=JFx/TjIf/FTENfLraB1pg2YnbEYcOAwYP4j+p/oF/+YC9DfKruro2hE3wionmO8vno
         D0cEboiXx115w7j+DN12wa6Uo4lRTJZBUoJYu1kep2uuw1R4D8pW9qqrqMOvJzSelsAH
         Q1WBcWNDgE2+7I3saxEWSqS8iAA0XDZ9oWUq7RFbakR1FdlltzsSFbMLKEqXk3lua7Le
         tZILHad/X3lnV4zIukCX8onj7C0yEEitRgAOMf7BAHXEDo9cQDhTP2eomIw+TZKbk9r5
         iIzpX9EhRp5dQQDq5Jg6pamCQdf/dPuD7KRH2mspzic+4BxNNk08X/L3xrDUy0LXQC3j
         QcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053562; x=1746658362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKzn8c1gT7pxjQ3957pT3uUayQRNh7QQtDCxX/k+loY=;
        b=IPy2tDyod/xp2Bgc965/vWe5N+vy9jRJ6yC4JGha348Q+pdniOF+jRBsE2hXKTqKK/
         0mtplp78t4Fm/ZgEFEwz90kahrKAS6Q6Ev3GEfIIRev9CqNB/UkbUcZK6V+YvbcNReLE
         kqjoWnBIhgn3aPfvw+hvNpftnfW0aEwykbq8K94Yn9Olss1xohhrL7sxrMRFs1L9V/XT
         At043p6tgZGir+wn3uSbLuLcuwuazINxyTutEFYY1A3UuvkvDNJ6HEQFLyTsAxPIAI5Z
         fNeDgGISTHykhCpsqwI6XTF7k3DSCjKb5dgites1CjcDCW+LT0DE9Lw4aopSzZkUyjVR
         nhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfKDG3E6pkGnqn4EFzNTT07m14b1xdCBIecLxmFKnB0yHqJd3zH+KEde0iGpDD4srgV1nIWEloYQM/vFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIL7Pj7OqtuuYLtihASgVY1twK6M8EsDHPYcEZ1SlxxRa5GscQ
	3KTHnyxjw5dAKF58qyOMavgEcgOMzVectjfFxXqN5m08efJYU/AMKkD+3nrDInZOnU8/Gd0LjPu
	1Zg+RjZ0xANayQFeqX7ekMXG8seup0TgzTJiLAu89AEPBUptR
X-Gm-Gg: ASbGncve5xqjLMCRXMj6yPhuhy3vZ8ISvapM95J0BtpsdTCefMZnj0TEXpqRqRb0SCR
	GLVGzOWXlyCiDJTBKVFTdrV09nhy33uT3KpBmYuFj4BhgivOYrm9vOET3MvVNi9At4XSfTvQe4I
	HCBtyb0LZ8DRaW1oWmmGrvOpY6VwFIq7pAMePtk6YmodftK1+WDFs6jm/L9M5cpDu/AU1NPZgqK
	O0J/uEuAHXbTuGuU3lexYVBAar8Bwi6BPur5mLb+/xFFoRJdW+RLTJaiBfYv7NwaF2X5vforDYZ
	0D3FNiBthC1DMczP2I8b3ltGea2tXQ==
X-Google-Smtp-Source: AGHT+IHXcEJToWH3+Ky6wiHTax+SifpxDXUZwle8Tn09a9JGf5xEuvTnKbVzf6vXj+eIm+MLYmELCBeMykmo
X-Received: by 2002:a05:6e02:19c9:b0:3d4:3aba:9547 with SMTP id e9e14a558f8ab-3d9682a80bcmr13881195ab.4.1746053562302;
        Wed, 30 Apr 2025 15:52:42 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d95f311e01sm3634185ab.31.2025.04.30.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:42 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id EABE3340199;
	Wed, 30 Apr 2025 16:52:41 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E4B49E41CC0; Wed, 30 Apr 2025 16:52:41 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 0/9] ublk: simplify NEED_GET_DATA handling and request lookup
Date: Wed, 30 Apr 2025 16:52:25 -0600
Message-ID: <20250430225234.2676781-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove accesses to ublk_io's cmd field after the I/O request is posted to the
ublk server. This allows the cmd field to be overlapped with a pointer to the
struct request, avoiding several blk_mq_tag_to_rq() lookups.

Fix a couple of typos noticed along the way.

Caleb Sander Mateos (8):
  ublk: fix "immepdately" typo in comment
  ublk: remove misleading "ubq" in "ubq_complete_io_cmd()"
  ublk: take const ubq pointer in ublk_get_iod()
  ublk: don't log uring_cmd cmd_op in ublk_dispatch_req()
  ublk: factor out ublk_start_io() helper
  ublk: don't call ublk_dispatch_req() for NEED_GET_DATA
  ublk: check UBLK_IO_FLAG_OWNED_BY_SRV in ublk_abort_queue()
  ublk: store request pointer in ublk_io

Uday Shankar (1):
  ublk: factor out ublk_commit_and_fetch

 drivers/block/ublk_drv.c | 252 ++++++++++++++++++++-------------------
 1 file changed, 131 insertions(+), 121 deletions(-)

v2:
- Don't complete uring_cmd if ublk_map_io() returns 0 (Ming)
- Take const ubq pointers

-- 
2.45.2

