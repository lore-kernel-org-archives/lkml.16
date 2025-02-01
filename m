Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADAB4A3E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738388311; cv=none; b=g9alZZu15CtUxjxb5x7PG17pebBzccvJ6BGQtPmXgyYGomwr6bYsIjIiFOPT2+HKlWvh7b1ODrl1v6SZM+de6ybiHs98qPzN6xY+nRw6XTVwpkfikaTS1kMY3NIfhtwWcvw6CT+NwAUJ4oE5AY3m3d3r1r4o0Hr4WPlYY81L4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738388311; c=relaxed/simple;
	bh=rxR+tA7cE9G+zmd/3iZ7OEEKmPm6lyrE9c/MWzL0vEk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ioFabOzRM9Tr1vr0+mwj/yXAT+EimOZHo4y0UjtAwxpRuxDh3nRlp01dwPFChwONi//0ps4MzQ+ugq1Z2ukmI0nZmDOv3eSHbatJ8GxWUdttJ8Ua2PCTZFmSQJ24gVx4ZpK1aque4PfEMwqq6n5ivxGtCrjFJANjTx2dOlWdofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EYGnbxJQ; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EYGnbxJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738388301; bh=uGeZA6dSprLyFYw2PuvmlBa9AzIvnyQDWEf0CScGVgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EYGnbxJQz5oBJXOW8zlopXZGojjiAMcO+4b1Rog96FeUV9QRUybwnR5in/2YwI4Yq
	 AvG68OO1IpEhUPOFlBtynvgd1vtE2L34yxwU1cOndxBdELBIjExErGs2bflagp1dlO
	 0SDPrxoVJuBqW5+NU4MMKXHqxa5hHJtYbfBYvkGo=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:6b25:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 78195EBD; Sat, 01 Feb 2025 13:30:01 +0800
X-QQ-mid: xmsmtpt1738387801txcnxr994
Message-ID: <tencent_C95D9CDDB01966CFA00DC1A5898D84920707@qq.com>
X-QQ-XMAILINFO: MRXTPC4IFCJcPi225lqoMLJGmYFuxHiZNSKFbCfYr8iLn/9+QWevDJzeMcEFY8
	 PxUXoa+I/LDYkABhr2kSF8EsnrZ7m+GnSPAt4YGfcPCNZVB1PJauxv4E/Cd8EFzSksFtntE9uGti
	 uQM4NkzzJyQM3OAmnAnuc1WTD52UmAyeUO7iUAtGV/ki+BD+TI0FXkNfOtUDdomBlPpUR88DXmSI
	 oi68AfDKKwwHlf20Wq+d6A2hSjEuRmOJwfM6zklBM0sh/gUE5WI1iv/BDWBOKMrgGIdnr6DXAyKJ
	 734jQYxGomh44jcH9RBlu2Sx6wQOFdmp2cnN0KV5KgKhtZNkzYgDuIUv7z8se6tWYgK6Nn0Xo06s
	 THTGGW8budDmTgqTe3KZ1CQiIqvEOMNFlmC9FxSAOyO6L20UGUth75Fn56RhoMyhKHrkYZGo/0cf
	 MwesyW1YWaPYvkn267PCEJIn8Cu0s76vqMll8NdxKPBh19FdNAUzAsF4L/VaqROq7v+0r4EIGGBL
	 gk3wYfnsOm3nRpSFdCsnsCxC9F3/ZhkAd/avWK+1Vi6h/W1bMzcYohLbklgbCn5sGzkcgKRD37TA
	 GT73RVKgYYbT5EkHzHYG4f6d8k5tDIm/50nirlqZaTRAfS9xGninicOVeeUWe9CndAv5XXgOTBT6
	 jnExOkcIJMVpk7LVlc/17RGI+KDRZ7UI6aMYadQDqgzXAboXjdrmjla2qxmC0DvMJIDG4rYom9zQ
	 zs2LYR5TZfdfuR8MDWMfLg/2S2KQQVxMueDFVhYEnr/KIjXB83deeAvzOdB+RyNXJtyLJ91MVBQF
	 VLEodxy600neVPfgXe8EQuErvi16B83i/3gUPI3yn60bCNrUTIVbpkdd6aj5jJVnj2YzXqR+sGKV
	 UcZtpffo71xeXZ1r+XxO8iHRvftK+OOiV+bcj229Pgy3IXuK3pT3lztuDqO5vUAoETcOXtm2Ejdf
	 wNGtvOS0amhthR88d5wg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
Date: Sat,  1 Feb 2025 13:30:01 +0800
X-OQ-MSGID: <20250201053001.946041-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679d36da.050a0220.163cdc.0010.GAE@google.com>
References: <679d36da.050a0220.163cdc.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 4cb275316e51..dad032912e1e 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1600,11 +1600,12 @@ static void *s_start(struct seq_file *m, loff_t *pos)
 	struct set_event_iter *iter;
 	loff_t l;
 
+	mutex_lock(&event_mutex);
+
 	iter = kzalloc(sizeof(*iter), GFP_KERNEL);
-	if (!iter)
+	if (!iter) {
 		return NULL;
-
-	mutex_lock(&event_mutex);
+	}
 
 	iter->type = SET_EVENT_FILE;
 	iter->file = list_entry(&tr->events, struct trace_event_file, list);

