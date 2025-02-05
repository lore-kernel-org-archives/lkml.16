Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45322CBFD
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752908; cv=none; b=dwdHZBjlkw6luibI0b74PIpv703wNQIwJSPy/K1g/2kOgnYmd3IBburoRX1I1MN2/RzLsBgJCHKKGvfo81hheFk5qgOhyvrQ+iJFj0JFy+Tr86InUz1x0PklDMOfMDAZsycc67Iqf7XxAS69f3LevG8AWrtsySUPTLahe3Vu+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752908; c=relaxed/simple;
	bh=BZm2IS/W1WzLbPH+phN8UxkYytY59JQo4Ey5AS8U9ao=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MLncwxW1xDkq0Ieo0RAtjSMgYEFSQ+mHmdFug/JQ8pBNtatWt1WgK7ErlWOit8a3Upz9blF+9/T8VbnAVm0jAq1cj9X7Q456JZgaHwjl5IXLjHd7VWvHMpkhOwn89LSEljPYk+rrudZH5uON7q8TBQG70pGFgFwiHyVk+XxMj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4tsopsCl; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4tsopsCl"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38c24cd6823so379256f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738752905; x=1739357705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ds1OfIeG/KwY5NmWbjkV2ZetwjxNWccG3MAdn8QvKs=;
        b=4tsopsClUcM7H8tGAS4m6FIXwb60QSl6OtXRIICS54zpJQwOCvsbbRe5jyxrxkPbCM
         Migc0ErUg/eqW+zUvH5cIqA0i+M9nHXYok4SYio9b0J+OQT7qVWX7G4nDJS/rihv2pFl
         nrJoJWOL/oSiHdmqGj3sk93VK9ylNDe2qYl2p8gn7D9GzpJTVX98mqvA1sdAUhVwerxj
         VQMwnzFP4xpXP59Sxd6UW9VbgpS53j7OezigESBB+NSo0iF6H03YGRj5v5BT23XZI7dj
         P7L4WU15kmv3D4VPiJsENoaUpOVJTHkO99xjYoyofYq0AqfGPoXsXz2XYxZS/ivHTS5S
         ZpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752905; x=1739357705;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ds1OfIeG/KwY5NmWbjkV2ZetwjxNWccG3MAdn8QvKs=;
        b=HjBzP3R1IITut8vFQ2zlGsKq4L16aMqxlot8SBIGBjmFzq/eAeAcwZf3hn08fdAgft
         NwZ0bzPz2fKu9d5NvCkXwMbi8Hq8ohaoS1Ff6koLGacdUZEGni0yrlLjN5n4bs9MqmiX
         Q4khxxmYwW+nxeotfX9AYhPU/Kx3BD6F3rq7imEkISPfPd7RFr323rX//CMV8Lz3WN6K
         l8pSbQQwh8QSj/a4PGXwxwvtE3hdZcWquGxZfgBxHfCH1izTxvFnytGyvjGK/LT9cZ8c
         PQbPqrXQZww/3m/NiKASrzT0LbOM8poBSj18j0s/P7kZYtrmwyFdsQJ7CyvNtLWrteq/
         ToFg==
X-Forwarded-Encrypted: i=1; AJvYcCVUqEgm1SYELuF+e+JEwWr87ZsPnWHmqfwHJ5rljHxEKZqv9PhGJvhQm72vfP1jlsqmymwk+9zukBHLOhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxC5kiRorgrB98Th04oySwL2//S6Mc2stS8bL5C+DLlwogk/c
	hfxQzMYDrQ+agQbF/1b7KT4y2QYq+FY0chGllqYjPKTU8DhPZnamUiv75bFD0L2DTELqdMwp+yp
	8w3hO/RgatEdbdw==
