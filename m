Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3836288CB9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647708; cv=none; b=pnJQRX3wyedJaY7Bayke0dTNKkdTwQcLxpbmwYlMvXipVz8yFkZM5P/17sguiUMX1EkB/HSwXj2kWua8qtvpPEZPBhFymNr9ebo6NmPqfATlPhJ4KlqEV7gg4fsmG4GfG+KaNIaI74Io8briMcZBDBT3+cVaub+ssoqdiN1RTuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647708; c=relaxed/simple;
	bh=tLbPoPnRW0rdPQUBzg2TyznGxUv67v8X6d5+AGG7jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEcjYi8PE2Hw0iAy57lpzeGi8+6k7wZa9ICJc3CBtp1/wm9IVHcBt+2wMiiCBu4sKZOnwH5ovNfvuH/PTiud1xyDYWg6zoYEFYnCIhBIVce6kkTZFeAc0reKu8wmEfTkO7G0zGj3q/d/N2Cf6K3hCHcqM/oVWgJlINeumKtv0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BRqCiJC/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BRqCiJC/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450dd065828so46478705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749647704; x=1750252504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=BRqCiJC/ED7D/BnCt1SExf6DJ4Qlh9W4Wt9571YhEn7lPwdVZAuN7tMxM2/6fHoGQs
         Sivb2Og8xm6DTIqlbIzUyCnUIwTC43RPSGUQE7MLKTxmSAiz/bqn24+nglW/8i4t7AIq
         4HwGShV480CVTHyzcJMQ2TBCHMWH5Qneu2DXXO1dzQkRuCEMVscOCSxe8b4OyXVCMfql
         NBZeH6oc+GVve9ea4nb74HC9lf4PQMheYJL6mCne46kihrTAAgDefD5naY7HvZfE5xxs
         ZgpFvbiM5HKCvtbkawTJaO3rPuM2noWepIRnwN9TQjBkX5pzKmyNS5FT6fXkHwJxSzTR
         d3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647704; x=1750252504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=BNhPYiA578bsnaWFa2Nic6VFjWcCoKK0z2QZKVbjNm86QDoDmXuJ0j+CF9HzoCfJA1
         GkCwdlVaSpCSf5imTk7/eh3QGUH2EzDDgvp06zGwjXeZGRwVDw64DCz4xIa7bXrmRinH
         yiFuOtC9ym45YzgfgL5a6jJmhxtn+3u3Y9kNNk6XLXEbVJGZDXG1oXRtBovTbmDKniEx
         hZfPK70jlTzTvXXYfdtAKPdHCU5ijUu3ojpKRyIXCGEI51ddCyfzR3hlvk06EV4fACav
         K/T9e7dHb28yzwaYq+ea8hxnq7sYtqloBb2QEeWaOPcuJGkVYzCjDKXVy5GU3JcWPD0G
         ODfQ==
X-Gm-Message-State: AOJu0Yy1wKBhKxRm5NVkbNdBvomaxBbbjxp2uDGlCz/Zsa+90iSOFP7h
	nKKiUHiTKwbdeCFTk0tlMhuiFQ9lILwDId41fYgmXsQ8vyUmk5Bubudkf8jYOtIWuBtxZ5601dh
	O1kqDgH0=
X-Gm-Gg: ASbGnctxjDeQF28v55AArLDCx1qDu0HWhfwJbWJYil/LluvWtUa+B28R1Uygv7wVp4Y
	f5pViAhneO1PSinxuozqoiUOivfAoNoCOJpCOriWp28c5l9KyyUCt9drsuP3hsON0JDY+/xL43i
	NdF2LhdtqULus7+Fk6Sg1vdwawb0WUlAW+LcU5fZmfkgzr7HZ5qtL4sHfNzVZX1f2GvXitHM4YK
	UM1VSoZSU747Q5feCe3PQEPImAwp5GYMxIyVmCoKfL6yAJNKPc8arzKxfdyoxxAgljpdD83FHk5
	dZr58DEb6HauaYYo2e6a54nLUu+ILfiNAT0u3uZyArISYypI0XeGeVTfCznK84fIMfeKManatm+
	H
X-Google-Smtp-Source: AGHT+IEDCQXxb6hkl/L+k5lu0tdnhu90d/ndcY03SjkvorXEs0B7lerwGmcwHVSlMoDBZzRju5rICw==
X-Received: by 2002:a05:600d:3:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-45325232fa5mr20984545e9.5.1749647703983;
        Wed, 11 Jun 2025 06:15:03 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm15300103f8f.40.2025.06.11.06.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:15:03 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 9/9] [Doc] Workqueue: add WQ_PERCPU
Date: Wed, 11 Jun 2025 15:14:38 +0200
Message-ID: <20250611131438.651493-10-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611131438.651493-1-marco.crivellari@suse.com>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Workqueue documentation upgraded with the description
of the new added flag, WQ_PERCPU.

Also the WQ_UNBOUND flag documentation has been integrated

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/core-api/workqueue.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index e295835fc116..ae63a648a51b 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -183,6 +183,12 @@ resources, scheduled and executed.
   BH work items cannot sleep. All other features such as delayed queueing,
   flushing and canceling are supported.
 
+``WQ_PERCPU``
+  Work items queued to a per-cpu wq are bound to that specific CPU.
+  This flag it's the right choice when cpu locality is important.
+
+  This flag is the complement of ``WQ_UNBOUND``.
+
 ``WQ_UNBOUND``
   Work items queued to an unbound wq are served by the special
   worker-pools which host workers which are not bound to any
@@ -200,6 +206,10 @@ resources, scheduled and executed.
   * Long running CPU intensive workloads which can be better
     managed by the system scheduler.
 
+  **Note:** This flag will be removed in future and all the work
+  items that dosen't need to be bound to a specific CPU, should not
+  use this flags.
+
 ``WQ_FREEZABLE``
   A freezable wq participates in the freeze phase of the system
   suspend operations.  Work items on the wq are drained and no
-- 
2.49.0

