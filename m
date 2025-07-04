Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C42DA769
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621182; cv=none; b=qLnbnKLCx8pNhUvGA1JcazIQNbIkRE7eJJmaHK1awQ0IhAUPk3DOAiYOPMWkIXkAC2at/UcPP8h0IHLppSZRruTygarJ/oPjF7pf1/M0E1qo7ualrnDyUE9JFvbrGgIudd0g6MG/DOA+nICM4Wxyq1byBrTpvPmG6QMtDvkhxrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621182; c=relaxed/simple;
	bh=jA6MONzIu3QhZ01eMnmDvDUUw/i81j4aNXXrOLK8WrQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HIQGpL4WawLJwHwpJ4K+ydp1Yo7NKzrmy25CoOu4oltKkirhLOh1/SlzDYDpjlJYsTAcjE77SU+Vnhbacc69IrIjDH/2eGXUHAfr/5542DemeaW4yzZ4+KDSodiX0OljB2QWnjs7sf3RvLaCmlZbAzeypP6556T9Wiuaowy/9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NR0/fkjO; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NR0/fkjO"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6069f1c97b3so603051a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751621179; x=1752225979; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eom8MqTYzc2hVFio+dl04ZGQfBCtZA5mA+TPRkPngn0=;
        b=NR0/fkjORTXDjKYGyFkJ+dcAyVtRuZVCl1k7L0mwedrqUhOpDx9g9TFqC+bzGUjv5w
         mkyDGuvMXE+FZ5imDQRpq3RcEwNqP2wnpRT3uUTSZur1l91KdhTOzYMJZzBa5Dtau3hQ
         +jAJRGL2VGm/BfcXP274X5V5wGMSAkd1N4DevTaNhmiAzJglgx4tlZmA4qkwT6m7I+jL
         fvgpwHN9fZAA3LTy4wuChfbDdDakV+Y1H+mTVtNt00/Qc8DT1Pfc0waXtRQaFNpQ5uJj
         d8vnNL8Vw/vs0+9VTqch945esniGyX/u5eK9BZ4PKwCQ0hEZ+hciQHRhnrs5fOb90ZKk
         aulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621179; x=1752225979;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eom8MqTYzc2hVFio+dl04ZGQfBCtZA5mA+TPRkPngn0=;
        b=Bl0oYAhqa94pp+ilV9Xc3n8ZvBkxnore7FxMOR3spCmnLhVC32kkgzJXVgFrDcC2/Q
         YR+JXBZ67aKNmSJZF0tqLOO9EYwQ9kfJ3Y2dWPFqOZaH7IloLvtvAbwIcJomNlU0z8/f
         NweoQNbfThUNenEMIzEScFvq8hjhc1GPa8qPopyPMy1dmiF+O22rVT4WPot7iM3MA211
         9/YVXSmrfmBa4o9Ygp9DwLnRuoCAwjf1vJj69cP29mCD5sGAaESarkUhoQJ7QhyvHUmh
         NNkuNJh5LcdJDxEOuxSCZShCs3xL9vegKFAGX86mF5rj5ztD9owmtFQi+AdypCSTxmcS
         U3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTO40nYD+1ueohxz5LsA9PuYVjcRind7y1bvduGVltPy1vGBag8dU0Mi13ORX+GcY1IViKYda7GRcrP08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YgrkiBS4YCwvtk8C5MEMaJlvyWrOJo5lI2YKpOcVgExMOA1D
	FDUIqH4NcHQvx0gTZQVVNZhvJYncAAEX2l1s19ekLBhRdKphA391q2+Z08v2gEPc8lW41dJ9oaN
	Xt5vA5u8Ydov6i1btaQ==
