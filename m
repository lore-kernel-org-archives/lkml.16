Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE82877F0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081963; cv=none; b=aJAXeNDiWWDv7ey6fRSyWy6huGR33C7MYLzPjmoqKMxkFMBNlJlusrhj9FJ2wbgOUuJfnORT7ybJVeRoWOCDuNtCwTqMttBHbG7v6G4qtPwrgpfCMmA27/TjvUQoumlE5sY+vfr+SRMK++MRhZsEyX38ah+j1VXgGI2nQaEOoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081963; c=relaxed/simple;
	bh=uRIz+VXav4EQnfDauh+iPVhleicrhYK6zI5Z02XIkh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htGpCAfNpBC42jxwi3o+nRWOm32MSvdZxtBVtR45gHQwfja/wnru7rDSLGZJtMo1rh6iGChaPgJGAmrTyuyDbpu5JWz9gZ2c+S1wJoNTASnnzh+5fJ5wFuKguD05jE81uRAIeTJndc/UNj40deBSlH+rOWWyqWQB3XpQL7WUSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xIV6D+Wh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=liphTJNP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WGghh4+k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=39qVt0pe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xIV6D+Wh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="liphTJNP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WGghh4+k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="39qVt0pe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1AF71F798;
	Mon, 16 Jun 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qagJ6zCe/DEdOhtEMbQyUIS/FQ9HhC1GdKUsrS5yZsU=;
	b=xIV6D+WhsqDqaE/Qc3IJuiR8aytdRnYm2XmoXoAI+IFWEoD9QYdQQ9Vfxu6j/1dIP/znkk
	51tPdQRkGAMmUSVg9ghGqtE9kDeFcBogmQhG/hIEV9vL5xsMekW2oyF+gqwYb2PZE5aN9g
	tasdJu8oekQ241iI4wpH95JCBt9FX0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qagJ6zCe/DEdOhtEMbQyUIS/FQ9HhC1GdKUsrS5yZsU=;
	b=liphTJNPjGXXO6kOJLGvfrKz4kYBKWPgCH1+9WvwfEmV1nROEXjs6bMabunsNRRghj+RgG
	MW1snmvmo2/YuhBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750081941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qagJ6zCe/DEdOhtEMbQyUIS/FQ9HhC1GdKUsrS5yZsU=;
	b=WGghh4+k5pLRsS48qNICFZG/0x2JFBJVjxJrgrw1kJaXCjiNzCH8WiLAWjVAgSvUVH91FC
	a6N/O+YcMsX8WXUv7wQK7wdcO5ANJ0YGa+DUROwni4L/74xFgraD+rtulPZNj0fRX5bjTJ
	F6BVC7INNT8myq5v8VqD7SJWsEK2OAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750081941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qagJ6zCe/DEdOhtEMbQyUIS/FQ9HhC1GdKUsrS5yZsU=;
	b=39qVt0pePHsbAYTR/qddoMsoA9yo1rw04fWzP3nQ78RjdNUUChi4TsUt5Bj4YE5BysQ0FM
	t1zNC5EIxNM+oCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6499C13AEB;
	Mon, 16 Jun 2025 13:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EG/tFY8hUGhHLwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Mon, 16 Jun 2025 13:52:15 +0000
From: Oscar Salvador <osalvador@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v7 08/11] kernel,cpuset: Use node-notifier instead of memory-notifier
Date: Mon, 16 Jun 2025 15:51:51 +0200
Message-ID: <20250616135158.450136-9-osalvador@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616135158.450136-1-osalvador@suse.de>
References: <20250616135158.450136-1-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[huawei.com:server fail,oracle.com:query timed out,suse.cz:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.cz,huawei.com,oracle.com,sk.com,gmail.com,kvack.org,vger.kernel.org,suse.de];
	R_RATELIMIT(0.00)[to_ip_from(RLsc83pr41xu6y1i6mw9yajrf5)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,huawei.com:email,oracle.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30

cpuset is only concerned when a numa node changes its memory state,
as it needs to know the current numa nodes with memory to keep
an updated mems_allowed mask.
So stop using the memory notifier and use the new numa node notifer
instead.

Signed-off-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 kernel/cgroup/cpuset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 83639a12883d..66c84024f217 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4013,7 +4013,7 @@ void __init cpuset_init_smp(void)
 	cpumask_copy(top_cpuset.effective_cpus, cpu_active_mask);
 	top_cpuset.effective_mems = node_states[N_MEMORY];
 
-	hotplug_memory_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
+	hotplug_node_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
 
 	cpuset_migrate_mm_wq = alloc_ordered_workqueue("cpuset_migrate_mm", 0);
 	BUG_ON(!cpuset_migrate_mm_wq);
-- 
2.49.0

