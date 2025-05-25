Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AB1548C
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748212535; cv=none; b=TfLC41lCrm+e65uUqSDxgWLSRBDmGnwhi6ELdx9GKfeMFKUnUD1hLRqmPUUf1EElkJo8PBRs1FbHDHccTUo9TZOwJk3ATyVzO59Pa8SNME+62xdtKDZRC3cL5tlBvkYG5esUQihQK6aUUDs7gKRI6k9zUYH1xEHls+AEZqDazfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748212535; c=relaxed/simple;
	bh=XzNn1hEBUN5DiRQV5cYLq+CWgu7pJ7TVMd7W6yhwJk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZLSBxjSFkoO+oh0e+fCgNu/6xDXEcnlIkaTE4YCYHtNO60HIkr0bU5T4dI72YoNv6WTpVVP+x3v2FfMP7kyFN/nbdTcwiOR7clkUtTQ2bdok4s6fJIscrHaxXkcM+AWb9t5jYInhfPjTEO/mlwQSVZXNVmSgiJBbLFGnuwk+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdS1wMG5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdS1wMG5"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f8b2682d61so26877906d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748212532; x=1748817332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqucush6JMkRyFTK9ShVSfONJsb3INsMZ4/sWv4TM88=;
        b=kdS1wMG57TJwcXWLCsarx/hWXMzZE+8Kcj7qupovTO9HIq28VJtnYjJLkf6qhYU7xt
         iU3p4F2Eyvi18SUTaHhzmmF6mwmF/TeXhwWEm9d0kxZbMCBNV6UbPq1mNOWiApJ23sq/
         6atjLU4gMotXxQqOZA4wHQ/o5WBtNAWkFjGqnO+MTcywZ+KA65TAL9T3iwzrykxZswuc
         Nzdqe/lx9LRV8hTuSsU+uopIc3PsLyJNTjwfylbWHibcaQfF4i6Nswf1c85RUdAUJU3H
         ReBqT/etMUqs+/BjorNUosGSXKA2t4hnuhYhcorsOyV26kavET3+PUNQrUvLaMgyP8SD
         w5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748212532; x=1748817332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqucush6JMkRyFTK9ShVSfONJsb3INsMZ4/sWv4TM88=;
        b=I1t1pBN0BA9rES1xuHNuGJO5QqllFN+xl5LMv0zxTBjYthfAGF+Jvbyh248EiIOyW+
         SOjwi+RGlF/wsbUc3D+I49WLWDYlGCM8iWje6G9vuWh6uSwqPL42/YBmWqf+ce+4mEVT
         h/H60HrjLxlOBoRUh8VOu6P1OoiRcCkHyGx32xXsEUuKcWX3PHbe6h+VEQ3iWD348Mch
         770stO1cDsLES9whFkT7pFPDGHQvqQrSYQQeEeL1aRlZvViJeaE2mJBZPK+esQjpaM4B
         MFQw3/tBpfc2hkwAbLVmycA4P/AtNF0SImx9jQD+km03LxaRajwe/48ShieBnzkY3Td4
         J0cw==
X-Forwarded-Encrypted: i=1; AJvYcCVO9k9CwYxYgS7ObUC1BdO5omuedjBfQoRxIxBveUjEoqqYp+L0X7HHnMx82z751jVoJiBDzCpJOqNqLtI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WRI/iUMC7r4kGbRc0P1FSnJ5Ub/k72UAHHr0hdo0yFvoXMyh
	2adX4meLB2m5quFF6OShAZHCC0pirjUgnGMtKDQ0YKBy2LcQZrFQxxc3
X-Gm-Gg: ASbGnct+00eIoyTpQDShp8K98ocOMc1MYeipteOM2CvxdUTxHu6WzeIFJjwsiswnNLt
	ciWhCp9q8cnLDYxF2iSYVQPcbHMJMsmdlw8sjSS3AZ3IerLdwoJkQTbPnWBeK/iQ4k/QWn4Y8GW
	525m6a75xGWvf/USzU3xmYlmmGF/hsCRezpmMveFA9nAVKxBKfvTiWxtRto0vR9u4TukNvKvNqK
	nxcnMuwxf76jRIeE7TUQSJ6btlABJ8JLgEWONxr5/w4FCwDMwzNfNZdEho0G/BJCBWcWv5vNwpf
	AT3dpd66SU7938JqYA404Tqp0Sbz+bDW1W3MFp+q6sVDuQOBU/WO+mWZJJGUcg==
X-Google-Smtp-Source: AGHT+IGw3+o8sXZoe2+IkX24d6J0CKIxCdnJnWnhowfrpWon0kdkOX+edxTHAzHN++tR07ltxd+lwg==
X-Received: by 2002:a0c:f985:0:b0:6fa:a018:b489 with SMTP id 6a1803df08f44-6faa018b551mr63093456d6.10.1748212532458;
        Sun, 25 May 2025 15:35:32 -0700 (PDT)
Received: from localhost.localdomain ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa18a8a23sm20937976d6.114.2025.05.25.15.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 15:35:32 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Subject: [[PATCH]] rust/list: replace unwrap() with ? in doctest examples
Date: Sun, 25 May 2025 18:34:50 -0400
Message-ID: <20250525223450.13179-1-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace panicking `unwrap()` calls in the `kernel::list` doctests with `ok_or(EINVAL)?` so they return a proper `Error` instead of panicking.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Link: https://github.com/Rust-for-Linux/linux/issues/1164
Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
 rust/kernel/list.rs | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c391c30b80f8..fe58a3920e70 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -82,9 +82,9 @@
 /// // [15, 10, 30]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -93,9 +93,9 @@
 ///
 /// // Pop the items from the list using `pop_back()` and verify the content.
 /// {
-///     assert_eq!(list.pop_back().unwrap().value, 30);
-///     assert_eq!(list.pop_back().unwrap().value, 10);
-///     assert_eq!(list.pop_back().unwrap().value, 15);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 15);
 /// }
 ///
 /// // Insert 3 elements using `push_front()`.
@@ -107,9 +107,9 @@
 /// // [30, 10, 15]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 30);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -118,8 +118,8 @@
 ///
 /// // Pop the items from the list using `pop_front()` and verify the content.
 /// {
-///     assert_eq!(list.pop_front().unwrap().value, 30);
-///     assert_eq!(list.pop_front().unwrap().value, 10);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 10);
 /// }
 ///
 /// // Push `list2` to `list` through `push_all_back()`.
@@ -135,9 +135,9 @@
 ///     // list: [15, 25, 35]
 ///     // list2: []
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 25);
-///     assert_eq!(iter.next().unwrap().value, 35);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 25);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 35);
 ///     assert!(iter.next().is_none());
 ///     assert!(list2.is_empty());
 /// }
@@ -809,11 +809,11 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 /// merge_sorted(&mut list, list2);
 ///
 /// let mut items = list.into_iter();
-/// assert_eq!(items.next().unwrap().value, 10);
-/// assert_eq!(items.next().unwrap().value, 11);
-/// assert_eq!(items.next().unwrap().value, 12);
-/// assert_eq!(items.next().unwrap().value, 13);
-/// assert_eq!(items.next().unwrap().value, 14);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 10);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 11);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 12);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 13);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 14);
 /// assert!(items.next().is_none());
 /// # Result::<(), Error>::Ok(())
 /// ```
-- 
2.49.0

