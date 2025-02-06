Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49450235349
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860285; cv=none; b=kkwFhIO5FA7f5dlfkns6HeYVUKh3Ystf9Q4UH4M13fCRia01jELudQMMyQZVStNWhXstCVBdr4o2qeZ0cJL5wox/nYSg1TSTdHqZKyHsUGBBKB7l5mHum/pIkW/IJLUfxtO/h7Q4/WlTJu9ZriVDuEAbThoZJfY1+Arxm9eR+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860285; c=relaxed/simple;
	bh=Ehkkm8SvzLiNVcUEOgh02K8NEyr2KGKAhsMhKKTBK84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtcSbfe7FkXm5L5crqzQE5o9Ey8NbjtQrz/IONDS86j702BoNtGzYoSK2NPXkjn3V7++348JqBQk4G1FGr0dKv2ghrKbKaWAh+fGD7ZZt/raQJYRj6PrmTJ/GrDD+9GgTTtitNidqeP39XkX1UCb9yV3je1De/zd1skT1QhLufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI6mFRpb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI6mFRpb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so1884245a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860280; x=1739465080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf/Ds4EpZUGln/+eimumnU7Eb7n31Z+gn7W8LB7GHWo=;
        b=UI6mFRpbUgszlsmUAcUBOEzMIST58kb2LVE35ZLeu91N/qrR1FdUgj2MozvX2sjLF3
         GpRptReP01ADXKXQJUmPDCtQv1Er7Gkcfyr7f9yJGirW9dlZEAa+cF6bnzWWdxc5dWT+
         80jKhm/UHElxt68ihlYR4iVVddCQcYmDNPv9TChVM+/xcb6kd6yh95bcfFpzFQ3kZQfg
         ShFO19BhSYDZ8OKRmBpOlad8fkXfAjtp3B3CA8oJc5T2n2s/40alXzmeJy+SxTvAyNLv
         FUP33X5Zq4pt/LqC7v/oHmU95JN3Mnw0T+cVJb/9vXbuFEgC/xnZJz4V/ikYwLp0kWZd
         OKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860280; x=1739465080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jf/Ds4EpZUGln/+eimumnU7Eb7n31Z+gn7W8LB7GHWo=;
        b=tqm5S/HB8FAf67+moEMQAPOSfTY/04sr5QPUlJFhLEeQAq9ldqmreLxMQpnKJ1qrfV
         c2F6ti1mHAQ5TS7/EUx70zSfob3lZau6jNgbGaoTKZAq11NMl6mD76Q1NH/QADZJAz1v
         dzDqgY5HFQ5lyLYcdzV7OyqMOK1Mj9L6PnqbLWxaLCuMmpshnxRHzSgapSL3seSwSjbi
         KdI/+WzLDduR/GDOMUV7qfvYO0AQ3/NUnIKyiI77Gz0WVq/e9jtIC70yUCntDASaYObV
         xqjTVAgFVTMHvRhQlMf2/LurX64lcdGM+bdc/JlXph3muE6SWG9aANPZX6kk1NMFBo0q
         ukEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQrdKVN0ehLZyTmy6vdGXRmk7zgInqYcDnrItaDjm8yb9ZO1yvI/N1rcfRUJFKw0UAU61xf+S033Oro7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXEYWUDloe1ESh6CKMGcS0gJJT/JFHg8GwMhE7spIyTTdRAv6m
	/rW9AjTFZd4+gJrxBDx5HcYiZ2nVu8UkGiWaV1sMSOblKsJw0e3P
X-Gm-Gg: ASbGncujbPRRRCySPrN/y5Kkmg6t+0d9KWmYrdH067avMusFV1oz79zxEe5ozfUE3kM
	GA3tMzw/NswncjY5FRasAT092BzVp/JVQYglRyhI/oR1sSRRTr9o/zFIAfEznwSSZVuN2yk3Wfl
	JOxLPg4uLG7LOMCWTT26pD+0DLQVnyzvOuWO++kgzUiBG3h2fPY7UtTTrl3JUc84XvJA9CTyuup
	oBPAlSgPGD1ora2G4PXDpFcc9EzYZGGpv1rwcifxIxR162Q2lP5gTltAAPdGIHAY7El0/pXIF2g
	2pSOSCnqSydP/oMu69BEpBjVca3RSEg=
X-Google-Smtp-Source: AGHT+IGUUhXS1Xy6V74CnOay0lFyzNYrTzkXE8bZO/qHXUnqshtztRLnAUNY+RXEWfr45Z3TlVQ1qw==
X-Received: by 2002:a05:6402:a00e:b0:5de:39fd:b309 with SMTP id 4fb4d7f45d1cf-5de44fe9488mr248523a12.4.1738860280257;
        Thu, 06 Feb 2025 08:44:40 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:39 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 1/5] exit: perform add_device_randomness() without tasklist_lock
Date: Thu,  6 Feb 2025 17:44:10 +0100
Message-ID: <20250206164415.450051-2-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parallel calls to add_device_randomness() contend on their own.

The clone side aleady runs outside of tasklist_lock, which in turn means
any caller on the exit side extends the tasklist_lock hold time while
contending on the random-private lock.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..9d7acd7b0040 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -174,9 +174,6 @@ static void __exit_signal(struct task_struct *tsk)
 			sig->curr_target = next_thread(tsk);
 	}
 
-	add_device_randomness((const void*) &tsk->se.sum_exec_runtime,
-			      sizeof(unsigned long long));
-
 	/*
 	 * Accumulate here the counters for all threads as they die. We could
 	 * skip the group leader because it is the last user of signal_struct,
@@ -278,6 +275,8 @@ void release_task(struct task_struct *p)
 	write_unlock_irq(&tasklist_lock);
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
+	add_device_randomness(&p->se.sum_exec_runtime,
+			      sizeof(p->se.sum_exec_runtime));
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 
-- 
2.43.0

