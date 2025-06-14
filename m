Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC152D1306
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908142; cv=none; b=YbhtNN0cvYPEGxh3hCvC708eCH04i+idXq8pWzmospK1QrCjU4KcsvxQXXzhbdPo1GA2LlI9eIt1XiNyIRUwuFR6/ZeKuEu5/WAmIkyEm33oUyDXJKxD5S48+rLMaDlkcWzMwXtpGTAnktcsG1ciGHBsG+9lZCeIPLMIXQfyH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908142; c=relaxed/simple;
	bh=NFkyZS5CDkUYFRNmWKp+duw0yU9eLbw+7XKBXjSs2WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMu9eJnL/dyjizhNced2E5Fba5TwwUVTNEkA+zHr7vOvUfsD2Ci+A9wylxr/fTnE3CI5N2WTTQPGAmqXx272W0xTPLvtQaJerRn1GSDYT32leFfhCd4eSbZJ4fT+sYHSw1BlTjUY8cGDrmsvamEPQqPusajbKEk5nh7n6s47cW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=at29aPXW; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="at29aPXW"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so25234005e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749908138; x=1750512938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqo2hIUl7oATdskMR359oZ58Fv64g+0bL+bh+r9fe1I=;
        b=at29aPXWvb4VJg5rfXD6D7h7/u0cWw4RBra9t5wI+o9aAmOZLuPp6LrLibIGZwcaJw
         NrWm1Kw91LxQ3Ge+9kTzfaEH/8fsn7qrss/5q6k8wWkEJd4otAuACAmcFggYrueUsUUD
         kMA0ywVe30KZ3b8TEP9PXa4bBfgMvoLKRpRdR281N9IbTPkHQN/gwHJLNLOwD5905QrB
         100/sIUykx71DzjBOe7zIU4yGoR+PhrXIy8DGvVP+/sm+4eWIDtmQ2AQxSRXVB2WNjwl
         6HM+vksOdmBUhcFXqWLQf5PV8bEJXd6BU2jJd/0+bPzy6sf0S9rh5Hlrv0wIlWegXcMJ
         14ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908138; x=1750512938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqo2hIUl7oATdskMR359oZ58Fv64g+0bL+bh+r9fe1I=;
        b=NtIgeJIpPBPvjolQWRli2WO97HKacBE75AThhJFE7Txc9nXiB1JbRl8CCYK9hnSqP8
         yal77ua5M1QLGInm+BoYCcalodwQb6mLChJQMzNOmscSRglO530a0CFf2X+Mmw/hfK0f
         0aGn2Lf2Rzkkv8FEkPivICj8ltmyIAV2XUq7YNx+GZ1CGwDyrWbopQlhi6XnTCNy6vZF
         ndG2cFSOu/SVP59Lq6AZwgkM1qKSiHT3Nc7nDCNhr+lg5rphg23I0tFS+ml2xTBTyXx6
         SVcQulN/CNier0i97mc2VvI83xRNNIZ3QPLCaXKTvHKE4UQPKBk2vu2GJvytnOY0Jpe8
         yEuA==
X-Gm-Message-State: AOJu0Yw1rm4h9Y+HkMKTR8r59GDGDdA23zhs5qoNmNCQuNBCbtiNxnfC
	71/1yuE/6hINLorrwRbNxXh0Da+sRjz4wzsc53th9SBjUP4uLw17xNXm9Q80kaRPnk0yzTt+5Nu
	h97lEiotH9g==
X-Gm-Gg: ASbGncupRpNfq+dwRuv8RQLjI+Ip8sZ0F2lnoB3gB4TQtNVCHvCKyZE6KSnIVH6syGx
	EICFx/0ISjlvkPHXrQ5xmqd8rfTlsMaxbCEOMgwjHIG318GBqozrz/F8fjCaZqjLvMihdNOPWv6
	26SxgQdF13CoR82W5K8vQhH0y/30nj3bVPkpdwe0M55lnfnVu44ggfcx9mqQ//IN92frl5GW6MZ
	5ieWM8o8Wq2sZ7vVkSX2G4A2g4ho+THjf/xCGU6KIGDxY/rv7MHz7rbjaoGe+PyXUqwxjiR9Fdp
	oD7FRHaTjTcbuhKVlw3FKYMdlaro0u27Bqx/F1a+OtmAPetVO6bLOjQMompN6VEBj5ZF/xFHJ2/
	5Wl/fmJ4/aQ==
X-Google-Smtp-Source: AGHT+IGW1ZHZ+vxMVSmRXsFu/G5sAloN7qEQJJ2vzSa/7KxWv4I6eq/JUsQUQpKYExEv/XnaMDBoJQ==
X-Received: by 2002:a05:6000:2011:b0:3a4:d975:7d6f with SMTP id ffacd0b85a97d-3a572e91b3bmr3094299f8f.39.1749908138260;
        Sat, 14 Jun 2025 06:35:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm5306744f8f.67.2025.06.14.06.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 06:35:37 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v5 2/3] Workqueue: add new WQ_PERCPU flag
Date: Sat, 14 Jun 2025 15:35:30 +0200
Message-ID: <20250614133531.76742-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614133531.76742-1-marco.crivellari@suse.com>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

This patch adds a new WQ_PERCPU flag to explicitly request the use of
the per-CPU behavior. Both flags coexist for one release cycle to allow
callers to transition their calls.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/workqueue.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 502ec4a5e32c..6347b9b3e472 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -401,6 +401,7 @@ enum wq_flags {
 	 * http://thread.gmane.org/gmane.linux.kernel/1480396
 	 */
 	WQ_POWER_EFFICIENT	= 1 << 7,
+	WQ_PERCPU		= 1 << 8, /* bound to a specific cpu */
 
 	__WQ_DESTROYING		= 1 << 15, /* internal: workqueue is destroying */
 	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
-- 
2.49.0

