Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACB1922C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747345480; cv=none; b=gtuHyeYsC9dFjmWydHmVNDL4OS9ucnk2SgAFzjajVV0NAAlgaRfxgXosFpJEhjHvZMx2Z0JQZTo42DFzxEA3Nl4IqyQnzzGRB5CPAKYZ6J65Mc4xQMg9SHljcA4syJ/dzEieeD/3A5bEGpsvnM+YxzabiQLlWGAgoVGaVajfKSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747345480; c=relaxed/simple;
	bh=vUmX13uun9l0p+J4NcfWRflW6TbCaBgOHkYfhTNXA48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pHVW62g4eG5u4pDCaq9eJM9wPAhCD6VqcPPRGbw5UPpN4QvCz1wiFbtQq3PNvHvatSZ+Vs1JTyexdGbHSxpQuhysIYsTnYa9TtZFnICiG6BHDLt1osd12OfwgX1Pe4NtupwZG6RsdX8gleoWMVg2YxgYmsrFqQyAMUkP+fWmvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+Bzn9nD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+Bzn9nD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747345477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H81blYQTnBnCdidgCp43UwI3eiNI2aqGgd2GU6utk+8=;
	b=h+Bzn9nD5td7xwNlNqsLPPxh2a9gJWQPfBj1al04em5786szvauFahu+mGgbm/1yUzqXw7
	g1afhefQbG5F+YQ7Ws2j43N0stHCLnm0GJXeAtpEwwdAX0XMt/i3h8nQr4fL51l04rb2QP
	C0vjpPjrR6RNy/4cR8bZu0RD6Q692K8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-xC3gILkUOp24_neFq_5Wxw-1; Thu,
 15 May 2025 17:44:34 -0400
X-MC-Unique: xC3gILkUOp24_neFq_5Wxw-1
X-Mimecast-MFC-AGG-ID: xC3gILkUOp24_neFq_5Wxw_1747345472
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5397318002A5;
	Thu, 15 May 2025 21:44:32 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11E861956094;
	Thu, 15 May 2025 21:44:28 +0000 (UTC)
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
Subject: [PATCH 0/2] rust: drm: gem: More (and final) cleanup
Date: Thu, 15 May 2025 17:42:36 -0400
Message-ID: <20250515214425.671423-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Look mom, no generic soup!

Anyway - this is just the last of the cleanup stuff I ended up while
working on cleaning up the gem shmem patch series. It simplifies the use
of generics and also adds a type alias for some very long types
currently in use.

Applies on top of nova/nova-next:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (2):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add ObjectFile type alias

 rust/kernel/drm/gem/mod.rs | 77 ++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 45 deletions(-)


base-commit: 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549
-- 
2.49.0

