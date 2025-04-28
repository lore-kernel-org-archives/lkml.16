Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6DF217659
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874476; cv=none; b=EIrhhyeqxXeFIeyLkHQwHxbqdJ91tKDyO/03fCT+XWZ4AXyznijR7WdFoUHtDJ6owg8ikUPxeNndrMJwPY6IuaMJR7w8+5Lx7ttNslWs+s22QhfLlsjaunNneA+IJJx22tNIJrCkSRloL9yLeRzbo9ahlkQ2onccsPmwYA0c+EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874476; c=relaxed/simple;
	bh=f6Ivb5X5pkMHM4s201C1kB1phD/8VjqDKvpUccGBZXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwqGtG245OTJIckY/1hcXMODhZR1hqXVEPz9nOmkXb/wJPFuqRxUw03ZK4QY3JCEaAOx2OCTByrDP3QmiFo83WJ5ndjGDhl+BKbFpB/6kfZivdLf7o5hQDJCsu3NJtvds4Z9QDASUHaY2LBCKupaaRF7mIUU0bgTAC/xzR1jbk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U1T3vtwf; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U1T3vtwf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745874470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jUS0s/tdQHjXzAtC64/fbqpJmBqxqUB4naODkeZs7IA=;
	b=U1T3vtwfTe5bOElYIfF/krvWpK5HgvnWcdnXVLyZarrrKWxfFXLo9xJmXvcmeMnH2AFG2I
	kpTxztQwONsX8FRRY2Yvhm8qR/ywGZQi7Ih5eDLUiJIEg1+pKROu4XNCWkU3e/KW2/8+0Q
	/cmhYKq/mB8Qi73n6JKhrjJEvwsGvYo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] bpf: Replace offsetof() with struct_size()
Date: Mon, 28 Apr 2025 23:06:39 +0200
Message-ID: <20250428210638.30219-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Compared to offsetof(), struct_size() provides additional compile-time
checks for structs with flexible arrays (e.g., __must_be_array()).

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 kernel/bpf/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 9794446bc8c6..d7287f3e260b 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -36,6 +36,7 @@
 #include <linux/memcontrol.h>
 #include <linux/trace_events.h>
 #include <linux/tracepoint.h>
+#include <linux/overflow.h>
 
 #include <net/netfilter/nf_bpf_link.h>
 #include <net/netkit.h>
@@ -693,7 +694,7 @@ struct btf_record *btf_record_dup(const struct btf_record *rec)
 
 	if (IS_ERR_OR_NULL(rec))
 		return NULL;
-	size = offsetof(struct btf_record, fields[rec->cnt]);
+	size = struct_size(rec, fields, rec->cnt);
 	new_rec = kmemdup(rec, size, GFP_KERNEL | __GFP_NOWARN);
 	if (!new_rec)
 		return ERR_PTR(-ENOMEM);
@@ -748,7 +749,7 @@ bool btf_record_equal(const struct btf_record *rec_a, const struct btf_record *r
 		return false;
 	if (rec_a->cnt != rec_b->cnt)
 		return false;
-	size = offsetof(struct btf_record, fields[rec_a->cnt]);
+	size = struct_size(rec_a, fields, rec_a->cnt);
 	/* btf_parse_fields uses kzalloc to allocate a btf_record, so unused
 	 * members are zeroed out. So memcmp is safe to do without worrying
 	 * about padding/unused fields.
-- 
2.49.0