X-Google-Smtp-Source: AGHT+IGpAGqrFQjkabZlag62YAsRfLlg/dcIbSyK0g+6L/sdiwhOYD4IJucZtwsiFtgepP0TqjRqwJp1I3o0r5A=
X-Received: from edjc4.prod.google.com ([2002:a50:d644:0:b0:60c:6f2a:9be0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:518c:b0:607:35d8:4cf8 with SMTP id 4fb4d7f45d1cf-60fd65156admr1304585a12.11.1751621179336;
 Fri, 04 Jul 2025 02:26:19 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:25:59 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACeeZ2gC/22PMQ7CMAxFr1J5xihO21A6cQ/EEFK3WIIGkhCBE
 HcnwMLA+Oyv5+8HRA7CEfrqAYGzRPFzAb2owB3sPDHKUBi00q2qiVB8Rkkc0K27xrJVq4E6KPF
 z4FFuH9V2V/ggMflw/5gzvad/JJlQ4WjcmuqGbaebzeT9dOSl8yfYPb/awJdrKZa+btjbyFj2J 0l9lc2SDAan4bdxeeB9yqgWz17mxAMmj4ZWyrKiVquxz3XxP19I1B0kAAEAAA==
X-Change-Id: 20250311-iov-iter-c984aea07d18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jA6MONzIu3QhZ01eMnmDvDUUw/i81j4aNXXrOLK8WrQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoZ545KR6dKEwqApm01zdQBZIua9CQ6K8Ks+QLo
 HJXHL+GXrmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaGeeOQAKCRAEWL7uWMY5
 RkQSD/44fqIFVhkx4Q2GpK7mPaCTSzyIoAsVwc17urlo+ZOx77X3ecI6UCDlb6q7XdQU3L/MUSP
 JK6cp9TByS44tjXPr2bOEd4Ytev2JBhLRjBTXuO/6H/hVMRlYWtHuiVDS7JGAmGjOT9UTCRlu/6
 EXnZODE+098Qp7OwbT5ZyC1hLyK4hnbKwVvv1467YoJK/pKk50qVjhTFQ1yioDr/3g1ggRtG5a6
 LXynE7PLXwPNv3Egr6s0+U63SZWBst8LBfIA10i+gFMkvW3lwbFpSCmaXIQ4xyghmkmzn8V3yIA
 fgvqew6xgP25Qcs8B8iRipsF824B+eJPdceLXsXcZns2Nlzr82OkzRbvery5Hpf8IYrenLOZnFK
 m9qZQesEHiBwFTBQTNWymEVjnB+WjrG1gvkxB8pG7HttVrt4gqjUcsr1L4pw0I3ZhYqb6iJKUqt
 2G8hw5EKEBjK7LCANQl/Ka9536LzmjUijbSuXFx1X8tVRP+bwUbWhw4EP3D8t/Br+WZ5xzxAvjy
 wWBscoY83m4G+ChQBAMJ1VeNflbcMZ4q4/iguTjFo9Ln8ai11tgB5uUPIY5K0oWFWz44c7YrEQt
 dMrLL3/BTnyod9MTJnoPwIeh5rdMUP3bt/q6/1EMm3HUICshBACZsT9eiO385KN846EmShTTRw2 ZtMSUjM5cacahqw==
X-Mailer: b4 0.14.2
Message-ID: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
Subject: [PATCH v2 0/4] Rust support for `struct iov_iter`
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This series adds support for the `struct iov_iter` type. This type
represents an IO buffer for reading or writing, and can be configured
for either direction of communication.

In Rust, we define separate types for reading and writing. This will
ensure that you cannot mix them up and e.g. call copy_from_iter in a
read_iter syscall.

To use the new abstractions, miscdevices are given new methods read_iter
and write_iter that can be used to implement the read/write syscalls on
a miscdevice. The miscdevice sample is updated to provide read/write
operations.

Depends on:
https://lore.kernel.org/all/20250612-pointed-to-v3-0-b009006d86a1@kernel.org/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Remove Send/Sync/Copy impls.
- Reword docs significantly.
- Rename Kiocb::private_data() to Kiocb::device().
- Rebase on v6.16-rc2.
- Link to v1: https://lore.kernel.org/r/20250311-iov-iter-v1-0-f6c9134ea824@google.com

---
Alice Ryhl (3):
      rust: iov: add iov_iter abstractions for ITER_SOURCE
      rust: iov: add iov_iter abstractions for ITER_DEST
      rust: miscdevice: Provide additional abstractions for iov_iter and kiocb structures

Lee Jones (1):
      samples: rust_misc_device: Expand the sample to support read()ing from userspace

 rust/kernel/iov.rs               | 289 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  97 ++++++++++++-
 samples/rust/rust_misc_device.rs |  36 ++++-
 4 files changed, 420 insertions(+), 3 deletions(-)
---
base-commit: e76fe965a0365e346cdaaf462847bac748354ab2
change-id: 20250311-iov-iter-c984aea07d18
prerequisite-change-id: 20250605-pointed-to-6170ae01520f:v3
prerequisite-patch-id: 11b11790787664c10cc5ea40ce7b65f35f442c02
prerequisite-patch-id: bd6b8bd6b811baa375b1d2eb51c1c7475bfdede5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

