Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6C209679;
	Mon,  3 Feb 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595414; cv=none; b=QIANIaRQMJBHn0mCjf33N2afvwQUIaNQMxKS8RBJsjzDp5o1B7w9xfSNr7u93bSyQgLtwfL7M6+4REELIEhIQ0nCCSnbxgTZRolKTriFQNyLbCDfc16iTCqT88u1ECg1LC7jazWAcSlxPN5/cc1FkjDwp8QsT4cNpmMECubh03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595414; c=relaxed/simple;
	bh=WcA3kPv5iDC8b2KCR1IFW4zckDGb5vp23+fuV9V0gKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICGCNZ7ppZ6Q942h86HbOYahhIonj+1/NrHLrVjekf9C+sW3BwxGprqOWtxobmqmIHqmnzV4ITcl31buEEID4mqy46k3sRRr+zkSjhA9Z/e9V4wtVhF2H/EGF+GvxqnsTe2lBn/UBh56oy9IKhFBukhgPrcZXfNG0WuwLZPN6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SU8WEnVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SU8WEnVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AA3C4CED2;
	Mon,  3 Feb 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595413;
	bh=WcA3kPv5iDC8b2KCR1IFW4zckDGb5vp23+fuV9V0gKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SU8WEnVD2dQGPdU457jC2LBRdJt6P/fZeDAkPNZenkPoU8YSpqnYy3lvdQnseK0Io
	 pOLrUEywh/BHw99GVph1QYlNV9O57O+Plny+0rIHZPRcI9lr1vXM6DFhHIKeaMurOi
	 dtBD/BMJhuO+BRLdwhd8jZ3vueV3eXSyJP9ieVZR7yK4q1U0LVAnb6geOuE5/tM+gJ
	 zau30X3OIQ62M2ABJ5TueTlwCNQszfbEWz8yJ0Jn4S89uY7aOOn46STNZCnNIOd8B1
	 LOIr/gAaKU8MKND9gRqIhNbfn4R1EfONwHQzjIxaFBb1WlB8oLaoOxNq6CRpqRfq+h
	 8uDLOeJ6qlY3g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:47 +0100
Subject: [PATCH v7 01/14] rust: time: Add Ktime::from_ns()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-1-189144725399@kernel.org>
References: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
In-Reply-To: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=vRt29LHxNF2wToo1w0j7/SlmbaaQNhsEhnpJ66ceDJk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvOEVdoIQm4tNaY3DSs3z3ZzxIRa/RcWefFj
 xvkkbI2T/KJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6DbzgAKCRDhuBo+eShj
 dwDBEACj19cU32sMiC+xa6Z6bNfGrCvqB6vxAIUivHvmwuww735I3fibjLJZaN5cpEf5QhMi9sL
 ihckviGV3r51d5lGIyn8KtvAmXRPrUuz+DV8ZFNfhdsNkOtAK9deVw1bAgmrdRD5TfSe3nN52h3
 l5JFyF36gDlMZvaBNDT+y3RoFYvMcevUz+fpw3GFZbzCLqYXZlYskvPxs64J4v16oAmeMOe98gP
 NF34P1MmjXP7WonvyFW7RF6W5NcuIRC6lRE3xLNBtUBq8A8IBRcUwxbwURbTuJ4VXP/PDu035Jq
 DExWC0FrbB5qfwnVgNldk9UMbyjk8FRW2vtTgov7XqCup8MwXdVqBAEFLu09CbreYNgXeGvGcxv
 KRwK0mAezmLJ5sd37yj8pfLP5PD8hkfwx+zUAPUZO2OS6cLzWGB1n3VJsJ30L053fPHzXL48AJR
 OZ9OYEg8lpn0JT+PlWsXsqWpp/cCBQzqTJUdTx3ni/hCenm/3tB8GvOPeigbyR6ssxw3+pyQ2um
 YLe8lm969ebwvs2JixPOLHn4yV35GQ+yFqgITn8QNc+cqytQ+2lxSRIpcqL9q3DDeQ/6qJ7ChUn
 l6Cyf54HPyWjNYGGZUVHM1HFvHxEF5SOlBxddfwyyBeJ7hCa74+bCQ95SuS2O/FkiNMDpvD30H0
 lAdUjsbymvmc7dA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

From: Lyude Paul <lyude@redhat.com>

A simple function to turn the provided value in nanoseconds into a Ktime
value. We allow any type which implements Into<bindings::ktime_t>, which
resolves to Into<i64>.

This is useful for some of the older DRM APIs that never got moved to
Ktime.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 379c0f5772e575c9ceacb9c85255b13501db8f30..87e47f2f5618d6a4c2e534dd7ec663ced0e91503 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -8,6 +8,8 @@
 //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies.h).
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
+use core::convert::Into;
+
 /// The number of nanoseconds per millisecond.
 pub const NSEC_PER_MSEC: i64 = bindings::NSEC_PER_MSEC as i64;
 
@@ -63,6 +65,12 @@ pub fn to_ns(self) -> i64 {
     pub fn to_ms(self) -> i64 {
         self.divns_constant::<NSEC_PER_MSEC>()
     }
+
+    /// Creates a new Ktime from the given duration in nanoseconds.
+    #[inline]
+    pub fn from_nanos(ns: impl Into<bindings::ktime_t>) -> Self {
+        Self { inner: ns.into() }
+    }
 }
 
 /// Returns the number of milliseconds between two ktimes.

-- 
2.47.0


