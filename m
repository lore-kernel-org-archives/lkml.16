Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB68219307
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937882; cv=none; b=ZD/PqbOMduToKiLDyiE1kkl5AtjoZUkIZZ8iCUpMfKgXnx6khA0M81jtROUqvCIzOhayxcJO0aVD5XdGxQHbibwC8LMAOsrtN+nvhWyFyMoLfUri9qDHolGW9gdbQAHn1Wj4WuxU7Yu9P+jTkwjTr0nTv5yb1VfVwUnM9uHfydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937882; c=relaxed/simple;
	bh=K5++jtkWdFKeGKaBv79rQOtxNbNpObzYBnqu3tQEGaA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UpqtecIPrebgF8ApJXPppOi2L1uT2n6S3kuCUXVopdJE1a+pS+0xiKPWcCKZ0VnPRYUh8MNWP+aHUgEP5XFhNieFz5uHFAT0ABspdimtUcUbZoo44pcNzyf9BHXGHSi6fjkcOjbYA37SWX1UN8uSevchR5d4Rl9opMERiOxnLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VOxkzU8k; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VOxkzU8k"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so37681745e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937879; x=1746542679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6B9w1IN3J8l+gx2wlL6oxYawXvUUUb3KDtVl/y0wnY0=;
        b=VOxkzU8kXkPC5NWlEnALKGhJVRmPnPMCqoE98K/UVhnxZDK9lHyX7S1isfWdGO8B6d
         fsHP4lV/gEouqgK882bUv1NQ9758U0mP21rqbOgRTuQkhvjorey0PvEtbCKv4c3LNgNE
         ooba5egb1wm4HpIFK4LNFVgqNYD/y6tsM6OzMwYVXLKn9dj0WTp43xwNwjFkXxgrNHju
         Jqa/HtNcpAQZjGsV9v6xWzollxjI6KpFm49ZomoyRvGfIQHLF+ySRNgn0nyWbUMx+xgz
         G3C7MLLtp+IFWdhVqnbwrgQTM6MnSLSuM4oDB0NkaNNPbPU2gKmeO1XfzpVY30qGByc1
         PekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937879; x=1746542679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6B9w1IN3J8l+gx2wlL6oxYawXvUUUb3KDtVl/y0wnY0=;
        b=nv0QLOhy8rtk3eNmDaxVk+H6hGDvVi7zJ7aKXEGgybWIVOti31JGN0sUFZMGD9p1q5
         uQ3Rr8zbvXYD1FdqSQMgke2hB0zA7R6OtoZK7m7LP8zsIMes5/Y/bStLpIqfUTWz6+7q
         uMCnDv7xQDCXkf+vdd5Li8C4gQIqRjGnb5X0evr0JJXkYl56MTnNfaJVLVUJvXhj80yN
         5adj17UiLlcBa9zgyfH08P77J8tMBnfdXsYBI8ewPYoth10isyGcz4t4Ec66S/hLiMoN
         v5+NXzD/YOxzidyDlexzz1vpUsyZUi3eh6anVaD71Dd2QOufKa8UBMdwS0je6Ksd1dTw
         6OfA==
X-Forwarded-Encrypted: i=1; AJvYcCWMq03suvFnSlSoqtSTAv3x6ip8J2qyhCR4ZlbBVdi7d3ICw4odum2gAdAiv1vDvrfdJB458ssrIZ8AHew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uRjdvJ3MVLQX7n9eConbpUafoPeDJ2agjUP+VagO7KxDdek7
	v2grOJW6bo7tSx2A4kBI1hDvypIRdwyOsP4mJ0Q8cVpOMdtilyG+j7ytb4lr7WiofOxM2v+T4Pz
	OTxBtkm7Z87ChkQ==
X-Google-Smtp-Source: AGHT+IEJ8sOOOHYMa5Vb9TKyn1mOsPbkuM0Gwu6IBt4Hyt0X1N1f51tfO/ybPraISY9tVDCZrhmBYdDqgjt1EBw=
X-Received: from wmqd10.prod.google.com ([2002:a05:600c:34ca:b0:43b:c336:7b29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1909:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-441ad4ff981mr22703445e9.32.1745937879469;
 Tue, 29 Apr 2025 07:44:39 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:21 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=K5++jtkWdFKeGKaBv79rQOtxNbNpObzYBnqu3tQEGaA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXSNjAcDgC2N2uwDD9iN46zr6Pr3b6c+NT/b
 FxApjeQvNeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0gAKCRAEWL7uWMY5
 RiNMD/4m27KxuNiQidWUStcThfFshtZS8opY8NjFTvgQ6jbCRcKlsiXuumuv96FgEW1l5udi4h/
 zVjIWIC9RwK3PCmlBKK5lTqjqHb8+vkV+z+YqFsLDKEc+UmuWQBwKSoQYh2+TvaFdj8v9GCOs/J
 8KbGn6a5855JyjXyZqUzijnAjdcq4lMqEx8M9GvYCMyDv2zzX/EhalNrGLI5NUs95f58fGhF75h
 5Q5waEIZn6Bx2AXMwjlXUJ6dWGTsbrCGcrufRKYfep+pZ7KSpUrAeWWT1AYPQHacS5BYJycEW8S
 UVwus3OU1dQcXEfrLksSnJZ8cefoqijLhdCs7d+hJj5y/P4ee1QV0YuCaUSdbgeifio1NqR17N1
 236vq3soN2M3eibHKo0RdwEttBBHJlwFhFErBAL0cQDoCFZgy+tpvW/8iqd1HquuiL7bxjDUwsT
 hNFS4sE5fBXQ3iqsnJrmLnzfcat4As6glzvQkSWxcHbes3QLMB5sW8GbYKwqK6RJ6UB//227BnS
 1hLlRTA3x3m2enlzGdJFCRaPywq2EfYJhtWNuRNqXzeP4N70oxpGUBYnXjXE7DXQO7Bhmn0egq9
 SQRTZFg/AXxY3uH1tQ2QuhtkE+O6c53Gwl2b+GQsMLVdwffI0RfvgPIWg+uNsURJ43Etxj421O5 ldSz0sl/zHKzn3g==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-1-dad4436ff82d@google.com>
Subject: [PATCH v4 1/7] rust: alloc: add Vec::clear
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

Our custom Vec type is missing the stdlib method `clear`, thus add it.
It will be used in the miscdevice sample.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 5798e2c890a2140a12303706578ffa2a85423167..412a2fe3ce79a0681175bf358e8e0f628e77e875 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -413,6 +413,26 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize) {
         (ptr, len, capacity)
     }
 
+    /// Clears the vector, removing all values.
+    ///
+    /// Note that this method has no effect on the allocated capacity
+    /// of the vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    ///
+    /// v.clear();
+    ///
+    /// assert!(v.is_empty());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn clear(&mut self) {
+        self.truncate(0);
+    }
+
     /// Ensures that the capacity exceeds the length by at least `additional` elements.
     ///
     /// # Examples

-- 
2.49.0.901.g37484f566f-goog

