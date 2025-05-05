Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB124A051
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447467; cv=none; b=RtaT9ejnsItpOiV4SZSuvYPOM3l4/IrBQzYmCoijiOBBwx+GqdoMAfc6TxtO9/LnKQCqF2lRLWcqbDtqg0EMjKlpA3WnlaQZ5zs7+3VxGMX6r8NKiIw6XLzy9eEzL+RY51IexdbrP6F9vhSdLDavOdcl+Z9R7bfVzTwTLmK4q8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447467; c=relaxed/simple;
	bh=AT8JQLw8EOBIqLg1hsD+PdWTgjTnmcFKPeIxajf3hEQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OU9krvmj5B9RbmLYM/IggdB4iVJw5jVZNvn9hrINl+SD97EESGoswuXYexTFerg1S6psry59zlX2tt4+n2uOpM3Ln2C44CRnjdbJfKT6KUmeI0gTKdF1ouk8coWEY/gQDe7paWpasET8Gt/gj7lMS+ZqkNGIY9UL/dwCMI7pntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVCwPr3m; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVCwPr3m"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912a0439afso1199837f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746447463; x=1747052263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tUtKJCb9zxzQYcQhaWAG9VNqZWaDz69k5Oi4J/8AuAI=;
        b=PVCwPr3mb6f1nghKqNe0mJYcel4FXSkBM4nran61asDSd2sCR3vK/WSFzk+jwBlgo+
         0KPIw+KfR6qWD39LGlKzCKGY2r//khtKBAtgQ18wOSjazhsZjS0f//1qQulM6udIzN5K
         7XhzF++aiiHFIM9LJXlNXlpkKp2cRPDzwoY8HIlYBupw64h+6ZqnRHYFf1zficwAy4JT
         CqyJfrmJRvH4t+cR0ugwe0BQymRxgtL4l90ebkzujAFF/SILT7VUOJ41cB2iD7QTXAH3
         Yzfj10HdvIYHolAYJTWC9btjJydYaMAtk4tEXK0Zvsn17OsHHBOjNB18uagvCDeCuPOl
         +9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746447463; x=1747052263;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUtKJCb9zxzQYcQhaWAG9VNqZWaDz69k5Oi4J/8AuAI=;
        b=RE9W0UsTSUVRTEcaYBig82Rbn9vXiauhe6aZPCM90urIdML7snGw0j1FbwvKSNU722
         aVVhjrdpN/srRvyNotBAH0PbvsMdP4w17F3fIM6Hx8EGfTzcQA0UJ+ngVdjr11fAxcX8
         wF7Ebc+dH4doGDkqbRw70CGYTAncuvMDCxBPK+JVO/WlqLn1RhrLW0B7gBCMLQ8IoyVe
         JK2qcs+IpKE50NoNUWNYcwCP+8pqHOwpY3QVFZ20B0PM+0QvhPsNxraD0Y1z7BwQwuNH
         cqjDsA+lM2E8Xcn/2qQlXbBctUVoIeJhZGlguXvewVZ+3h3rp+PDsHj0hlVfTN3NISU+
         g0OA==
X-Forwarded-Encrypted: i=1; AJvYcCXfHBBFSWqfzkY6hl9GCIUnexY8MZnbifX+gWhdTHnPxmny0A7P7FYy7h065XZ+ZAoqUoMayH3xIGSM5SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MbiqHzMQo/EaDjzJrWnMTqjUbtEfQOHm3XNjp1qLSF/nvRDM
	z7N0/dtfSfLE5n/BEQpLVCkyBsxhdd0vpjyVQy91rjePvyycMQkukyk6izFDAMiPMxRc1imNjqa
	/9LA8RY16ejC+CQ==
X-Google-Smtp-Source: AGHT+IEA9C52kPPF6qxConSxBxERklqj6Hl7vrYxzP0AmGH60eFxWxlKTQ+JAbCuorOuBGBO+0IgW9dNOLQSXws=
X-Received: from wro26.prod.google.com ([2002:a05:6000:41da:b0:39a:bcee:e7a1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47a8:0:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a09cf3df66mr7148614f8f.55.1746447463637;
 Mon, 05 May 2025 05:17:43 -0700 (PDT)
Date: Mon, 05 May 2025 12:17:30 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqsGGgC/33NTQ6CMBCG4auYrh3Tlh/BlfcwLko7A02EkhYbC
 eHuFlaaGJfvJN8zCwvoLQZ2OSzMY7TBuiFFdjww3amhRbAmNZNcFjyXOYTJD3qcgbzr4ZnWIEg
 aXjZcG4Ms7UaPZF+7ebun7myYnJ/3F1Fs139aFCCA6iojlKKsCnVtnWsfeNKuZxsX5SdR/yIkc DhjSUorzRviX8S6rm+ezM8g9gAAAA==
X-Change-Id: 20250424-strncpy-from-user-1f2d06b0cdde
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AT8JQLw8EOBIqLg1hsD+PdWTgjTnmcFKPeIxajf3hEQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoGKxgSg5DtzqlaVnObt7fpY20lByyFUVpTFEKN
 W8Buuw+L56JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBisYAAKCRAEWL7uWMY5
 RksMEACO9sKHWqUgFcihbZJfxagX0rGCiMt2/rX0/70s7EuVAOBqWm3u+f2wdUwZ9eDdc2qsDuF
 HaQFmfxe0iCHbtecSaY/sIs/p3WNtHtZdLxHlPtfCvYp65mpwwxPBTOE6DIiVIHfl+m+a/oq5Pm
 9X85hmin8Bl52kRa0FW3zFapkr7rz60sUfkPjB6NhS5yU0pyMeNBqDCWvfQaVs+PsJ4XNq5bYTg
 hTMMNENsNzRkFKsLufDtGH5738LNnbR+8c6IkkjJ1gIlsijZRx/8Cb7exbYYFs2aHS81lu/ajkz
 OOC8/qEptoadFWw/oqE+lS2HCCUzQfsGgD81Fkk7aYkIjzIk0PsVqglD09VwXgmlxTJxc7yJNfo
 4cc4HrZjbvkOZY0WhZmFi2YxzqLaIZVbQ8y/cAxAsBndC4a2p8vuXihkuksO1xWtFQULSjp2LR6
 CcO2XhavUmC2EL8l65OSeRwyGBn/BZaU4/0qgk382K9rIuyx6rvN684TKbdjeDfoACSxPalYhML
 kEJ7I5nGhHYHNmafp3h1oq1o05MZ1YivCt2iute2rLWPmFf8mFC7v5ofXdnxKEHXqPDim5vBmxa
 t89EslyWv3t4EFeO9SuVFnnILBPnrItwB+TChhP6zEFsLLRN/t2GiHk5PJY5G/Rg0L8Z52Dezb6 esAC+jbqipzMXPQ==
X-Mailer: b4 0.14.2
Message-ID: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
Subject: [PATCH v3 0/2] strncpy_from_user for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is currently no easy way to read NUL-terminated strings from
userspace. Trying to use the ordinary read function on an array of the
maximum length doesn't work because it could fail with EFAULT when the C
string is shorter than the maximum length. In this case,
strncpy_from_user is better because it doesn't return EFAULT even if it
encounters a page fault on bytes that are after the NUL-terminator but
before the maximum length.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Remove pub from raw_strncpy_from_user.
- Mention that some data may have been copied on EFAULT.
- Add more comments to strcpy_into_buf about tricky cases.
- Rewrite documentation of strcpy_into_buf.
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

 rust/kernel/uaccess.rs | 86 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-strncpy-from-user-1f2d06b0cdde

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

