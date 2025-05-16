Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34501253326
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415445; cv=none; b=ndV8Hqi6T89ziYqSwC09hCI3KvsZ5YDN+ipocBqm1OOBgvshXKnFeetxRms7ppJ1GVTIyg3Ux4RAhpol3khP+1IW2bkfZ4pml43m0GEFW/36zDqSzkyD39wQmEoabnO02ObpcXAg6pksEfITwzT5om5aW6q2CNOS8o/1NgV0YvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415445; c=relaxed/simple;
	bh=rSh6T5OvA9nNWtiSEHAa7Y0+wposKvpjf3ky75oMLGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=osoaTlsyNh+phmXzStEu9f8Mz3HvHbrAW57OojF/nnqhVf16jz0fUyFpXFATangBhak2KqvVUt2Xw+8W3bAFh3IbSs0NtJuYvl8T12TCrNuzaG3WKzp00VQtW+sNyp10HABaep5crmZoMXcP/uuhyva6sF+LqpSbE2clchCtwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZtviVyyU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtviVyyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747415441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqqXQ0u/im929/mMLP9js8oD6omAmYTkJ6vuyxHmHR4=;
	b=ZtviVyyUPHrGDa7VEbeUXKM/2w9dSE26ebyoXnU010n8TCpqIV8+hkJO3iLWOC05EHgVLy
	5HJUR8ZxdQWzOX3hB+oW+NdizS+RLlN1IxyfYbOH26yGpZ5J/RwnuCFWBXj5IAxgEsvyhg
	uplI68ZARHCLD3O0vgBRMGZMm04yKEw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-ByzUrL92O02iX4Q4pNUlyQ-1; Fri,
 16 May 2025 13:10:38 -0400
X-MC-Unique: ByzUrL92O02iX4Q4pNUlyQ-1
X-Mimecast-MFC-AGG-ID: ByzUrL92O02iX4Q4pNUlyQ_1747415436
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94E54180087B;
	Fri, 16 May 2025 17:10:35 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AD28719560AE;
	Fri, 16 May 2025 17:10:32 +0000 (UTC)
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
Subject: [PATCH v2 0/4] rust: drm: gem: More (and final) cleanup
Date: Fri, 16 May 2025 13:09:15 -0400
Message-ID: <20250516171030.776924-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Look mom, no generic soup!

Anyway - this is just the last of the cleanup stuff I ended up while
working on cleaning up the gem shmem patch series. It simplifies the use
of generics and also adds a type alias for some very long types
currently in use. Also, drop one unused constant I noticed.

Applies on top of nova/nova-next:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverObject type alias
  rust: drm: gem: Add ObjectFile type alias
  rust: drm: gem: Drop Object::SIZE

 rust/kernel/drm/gem/mod.rs | 102 ++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 58 deletions(-)


base-commit: 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549
-- 
2.49.0

