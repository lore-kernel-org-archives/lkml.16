Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169A5234971
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727064; cv=none; b=SV9xHsutbFJraQ70K2E91RAaLyz8uvSw2vDQd8fPlWMV1vwyB8sk6IIiU5FLSikDq3GDt5bKsiAQkQgH/KuITPfS+6+MEEdut+RywaIb3BxAh8bQ6pHs5oCMJ6kr1UjayJq+QuBXKwJZM+JKbc3yf6M28OkrOvjhBd16t2ahw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727064; c=relaxed/simple;
	bh=YQXP9ZTmEnpO/V8Ax1Tfe6HMTJO7Usy68xzxP270YZY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Gl7F2cYx73fhpH5ziQqq/aM2S+q72Z/03kK/H/2kh3DnniQ3nFImofXXlFi/hmLxIizTDNjrj/F/sJwzq3EGCawMhfKeHVDCspkQprH1ePowxZTn48t0Pk6RbhOLwhNEDSgu2UNw/bLTfGpEEO7+pV2dhFz18lmSlSmf2C6Ivew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SUFO41ba; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SUFO41ba"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso496548f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749727061; x=1750331861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WWCjrcd9+LCf2SHBy1SQcJnNDjHYTxYoSHc0kBSop/k=;
        b=SUFO41baVi7JOWfeLBeP/KCCwHrxJG9XK186pRe8dVNnd6QpsoF3aXEf4qOTMQJjcM
         aQ7AslpBdozATTVgKdOUtAPXDGUoxvAbY2u+JJcZ4TZioDj+0xr4+9/DcduR6sqweXBx
         g8JeCKeftyx8x58CsZ2E1cydY94L2k77qa3Sif5hCo8L2CZr+t0mCuIxUtso/sP5rNMb
         PQZjfRkbhE/mz8YVhKa9We+u208XJI9jWQwanfb3q8ORvBVuiTzY5Mz5rivAi2iSQPpL
         PMKHxmtM+8Fl3OCu171mSDFuN4SDM5/OuN2b9rClEHbJCAE0TUMiuJBctT/K1JpdnMCP
         B/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727061; x=1750331861;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWCjrcd9+LCf2SHBy1SQcJnNDjHYTxYoSHc0kBSop/k=;
        b=PVRaibdo1bh173RwoCi4NUt+TLE74XQJ/BpbRVE+kBibK6llwmAu0wBDU1gC0tL5Ua
         aui6NMKy4wS9Fp1PaoCRcBNxrOTOdBT52HBY1NNOP4660DS370tHgSjL3uootGrl1wtl
         7xzJfyCnhUxIoq4tTAh2Acl0FN42CsLbocB++QBtJiBnVCRPSbobkCRY0n3YEMuIMRuw
         fVZAb05mzmI6tH/KLkWBMK1ZgyD8jDBQFTxr7CFxFYpIF4hRh4UdV8p83RP6fLbfeT58
         jm3JK1ahfjaNPNFSZHGK7GyEy3LGy4lFdWZH5UaK/UWo+hju78C4wFT7VWmDbfTFCDyo
         CAzA==
X-Forwarded-Encrypted: i=1; AJvYcCVjed7+SBOkJ9IP0MOEbWVBl6gzywvmEpQaQd4gyyxBML9VOXKBL3P6s6eexykcYRzaEYMAEvp4+MkWzWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfXjUzy65IrfIjbBrhEwf2TlPlVTiOB2/fRV9Danf+FKKzPjn
	xKH8nvLHK1MroTmL7QRn5Cnbfm1pZemMZAxFHzAYcgB4HwWjsOf/jcQAYWwoIjok6K5Dz7vauqz
	09vFQwbqVh0u7HptHMQ==
