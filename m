Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C68309DC5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893576; cv=none; b=P78f3ncI6pF2b3LTWYPCj8dlXJVtv080ZIWatD7k2/zQgt9Pag7/WKN9hx2DcGrC3t3P7rknNiHUaKiZqLaFbqVu7CYhkhBI1/LV+u/TPK+Ik2GbCeSBCcpdRBaoijMYucG7MRms4SR+kV55rJf66npbwiAuv8L5Gq0jX86h1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893576; c=relaxed/simple;
	bh=b7MJffhHKyxoq2EEBO61UbwBKxqvQbmcAkEkF6dggFE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfSem58iEP8l2bI4TSPZJ5gsv2M1S/nfDvUdibdZ+aI1/o1Kv7/Xwq5Ko7xhWtYxNbI4v+dCtRgwcqh9ypkKl6sLKYcYGDkhHV9FuFDWz3VuRsp8G6UP9R403cxV5m5Rahxlu3V/C/Qv/hxKB64gKLkzm/TaGmU6MPuE/DaGkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IT36rwuh; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IT36rwuh"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81f8679957so307007276.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893574; x=1751498374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNUWS5sHgPJ3/TtkkLsM0l/sndwzOVEqU/iJZvqTlnw=;
        b=IT36rwuhwDmmedMvCUyDrVi9/mH+2eAr1RbqCkVG7JmutYiS0f7XpbdAF5Cxgn8mST
         jlUxHdXirzP+dJFDAE5RmZ11KkaZA+Xx7VGXbRP6aLV3MbBr5QQWYTAcRvJpHNTG/0Se
         b9qKnq6VKxgjsHQAh1mSa5HPWUYfZfEbd/VVVHDwsG7y/wdfUHxWW8LMvRjRdR6Ie0IM
         mPPHSZCBxBjTl4IjWfajJ/PLJbvrn3Pm948G4l5K2xI9Ym+SnM7esI38oqtI6AxcyP8k
         WrlaCpkrv391UwCPcLac1oc6iDlDoD8807B4W9sf7NXD3Np2fkvdegQOu5GBpyC45KQE
         bI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893574; x=1751498374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNUWS5sHgPJ3/TtkkLsM0l/sndwzOVEqU/iJZvqTlnw=;
        b=h6PT6t2ipBS/QCznNalO1nYtgELw/KzYPpLQD24iJi7EwP4At24BmCgZjXa41UkqAC
         X9sPjo8+CzWrS86v4Q6IuicMlDCNK8bVA1x8egA6tuX6eRCwyj7LCINoSoKp+Q0bVQJ3
         oPz9d0FMXUMbpZ0E2VM3TXn8WQ7WZLCDIcURUtKnpsLUGdZirTEEhu5h5ybKhJnTMM3Y
         nG/kSl7SVEeXntmkqWZw5Em9G51t3W7ZTLgNXTVdDMX9b9EOWzfAThF+BEWaVYgjk5Gx
         ZdAjJAr0CKsJ3Ol5WA1tYGS8l1V4Tis0aR/x829z1UiZW5gFs8+Rwoezf6QnrN1t/lwq
         1VAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB/cqOEAWqQbDPnsRPUi/hlBStB16VAAucxHXfFq2XoxhSQr2Z9ZVO2RzmlmvS+VoNtwgPY+WFiiNOYAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAtmf8q+qIANFkl+ThWb+xCulGPGCYnXkc6XWHuAorCaYqWQQ
	Q9WfQ7xIMkZ34VuuMozq6v3hDHdgOn/dEITNnUIsJfhrQP1zHOF6jA6IcqLIWTVN3oM=
X-Gm-Gg: ASbGnct7fHuMgV76Jha3FcD60DgWNGMa1D7R1F5hio2AAGf8acx6w/yGs0YKtGW+mnj
	HatnetVLfjvxaklZzAxZtK/P9Mg/bCto8tVvAze9vnwf2qq5vJv84m458WOqw5QC+2+D47UC0Um
	E8YXGaMhKic1qDSR/80bbH/Yu0HiZsPFONaLRz6Wln7CT3o/pH9khrouxQsErrJT93Lo23oaj8M
	0U3Ty95ACfZ3dxuwNB9TCmW9FAWl5U7X7hP8t6nRjXTzS6PfrgPnzUBKsKiRoMvrHoolkrShLEC
	m9seGMtmI/MGaRNSlmM3jBKYQUZKt699i8GtlYZhYdgg9R658t3E7LIaGrqai2kjh6ghhcuJkQy
	Xk6vi/62B8I6mVHTEAvwqkkD368v/cyWjM7B06hBpXdxUknsTYr08
X-Google-Smtp-Source: AGHT+IFDGX7NrsfyyxA53ENg0MYMTOghBYuaJBxDrL4i/eRQ4joSzHgyrsvnmaeCiyZ/P1GWMue8rQ==
X-Received: by 2002:a05:6902:278a:b0:e85:eac6:7ae5 with SMTP id 3f1490d57ef6-e860176b5e1mr6314395276.9.1750893573720;
        Wed, 25 Jun 2025 16:19:33 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:33 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 29/32] docs: add documentation for memfd preservation via LUO
Date: Wed, 25 Jun 2025 23:18:16 +0000
Message-ID: <20250625231838.1897085-30-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Add the documentation under the "Preserving file descriptors" section of
LUO's documentation. The doc describes the properties preserved,
behaviour of the file under different LUO states, serialization format,
and current limitations.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/liveupdate.rst   |   7 ++
 Documentation/mm/index.rst              |   1 +
 Documentation/mm/memfd_preservation.rst | 138 ++++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 4 files changed, 147 insertions(+)
 create mode 100644 Documentation/mm/memfd_preservation.rst

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 41c4b76cd3ec..232d5f623992 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -18,6 +18,13 @@ LUO Preserving File Descriptors
 .. kernel-doc:: kernel/liveupdate/luo_files.c
    :doc: LUO file descriptors
 
