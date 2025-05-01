Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB62EB1D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124654; cv=none; b=f0fmQ5uJq46QUyVPdnNZuYAuoVpwGav9tTcDpt+RAAEg0zPmhsQCFsPkoCf892fnFBimcOJmHu24RiSJOG4DiiY00TxCocXz+xhFM+DfC5g3CYkdmPveC5crJSnbivN6xasqLhJiLBK3h0kPXXgII24HXKfVYVgQ5Kfc49i8yFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124654; c=relaxed/simple;
	bh=wZmewsYxirG5R+LLCmAVZ9LtO9XThE+B6copsn23sdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=otLYtOlkKs7Emr3fALBDpbfLcFpqAIMZRyuup5cLEMEvBP1CFu27eKg6vXozxOj7aJ3gYuFRa7BD/o2/SbB5vW2BKqhQ3lLKMGBnI5H+82QyS7cNQt/xjbKWrqlK3fC5Y6JdEEJaoMstmzlb863DANiyubDkGaZy6SI7I83PFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+iyMxJg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+iyMxJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746124651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zY/y5cuq+QzWFVJKdbHLdKnpZh6l9uuVIW68BDziQX4=;
	b=f+iyMxJgvOQQ7O/ou8j8mV3FTomkZwtJHlmIge7h3yqpmv6NM6Kq1CNDWGQyfOJycJp00x
	K/7vRUeVtPGjHJZLZlkBqROrlFVa2pZ7CTZnBc7hJ6+Ax0LtBptko4gTH8qfIMC0+LEW1g
	DzPFspU3Auez1DEOt+Ua915f5uRLn5w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-kR0NwullNzy9ZxuJq6cPiw-1; Thu,
 01 May 2025 14:37:28 -0400
X-MC-Unique: kR0NwullNzy9ZxuJq6cPiw-1
X-Mimecast-MFC-AGG-ID: kR0NwullNzy9ZxuJq6cPiw_1746124646
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0724C19560BC;
	Thu,  1 May 2025 18:37:26 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 903C21800115;
	Thu,  1 May 2025 18:37:22 +0000 (UTC)
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
Subject: [PATCH 0/4] drm: Rust GEM bindings cleanup
Date: Thu,  1 May 2025 14:33:15 -0400
Message-ID: <20250501183717.2058109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Just some patches to fix a handful of minor issues, some of which were already
mentioned on the mailing list. Some of these patches also make it just a
little bit easier to add the shmem bindings from Asahi in the future.

This patch series applies on top of dakr's nova-next branch:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Use NonNull for Object::dev
  rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
  rust: drm: gem: s/into_gem_obj()/as_gem_obj()/
  rust: drm: gem: Implement AlwaysRefCounted for all gem objects
    automatically

 rust/kernel/drm/gem/mod.rs | 141 ++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 65 deletions(-)


base-commit: 3be746ebc1e6e32f499a65afe405df9030153a63
-- 
2.48.1

