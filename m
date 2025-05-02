Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A523C4E9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181238; cv=none; b=un8E2DfXMPiKZmicbjJYu5R67Z4TQHx218E9zCekQ6ZRE5D0uqHHsXcSO6YIiCyupz+MiLcxCGVAaiABUPq4SfM0N9359DkhG6kIe7hknwbmobvpLV1weLRoviCgAe+AU3EKes5Ba+1w9J13GYMuxNY9BxAacd3eqaYhetLXNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181238; c=relaxed/simple;
	bh=ychg/Ta4S8UTx4Xf2MItnvBeDG7XnCP0C93pzW0Ay8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgjdKYUIuRZf8M59V01g0x/CJc8EiqottcQv5vYesMSzBNBTslz5Wo7zMpfW4XA0/B3yLFqhOCslgyIqdAxurJkfBl1FHlrVUaP4nxCYSCQI9QA4ADYjKFATOEDgKPv+eUZI5AbIsNTaX45DLZOn4oia5/IX+DHCkaxxd1/CuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=iFrMq2Kr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="iFrMq2Kr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso13969845e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1746181234; x=1746786034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BATcMPOI1ZCFC5PD+E37IaicFbjrMSjSWMu+X6OAJY=;
        b=iFrMq2KrEzxnqYfZpYrSkDcrZmSXTm2R2EtCbbwmyYKFjKSIIsFU86nA4vmhJg6ZuN
         DvnbFMh03gM6vDLUU/Hmo/dk5sY4h3QaiDpLxQYREkUU5q4XMgP2SSaeathVg5CFyQhe
         avLEtw4z9At7ELVDylYmj2FmgylcgBbpFIxe3PYfv4BHUaggnYgEw//Dmb7Oy26hGvd8
         3vUVhp8UTwb+b/38pMJui3OOujpePmtCAXWne/Mf9FGfNca2qzWipt2HbaLAlnthB9tg
         al9xKIId2v4KV1OijFmaGFnsGNufdTC+8q/DRLEL4csL3IbuuJcUHDlwEyL/gLncbGsn
         j/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181234; x=1746786034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BATcMPOI1ZCFC5PD+E37IaicFbjrMSjSWMu+X6OAJY=;
        b=rCMWMt7+fm1oIrYf4pbHPxoEApvQ0WeT+wwvn3zjNELwDy1XD9jS5cerca5F9NFsJH
         3TO2RHue0vlFWH1cfAujOHMZO+MCL8E4hz1RUGCOWSjsaZ+LjBOKCtb3uvbU4aV95uh1
         uKoMDwRKkpip8IZJJBNTxgmeniO7ylRzMHYVQEaTCSDuRThL7YQbl5YoEyhiElNTitiD
         /Kb/NFBWcG6e/k62hAAEryAX/wwyBx0KX8xOsm5WCzzXaJ9gCQH5K0cZgQTR6BB0Zn8H
         dRmZHelGKJHl8Z7KkMCL6538UJVf56cHurHM3pVdEdHlZhsmvk2qvlXdtjZhQmR+cmhI
         RnMg==
X-Forwarded-Encrypted: i=1; AJvYcCXIiW04iuD2ShMTWjl5FUcrs43k4CTVbuxBQ+ZqAJPaFA0dFA4NNXKa2FR5f0aJzX+xvEPTqsjg32KTL20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9JM714YdQCBlr5OVAdpBU3cX8IftdbcMLSScG19StMwBJKq0
	pYGS8zYDVB4ETF122UMC1JsozvDt3tlx6TrUuvvAG0Ea09lRsk0zosiGk9u2G2s=
X-Gm-Gg: ASbGnctBIruTL8XUu/jhoqI96RTdILI3DQwgZmMBwEGI2ebVOcyrdIbE/6RARE4FKoj
	V4/QIjbfNGEUY1V2A0gJmD9z2XqPgR3eo0JWwm+WsdsPKjHm1ltQ71Apu599QnR4eVBNXhR5ViJ
	pXk0VlFfDhRhKjMIxQUPeif7cpXIQNteJb+D3rWTi9io+lcUMdcEYZPGd8l6wf7Et5mZGcylI16
	h+mkKRKypTvx8lStXupB4sPUGQwi83mFggw2jtCh9H8g5JK573fvRVNeLRZHDULocfVzFa9/GKO
	d4ZzMPH+wcuYYCxgRp3bxOuabr2lEdnEiCEH+sytF2mmBkjsy+T69eESfZczrdlGe3smI32GJOF
	fjgcNk9hKlCJanFe4xcVr3qS+/Uv0YhPftuck
