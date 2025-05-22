Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2B2C0300
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955081; cv=none; b=eq5CW8EXB39sAkKAZPd3VGykNO8Mj+ix8zn96EBDUbD3b7WeUrPtRQuXiuOBDtAymnpoBFa1UB9UrcDrcHdWe2lnzbG8O1EoDK1JISxrjIXZ1W+E+SmRVrLaZvJN9azTspH1EOekQEOyHYWsQgMeH2u5LPP+Vn1FaOSarspfKmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955081; c=relaxed/simple;
	bh=IHKCJFCb4uN/VwfkT7MnvJY97xBNxHu8YTU21MUfUMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DKyQTNCw0AO2fiZoe7flFmxlFKJuLa4YPqkTmkPh/Rn2Hxj8IHaqXm5WLH1lvV2KF/Lpc4KjbNcewyRjtjpyyjnr1pm15BTFEkom5EyQ9M6noBzr1MPD9RcjQYBsHpff+5fYy58+FDeafPCxdrCF1PF9RgxWUF+dlk3nOuGVxsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R7RwtVxF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R7RwtVxF"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so6720912a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747955079; x=1748559879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8dGj0Abdvh7XPjbZNccc6ABk5KSqfYP94dRpsBQEFQ=;
        b=R7RwtVxFyazUF+wQiL9wn/nJMCOpUyeDjcrhvHH82evd2YRm3N3pFwbNbRlxDpn6dJ
         o5kArG+6X4V0UhBAfaKk4aYoxM4j2dKQC/rLvSKyh3k/w/WiTPPxwAxQgTeh53DLlDcq
         msd5sF5x80sXes22oTwhNODqKINXLIldQ/BmzThhBXnHA7TSQw2tUxt8hbAByQftZAsK
         mrpTGe5R0N5/cOsviIynMk64oqKuKu5ailHUO2QeLNADacOT3+YB627s2pkK7A/Ko0xj
         o99+2JDLM8+BXBeKYH+HvIE3Wxg6+zioHB3ViplCKFn7HXmy6+GcwLyw1v8u6SDPd61m
         tjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955079; x=1748559879;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8dGj0Abdvh7XPjbZNccc6ABk5KSqfYP94dRpsBQEFQ=;
        b=wARQ6GWY5ON/BGbb1uRBPnUXwNsEWAVZB2fcGJYDHOvTjh+iPpnj/q40J+CwX6Cs8l
         EcyluiNqTr7R0r0ZA+sB/93vY9rAKTf/MQ24qDvqMekm8m9Qwb4+RWZtgBW2wpQfZWWi
         LDMqLKhkv4C28Nf8+vsxsiR11r/AYzzR88c12Vz4kz+OnFV59lqkM1LMYoMYbxLAtDDG
         FfAo229ovFSwMMdys2pHrqQ4YZHli2bVlgI2tnIak/wyBZz65c5L4ATQL0u9QVzoJVhU
         qSTosVzvtHJDf4e1TbVYaU3cZVSSrlK3frVWI2n3EXUeTD4si2tdOE3BIVcAuryeBBwZ
         mRzg==
X-Gm-Message-State: AOJu0YysbaOXpgk3LX/6R4YlgU2Zn3uEUpIup9GVLuB520bxD474bFHe
	bOPRrXbZqElirzk9UmVRMMyL+8+RRu0uJbjCDbuVIiR0TfsQ1iIxAsOqLjIKwxQJ+3ZiULGIcEU
	xJytQyLRTn6mUR079qg==
X-Google-Smtp-Source: AGHT+IEwmzIUT8YGStliPU77KEwWDLWWSMW6VUWezx0zqgoWVOlibiGqHVnAaZczx2UCmbfZm6yPSMlECmgJUJ0=
X-Received: from pjbsi6.prod.google.com ([2002:a17:90b:5286:b0:2fc:1158:9fe5])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3806:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-310e96e2ed3mr1380738a91.15.1747955078942;
 Thu, 22 May 2025 16:04:38 -0700 (PDT)
Date: Thu, 22 May 2025 23:04:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522230429.941193-1-tjmercier@google.com>
Subject: [PATCH bpf-next v7 0/5] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Until CONFIG_DMABUF_SYSFS_STATS was added [1] it was only possible to
perform per-buffer accounting with debugfs which is not suitable for
production environments. Eventually we discovered the overhead with
per-buffer sysfs file creation/removal was significantly impacting
allocation and free times, and exacerbated kernfs lock contention. [2]
dma_buf_stats_setup() is responsible for 39% of single-page buffer
creation duration, or 74% of single-page dma_buf_export() duration when
stressing dmabuf allocations and frees.

I prototyped a change from per-buffer to per-exporter statistics with a
RCU protected list of exporter allocations that accommodates most (but
not all) of our use-cases and avoids almost all of the sysfs overhead.
While that adds less overhead than per-buffer sysfs, and less even than
the maintenance of the dmabuf debugfs_list, it's still *additional*
overhead on top of the debugfs_list and doesn't give us per-buffer info.

