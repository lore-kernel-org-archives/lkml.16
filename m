Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8E226888
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125357; cv=none; b=PcVIK+BMdDpDj0tbLRcYqulyhYPT3yMbkULD88f++Z+P//WtBZQY8Gj7EX4z1Xn1PEcIdbFAlgrkG0vxCbFn9vlon0Fy+VAvOvTaEs1cqBks7ZogikGjTl0KcgGPi0df5JLQU4TGQaAZE+uI8sGsisqm92VUnlVfd9q9qvdWdas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125357; c=relaxed/simple;
	bh=0LqhttrFsusupHUa0HZeztmHCjIl22U8ywK2E3iHLL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K9+M0e/yrC3GUF30IN5tF/txrdVoJRqqrEr27vD+QT+7cAfCDUCJoW6+b5q4hUzgTRXi3rXUYj6pZmbJ4oc1PQY21tikaMcXyDx2s7n/vrCcBn5uzUnDNqLOeHrxBU2IxSfYBwISBUoh/gC7SQqHhFUPayY3pPNtmi8t5ryyEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtGlhP+U; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtGlhP+U"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b166fa41bso1786175e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125353; x=1744730153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsXh5DQxErvfpk4smRVJmZEnTcpSTG4dia/PFYIhGps=;
        b=dtGlhP+UojRbvRiXzwD2Mioz4L8kE79dUgip85cSz4APFDOuVMVoEuJIaCJiFjxcPp
         RcvY5wSAv6/dOTXLfT25ccnaUxfHGOWq0nLflabF/hHG1wuKSmSQw2UoUSXaAjabGZKi
         QZUUNVFUvP1zJtnKN6QeR30uOt46Mg69PVMSPgrP0WQHv1LjjbnoQ8og83hv+750AUua
         xhTTm1xOdJcFAi4jN03n9ChTqQt3GLslqe2LXlL+IMXT4KVe5EK6UQhCMAX38sANAPMw
         ZtRcvu78XrToOGxjzVOChlraP85M3q4FzwRvjQ7o/9XHJsnsA5zrgKRXMKlyoC4xGdTk
         tG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125353; x=1744730153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsXh5DQxErvfpk4smRVJmZEnTcpSTG4dia/PFYIhGps=;
        b=NPjTNgqXDcSCZBhY6Er4YkoBTw9QwZ0EGeRKEKEi8HuXmZVhgho5n3acP89eVtp+GU
         pjeTveZHoVYH18fhFnBsk9stBNctHRoc15Yo3/jbQ8xQQe4T1V9eBduWQrLtRt1jX5j9
         abrGLTFu8+roliCpGRBtoidnn/OcFnFjUUQcdqSH8OTcdfxf5FaoSaqQsjFYXnto5abP
         RjkKzANrAiQ4FJ32ydUTtRGL/3CbCwMysL3R+lQJmIbhALptj5CPAxYou9Pn63WfgDlc
         Qup6Doba/foyHqmyyooEDlsMkpoC5Xf9hdIs+gKgHWKSiL0fP1oHtd4wsLNiVXtOIoh4
         7sSw==
X-Forwarded-Encrypted: i=1; AJvYcCWChkpksc6bLIN4c4w5l5tYXiwVIqW0o6A9lN7hOobWor5I8/v6cVxo6O6V8VA9c1Wskz0zpyCVBxSlah8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCZWfwv2TjTnuC5noH6rTpqjCQKC/aU2kA+ISuBJYVOKDMdMZ
	+P7kZ7zeiXv0pisdRP3t0a6XrYraApyAdweduMA6GWLw3x7kG8/h
X-Gm-Gg: ASbGnctUhdGPMw30k/s0SYFCW5CqoDf+14xtjRY3u5tSjLWa/sOxnbtGMxvfFKiYU23
	pQyaWshTHiJEgEqR3rygDLyvFamf0kJum3vpkLcQ2FsXrggLz+NiUoeZEpHKoR2RQ8H+xgki4Ks
	Mo4+Ux4Y03R6FXOP/34DbnMIyntskbXiULnwr6ziBGbgCsEcsIYsP4eUuRmWCk1eQ4DAsy71+Py
	JL1B3/T/HvSwOckaX/2ycvF2tL16w0k5rF7XuvYbZ8IwMRJc28byZdl/Vbdx/PM9ty2ASHDbWG2
	qQiNDozEnyxGKTppiZcfoEXJ4X+8TkSzBSa0Di9M
