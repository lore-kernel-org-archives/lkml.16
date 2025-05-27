Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15327C856
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369245; cv=none; b=ctl2Yhqc74Q63rvOdgzFnIi18VXEozOv2zPeFcPfsp6yOrnB2vRonqqWOyfqyEfsOo2zGrif2KJ21+ey5TOR/Z6DhF38xywycB+3/NHGHpA++yh87BskvsxB+9WO22431bV3LpcTQ8lrJkJqxvqxkxTlaHGl6OW2BprUO1bOmTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369245; c=relaxed/simple;
	bh=8yisZQ1iREgb7ZhjLzSFHwMf/rxLRWwZWOc+EPaBYno=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=acmuzJvCnDH5Pfwhj2z3zf/YZiyVX4C87j2ZvOCR6tDPV/J5uVqUlR2kcaLaB676GDqJJU0ayIPvF12FxkwlskraaOiVxpjD1wfzGzvg4Qau1PLEZ1vaUYmhfY8Ngaj1nz5DvFfaOe4UifMDbBstdDvZeGEA4bCOp1KaabWeEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAiPUkg4; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAiPUkg4"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7375e2642b4so2688016b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748369243; x=1748974043; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9hg7lkKYYzWN7zwsaMHuFSQpju7kbQ/1Bsg1JOrQa4=;
        b=vAiPUkg48SsVccPUoZFFZ/k+VCTFlN0knPgIVTOjP+s0u8MC9vmeY9Akp4xtyaDsnH
         Eo+hNfXVaK6CSh13HB83hoXTMDvIXnsaaA6OqBs29maueBNhyBIJCLWPr8Fhmf/TwakO
         yVdlw2TdMx4SaQr5hpxI+nSvhGqRT0jOBRrAaqywQxsl+BrWLUtd7CCA4hLr8hKYHz4u
         x7WUzaTmxiEczaBTvYhGfiOQ/4rJsyfFczDI4iRy+JwLjE4XufVEMFvk/XbiqMcGYsx7
         67S1OyWa36DjD7SIHtbvFYWZnrYtyRRtfSDM0FkA19Ouhwiv85uC2K04Jx1zkI/QJK8c
         D64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369243; x=1748974043;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9hg7lkKYYzWN7zwsaMHuFSQpju7kbQ/1Bsg1JOrQa4=;
        b=nPJE3LSIiblUzvAk4uoaDymd27f6hyJccTYtEplc724Ot0Y14rlCMwZA+YwL8BWobv
         bdoG6b8vOXGxuubOCqx9Gy30SLT4mLfvFljFlqevDzmAqw/i/Tf2/9++qBIWYt1k2Ijb
         UVgoHSJtCpxzGbs3Hn2aWzg+c/x0rmzJVI0JAvJn5pcsZs08qLKwSzf7ttejpCXEH2TT
         KOGjkIxNXqZEJs9PJBViQc89GYMF0agE8kH09B9S4CtQDlDUt/M6LpO1MK+XMUtDA8nD
         HINtXE2qNnRFIv73WJTQV9dA/G+ciQtz2pF7Jvet1yb07dD1Ize4S8vi575wOKNmv1wJ
         cA3w==
X-Forwarded-Encrypted: i=1; AJvYcCX7lLia12xqPfK8QCEnEgXHc6adEbPOIFV5vrRG543zr7T1vGRRGSZDH3ZnY0p3wXj+YNkQTACBfNOje7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHw7E9RVZIeVTy6h2jq13l3vWj700qwnrrZ7wa22msHPbKqDfu
	gZNGBCFI1LtVfHCTyBt6fl1sZoDidS55sgeF16dRIwmDnTB1hZJraflNmS4k/dZQ0Vz6qZIhGct
	10Q/tajwC9Q==
