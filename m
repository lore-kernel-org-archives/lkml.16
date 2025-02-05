Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62832204C1A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783980; cv=none; b=O66CKKoTC7v+TZdo0qT7GiZbpNnh8on3KCQPQVhYKdefmrmNmDCOcbyN6KeQUgO8IBwXsaBenw2gd9vkLTV7a7ExoCngwtEb7akZUHcSiC+cuXSus1hTPrbh8vsXbzSW0wc8JMabQ9LotxfGeBAxV+RukZCwSfbcQlE/yaaeY18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783980; c=relaxed/simple;
	bh=u1/C41cpJZDEVRS9xe53nZznXNtHE6e76AZASQFjpp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrM/5LwlgQCR2RJZctprtaamYEvx88M+N6YiKLOexPTps23fcDVy+8eHfV5MUOVy6a+/ZY/ZK/xaDdBfSLFHg+Mvw2WGsFkQ0azdd6ObzUXOaEkC2piO0kTEgt6lC4oH82lbEyqZ3Fe8wMpQ4GWvOVqxKHozAo6Q71KuHC7Fu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QB8KJM50; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QB8KJM50"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaec111762bso43309366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738783975; x=1739388775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPv5JRV70JrMhtiLP6t5DX+MOk6OWHK7l2xWpSMj1JA=;
        b=QB8KJM50ZclZR9J4Sk5SI5qqEPgoEBAR+a36IxJ7S0FRSZ5qfWbFJ5ReFh1vXZi5GQ
         uXI+V24NfP6QG4ifARrsxArq1bz4VPmOS5eXtlGn/q8yYpfgdXXy7LfP+WPGOt3MK0Ij
         usfZ35iZKHvqQwXhI21wO9gsVJIImJwb4Cfn0jJdeRzE2mYYMcrbdujvAOw6ZS9EUhNV
         Dc0MIhwQp77DXFpaQtwhE7x4UDNbXwK0iDzPAQwRX/SEzovKtQZy+YXLZqCVU0qggaEN
         9XnV6XCRPCnaaiJReSEV0lSBgF1i9Yiu9m9gKNBGvvJIqlzzNNqXEb2hI/BrZH5R8yg+
         Ns2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783975; x=1739388775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPv5JRV70JrMhtiLP6t5DX+MOk6OWHK7l2xWpSMj1JA=;
        b=ejOs10Po78q6xlblq1W7JWM9C9tT1lkQxwUhVcxZFZ9GQX8PFaZI0Wf9nw0E2yvqrr
         EAEd02e5sRhwvXwB6kNXHn/XAXDxLzag7ApC38StJQ4Ow996bKTHAqzenxlWxuj62sxb
         x6I8xBExRq8Pu6LCuSAFl+xaplyN3sstvvHl2B3dZ4w6DGgUmke2ISNzzOQEjASdA8u/
         MPykA82/uRRBKxE51KN3w96q2o82ZVI247O/oairjWoomOnJIor/46b9FDwMWH0Nb5Gq
         164VZiJ1K5kihOKskT4O/JlfwGEkCKwmpzEa80hbOaPDk8pdVdSWwd7/gjg9Lbh4ze8A
         wlZA==
X-Forwarded-Encrypted: i=1; AJvYcCU71UAdH/5KbkoDArZSyzJLpezjHC1DNsAzWCiydNqkz5zR3pxP6Tb4qzMBgOmYR+fKvEPd1lvql55NbzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGwn6zwfANDcFgjt1TyKlfnGjI9HYhfraoLmCAiqKfd/tRUWWt
	s9wZPE/4G3kexZyKM3kvMfWwvnUD9TEmy5gSsbBFW7xMpng30QKwhHBPMM0j
X-Gm-Gg: ASbGncsnrGJ5DKHsCFl94r3TuD/UqVHds0bU4bU1ZfXEOPTcSqWKchKbGp1O1l6uvp7
	OIXvCjq177ZXL8Sapeu7QupNygXZtgbWu4gM48vep7a8Lv6BWTv2wehpMkFqtuQpBgHa7BZ2Ez8
	PeZfPqmqymZfAHKVgeul+kHuGYfWHT1JRPZoLI77Z3BcVZslFy9cSjbEOJ0O+FaIF44gOoE3mkE
	Xx/vODEjB8bCTv+IAqVc3SjSUaghdDmtZUXMQ3EiprFaT7kvkj8SwnlWFjAXlsZFHW78Z/CIs1L
	+S6C5pJxfrXoQDPUj6C0WfulJOYvzxM=
X-Google-Smtp-Source: AGHT+IFQbmYgH78qzWyrya5Ebjacufa28BHh4ai61VrblS+KkRRo5Gjsy6KS34VsxBfHjTdhyIbxdw==
X-Received: by 2002:a17:907:6e88:b0:ab6:d59b:614d with SMTP id a640c23a62f3a-ab75e25cb41mr444603266b.23.1738783975276;
        Wed, 05 Feb 2025 11:32:55 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06e5sm1167625566b.63.2025.02.05.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:32:54 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v4 1/5] exit: perform add_device_randomness() without tasklist_lock
Date: Wed,  5 Feb 2025 20:32:17 +0100
Message-ID: <20250205193221.402150-2-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205193221.402150-1-mjguzik@gmail.com>
References: <20250205193221.402150-1-mjguzik@gmail.com>
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
 kernel/exit.c                         |   6 +++---
 scripts/selinux/genheaders/genheaders | Bin 90112 -> 0 bytes
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100755 scripts/selinux/genheaders/genheaders

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..c79b41509cd3 100644
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
@@ -278,6 +275,9 @@ void release_task(struct task_struct *p)
 	write_unlock_irq(&tasklist_lock);
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
+	add_device_randomness(&p->se.sum_exec_runtime,
+			      sizeof(p->se.sum_exec_runtime));
+	free_pids(post.pids);
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 
diff --git a/scripts/selinux/genheaders/genheaders b/scripts/selinux/genheaders/genheaders
deleted file mode 100755
index 3fc32a664a7930b12a38d02449aec78d49690dfe..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 90112
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

-- 
2.43.0

