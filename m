Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DA51C8603
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749451404; cv=none; b=lvFFnnzftm+Fqa1tMDst97imVa+qyL/glBePsIFl444WkeH4f8n/3KY3QT+9iWVR1G4hQuHlMIpBMeP1I0YNrG6HwBDmeyKEP/Tj+dKuBqQzoN84jZlJQAYOyzVOb6qlEuSyzu22GLwWqBvGSOirJtneAdHk/tBeiKCH3NB3wcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749451404; c=relaxed/simple;
	bh=+c4M4PoOw4XBGGf96ubgf9jyGb/9F/bTTVc06PQ3tPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XEcBo08iWy6oWqoAEpmTvgx0SuivkSKjz3vUplrYzWV5lkLisKRCoh5Ah1E8j12NLv/4if7l5Szr1AbHPB2XHuQupDBKR5jsIeBxwKx1hs4IdULbxzTCPW+Q0J1Qj0gtTjRdX4SatyaeBauAGlc2Zl6VbSVjrlwG7jlr8P3uoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qG2M5RYF; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qG2M5RYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ho
	cQixyqJX5SglWXSQpR314Ob9Cf09x/R4lOM/XbktY=; b=qG2M5RYFYseowA/FQY
	5BSDvznNDT1tFQODxLPB2JOi1KS/97MlhT8eNsHcM1+W3QlplbkCwazAHDf+nkHg
	KeuSkuQvjTpAChHGuazr3tsV/lDTp+JyuawC3EiJXCS6O8uuOebRKH/sFZANvHwU
	4YUvNR+nlyWtyJj5De0T7QXRU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnJGQ6gkZoDaP5BA--.30275S4;
	Mon, 09 Jun 2025 14:42:18 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com
Cc: kent.overstreet@linux.dev,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v3 1/2] alloc_tag: add sequence number for module and iterator
Date: Mon,  9 Jun 2025 14:42:00 +0800
Message-Id: <20250609064200.112639-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAJuCfpGa2UxLY5Af_R6ZR4q57T0380bAWvwYWv2PzC=0sgCqKQ@mail.gmail.com>
References: <CAJuCfpGa2UxLY5Af_R6ZR4q57T0380bAWvwYWv2PzC=0sgCqKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDnJGQ6gkZoDaP5BA--.30275S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxur13tr1UCFyDAw4fZw4ktFb_yoW5XrWrp3
	Wku345GF48Ar47uFZ7ur4UZF1Y9ry3Kr48XF42k343Kas8tr47uF1UK3Wa9ryruFZYqFn7
	KF1Fgw1kCFnrtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE1vVZUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0htnqmhGfxuEtgAAs8

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
Changes since v2:
Rebase to 6.16-rc1
---
 include/linux/codetag.h |  1 +
 lib/codetag.c           | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/codetag.h b/include/linux/codetag.h
index 5f2b9a1f722c..457ed8fd3214 100644
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
index 650d54d7e14d..545911cebd25 100644
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
@@ -191,6 +201,7 @@ static int codetag_module_init(struct codetag_type *cttype, struct module *mod)
 	cmod->range = range;
 
 	down_write(&cttype->mod_lock);
+	cmod->mod_seq = ++cttype->next_mod_seq;
 	mod_id = idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
 	if (mod_id >= 0) {
 		if (cttype->desc.module_load) {
-- 
2.39.2

