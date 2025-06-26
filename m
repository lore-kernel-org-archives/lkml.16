Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE952E763F;
	Thu, 26 Jun 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957184; cv=none; b=cJ+bjSuomwGw4TfPXM0QBbSPi5/5xo4mwTNO6X1Uhtdgu1N+oshh3AiVUV6Kbk0vJvI2yikqTpkFp7HRGILAt3F/uQV4kGJXHt/uK3ynA7a8Tj9TruOk7yxNXWgAB0mWy3Sq0Vt4SH1fMyQ+LbhmziON4e8HSUz5azdattiy6wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957184; c=relaxed/simple;
	bh=OU6x6VbETaOVIzwd5uF6nknYiewnsXccFDvlJhynToQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqY/GQ1VOkoehOoloYtZxRo4ZgNbYPrk4M2tJsKn2g/ImjHlD4L1/dob6l7GnQ0M2PzXMPKgHuE+VMgjz/CpvwKoWdev5oVk397Vmof1QibNzQkpWXaGM2DLhHyzFNt2N9k1gz2HffsmV/1TwQW0nijmk2elvVi+d18hhxE1I0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk6M+3Sn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk6M+3Sn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23694cec0feso14301705ad.2;
        Thu, 26 Jun 2025 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957182; x=1751561982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XElJKsJMYyCt4pyabf2x9DrVn3d9y2TutbM81gC7OkU=;
        b=hk6M+3SnLhuhJDlUWZVFqxmNQgDBLGf2SX35xRX54noiIxbJlwP3mCWzGbf+WnfyTw
         qIfxP++Rr1rakwt8olfYOLo2V3eMuPQubG8VRaOL3YHVx/4CbUrtCawIAh2dazgSeCqz
         3KFS1xh7NEpaowNNiyqCdbQ/R9gmYzMYUpfdtohnmSo8Fp5H1hkO4fryDZfK8+ajfBri
         D2SVzD3u21ycqM+vYA1VRaCSmWugCX/xm0NvEY/QdttKhVJUJA3nSowRIZMmCsUQpoja
         EZULOPWGrH69iuag+L+5RAoyIBlmboQ28lvbd3nWvdm/O3jQwDZBR0XAEaZiM3+9lRnb
         l61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957182; x=1751561982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XElJKsJMYyCt4pyabf2x9DrVn3d9y2TutbM81gC7OkU=;
        b=ngOoXRagPVtLrSmjeeNDXa4g6BhUIUgfGdGUap6thmYJFHboGzZrGpFjB7E0ZDBJPC
         X0pylF+7A4+SjZma+bv0l/KJYd6W0mUGsVjT9nakSEdbkgjEj5EoNAvbW2dw+fmnLOuj
         3VpSXjTBhrc9su1VOIXqRn1MpquQItbQ87yhXWDe0kZg6kBHQK4oVG3bg45Rq8NVbv7z
         UTUtQ6wQjPG5ovC1kt57RG2UnfERUZ0Eymna4Uj3bXxJHkMWb7Rl35nsuS5KpvUShtdv
         6x9Wv+h+XEhQ+SYxyK74X2OiiE8sxqiZGS8RwtvUdoVFgpGcq0nloKBVDua5ZvIdaHXF
         3p2Q==
X-Gm-Message-State: AOJu0YyNlIwNqVdDjwXulp+TL7bFEMa8eDBz1UJqLfw61fovVphXG1sy
	wE3a7MuQ/jLYJHElePSQCs8yGqrlrpqoz5VXGXa9P6cULX9+aQFlsrO9g24xCr8Z
X-Gm-Gg: ASbGncviZf2YWX/UZUD3gjbkFtBHwqujW1AQqEW1551p3uZUx4muhmIJF1QOxFmxfPQ
	wrsaii6njOheJXjsQRWHLaF+8YFGpDHaxDFiCD1aK/qSSfzrgcTEDVXEJKz0JWb+YioI/1xhS5e
	eSCyVS+M8VP5x+sFrmQZDtqilFfBoNnsh8kgCZwQ9FDkQzT4HC1bFEwP4dby5V7/3GIFISHHXOa
	gsuEReQ+EfYYesqDjM5cO5eR5wt0XRuasLkuzEbC0D1MHzr4qaKe3U2A+wnd/EH8kGTTpj+uZVh
	I7mJZ7x15KIYPmvl52RNTF3khQadCoKYtcXRLvW2lx2X51Ne
X-Google-Smtp-Source: AGHT+IHOFzGeaZtBfYcp4KQ+qoTmWLdfgXS1rt/ESYHO7ndAeJaU6rwiu7EPC1M+9O2Tln1h3H5GYQ==
X-Received: by 2002:a17:903:4b0d:b0:234:a139:11fb with SMTP id d9443c01a7336-23ac4633b55mr706125ad.27.1750957182143;
        Thu, 26 Jun 2025 09:59:42 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:41 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 1/2] rust: revocable: Refactor revocation mechanism to remove generic revoke_internal
Date: Thu, 26 Jun 2025 13:59:26 -0300
Message-ID: <20250626165927.66498-2-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The revocation mechanism is refactored by removing the generic
`revoke_internal` function. Its logic is now directly integrated into
two distinct public functions: `revoke()` and `revoke_nosync()`.

`revoke_nosync()` is an `unsafe` function that requires the caller to
guarantee no concurrent users, thus avoiding an RCU grace period.
`revoke()` is a safe function that internally waits for the RCU grace
period to ensure all concurrent accesses have completed before dropping
the wrapped object.

This change improves API clarity and simplifies associated `SAFETY`
comments by making the synchronization behavior explicit in the function
signatures.

Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 06a3cdfce344..f10ce5c1ed77 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -151,26 +151,6 @@ pub unsafe fn access(&self) -> &T {
         unsafe { &*self.data.get() }
     }
 
-    /// # Safety
-    ///
-    /// Callers must ensure that there are no more concurrent users of the revocable object.
-    unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
-
-        if revoke {
-            if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
-            }
-
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
-            unsafe { drop_in_place(self.data.get()) };
-        }
-
-        revoke
-    }
-
     /// Revokes access to and drops the wrapped object.
     ///
     /// Access to the object is revoked immediately to new callers of [`Revocable::try_access`],
@@ -183,10 +163,15 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     pub unsafe fn revoke_nosync(&self) -> bool {
-        // SAFETY: By the safety requirement of this function, the caller ensures that nobody is
-        // accessing the data anymore and hence we don't have to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<false>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and by the safety
+            // requirements of this function, no thread is accessing `data` anymore.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 
     /// Revokes access to and drops the wrapped object.
@@ -200,9 +185,18 @@ pub unsafe fn revoke_nosync(&self) -> bool {
     /// Returns `true` if `&self` has been revoked with this call, `false` if it was revoked
     /// already.
     pub fn revoke(&self) -> bool {
-        // SAFETY: By passing `true` we ask `revoke_internal` to wait for the grace period to
-        // finish.
-        unsafe { self.revoke_internal::<true>() }
+        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+
+        if revoke {
+            // SAFETY: Just an FFI call, there are no further requirements.
+            unsafe { bindings::synchronize_rcu() };
+
+            // SAFETY: `self.data` is valid for writes because of `Self`'s type invariants,
+            // as `self.is_available` is false due to the atomic swap, and `synchronize_rcu`
+            // ensures all prior RCU read-side critical sections have completed.
+            unsafe { drop_in_place(self.data.get()) };
+        }
+        revoke
     }
 }
 
-- 
2.50.0

