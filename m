Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F21C5F1F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181251; cv=none; b=CoHYQgdT+49uGhj4X2fWnArVp1Z6a3psZ9zeS/HP90oLEXnIkJI5pbvLCZhF4s9Fb2FP4BNGkLqW9mFIx5gYQVfvRejqZVgoNMuFHWjbH+XguAhayu/wmUl379aA/EP5LJo7i4F6VbvR+Qb87Qoq5YBwGgHb/PS1wOK3LY42t10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181251; c=relaxed/simple;
	bh=vG2X7WQ1PmdCI49j2NntyvNCqCTUVdb+cy7Y9jnw+Uk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LqaNN2h/kaj7iRzHt2xz/rOnmG2cN5UsV+zFbMk6mm5qYYSlnHse2BcMQEEH9j05D+081j1Rj6hFtu+LXrXkiYov36n1Vu6QAfPIqg/Ek+oW08yeqq1sjOQhSeKwOjYHAvpmpDHh/RQuHOk0XB8wHuyA1ph5m0ai3xYVmI4lPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cyoqeQ0V; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cyoqeQ0V"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso23404495e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739181248; x=1739786048; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ykRajRl/U0/1GL/W7BEJiYejIirOoQDvtZ2CM/CA7WA=;
        b=cyoqeQ0VWqsqP3kYlNKs1vBT3Ch6xRiW5+o0x7HYRSOedJnqlYof22ZHVOhxPY4T6E
         lOjVulNqhUo7yM7ooK6D9YavnUjIJo7SGfSqfF8t7VQE+79/iJKT14kJi0B1gs2JdaN7
         Q8xGLG+mjvw7xaeuWB9ixaH0lCxrAQiAYG9gmCdpzCXTUMxqGI9rb/fIvn6YjxipPb6i
         UHlbewVpn0iBcPFCXDj+Ivf2Qw1wW7mjKsfzdxPdnX4maUYYaSHEVeQKT+IBKbcw1ANa
         JuNiL8l/+qy287NDbBuvpddrFWicb5baSOvr54bWVCdbtKyPrE4FNZzuuGjpLePU3tyH
         GLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181248; x=1739786048;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykRajRl/U0/1GL/W7BEJiYejIirOoQDvtZ2CM/CA7WA=;
        b=Jl0BT0erw8jEHfHNbVdfqRUD2HPUQZTaIXZ82KY+hV7vRX9XtCaZ0NEOBCHRMn4G3T
         e++Hou3a7bNOJxn9Fc8L7FvYQc7FF9lqVI8iZ8NYCuFmgw3XWC/LW8kloOgR7M35/l58
         UhWAE22CO8skYho65NRDzcYiFG32G+UVRPwhl1A7TaTYd/oO0VuGl1NLeHhwNRq6yMiX
         KLUHEtKhtQ5Tye6SFQfoMVxp5/a4T26wUdMyr0eBZQlffFXmyX7QM11eKy9abHgaKgws
         8cluzVxSuHkAQGvnCt8VP7UV5saZg+466+DoJ0b9tFzPolKJhixBbhmdIktM/hZ0SjSH
         Gszw==
X-Forwarded-Encrypted: i=1; AJvYcCVbVhEPMEgKfux9FWbt/gD3hZ7PsxM0wPD7L7h+v27DftsNzBVWD5DRKlbk0asagAVDMJo3W3WQLdeJlGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJY96HOneLRwzPQ2pJ7Q130AE7CU9MzMMf5eD5r20/5DTQ9eh
	pOmm+xmNK28N5RAkVtqQHNbDNis2MgC742PrPHM4NynFIt2M9rXo3UoCbaAPpk9BJYmd/ujVdjS
	9UmnJFvJaijxsXA==
