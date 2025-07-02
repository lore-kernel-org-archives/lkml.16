Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775381531E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418299; cv=none; b=Of++oe1vyOAr+TRFL8UD7p0/7+T+2yXSTWfh55YwzuHX0uThlhca16sksjkoi2Uwt4L9VIzuxt4CFEtk2/SnCghgFWuphC6lgyM8wkcu3X4gVal5L2b8EQq6xWFatqma38BriD05cQ7fV1aEMfo6znooVwmCqCg0uULEo2pdwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418299; c=relaxed/simple;
	bh=XwSHl3R6x0geSRen2/MMqiPJvr7MDKRDFgnW0OKJPCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eHP8jYoTZzoKdw7RyPh85kALV6FqJPyT0yqIfqFlGWtWsg7DBjPiqOCIbyFG50N1oiWYVU6SWe+imeYwV92ZqV3Uu1KBHjRlp1h+A7zZjiCV6zeThvcJFTkiV26UI+LjQlX5akIXk2NNRPdu7pNvUBDCajctvcxuvADsQm5gxCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UX6ITa08; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UX6ITa08"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748d96b974cso5603781b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751418298; x=1752023098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2ToBQsH2KBAAKqSrwB/wtB0CqIjOe4g4OmnGE6U2PU=;
        b=UX6ITa08aT1ycdJKfb9qk5uZWJUkeOOtgeal/uEJ2jhXZvRJcpapM9qhsjtZRWE9dZ
         npYk40Ur6og+FqRMw5DyLg5XlDpe8JgDAYrI//80Fwzez9cDni6MdbJSVAuUoEPVW9h0
         20AESGsieHAoyqJKFDtQbOs+Wexme9o6TacSMM4y/eLUr+ZRIuz3G9T3GfcuqHFx2wgu
         z6BWSK4DqZAtt6yEDLpkM4enkQevqfhDpoA7yG7P6utWk5k85R8xrDVWhN+RoMR7NVUH
         y2YH5wgjyOxnGn92giwGwBrL7lVnaHw7Z2NO5etdN6IVHl1hDfpK8f2b/MyqyVSNlfFD
         lJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751418298; x=1752023098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2ToBQsH2KBAAKqSrwB/wtB0CqIjOe4g4OmnGE6U2PU=;
        b=Du4U/LHxYxJF8ISumC6/BtawCoA6vUmxNnBQbxb51F2QdEgCUb9O6bkqxY1qGV8MHQ
         6mggh9eW1gT1/w5ecIE2JHs03xMpxxB8qs5XBcVKZwQvXj+J2out4Sc1rTJJPL9igOsV
         TdMYT2IDpxJKCk3NpoSPGCz53iR4wVc80lI88N5aVojmW77AS4bBegJA4N115KWPe10n
         0AmlqUrCIheSgm3nyqGdtf5U+TT8aWkVfuX/+DlPcdu4pw9ekByEakm8XK0t7Mh8uxPP
         aiiGdA5cKbPqfNMhhmHamcusUNWwyUZN7gM22LGmFbMaAYymesHrY8UHAkosC1H62XtW
         6bqA==
X-Gm-Message-State: AOJu0YzLfBNY1dcOvRHnZ8hVCPGYLliM9OBycVk+PZ3DYgE5aEbf+vbS
	H5jLiZGewStcqBxpUZuDVv8GeJnsiM4OfKK3QYF0Gst1IlqwkNV40C01+j7B30EstXqltAWoCN1
	8nKJRso+p/czmwpIHMHjbIW3+n+71zmFIbLINiZGAGW9bIacyIVzKhtC1sGWVRh04tvxGJnd5NV
	/nHFlSdkKW0xZZ+wAEkExkIY79aV6UD/h5NHsS7azL3dNf8bjeQA==
X-Google-Smtp-Source: AGHT+IHjxkJhNpPJlRTQPrSVhZEAgwC4vRTmDtOI94X9/M4vSCN6ez22PLOMuaeL7edmsjjLJkFV7JIuOA5k
X-Received: from pfcj5.prod.google.com ([2002:a05:6a00:1745:b0:746:1bf8:e16])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b53:b0:736:33fd:f57d
 with SMTP id d2e1a72fcca58-74b50f51d98mr1094467b3a.17.1751418297579; Tue, 01
 Jul 2025 18:04:57 -0700 (PDT)
Date: Tue,  1 Jul 2025 18:04:41 -0700
In-Reply-To: <20250702010447.2994412-1-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250702010447.2994412-1-ynaffit@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250702010447.2994412-2-ynaffit@google.com>
Subject: [PATCH v2 1/5] binder: Fix selftest page indexing
From: Tiffany Yang <ynaffit@google.com>
To: linux-kernel@vger.kernel.org
Cc: keescook@google.com, kernel-team@android.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

The binder allocator selftest was only checking the last page of buffers
that ended on a page boundary. Correct the page indexing to account for
buffers that are not page-aligned.

Signed-off-by: Tiffany Yang <ynaffit@google.com>
---
 drivers/android/binder_alloc_selftest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder_alloc_selftest.c b/drivers/android/binder_alloc_selftest.c
index c88735c54848..486af3ec3c02 100644
--- a/drivers/android/binder_alloc_selftest.c
+++ b/drivers/android/binder_alloc_selftest.c
@@ -142,12 +142,12 @@ static void binder_selftest_free_buf(struct binder_alloc *alloc,
 	for (i = 0; i < BUFFER_NUM; i++)
 		binder_alloc_free_buf(alloc, buffers[seq[i]]);
 
-	for (i = 0; i < end / PAGE_SIZE; i++) {
 		/**
 		 * Error message on a free page can be false positive
 		 * if binder shrinker ran during binder_alloc_free_buf
 		 * calls above.
 		 */
+	for (i = 0; i <= (end - 1) / PAGE_SIZE; i++) {
 		if (list_empty(page_to_lru(alloc->pages[i]))) {
 			pr_err_size_seq(sizes, seq);
 			pr_err("expect lru but is %s at page index %d\n",
-- 
2.50.0.727.gbf7dc18ff4-goog