+The following types of file descriptors can be preserved
+
+.. toctree::
+   :maxdepth: 1
+
+   ../mm/memfd_preservation
+
 Public API
 ==========
 .. kernel-doc:: include/linux/liveupdate.h
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index d3ada3e45e10..97267567ef80 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -47,6 +47,7 @@ documentation, or deleted if it has served its purpose.
    hugetlbfs_reserv
    ksm
    memory-model
+   memfd_preservation
    mmu_notifier
    multigen_lru
    numa
diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
new file mode 100644
index 000000000000..416cd1dafc97
--- /dev/null
+++ b/Documentation/mm/memfd_preservation.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+Memfd Preservation via LUO
+==========================
+
+Overview
+========
+
+Memory file descriptors (memfd) can be preserved over a kexec using the Live
+Update Orchestrator (LUO) file preservation. This allows userspace to transfer
+its memory contents to the next kernel after a kexec.
+
+The preservation is not intended to be transparent. Only select properties of
+the file are preserved. All others are reset to default. The preserved
+properties are described below.
+
+.. note::
+   The LUO API is not stabilized yet, so the preserved properties of a memfd are
+   also not stable and are subject to backwards incompatible changes.
+
+.. note::
+   Currently a memfd backed by Hugetlb is not supported. Memfds created
+   with ``MFD_HUGETLB`` will be rejected.
+
+Preserved Properties
+====================
+
+The following properties of the memfd are preserved across kexec:
+
+File Contents
+  All data stored in the file is preserved.
+
+File Size
+  The size of the file is preserved. Holes in the file are filled by allocating
+  pages for them during preservation.
+
+File Position
+  The current file position is preserved, allowing applications to continue
+  reading/writing from their last position.
+
+File Status Flags
+  memfds are always opened with ``O_RDWR`` and ``O_LARGEFILE``. This property is
+  maintained.
+
+Non-Preserved Properties
+========================
+
+All properties which are not preserved must be assumed to be reset to default.
+This section describes some of those properties which may be more of note.
+
+``FD_CLOEXEC`` flag
+  A memfd can be created with the ``MFD_CLOEXEC`` flag that sets the
+  ``FD_CLOEXEC`` on the file. This flag is not preserved and must be set again
+  after restore via ``fcntl()``.
+
+Seals
+  File seals are not preserved. The file is unsealed on restore and if needed,
+  must be sealed again via ``fcntl()``.
+
+Behavior with LUO states
+========================
+
+This section described the behavior of the memfd in the different LUO states.
+
+Normal Phase
+  During the normal phase, the memfd can be marked for preservation using the
+  ``LIVEUPDATE_IOCTL_FD_PRESERVE`` ioctl. The memfd acts as a regular memfd
+  during this phase with no additional restrictions.
+
+Prepared Phase
+  After LUO enters ``LIVEUPDATE_STATE_PREPARED``, the memfd is serialized and
+  prepared for the next kernel. During this phase, the below things happen:
+
+  - All the folios are pinned. If some folios reside in ``ZONE_MIGRATE``, they
+    are migrated out. This ensures none of the preserved folios land in KHO
+    scratch area.
+  - Pages in swap are swapped in. Currently, there is no way to pass pages in
+    swap over KHO, so all swapped out pages are swapped back in and pinned.
+  - The memfd goes into "frozen mapping" mode. The file can no longer grow or
+    shrink, or punch holes. This ensures the serialized mappings stay in sync.
+    The file can still be read from or written to or mmap-ed.
+
+Freeze Phase
+  Updates the current file position in the serialized data to capture any
+  changes that occurred between prepare and freeze phases. After this, the FD is
+  not allowed to be accessed.
+
+Restoration Phase
+  After being restored, the memfd is functional as normal with the properties
+  listed above restored.
+
+Cancellation
+  If the liveupdate is canceled after going into prepared phase, the memfd
+  functions like in normal phase.
+
+Serialization format
+====================
+
+The state is serialized in an FDT with the following structure::
+
+  /dts-v1/;
+
+  / {
+      compatible = "memfd-v1";
+      pos = <current_file_position>;
+      size = <file_size_in_bytes>;
+      folios = <array_of_preserved_folio_descriptors>;
+  };
+
+Each folio descriptor contains:
+
+- PFN + flags (8 bytes)
+
+  - Physical frame number (PFN) of the preserved folio (bits 63:12).
+  - Folio flags (bits 11:0):
+
+    - ``PRESERVED_FLAG_DIRTY`` (bit 0)
+    - ``PRESERVED_FLAG_UPTODATE`` (bit 1)
+
+- Folio index within the file (8 bytes).
+
+Limitations
+===========
+
+The current implementation has the following limitations:
+
+Size
+  Currently the size of the file is limited by the size of the FDT. The FDT can
+  be at of most ``MAX_PAGE_ORDER`` order. By default this is 4 MiB with 4K
+  pages. Each page in the file is tracked using 16 bytes. This limits the
+  maximum size of the file to 1 GiB.
+
+See Also
+========
+
+- :doc:`Live Update Orchestrator </admin-guide/liveupdate>`
+- :doc:`/core-api/kho/concepts`
diff --git a/MAINTAINERS b/MAINTAINERS
index 163f38cd55b5..8114ce1be57b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14017,6 +14017,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
 F:	Documentation/admin-guide/liveupdate.rst
 F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/liveupdate.h
 F:	include/uapi/linux/liveupdate.h
-- 
2.50.0.727.gbf7dc18ff4-goog

