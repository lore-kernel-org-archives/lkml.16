Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2B29A308;
	Tue, 10 Jun 2025 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562137; cv=none; b=NwQXY1MyLNkPvlDAgFsuTd6ASBuTdBr4AR4WpVd2xBRFkpnMSOLszSyG+bjgnsPy5T77czfcXVtz/9sD3nPjYFPsmmjTaUPPcwerIwmahul+4XbZGs2L0hZ3VeEJKPm6ppGzaSDb8ci5Eq8M56opk2AbZ/NedDKvVYmZsaDuHxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562137; c=relaxed/simple;
	bh=Pbs46PP7pCs0MPmMt4GjuzpYwD4EEpd9XRag3zkhwz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWCxCIH/PawYXqrG80xThsuwhjRSm1bRNSt7XVhtR/wMsbNZ18CKtitHjO7ec71x6JOGCgrGUwHffSVxKMgeUd2fOHuvaD4IuSsJMkgbabcXfS1p4HUbeqJATomxxecTK+74P9s/u+kjjYPsDCpHb8urmu62juyai/9ls/v9AOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHkasFH8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHkasFH8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso4091982a91.3;
        Tue, 10 Jun 2025 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562135; x=1750166935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7nHsumEdn2KQbBdNMRcYljio2yurEvUWZ/Mli9glE=;
        b=IHkasFH8EeqMqaMk9qtkC8fFMRek7KSbLdLFPSbhoOmyHub+WFDToi02bZGKxiLH2j
         xQZv36QpgkITrOmrrkdWjhKGNjb21M5NkAiU25+rQi/YrVVixDZDnaqD+jUzKSZtnggs
         LfCcd6muj8nHqr9iSa2S67rcCDN1hEpAFxDomKOHT9Mv5f8rV7vvhXx7N2qompXDob0r
         td7iV24xLcbiqKK7wT13XAIOLbnz9m1e2Q/f9iyaO38C+HWwU43oWdnChE2ABtAo+wqF
         PT50Whrw5QZBOqo6GWul4lTnZSxwnXvIXrJ9yOzwHkljzEdFjzWSpyyv+RtJnK3hER6h
         Gnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562135; x=1750166935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc7nHsumEdn2KQbBdNMRcYljio2yurEvUWZ/Mli9glE=;
        b=iWUbJpb7/ksvMXh8yTuCMHOqjxkXdVAVbfT0K7aM55WDoicB+UhskoCEF4tljT1ldt
         UAwnWL4+n9CRsuf/P4mMt4oO5q7OodFBU1fv6Gv9+Qg/6vhN88Q3VABBhFsKNDJ2Ke59
         qVlg8QaYIUkfSxl3EJCDB5kF8L/vYTbVNmx4zV+FezXLWzOkmR5Lg1iIazIQoO/yjs0y
         qItpY4Ee5XViWtGuFUHy36+HV2Fe9pUsSlnmwSbWYFNHbv46dzQiFOK5N++0/4PaIWNX
         vikdWiT3SvyZHM8Gifby+owoGyHbz97hWLw3CiQBWGomXgjbuinlqF0i1q9kAg7fitV4
         /EPw==
X-Forwarded-Encrypted: i=1; AJvYcCVubI/PQqVTHHlv4/RFb97ln1xA5+FjmZkQivqWMTOfJ2mBa2aK05PdKviS5B0eg64J9Y+TUy3rQyRjAR7RjDQ=@vger.kernel.org, AJvYcCW0L26esseLGlnMNNV3OreMK0Xx0gaa3XvfXRsnJptwj5mLhIQe2zISiBrx+1j61GYC3/vE4z/NU1LgLzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE6PXrQgll4YeZIoUeSGph8JUvmOMcLNmCLNBE3RozqkORoSxl
	SS+QvCcpq06d/Ed7S5zFO5VYAlzDatG6Li/+4E1Z5SQJ8Nu56Hnlqw/E
X-Gm-Gg: ASbGncvcpY7QjZEGSVIOn2W/6/nZRwGR8kQTfVn8LDtRydRWu1t68ammxNTOG8VVgP0
	R2XskMwruSR0hdWscEaEHR6q5elROfsDquzSle9CzRV2OaCKR9o++yb1vHq3FD7h8GkWp9aNF46
	yT0zs7AXdD49wlNvHGfYlOmrPzV/DpOMvK/0DVMhNFzOCiCUXZJ44I+Y30UNoHYPUK7oXX/NCbt
	bT7DtkwnPvopu5zEyB1gaOFgjPL9KoU3mUuOkeo0DK6m8SMuEXGTITz5v2Zg2xLbc1DccyfPw/H
	japmnWzbN7oRXCF9gEw87nVRUUCajSFTIy8jFcugzeLx44SCoJWHQc4lOfESnakwa03yPfIkqoa
	19ySUbmcRBpIuH8hRAKyRpaeYmYCVBgsfM8E=
X-Google-Smtp-Source: AGHT+IH05u7IrcuH6+zYZ6wKHxWG1GUKhxIN/0VozpeD8CoD4qo2bsTIZEoKXL8TztGrvj2P8iY7Zw==
X-Received: by 2002:a17:90b:3d90:b0:312:ffdc:42b2 with SMTP id 98e67ed59e1d1-3134767f220mr20724915a91.23.1749562135168;
        Tue, 10 Jun 2025 06:28:55 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:54 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 5/5] rust: time: Remove Ktime in hrtimer
Date: Tue, 10 Jun 2025 22:28:23 +0900
Message-ID: <20250610132823.3457263-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of `Ktime` from the hrtimer code, which was originally
introduced as a temporary workaround. The hrtimer has now been fully
converted to use the `Instant` and `Delta` types instead.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 4ca153f8fce6..3980a7c5f7db 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -72,22 +72,6 @@
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
-/// A Rust wrapper around a `ktime_t`.
-// NOTE: Ktime is going to be removed when hrtimer is converted to Instant/Delta.
-#[repr(transparent)]
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
-pub struct Ktime {
-    inner: bindings::ktime_t,
-}
-
-impl Ktime {
-    /// Returns the number of nanoseconds.
-    #[inline]
-    pub fn to_ns(self) -> i64 {
-        self.inner
-    }
-}
-
 /// A timer backed by a C `struct hrtimer`.
 ///
 /// # Invariants
-- 
2.43.0

