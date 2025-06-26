Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A426A2ECD3E;
	Thu, 26 Jun 2025 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957187; cv=none; b=sczz4REtwekSrvOAu77unL3SFiHTVHqL+KTQQ1RZU5hRmySYa3/WH8fyqs5YnoNSP3LAOZzEZ2/A1QSz7ALnaLrelpi/NAq6RKZsZBDmbY2Qn41ZYZrlpNzTSumRwucKRFxKASJKgeZa2loHHrccVB/2btWPXkgeM30U9E9TX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957187; c=relaxed/simple;
	bh=woQ7Ps6zyvRtD+WlXLhl9749tSlqBMx5iIjummqWtGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYinjoGZlu+Qb9tY2wvf/wHlkQvk7e8Ldo0bIYhgrxREBVy3juQOx4u0AZpvHiyiU4MQw1qp6yFAeXoqUUnOZ4aW4f3aIfR2dEf8b/6rqxAnFQHW+uXeblS1TILfWnVDP66Yfrl+i3jyeYRW0dGg2+99EZJjTYKxVnG72l/VsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU0myxNS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU0myxNS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23508d30142so19783965ad.0;
        Thu, 26 Jun 2025 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957185; x=1751561985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MqwhnBeaC4XpPLUvW23OFmerSzldciI6gEbfm50iZM=;
        b=DU0myxNSCINfx2KHmFKj7V8FG5IIsMsysgbN3K/838LAORudHEW7gs7/DIgIxEkrhN
         pzX7LZeOjMja24mv0zXqfV7byvm5b0FlBFUw2LfLc5fq7PtmWWFQUoWrd/1HlM7qhzPK
         WSbWjuIdJa3FPXa70rdCcgNAZfdrmyrjWs5smfvxsGDuaE/IjxPLhdMR+DRIzWBCBPWX
         TJPgwu1s8uMdY4AHen6LYTZIY7tS3BTqFoWvLfVeyHZh94OllYiuBlZaTJQFNZj7WbG5
         4xzgGPNCf5hl2G0dwdiYjPcjoxsGh4xxnXVFvcCMzgtVrHBSC/WbC61UDdS9C6Gry7qw
         X3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957185; x=1751561985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MqwhnBeaC4XpPLUvW23OFmerSzldciI6gEbfm50iZM=;
        b=GiV/ODCo1RRzKmSbmBmZ9CgdYjsRoj7CX1F8bkTAItFyhdc3gnTNghaIN++FvyGFmL
         /wFCir0MNllIlpiQJXbbSgfi0TTOOeEYnB06Svl3MX+mFYcC5B+YAmzc7My15WQHcwht
         LURaUs+fQEkjFvtqZ1dzmgtfXqm+dOGvY/ihaCAMhYN+9YrWgeqBCDhXaSAmAFfOkNPc
         h27Xo686n9bBKOs1l5zFb1kwJCdCtOL5w4xPG8sY5cvPaqFjB0dEQQ8Eh+s2tZ1/hUYm
         qvvycQqkwUBN5CkDWJXHm3CCBBhZPvdqj4QUq+YfGdVlrbFQo08U9+9kaCqfYTgZP6K6
         qTUw==
X-Gm-Message-State: AOJu0YwV2iDEM34A4UYnQU7PcUvTCztIp9CrimtB4N4eDOeLhVLx87Dk
	I8zwOsi2PbKrQkN2N45GYLpBdty7X7k0ZXSCEXOYVU35KdAcnZhZJUYnfimeNEMF
X-Gm-Gg: ASbGncv6n+nkyR80ZAPMjhddyaNtA9pF478Himhotu4KqsJznztMFIwrNNdgVdztFba
	1q2nc5p4nJ47vWxmzCOX+Hy0SWKfvCUR2i8kYF3V7l44lxHRJ5s97AgyU9Ja5+X3gX5lV3qhKQR
	n2Wnt2od2DbqV0khFrkbbOwPhuirAhhAl1JKk/toDM7O6aMj0R86WxIuh/dQS+YllzG6/voZIcG
	CjHCM0iDSDdBMOwclvB//+FWrKfFKkHTlCKBDO/vclYQoMZvaQ44Nh8M9vyXcDtb5f/KUlIK0Ey
	RudNL0i+DZiEVrnHZ3+Yn72SxpdGWdNPl3lD6tIS85CQmu4U
X-Google-Smtp-Source: AGHT+IHx8R2JoJQnCwEUerphA5k8Y45YgrDDxrho1BCyWHdxn0mxwmrAutPMVaNzv7a2UBc5e1GwIQ==
X-Received: by 2002:a17:903:18c:b0:235:ca87:37ae with SMTP id d9443c01a7336-23ac4637152mr742295ad.41.1750957184779;
        Thu, 26 Jun 2025 09:59:44 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:44 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 2/2] rust: revocable: Clarify write invariant and update safety comments
Date: Thu, 26 Jun 2025 13:59:27 -0300
Message-ID: <20250626165927.66498-3-marcelomoreira1905@gmail.com>
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

Clarifies the write invariant of the `Revocabl` type and
updates associated `SAFETY` comments. The write invariant now precisely
states that `data` is valid for writes after `is_available` transitions
from true to false, provided no thread holding an RCU read-side lock
(acquired before the change) still has access to `data`.

The `SAFETY` comment in `try_access_with_guard` is updated to reflect
this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
comment is refined to clearly state the guarantees provided by the `&mut Self`
context regarding exclusive access and `data`'s validity for dropping.

Reported-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1160
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 rust/kernel/revocable.rs | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index f10ce5c1ed77..88976c62e1ef 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -61,6 +61,15 @@
 /// v.revoke();
 /// assert_eq!(add_two(&v), None);
 /// ```
+///
+/// # Invariants
+///
+/// - `data` is valid for reads in two cases:
+///   - while `is_available` is true, or
+///   - while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.
+/// - `data` is valid for writes when `is_available` was atomically changed from `true` to `false`
+///   and no thread that has access to `data` is holding an RCU read-side lock that was acquired prior to
+///   the change in `is_available`.
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
     is_available: AtomicBool,
@@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
         if self.is_available.load(Ordering::Relaxed) {
-            // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
-            // valid because the RCU read side lock prevents it from being dropped.
+            // SAFETY: `self.data` is valid for reads because of `Self`'s type invariants,
+            // as `self.is_available` is true and `_guard` holds the RCU read-side lock.
             Some(unsafe { &*self.data.get() })
         } else {
             None
@@ -208,9 +217,10 @@ fn drop(self: Pin<&mut Self>) {
         // SAFETY: We are not moving out of `p`, only dropping in place
         let p = unsafe { self.get_unchecked_mut() };
         if *p.is_available.get_mut() {
-            // SAFETY: We know `self.data` is valid because no other CPU has changed
-            // `is_available` to `false` yet, and no other CPU can do it anymore because this CPU
-            // holds the only reference (mutable) to `self` now.
+            // SAFETY:
+            // - `self.data` is valid for writes because of `Self`'s type invariants:
+            //   `&mut Self` guarantees exclusive access, so no other thread can concurrently access `data`.
+            // - this function is a drop function, thus this code is at most executed once.
             unsafe { drop_in_place(p.data.get()) };
         }
     }
-- 
2.50.0

