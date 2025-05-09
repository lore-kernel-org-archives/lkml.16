Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4B74685
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812360; cv=none; b=pyxCpigr1+H1gbs1Q8L3Hzbwljy2nSEyBjERVWuPkO9TnxJtPU+TXpov6Q/4X5fyhDZQkRaXDunrkooy+1Avp6lBb/s54AWwTyZm8dhdgyzARIoXeZeij9ZGlCIBXwgU9EmPfUQki+CX7GkG3XaLyj3tXWSlGpOpNfd9dbTb7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812360; c=relaxed/simple;
	bh=PvND6jrCiPl+Qmi3+H4kAtd05AylPVWn/4aHa9HSAzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hoyV+TmZhqNZo0J1xBRgE2H2qlTvwNx0jXFbwBwIV/32HWNfrmYc7LSzi4bs96C9W/lF1nQVRVT+J8yUQBkM+LOYN7enonuZh/LfFCZvE3DiMer6Lh5rTghA5HpVVwBB53vY014kzVjnqqgw56/wq37qd5QjnhejeNM1R1txCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P0FH2He2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P0FH2He2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ei
	WxV15nlzwBxQw18EAh+96kuI5vr8rgZrGRHkfvwIc=; b=P0FH2He2phaMO8Hi8l
	cuEpFgopmq5OvkoYXiu2ExTh/+6eQUHv4ODUmImkR/nVbzSQ0WNO6lk+C8bpisYU
	P+vBNzFE24zUdM+pqCOvo/6ghhX4Emfq3hkYU2TgssTosDDHUFPnjec07gEE0pgj
	bxOfatpStq/OIQSXIw4JFU5N4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnmjadPR5oAL0CAQ--.18168S4;
	Sat, 10 May 2025 01:38:55 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v2 1/2] alloc_tag: add sequence number for module and iterator
Date: Sat, 10 May 2025 01:38:36 +0800
Message-Id: <20250509173836.42473-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250507175500.204569-1-00107082@163.com>
References: <20250507175500.204569-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnmjadPR5oAL0CAQ--.18168S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxur13tr1UCFyDAw4DGF4DJwb_yoW5Xr1xp3
	Z5u345GF4kAr47uFZ3Wr1UZF15KryfKr48XFZFk3s3Kas8tr47uF1UJ3Wa9ryrCFZYqFn7
	KFnYgw1kCFnFqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE8nYUUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gBIqmgePWgN0gAAsM

Codetag iterator use <id,address> pair to guarantee the
validness. But both id and address can be reused, there is
theoretical possibility when module inserted right after
another module removed, kmalloc returns an address same as
the address kfree by previous module and IDR key reuses
the key recently removed.

Add a sequence number to codetag_module and code_iterator,
the sequence number is strickly incremented whenever a module
is loaded. An iterator is valid if and only if its sequence
number match codetag_module's.

Signed-off-by: David Wang <00107082@163.com>
---
 include/linux/codetag.h |  1 +
 lib/codetag.c           | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index d14dbd26b370..90f707c3821f 100644
--- a/include/linux/codetag.h
+++ b/include/linux/codetag.h
@@ -54,6 +54,7 @@ struct codetag_iterator {
 	struct codetag_module *cmod;
 	unsigned long mod_id;
 	struct codetag *ct;
+	unsigned long mod_seq;
 };
 
 #ifdef MODULE
diff --git a/lib/codetag.c b/lib/codetag.c
index 42aadd6c1454..496cef7cdad3 100644
--- a/lib/codetag.c
+++ b/lib/codetag.c
@@ -11,8 +11,14 @@ struct codetag_type {
 	struct list_head link;
 	unsigned int count;
 	struct idr mod_idr;
-	struct rw_semaphore mod_lock; /* protects mod_idr */
+	/*
+	 * protects mod_idr, next_mod_seq,
+	 * iter->mod_seq and cmod->mod_seq
+	 */
+	struct rw_semaphore mod_lock;
 	struct codetag_type_desc desc;
+	/* generates unique sequence number for module load */
+	unsigned long next_mod_seq;
 };
 
 struct codetag_range {
@@ -23,6 +29,7 @@ struct codetag_range {
 struct codetag_module {
 	struct module *mod;
 	struct codetag_range range;
+	unsigned long mod_seq;
 };
 
 static DEFINE_MUTEX(codetag_lock);
@@ -48,6 +55,7 @@ struct codetag_iterator codetag_get_ct_iter(struct codetag_type *cttype)
 		.cmod = NULL,
 		.mod_id = 0,
 		.ct = NULL,
+		.mod_seq = 0,
 	};
 
 	return iter;
@@ -91,11 +99,13 @@ struct codetag *codetag_next_ct(struct codetag_iterator *iter)
 		if (!cmod)
 			break;
 
-		if (cmod != iter->cmod) {
+		if (!iter->cmod || iter->mod_seq != cmod->mod_seq) {
 			iter->cmod = cmod;
+			iter->mod_seq = cmod->mod_seq;
 			ct = get_first_module_ct(cmod);
-		} else
+		} else {
 			ct = get_next_module_ct(iter);
+		}
 
 		if (ct)
 			break;
@@ -190,6 +200,7 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 	cmod->range = range;
 
 	down_write(&cttype->mod_lock);
+	cmod->mod_seq = ++cttype->next_mod_seq;
 	err = idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
 	if (err >= 0) {
 		cttype->count += range_size(cttype, &range);
-- 
2.39.2

