Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06B17A2EC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369240; cv=none; b=YQzOz+6QMAA/7Bce51TaSHb+nRtWJR0ggLIYHFKvNoXLfMImqpsrCXJwcpNdXGtxiecBCeH65DMWjE3lTVIVLPalPsfh4o0Inpqv/jwf+6CL/ePZpgNSJDrYUlKpWanmBE7Oc6Ba1rAMZ96vxZQa8EwI8g6nzPlWXU8OOnmapwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369240; c=relaxed/simple;
	bh=tuY/QNQk/F9SugrUgSfFsgzuGaTIb2SuuPlR/76U+A8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LDs1MmAAwqOwD0A27gyuPcS9RlnJpP/JBgWQPj0OSiKerVm0tfAZG7gLJduJrQaUn5Mc643notnphsbFrauJ0euCy7BzLSQBbY//dqSXkGIzZUMd2K7jXt7dnAATiF0nPW4lrWw/lcxRf4D0UdcKVdBk7AN8kBYJJgy/DJdXGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSrKarQ4; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSrKarQ4"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30364fc706fso6202007a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743369238; x=1743974038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=61IYoBnyZqJEMEpkuy3cn0SZfZ0XGPVC6El2dNeevTQ=;
        b=MSrKarQ4eiBdkKzw55QshBdp7cp8chyr4CABIpQ4u8jkYg/AYGqv/qvkMbcMAhYnK+
         5eIlc/xEQRM79Wf/iar2zzrRSGcrIlTboJyPb68MXKsfMYJtYBIWRpTayM61I68nFpq5
         gzg2iscxRhIB6Hu6L2Z+NMO75PYGNxef3swBxsiQY1A24JiDtRe+kQa3bHprCSmini/9
         Z2/7Hcx2dnI1VUeoCT55C+uo6KzfytYHEje+sw+1XGk1Jb4eRZhg5zw2Q2O7UymazgkJ
         s5kvnePPhFz5bXqsfDIx8anFlHggHgcL+OUIaHiR3GQ1f+JZskzyqVWHm7hdkZEr0a+O
         +iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743369238; x=1743974038;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61IYoBnyZqJEMEpkuy3cn0SZfZ0XGPVC6El2dNeevTQ=;
        b=j06lPmpEt+TqqPwBurfGFrtefZojeOZY1oeYbXrt18YBHWuhtOqqnnMYagkrMiiWhk
         k1FhkboIPal0qwLeszHxJKn15GHHxd+cC6fDtgOEEN8AUkycdA/+TXK0yOAb98RDVPbv
         2K2/dLve1zkTc7l1k1sGsgBlEKLZRxvBec3SDHEXy8+WLDMxT4sSVD0Op+K8iD8mge+O
         QQ7Ebm5zX8jveBSYcEol/PBcbiOt84lDNQy0wyncA4H63mK6wYUKPFSiel5WlS8WyWzp
         ykxHXFn9Rant5Z4dPTrw0LcaCVVm8ZNC8ACH35O/S9iXG01cmXz/SnoA4FpoRc3Ztj/P
         7uIA==
X-Gm-Message-State: AOJu0YyZhrCdTDEKNa63rpSmbrjsY31mJ/2ANnvBFnUsmgRegiPepyNv
	8XFVO6+WYTTgQ9h31u+x90jlRnTaA+Ojdgzi4zDtB0VOgpgnOttYPZPGyhdglaZM3tz+aJMI7iU
	VZylq6LFAGA==
X-Google-Smtp-Source: AGHT+IExA/Qh/zET4rYRjfCGWnHQ2oDyUcaf7FrxoGsylJCTJr1cZxpuLWN9JGul9NvyF2ynMXNVsUSEXVUzfA==
X-Received: from pjbqn11.prod.google.com ([2002:a17:90b:3d4b:b0:2ea:29de:af10])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e8d:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-30531f7c03bmr12282871a91.4.1743369238499;
 Sun, 30 Mar 2025 14:13:58 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:13:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250330211325.530677-1-cmllamas@google.com>
Subject: [PATCH bpf] libbpf: Fix implicit memfd_create() for bionic
From: Carlos Llamas <cmllamas@google.com>
To: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alastair Robertson <ajor@meta.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Carlos Llamas <cmllamas@google.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Since memfd_create() is not consistently available across different
bionic libc implementations, using memfd_create() directly can break
some Android builds:

  tools/lib/bpf/linker.c:576:7: error: implicit declaration of function 'memfd_create' [-Werror,-Wimplicit-function-declaration]
    576 |         fd = memfd_create(filename, 0);
        |              ^

To fix this, relocate and inline the sys_memfd_create() helper so that
it can be used in "linker.c". Similar issues were previously fixed by
commit 9fa5e1a180aa ("libbpf: Call memfd_create() syscall directly").

Cc: Alastair Robertson <ajor@meta.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Fixes: 6d5e5e5d7ce1 ("libbpf: Extend linker API to support in-memory ELF files")
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 tools/lib/bpf/libbpf.c          | 9 ---------
 tools/lib/bpf/libbpf_internal.h | 9 +++++++++
 tools/lib/bpf/linker.c          | 2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 194809da5172..1f36e16461e1 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1719,15 +1719,6 @@ static Elf64_Sym *find_elf_var_sym(const struct bpf_object *obj, const char *nam
 	return ERR_PTR(-ENOENT);
 }
 
-/* Some versions of Android don't provide memfd_create() in their libc
- * implementation, so avoid complications and just go straight to Linux
- * syscall.
- */
-static int sys_memfd_create(const char *name, unsigned flags)
-{
-	return syscall(__NR_memfd_create, name, flags);
-}
-
 #ifndef MFD_CLOEXEC
 #define MFD_CLOEXEC 0x0001U
 #endif
diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_internal.h
index de498e2dd6b0..19770402807f 100644
--- a/tools/lib/bpf/libbpf_internal.h
+++ b/tools/lib/bpf/libbpf_internal.h
@@ -666,6 +666,15 @@ static inline int sys_dup3(int oldfd, int newfd, int flags)
 	return syscall(__NR_dup3, oldfd, newfd, flags);
 }
 
+/* Some versions of Android don't provide memfd_create() in their libc
+ * implementation, so avoid complications and just go straight to Linux
+ * syscall.
+ */
+static inline int sys_memfd_create(const char *name, unsigned flags)
+{
+	return syscall(__NR_memfd_create, name, flags);
+}
+
 /* Point *fixed_fd* to the same file that *tmp_fd* points to.
  * Regardless of success, *tmp_fd* is closed.
  * Whatever *fixed_fd* pointed to is closed silently.
diff --git a/tools/lib/bpf/linker.c b/tools/lib/bpf/linker.c
index b52f71c59616..077af6f8bebb 100644
--- a/tools/lib/bpf/linker.c
+++ b/tools/lib/bpf/linker.c
@@ -573,7 +573,7 @@ int bpf_linker__add_buf(struct bpf_linker *linker, void *buf, size_t buf_sz,
 
 	snprintf(filename, sizeof(filename), "mem:%p+%zu", buf, buf_sz);
 
-	fd = memfd_create(filename, 0);
+	fd = sys_memfd_create(filename, 0);
 	if (fd < 0) {
 		ret = -errno;
 		pr_warn("failed to create memfd '%s': %s\n", filename, errstr(ret));
-- 
2.49.0.472.ge94155a9ec-goog

