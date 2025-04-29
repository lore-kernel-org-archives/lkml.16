Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4E257AC6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963286; cv=none; b=d7cKav3lR8PJ0X57kw00RVFKp5I2/glgl+JxGCGK1M4R8DscMyh6UoQKtUP3Y5Qu/3BqrE/UJ44QmLPISU/1BLx9vB+M89r875dFE3Yx0Le33wO9Zy1rlHC316l4lSeLzElKdN7EobhTCfCMaavfjhnjHLXghAT6fDf8KyT8hms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963286; c=relaxed/simple;
	bh=L/lCpqtH0jFdKj9u8j+kmUSd8ti5hWkS4KF1fGAVyvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtcmyI8W6APrniLd07Pi002a+0k8dxywR4F80e8CzH4ZAJ2eUovH3knvuq2MdLBpxJTCKtpRtBGJh5m6/hTOk1fgkuNxU4WdJ1lkAoSUrcQvRzzMwP1C68Rj8LYSX6rWSC/QF5knScW0eBhGXN9ghAnGbGR9TuzOOR45NmZTYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQB3wAyn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQB3wAyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745963284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=INyowgEVW2BPivCqUoDHjkNAXYriwEw8tF1iKC8NZ08=;
	b=DQB3wAynPAkYrbdV+GYsP5gx6vj6w75of35StGRv/BzrsL9mE/gdhiw9ueqoNlXDh9l1Iw
	7inaIKdqkTgpuGIGscK0CXyvzyDeBEA6B6aatDVodda3+WQKh63v4yzyQzYvM0sCXuxHBt
	EV3AVcOsbjeeEHT5jYIVV/USzlJqgzU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-22-5I9fOd45OXaX993TnZR_Gw-1; Tue,
 29 Apr 2025 17:48:00 -0400
X-MC-Unique: 5I9fOd45OXaX993TnZR_Gw-1
X-Mimecast-MFC-AGG-ID: 5I9fOd45OXaX993TnZR_Gw_1745963278
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FD9818001CA;
	Tue, 29 Apr 2025 21:47:58 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 976E119560A3;
	Tue, 29 Apr 2025 21:47:54 +0000 (UTC)
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
Subject: [PATCH v4 0/7] rust/hrtimer: Various hrtimer + time additions
Date: Tue, 29 Apr 2025 17:44:36 -0400
Message-ID: <20250429214752.1637859-1-lyude@redhat.com>
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
  Version 2: https://lkml.org/lkml/2025/4/15/1750
  Version 3 (only a revision of one patch): https://lkml.org/lkml/2025/4/15/1780

Lyude Paul (7):
  rust: hrtimer: Document the return value for HrTimerHandle::cancel()
  rust: hrtimer: Add HrTimer::raw_forward() and forward()
  rust: hrtimer: Add HrTimerCallbackContext and ::forward()
  rust: time: Add Instant::from_nanos()
  rust: hrtimer: Add HrTimer::raw_cb_time()
  rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
  rust: hrtimer: Add HrTimer::expires()

 rust/kernel/time.rs                 |  14 +++
 rust/kernel/time/hrtimer.rs         | 181 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   9 +-
 rust/kernel/time/hrtimer/pin.rs     |   9 +-
 rust/kernel/time/hrtimer/pin_mut.rs |  11 +-
 rust/kernel/time/hrtimer/tbox.rs    |   9 +-
 6 files changed, 224 insertions(+), 9 deletions(-)


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
prerequisite-patch-id: d691366f3fa2a1b616d465d95cf6c2c04918cf92
prerequisite-patch-id: 38064b4cd5bcead92faaf1f110062dd2d912dbb1
prerequisite-patch-id: b9427ed9883dece9c1d8e01acbfac570d3fc4b1c
prerequisite-patch-id: 5358143c9cc94b70739b9a26aef05ec831a344d2
prerequisite-patch-id: 8fbc8578668f67f2fa42cf875983648f46111c3a
-- 
2.48.1

