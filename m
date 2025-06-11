Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43967284663
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647703; cv=none; b=u/6rGrtoHYts8CuaYtLeLvMlifH2R8jlOtjqDzBfruPmTryB/JM4L8V+FKBke6ugxrFwaGCOrqgDHhdtANLQnG/fIiFlWiyuyNXAreyt6GxVjkaN0g8sPDpRfTskD6Vh10oRfkqz+vSHh5I/m3v1AIIlpXNOJ2AaPF+Y9EdtgcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647703; c=relaxed/simple;
	bh=nVIfEjZaTpZ+Ut2MwZcCo8MMWQ9Pb8niIhxzCWk4rdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3r2glPYqb8AKvNzUKRnPxiHuiWvd7RGVtQO8mAv4l+aIV6hDES6No3tINdb849K9OvZJjLPIHS0qcVMQe/o8lCz4hYHN5nhY08CZzhrYZ1dVthD5RJS9QUwii1DHD16cFHA8h5KdAll4MMr7lDEJEidf/hunKQA/DgC/1jZ1ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QdRqSx65; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QdRqSx65"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-45024721cbdso57162005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749647699; x=1750252499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PscFTZIFJAAdYDBzEvyv96+pEf2Tq9pY8w9RxNVdTSc=;
        b=QdRqSx65Rmj6mJTY8Hdfll56rnCUSEzq39uhhrQnR5617Skva2Yioz/BeEtda9XErv
         Uf9btPH+yP50IMykW8QbEFEzs6g63TNNVU51X8/yqpAWhE6f58u17/Zdx/QA7CWrAxxA
         OGshPIJa+rVVBaQNUu9qH1wgy9gP9K4ETuK48XHFXQ38FjNixyFLqrxsREd+LtLSoN97
         Ue7+Om98dWLhVSZPJrtc/XB+xkuaQajbB0vSrkQYSwtf6EFr5m7tv594sCr5ksjPmUhk
         UcI+BFSfmyLw+kP3LeWYXgfIQT+m/pWn6no62OZdyDxcCmiqp1DsuFH6uc+jc8HAuG8U
         3FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647699; x=1750252499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PscFTZIFJAAdYDBzEvyv96+pEf2Tq9pY8w9RxNVdTSc=;
        b=l+GHc/X0Xk9uX2gDk/hJqCIcN/w5GDiVSEckIdmS89MlfLifYiryz2ie9tk8dMjDmP
         Vt5G6fnRwN4QNAXUkDUSlEQ37Gk+zcrlKA4csier/wfslLF4jPVBFH03cVN92P/5u7gy
         T+vQU/6n7ypM5fONrWJxImkHuXtwJwuValtQqUz/zQIr+RwjvIdhWEYBDlm8QUsPtCLF
         Ylhuuypw1d/eCgYSJbtltVQ2pqeXFFhUauG2M/SUC4DjvO5p9lDa1Cix53F//UW7Ma/7
         O3NM6FnlwbsoONi+C0nbivpDu1yylx1r4ePc1eoHeGsrIJeUZDFpIw6tURtENnQaTkyk
         uiuQ==
X-Gm-Message-State: AOJu0YxThdkLlL7vpb9Pii+yapjyug/aFR7hYZbMsBzfHLgToQdClmDX
	0/vr/J2HW1aGlntsTlGA4sIoZmqSPKB3lqesNxns82emv4vh7b/KyU9rz9vfmc2jKkvN0hEA+JZ
	T7a9WjiyRcw==
X-Gm-Gg: ASbGncv5J29l74i9WbSclmvqw1yPLjuc+IihSMN665VfO1Xm0Qa5Y0cPGX+xGJ7Kn/q
	K0DQKpyOgYLOQ3Sc6yFGXL4Fc0bqNB8w150mTFi1xHTq7FVZJrxSvCeT7nfFEEPdxgffrH/Pz0n
	fqKAQyjCuWiGMHmvUUeG2w/0l4/KjPUunqknlKUcSVNfPQruvpsvDblK0QTzjd1tR0eHkyGxESl
	VOt3ciwL4p8qoqtyJJ05cA5TRIQAmI2pD/n87k0zIVvxiiRI9198OM7dlxFIPxKn6Av/hjRVnlO
	i/gi2uxazqw4ZwYvHUPwKALKamYYV+R8pbD4KIJqzS4hT3yLGbiDFEJj1j4SijI0OU9P/vwQtrQ
	e
X-Google-Smtp-Source: AGHT+IG1115VZ2PzUMMt/1x6yp9tkesGeamxa+JO/G8f+DST/xKInuoPDQ74pjg/Zw1Kzc6ICG7pzA==
X-Received: by 2002:a05:6000:144f:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3a5586f2792mr2812902f8f.20.1749647699340;
        Wed, 11 Jun 2025 06:14:59 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm15300103f8f.40.2025.06.11.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:14:59 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 4/9] Workqueue: add new WQ_PERCPU flag
Date: Wed, 11 Jun 2025 15:14:33 +0200
Message-ID: <20250611131438.651493-5-marco.crivellari@suse.com>
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
index 79c21fbf5896..90258f228ea5 100644
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

