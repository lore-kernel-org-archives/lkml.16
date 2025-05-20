Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3FE280008
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765328; cv=none; b=SPj7B+XcaUGcMGIn2g3hSz6+5c7VUarOjrX4/BZHu9vfs+8uhkWKZ79pSYDZSqGRTRJPqjHk8+JCYX+AXK7JJf6iP6P08WO+UZF6nm7qKdZ8qcb+rKm1vhm66E+9gJ+Eoxm4ZhB+7Vj/5ulxBT7paBMenh4qqZ6Iwnjrsgk0Xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765328; c=relaxed/simple;
	bh=m4sHC2ioZAb64/cUCBsTQaCvS5uxQBAT9kNBqe/0RBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HgZ017OTPlXCJDunX/9VrReygo5cK0CMYxfhBmpB1VKrVMzYA6DKasJ0w5jrIlWhX9FHRPtf+zwn8lQqYhTvYY/MQZ56/RG3m1qVXCmNVij1kWNvIHXPGCOByxP+VCER+/0wGfPSJRbaAXhexlDKh2+6fIsR27Gyi8tis9M0qmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bETjMq0N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bETjMq0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747765325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XroMdzJgXjsY6oKfDQ1D1PKCN2nDrCD9DIs6odFzCFw=;
	b=bETjMq0N7XFskx87TFAgy0OnJR/64QiELfApcQMbwYSh1Mh0zf16LNXxEfQ/aRtOpQxeQG
	VDWqoZ9DvRl585EIca58vxTAaIBNZNR8YLZWLnJczc7JQE7zeBQiF6e02D1t552FRlYI+o
	eaoma4dmJDcUV6JcQfCc+nnqmXFnqE0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-WhckBVWBN12h4cBgMZiCfg-1; Tue,
 20 May 2025 14:21:59 -0400
X-MC-Unique: WhckBVWBN12h4cBgMZiCfg-1
X-Mimecast-MFC-AGG-ID: WhckBVWBN12h4cBgMZiCfg_1747765317
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8711D180045B;
	Tue, 20 May 2025 18:21:57 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18880180045B;
	Tue, 20 May 2025 18:21:53 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/4] rust: drm: gem: More (and final) cleanup
Date: Tue, 20 May 2025 14:19:11 -0400
Message-ID: <20250520182144.1313262-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Look mom, no generic soup!

Anyway - this is just the last of the cleanup stuff I ended up while
working on cleaning up the gem shmem patch series. It simplifies the use
of generics and also adds a type alias for some very long types
currently in use. Also, drop one unused constant I noticed.

Applies on top of nova/nova-next:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverFile type alias
  rust: drm: gem: Drop Object::SIZE
  rust: drm: Use gem::BaseDriverObject in driver::Driver

 drivers/gpu/drm/nova/driver.rs |   4 +-
 drivers/gpu/drm/nova/gem.rs    |   9 ++-
 rust/kernel/drm/device.rs      |  17 +++---
 rust/kernel/drm/driver.rs      |   5 +-
 rust/kernel/drm/gem/mod.rs     | 108 +++++++++++++++------------------
 5 files changed, 70 insertions(+), 73 deletions(-)


base-commit: 276c53c66e032c8e7cc0da63555f2742eb1afd69
-- 
2.49.0

