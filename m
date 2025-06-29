Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115120ADEE
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230416; cv=none; b=V84QkHcuNwxJF347ohDJd1E2KXq74/eBsp0T61FLrTKZf/LXPVPiAlSny9BUogUQTEcQVJJCSBmS+mm57rFOC6fR4KZrcgIZK44sdmuVEruOL6c7TN18RGSAGB18ogryBS1FlXZ82O75KB3hpcIs3psCU05fGEcCrfTSze4x3WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230416; c=relaxed/simple;
	bh=1jbCcrkrf728Wzl0z11tqyhSv0w2v5uYaJXCHXe1s4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBTAMP0gEb9lR4fWH5frNQESGDIgRoPjYo4D2+X/1X4owfIo+fvawvOkm5idDUMR0cVDOI4KZceVAA3js2k+J+r+bdUACcEgQ8M9eLU/5wby+llXrf4dcnVBm9sOQmDWfAPUJWBvg+6ZclzzhiyS+yiiSWL/6lrxI9oOlsn4ciw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=dp9SWbSw; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="dp9SWbSw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Aphzyhcn3XWdWxH1/MpQm+V5sC7N2o/eSwc7n6ZwBhQ=; b=dp9SWbSw/I7P/DSx
	Xm8r8PD+KoB0Zyrytjr49novVKZHWD5SN8uzHY5UkPGzkogUnh+qRoomnYX19/11bj5odWwj6Jxld
	i1/FytRwVQS7K+X/WKttSAXmuiAfaTNUi/aSf/f73hD8RLYQ04TvpFgQHyT9L57tyB2z+wSyFV1MN
	M6DYaWhL1lZxmW0ktlb/tQQ+gkg9MKsQ4npMpHWMmS5WZH8v+/1T2lKxwNVNcTxZdwD08rKZsCrvP
	ju/gqtN1KCQz493jB61rJxzIyLWmZ/+XbLL40HwjriABselpBwZ//gJJ66dwr4+qNrTY+qWyx6OJT
	cSQNeYiUtBkujcDg0Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uVz1L-00CqTf-1z;
	Sun, 29 Jun 2025 20:53:03 +0000
From: linux@treblig.org
To: peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] jump_label: Remove unused jump_label_rate_limit
Date: Sun, 29 Jun 2025 21:53:02 +0100
Message-ID: <20250629205302.296544-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of jump_label_rate_limit() was removed in 2021 by
commit 6e4e3b4df4e3 ("KVM: Stop using deprecated jump label APIs")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/jump_label_ratelimit.h | 8 --------
 kernel/jump_label.c                  | 9 ---------
 2 files changed, 17 deletions(-)

diff --git a/include/linux/jump_label_ratelimit.h b/include/linux/jump_label_ratelimit.h
index 8c3ee291b2d8..ae6c049ea6fd 100644
--- a/include/linux/jump_label_ratelimit.h
+++ b/include/linux/jump_label_ratelimit.h
@@ -37,8 +37,6 @@ __static_key_slow_dec_deferred(struct static_key *key,
 			       struct delayed_work *work,
 			       unsigned long timeout);
 extern void __static_key_deferred_flush(void *key, struct delayed_work *work);
-extern void
-jump_label_rate_limit(struct static_key_deferred *key, unsigned long rl);
 
 extern void jump_label_update_timeout(struct work_struct *work);
 
@@ -86,12 +84,6 @@ static inline void static_key_deferred_flush(void *key)
 {
 	STATIC_KEY_CHECK_USE(key);
 }
-static inline void
-jump_label_rate_limit(struct static_key_deferred *key,
-		unsigned long rl)
-{
-	STATIC_KEY_CHECK_USE(key);
-}
 #endif	/* CONFIG_JUMP_LABEL */
 
 #define static_branch_deferred_inc(x)	static_branch_inc(&(x)->key)
diff --git a/kernel/jump_label.c b/kernel/jump_label.c
index 7cb19e601426..caceeb94824e 100644
--- a/kernel/jump_label.c
+++ b/kernel/jump_label.c
@@ -363,15 +363,6 @@ void __static_key_deferred_flush(void *key, struct delayed_work *work)
 }
 EXPORT_SYMBOL_GPL(__static_key_deferred_flush);
 
-void jump_label_rate_limit(struct static_key_deferred *key,
-		unsigned long rl)
-{
-	STATIC_KEY_CHECK_USE(key);
-	key->timeout = rl;
-	INIT_DELAYED_WORK(&key->work, jump_label_update_timeout);
-}
-EXPORT_SYMBOL_GPL(jump_label_rate_limit);
-
 static int addr_conflict(struct jump_entry *entry, void *start, void *end)
 {
 	if (jump_entry_code(entry) <= (unsigned long)end &&
-- 
2.50.0

