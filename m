Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E669929405
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735235; cv=none; b=AEN2p3S4Xx7zUsUmfbXRykIWfbwD4ShHm5kTODbiav0Z1oSoBwT2WTAvI7HsKKRLERo/TrKhI08YT7hEBzO39pVPmgLGrSC+jV0zZ3qvUJgzjRP+V4TxlcmpVdQkGTX7LqPChCoWvF7o41bi6ZAZukVPVh3WbaGMJKod1RvoLP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735235; c=relaxed/simple;
	bh=NFkyZS5CDkUYFRNmWKp+duw0yU9eLbw+7XKBXjSs2WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1IOoBsGuYi/snZGxeXnx95pAch8G4+0Y7TMSYS+/5Rgdv5DQaTFrwfIidOFYFUmrnFPm0jqzrG/UdZMZBcQ9ZPWX4z6W9p687pcxabBKTSfM/TehTJuQPaY5hwjSO/uMwtdAOs8ArXq6D6fUHP4DINeadqKsNcSB1lhWocF4lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LOOpn0eo; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LOOpn0eo"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-450cfb79177so5499345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749735232; x=1750340032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqo2hIUl7oATdskMR359oZ58Fv64g+0bL+bh+r9fe1I=;
        b=LOOpn0eo7J90v51vho7KG0KIiryLDDdxcUjz2QZsznHxqWdCTiH/OsQOnZGsDPT9WM
         2jwg1CNPKMlCBzfezmsBd4uRIkVgV+TqUGo2wPmBn4HSS9q6dCTblTzDx8nRvQoSRZgK
         jAT2gVUGv/ASPps/ayMIGA++Gtu5Z8MgY4/+tZbNm5If0lRk0oxR4/TEdysr0vd2koFR
         iFN5Xy8ZBgPOCWK1e+focNlUU9lO9ruES2Uh41u8NM4vLoowkJHInDfyBrewXpl6NUU7
         nx2lFztmXJNzXy4rOyWblEXycpVJa28vmtRT2Cd9axAwmohseU0HZSIXjLv5YdH+e+Eh
         9fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735232; x=1750340032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqo2hIUl7oATdskMR359oZ58Fv64g+0bL+bh+r9fe1I=;
        b=cDmqdQZS9PbMZb1oM2Py6BFxXyMVFNgdpMN4I4Ql4eZaOcR8IVtkE/Ny+iN5aoV0Bo
         P2R+/2adtpB6S7wcvRDY0yU3drtVAn/3QdqylGEdGzyBE4vDA7LYr9EAi5n9CX6FtKBk
         ooHisJpUHNBjiPNP3AzS7UFIcp4nkavw4rnEDIwLsTm8OdO7SMikTbQY6T+45J8U5ka2
         FJtqRcmZL5xeh65YOMS3R1Fvet76yVxo2DgaG3c+zzvsXjORSl/fBbAq069UeM7RsJ8c
         xeVV5wzBHw3KCT9sw/d1S2pkolzK01LkyD9i+XQj1yduGNAnC1KgbWXklG8xaAp/xMRs
         Xm9w==
X-Gm-Message-State: AOJu0Yx3PRsZJu/RFq/J/Ce7urZpANzTEno8W0ySAHZ6P9DFbG8OvjkB
	NK4qmvBC0a0LWWLaL5T/zxm8fakSlhTPOQqgdZlSQe+ci+uiT87PwzObCfycQhB7N/MQCK2Lo07
	1KL0AznqIag==
X-Gm-Gg: ASbGnctaytyrcB7fsG+DIsXaRh27+H7p/phexngiJJZDzfKifMBwA1Vx2/cL/gNHXAU
	C03CtMEwAEei66FRTaV7RSeHORioWhw6hJq81f+vmpZZD+zIbygZ6I0ui5P2yFlhjfBr4LplAL3
	hHMRCkWOkjC1LlJ6CcB3vUPyD0ambw44nZDTyQXlsNaJOfRIdoVzErMQQdchM1t+iWjVbqS0jVh
	SoEcrouxmJnNCVPFjYUvOWroaFmRNZlbbwpvY0SYFvOrKQMmHEG40akyLGLqVVq9wKQdiMqOtS6
	QjaRmrOWQZdr8u37PgDO0M9A4kYF7Oj7Hsl7V2N1eI3ahuxpU48zooq2D6waEFgltxij3HklkEX
	5T/5lKYsF
X-Google-Smtp-Source: AGHT+IFg7ZMlB4nZzf0x8C0zd3onSzTlXDLuRaQ6oYB+LYsKsP7mxo6Rf3Zv3/bycrBatvNmFJwoOQ==
X-Received: by 2002:a05:600c:4689:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-4532e8dd446mr20466125e9.20.1749735232001;
        Thu, 12 Jun 2025 06:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm21693285e9.7.2025.06.12.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:33:51 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v4 2/3] Workqueue: add new WQ_PERCPU flag
Date: Thu, 12 Jun 2025 15:33:34 +0200
Message-ID: <20250612133335.788593-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612133335.788593-1-marco.crivellari@suse.com>
References: <20250612133335.788593-1-marco.crivellari@suse.com>
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