X-Google-Smtp-Source: AGHT+IE+fB8un9XlOAGKAQL7NqhSL6ObjBc+7puLlZZYBPT6x1hQo+imJp5ugrJknFdznqxFB8cc2Iw1lyfK2Dw=
X-Received: from wrnc12.prod.google.com ([2002:adf:e74c:0:b0:386:32a2:cdda])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6da3:0:b0:38b:ee9f:52d5 with SMTP id ffacd0b85a97d-38db467a302mr1709339f8f.16.1738752905272;
 Wed, 05 Feb 2025 02:55:05 -0800 (PST)
Date: Wed, 05 Feb 2025 10:54:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHlDo2cC/3XMQQ7CIBCF4as0s3YMUEnBlfcwXRAYKbEWA5VoG
 u4udu/yf8n7NsiUAmU4dxskKiGHuLQQhw7sZBZPGFxrEExIxnuG/mWSQ08rztHe0Tl5kmLQvdM G2umZ6BbeO3gdW08hrzF9dr/w3/qXKhw5KnJqUFprwczFx+hnOtr4gLHW+gWLLiU/rQAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BZm2IS/W1WzLbPH+phN8UxkYytY59JQo4Ey5AS8U9ao=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBno0N7KchbENarEyLd3ssWUCRvml3uwoqRmaRQ4
 r1hL4DLOtGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6NDewAKCRAEWL7uWMY5
 RueBD/4+nPFPVg2s2G1N6WwiAq4eWMgbG1Ns/3c88MrO8QcVmYjkh9pXszUfpFXy+2YFDZtMYoR
 VWA+mPO0UfYPtJ8xsAoHQzE92xUwowklIxL3TmLXCTT1EVa6s715I+8xP4hzT/XUjxPjxIhYu0A
 lhK8Tj4nh4RxCxUVNGfAwNRmg2fHzBItNOr+33h+Uz/8eqqX1ydt2A71E+GWKd3zwyV7nNV0AXP
 ARi4mtHEpKmSF7vlRNOaiTavSc8HTWRAf7EQPk5wHZ12UclFC5/3ICGijbHbvBB1QBdlkeVPI6e
 yX6PSu9777OrIZUbfAAA7GHPwma7SbKDnuTY0Lfc2ZCKCl5liS+49daWEKYp2GFLSh6SaX/b/2p
 HuXyZvcY5tOkxVk1PAO5CLJUoOpyD+vwGZt2m4AuDUpvc53ZavBhI2s6T9OemB7fLvfbiscTv1K
 UXzQZllj90T5yNGr//RJH8KRhbjIihDDChSjSi/Uug3oGDOmtqsDq96umLDynUj98DnAXFZWPBj
 rJx+W8iWCxwmd5bdGNMkkSmJzWg6OqZQC8AluOkTZXqRsv+YPWVaJ+WwZkEOZaYPTryX/HyF40s
 t6laGCM4s7QqLisyCzeObSDcgbk3k1DFvafGy1qMaMi/gtZIzKCntKLR5xrXJvDpHNmhCKrPMKP RPlsIRaYqMu4/nw==
X-Mailer: b4 0.13.0
Message-ID: <20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com>
Subject: [PATCH v2] rust: sync: add accessor for the lock behind a given guard
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
Changes in v2:
- Rename to lock_ref() to avoid confusion with lock().
- Rebase on v6.14-rc1.
- Link to v1: https://lore.kernel.org/r/20250130-guard-get-lock-v1-1-8ed87899920a@google.com
---
 rust/kernel/sync/lock.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index eb80048e0110..8e7e6d5f61e4 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -199,7 +199,12 @@ pub struct Guard<'a, T: ?Sized, B: Backend> {
 // SAFETY: `Guard` is sync when the data protected by the lock is also sync.
 unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
 
-impl<T: ?Sized, B: Backend> Guard<'_, T, B> {
+impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
+    /// Returns the lock that this guard originates from.
+    pub fn lock_ref(&self) -> &'a Lock<T, B> {
+        self.lock
+    }
+
     pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250130-guard-get-lock-dd5452793d9a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

