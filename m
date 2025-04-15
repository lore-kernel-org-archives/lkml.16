Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CF25229C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746640; cv=none; b=GTgRqwasWoW5DqM3G+VZC6PzVaIXvAcMKlAgRkSyETw71fOITzLXQ0xtj+N401bcDDVPgdB3ZuxIb+hhCsYUyAGTKsjdPdGeq3sALLXLTsiqcVPonIBsgr4sLdl9x6txxW91fBOhy+6KngtJqAEKGd7D5HnjatqCS/4nUazK0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746640; c=relaxed/simple;
	bh=1pFZgZUVzroWedN9r23GFxrL9lq5T+7jK1Nzx+c3C7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qzr+lSImKgvAKbPnitE7pgNh0gKfWkKcPET2i0UfE4IG2c8brDNQH8pm6qanBa9FCsmdY4KjNeD6H3C1N9sbcNoVJLEUBeh1VZXTRYRUonFEoBpqciFhC0yAN4chaV8bx844xneATI217pSbrfp16pabxxpBt/fJXC7qk2c5HRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbKRphT9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbKRphT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744746638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dI4Ws7EHhkTkz0/bTYs4IgNA+1e1Pw41RQF94m79F10=;
	b=MbKRphT9iwGbE62gSFKLhg1uBbuLmVmUt+bypv32JErpmF6vysE2kieLbHp7vmhWFnfSy6
	cIFflVvOAe2zSonBJz60ic6guEuvNIl1HXGK5dE/5UoeECq9B/63HCk5c4lCqZzqmicW9J
	I+0smKj7YZEnd+BYt0IDanuD1Ff/j9I=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-YsO8sebeO9qsFhDBRjLr8w-1; Tue,
 15 Apr 2025 15:50:34 -0400
X-MC-Unique: YsO8sebeO9qsFhDBRjLr8w-1
X-Mimecast-MFC-AGG-ID: YsO8sebeO9qsFhDBRjLr8w_1744746632
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AAB01956087;
	Tue, 15 Apr 2025 19:50:32 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C97E19560AD;
	Tue, 15 Apr 2025 19:50:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/8] rust: hrtimer: Document the return value for HrTimerHandle::cancel()
Date: Tue, 15 Apr 2025 15:48:22 -0400
Message-ID: <20250415195020.413478-2-lyude@redhat.com>
In-Reply-To: <20250415195020.413478-1-lyude@redhat.com>
References: <20250415195020.413478-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Just a drive-by fix I noticed: we don't actually document what the return
value from cancel() does, so do that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 27243eaaf8ed7..bfe0e25f5abd0 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -304,6 +304,8 @@ pub unsafe trait HrTimerHandle {
     /// Note that the timer might be started by a concurrent start operation. If
     /// so, the timer might not be in the **stopped** state when this function
     /// returns.
+    ///
+    /// Returns whether or not the timer was running.
     fn cancel(&mut self) -> bool;
 }
 
-- 
2.48.1

