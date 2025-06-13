Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75B8F6C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857288; cv=none; b=P2eNpJ0tj6tk4tzz94sSCbMlaKkgXaXAZHIsmUw6qBTbPxiz19Xj+oM9kP+utEpuM+uOfpnyttdPzG5DuIYJBTXGvcProuC1fCGVK4rApvPPnRxxPgqSNeioWEyVm5bkj3iJGk7HWABcauB5rtFQR3FdDnb9CRSyOWsmO9gWmFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857288; c=relaxed/simple;
	bh=+ZAohITBQjhk2/GF2fXLN09ph7yDQI5CSf7zJSY9S38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzNXjVMTpgxeSNYxtRzspxNIlMM3dnCBbHgLoSDRy+jXHz+ZRTTRjXZP4ohsJ7Gg9ZAyqdqahdZnuhZG6xRlkUANY3Ef76BUA7c+JxB1xzUBCrlgm/nScaTeJMcJD/5nApbwOIqilI2nt1W9rYpi6nqjeQj0D49pMgs62GCTups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OiHM8R8b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OiHM8R8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749857286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BbaPuiNOYQFpAXePmauqapWTH5XyW5Y8p/T1f3wRJsk=;
	b=OiHM8R8b95K+7Giml87IM7825ufdRkGz5fZNfoa9amYMtn8v91oXMqqiUBBkvdz7KJhbR3
	Tin4X5rXmMoNdQ+agC4Nkyl5JpjcmwaJcs+4YwU5m5O+39rrrSCo3ruZb/lo8sb4quNLtu
	lGYruiWMqnqS07/u1HClUhp74gtN28E=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-Z2KglNonOXSKoQwqPeImcg-1; Fri,
 13 Jun 2025 19:28:03 -0400
X-MC-Unique: Z2KglNonOXSKoQwqPeImcg-1
X-Mimecast-MFC-AGG-ID: Z2KglNonOXSKoQwqPeImcg_1749857281
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 099EE195608F;
	Fri, 13 Jun 2025 23:28:01 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10741180035C;
	Fri, 13 Jun 2025 23:27:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 0/7] rust/hrtimer: Various hrtimer + time additions
Date: Fri, 13 Jun 2025 19:22:21 -0400
Message-ID: <20250613232754.451450-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This is a collection of various bindings that I added to hrtimer when I
was originally getting it ready to be used in rvkms. I've mostly been
waiting for Andreas's hrtimer series to go upstream before submitting
these.

All of these are currently being used within rvkms for vblank emulation.

Based on top of Fujita's patch series "rust: time: Convert hrtimer to
use Instant and Delta":

  https://lkml.org/lkml/2025/6/10/1045

Previous versions:
  Version 1: https://lkml.org/lkml/2025/4/2/1474
  Version 2: https://lkml.org/lkml/2025/4/15/1750
  Version 3 (only a revision of one patch): https://lkml.org/lkml/2025/4/15/1780
  Version 4: https://lkml.org/lkml/2025/4/29/1715

Lyude Paul (7):
  rust: hrtimer: Document the return value for HrTimerHandle::cancel()
  rust: hrtimer: Add HrTimerInstant
  rust: hrtimer: Add HrTimer::raw_forward() and forward()
  rust: hrtimer: Add HrTimerCallbackContext and ::forward()
  rust: time: Add Instant::from_nanos()
  rust: hrtimer: Add HrTimer::raw_cb_time()
  rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext

 rust/kernel/time.rs                 |  21 +++
 rust/kernel/time/hrtimer.rs         | 200 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   9 +-
 rust/kernel/time/hrtimer/pin.rs     |   9 +-
 rust/kernel/time/hrtimer/pin_mut.rs |  12 +-
 rust/kernel/time/hrtimer/tbox.rs    |   9 +-
 6 files changed, 252 insertions(+), 8 deletions(-)


base-commit: 61ff71163cf6d869f326a32b3d9afb157a78f734
-- 
2.49.0