X-Google-Smtp-Source: AGHT+IFeLLiHfRw62kmSxkfeBVK3DqklQoi2IPwTszaZzMyvdchTtM8pUD30Bbi6gdB7MuqMd8wyXjXeTY/9
X-Received: from pga23.prod.google.com ([2002:a05:6a02:4f97:b0:b2c:4a89:4b36])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8ccb:b0:215:d38f:11d1
 with SMTP id adf61e73a8af0-2188c37f541mr23754168637.29.1748369243178; Tue, 27
 May 2025 11:07:23 -0700 (PDT)
Date: Tue, 27 May 2025 11:06:58 -0700
In-Reply-To: <20250527180703.129336-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180703.129336-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250527180703.129336-2-irogers@google.com>
Subject: [PATCH v1 1/6] perf symbol: Fix use-after-free in filename__read_build_id
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The same buf is used for the program headers and reading notes. As the
notes memory may be reallocated then this corrupts the memory pointed
to by the phdr. Using the same buffer is in any case a logic
error. Rather than deal with the duplicated code, introduce an elf32
boolean and a union for either the elf32 or elf64 headers that are in
use. Let the program headers have their own memory and grow the buffer
for notes as necessary.

Before `perf list -j` compiled with asan would crash with:
```
==4176189==ERROR: AddressSanitizer: heap-use-after-free on address 0x5160000070b8 at pc 0x555d3b15075b bp 0x7ffebb5a8090 sp 0x7ffebb5a8088
READ of size 8 at 0x5160000070b8 thread T0
    #0 0x555d3b15075a in filename__read_build_id tools/perf/util/symbol-minimal.c:212:25
    #1 0x555d3ae43aff in filename__sprintf_build_id tools/perf/util/build-id.c:110:8
...

0x5160000070b8 is located 312 bytes inside of 560-byte region [0x516000006f80,0x5160000071b0)
freed by thread T0 here:
    #0 0x555d3ab21840 in realloc (perf+0x264840) (BuildId: 12dff2f6629f738e5012abdf0e90055518e70b5e)
    #1 0x555d3b1506e7 in filename__read_build_id tools/perf/util/symbol-minimal.c:206:11
...

previously allocated by thread T0 here:
    #0 0x555d3ab21423 in malloc (perf+0x264423) (BuildId: 12dff2f6629f738e5012abdf0e90055518e70b5e)
    #1 0x555d3b1503a2 in filename__read_build_id tools/perf/util/symbol-minimal.c:182:9
...
```

