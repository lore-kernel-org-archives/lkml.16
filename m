Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D65214228
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315572; cv=none; b=S5mctCQNyOc0URUR9nM1qMLSNRtumlfFwxdD1xbK8HKKFRTGBT9aa1wA/wY92xxLq3RKXWtI7wynC9Xj4U+++b77j/w8NszzK3D3rF6KvffObweWAsELYWpocTgPzPYtsnzozYtUAPYS1u/Bpsn//8kwDM38RJ0dA/sdfq3Y33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315572; c=relaxed/simple;
	bh=GWW1hjokZB4jc7H3QwDWktdHZ8wac6bK/vXMX0acnE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PIAAG4Mb5jDfEBFYm4NdkXOy1W03ACQiQzSqdLNlQLffZd5a6QSSYyC6ZTzOa8KHez5twMtASkRgM1oY4O00jqBnnO++GPE2eHYjt+wowbLQAxYJvLyNS4e0op/8Q8/GUUgBB/HV20zDlcHIJNsdban89ThL5UAM5Rj2QLiY4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4NaX2hk; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4NaX2hk"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so2861972f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315569; x=1745920369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1b7J+UNfonWdLeszOqonYjrmWvS3LamWs4ixsdchvY=;
        b=t4NaX2hksZsE2vCgNOyE2CplJ+1KoQ9L8VBpbpwhgQfi/MQ4dpma8veDqRBJwyTBJj
         DfUm6Brhv27eETa5GWLZmWeqU9szlYULSi0RwI6ctLqbQlZaMPIRkTVUfO+PUn+UU+By
         UxMr1OxG3VgocoT6xmrmCEmBXbd69euP66b1bnmQ/sEfw/59lVSRX+GCCtKqtcffrZKN
         ruG1nPFUEekLFFL+emdmeyAmCSJNcEG7mRRXCoGJG+iHZLocES0AVrTSNQOpBsOpdhQi
         1mrWeItDdzF44+aASLkTm0pnIfTIvjYnHXjhXEwVSC55u0HoYIJfBKFXs//k1OEHS4mk
         yHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315569; x=1745920369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1b7J+UNfonWdLeszOqonYjrmWvS3LamWs4ixsdchvY=;
        b=Ymk8/iXZpwO8rLnwHxPKGTBeEF3AJcN70QBoWQ5Zdx/VHF0CEojsQuO5We5BNZE/FH
         UzyxK/hglLFuXZ7MB8dLD1MlyfPObpfwp7YuifnTNdX3G0ewM997m8l//c0STHOxkCx1
         D/ESHZgUeltZysdQKjrmKeCH6jy/OUZ6bLQNCPL097a3mP+kfR41CeZKCLOodzzejPYn
         30Eo7spwFWg61OHuQbc3ypFSIzOdkYvpLzwXVwfGWtPMgAeZAjjfUK4vaJkAHsfC+XLV
         aS+hSmBPdZ1BUgnv3b1lYpeHEDGBkOt/CeTd18Eaxh4CVSlWb1patmjcpjAgi6bLUzAh
         4Z9g==
X-Forwarded-Encrypted: i=1; AJvYcCXEl09VxSj+Btm2N9FnDfpsKiLJPe3ZsfrsUEpfchBXH7WBvFsFsoxTsvnbTKj+RqP3/msH+d+E8dcN9tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUO43+i969S9wRcyw8x2rYHOiDzXyljEblgPJoiyBEFZ7FdLgq
	X3Wsl6Opqi62la9/iOZgzzNEDO8IU7r0/UOq1drixPUB8YO4izzk7kyEqdV5oJTIwoW3P+zsg8Z
	kUznT3A2exP3beQ==
X-Google-Smtp-Source: AGHT+IH+cVV9twzU1vHTbSct4nZOgZGmFSdJykADxGQWVUDv4tibjvkEOH1AsMUFz6pZR7bdKz+sIniR61DT3yk=
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:43d:522a:45e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40de:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-39efbb09208mr10899224f8f.55.1745315569002;
 Tue, 22 Apr 2025 02:52:49 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:21 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GWW1hjokZB4jc7H3QwDWktdHZ8wac6bK/vXMX0acnE8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgmj5mzsyklfjuCQ+MElH2I0ssL9Murx59B
 0pcUIgBWoeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 Rj/UEACM0Wb6Q5fhB3bzfKaeO8kiKdbbrZnecj0/MDszzWQ9m8CIWhg/jrtNZ2aQOeaA9sOHDNu
 pXubzPjWoOcGJkc7iUPwxmsKBR8Hr2WFboblw7S2FLxH3+9MTCA8VDZnK6nJUz2HymrHJD71Tw4
 FW5NdnKStp3dNezeDIqXyYrL2vlBN/tgqwhllmUMU7EnFLNxg+DFbeUv7MVqN8Rv1suaQlgjqaq
 EZNpWcD0/LgzBWnBoJlV/EdUGWYpkVJ0OsfnHdrXQM13/Lo3Dv/20gRhwyP+YWhmys3YosJHgjg
 HsjRL5kCwnf75pquh9MZK4kXHOcp5+6J/+CjRmVQ80+deCLc296cXoUp4deE5ddJ0TvPjVz5tbL
 5cQPxPaf2npNTehftZmbiJ2Q45n4Oxp+DHGQj6KvatWoL6rMaFtmyMpk20bow1uJ9ZVLDLuhzyX
 KDxyRwneSlcaITfFauYRDvZvFEMKQA36FYwB9FLcN7/qQvo4uQgzPzWv1+bONDH9F0M/M6qcDDo
 0tTDR0AH/EdWIZ5SAL3/jk6NqHMoLStsmJYabdPPrMBkpH7COmhezygm7mFnikgqiOJZKXoOSFa
 O237mA0LVuJKJzWj/IXTYBOCy0VLinghXokee6+suCUPN2f5vZG4hH2p/mBjfPQx1mhs6KyQ2fu uVQOEjWJGeIrE1A==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-6-deff5eea568a@google.com>
Subject: [PATCH v3 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed by Rust Binder in the range allocator, and by upcoming
GPU drivers during firmware initialization.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 2f894eac02212d15d902fe6702d6155f3128997c..2f28fda793e13841b59e83f34681e71ac815aff2 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -386,6 +386,37 @@ pub fn pop(&mut self) -> Option<T> {
         Some(unsafe { removed.read() })
     }
 
+    /// Removes the element at the given index.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// assert_eq!(v.remove(1), 2);
+    /// assert_eq!(v, [1, 3]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn remove(&mut self, i: usize) -> T {
+        // INVARIANT: This breaks the invariants by invalidating the value at index `i`, but we
+        // restore the invariants below.
+        // SAFETY: Since `&self[i]` did not result in a panic, the value at index `i` is valid.
+        let value = unsafe { ptr::read(&self[i]) };
+
+        // SAFETY: Since the above access did not panic, the length is at least one.
+        unsafe { self.dec_len(1) };
+
+        // SAFETY: We checked that `i` is in-bounds.
+        let p = unsafe { self.as_mut_ptr().add(i) };
+
+        // INVARIANT: This restores the Vec invariants by moving the valid values into the region
+        // that is required to hold valid values.
+        // SAFETY: `p.add(1).add(self.len - i - 1)` is `i+1+len-i-1 == len` elements after the
+        // beginning of the vector, so this is in-bounds of the vector.
+        unsafe { ptr::copy(p.add(1), p, self.len - i - 1) };
+
+        value
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples

-- 
2.49.0.805.g082f7c87e0-goog

