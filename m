Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8126FD95
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774420; cv=none; b=um7twtmVt4yhhsZ7XAkJ9jK8hHPNYii8IpwuTeYa/pnE0HbFJ1S53fcl8dU3r0wv51IN9auwT7JzI9Vfbp3fa5p70Agj9fpANpEbQVcU1LVGe4doc7Op+F+pPM3pIb1LxuXwgaHLNhk504v12GKSAa9rPXZcJ2egBkrWqfrqlKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774420; c=relaxed/simple;
	bh=us+ZJ6WIK8Ixr9HGqe8c7I6zbm6KW5ujWB5Obyd2WO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1Tlt2LD3muZhbAP8ME37u0UVV+X7+2FSNwDbpIHETNfF5ccP/npddw7L0ZaBzqIUjY1VKyJc6RZzv61vS0eQk7j0OE1x/oWCwuSEdE4vhiLwTAOav7GtiszXUsSaCN1cnb1zEK8VExaCFMqbnUnO+eCfpYh456IkhxBtVA1rlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zv0R75bGJz4f3lg9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:27 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id D50FA1A07BD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:06:53 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgAnesR4qR1ofcXLLg--.60961S6;
	Fri, 09 May 2025 15:06:53 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: akpm@linux-foundation.org,
	paulmck@kernel.org,
	bigeasy@linutronix.de,
	legion@kernel.org,
	roman.gushchin@linux.dev,
	brauner@kernel.org,
	tglx@linutronix.de,
	frederic@kernel.org,
	peterz@infradead.org,
	oleg@redhat.com,
	joel.granados@kernel.org,
	viro@zeniv.linux.org.uk,
	lorenzo.stoakes@oracle.com,
	avagin@google.com,
	mengensun@tencent.com,
	linux@weissschuh.net,
	jlayton@kernel.org,
	ruanjinjie@huawei.com,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	lujialin4@huawei.com,
	chenridong@huaweicloud.com
Subject: [RFC next 4/5] uounts: factor out __inc_rlimit_get_ucounts/__dec_rlimit_put_ucounts
Date: Fri,  9 May 2025 06:54:10 +0000
Message-Id: <20250509065417.147515-5-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509065417.147515-1-chenridong@huaweicloud.com>
References: <20250509065417.147515-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgAnesR4qR1ofcXLLg--.60961S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1Dtr15Jr47WrWruw1UAwb_yoW5trW7pr
	4xJ34UAw4kJF43trn5Ja95AryrArWSvry5AFy7Wrn3t3W3tr1Fgw12vryYga47t3yrJ34a
	qasrWFWqk3WUZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

The __inc_rlimit_get_ucounts function has been factored out. This function
can increment the rlimit by a variable number and acquires an additional
ucount reference when the rlimit count was previously zero.

Correspondingly, the __dec_rlimit_put_ucounts function has also been
factored out. This function releases the ucount reference when the rlimit
reaches zero.

These functions not only make the code more concise but also serve as a
foundation for subsequent patches.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 kernel/ucount.c | 56 +++++++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/kernel/ucount.c b/kernel/ucount.c
index 8686e329b8f2..33605e416724 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -276,22 +276,46 @@ bool dec_rlimit_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
 	return (new == 0);
 }
 
+static void __dec_rlimit_put_ucounts(struct ucounts *ucounts,
+				enum rlimit_type type, long v)
+{
+	long dec = atomic_long_sub_return(v, &ucounts->rlimit[type]);
+
+	WARN_ON_ONCE(dec < 0);
+	if (dec == 0)
+		put_ucounts(ucounts);
+}
+
+static long __inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type, long v)
+{
+	long new = atomic_long_add_return(v, &ucounts->rlimit[type]);
+
+	/*
+	 * Grab an extra ucount reference for the caller when
+	 * the rlimit count was previously 0.
+	 */
+	if (new == v && !get_ucounts(ucounts)) {
+		long dec = atomic_long_sub_return(v, &ucounts->rlimit[type]);
+
+		WARN_ON_ONCE(dec < 0);
+		return 0;
+	}
+	return new;
+}
+
 static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
-				struct ucounts *last, enum rlimit_type type)
+				struct ucounts *last, enum rlimit_type type, long v)
 {
 	struct ucounts *iter, *next;
 	for (iter = ucounts; iter != last; iter = next) {
-		long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-		WARN_ON_ONCE(dec < 0);
 		next = iter->ns->ucounts;
-		if (dec == 0)
-			put_ucounts(iter);
+		__dec_rlimit_put_ucounts(ucounts, type, v);
 	}
 }
 
 void dec_rlimit_put_ucounts(struct ucounts *ucounts, enum rlimit_type type)
 {
-	do_dec_rlimit_put_ucounts(ucounts, NULL, type);
+	do_dec_rlimit_put_ucounts(ucounts, NULL, type, 1);
 }
 
 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
@@ -300,30 +324,22 @@ long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
 	/* Caller must hold a reference to ucounts */
 	struct ucounts *iter;
 	long max = LONG_MAX;
-	long dec, ret = 0;
+	long ret = 0;
 
 	for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-		long new = atomic_long_add_return(1, &iter->rlimit[type]);
-		if (new < 0 || new > max)
+		long new = __inc_rlimit_get_ucounts(iter, type, 1);
+
+		if (new <= 0 || new > max)
 			goto dec_unwind;
 		if (iter == ucounts)
 			ret = new;
 		if (!override_rlimit)
 			max = get_userns_rlimit_max(iter->ns, type);
-		/*
-		 * Grab an extra ucount reference for the caller when
-		 * the rlimit count was previously 0.
-		 */
-		if (new != 1)
-			continue;
-		if (!get_ucounts(iter))
-			goto dec_unwind;
 	}
 	return ret;
+
 dec_unwind:
-	dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-	WARN_ON_ONCE(dec < 0);
-	do_dec_rlimit_put_ucounts(ucounts, iter, type);
+	do_dec_rlimit_put_ucounts(ucounts, iter, type, 1);
 	return 0;
 }
 
-- 
2.34.1