Note: this bug is long standing and not introduced by the other asan
fix in commit fa9c4977fbfb ("perf symbol-minimal: Fix double free in
filename__read_build_id").

Fixes: b691f64360ecec49 ("perf symbols: Implement poor man's ELF parser")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol-minimal.c | 168 +++++++++++++------------------
 1 file changed, 70 insertions(+), 98 deletions(-)

diff --git a/tools/perf/util/symbol-minimal.c b/tools/perf/util/symbol-minimal.c
index d8da3da01fe6..c9b7a1ca5e52 100644
--- a/tools/perf/util/symbol-minimal.c
+++ b/tools/perf/util/symbol-minimal.c
@@ -90,11 +90,23 @@ int filename__read_build_id(const char *filename, struct build_id *bid)
 {
 	FILE *fp;
 	int ret = -1;
-	bool need_swap = false;
+	bool need_swap = false, elf32;
 	u8 e_ident[EI_NIDENT];
-	size_t buf_size;
-	void *buf;
 	int i;
+	union {
+		struct {
+			Elf32_Ehdr ehdr32;
+			Elf32_Phdr *phdr32;
+		};
+		struct {
+			Elf64_Ehdr ehdr64;
+			Elf64_Phdr *phdr64;
+		};
+	} hdrs;
+	void *phdr;
+	size_t phdr_size;
+	void *buf = NULL;
+	size_t buf_size = 0;
 
 	fp = fopen(filename, "r");
 	if (fp == NULL)
@@ -108,119 +120,79 @@ int filename__read_build_id(const char *filename, struct build_id *bid)
 		goto out;
 
 	need_swap = check_need_swap(e_ident[EI_DATA]);
+	elf32 = e_ident[EI_CLASS] == ELFCLASS32;
 
-	/* for simplicity */
-	fseek(fp, 0, SEEK_SET);
-
-	if (e_ident[EI_CLASS] == ELFCLASS32) {
-		Elf32_Ehdr ehdr;
-		Elf32_Phdr *phdr;
-
-		if (fread(&ehdr, sizeof(ehdr), 1, fp) != 1)
-			goto out;
+	if (fread(elf32 ? (void *)&hdrs.ehdr32 : (void *)&hdrs.ehdr64,
+		  elf32 ? sizeof(hdrs.ehdr32) : sizeof(hdrs.ehdr32),
+		  1, fp) != 1)
+		goto out;
 
-		if (need_swap) {
-			ehdr.e_phoff = bswap_32(ehdr.e_phoff);
-			ehdr.e_phentsize = bswap_16(ehdr.e_phentsize);
-			ehdr.e_phnum = bswap_16(ehdr.e_phnum);
+	if (need_swap) {
+		if (elf32) {
+			hdrs.ehdr32.e_phoff = bswap_32(hdrs.ehdr32.e_phoff);
+			hdrs.ehdr32.e_phentsize = bswap_16(hdrs.ehdr32.e_phentsize);
+			hdrs.ehdr32.e_phnum = bswap_16(hdrs.ehdr32.e_phnum);
+		} else {
+			hdrs.ehdr64.e_phoff = bswap_64(hdrs.ehdr64.e_phoff);
+			hdrs.ehdr64.e_phentsize = bswap_16(hdrs.ehdr64.e_phentsize);
+			hdrs.ehdr64.e_phnum = bswap_16(hdrs.ehdr64.e_phnum);
 		}
+	}
+	phdr_size = elf32 ? hdrs.ehdr32.e_phentsize * hdrs.ehdr32.e_phnum
+			  : hdrs.ehdr64.e_phentsize * hdrs.ehdr64.e_phnum;
+	phdr = malloc(phdr_size);
+	if (phdr == NULL)
+		goto out;
 
-		buf_size = ehdr.e_phentsize * ehdr.e_phnum;
-		buf = malloc(buf_size);
-		if (buf == NULL)
-			goto out;
-
-		fseek(fp, ehdr.e_phoff, SEEK_SET);
-		if (fread(buf, buf_size, 1, fp) != 1)
-			goto out_free;
-
-		for (i = 0, phdr = buf; i < ehdr.e_phnum; i++, phdr++) {
-			void *tmp;
-			long offset;
-
-			if (need_swap) {
-				phdr->p_type = bswap_32(phdr->p_type);
-				phdr->p_offset = bswap_32(phdr->p_offset);
-				phdr->p_filesz = bswap_32(phdr->p_filesz);
-			}
-
-			if (phdr->p_type != PT_NOTE)
-				continue;
-
-			offset = phdr->p_offset;
-			if (phdr->p_filesz > buf_size) {
-				buf_size = phdr->p_filesz;
-				tmp = realloc(buf, buf_size);
-				if (tmp == NULL)
-					goto out_free;
-				buf = tmp;
-			}
-			fseek(fp, offset, SEEK_SET);
-			if (fread(buf, phdr->p_filesz, 1, fp) != 1)
-				goto out_free;
+	fseek(fp, elf32 ? hdrs.ehdr32.e_phoff : hdrs.ehdr64.e_phoff, SEEK_SET);
+	if (fread(phdr, phdr_size, 1, fp) != 1)
+		goto out_free;
 
-			ret = read_build_id(buf, phdr->p_filesz, bid, need_swap);
-			if (ret == 0) {
-				ret = bid->size;
-				break;
-			}
-		}
-	} else {
-		Elf64_Ehdr ehdr;
-		Elf64_Phdr *phdr;
+	if (elf32)
+		hdrs.phdr32 = phdr;
+	else
+		hdrs.phdr64 = phdr;
 
-		if (fread(&ehdr, sizeof(ehdr), 1, fp) != 1)
-			goto out;
+	for (i = 0; i < elf32 ? hdrs.ehdr32.e_phnum : hdrs.ehdr64.e_phnum; i++) {
+		size_t p_filesz;
 
 		if (need_swap) {
-			ehdr.e_phoff = bswap_64(ehdr.e_phoff);
-			ehdr.e_phentsize = bswap_16(ehdr.e_phentsize);
-			ehdr.e_phnum = bswap_16(ehdr.e_phnum);
+			if (elf32) {
+				hdrs.phdr32[i].p_type = bswap_32(hdrs.phdr32[i].p_type);
+				hdrs.phdr32[i].p_offset = bswap_32(hdrs.phdr32[i].p_offset);
+				hdrs.phdr32[i].p_filesz = bswap_32(hdrs.phdr32[i].p_offset);
+			} else {
+				hdrs.phdr64[i].p_type = bswap_32(hdrs.phdr64[i].p_type);
+				hdrs.phdr64[i].p_offset = bswap_64(hdrs.phdr64[i].p_offset);
+				hdrs.phdr64[i].p_filesz = bswap_64(hdrs.phdr64[i].p_filesz);
+			}
 		}
+		if ((elf32 ? hdrs.phdr32[i].p_type : hdrs.phdr64[i].p_type) != PT_NOTE)
+			continue;
 
-		buf_size = ehdr.e_phentsize * ehdr.e_phnum;
-		buf = malloc(buf_size);
-		if (buf == NULL)
-			goto out;
-
-		fseek(fp, ehdr.e_phoff, SEEK_SET);
-		if (fread(buf, buf_size, 1, fp) != 1)
-			goto out_free;
-
-		for (i = 0, phdr = buf; i < ehdr.e_phnum; i++, phdr++) {
+		p_filesz = elf32 ? hdrs.phdr32[i].p_filesz : hdrs.phdr64[i].p_filesz;
+		if (p_filesz > buf_size) {
 			void *tmp;
-			long offset;
-
-			if (need_swap) {
-				phdr->p_type = bswap_32(phdr->p_type);
-				phdr->p_offset = bswap_64(phdr->p_offset);
-				phdr->p_filesz = bswap_64(phdr->p_filesz);
-			}
-
-			if (phdr->p_type != PT_NOTE)
-				continue;
 
-			offset = phdr->p_offset;
-			if (phdr->p_filesz > buf_size) {
-				buf_size = phdr->p_filesz;
-				tmp = realloc(buf, buf_size);
-				if (tmp == NULL)
-					goto out_free;
-				buf = tmp;
-			}
-			fseek(fp, offset, SEEK_SET);
-			if (fread(buf, phdr->p_filesz, 1, fp) != 1)
+			buf_size = p_filesz;
+			tmp = realloc(buf, buf_size);
+			if (tmp == NULL)
 				goto out_free;
+			buf = tmp;
+		}
+		fseek(fp, elf32 ? hdrs.phdr32[i].p_offset : hdrs.phdr64[i].p_offset, SEEK_SET);
+		if (fread(buf, p_filesz, 1, fp) != 1)
+			goto out_free;
 
-			ret = read_build_id(buf, phdr->p_filesz, bid, need_swap);
-			if (ret == 0) {
-				ret = bid->size;
-				break;
-			}
+		ret = read_build_id(buf, p_filesz, bid, need_swap);
+		if (ret == 0) {
+			ret = bid->size;
+			break;
 		}
 	}
 out_free:
 	free(buf);
+	free(phdr);
 out:
 	fclose(fp);
 	return ret;
-- 
2.49.0.1204.g71687c7c1d-goog

