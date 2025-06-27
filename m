Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876DE22B8A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056689; cv=none; b=k8DHJdlWCbMySRgJuuZ4ACu1/TCvorVV8gy8759cSG4f5KWCTGygBHCA+qjd6N+p8J8cZYMUo0URwa3bZM+hw+mfoPcID8mickWsbwe25bmHRf2LFD8U33KwpQ/ZoOt1TAY0SE/CRJzjCmYWVn2ddwgNb/L7VG6ATppJNc+Y0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056689; c=relaxed/simple;
	bh=XwSHl3R6x0geSRen2/MMqiPJvr7MDKRDFgnW0OKJPCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e/cCmjmitUGt1ffQIMGnwB3p72oGvwk3Z/emKYeQXYidVmyCpMnfwnZM9m1Wx5Ab2X4M0y69n9y0bOaNYu/re50EfVzzAEk9EE81EBFWH/GcAMQno1DM4BaX45Kxk3tbA5AL4PBF/fK+iRzKBefujdpJYQeDNzjR/4JmfTYyt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DdiHu0zw; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DdiHu0zw"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748f13ef248so298715b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751056687; x=1751661487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2ToBQsH2KBAAKqSrwB/wtB0CqIjOe4g4OmnGE6U2PU=;
        b=DdiHu0zwYmjAi1M9qk9LYBzby2s1YA3YsePDRdt2fckRErzUH8C9Fqtep0SHryZDRr
         prWY/W/aX4NofsvppCCTm4bDCXh9IkHHLiiEYWBiWJ42tnQIaf+HUQqRApZPyc2DV1So
         YmuN1cZdZ+NuezSCop/Tm43F5G8nm69QYQD3I7yKblzSJnH949MG7qzKc/9fNl1sNnSW
         3n1eLoF/d8bZnI/wQjzW4+zf3UhZe9/wK6tKwHeMtIS6q9V0a0qunH7BZxPxjgF5TMVT
         Py/w774k/lNsLjK0uYPHXNVm6ZC4J7FM9sni2KEqsXZ1K6i3fuwRrBneXivsAxZKwEtP
         PrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056687; x=1751661487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2ToBQsH2KBAAKqSrwB/wtB0CqIjOe4g4OmnGE6U2PU=;
        b=tN6XGnjmLh3zNIy8BYHrV6GgJI0J49O1nVdX+qK36wjrb3AMWYr/P6R3keSlIZ3mdb
         bWVuBXC7b6IZsIFnRSzfRUgoGJOQ74xBoauM6A4bsSDAdd3xusC+j7cTJjp5APGWUSRZ
         AaKFU4//O1nAOb3z6zc0VfwWUepQmBJ6MKKM9Fo5R1PyTJBvnckNwN2cW2WD6kqcQ/03
         zcVThcOonE5DCyjv2MSjEELV7mIRAda0ng2wskY/iYHUkL8ZPTkkyU+1SJp/RS6CjOP+
         QB7ILxGWRPZfA/b8Vvj4WOj+KftPEhd45RkX6R6jZ6afUTbBAVA408dSqY7poc3sOa9x
         XaMA==
X-Gm-Message-State: AOJu0YwR5yuBzo7KwwRwP0RIbVJRy8yruD0fQWUG5jKw+uuHKH8sR5q+
	aQIaXrxZ1i503ABS7L1U76x6/sewsupRoaw+6xNwx7gryB9GpeQ0lnYMBHLptxwRlvLRQDC5JP/
	mXrpKox/su68Rp7KVPQwgfFrqvjYEKSEBdnPi0BdUwfQcv1XOs25Sxeh3LAfMLdVbOgvj1SUSab
	/MNuszJjU2+UYe3tYfDHJEFzYACPWW4U+TwQYOB455BJcxzJr2QA==
X-Google-Smtp-Source: AGHT+IG1Mrm1GfWv2ZyciX5HSSEMNEm3l6zL7qGDpY7Ezj+upo8IhpSUE3/1E13yUIf6LuQtVaRH7SNBqpUx
X-Received: from pfkq22.prod.google.com ([2002:a05:6a00:856:b0:746:2862:2a2f])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:689:b0:216:1476:f71
 with SMTP id adf61e73a8af0-220a17ef9b0mr7428280637.39.1751056686793; Fri, 27
 Jun 2025 13:38:06 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:37:42 -0700
In-Reply-To: <20250627203748.881022-1-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627203748.881022-1-ynaffit@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627203748.881022-2-ynaffit@google.com>
Subject: [PATCH 1/5] binder: Fix selftest page indexing
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

