Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4881E0B66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940527; cv=none; b=qCu7LKeKpWvINBFCJvfESVSDfaSrHCSO05dyYbb/dzrzq3Jey/cWZvKzNZDwiN+PjaOpQ4MIDkE8VBNWsF4AkFFhpmSvBHPtWFa5LCpm7qfKhVA04Cf+K0PGka7CR6TtV84tCHZOjv4a2r9DjYN/OFiPaHdizEGPi8dvn5ypQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940527; c=relaxed/simple;
	bh=iKnr6e8N56z9qXm9fEUldRgB1x8EQ77GX5xNtNprJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7cgTk5wsJ9jLvBf8uO4D+scaCRklsLpuJTabISRHvla3fk2hTbVZF32IJcg17L2arV/sbOrpJ5VcozvreGPpxUSx4c3cqzP8ybGmcXtSd0fi6BPNVlXO/Z/x2TF9WbgQ9zKGdjV2fi0sGKegiu20XfZ0pDSIxaGA2KC3jh/U1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=nnou6hUo; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="nnou6hUo"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ff4faf858cso10256027b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940524; x=1745545324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQWNy7W2o4yDQUOqT2/+qBcYzZtm3FQaQ3Z5pYP4aMw=;
        b=nnou6hUo0BzPOEUjTPP2e19bu3/uqAoX/73GSHa6FiBnvEGQH8gx5Px9Po/ZEhwo0S
         g9tdy/o1xHoR10RexTkKSpZqki2gWdZyqmltMhk/zBSBgPKqYFw1uXOlCrW/mDX1fa7k
         gucW/NyJvWyoU8JV5FBNQpnzjhVN4bciA40bWP8aRpCr/At8SV+7tL4AlBVQgs4Q+lKD
         3y19Gm+9VKvelms8ltHtt/yPNr0jOQDVk70jmD6NLouKpyp9phPiqQ8jMLg9FiOcuKpN
         vBype8p8r9Eeb4AeI9H42j4OW/5uPAaP5hqPrpgFqSUlfDMJ3lhSNU/2uui8Yak1BRMT
         4AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940524; x=1745545324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQWNy7W2o4yDQUOqT2/+qBcYzZtm3FQaQ3Z5pYP4aMw=;
        b=deXvGAG08CjL1/VFs0UplJ5bm8XMLKtzrfiJISi38T7H55I3zLDVMVhlHvru+XeX4a
         oxaYFRDuqUba2+OLLGdwE5ggVv0Y6aAVT5kcti+MSNvE+bRb1saZQH92CbpSTkxtLiup
         728lgUQOYoMkPB49ILUDcZr00hZWQkTCFcNV64VDuw9PXSqmJ8UgVp7T316TWCW+xT8L
         kp1vKR3kKd4wKhuRZN/ZhqtV3maKWDwqncVSrEUOpj27AHsUqacgGBuD/B3bKqFXLx6x
         +9uLF5h8zd6AxBoaCmA//IsguVohX1s5lI4iwNpnHmwHJx6KLpim2JFck+Q2UuVWJu7A
         /AUA==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZM8SM/yv8MKdeRW+3qNDwyTMCK7sjm/QaJibFrz7xty/mTfDQndVSKjjC2om19nqGWNt/L6WAydjUFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmBqyvRGN8MGeaVMHC9GlmK+tzTV+esh/IIBJG0+oNQ/dKFxu
	V2ITMxQH5NdqDt4PnCVZ/xF0z2HlqqXi7s0N6CXiBJLnIXLRTSxt92Gdtoa6CJo=
X-Gm-Gg: ASbGncsZudxn3W09ume6Z6ZyRNHpUXzkiMxqY4KGR6uVMv2emIrYOZqQtfKfhZQLB4S
	Qd+Gq5lXkb+0EA6kKWJnrRneasjM+GXfY4LSQHLhgb5MWIgvodgan1ik7INyrsA6/IB1pLyQIHA
	CzYPTpa/VYpjEPWBAhoIS9FQ3cglyzFqs++PsO4r76NKCqcZT4rdgoWcWPpN6Qr9rS9EZkWN7Jh
	3MzE5jSxFuyh8T+GHTbE3l/TTejiJF1FFsRIwBImnwsPwVIRLvdzuR9mf9ddxX3zA9sLlPITdcJ
	/04F1P96k6qRiH5/V1nHcdTBEc+eX3n8bYBik9tlQoKANYqOOWT5RjgBrLTWW7y4lk9J6u4ZfRe
	yKFUrCLly+qflomi82KLpLuxqFTFKSyDfMZIh1SNW6/tuxwc=
X-Google-Smtp-Source: AGHT+IF9KFMNEu6jpa97QayMti4TKcnPXsAq4MGAEYM4wdITHEEiEhaIFY7qZGhVB1Nqbo+5GqNr4Q==
X-Received: by 2002:a05:690c:d07:b0:6f9:447d:d1a2 with SMTP id 00721157ae682-706ccdc6e66mr14828297b3.29.1744940524334;
        Thu, 17 Apr 2025 18:42:04 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:03 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/18] rust: task: remove use of `addr_of!` macro
Date: Thu, 17 Apr 2025 21:41:24 -0400
Message-ID: <20250418014143.888022-4-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of `addr_of!` here is unnecessary since its immediately
dereferenced. The main benefit of `addr_of!` is to avoid intermediate
field loads without immediate dereferencing, so there's no benefit in
using it here.

We can achieve the same behavior by directly accessing the
`group_leader` and `pid` fields, which is more idiomatic.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/task.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 9e6f6854948d..554b42c609af 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -259,7 +259,7 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
     pub fn group_leader(&self) -> &Task {
         // SAFETY: The group leader of a task never changes after initialization, so reading this
         // field is not a data race.
-        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
+        let ptr = unsafe { (*self.as_ptr()).group_leader };
 
         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
         // and given that a task has a reference to its group leader, we know it must be valid for
@@ -271,7 +271,7 @@ pub fn group_leader(&self) -> &Task {
     pub fn pid(&self) -> Pid {
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
         // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        unsafe { (*self.as_ptr()).pid }
     }
 
     /// Returns the UID of the given task.
-- 
2.48.1

