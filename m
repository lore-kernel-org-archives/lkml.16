Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D537250C09
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746638; cv=none; b=pcqZe6SY0eB/u5cNvTYDMEqjPUiJm4ptTD6gdJ2KAN/x9hAfo9JF5ykc4ASokGXzHqcN/28Z1cC4qCV19dYOo1dCV/aVhEtX5oxSoz62Sg0QLlmJ47Rtr9WAuJt6hTC967kQxIgf/2V6sHmWpU+iaAdMMoVPB3iXq7zwZ3endNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746638; c=relaxed/simple;
	bh=BTTiCIiDuuqOI2znlsPF5CvGqROh+vYIaL/+IwP1PO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlNpvvU4nWiupCBBKv3Y8RRgARg5c7Dwm3heSzmFauUV6DNbzZB61efaEFpRbsk2GQiBYj6F8Y+VKyfJrKQlz6ZSoi/EZ6k5UhZf5XllcQRJOePAOXGLBTAPk43/P2v7v0GbLPXDnvwEpLgc5SYHHFGwnFljawUCSj+wENbK/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PF2wOsHM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PF2wOsHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L0cwjm9FNYTGtEQ+qlYJxENS+vom2OKiSp2XjEZRu34=;
	b=PF2wOsHMXE8zHvviMi6C73vlFUO/1OzDHxHThJU5uCrNaPGeoCpGfjZZkNEAR5ZYE2ziHJ
	T8rtTGUQ3jiyA2HYuZJFrlRCHyEpT5e1P3xNsuuwr3A43XSo9iH5SEqLWYO2ZVNPVOAKhG
	aw8/VJnFYoo44UXl37aYeHQLrJIVo6k=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-f14tD6g0MQa0zKLDJ4sveA-1; Tue,
 15 Apr 2025 15:50:28 -0400
X-MC-Unique: f14tD6g0MQa0zKLDJ4sveA-1
X-Mimecast-MFC-AGG-ID: f14tD6g0MQa0zKLDJ4sveA_1744746627
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E29521956087;
	Tue, 15 Apr 2025 19:50:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4694919560AD;
	Tue, 15 Apr 2025 19:50:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/8] rust/hrtimer: Various hrtimer + time additions
Date: Tue, 15 Apr 2025 15:48:21 -0400
Message-ID: <20250415195020.413478-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This is a collection of various bindings that I added to hrtimer when I
was originally getting it ready to be used in rvkms. I've mostly been
waiting for Andreas's hrtimer series to go upstream before submitting
these.

All of these are currently being used within rvkms for vblank emulation.

This patch series is based off Fujita's patch series "rust: Add IO
polling":

https://lore.kernel.org/lkml/20250413104310.162045-1-fujita.tomonori@gmail.com/

Previous versions:
  Version 1: https://lkml.org/lkml/2025/4/2/1474

Lyude Paul (8):
  rust: hrtimer: Document the return value for HrTimerHandle::cancel()
  rust: hrtimer: Add HrTimer::raw_forward() and forward()
  rust: hrtimer: Add HrTimerCallbackContext and ::forward()
  rust: hrtimer: Add HrTimerClockBase
  rust: time: Add Instant::from_nanos()
  rust: hrtimer: Add HrTimerClockBase::time()
  rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
  rust: hrtimer: Add HrTimer::expires()

 rust/kernel/time.rs                 |   7 ++
 rust/kernel/time/hrtimer.rs         | 185 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   9 +-
 rust/kernel/time/hrtimer/pin.rs     |   9 +-
 rust/kernel/time/hrtimer/pin_mut.rs |  11 +-
 rust/kernel/time/hrtimer/tbox.rs    |   9 +-
 6 files changed, 221 insertions(+), 9 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: d691366f3fa2a1b616d465d95cf6c2c04918cf92
prerequisite-patch-id: 38064b4cd5bcead92faaf1f110062dd2d912dbb1
prerequisite-patch-id: b9427ed9883dece9c1d8e01acbfac570d3fc4b1c
prerequisite-patch-id: 5358143c9cc94b70739b9a26aef05ec831a344d2
prerequisite-patch-id: 8fbc8578668f67f2fa42cf875983648f46111c3a
-- 
2.48.1

