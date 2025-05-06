Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60A290DA3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505262; cv=none; b=JK/8/usEHMxtENT22CbwnURtbLYfnkO9/Y5yF1DejnOEXaWbTCOuckDgubqxNqnktahuvRkpx8tDY0Jtlk5AfbdpPtk2d/KtOo0EItbhI0PWuXyn+rfAlUAK2wtiVNM6Hla28+RbgKsZFeM/vEEocD9Y5iwXzpZtMoFJy/ePt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505262; c=relaxed/simple;
	bh=DNwVyTCcOjrl4kbNqvDRwjBggTFRm5nqgPRq9w9xVEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dsf71Otr2nVGdGOnKBeKs9RMi7A6ccBgTJMdIYHuxrpakixeF4OXoUvG6oagYxB1VcHTU9UocvBpScSP/ABxGqkM+5xqHRd5+pJVTd9H4WR1dOX8PkrYTVwfIWH986uqv2jy1lUJkfB6pa1UpyhqA6/Px0QW545JsnfGXoba0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvQnlIm9; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvQnlIm9"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47690a4ec97so65817941cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 21:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746505259; x=1747110059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3OUeV+ysAiL6au/JA8NItOuHiGPdhnma0mnX2ERy5dE=;
        b=fvQnlIm9c6VFvjZf6rfL8S85rROt9HjKYHNoQM1IAAAj1l4SOwPdx9YmOtMIStuzFZ
         9+MYQ7CBnTusUoa85hhgGAjTsvAyqjlSkrTcwySoneQm3wCUNzR9Whrx8U9iL8kfPGNP
         5tDXV46+a7Epe1Sqe9FGZKie19aNfqUTQawsd/ONPBRlA6OZcg1j0Bgytu1DR92bEnAw
         Ci4/z6CoqO/C8f1esHGw8gDiWrqxwvGN5Y9FR9F0azj+R31jyQwK3yqA/ih5zI/nCuGn
         9n9W5+vr2v9k6acmkhUXdQDoh1vMfb6oF8l17p4bepK3xfIzfqIQzHn1posLApRqH57T
         n9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505259; x=1747110059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OUeV+ysAiL6au/JA8NItOuHiGPdhnma0mnX2ERy5dE=;
        b=KuSRhhFgS3ddoaaPDPRR7xNTwMidVfQhQdpdqyQpViH8CNW/cSXnSP+OmgwyqQhozg
         dLkBfjh3Pafz1FGFg0WzHtR9IvzpwTOGmthICJvgEoHzL0IfVeUKSQHQ7Hm49y3/K/o8
         cURKT4AqI1BTy34nVL/HtzyuHvwogASlUkEaMYpenxOjr+zkRBbb0IlPr2a6qEKsNgFx
         af3128aEJROf1CC1hGFMDdhZucczW4MiiDBeYqnSuWr/01rVVdrAAwd8c/ictSLC/wm9
         UN2e3XrToV6DwlkwIEWzqiaeHPhzRdCuym5Jl8UQ7ajrjFd7QEElyRWhcZhWs+gxm4OR
         duyw==
X-Forwarded-Encrypted: i=1; AJvYcCVoDHK3rF9ruvafUD+PxEgvKM2DkLExqZJ0yo/cw7mkToslJA2KMNWJ1Er4Mm+TjooNO8EtTDiLUf60Cvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQY8/UKJJgneNjTJ/Jr2L7TdRJ60bm1wp92YxJvs03sEx7f4H
	neeeFD6K16btfoIUsdXLxDyKJEXyP4zBTsrovyU1Wl6N9zENkmgt
X-Gm-Gg: ASbGncvIxD4kmb+r5hjGEFR7Ow6cw7NW6IP/bk5cpOUQgNfoCoh7RR4jScJe0L7as8j
	QYtiEVi6dpejdviPtnPF8oOuzhmufpfdm6hBIw/lD6gS9XO0j8pHnJysD2VBwHglSezbiysG60n
	BQJ+pfDDaUp3e0C2VhQh2BV5mMGlZGMeIRSkJkDbT0WSOV5m/ycvVNvp4koZq9/ExACUlYYUTJv
	dCSk+rs/whzA08JI29kUJIgc4kJTxqu6BqCeiepGEPc3QJMR267Cj3m0LI9evmBCZXPu5O/b8iM
	d9V07RVYVVSluavn9eQU+z5Jaf2jn/xKRqRdjDaRxQJNVp1yUQxwLsxHQa6DKB3luQbJsicGkaQ
	6DdsRYLTsENO7WhyjqLm3osbAAXt6oyE=
X-Google-Smtp-Source: AGHT+IH+kp9foAY4t6M00GAm1xmuSa34/5hEqfuNRr7JNPk7Jcnx40ELv8vv/dVN+mrv6oEHsbe73w==
X-Received: by 2002:a05:6214:b6e:b0:6f4:d60d:dd29 with SMTP id 6a1803df08f44-6f5157301d3mr260126456d6.5.1746505259319;
        Mon, 05 May 2025 21:20:59 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f5a2sm64779936d6.78.2025.05.05.21.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:20:58 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F2881200068;
	Tue,  6 May 2025 00:20:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 06 May 2025 00:20:58 -0400
