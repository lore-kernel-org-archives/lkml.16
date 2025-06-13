Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95928F519
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857304; cv=none; b=l2md86R6105FXRLz3vzdoFkFWVKWyUod1y4JG/63AdNUWBRf2WCwzbEY0l+EayQGNrK0CZ5NV/k0N1/BiFQ5UgzzG6mq1sfacE/HXXcY0qrKTT8jKLufQc2yy/9+nPeCpXMCJ44UwnJV58gztvzu4Z6j8oqeJk2yJ0Ye8O8HH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857304; c=relaxed/simple;
	bh=fdl1OKzYQAE7YT3Kp4/5yTLNL/7t/hg+IwN0mfuOAYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bULPlHAMkGOUNdA2SqeihqutqwH2gvXXEXlT9g/Qm/7BlQZhSYbHtCfkTNdEUFY7d491+ulYUILlq1QfIYa/mzR9xgDOiFiayBstNMb5NebIKuVEgRcweGu9yRbRUNOwSfwx7khh2qJGL9G2rgo5jW9ZNesdf3Tbjv29Wd/6Jzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJ/dc732; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJ/dc732"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749857302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKUkOIyLupZQGMWR7eWrjFQ6DyNfCG1TO+h5kHqEwoM=;
	b=TJ/dc732dpPSjSdeQ9xy8TFPsyPGTNLMrtj3W6dAQC+q7VAiTK3rFnbfPJ6VSnOwfc0eF4
	QZTO3/FS6AWIXKXGWQ9AKBDzwDA/CQXfyQyDuvZfe7GvdQQLqM32HxV274EBPWHhfMvhwT
	ep2q8zGIaHAWo2KzAjt8mWXjBLQIP1o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-cJDLvDMNNaatmCaXij-9Vg-1; Fri,
 13 Jun 2025 19:28:18 -0400
X-MC-Unique: cJDLvDMNNaatmCaXij-9Vg-1
X-Mimecast-MFC-AGG-ID: cJDLvDMNNaatmCaXij-9Vg_1749857291
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46F6418002ED;
	Fri, 13 Jun 2025 23:28:11 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53CDD180045B;
	Fri, 13 Jun 2025 23:28:06 +0000 (UTC)
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
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 2/7] rust: hrtimer: Add HrTimerInstant
Date: Fri, 13 Jun 2025 19:22:23 -0400
Message-ID: <20250613232754.451450-3-lyude@redhat.com>
In-Reply-To: <20250613232754.451450-1-lyude@redhat.com>
References: <20250613232754.451450-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Since we want to add HrTimer methods that can accept Instants, we will want
to make sure that for each method we are using the correct Clocksource for
the given HrTimer. This would get a bit overly-verbose, so add a simple
HrTimerInstant type-alias to handle this for us.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time/hrtimer.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 294f257ef5c5a..c775d7abdf5ce 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -72,6 +72,11 @@
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
+/// A type-alias to refer to the [`Instant<C>`] for a given `T` from [`HrTimer<T>`].
+///
+/// Where `C` is the [`ClockSource`] of the [`HrTimer`].
+pub type HrTimerInstant<T> = Instant<<<T as HasHrTimer<T>>::TimerMode as HrTimerMode>::Clock>;
+
 /// A timer backed by a C `struct hrtimer`.
 ///
 /// # Invariants
-- 
2.49.0