This series uses the existing dmabuf debugfs_list to implement a BPF
dmabuf iterator, which adds no overhead to buffer allocation/free and
provides per-buffer info. The list has been moved outside of
CONFIG_DEBUG_FS scope so that it is always populated. The BPF program
loaded by userspace that extracts per-buffer information gets to define
its own interface which avoids the lack of ABI stability with debugfs.

This will allow us to replace our use of CONFIG_DMABUF_SYSFS_STATS, and
the plan is to remove it from the kernel after the next longterm stable
release.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@goo=
gle.com
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.c=
om

v1: https://lore.kernel.org/all/20250414225227.3642618-1-tjmercier@google.c=
om
v1 -> v2:
Make the DMA buffer list independent of CONFIG_DEBUG_FS per Christian
  K=C3=B6nig
Add CONFIG_DMA_SHARED_BUFFER check to kernel/bpf/Makefile per kernel
  test robot
Use BTF_ID_LIST_SINGLE instead of BTF_ID_LIST_GLOBAL_SINGLE per Song Liu
Fixup comment style, mixing code/declarations, and use ASSERT_OK_FD in
  selftest per Song Liu
Add BPF_ITER_RESCHED feature to bpf_dmabuf_reg_info per Alexei
  Starovoitov
Add open-coded iterator and selftest per Alexei Starovoitov
Add a second test buffer from the system dmabuf heap to selftests
Use the BPF program we'll use in production for selftest per Alexei
  Starovoitov
  https://r.android.com/c/platform/system/bpfprogs/+/3616123/2/dmabufIter.c
  https://r.android.com/c/platform/system/memory/libmeminfo/+/3614259/1/lib=
dmabufinfo/dmabuf_bpf_stats.cpp
v2: https://lore.kernel.org/all/20250504224149.1033867-1-tjmercier@google.c=
om
v2 -> v3:
Rebase onto bpf-next/master
Move get_next_dmabuf() into drivers/dma-buf/dma-buf.c, along with the
  new get_first_dmabuf(). This avoids having to expose the dmabuf list
  and mutex to the rest of the kernel, and keeps the dmabuf mutex
  operations near each other in the same file. (Christian K=C3=B6nig)
Add Christian's RB to dma-buf: Rename debugfs symbols
Drop RFC: dma-buf: Remove DMA-BUF statistics
v3: https://lore.kernel.org/all/20250507001036.2278781-1-tjmercier@google.c=
om
v3 -> v4:
Fix selftest BPF program comment style (not kdoc) per Alexei Starovoitov
Fix dma-buf.c kdoc comment style per Alexei Starovoitov
Rename get_first_dmabuf / get_next_dmabuf to dma_buf_iter_begin /
  dma_buf_iter_next per Christian K=C3=B6nig
Add Christian's RB to bpf: Add dmabuf iterator
v4: https://lore.kernel.org/all/20250508182025.2961555-1-tjmercier@google.c=
om
v4 -> v5:
Add Christian's Acks to all patches
Add Song Liu's Acks
Move BTF_ID_LIST_SINGLE and DEFINE_BPF_ITER_FUNC closer to usage per
  Song Liu
Fix open-coded iterator comment style per Song Liu
Move iterator termination check to its own subtest per Song Liu
Rework selftest buffer creation per Song Liu
Fix spacing in sanitize_string per BPF CI
v5: https://lore.kernel.org/all/20250512174036.266796-1-tjmercier@google.co=
m
v5 -> v6:
Song Liu:
  Init test buffer FDs to -1
  Zero-init udmabuf_create for future proofing
  Bail early for iterator fd/FILE creation failure
  Dereference char ptr to check for NUL in sanitize_string()
  Move map insertion from create_test_buffers() to test_dmabuf_iter()
  Add ACK to selftests/bpf: Add test for open coded dmabuf_iter
v6: https://lore.kernel.org/all/20250513163601.812317-1-tjmercier@google.co=
m
v6 -> v7:
Zero uninitialized name bytes following the end of name strings per
  s390x BPF CI
Reorder sanitize_string bounds checks per Song Liu
Add Song's Ack to: selftests/bpf: Add test for dmabuf_iter
Rebase onto bpf-next/master per BPF CI

T.J. Mercier (5):
  dma-buf: Rename debugfs symbols
  bpf: Add dmabuf iterator
  bpf: Add open coded dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  selftests/bpf: Add test for open coded dmabuf_iter

 drivers/dma-buf/dma-buf.c                     |  98 ++++--
 include/linux/dma-buf.h                       |   4 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 150 +++++++++
 kernel/bpf/helpers.c                          |   5 +
 .../testing/selftests/bpf/bpf_experimental.h  |   5 +
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 285 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c | 101 +++++++
 9 files changed, 632 insertions(+), 22 deletions(-)
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c


base-commit: 6888a036cfc3d617d0843ecc9bd8504e91fb9de6
--=20
2.49.0.1151.ga128411c76-goog

