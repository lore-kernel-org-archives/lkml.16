Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E163202C52
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174261; cv=none; b=aH4qfs33zqwfyZsj/EjtYEN6rbYIRaT/Svz+RmJFuFFKYygUe5byCZ9mPmgK1T9LTZyIYqiJbzqOUZrf0MUhsQYFwBCdoeLgLihVf91iELWOutKFr87TFujoloq5+jsEXa1uQWZioNh9A4ZQPTqFCB8xaeEEnT/VpQQhUazSNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174261; c=relaxed/simple;
	bh=w24Zk0mrfK6FLgyW5jMvONKOC/mtUxUvO45aX/1U7C0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIuHkHnCXtRoU1RYAofruqJJpSOeOAx73RJ6LqDo3wjeu6eTdwxvHuVhYsWg+3SE1uidHne4GvOf0XwMh664wKspVePda4AMyJD1rCJlF+fvQUExfBm6Si9iPi0tEBSpeeNS09RasWvnkye+G45vFpLZacLrty6Y9BUmWee3bN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BreR2zRy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BreR2zRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747174257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=krgNrZ/Wy74kF8svV+fyng82D9y6ygP3k3iqkRT5JuU=;
	b=BreR2zRy9hoGz1yuFiYxLuHPHeWbgYM+0jn7fCrTPK2+cSsGz/8D68yPvB7RAsmjWFSMh3
	bhtiQJRVRrfm8zoMhr20pne4ze2+ZrAk99q6jjv97LsFasV6AdhDRuATOGP9E+nz3j5jL2
	XPvgyfof3x0EOetkqUCSqTyzVe3WMBA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-Qm-M3LRqOT2H8n12mOcH0Q-1; Tue,
 13 May 2025 18:10:54 -0400
X-MC-Unique: Qm-M3LRqOT2H8n12mOcH0Q-1
X-Mimecast-MFC-AGG-ID: Qm-M3LRqOT2H8n12mOcH0Q_1747174252
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D72C19560AE;
	Tue, 13 May 2025 22:10:52 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E14F1944A82;
	Tue, 13 May 2025 22:10:48 +0000 (UTC)
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
Subject: [PATCH v2 0/4] drm: Rust GEM bindings cleanup
Date: Tue, 13 May 2025 18:09:53 -0400
Message-ID: <20250513221046.903358-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Just some patches to fix a handful of minor issues, some of which were already
mentioned on the mailing list. Some of these patches also make it just a
little bit easier to add the shmem bindings from Asahi in the future.

This patch series applies on top of dakr's nova-next branch:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Use NonNull for Object::dev
  rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
  rust: drm: gem: s/into_gem_obj()/as_raw()/
  rust: drm: gem: Implement AlwaysRefCounted for all gem objects
    automatically

 rust/kernel/drm/gem/mod.rs | 147 ++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 69 deletions(-)


base-commit: 61479ae38cb7bf6083de302598b7d491ec54168a
-- 
2.49.0

