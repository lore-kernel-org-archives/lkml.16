Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EA1AB507
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237178; cv=none; b=mP3BIjILQIZnGo3dvonDzkSwBjbiO7QsbGOi6o1TFNTjpNxPUYZ4SfRkniqX44uE7YcSKsAKp0GpK8/ORRxchlBVgjY4q8Q55AH4u+A75ay73i04zcOygaD8Omrq0GEKKhHJzcU1mRh3jAgFFWtWCNrfsDbYS3/+XxqkVljcUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237178; c=relaxed/simple;
	bh=z09MSjwDq3x03OMcWtquxluKiirLlNkUHQZSEoobtnY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BS18IHb/7NgtjDgN+gTaW82N1hLdHyAjoQSGO55USHE+mBtDeBPJLOLn42Svvec0cnfzcGfcn2U1K6f9CwbJoJB2ZKkca2VLlXK7Y0OXMkEMQzXA+6EhNAOsIPpkQPu/5MxHbANnQKxWVY+NW0vWMEXD5EwN3/m3ca6V16uMrNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=344xhj6e; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="344xhj6e"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-385dcadffebso344048f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738237175; x=1738841975; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VGo3EITKDuqzI2mFnnCbN9UqnOTjC364NT023OylZNU=;
        b=344xhj6e5Mo6mvAev8lfxQNmo0w9pervB1v7fQh4PY6tUQJ2U1V0dOVLK8rHahC874
         OdncteT3QoKWAR2rcp8AOZ8TmIBf+r+quMbjCaq5Q/cQnM5xK9o62C4UYQaNGMqh7WeK
         ExX/r2BeJXafzCB6EgdAxCoRxQv6pkgP72SxfdIfKhb+F+2J9xLQbqeLBPRhMBpKqJgu
         sKq0LTI4+KMfcaxejLqUifSy+QQ+DiDjm9/6CLo3Ha09NsbLG6rDPVX3crTneENy2O3a
         cx1qRZTtZzeHRd7onvqPeJlYPomtRcGwhjCaL7kDhUQpwMwXAh4q/hIxxWan9PQuCHR3
         fxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738237175; x=1738841975;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGo3EITKDuqzI2mFnnCbN9UqnOTjC364NT023OylZNU=;
        b=ALkXclbA98b9IE8kJ57KfRrur0hTmfczBbsQ3kL6C1WDMDVs8isHHKyS2LBHtsALb+
         BM81cgPtRA2ycc+/psZfdgYCx6zjAHgCL6NkHY7fzwnAYcijj1na1V3JyWQHv1pHtFWQ
         00aj5GUZZTgz50OR6ucTPK+joaf8pW3dwFpbyNr0ZVkgktuLCk8bdBXcr1Nsbl1Rnbxa
         YHCzXYuX3wdWXiHEvrj3B5AWf+Rb/g68KxJ5q9UFbPTDA+YZ4ZCfO7I94YCoxBPCAfJK
         8FbPC3rk049UCn9MJyUKw+Cs0CxHCJ9NQlw2LG+++pkHyeyW/J3E6Kph/FsNAdk9f85j
         6kAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs9ZjoTLFUjLhtiGSXAD5O6CcS80JLf0fEyVXUxRCFtgHO9fr1mqc1zryGknlGh4N5crjuQCRA+0bXzQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6FSp8q3fewBTwbXwRhRfdTEN9zlP7piJFKHyrbwhc8Exue4u
	dWydwcQRayVaWln9ql9tvnoXrvmJPzRvys+fNxGnMD7A1nn7xO0NedQYJtw15i/YoAe0UPwjC+W
	yZL2NLvI1rHA5rg==
X-Google-Smtp-Source: AGHT+IE+09N8sHthOacR8ESd3Iq7tsbi7sK6xaLeKnkcqKBwgRsPt3aDZ6wYwmhbpcNhsUZL0I+aaVYtnAPvCEQ=
X-Received: from wmfv10.prod.google.com ([2002:a05:600c:15ca:b0:438:d998:de29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1f86:b0:38c:5b62:9fdf with SMTP id ffacd0b85a97d-38c5b62a3b2mr1790393f8f.31.1738237175281;
 Thu, 30 Jan 2025 03:39:35 -0800 (PST)
Date: Thu, 30 Jan 2025 11:39:32 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPNkm2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ2MD3fTSxKIU3fTUEt2c/ORs3ZQUUxNTI3NL4xTLRCWgpoKi1LTMCrC B0bG1tQBaxwGKYAAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=z09MSjwDq3x03OMcWtquxluKiirLlNkUHQZSEoobtnY=;
 b=kA0DAAoBBFi+7ljGOUYByyZiAGebZPSgMXrXPfQrpCYksFqzld5g2EhNym3ceREca4cTa/ZH0
 okCMwQAAQoAHRYhBIOSopRNZAcK8Ui9sgRYvu5YxjlGBQJnm2T0AAoJEARYvu5YxjlGBLMP/iD2
 BNcTkFloH8Yk+EADTrnfKVKs0IU/DKJeBzf7XqjGCdteSPyJ7P/DFvQk3aoFSRTCmHDqUFGr0k1
 4XDpBZdWrfVvHoI2qxE98emsCQ3dy7Qh7w0z4OcWdrAX/xLRbkkvr79jYWFX9U6tW8AZSFcjFOa
 l344x2C2WW+0da7xOzJT/JpCHlP0yUHu/xcWMvKiiXqy0Zh42yIg7iVu/bE0SzMPsnNly4wl5HU
 JNp56+johtodasKFj/5DkY1PsJ5yerD1R+EgBKeA773MfVZ8O3cv/AgkS9E+nfLpXXFmvAATXm9
 saVvARmC8SFFZ13aNfd2Tk4nS+RuzT1m6fF9rmBtzIm1PucX+dH4V/6iUbUxmrqRsaZoYfJHPzb
 AS5p0BPkcvkDLZliYgIcF62gB9NMMoA8LL6rF+IQ7Dgm3Pd1+dFRNGLXsNXBnB1Y65N6VBzR/9f
 v7Vow6KodpzxncXNLkoHbwAbVuwFMOYBVZ4GVxQ42kPwUIdma+XDWlklLncIG/7GN2sUhnTXKAl
 eIROV70oN4F0gK9qZiflCgfMbtjaibE4qapxcEru89kvc2UeQ58qp+JJNv0T64z7BiU9tESrM3q
 KCs2PMXbeC2glVbbXiV873hJVfB00WVah288feAt/BHe5tHlZ9bou9O73z4RTL2pp1jMf69+xFo +YZpu
X-Mailer: b4 0.13.0
Message-ID: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com>
Subject: [PATCH] rust: sync: add accessor for the lock behind a given guard
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Binder has some methods where the caller provides a lock guard, and
Binder needs to be able to assert that the guard is associated with the
right lock. To enable this, add an accessor to obtain a reference to the
underlying lock that you can pass to `ptr::eq`.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/lock.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..681d67275b49 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -169,7 +169,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
 // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
 unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
 
-impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
+impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
+    /// Returns the lock that this guard originates from.
+    pub fn lock(&self) -> &'a Lock<T, B> {
+        self.lock
+    }
+
     pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };

---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250130-guard-get-lock-dd5452793d9a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

