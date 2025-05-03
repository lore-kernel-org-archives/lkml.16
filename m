Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31158E55B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233044; cv=none; b=u373wFYbkGZ91E2WKvUYNZyL6H0WR3O5DEk090gCsRekA/eevFU1yrvlMLjCWGTVG7X2HFSZ9B9+x0DjJib1Yv+N5CITjvfKUQKOdjn+OcOfkBYj+69HoIuzKqU+Wwq+FnrPus08QZs31p9MPKltBQiq9qvpsaw8mcd0m1LPkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233044; c=relaxed/simple;
	bh=bfn5jHdupCe/Bp8CwsTGa22WPx/H4w8bsI+mDk3rv9E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hImjKXc4/2x3tC3nvhin09QvS9BSQV2RdJCic4p+YhzcgU+tYzRD2lrIhAOSejKA/DxMZRb1mdsKByUfwfii5gz8WdsP+WtorBbYyJbRrPu6YO1ILwdfZ4TQ/hqzExcSTU40tofArWxlvh953q2rORGZDphdnLuJ5vWybyclpZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4x9nNNxk; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4x9nNNxk"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b1f8d149911so2214983a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746233042; x=1746837842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=05VqBXS0yAKL5tu5gN5xSZOcx+MYxuWO7pZiN7dCuow=;
        b=4x9nNNxk1O6NBqddfD5pDj7DEdxp7LM7TfyhhQGvxcX6l7BAku62ku4v0LxOY1SdX3
         qgtTwYqvdlq6aDaXAwnGd6zYfGw8qcd2ij/E7UX7bzpIJfEhJqPE8brctsmpmz548WpD
         gbpxsTDFiv7b/jgEvAg/rTjLsUYqMG9psGXfu+Ek3xRzpuhY/lbpu/TzzxXKfWrQGvzw
         j7UmKQcEIWERIG3fCgqO8Ur/Eo/zYvbZCiP1taHDWbnvT2LXWZm+kBaIFusNXlZ1NBt5
         LnukA4s8Ex8nbUkK4Bdw+LipbcQr6rY2Ap1uOztMGG9ldcAoWaaFeF45IJ5bI45vCA8I
         UVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746233042; x=1746837842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05VqBXS0yAKL5tu5gN5xSZOcx+MYxuWO7pZiN7dCuow=;
        b=UUNHcqnvpiR2IZDdDXU40B6AXXo8ymoeieL214DEt3ymoLx3L5VnD4wudw7fnCQqd5
         vBDQ/7c8AncrJe/tCFfGYKl2U0nNeFfgJOl/aruZdKsJrk4aueuB9JS+et2moUfztN6Y
         HwtPwuW1aShPvmh/yJ68x5pPuKZWI7/LqKMvU7UQALjjuY0+B0U2VlUFQHmyvWmwgqQa
         QdfgoUUkdU04J1jtlZIyXqkVNK4MGk0uM1GLY3S+q8mxH/2DUaDWCA1cmdmdq1sVYxIh
         WKdBnj+l2kAq7qehDIh9eWANxK8pH2UtCx0vlFsqmSlt7WcumJ/wTWaG63gyiPSuV4Nn
         TeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO9CvFViBD0gQ+4tR4dYYAAWTVORfLamO2FEUpuj+J1R5iIYlqr2HFSKFvCIcTg7SZQRPxS8ZPwGu3irY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyl0qqmhGpz2013Wj8/q/RF8cKLyiguBi8eooWrsMZTyWWAT4c
	JftAU+XWsisGh1D4j/bpE1QMVh63gUTO/gQNm5nP78iJKvxdbVbpNyac9Foxdr05+WFWCrryfi+
	Mt3BGTg==
X-Google-Smtp-Source: AGHT+IHK0JO/JeVBfD4PiqeGqLmt7Wa1VBq/3axwhSlYL5RlTJWQSKMC9Bxdcr7xXOQOhbVWaslz1tp3MwG3
X-Received: from pgam8.prod.google.com ([2002:a05:6a02:2b48:b0:af2:2c5c:55e])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:4041:b0:1f5:717b:46dc
 with SMTP id adf61e73a8af0-20e0750936emr1527155637.27.1746233042329; Fri, 02
 May 2025 17:44:02 -0700 (PDT)
Date: Sat, 03 May 2025 00:43:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM5mFWgC/1WNuQ7CMBBEfyXaGku+1k7yB3R0FIgiXm/ABZftI
 CTEvxMOIVHOjOa9OxTOiQv0zR0yX1NJp+Mc1KIB2g/HHYsU5wxaapQolYgcpt1YRJ5KFUOtA+0
 FK2eD89SRcjA/z5nHdHtTN7BermD7KTNfptlQv8tP0DdvvNXtP95QROo8Bx9Vf7UvdBgKCzodD qn2jTHSYHAOFXrEVqMNhrQiM0rbjdHrlr02roXt4/EE8Fe6k+oAAAA=
X-Change-Id: 20250501-debugfs-rust-attach-e164b67c9c16
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746233040; l=1489;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=bfn5jHdupCe/Bp8CwsTGa22WPx/H4w8bsI+mDk3rv9E=; b=2/Xqy5pHd698ZnU5Wp1ahq0qRMeomzFSeny1p/563BBtvB0SJ5Bwe9dt5kAQ1tHAxHm19SZ1g
 dDyRykRUErwDcTl5l+3ZgQn/oa1iy/fmLhovZ4RLXzDB9cFi+/SgAsp
X-Mailer: b4 0.14.2
Message-ID: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
Subject: [PATCH WIP 0/2] rust: debugfs: Support attaching data to DebugFS directories
From: Matthew Maurer <mmaurer@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

We can wait to properly review and land this until after we've decided
on the final interface for the first part, but since dakr@kernel.org was
poking at how this might work in his review of the previous patchset, I
wanted to upload this sketch as context.

The general concept here is that you select an owning directory and
attach data to it while converting its lifetime to be invariant (e.g.
can't be shortened) so that you know that the DebugFS contents will be
cleaned up before the data. You can then implement things underneath
that directory using the attached data.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Matthew Maurer (2):
      rust: debugfs: Add interface to build debugfs off pinned objects
      rust: debugfs: Extend sample to use attached data

 rust/kernel/debugfs.rs       | 206 ++++++++++++++++++++++++++++++++++++++++---
 samples/rust/rust_debugfs.rs | 110 ++++++++++++++++++++++-
 2 files changed, 302 insertions(+), 14 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250501-debugfs-rust-attach-e164b67c9c16
prerequisite-change-id: 20250428-debugfs-rust-3cd5c97eb7d1:v4
prerequisite-patch-id: 7ac67017c11249cd04fc4beca6cfdb5b83aa89de
prerequisite-patch-id: 2e8256a6ef25afc95279e740f43d17ec169a65f2
prerequisite-patch-id: 0abd76fd2d71ba300d8a5ce5b3b61751feec88fa
prerequisite-patch-id: 5919cceb97187adfc71e9c1899f85d5af092bde6

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

