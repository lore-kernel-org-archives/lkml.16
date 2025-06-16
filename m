Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E326C3B7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077728; cv=none; b=XgdP+J+/mbgCVukpResxFuPDa03V4iqF829255WAXxP1Mc6bxpOchPVl3++KURqQU2pFhPRggixkK7R8d+9X+9SPkaSgw/v+syfbad3U8QZULSF8gdKcHWCkLeionUZA5XRye12kFZ9V1lWglksQ/ZjlpsuLKeLF50SuEErzneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077728; c=relaxed/simple;
	bh=l0IfWgiC1RDybrnOEoQW7eDnm5A7asHn+JBveZVapL8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aMmPzVIJSCFfiUhTh0JlbcAKKx5GSXqxQ7X/c+WIg5RYejF3qJa0esKCfdk3Z/VnJKqm9IP7HFMoMNZIM+uttWqtin710obyoHLG2Os2ZJM9PXW4+/2JbERGXmdW6BLNz/ol9CxZcePTJa1zNqzP/vcjNmtxildPa/IXF5xxv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFG8V4bX; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFG8V4bX"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450787c8626so33761265e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750077725; x=1750682525; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+5z0oKDYfCpIh/kdNigaGjh6Kp7N8Hqa3cxmtm6IWyc=;
        b=UFG8V4bXd18u1Us2hm/K8dz0KgWnOA+nAmjuAKgbKrkGny5OiU6BNt50ORKAi2Ez+J
         bO2YNVA38JxC95r4BDB/jSVVTNDeukp+pg937HgBvM80LTQPdrVKqxVCDlZfKXYN99vr
         bLfafftc6207Y/Xs1sxTFYqzRvfTDVQzMwnwvgLioFxcoxYapcR2QDja87EGdA5KTDg6
         hRiIss1W147rFAWsUvCspV3ZePKykzMFWICElWNMiPfpkxvA7LSMcRWIJRUe+voNYjEf
         VWSL/MZg02ocB+Y4mAJIOtwVtyQVfxGzQPZUyH6zbN27bIZnXovvlMmVszpBNuWVmllJ
         do6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077725; x=1750682525;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5z0oKDYfCpIh/kdNigaGjh6Kp7N8Hqa3cxmtm6IWyc=;
        b=qXbyiZC2MC76zdGjuLQUoFZ1V4/WJrBgSWk6Us44ooZP7ztA4eLZUtuHdSMXHT8IN0
         JEVAaR11oAvxOzKK+5tChr/b1k0rEiHBN64t4VPSTcH85dKQePCUH6eq5qxzDaie2W+D
         zrVjpgB5bwDkyTUAtegde6PlSkV4tg91q6LTGHs4ANLAmyk90I522cAaKXsNPZrS+Wk+
         MMTGW27Yfz/JvtIP3NT/5WyRdAgY68pC7X8MeBWl1xBZHpN80lNa7CRIwAcSJFrJCIwC
         eOLULJANShia6bSMktUm4ujrWCZ6AHXUFXGpZDC36SG8M9L9ghcL1aM9xLM5g4LoUmgQ
         X1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGPtSVwwGtFVC7y3/zAbqNrZtMrvQbixTGPYduaM294dQ4mj0f20b3X90cyrUps4QUEndPKXd1lHjz5U8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvpmm3SkcdD+UCy2jSjm5t3GXM//XKpJMz6ZRIVYAKLNLoOkzD
	Igug5oENiOmzoSol5V1lPxkU+fNhklATdOQGUhlF3n0vztnSKMe0NcUxi/OWbiPOoPHp2ECpi0k
	vyoAc116Zu7lIU2wTVA==