X-Google-Smtp-Source: AGHT+IFUHkTtc0DcElXRacw231nP94ZA8KvkgC+j1gjYc5WSrObc75yVcLMxn3UnSEc1kGWDOkoudA==
X-Received: by 2002:a05:600c:1e88:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-441bbeb3813mr16937805e9.11.1746181233840;
        Fri, 02 May 2025 03:20:33 -0700 (PDT)
Received: from [192.168.1.240] (0.0.6.0.0.0.0.0.0.0.0.0.0.0.0.0.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:7a5a:26ff::600])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1742342f8f.92.2025.05.02.03.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:20:33 -0700 (PDT)
From: Lorenz Bauer <lmb@isovalent.com>
Date: Fri, 02 May 2025 11:20:06 +0100
Subject: [PATCH bpf-next v2 2/3] selftests: bpf: add a test for mmapable
 vmlinux BTF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-vmlinux-mmap-v2-2-95c271434519@isovalent.com>
References: <20250502-vmlinux-mmap-v2-0-95c271434519@isovalent.com>
In-Reply-To: <20250502-vmlinux-mmap-v2-0-95c271434519@isovalent.com>
To: Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Lorenz Bauer <lmb@isovalent.com>
X-Mailer: b4 0.14.2

Add a basic test for the ability to mmap /sys/kernel/btf/vmlinux. Since
libbpf doesn't have an API to parse BTF from memory we do some basic
sanity checks ourselves.

Signed-off-by: Lorenz Bauer <lmb@isovalent.com>
---
 tools/testing/selftests/bpf/prog_tests/btf_sysfs.c | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/btf_sysfs.c b/tools/testing/selftests/bpf/prog_tests/btf_sysfs.c
new file mode 100644
index 0000000000000000000000000000000000000000..5c8095bedb0517930aabdecc17ca7043f80f3692
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/btf_sysfs.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Copyright (c) 2025 Isovalent */
+
+#include <test_progs.h>
+#include <bpf/btf.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#define BTF_MAGIC 0xeB9F
+
+static const char *btf_path = "/sys/kernel/btf/vmlinux";
+
+void test_btf_sysfs(void)
+{
+	struct stat st;
+	__u64 btf_size;
+	void *raw_data = NULL;
+	int fd = -1;
+	size_t trailing;
+	long page_size;
+	struct btf *btf = NULL;
+
+	page_size = sysconf(_SC_PAGESIZE);
+	if (!ASSERT_GE(page_size, 0, "get_page_size"))
+		goto cleanup;
+
+	if (!ASSERT_OK(stat(btf_path, &st), "stat_btf"))
+		goto cleanup;
+
+	btf_size = st.st_size;
+	trailing = page_size - (btf_size % page_size) % page_size;
+
+	fd = open(btf_path, O_RDONLY);
+	if (!ASSERT_GE(fd, 0, "open_btf"))
+		goto cleanup;
+
+	raw_data = mmap(NULL, btf_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	if (!ASSERT_EQ(raw_data, MAP_FAILED, "mmap_btf_writable"))
+		goto cleanup;
+
+	raw_data = mmap(NULL, btf_size, PROT_READ, MAP_SHARED, fd, 0);
+	if (!ASSERT_EQ(raw_data, MAP_FAILED, "mmap_btf_shared"))
+		goto cleanup;
+
+	raw_data = mmap(NULL, btf_size + trailing + 1, PROT_READ, MAP_PRIVATE, fd, 0);
+	if (!ASSERT_EQ(raw_data, MAP_FAILED, "mmap_btf_invalid_size"))
+		goto cleanup;
+
+	raw_data = mmap(NULL, btf_size, PROT_READ, MAP_PRIVATE, fd, 0);
+	if (!ASSERT_NEQ(raw_data, MAP_FAILED, "mmap_btf"))
+		goto cleanup;
+
+	if (!ASSERT_EQ(mprotect(raw_data, btf_size, PROT_READ | PROT_WRITE), -1,
+	    "mprotect_writable"))
+		goto cleanup;
+
+	if (!ASSERT_EQ(mprotect(raw_data, btf_size, PROT_READ | PROT_EXEC), -1,
+	    "mprotect_executable"))
+		goto cleanup;
+
+	/* Check padding is zeroed */
+	for (int i = 0; i < trailing; i++) {
+		if (((__u8 *)raw_data)[btf_size + i] != 0) {
+			PRINT_FAIL("tail of BTF is not zero at page offset %d\n", i);
+			goto cleanup;
+		}
+	}
+
+	btf = btf__new(raw_data, btf_size);
+	if (!ASSERT_NEQ(btf, NULL, "parse_btf"))
+		goto cleanup;
+
+cleanup:
+	if (raw_data && raw_data != MAP_FAILED)
+		munmap(raw_data, btf_size);
+	if (btf)
+		btf__free(btf);
+	if (fd >= 0)
+		close(fd);
+}

-- 
2.49.0

