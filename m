Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97028C866
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773380; cv=none; b=Be6pWRHwxz/jS8BUiaz9GqsiKEbxBdobg1j+8w/o3E9ksngWWLPAabSgQzv4o/qhIWmSlZtSmN3I+t30u9INte2HfLMHmU/2AyOYhSUhpTLqfNnc3S+Xtg7tRZuSKRydWvSSfFvb2zAm7bbq+iybDbIK+Tl2KTXXwOM5KwS/WO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773380; c=relaxed/simple;
	bh=HUjb5SSpguqf14obMWV1CoUWPK/z6RsGfZRYkDmaZrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/a8p62a2aLhXqO5+IMQMMRwO8nqijUr5wh3JXIjZAHM5KDYVpSsF/ubKGQyM8k2LNM1qh+sV+qEvUky5RrYCGIoCfLqN6R3y9C4fDtp4egcQmghu9BLipN8fTYR3xmIV+L4DPS0RH6pjUkO5TRbEaf6rH6lbBNiYT3EmztfSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfIM6DhX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfIM6DhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747773377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zv2cXxmOj4M7S+/j9A/0DMu053ZlpynGaWjv/seAW+I=;
	b=FfIM6DhXCIo20Gguz0nFHyIMOETrHSidnc3BO43aslkiUgLqjZtARCotwbaMMEXFHyE0cD
	oI+/JaBd5K4kSdr/00emH+Bva8LkP6JDyhNvAkfFBuB4m87jMKcJjlN+PFdeYeiSJSBlNk
	cyzwINZ2mdxB/3wfxbEYUNYDO+cAj2A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-UHluAkkyNamM6mrI0Li4HA-1; Tue,
 20 May 2025 16:36:14 -0400
X-MC-Unique: UHluAkkyNamM6mrI0Li4HA-1
X-Mimecast-MFC-AGG-ID: UHluAkkyNamM6mrI0Li4HA_1747773371
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 787ED180034E;
	Tue, 20 May 2025 20:36:11 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.128])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5817F19560AD;
	Tue, 20 May 2025 20:36:07 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v4 3/4] rust: drm: gem: Drop Object::SIZE
Date: Tue, 20 May 2025 16:35:29 -0400
Message-ID: <20250520203542.1391548-4-lyude@redhat.com>
In-Reply-To: <20250520203542.1391548-1-lyude@redhat.com>
References: <20250520203542.1391548-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Drive-by fix, it doesn't seem like anything actually uses this constant
anymore.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index eb526d118cd40..c459829ce5a5d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -12,7 +12,7 @@
     prelude::*,
     types::{ARef, AlwaysRefCounted, Opaque},
 };
-use core::{mem, ops::Deref, ptr::NonNull};
+use core::{ops::Deref, ptr::NonNull};
 
 /// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
 /// [`DriverObject`] implementation.
@@ -197,9 +197,6 @@ pub struct Object<T: BaseDriverObject + Send + Sync> {
 }
 
 impl<T: BaseDriverObject> Object<T> {
-    /// The size of this object's structure.
-    pub const SIZE: usize = mem::size_of::<Self>();
-
     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
         free: Some(Self::free_callback),
         open: Some(open_callback::<T>),
-- 
2.49.0

