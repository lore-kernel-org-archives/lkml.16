Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3C253F1A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465358; cv=none; b=MVE7af1ohlP8EL7aJln7eXRgclpHGH4w6Ey73464zEaJEgI/354ZMZrKBGdkCYgfh1isR9H2RTCsHPKDqr6oBJarlppt1cGHSEhraZcqqAMvb1nkKlsdP03ryo3c+23MyvEHmBPF1fPFPWYwtBLD0g1LvazoeeIpExwModfZ26c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465358; c=relaxed/simple;
	bh=tLbPoPnRW0rdPQUBzg2TyznGxUv67v8X6d5+AGG7jj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No2WTW/XE4zXsnO4PF3bShOpBSsJHXDxNeLKkb5iuZFc5O/eqR1sSLQ8p057U3JYrSdSZHeweRKHF1iAN6MLgEBcmKusAu0yWNzNU1svcQpxo4bp88JGH0prHTv514LtBNy6n8YcZFgn0R5w8vZYUdBhW+Ln6nCoeJZqm+0qpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aB90Lkp0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aB90Lkp0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3533105f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749465355; x=1750070155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=aB90Lkp04YtqzwXUFA4UTv0ufuIW1jRzPsmbdM+JR1y4TeeIVrv8gAt0q0FgMSWi8a
         75IMAxh165ev3ZIEdNBMbO8jGKOZzywiz6Kd4dapWI10g4ZHp0qDJi5NFT3VdCToqP7W
         I5SuyAqKP31h9bvMz5D97UWOGQVhI/B2eBUR3dEWoMLUErplhaEe0bPEKwFo7ahdVQyb
         tK8teeI7JNGmx7vwzb84BJ8QE7F13cU68i6yE++msIWP91onV9qcWs55o6SvlUJ/iLaf
         PaS9rMNhovqfqG9EPmX/kIbq4YLtwnro3P0dcxoEo+Nx7oudSKNnuMxK0lWPvcvHMJmM
         jE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465355; x=1750070155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPUZPI4tBuk4J3QMbJJf2HlNXfqlGDxMUfNoYa/lU9E=;
        b=gyq2HyD+Zn+N6HWKXFKng0OBEK+oXhgDh8yyt3tkNOdVVFJifP28p7XDlx+rMIGJxN
         ra+fP4dpHFv1pVOF7dmt1K//E97Sz7yEO8GKkuEpClsHVKI6b/9uK0hVcUiXeZmFVasD
         JydfnYHS5eFfOCzDWtW0mgkPxu6uCUbD8o5anQVxF//fK5tyM6dpoMtJpZ7iWbXZTknK
         BT1OCh2rAepatdKLP4KMI7M6Csk2VIXWRa+C4lmzAFEgyVGRcHaJry14rBw+1QiotscT
         qXrx/0TqT7y6aX2Wy96/EmTV465vj7t4Z9C6CKjb2i9ZwXr6swov1XX4iHfU+VH+5L6/
         /zBA==
X-Gm-Message-State: AOJu0YyrI4iGwCr7/9S702B5f6dCYUjPqdzD032oT3VBc8FQPEU/1anp
	mPbI4wEwDDdt+UMkD3RcPE/p1li8630e6vOK7fkJcmMwHPKxG3NWLCMibul8kEuVUGvLypy3YV9
	GJGUccVw=
X-Gm-Gg: ASbGncvWjSnpgrQNAFT3eJdHte+arVSMDugW8lbq7QcUW2D1JYvVoe/oCh0uj47zWOE
	v7nJR2VaO/c7Elhj6S90RR2p/tQcOKL4ds1dk6HloORQU6LDr5zefdaG0JyhI3XWC5fFhkERHVf
	jHGqt+EAoshxE3aTPKlGL94qvF2I/zxDC1YwWLmOus9IWjqeKJd5gM2EIE3pl7NnwjZIzT4Ku1s
	oGbRpD3IdFOlUDvSn0rrxsOuC+am1yrhq3xX7sZ3Pbrs/DkkxvP9mONJBXoYB4oLPvVXLZj0u7j
	q9YUPQQla3o/89FMIjr10UBWidQwGuqHWJ8Dh8NeRHiPOzt4tVR5Z0VUF00+d28OBI6cHEfD9Hb
	mqI/2KN2jEA==
X-Google-Smtp-Source: AGHT+IH+qyAOPpqfgWf5wK5tns5lzd/nbirfiuSOr/950cYVt/dHv3ucAiabSliSI8j7fmVc2oJkAQ==
X-Received: by 2002:a05:6000:144e:b0:3a4:f607:a5ad with SMTP id ffacd0b85a97d-3a526e0cc7bmr15042032f8f.19.1749465354938;
        Mon, 09 Jun 2025 03:35:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45306f76ab3sm59306405e9.14.2025.06.09.03.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:35:54 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v2 4/4] [Doc] Workqueue: add WQ_PERCPU
Date: Mon,  9 Jun 2025 12:35:35 +0200
Message-ID: <20250609103535.780069-5-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609103535.780069-1-marco.crivellari@suse.com>
References: <20250609103535.780069-1-marco.crivellari@suse.com>
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