X-ME-Sender: <xms:Ko4ZaMgPP7XTm9JDldWMUtgjftDrs8gC-yE4y0ESDWEH9rGUqukB2A>
    <xme:Ko4ZaFCEXRj7l8iIGSjmNvtN7TQeMyre3tkYb7QqdOf_LvDVAP8Q_6lLkTY-CmQ3b
    B2D-jBnp6MLWN923g>
X-ME-Received: <xmr:Ko4ZaEGO0bW6YE_H3opl61GqDgZ6mWsdvqLqlbJvW--_qUkvO0wHiX0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffvefhhfdvgfejgfekvdelgfekgeev
    ueehlefhiedvgeffjefgteeugfehieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvg
    guhhgrthdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtg
    homhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:Ko4ZaNRj13baRJ_Y0SrYnJp1h3QVytSxLtgxhQtjF1B2oOtEtQfd3Q>
    <xmx:Ko4ZaJy9GTmMM16Z28MiViZInBXNKHMQuTHapAJwkPvurvjtZlXIiQ>
    <xmx:Ko4ZaL5_BgXp-twMn4bztYu_84W_8pRdj4rnld8k1W9ercNjmH-d7A>
    <xmx:Ko4ZaGypTvSW0kYqtJT5LHQ64RjlWkbd0gy6XkpNnjH8uKg8LwCPeg>
    <xmx:Ko4ZaNj39ZFunV5MCxjUmt5oTu7iwaNuTFK_KqJZt8o6ptkSL25zbmx9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:20:57 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 3/3] locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats
Date: Mon,  5 May 2025 21:20:49 -0700
Message-Id: <20250506042049.50060-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250506042049.50060-1-boqun.feng@gmail.com>
References: <20250506042049.50060-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Waiman Long <longman@redhat.com>

There have been recent reports about running out of lockdep keys
(MAX_LOCKDEP_KEYS too low!). One possible reason is that too many
dynamic keys have been registered. A possible culprit is the
lockdep_register_key() call in qdisc_alloc() of net/sched/sch_generic.c.

Currently, there is no way to find out how many dynamic keys have been
registered. Add such a stat to the /proc/lockdep_stats to get better
clarity.

Signed-off-by: Waiman Long <longman@redhat.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250425001155.775458-1-longman@redhat.com
---
 kernel/locking/lockdep.c           | 3 +++
 kernel/locking/lockdep_internals.h | 1 +
 kernel/locking/lockdep_proc.c      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 58883c8375d1..e7166ff64681 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -219,6 +219,7 @@ static DECLARE_BITMAP(list_entries_in_use, MAX_LOCKDEP_ENTRIES);
 static struct hlist_head lock_keys_hash[KEYHASH_SIZE];
 unsigned long nr_lock_classes;
 unsigned long nr_zapped_classes;
+unsigned long nr_dynamic_keys;
 unsigned long max_lock_class_idx;
 struct lock_class lock_classes[MAX_LOCKDEP_KEYS];
 DECLARE_BITMAP(lock_classes_in_use, MAX_LOCKDEP_KEYS);
@@ -1238,6 +1239,7 @@ void lockdep_register_key(struct lock_class_key *key)
 			goto out_unlock;
 	}
 	hlist_add_head_rcu(&key->hash_entry, hash_head);
+	nr_dynamic_keys++;
 out_unlock:
 	graph_unlock();
 restore_irqs:
@@ -6606,6 +6608,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
 		pf = get_pending_free();
 		__lockdep_free_key_range(pf, key, 1);
 		need_callback = prepare_call_rcu_zapped(pf);
+		nr_dynamic_keys--;
 	}
 	lockdep_unlock();
 	raw_local_irq_restore(flags);
diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
index 20f9ef58d3d0..82156caf77d1 100644
--- a/kernel/locking/lockdep_internals.h
+++ b/kernel/locking/lockdep_internals.h
@@ -138,6 +138,7 @@ extern unsigned long nr_lock_classes;
 extern unsigned long nr_zapped_classes;
 extern unsigned long nr_zapped_lock_chains;
 extern unsigned long nr_list_entries;
+extern unsigned long nr_dynamic_keys;
 long lockdep_next_lockchain(long i);
 unsigned long lock_chain_count(void);
 extern unsigned long nr_stack_trace_entries;
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 6db0f43fc4df..b52c07c4707c 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -286,6 +286,8 @@ static int lockdep_stats_show(struct seq_file *m, void *v)
 #endif
 	seq_printf(m, " lock-classes:                  %11lu [max: %lu]\n",
 			nr_lock_classes, MAX_LOCKDEP_KEYS);
+	seq_printf(m, " dynamic-keys:                  %11lu\n",
+			nr_dynamic_keys);
 	seq_printf(m, " direct dependencies:           %11lu [max: %lu]\n",
 			nr_list_entries, MAX_LOCKDEP_ENTRIES);
 	seq_printf(m, " indirect dependencies:         %11lu\n",
-- 
2.39.5 (Apple Git-154)

