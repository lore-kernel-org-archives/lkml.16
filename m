Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD3280CE5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765351; cv=none; b=iUraBnCc0hstMQOIOlas2/IKHovFxILK7yTtGMbkTiuVauVnTAjYa/NPY+kIDttFifaYn4wnwF+BaVAcKhMeXac3AUMIcIhrbtsqT7e8SlmxjoNVUDcm2jvGjYLtfrOsu2Zo51ttPh+SdZygkmf+aXKRZuDFrqcmuhf3rmIxHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765351; c=relaxed/simple;
	bh=eDRxs1rCHvIRRaam1272EoU3SwQKNaCJQj/NxIaVyZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDEXCo0ZQHIPcI6SmtNuzITgLLCPDH473hVGp8mAXiaPbJr3fPgzOalitBi8Ctkk5khMhgctjsLiUpF1eCLh57dhC0MyHnQwaOSVifRqqpDI/VEjekYH9mYocog5xcnxdWO6LX032sWjcZprhYqufxgLyIKuyq5pwanahcNdk7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5rkAv++; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5rkAv++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747765348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2Gr1P0AhDMft3h34gBwE4azqs1HGo4pzeZ5q3pBoA4=;
	b=C5rkAv++xg83/WussvdlMspbfHDhRkRKzWWu8MA73ZCHbYuNCj1c/O+MYoKt5HMc2wRYeF
	6lHznfPgrN+EMgFo+gz/qoWWZrzk1R7XVrW/K/0FB94AKvn7l14q9jD/YAKLICv5fUQOYR
	ldATfTRTZSfgaYh7mjTbxRP6HMwKoxU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-1oSY75oHPPWWioaKKhvoLQ-1; Tue,
 20 May 2025 14:22:25 -0400
X-MC-Unique: 1oSY75oHPPWWioaKKhvoLQ-1
X-Mimecast-MFC-AGG-ID: 1oSY75oHPPWWioaKKhvoLQ_1747765343
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECED01956089;
	Tue, 20 May 2025 18:22:22 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D96D8180045B;
	Tue, 20 May 2025 18:22:17 +0000 (UTC)
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
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH v3 3/4] rust: drm: gem: Drop Object::SIZE
Date: Tue, 20 May 2025 14:19:14 -0400
Message-ID: <20250520182144.1313262-4-lyude@redhat.com>
In-Reply-To: <20250520182144.1313262-1-lyude@redhat.com>
References: <20250520182144.1313262-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Drive-by fix, it doesn't seem like anything actually uses this constant
anymore.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index a60d133e3c3b4..8944fc7a815a2 100644
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

