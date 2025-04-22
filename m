Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0A293B7B;
	Tue, 22 Apr 2025 16:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340180; cv=pass; b=JVLReknN3ek+3tCgySkGbTxMR+5GiNjqoGZg4fTgW9njceRb+B4UCHwYN4mvbeGEdKFaT7KZ2sNxwz/czxqVTOgWSgUXMKd0fsfFDAXUljejrHQ42iLQ+ikO+aqQdd6d9QFc3g304i/z288IQ5xLP9b+qDOgiTGZk7MOTj2BAI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340180; c=relaxed/simple;
	bh=Z7Am1yDYfUzL3ZfyCajTW6fBOh32/rmPSahYYyR/Ce0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNr3727zzzU0/vjpcpwh7L+2x4meOMXYviU7VfLcHhtcZ0Bs8oVVsTvbqOeGVKtw0CkfJx5hAWe2/gVfibGa2S3cpDQhub9nXDUJuFTAiHwqp82mssH8VHAGEAYplfbqqa9mRkNtfB+rXJm+KjGIXXWBFji1fTQtpj0w357GpMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=VTBBoQ9G; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VTBBoQ9G"
ARC-Seal: i=1; a=rsa-sha256; t=1745340128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bm82wHIqbWnYrRr2kF+Hi3swGjDFYuETY6gga/hOtaWSIADLTkLoiPk9CCYXkfQOZdtb4+2aenYh7IGIyig+idvauz5ts5rClJIH9GcCqU7iRYrie4L7XUD9wZfekMYH+SjgCYALfwkVjZSNs/e35GKIOFiBrbczxHEBXuMQ4gs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745340128; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y4wO66+sO97sT2LRC9C5NYfxV9lsmuh8SUnfA698g+w=; 
	b=C9+zcX/aCHot2tsiLEmOjI3x157cJwxmVbcA1Wbz6phDxvxUdsSoXGkMxHWUxwv7hDFZRgTcBKaxanQ0wF3jFfLg7e1WlL3db3A79YBPF4QohMjY+aqzfG7A7xct2ErOC74GhI69dlnrGkZcXDxI0goavMOV2Vm/7FcMS5Coy38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745340128;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Y4wO66+sO97sT2LRC9C5NYfxV9lsmuh8SUnfA698g+w=;
	b=VTBBoQ9Gf/wEY3aNBlKlhzSo4ItRUdYzZTrIVWHTEFrIuMeHVALiLJy6TJqBJrey
	q9rydHIgcwOtjCgjeISzSK1jOJVNsQC0D2kl9IJQYKrP01T6BvGbZc/KU5I/kWlRLsA
	ET4RnSBV7nqbeu8fYquTi7YpmXLgaFNBKiEmcuNI=
Received: by mx.zohomail.com with SMTPS id 1745340127609419.1907590665734;
	Tue, 22 Apr 2025 09:42:07 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 22 Apr 2025 13:41:52 -0300
Subject: [PATCH v2 1/2] rust: helpers: Add bindings/wrappers for dma_resv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-gpuvm-v2-1-44d4fc25e411@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
In-Reply-To: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

From: Asahi Lina <lina@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 13 +++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 15 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e6020ba5b00237a08402fbd609c7fba27b970dd9..68d7be498a6d523797e54212d6c23ff4d8f2e92d 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -18,6 +18,7 @@
 #include <linux/blkdev.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
+#include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/file.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 0000000000000000000000000000000000000000..05501cb814513b483afd0b7f220230d867863c2f
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 7a06d6bc48537248c8a3ec4243b37d8fb2b1cb26..c5e536d688bc35c7b348daa61e868c91a7bdbd23 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -14,6 +14,7 @@
 #include "build_bug.c"
 #include "cred.c"
 #include "device.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "err.c"
 #include "fs.c"

-- 
2.49.0