X-Google-Smtp-Source: AGHT+IGT6KM3+kyRLnTGSDnKD5bOiNnLtiDQpZuRgxQCtGc65seThnsmyKfSiSyioYB2yVs8vJ5Gaz66pehxzro=
X-Received: from wmbfl7.prod.google.com ([2002:a05:600c:b87:b0:439:35bc:65d0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-439249b04f8mr96245635e9.20.1739181248337;
 Mon, 10 Feb 2025 01:54:08 -0800 (PST)
Date: Mon, 10 Feb 2025 09:53:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ7MqWcC/2XPy07DMBCF4VepvMbIY48vYcV7VCx8maSWIEZOS
 UFV3h23Aing5Rnp+6W5soVqpoU9Ha6s0pqXXOY27MOBxZOfJ+I5tc2kkAgCDI8fdSmVBzpfiGY
 OGgMlpweSljX0XmnMn/fg8aXtU17OpX7d+yvcrj8pqf+nVuDAhRtAWUDvST9PpUyv9BjLG7u1V
 vnrtQAJnZdccAgSY1LWGnCdV3svO6+a996PITk/AqbO496rzmPzMQhjBpfCgLHzeu9t53Xzo43 KuSiVQdl5s/Oq/980b4QKKdqEiMMfv23bN9YyRLPtAQAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vG2X7WQ1PmdCI49j2NntyvNCqCTUVdb+cy7Y9jnw+Uk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnqcyhmS2LlPCnIdMrkc44GlUdlj/Aqj0zg5CYg
 4B6Ieye4yKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6nMoQAKCRAEWL7uWMY5
 Rn0dD/0YP2wlyOms8eDPAE9U/lo/KEk+S4sMDhsJbC/4eGMEV9hBazUpZNo9GHH88kxI3IWFJ+n
 T4uXJEUhfBmaFPYWzx2585VBNJoeWRS4mnnbvgSmN7RgAlcj8+3mH+VTbDW3oKxKVuTpMNXpDbP
 moM8zmDzx1dZx7S+4GokSAPOcmEOpJ4mUzWv/a/aKOL8aYApuWTV2tteO8NMu2w6TJA1YXzLnhZ
 hvLsEHFHJ6gdigh3PTRYkIWDpwZuDSWPE6BOetWKGLBFwNwAKcWPr0+TEo/ztiMc7Fbb5Nu+SeJ
 YnaQBf1MbTsZrlvI7xa3kE/h9ExJQCh7XxXmtQO4rwYrCxh2IyQUTBScm4SubWHv+vt2UhimHBR
 o+e5OvLI4PMA/FtJHlw2/Y+yhYjHgscyBYu22h5+Dff3C4f/ULqyehdsUtoRH5qij5dffIfLJ3w
 B6XxRUwSS48yXMfq8f/pYCnSe6DzQBuNXbKuz4K/DkRDyn9fu3l+sG9TIvbSKmxOSf04ZdWMn4i
 Wmv6pxReehjvkvoldqdv3qgsdCKeEvFuq4GOux/jUmgOm2tLQHfK++mW7bt9JxbajCCORmMPIKC
 e7qJ9DTA+YpjTWcKcUIGf08EnCu+D2tDIZ4DHP9DLtHwnY4uMep1UKZshG3ztaM8BuLLdtIg+rR UO1laG5lttli0Vw==
X-Mailer: b4 0.13.0
Message-ID: <20250210-cursor-between-v7-0-36f0215181ed@google.com>
Subject: [PATCH v7 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v7:
- Fix missing `mut` in v6 as mentioned in reply.
- Rebase on v6.14-rc1.
- Link to v6: https://lore.kernel.org/r/20250131-cursor-between-v6-0-603bdc7d4449@google.com

Changes in v6:
- Fix bug where Cursor::insert_inner does not update `self.list.first`
  when inserting elements at the head of the list.
- Add a new `Cursor::insert` method. See its implementation for
  justification.
- Link to v5: https://lore.kernel.org/r/20250127-cursor-between-v5-0-f7c388c23642@google.com

Changes in v5:
- Fix list / list2 in example.
- Add remove_last function to example.
- Link to v4: https://lore.kernel.org/r/20250123-cursor-between-v4-0-cb06698db94c@google.com

Changes in v4:
- Actually call the example functions.
- Link to v3: https://lore.kernel.org/r/20250122-cursor-between-v3-0-aaafbd8af14d@google.com

Changes in v3:
- Fix `CursorPeek::deref` to use `self.ptr`.
- Reword comment on `ArcBorrow` in `impl Deref for CursorPeek`.
- Link to v2: https://lore.kernel.org/r/20250121-cursor-between-v2-0-1b24cd377618@google.com

Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 471 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 379 insertions(+), 92 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

