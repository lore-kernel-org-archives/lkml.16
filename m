Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83949295516
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053294; cv=none; b=sqDvVZsa2Ps6jFJQ0x8KpfnbQyhxdhPtEzwI8IB9Z9F0E1rAf+rvm/ZLSAeX6jnylxMpdDnDnmR7AnvyvOCdSk6zTaRz1YKiL9ZvB4FsugaYlAvYcLAuVELm4dWst8WnV2gZJTJsRcEWYvGA8qK98LGqvVbmdLL9tYSyVCf5YII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053294; c=relaxed/simple;
	bh=SqVDOXGgAvnPE5z9oU92cnmrU7MjwVFUodqWnzatDc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haDW2eAVcgWxFWzi3I/j0F90Jo5Nhrmig8p0bH8j3JPWDBV5OyodG4eX1rVAIA5nFb96eNplWEkig6syhvfTQm5j9wpeEmjzUSDNkA4Y/tOb/yq0tKfV0jXDc8OVlGcGJUizXBPpIxSZpR2FAEd27kSpnak8gmjvWsIvw9VUwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iEgmaNbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iEgmaNbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DrqxmiOL3McpG/dCHwH1I+FCiwsh4PlvLiMszfDdMo=;
	b=iEgmaNbGFWJv+otvgftTHyfOD7E+KawQVRHZS3sfJoMDdpA2KznMudhsPWuQepe/VuYXJh
	HcmVRJ9Amm2NwzlWeVvPqF5nyfAqUtTML7gJYJ7NukzR0aioEHkbfjE2fj83YxD6wu1Fug
	U/DQBwCSbDWvs1Eu7k+haAwPekhyhnE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-jXMK4JryOBaA13AfFJttDQ-1; Mon, 12 May 2025 08:34:50 -0400
X-MC-Unique: jXMK4JryOBaA13AfFJttDQ-1
X-Mimecast-MFC-AGG-ID: jXMK4JryOBaA13AfFJttDQ_1747053289
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a1f9ddf04bso1546902f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053289; x=1747658089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DrqxmiOL3McpG/dCHwH1I+FCiwsh4PlvLiMszfDdMo=;
        b=es/cJ8RQDjEwnS4f4WKLIR2cumFZqi+1dbKoR4e8lT+W0XyDbSFi3quGtX/hyhR9Ef
         USK2UCWGYHSZDoKDv1TBciXsPjPgLS0qzJctjj4DB00r45r09sQr5DutRJUM4NRaQPwI
         xbN5SUso7Jpmnkh/rG9MZLzJKuiIqdJDFC7aZ45Kp+ol+QhbaltnIkw9y27I0sHq+6qn
         GG4uYubXK0GEiJIl0DM+Vr7pyIS+2HDAU1cTy2EGVxYIhfGKQFyB3a6wIufN1m4Pi+uE
         nHzzDg84IgppAwcgnDvc1jOOcDoJ8rpT1O4O+e76sRGf1XW1KpA4AtYiw0ot5gkm8m/Q
         czfg==
X-Gm-Message-State: AOJu0Yxt6jmJaDfnkwQnBetI/FLJvnimipD7qwTiDzmyGAKlCV1L915e
	YcW1mn705IKiEaf/FrrSWzOBiqYHFQOJmFpYVRdnJhz6OW+fm3AWylO3qZkiqcCx3ocpSTE0XI+
	YIEyW/u/G0vbzdHcRUxodgUFHve1iPAcnBwWpQNBO0tMcleEhal9TBQwUqSv+4jV4R82K5cbMxC
	qzgg/18fwMj5aE5vebpXudl7uOpg9G7+xlidv1v3hgflVu
X-Gm-Gg: ASbGncuGFXxxVIE9biyaa+0F/NP0ELxKLNNYImfijMTi2o9/+K0vlBM5FBhnUPqh/ub
	fEhqvYXNYIWpD/pFFWYcIXO9H9Qq7V3PhIg0o5Ut85rvMIvSoDeNgbcK0zQzP3dR1e11cuL9JZ1
	ubxNwaiCYXavRl0Ix8dZ3BVvn+7Ke2PKf0QMAm2d7RjXC/IaRGZPb6eKpnNlXlm6nQyXzn72yRE
	91eH810eOvqJNnrMntSsjOMk2pj6nuObYg7XyWc28kLt6+K4CXuYrezHHxQ7Jem9biFfMu/3K8l
	Gta0sNytfd0/pQcIMK1U7geDXgcO6KLTvbrckFS4Yvczq5dThiU0r/J14oyyyAEQKr8bvdn4
X-Received: by 2002:a05:6000:186e:b0:3a0:830d:ec58 with SMTP id ffacd0b85a97d-3a1f6446e78mr9882932f8f.28.1747053289347;
        Mon, 12 May 2025 05:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0s3h7inHrYSooQ8NhTVln7D4g+9j4TOqzMH9jwIQneuWGNhcfmrI3NwJv0snFOVP2u3wuBw==
X-Received: by 2002:a05:6000:186e:b0:3a0:830d:ec58 with SMTP id ffacd0b85a97d-3a1f6446e78mr9882884f8f.28.1747053288844;
        Mon, 12 May 2025 05:34:48 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c583sm12120673f8f.84.2025.05.12.05.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:48 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 09/11] x86/mm/pat: inline memtype_match() into memtype_erase()
Date: Mon, 12 May 2025 14:34:22 +0200
Message-ID: <20250512123424.637989-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's just have it in a single function. The resulting function is
certainly small enough and readable.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype_interval.c | 33 +++++++++---------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 9d03f0dbc4715..e5844ed1311ed 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -49,21 +49,6 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
 
 static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
 
-static struct memtype *memtype_match(u64 start, u64 end)
-{
-	struct memtype *entry_match;
-
-	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
-
-	while (entry_match != NULL && entry_match->start < end) {
-		if (entry_match->start == start && entry_match->end == end)
-			return entry_match;
-		entry_match = interval_iter_next(entry_match, start, end-1);
-	}
-
-	return NULL; /* Returns NULL if there is no match */
-}
-
 static int memtype_check_conflict(u64 start, u64 end,
 				  enum page_cache_mode reqtype,
 				  enum page_cache_mode *newtype)
@@ -119,14 +104,16 @@ int memtype_check_insert(struct memtype *entry_new, enum page_cache_mode *ret_ty
 
 struct memtype *memtype_erase(u64 start, u64 end)
 {
-	struct memtype *entry_old;
-
-	entry_old = memtype_match(start, end);
-	if (!entry_old)
-		return ERR_PTR(-EINVAL);
-
-	interval_remove(entry_old, &memtype_rbroot);
-	return entry_old;
+	struct memtype *entry = interval_iter_first(&memtype_rbroot, start, end - 1);
+
+	while (entry && entry->start < end) {
+		if (entry->start == start && entry->end == end) {
+			interval_remove(entry, &memtype_rbroot);
+			return entry;
+		}
+		entry = interval_iter_next(entry, start, end - 1);
+	}
+	return ERR_PTR(-EINVAL);
 }
 
 struct memtype *memtype_lookup(u64 addr)
-- 
2.49.0