X-Google-Smtp-Source: AGHT+IEDxKboKPgtyGNZMmesEeLEHvcND2xWZoB+Q5kc7pMP20fHVmKJV/iw4WtUihxxHwIosyiKPPJWRPzAwOw=
X-Received: from wmtf7.prod.google.com ([2002:a05:600c:8b47:b0:451:4d6b:5b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:248a:b0:3a5:2dae:9710 with SMTP id ffacd0b85a97d-3a5586b2143mr5503229f8f.25.1749727061402;
 Thu, 12 Jun 2025 04:17:41 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:17:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE23SmgC/x2MWwqAIBAArxL73YLZk64SfZittVAaKhGEd0/6H
 JiZFwJ5pgBj8YKnmwM7m6EqC9C7shshr5lBCtmKrpKYJafVchBe0aN250k2Yq8HuTS9akVtILe XJ8PP/53mlD7uPtR6ZwAAAA==
X-Change-Id: 20250612-revocable-ptr-comment-7c82b47a503f
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YQXP9ZTmEnpO/V8Ax1Tfe6HMTJO7Usy68xzxP270YZY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoSrdO0RaLtCZ6zWObIkO4UIaAlB1wmNG5P/gT2
 B4wnHaKWmWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaEq3TgAKCRAEWL7uWMY5
 RncHD/9/0qFx/KzjcDNBCLv8rjqQEl0/XqhhaxwRVUvuhD1zD5qC48QhQD6CDKR8LkeumIIOEql
 CauMZqKuZgxVGzEn2yfFvfU0s/Uj0TZMPnAKCsMSc9YRY25s61CyQUHLfSNhqL7rDs2J8FIOUlP
 JDefDSxQSf2Pr+Tf5sh+9txPzGsO+f9387g5E268Q1/+5/6afQitMXOzgim7YKrhgMnfxkD5lWV
 1Qz4dITpWNrvlAYMEjbm1IQkGj6CRaB7rrWN8tErG+B/6R0TcL1/baOln739np13gJz8FVbHub8
 /zXN7Z0nyaQYfeKGgWcSw42JNLhq1bGXuyWkVUl8NCZZuL7SmKImGlmty6Pt3el5rr35ra2sdYq
 jT0uVeRI3UF5zYx38xdjWI2v+qX6DIhjQ96WQm4+qE8JIwd4Kc1E9ZWvaCUHN5Lbc/A5QAMyk57
 /asNVhJi1dMYG40rnwtvT9d1stT9oRovLHZbg+eSIwHCMpWksmO19LppNWjqcw7WWccWAnzLFNH
 tGu2Tqz9qrucPWcR4/joT/1TUQSgOQNo4V6JcOr/XoLqPIIqbvfu4mUJ4NUD0+owajXZUrqL1L7
 GRqEvnmC43gww2sK0dvg0xbF+rpFbeJ9wg0CfROQczG6zZoSvvkZajYpCHKndyc2Pvkzwl6oEeE oq5Nyq6cPbaVmzg==
X-Mailer: b4 0.14.2
Message-ID: <20250612-revocable-ptr-comment-v1-1-db36785877f6@google.com>
Subject: [PATCH] revocable: rust: document why &T is not used in RevocableGuard
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Marcelo Moreira <marcelomoreira1905@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When a reference appears in a function argument, the reference is
assumed to be valid for the entire duration of that function call; this
is called a stack protector [1]. Because of that, custom pointer types
whose destructor may invalidate the pointee (i.e. they are more similar
to Box<T> than &T) cannot internally use a reference, and must instead
use a raw pointer.

This issue is something that is often missed during unsafe review. For
examples, see [2] and [3]. To ensure that people don't try to simplify
RevocableGuard by changing the raw pointer to a reference, add a comment
to that effect.

Link: https://perso.crans.org/vanille/treebor/protectors.html [1]
Link: https://users.rust-lang.org/t/unsafe-code-review-semi-owning-weak-rwlock-t-guard/95706 [2]
Link: https://lore.kernel.org/all/aEqdur4JTFa1V20U@google.com/ [3]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/revocable.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index db4aa46bb1216d18868dcbdcb0b7033a757306b1..5dd7c5a24809ac372cf600b1cf92c455901e42d6 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -221,6 +221,10 @@ fn drop(self: Pin<&mut Self>) {
 ///
 /// The RCU read-side lock is held while the guard is alive.
 pub struct RevocableGuard<'a, T> {
+    // This can't use the `&'a T` type because references that appear in function arguments must
+    // not become dangling during the execution of the function, which can happen if the
+    // `RevocableGuard` is passed as a function argument and then dropped during execution of the
+    // function.
     data_ref: *const T,
     _rcu_guard: rcu::Guard,
     _p: PhantomData<&'a ()>,

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-revocable-ptr-comment-7c82b47a503f

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

