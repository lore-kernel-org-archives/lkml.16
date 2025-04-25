Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7421930D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611548; cv=none; b=l1AFp/CEdUTn91v5xqDadz49o4EGGTQrOcfevByGzFzlLzJF30EqHarjsF0FeoaFoqayUTJUoHffi4ZHL55eXjafZmKOQIDrmH1uiK/qE5lgGgLGWlLRXEdo+NeQQhlHS1EGooFaWBi6tsrytuNwcRfJ0E1vZGhd6M/Y+GxyC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611548; c=relaxed/simple;
	bh=QbdxcNE69ZddsBu9K0zL2qGJ8S4/OJpx33fygzGV7k4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RCsasHRirviHqQlfhulRgeSoKdgVuN4ndXjBLGbRiky+BtcyKVYfY76unGES3ago6tCyH0Ne4jMOg92pzVKdjDq1IqIK/gFg5+2Ax6GF4ks74ay25DdTvqTrby4slt+HvmKCpSmnivLmonpaZLc708rlzQjHz/1HnT1SGF73vfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WoZQd9h2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WoZQd9h2"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so2678719a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745611546; x=1746216346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=81aIX6D3ElOfwpCkhpTcqzf1m3Yusf5yFZf4hIvcJxE=;
        b=WoZQd9h26EXR9ZMUM7V6L97OUiM1IXTo4egfF1MUSqjzPzw0Gf/vBU9xVredvFWYHE
         htmrrJvB4RC4iVgWEw9cyICKGLn4YqB4ec05MK6yHzgFCfbo1SrviIQH4+ZzKFmMGsb7
         nwYmE8qoVqJz+RHIW+2v3VL39iSM22iOxZJ5hcKeACKsKlontPJ/japva4JM3rXbPzEr
         H86jXw9JPeoL6xKkE07RN/xo633JuBKypWq8gpf0daQdBGqnZ4Hjhs8wgsU2SMuvbZtM
         qUzNH2/OfARbTKWDOyaEnxjwvkoyNTEnL1iFuliDQDktAOhcPwYMhFW7b2UryF2jtIkB
         EQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611546; x=1746216346;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81aIX6D3ElOfwpCkhpTcqzf1m3Yusf5yFZf4hIvcJxE=;
        b=iK8Xd4Gk0e90RZjraFh2W1XPbD+OGnJzGvUoWhX3KEKJNWFE6KMc6n/ruKWaREINEy
         PeZiPdd7cH7NiFbrpwBJZ8ZiswuUzcMNKQjVXtq0xz8Ehid9/Fw8z109Dx5P3G17ssb0
         Xuphry7yDgMKCEZjpT3o7Fdt+uEc+pyJZN8RMVotDO79LCiBzvKoXfaCw9ewUfBySmaH
         /eHfI/k0UO+GiwKnqTqZDkduQgYgRcgbe0hazJM84H59+ZHbjdMuAFBs2dC2hgFJW1Gs
         mWF5FfnjvZeQ+mn+C3XlDCGYQFnypL0ybxvdE0QwCmnHdcKBCw5CzePNa6kB+qnmx4Sy
         a5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuJYLGUrJuZ4D8GrZcjnXSxqIsYfg7Y7SRvKW7BpGHc8uIYbjAUD5gGASlM8zLUP1zG9/0wo2uxdu4G24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXQokqsSKAnvRkP0xi2A4mWdne3NvIoqvLeb/gvwDvqU4F+R3
	2SoH9RIqyPE+EgjrkQBJxjR7Ilq0yk8PKVcJaFhcTcs5YRCVr67UQPSOXPLDYuuIVQ==
X-Google-Smtp-Source: AGHT+IGHjrYor9DSnbkZpRLYhWCXHaBMQ7K553M2/vQUkVqXwMphsYNc+vXPfMd9SHMllf/frx6c80Q=
X-Received: from pjbpa14.prod.google.com ([2002:a17:90b:264e:b0:2ef:95f4:4619])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d4d:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-309f7c62025mr6705269a91.0.1745611546423; Fri, 25
 Apr 2025 13:05:46 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:05:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250425200541.113015-1-xur@google.com>
Subject: [PATCH] objtool: fix up st_info in COMDAT group section
From: xur@google.com
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>
Cc: Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

When __elf_create_symbol creates a local symbol, it relocates the first
global symbol upwards to make space. Subsequently, elf_update_symbol()
is called to refresh the symbol table section. However, this isn't
sufficient, as other sections might have the reference to the old
symbol index, for instance, the sh_info field of an SHT_GROUP section.

This patch updates the `sh_info` field when necessary. This field
serves as the key for the COMDAT group. An incorrect key would prevent
the linker's from deduplicating COMDAT symbols, leading to duplicate
definitions in the final link.

Signed-off-by: Rong Xu <xur@google.com>
---
 tools/objtool/elf.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 727a3a4fd9d77..8dffe68d705c6 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -572,6 +572,30 @@ static int read_symbols(struct elf *elf)
 	return -1;
 }
 
+/*
+ * @sym's idx has changed.  Update the sh_info in group sections.
+ */
+static void elf_update_group_sh_info(struct elf *elf, Elf32_Word symtab_idx,
+				     Elf32_Word new_idx, Elf32_Word old_idx)
+{
+	struct section *sec;
+
+	list_for_each_entry(sec, &elf->sections, list) {
+		if (sec->sh.sh_type != SHT_GROUP)
+			continue;
+		if (sec->sh.sh_link == symtab_idx &&
+		    sec->sh.sh_info == old_idx) {
+			sec->sh.sh_info = new_idx;
+			mark_sec_changed(elf, sec, true);
+			/*
+			 * Each ELF group should have a unique symbol key.
+			 * Return early on match.
+			 */
+			return;
+		}
+	}
+}
+
 /*
  * @sym's idx has changed.  Update the relocs which reference it.
  */
@@ -745,7 +769,7 @@ __elf_create_symbol(struct elf *elf, struct symbol *sym)
 
 	/*
 	 * Move the first global symbol, as per sh_info, into a new, higher
-	 * symbol index. This fees up a spot for a new local symbol.
+	 * symbol index. This frees up a spot for a new local symbol.
 	 */
 	first_non_local = symtab->sh.sh_info;
 	old = find_symbol_by_index(elf, first_non_local);
@@ -763,6 +787,7 @@ __elf_create_symbol(struct elf *elf, struct symbol *sym)
 		if (elf_update_sym_relocs(elf, old))
 			return NULL;
 
+		elf_update_group_sh_info(elf, symtab->idx, new_idx, first_non_local);
 		new_idx = first_non_local;
 	}
 
-- 
2.49.0.850.g28803427d3-goog

