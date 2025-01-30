Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C241AF0C0
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236127; cv=none; b=kACXJFhhw/XtiVUgeSkOAzI16J4K4bu2JMlb6KKWJnooc5R6eSaCHoYm+bLbHh5lI88vxxbPp4HP/ihBUU6OXzkcdlwgrAL9W/HTZ9ULxePCWY5E6umeNhWMTyjcR2ru+Gget/k7tZaQJHXKjqjhkufL7FXDG1uNnXPDqXsQ4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236127; c=relaxed/simple;
	bh=epUow/8fiF8aQw32z3h6jYnc2pjrKb3zCez9kDj6Oqk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z5W7wYf8KGMiRQ4RPkpc40zIJipPJ9VZ0e7pWfgSUSczFn9s2Ey2+6tecTg5MgT7zt2bfUUQ9h+vCnRRkINUaeK5Q6AQuYSs5fCZbeCBoHpqmWbaLWL8+BNCcgX3Sj9zZJgyWMvfD2h2NtHEoEtk/P2oRWV9ljrl6g3+4gzmii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znWIWFuA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znWIWFuA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361fc2b2d6so3106065e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738236124; x=1738840924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGOvFtwymdsmR57ATsFyVOgokrgCsziDzPAGb6ER9lw=;
        b=znWIWFuAWqrUdEY7QJ3p+CxBhsIH+Gjjl2uCM1W9DCtZZmRvnJnn0BRGlVoAWN793D
         nSO+I3PcBwqJOc0DAUZLDoVczN5J3Jv6la8C81tV5QRh7rYxn/OwcA7j3j4jtsJeH9bw
         Mtapy3DHs77EwE+GOBwNex0/z5qVMUBdL2YOBMY5JeQjWlgcQt7mXZ/00lFiaYIb7zD6
         eVWUqKwgX/60o4DglJBvRURgsSoTwOY8MkkYY/jQD+7jj3z6uVhd3dckv60MfXmatFFy
         og/Nw8GuPMnqgEVFMrHovFZmQ6EwajEzt4SC5GG6nwpj9V1OUeLdWM24k0WO9z52qfx9
         PKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738236124; x=1738840924;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGOvFtwymdsmR57ATsFyVOgokrgCsziDzPAGb6ER9lw=;
        b=DMPhG/7hna4i0+dffe1ODN0LW+We+loaebJ5QEiBmQSlyveKfkpGCgE8gyezwYHVp4
         UZcReV/pUjUWbcorEoajuK+tJrsYNnau6IJkaVZXwX7fBBAlUPmfKh0rUTEt9LnjzxVN
         bQHQtFL4WMBDGj5+z1kNuD5B98wxO4bWLRi0tir940+Uc050JLNb9OanojE0yiWhFbwe
         F8Gpt03GFGye9hpIOFIMrbzx6WNCxzmhonDSgVNTbbXEpwl7qB/VsLfNxukzDAuaCmy7
         GFk2m92Ly4IkSa6lione8jMuEDrldFy+Da7sAWFL1VUoYUg9N0QA5OdXPuth3WYGQPoa
         qBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZVaMwiRRW2jKd8f//htloBqc5RmUiaa6D2hIm7/LcUMHCyNmSEPMbyZtYEZxGXVXSHLnHKdrFUfc09nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQICyWOMKo6FceRfMzxuDiH7Mt0jpzM9vXX3SOLP7UU7UXjOD
	sV+Cq429PKl4G/a9Nzz2DWr83PvgFT5r/0QrgtHcmvCFRnY++s+MYnhPOUfcrxPfJi/JSYklEYv
	EjtBl7hbqNkUyqA==
X-Google-Smtp-Source: AGHT+IFUthAf8+npb3AG8+vvgocshmycFlnj9gA8C5XQPmZ3HHl4BiIWHpo/V5jjjn1JmoswwDfNEibCAEKolD8=
X-Received: from wmbeb18.prod.google.com ([2002:a05:600c:6792:b0:436:164a:763e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d3:b0:438:d9f1:f5cc with SMTP id 5b1f17b1804b1-438dc3c3983mr61615825e9.8.1738236124203;
 Thu, 30 Jan 2025 03:22:04 -0800 (PST)
Date: Thu, 30 Jan 2025 11:21:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMFgm2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ2MD3ZLE4mzdgswU3YLSJF0TCxMTU4vE1GRDyyQloJaCotS0zAqwcdG xtbUAC+mXKl4AAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=epUow/8fiF8aQw32z3h6jYnc2pjrKb3zCez9kDj6Oqk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnm2DKLcFuH+5SHyGUg1iA3pVvcUGVgAAEGWNBk
 YVN4FL1+eiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5tgygAKCRAEWL7uWMY5
 Rvf/EACdDy+Ofw26/VT3qBaPpqO0vQQz9Elxo9UTzZO+hEtGHqr9Ph/51piZA5KF7BOWydEHjam
 3rC1vFOLiO9AifVRblm219s+yZxLmxQuAOhcKZ2+4p+wqkpyHzGTxvl9Wlz0o6RLu01okf9bXOZ
 KCGVtY8qqUgkxjiXFyyqPF9AIH995db2xPVg+p3H6OOlRslpv2sV1nSRhXmHxIiRUKWuNAUeUgb
 qgXrrBYDYHtldsQ3gL2uSsPZTWaGublbzdV/U/alMbYBt5CQrEvo1QAmeG0mHMUgyMBUs3/F2QA
 M1pOPiMV68PW4xTJibEgJeCq/nmTOX2KvWD0rTwEuA7JzKeb4iZWKs2mjPNuAYCPq3LuUjLHWsV
 Mzc+aYp1f6aPsaP9Fs7ddpO2sbWIdRAyCKPMqJv3dkJEhMFzCKUC/30jH9D5te/MvxwhIsUgjwS
 8GdZSeQm/tiZyfu/QoLfdKBgdGDqyBW+5XTtNK0qIM3UWI6Po8poDokiTsR1fkzN9tjocvZ7JH6
 VWrUl+mX21nVvcLr3mkEAfa8xz/5AaVVbldRocr+ctWevs33lAwnGfEYEhVhXvzJTLHnrcwUBg0
 A+6eeUeQdywJmSEPr5tN7xwqlPzDsus77WKRKmgbOPmSG+GGKPHAQYqzMRG7f6rE7elKIVoHYMT zQEZEfDb4707bcw==
X-Mailer: b4 0.13.0
Message-ID: <20250130-task-pid-pub-v1-1-508808bcfcdc@google.com>
Subject: [PATCH] rust: task: make Pid type alias public
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The Pid type alias represents the integer type used for pids in the
kernel. It's the Rust equivalent to pid_t, and there are various methods
on Task that use Pid as the return type.

Binder needs to use Pid as the type for function arguments and struct
fields in many places. Thus, make the type public so that Binder can
access it.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/task.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 07bc22a7645c..49012e711942 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -106,7 +106,7 @@ unsafe impl Send for Task {}
 unsafe impl Sync for Task {}
 
 /// The type of process identifiers (PIDs).
-type Pid = bindings::pid_t;
+pub type Pid = bindings::pid_t;
 
 /// The type of user identifiers (UIDs).
 #[derive(Copy, Clone)]

---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250130-task-pid-pub-484458aec19b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

