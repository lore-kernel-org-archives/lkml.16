Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCCC22A814
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181235; cv=none; b=ZOQKgOrKofvwnkJmeU3g3lL5XcxKntF/FfZ89lLo9TqEfPN5wYluWummiWgbpfFdClZZSofsqUjt2Lw9aRwkgq8935IVQYSaQjM9VSw9z9Zrfxtd8WiqoxWaEa71cFQmNsBkKRAX39JjpQuOuuKSsjSZ+GA0ZDqAXt7wHRKSahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181235; c=relaxed/simple;
	bh=u1j0xmZoRnBzW8s0HMWnudNyoJzXBHt8pCUQz+ESzuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AqbSKbYXdX4GXylaYW1RD2opAKrOjgQq2Zu4NwVEqfjlxBRkhUpjHMCpzGTXo/j0S4DckvDDuHwLAcCOQyg2mZtLU1XWkZCt70eb4GPzx3OZhNmy5I8k/qUgZ784vEcXaRPQwQi8u5WDWfMyLK4vAVyV4tY+f3eJJX778FihPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=cVLsjI0q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="cVLsjI0q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso7191505e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1746181232; x=1746786032; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMtJkZBjun5r4V6RProzP3wHroZCQ0IdrQUIPRbgJLs=;
        b=cVLsjI0qtP+1CG6fIYQI7nf+/8z1ksm0jh6cHrgQDevSISvnxTnJd6zfC881v/eAy6
         A3an4iff/tbOFa8T7kcHD1dBna7iFLpHV7hVWCR/srZ2M8nnLyiKrS9YPNWbwvnCkp1o
         keFOha6vUg/pdKSJ0VlHQ+N8IpYG6vx5F3VXVfs+tm31gVt+Jd0t9Z40BTg0CRxvjBvv
         MGNV7m6WFL2UAG1cy1/euExF4LFiNakJMqaTCgJ4fh7HcPUxhpJuAwctSbkOEeKApOPa
         9GgX1a/vNzWeAcG2D0tYKU/infQsqmjJ9lYFJ700M8eLIgTaqY42Tp+V8q4Q+Djp7fxE
         aFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181232; x=1746786032;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMtJkZBjun5r4V6RProzP3wHroZCQ0IdrQUIPRbgJLs=;
        b=ZUX3oQmpAGgzDDm832OgHeWCLsvzojL1w8MemM8zyMLlubqxIX6/IqNYDnxcVyHZL+
         Fus4Uo1HZ+A5Sy4G18ccUka8wh58x2X/Ox1Z8ECK6taBY90nO3CGLcuwDYGHx8l5C4UE
         xZdwO/vEMBqfbREKZatWrX3kdbRCt7QKfRSaNuvu8cJX8kIxPs+mHPjHwf1au986PFtS
         XcyGb9oMLP9A7vIiGweVVOClD9ti/bGI2a3+1RIdgrV8lpL8+bhP+QH7ZvWWCtm4oviF
         vT2cAn2Ki6QwcnDTp/vyKOia3iM8YaY8ldK5iwod0ycjnvsv4472DkVNl6mPMLr+2Klv
         iXNA==
X-Forwarded-Encrypted: i=1; AJvYcCUHjp67q4+/HxtLJinBHe9wrbf8aJL4tUewNIKZyTLyFIy5Y7xvFAqxXuzCGIWCjtsyqujU9/NmrxtxM3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVoMBKneVcm7flcMLLdjtUdxYP3e2sQJ4SCQtI1pLwqDW+x8aV
	weFcOKsp24OMFX+Tmt924U/O828JKF4z5Ka5IBMrTwz22Seyp4viQ89iCnUjjPE=
X-Gm-Gg: ASbGncsFsuE5v3/71jQhNMZBIMVtyua/izMecuXHUCDtDaKjQ+OQEEpiBcIHjJtXBk8
	eQ7TF4eJzeznl5MHq5jllAfIMJdgBSlfDufWAYJPPoR/on9PA23+RH1ZCdb5uxW9HNjs18sE3/V
	OidfFWP/5+LFdbqDL+pojxyyBfNWEB9SbhHJMQ4cdX9J0P63ziAk5oXlO0z44oXHlvEUVk+SBEg
	jD9ZlP7GJu/anm5SRUQ2appAL5asYukmP8A4imGyxwUjdG28GI3/WUEzp+eRPi/0sf/Ba65TA0h
	AOMqWf7KKyBBGJc0IV2cHnW2Cd/z1+kH3GY7rwvP7XfXb0RGQyds2db4HxO2IxKfSsYp23Cumc8
	k89FAtogr8t/KNx4XVlCicKzga2yiVyOWGMKc4sDQe9Zi7eQ=
X-Google-Smtp-Source: AGHT+IEHjhGDCWU2ZicYHzORmLl7fKou5XinJhHqakSMdG3W/Xr6HSBzfM+uhzSB/14vI2WwqXdL4A==
X-Received: by 2002:a05:600c:3ca5:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-441bbed4726mr17576305e9.14.1746181231995;
        Fri, 02 May 2025 03:20:31 -0700 (PDT)
Received: from [192.168.1.240] (0.0.6.0.0.0.0.0.0.0.0.0.0.0.0.0.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:7a5a:26ff::600])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1742342f8f.92.2025.05.02.03.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:20:31 -0700 (PDT)
From: Lorenz Bauer <lmb@isovalent.com>
Subject: [PATCH bpf-next v2 0/3] Allow mmap of /sys/kernel/btf/vmlinux
Date: Fri, 02 May 2025 11:20:04 +0100
Message-Id: <20250502-vmlinux-mmap-v2-0-95c271434519@isovalent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFScFGgC/22Nyw6CMBBFf4XM2pp2sKKu/A/DotZBJqGPtNhgC
 P9uw9rlyck9d4VMiSnDrVkhUeHMwVfAQwN2NP5Ngl+VASVqqaUSxU3sP4twzkSBZLU+t7alQUG
 dxEQDL3vuAc84CE/LDH01I+c5pO/+U9Tu/yeLElIYgx2edIf6erlzDsVM5OejDQ76bdt+Da2w0
 LYAAAA=
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
 kernel/bpf/sysfs_btf.c                             | 36 +++++++++-
 tools/lib/bpf/btf.c                                | 82 +++++++++++++++++++---
 tools/testing/selftests/bpf/prog_tests/btf_sysfs.c | 82 ++++++++++++++++++++++
 4 files changed, 189 insertions(+), 14 deletions(-)
---
base-commit: 38d976c32d85ef12dcd2b8a231196f7049548477
change-id: 20250501-vmlinux-mmap-2ec5563c3ef1

Best regards,
-- 
Lorenz Bauer <lmb@isovalent.com>

