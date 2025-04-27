Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34F1FF603
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745028; cv=none; b=QUD4jCy92xFwWm23ICW50usS1jHHfJwBhO1rKxRz3r2jof4rGurW1rqhfNjeKIy7VSbQkuYccueZSkfPQoJGVZPuPqUNusqZ685A/G3dtK5j5dTXjcaNhgYoojDfJBCVc1Tx9XvZTJ4446hrG6BiEeGk3MeDlf5uevwvwYFdfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745028; c=relaxed/simple;
	bh=16zZuOREEO8zAE2MxwctmD9m23Nr1GKeG/cqgGw+jTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLfi4vUuPdtEDRx08YLELtQw6MT0QjKwh05yAO+PwMB7l2b6N8FK3qmkUcZbSEseMqm6FillEz9h4ox/VuSSqe4xCXWoW/CKBn1TLBZAoYE1bClcR6GMU2ze7w9l6ZU98+pNw7lqBPw3NtlA5qhmjnhLUlIH1luqu4wIOqxHHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJNLNijp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJNLNijp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2304080f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745025; x=1746349825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oL2ac8cldkD062CLsNYaAT3sZgR6JRshDXAxBdXOpPE=;
        b=QJNLNijpF/Nuu5UjsVZ6rltosngCUMgbZ9tzaoDz5OlhZ8q5Xgg+Ip223O3Uj+V87O
         OCMtjHqw0ZeoMKqoZenNm5+arr8xew+uRPIEInyBkxyk6WVQLS9cVyBnFz1PxBmcM8Ih
         BlnHrxpVRPTX301vWSPHIMCQalGUms/C41frrIMxd7dPmZTsrja6gdySooSX0L0KqO+o
         1/LilGUzk8tST2OatlUbm1blX67rAkGriixD24IVZokE3ZmBpNUIwy1hLtiiiHeo85aa
         FImPGQ6L75Cj7kaQt1REpKDcL58F4VShiTLEpuVIgo0nfY+WuvwQOwI17u8oyc38hnLN
         /mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745025; x=1746349825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL2ac8cldkD062CLsNYaAT3sZgR6JRshDXAxBdXOpPE=;
        b=JIzkl/3gFyQxQ6p9RhXpKRxdGZCBZvybGpyVR6DoYgLCjgamVsf3teuXtpHCgP0x2D
         /mrLgfk6P4tl9ha5hHTIqjJnjKLfzhJ1P1yC9hR3Ud6X423P35s3hFrEVdxWUmMAUbqa
         AFm1O41mGAnvcbWg4Pd+JVcfQ3i5LwIOfOsLX7ZIJvz7rLvOMU69W5n5aKLtY4kTacm7
         kGgkZZQ45JpR78yssO2nicG8skpeX62APRFG56/rJpG06SM+WJtArytggGgDk9sa43ng
         Q7AZTytdW/vN4TlZ0TkrG/AB8ia3KiU+5nJ1bP0D1/8eYaWHDgJDvSe11JK/uTfcWasE
         wJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCWUxHMMstJcEeeK/UxlmMnhbFvBDY7vmSl7Ub1hMHWCZ2eKriexrVD57oSZ8DjEJW7/IxYA3ohXwuYby34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmG7uqFAPK/eAZXXbYud6PhhWuDqzOKJZarecTfZC4QH/V47Z
	tNDJ47RxCpiChB22RjUL1JD6+ZlYvERmsBPx/VJH1CNvfVsPly+L
X-Gm-Gg: ASbGnctvzTxu62U+rqLtC0LIyfVwplEI4sblReXWZJr3OJ9Z0x+zXTEuIKm6Ets1rbO
	yBDiTjWf+oOKBjzHgPw7zXYgcGrIM9xdcZffgS9yzed+UT+71Roo/WlxDLlqjwaFPbXqckGPJne
	eJ5Db7jlkFUVX8EKinGagVTbsIFvhiNOItWqTE3fq9XjO7iqJ+Q6fMEXABzNyEM/qscsIHvyeUQ
	4U0LXgg1K5KaYOUPKQ1BAN0RqkgZ4ROB/piB2p+N4JvTui5aqsHcj17A8dccb55nCuGfLxJdpAo
	tl1O5n0D+Qe0yDAAWXI1ujuRmFgust7U/aHJxomQJm8W57KsF1AXgsF20jyjArp3GCIKbjpA/OV
	J
X-Google-Smtp-Source: AGHT+IESUfX2ptsrB4Xo1jgoKXtNRa8X7AzqQMeu/32SKwXQvoFBEuUJYdSVstlL0DtoFdj/QzEvfQ==
X-Received: by 2002:a5d:5885:0:b0:39c:266b:feec with SMTP id ffacd0b85a97d-3a074cf147cmr6668943f8f.7.1745745024830;
        Sun, 27 Apr 2025 02:10:24 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:23 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3] staging: gpib: ines driver fix and cleanup
Date: Sun, 27 Apr 2025 11:10:15 +0200
Message-ID: <20250427091018.13705-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address some outstanding issues with the ines driver.

The issue addressed by patch 1 was exposed after the entry points
were declared static  (patch 2).

Patch 1: Fixes an invalid ifdef config identifier
Patch 2: Changes the driver entry points as static
Patch 3: Corrects an unused variable warning

Dave Penkler (3):
  staging: gpib: Fix PCMCIA config identifier
  staging: gpib: Declare driver entry points static
  staging: gpib: Avoid unused variable warning

 drivers/staging/gpib/ines/ines.h      | 44 -------------
 drivers/staging/gpib/ines/ines_gpib.c | 95 ++++++++++++++-------------
 2 files changed, 48 insertions(+), 91 deletions(-)

-- 
2.49.0

