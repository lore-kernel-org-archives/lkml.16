Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81C7188733
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671167; cv=none; b=CPx/GBREiJrzFnEVDtrJYgzhjjsHFKjoY4mRv88ZxqZkonvzW+iEPQ//zk3fyNELyaLNgsKmbYRrzAAtRfHPFszDA7it6GtqisRyIvo5wvWf68GJi8VJPVh6nt17OGkkC+pve4E9PBXUSx/EsJTVEg9Kee0UA6rN8JZz/0TjWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671167; c=relaxed/simple;
	bh=DXp2kkpKK/EYqS0S987rmP7LN93yWyxy4no1bYoxMA8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PUd3SLjMOq80UgYCHtp1MBr/ts6mGMoT/WftGF1TloWGQ8hwqIqvdZb3nHh3wvIaIxekXEumSWda+DAC63vCcU0zP5r5u/GnnPe2JQN+SpfbvFzVbU682pbg+bP1SeKjjExIEhJccZWfj7gVd5Qz2WK8y83YGJ6CI17LyUN2bv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTauXnyL; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTauXnyL"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so4604346a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744671164; x=1745275964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=togwTMsUrCvDnQk9l1lLNxbmxkHmbN4j0HA8wPGqV8E=;
        b=YTauXnyL1oNuf6bf+pOU3j+VR6jOrmOUffUhKe8/hBY39zGKg6vvwm2im5nBaSSvNW
         XKn41Io3DyO+I6LjrDD35PM6amJ/8FPQyCZKSw9CiJIfkC36kidWvvpfUxgPTm+jrsgY
         mrgH7pzTOsGR3aX0dJ/ucjwRZgfaJdcuCjqGHUm3SjsJXyt6tBe8DLAApz5S74Zto1sP
         w/eq9NGQEz2wtbt90GtS6sOrcrw9Xs9xcbEbUr/KSLDODJQEWljjKFvUpMJtcEGLb+Nb
         PWiXMNkIcP8L0YucefatIP5NZiw8Sji/tkmPerc46S5A6gz5Jtg1c+L+lMLlg9x6xjSv
         1iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744671164; x=1745275964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=togwTMsUrCvDnQk9l1lLNxbmxkHmbN4j0HA8wPGqV8E=;
        b=GPPTUSf7IKgV9+jkOHNgNX1Bk7FcCRrNyWXkwJp4j9KJ0I8EZ82vhWQ75QeYR/Ru8s
         0WvFDal0+/N31O6UsWduKKqReTzanV3b/he3hAAKPhwQhiIJKsbnjMuyjMEJoAgv9dKy
         CUXHEws9J3iOzh0Ze9Lkprc0wiXs/DFyfRJGPvK7AzS3l+ACobwe+yjW+lMoC6fixbSP
         tkFIY7TqEPDdEtemShQwt5jxTrTClyew6U31lZF0ksQAfIssp8Wg5qeo4HoG0fMKUQaV
         3vaChqxOgDsOFwoo0jkhrYd1bRnFDs19425CF/pQ0cRTk24rMw9ZYY8N8ZTF6y5sEuP7
         cYfA==
X-Gm-Message-State: AOJu0Yzk2e0q/GP7cqyBvd5cOjNw9Q18NrUMaC5ItVxqna1AeN5lkznj
	B/aXpDAmiEiJ4WwOrLf3urf62XohxRFUlpnm/3kLTbkREkV+EeEFxCa3TDPggzgFIzUOpp7cV0J
	3WsL0PbZSlSbgjA==
X-Google-Smtp-Source: AGHT+IEVzbizS5bwIONCCb0BiftDU4fhMTk3w7cU8mlcfeirhwdZn8Tcrol5ikyaUqfRuPhfJrQ0elLNwB7pMag=
X-Received: from pjtq5.prod.google.com ([2002:a17:90a:c105:b0:305:2d68:2be6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5242:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-3082367497dmr18231328a91.21.1744671164151;
 Mon, 14 Apr 2025 15:52:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-1-tjmercier@google.com>
Subject: [PATCH 0/4] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

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
provides per-buffer info. While the kernel must have CONFIG_DEBUG_FS for
the dmabuf_iter to be available, debugfs does not need to be mounted.
The BPF program loaded by userspace that extracts per-buffer information
gets to define its own interface which avoids the lack of ABI stability
with debugfs (even if it were mounted).

As this is a replacement for our use of CONFIG_DMABUF_SYSFS_STATS, the
last patch is a RFC for removing it from the kernel. Please see my
suggestion there regarding the timeline for that.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@google.com/
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.com/

T.J. Mercier (4):
  dma-buf: Rename and expose debugfs symbols
  bpf: Add dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  RFC: dma-buf: Remove DMA-BUF statistics

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
 Documentation/driver-api/dma-buf.rst          |   5 -
 drivers/dma-buf/Kconfig                       |  15 --
 drivers/dma-buf/Makefile                      |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
 drivers/dma-buf/dma-buf.c                     |  40 +---
 include/linux/btf_ids.h                       |   1 +
 include/linux/dma-buf.h                       |   6 +
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 130 +++++++++++
 tools/testing/selftests/bpf/config            |   1 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 116 ++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  31 +++
 14 files changed, 299 insertions(+), 311 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c

-- 
2.49.0.604.gff1f9ca942-goog