X-Google-Smtp-Source: AGHT+IG3TspJwCuKgEmft6MBazVSp/G5+tumxJQNv+3l09dfWKlmBOe4Xrw0OAYyhJ1p2HPzq8wT2g==
X-Received: by 2002:ac2:4bcc:0:b0:54b:ec1:63dd with SMTP id 2adb3069b0e04-54c232e259dmr4514605e87.20.1744125353086;
        Tue, 08 Apr 2025 08:15:53 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65db49sm1548603e87.206.2025.04.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:15:52 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
Date: Tue,  8 Apr 2025 17:15:48 +0200
Message-Id: <20250408151549.77937-2-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408151549.77937-1-urezki@gmail.com>
References: <20250408151549.77937-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are places which can be updated easily to use the
helper to iterate over all vmap-nodes. This is what this
patch does.

The aim is to improve readability and simplify the code.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e42ea20713dc7..3ff9acd64c077 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1061,12 +1061,11 @@ find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
 {
 	unsigned long va_start_lowest;
 	struct vmap_node *vn;
-	int i;
 
 repeat:
-	for (i = 0, va_start_lowest = 0; i < nr_vmap_nodes; i++) {
-		vn = &vmap_nodes[i];
+	va_start_lowest = 0;
 
+	for_each_vmap_node(vn) {
 		spin_lock(&vn->busy.lock);
 		*va = __find_vmap_area_exceed_addr(addr, &vn->busy.root);
 
@@ -4946,11 +4945,8 @@ static void show_purge_info(struct seq_file *m)
 {
 	struct vmap_node *vn;
 	struct vmap_area *va;
-	int i;
-
-	for (i = 0; i < nr_vmap_nodes; i++) {
-		vn = &vmap_nodes[i];
 
+	for_each_vmap_node(vn) {
 		spin_lock(&vn->lazy.lock);
 		list_for_each_entry(va, &vn->lazy.head, list) {
 			seq_printf(m, "0x%pK-0x%pK %7ld unpurged vm_area\n",
@@ -4966,11 +4962,8 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	struct vm_struct *v;
-	int i;
-
-	for (i = 0; i < nr_vmap_nodes; i++) {
-		vn = &vmap_nodes[i];
 
+	for_each_vmap_node(vn) {
 		spin_lock(&vn->busy.lock);
 		list_for_each_entry(va, &vn->busy.head, list) {
 			if (!va->vm) {
@@ -5123,8 +5116,7 @@ static void vmap_init_nodes(void)
 	}
 #endif
 
-	for (n = 0; n < nr_vmap_nodes; n++) {
-		vn = &vmap_nodes[n];
+	for_each_vmap_node(vn) {
 		vn->busy.root = RB_ROOT;
 		INIT_LIST_HEAD(&vn->busy.head);
 		spin_lock_init(&vn->busy.lock);
@@ -5145,15 +5137,13 @@ static void vmap_init_nodes(void)
 static unsigned long
 vmap_node_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 {
-	unsigned long count;
+	unsigned long count = 0;
 	struct vmap_node *vn;
-	int i, j;
-
-	for (count = 0, i = 0; i < nr_vmap_nodes; i++) {
-		vn = &vmap_nodes[i];
+	int i;
 
-		for (j = 0; j < MAX_VA_SIZE_PAGES; j++)
-			count += READ_ONCE(vn->pool[j].len);
+	for_each_vmap_node(vn) {
+		for (i = 0; i < MAX_VA_SIZE_PAGES; i++)
+			count += READ_ONCE(vn->pool[i].len);
 	}
 
 	return count ? count : SHRINK_EMPTY;
@@ -5162,10 +5152,10 @@ vmap_node_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 static unsigned long
 vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
-	int i;
+	struct vmap_node *vn;
 
-	for (i = 0; i < nr_vmap_nodes; i++)
-		decay_va_pool_node(&vmap_nodes[i], true);
+	for_each_vmap_node(vn)
+		decay_va_pool_node(vn, true);
 
 	return SHRINK_STOP;
 }
-- 
2.39.5