X-Google-Smtp-Source: AGHT+IG5sfSFZ8L8kfMsi/4oYjDJ+R4nfvhpz2iKjAilvb66ZwuKZobcJbblafgXW9BFR0o3Zn90rPcQckMZiJY=
X-Received: from wmbfa7.prod.google.com ([2002:a05:600c:5187:b0:450:d244:bd2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8710:b0:44a:775d:b5e8 with SMTP id 5b1f17b1804b1-4533cadf840mr76709585e9.1.1750077724978;
 Mon, 16 Jun 2025 05:42:04 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:41:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAoRUGgC/33PwQrCMAwG4FeRno20WbdunnwP8TDbZBZ0lVaHI
 nt3Oy8qDsnpD/xfyEMkip6SWC8eItLgkw99DuVyIeyh7TsC73IWKLGUGjWkS+zt+Q4cwwmuuQ2
 K0clqL61zJHLvHIn97WVudzkffLqEeH+dGNS0/acNChRwUxdMqKq6bDddCN2RVjacxMQN+Ek0c
 wSCBEMVt7a1cs/yhyjeRJ45oshEXdrKGHaaG/VD6A8CzRyhJ2L6QRvptMEvYhzHJ3emoMx8AQA A
X-Change-Id: 20250424-strncpy-from-user-1f2d06b0cdde
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=l0IfWgiC1RDybrnOEoQW7eDnm5A7asHn+JBveZVapL8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUBERNjki0T9QSTrrcNbKyN1cLsTXvuokYPFen
 wlYwMIM5myJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFAREQAKCRAEWL7uWMY5
 RvGXD/9utwUpEcXq6uMeLT9zKHXTAYO3R40ctB550vDi+vkM1LMxCeACuU6Hr6YAnYmXd89huli
 V6gLSkwcEWhKwCbYGSpOEaZUfIXMFI/5IPLewBM6cHf44oTFp2o75v5f4V+yGHk5iHgY0VfsyNh
 c38mjcChtXbVlK12L8+aafb27TOjk9g30hFa97wBhPEJb/RqvVMltjTPhDfoNjQPhVlwfaGNVVZ
 UyqslZKsqLc0lL7TKJiYll40PPwIBpld2fPg54zAWopVkBP188yYApQkdNlYKI3jNVqTqIw+24u
 tnM+o8q6DKIwzBHPAwN2tZKOwy92gzEK9Lv7GGaGqUulhcGnVDrJ52ALVtpBfsXXCOe0zwHqSQV
 w6ih7H3SK6VbUhmcqVFY+drXwDbsrsTYNtjJCrLRYdHWffIVGpjp6ovkzT/Q8I3k3KpMz6JdsK0
 QY1rmEIpO2+a1X2GgC3h8p+yI1+Vv+PcD/RZ7Ix+76Rrg0Nj9qow/wxlc22ec8vcnoeHZZ4I8pN
 J/nzl2090oyRJ7p3JoRW8p/9lTkOl57J3aEvUVupQbGDx94aj8snFGrkj7KhMEF/7vX08KhrwAm
 N05+x89gemZ5gfv6+VySUjByFX5fgQEguROEpCUTWno49HMZTZ88nBSjJ1BL5B5gNZK4FKPwtYF L/taJnm/3+rrLdQ==
X-Mailer: b4 0.14.2
Message-ID: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
Subject: [PATCH v5 0/2] strncpy_from_user for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is currently no easy way to read NUL-terminated strings from
userspace. Trying to use the ordinary read function on an array of the
maximum length doesn't work because it could fail with EFAULT when the C
string is shorter than the maximum length. In this case,
strncpy_from_user is better because it doesn't return EFAULT even if it
encounters a page fault on bytes that are after the NUL-terminator but
before the maximum length.

I don't see a clear owner of uaccess in MAINTAINERS, so I suggest that
it lands through Miguel's tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Add comment about not updating self.length.
- Add `` in "This implies that len == buf.len()."
- Update guarantees for raw_strncpy_from_user.
- Add Reviewed-by for Benno.
- Link to v4: https://lore.kernel.org/r/20250527-strncpy-from-user-v4-0-82168470d472@google.com

Changes in v4:
- Swap order of arguments to raw_strncpy_from_user, and rename buf to
  dst.
- Update safety comment on CStr::from_bytes_with_nul_unchecked.
- Add `` in "This implies that len == dst.len() < buf.len()."
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com

Changes in v3:
- Remove pub from raw_strncpy_from_user.
- Mention that some data may have been copied on EFAULT.
- Add more comments to strcpy_into_buf about tricky cases.
- Rewrite documentation of strcpy_into_buf.
- Add documentation alias.
- Pick up Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com

Changes in v2:
- Rename the raw wrapper around strncpy_from_user to raw_strncpy_from_user.
- Add a more convenient helper on top that adds the missing
  NUL-terminator when necessary.
- Link to v1: https://lore.kernel.org/r/20250424-strncpy-from-user-v1-1-f983fe21685a@google.com

---
Alice Ryhl (2):
      uaccess: rust: add strncpy_from_user
      uaccess: rust: add UserSliceReader::strcpy_into_buf

 rust/kernel/uaccess.rs | 94 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250424-strncpy-from-user-1f2d06b0cdde

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

