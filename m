Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24C426ACB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745423; cv=none; b=unFkJ/tnHLiFU4g6fzTBuypghX+Qxb+7bZDaDLSP/K33XoO0rlynlpCAtInSj1+q8x628srbQAroDN/IVho8VpCA66qVSqntHh1ykp1x3GfEJDiuvVVR471/qgdSMSfHw0AAL9+Td28Ba+kSd/hkcMPPx+yssHEzAIkYFZ+hiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745423; c=relaxed/simple;
	bh=N07dqHZVlzoXTWTMyfPtYpNHh8ZJk4GIA1QFw9GE2k4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=XITHj/MYYOKTsAWuA6HLM7XS5+yGWB+m6u46Ys4lbPV4x1ZDEpA1/bjHdZCHXVEey8vat5wFIdMKy8hkLyW5noHThRKM6D0NDxJwhQpDLWHjEkxSXiFPQ3fWj79tDR7NWV2McaOIDPAQ3U+oY7XXSKik0EsU9ydxVDhxqBLvML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CWlh+QXG; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CWlh+QXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750745415; bh=/48aJHiyx5+lekASMdemfOkemMWXQbzfEebToJfcUw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CWlh+QXGnRYJsGFyhXA+yR1YvDESJdYR9w8xMf41w+NwgbMEzR9NxNZXh+C/5FLIT
	 f97FS6DyATAlakjVpUVasqaLpBYxefxyw6qKRIIEouYKjGhSy8Rbn+z4ixmZTrb8co
	 b9I1Qc3pNu2s2otftjIJ3Dx4w+gwiY8ieDxlYN+I=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 28D8A2BB; Tue, 24 Jun 2025 14:10:13 +0800
X-QQ-mid: xmsmtpt1750745413tkio2pdb6
Message-ID: <tencent_04E8067F098D2ED5AEC04C86E7DA06EC1206@qq.com>
X-QQ-XMAILINFO: Nq1uWKlIb9DMOHggUw40dwNtJSxo0+HwB2/EhAlTzAPwRQMfb/0Vhi66EOQtCR
	 kRFJVcZR9aKFx1ORrfYuhOCok+63hlzm06BCQUf/iDMQ8B2wKs4QoTnfhDYRoTxieKZxL65I3sZm
	 DKuf4Fsi5xJQjLd43+gC3RHtq1qoUg69x4Rx0UeiPctcFMJrb0Wesy9xOFP9Ba22F5kCSUbaCE64
	 +un2lbFQDNLAyhlLNraSHJlSE2mN1zHMnwuoHkDx3TcoEnbfRJrc0Yvqc5JaZg4zjM7x+/hOo89b
	 R86l477pguav4YDUGxftpKlV0l/cDE/RYcIkqL9Qh4/d3d8h3+RgBm4HCV4Mk8L+sPDYrAb29nDT
	 Tm8a7dzs9u3E4UhL8HqkaSU6JeQoj5Go8LYTEyQ0KzKVjRI9yZLTvZB8smlCH5BQDqSGXEXywh3X
	 iqzGXGgg519Ak0s9WVO92NwrCq4qXRqYNr9NVJPalTK27OoNWmDeNvrSYCs5B9EPusnywrVd/pMt
	 5O7riUd+5fGeFtte3KpU3bjMq5LR6KlFYVnd1J1qtMx+XGYSK2P7JGEfOmaj2uHN4e8cTxY7nVuv
	 QyH/pHrXYl/Q+r9+n4VSpan46HnPBW8vt8qXIO3tSalTziZfYWhE64V88qQ+605m3tnV5oi1bBwQ
	 YCX8PWjn6P1X5cJfjCp4TKom4I2cE63mzWLffRCRRgGNHulXkEOX7cCLiI/yrkgiqjtwuO68gLXf
	 VBTtP+e1BKa3o6F66e3T5Y2iW3ButjZLuAI2KDZWNcNM3c1ObnaXe11hVmB3Ua4x9BFlACK2c42T
	 Pn+1gH+9m5REQ5SijNeKqDicjRH+6xfR2hChF0fBhkwPIYb6j6E9sKVX8ITrxgLe30NaqUPKvCsF
	 58oeI4AxNJzqsyAQW3ee3pVyAhnXKz2wQBxKN7XTT1KNCLO9xUXecNPq/hPvSyW1zG1ABG6NUnhm
	 7vE9FvTc0=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+daba72c4af9915e9c894@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [trace?] KASAN: slab-use-after-free Read in __free_filter
Date: Tue, 24 Jun 2025 14:10:12 +0800
X-OQ-MSGID: <20250624061011.4070923-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6859ea24.a00a0220.2e5631.0044.GAE@google.com>
References: <6859ea24.a00a0220.2e5631.0044.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 08141f105c95..3885aadc434d 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1436,13 +1436,6 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 
 	INIT_LIST_HEAD(&head->list);
 
-	item = kmalloc(sizeof(*item), GFP_KERNEL);
-	if (!item)
-		goto free_now;
-
-	item->filter = filter;
-	list_add_tail(&item->list, &head->list);
-
 	list_for_each_entry(file, &tr->events, list) {
 		if (file->system != dir)
 			continue;
@@ -1454,6 +1447,13 @@ static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
 		event_clear_filter(file);
 	}
 
+	item = kmalloc(sizeof(*item), GFP_KERNEL);
+	if (!item)
+		goto free_now;
+
+	item->filter = filter;
+	list_add_tail(&item->list, &head->list);
+
 	delay_free_filter(head);
 	return;
  free_now:

