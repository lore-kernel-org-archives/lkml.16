Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3F221726
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746880515; cv=none; b=MeYnYM7ZI0Mjud0zs/A4iK1jP5HGDTrAzp5PKhHcr2wAgWSZ+E0Cc4f00Fno9UH0wATpjZkTK+T1pxT9jUipVfufWY24kXGEDMixaM39ZHsvwdbe8QqMR3YIt3fbY14sS1DvvN5yJi4pNB/YF9Uam/jBtdTn77iamz5PaaaPKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746880515; c=relaxed/simple;
	bh=/ckQmMjYXPc0qzguSPFnO/DSHuOJdODbmEv9P7rc2OY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHE5+4WR2v9D/hNkj5KMEyvoyhY8O40KF39ifxTjEO+KLRXQZFwJ1++mzZV2xhKFBsbEU3qgg3bLk835rZUpq0aJ5fKarr9CgvljDEJ6MGRdxhSEbf/I+ZZesCXi/+JSdf2+Ndq2Qt+SK7TbR68T5O3wXJUfJ+oB8uh4H4IbHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=UPNfGyDJ; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="UPNfGyDJ"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f5373067b3so42980386d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1746880511; x=1747485311; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvudCl1s3CkH612+A5JcVTVNc6EQKQEW50vE6gNIcf0=;
        b=UPNfGyDJZum5T92EIlTtyK+OdXkq+lcbL0uJ/YF0UyVkf2s7vu/LMEzaFFhy+0TooD
         KYnxt1q0/uP+0y8mg4uvdu67/cPavgnUbUoqBwSn6syNmHbOoBgqg0xL6AN61Kcuzw0F
         sd56vPtgBrDWz1ghv+DCCi5Db1XI2s4Vr82LnOVzsRv3fancz0JpgZ3s3X2za0GGg6hi
         UxNZH9cTO1mS4A7rVvXVO9HFtRRktjJB2hSloOq3mQC1b639d83OMy2e6YEAHh6nWgwH
         Pp6Rf/AtP0jjoLOsis1P4VKs4F7vmtr+4W4ZkwtwHj7XHXhTcfGu6czdJOJXy3aAWvFT
         w1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746880511; x=1747485311;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvudCl1s3CkH612+A5JcVTVNc6EQKQEW50vE6gNIcf0=;
        b=dh4j7dL68VkyHnTA2ZSU+DAsODgm20CFkdLZaoW4rsZ2eB3yUd4i6yFHIirqCpWg0t
         RZ1R2OoSUYe2q4oFyVKjD52pMYfimVExL/W+4CJkP5GZDR3FN+uRNaLudOgyXiHlpPj1
         YquoMVpjj3fT2F2LbxlEw96L85grIC/3o3K7WjmIRrYSDPf+4MQqbY67/LocKVBl1tz3
         3NhBmoEkYiBboGU3DJ6Frrhyy4hDOp++GMIg9DdGTRGW/TviPtAOoftIC0yGpqDMKeMd
         wz4ymD3kRhLY3sGHEHVWkVxFBrM7BU55yBBJXUn7dlATi429nKXUhe2hp0wIHO42WaxK
         0NXA==
X-Forwarded-Encrypted: i=1; AJvYcCVafa06Wfkql5MSTdgupl6aeYYmsItZMBSxUE2g02g0kG2RgFTVCQTbiLaWsktCuHAbONxI32HmBSvnqHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJ0soPD9JHN15+fBOKx3zCsJDIpWJE3qwCDXA0dv/uEpUUiVJ
	JbmcxaUy/0Fz+1eG0BmXSGNGDRh5Cxw2sda0jGOHiTNs7k6ZeEwvjjJZUgTt170=
X-Gm-Gg: ASbGncvdACcqdaOW4Tt0wiN73Mve/jbbKIj1S8KgvRovQ3thnsfoQZcofw6HaLT05M3
	/ckD8QlaQoW/xwWbLJH0BNFVzmvmWYUtqZMs00J8PIO2NZ8siWa4+TU0Srr3gEuo0eVsEa7s5a8
	uNrUjcTCAVU4sySwKihTBGpP+QCQfQOhjJ40lYDgwM6eGfUzCjq4zzrMJCNJFhQUXquGBmMNpDp
	1aSVj43l4ej71CRThcEvJ+DXtnn0AyjFeYObSD/sDw91AeZTIfiKOlBVBqTfG4S7HPFMjiZN+ZJ
	77qC5pileFtU2a01GdIfMW8Ew1ASc+uM0D7qsAzE6qs9CgyYqTQcxOlNHpYaU6VcClI0k5g3tmA
	Tq7e1Zss=
X-Google-Smtp-Source: AGHT+IGV3CkDLoaVZ5BDOeHt3RqBddq11DlW+JHa+EzdYifXCxWkWda7wfe6HMzsvO+ohUEdlIZpIA==
X-Received: by 2002:a05:6214:c64:b0:6ea:d033:2855 with SMTP id 6a1803df08f44-6f6e47cb39fmr99649916d6.26.1746880510957;
        Sat, 10 May 2025 05:35:10 -0700 (PDT)
Received: from [192.168.1.45] (ool-182edad1.dyn.optonline.net. [24.46.218.209])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39f588asm25725556d6.49.2025.05.10.05.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 05:35:10 -0700 (PDT)
From: Lorenz Bauer <lmb@isovalent.com>
Subject: [PATCH bpf-next v4 0/3] Allow mmap of /sys/kernel/btf/vmlinux
Date: Sat, 10 May 2025 08:34:53 -0400
Message-Id: <20250510-vmlinux-mmap-v4-0-69e424b2a672@isovalent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1HH2gC/23OQQ6CMBAF0KuYrq1ppwyIK+9hXNQySBNoCcUGQ
 7i7DSuCLH9+5v2ZWaDBUmC308wGijZY71LIzidmGu3exG2VMgMBKFBIHrvWus/Eu073HMgg5so
 oqiVLJ/1AtZ1W7sFefc0dTSN7pqaxYfTDd92Jcu2PySi54FpDARkWgOX1boOPuiU3XozvVizCF
 oAdAAko0UAhM5WhLI8AtQVwB6gEYIVK11rkgv4+WJblB/OdXWE4AQAA
X-Change-ID: 20250501-vmlinux-mmap-2ec5563c3ef1
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

I'd like to cut down the memory usage of parsing vmlinux BTF in ebpf-go.
With some upcoming changes the library is sitting at 5MiB for a parse.
Most of that memory is simply copying the BTF blob into user space.
By allowing vmlinux BTF to be mmapped read-only into user space I can
cut memory usage by about 75%.

Signed-off-by: Lorenz Bauer <lmb@isovalent.com>
---
Changes in v4:
- Go back to remap_pfn_range for aarch64 compat
- Dropped btf_new_no_copy (Andrii)
- Fixed nits in selftests (Andrii)
- Clearer error handling in the mmap handler (Andrii)
- Fixed build on s390
- Link to v3: https://lore.kernel.org/r/20250505-vmlinux-mmap-v3-0-5d53afa060e8@isovalent.com

Changes in v3:
- Remove slightly confusing calculation of trailing (Alexei)
- Use vm_insert_page (Alexei)
- Simplified libbpf code
- Link to v2: https://lore.kernel.org/r/20250502-vmlinux-mmap-v2-0-95c271434519@isovalent.com

Changes in v2:
- Use btf__new in selftest
- Avoid vm_iomap_memory in btf_vmlinux_mmap
- Add VM_DONTDUMP
- Add support to libbpf
- Link to v1: https://lore.kernel.org/r/20250501-vmlinux-mmap-v1-0-aa2724572598@isovalent.com

---
Lorenz Bauer (3):
      btf: allow mmap of vmlinux btf
      selftests: bpf: add a test for mmapable vmlinux BTF
      libbpf: Use mmap to parse vmlinux BTF from sysfs

 include/asm-generic/vmlinux.lds.h                  |  3 +-
 kernel/bpf/sysfs_btf.c                             | 32 ++++++++
 tools/lib/bpf/btf.c                                | 85 ++++++++++++++++++----
 tools/testing/selftests/bpf/prog_tests/btf_sysfs.c | 81 +++++++++++++++++++++
 4 files changed, 184 insertions(+), 17 deletions(-)
---
base-commit: 7220eabff8cb4af3b93cd021aa853b9f5df2923f
change-id: 20250501-vmlinux-mmap-2ec5563c3ef1

Best regards,
-- 
Lorenz Bauer <lmb@isovalent.com>

