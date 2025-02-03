Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC352036E6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584915; cv=none; b=ASTDt3IEYoSNDiP9GdY2QFzsCNK7FuUDEAEKXGjAJTpo7TXHNz/FiXxepFoCK8gucm4+LzLqr0EUAHk/fli3cRfAqL+Whn/0g0ZeQY+iPrsjacy6lYD0eWRDjf20evKZARfi4RbrA5f11IfazFFAAVKkUAtU5npWBfEW5pQ7CPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584915; c=relaxed/simple;
	bh=5RayMwBdE8wftaAFzyzo7I2D2vIYhJNPKMb4OmTDwCM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YcSUAG2dUZQdadMHOUt63kiwThnQi0yP7yrsW8f3Jzn7ranh5gIGmmibJtxkjLW9k3WKYiZCYn7PHpA2v1RG5yNdGsSquLw9R6qdl/9f7K2GH7OZWXYRDCpGG0/P2j3ZVYna9q+iDLsc3HPXqGQL1qPrvkZ0zzBw6jUpYzA3BdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ztJ3vixc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ztJ3vixc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361f371908so31262275e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738584912; x=1739189712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZW0GP4W/7qnWquUo7ioN8qOuSA8agXZe2rMFQxltuOY=;
        b=ztJ3vixcE4kSvx1UESuTiqrmjO+oUSYqX2ymSPkTdkB2bQtiZXvpjqmPhoVrpVLjrw
         IA9htH8yB8XjmxSdzg/6e859CRgKrXkgUk4QMtYRkSmxUaDrAtYjA/0PksGEExjWM4Yo
         3nUQ74ggg/7H/x1AYnz5YK/fedGjIatgEiwKwZA556CiGk44QIKT3skQPBClNntyrGf+
         4IkeFRMGjRogjCk/iSH7MQiWxJgRqlU8qGBfH7qj5lIzTxaz7qHupYc3L0BFCdPYVgEq
         pflhXdjjoMFaHdSc2qAbUwlhJIwxaAfdKCC56EkBadvydGOBj3hbH2JrcXloLuePYW3a
         lZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584912; x=1739189712;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZW0GP4W/7qnWquUo7ioN8qOuSA8agXZe2rMFQxltuOY=;
        b=dVv20YcC31uoQDx7bFxx8HmY0OatD3CA1/3B6puPKv8FDB5jC3ccc8p+K0naQMNXUU
         5Wzg25ws4yRO9GcK9malu5fo0MkObg6Jp8/Fkg5npy4DCoBGpq7Ap+KGef8HELeKgKvu
         RP0Rt5YOeYJtImhNwxrNQ/PkHPYJQzVpy5RruJ0AI8C4gHIXDvWr24aee8EPxVzcf/63
         OUUdxmJB/IlRnSKZEuilIYQuraVZ/4EIxN38C5ME8N3p1xSaMT2hLvrn/4vVSf3wUElt
         BDq+tK5VRNxJECmqXhD9mgV4iHY3gHZWnK5SLjWqXLBY249rPAX8BahAh/bs38Xvp7qM
         Ewbg==
X-Forwarded-Encrypted: i=1; AJvYcCU/AsItWbc4APkj19oV73cDWHMHN7HwIje2WLPEG24JeyJJo449Xya2ABhIX6ilAfRfyxOdY2tBUaOegNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCyBrKacpc4fNLvKhIgE25ZGr3vt+T9/o2YFbCLzOLdcxto2Q
	O359XPusMzvlOea1ZlMs/guEeN0E70Yf1x2IyiSV+uanPi/vhJLDrv7Xk7nZsxIilH1Nf27JB07
	VC+fHQ+B7QpzM6g==
X-Google-Smtp-Source: AGHT+IG/TkjnL8EqB6zkiMQgN5CT4BSlrTDc0dPk9b0e/ayAkzCN4KRnO9dRcR4wqNYBGO2XmYR/QgL+1B4Y41g=
X-Received: from wmbbi5.prod.google.com ([2002:a05:600c:3d85:b0:434:fc6f:e8c3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f10:b0:435:192:63fb with SMTP id 5b1f17b1804b1-438dc3ae816mr179894055e9.3.1738584912178;
 Mon, 03 Feb 2025 04:15:12 -0800 (PST)
Date: Mon, 03 Feb 2025 12:14:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACuzoGcC/2XSzWrDMAwH8FcpPs9Dkr932nuMHezYbgNrM5IRN
 krffWoT2hSfgk1+stBfZzGVsS+TeNudxVjmfuqHEx9QvexEd4infZF95gtBQBocKTkfo6weEEM
 NNSkj+M/vsdT+91bm45PPh376Gca/W9UZr7fPfkaJUlHMJnIhX8r7fhj2X+W1G47iWmCmLXILI
 kYxqWICudyp2CD1QNzgghSjnGyHHcSaY2iQ3iJakGYEAaN3YHzUqkFmi+yCzBVpQF/B5EKpQfa
 OEBAWZCXI7AOokGw1rn3JbZFekGMEWBRVbzkH0yD/QEjrS55RSQo1mRytbdsLW7QOIjBySC7VL
 mej25wQtiqs6XJ7UudaeRIpcloteywFEq5R8ZeZtVaDJl+7dhh4XwvDe2NWRsyUMxBCLIDueS8 ul8s/cCRSeuUCAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5306; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5RayMwBdE8wftaAFzyzo7I2D2vIYhJNPKMb4OmTDwCM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnoLMsb3vYypHp++2v+iwMBI0va3rR6k3M/+mfS
 4dPLylQ2VyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ6CzLAAKCRAEWL7uWMY5
 RrjREACFo945VrKdNs3WhkUyYvws1JUfjXsYC17/IrN78oTs4JAJOKVq5EWgvlSz92rV1ryVfnU
 H6Rzd1keeCsYvrZhxJsOTTsWbOsp8Uj2Wp8eETjThBtnExSYDjXVemLY0cnu67REaAu/LFVIeoh
 DTaq9wTiGIk5eAeVdZFRU/XVErrlG/AU5lm1hHJJ2v25jL3nm3xFNmyTacI/4UUAKcjzylciuZc
 Xts+OZAHG4F6yyylwxnFzUzMbSXTgdWfGLjS9iBCJlscW0JubJOwk2AO0XIl6Amt5CvhlIDUnwD
 FUkFPnQbhcaRR8AXYJoznVGSzKerioix42kpLDKQQlFxRjGj+G1N4OEOY/y3NFSXmKI9dKlvfpJ
 FVKy7kB2lgwCAxlaDLH0CqpN5Kl3s9ooAhyC0IuTKTxv8073bRKhO81oSlu5Uq5sGeiM6CwUgUd
 4u1jR22VaMA9YH/psBzlUZ1DYsglza/1gh6MrLvmB2FHxxGfs7Oloa969x7tnQ4u++bonH+bw/B
 C6dnyCPCSFaNuGnHp1t68hGP4nei41RJwB9SXoZxBEFLZ9jxxjbBd9iPujOcLH9AgTEhHwUyr8a
 gll54rVzoVutRftEfABsYFikgx7fQWfUnpf7vDbob6A9WFFpq8GLVxhB3Z90SvlMWfZpYHs2Pfd XlDZIBjuT3i84aA==
X-Mailer: b4 0.13.0
Message-ID: <20250203-vma-v13-0-2b998268a396@google.com>
Subject: [PATCH v13 0/8] Rust support for mm_struct, vm_area_struct, and mmap
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Balbir Singh <balbirs@nvidia.com>
Content-Type: text/plain; charset="utf-8"

This updates the vm_area_struct support to use the approach we discussed
at LPC where there are several different Rust wrappers for
vm_area_struct depending on the kind of access you have to the vma. Each
case allows a different set of operations on the vma.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v13:
- Rebase on v6.14-rc1.
- Remove casts that are now unnecessary due to improved Rust/C integer
  type mappings.
- Link to v12: https://lore.kernel.org/r/20250115-vma-v12-0-375099ae017a@google.com

Changes in v12:
- Add additional documentation to modules at the top of mm.rs and virt.rs.
- Explain why the name Mm is used in commit message of patch 1.
- Expand zap_page_range_single with docs suggested by Lorenzo.
- Update safety comment in vm_insert_page
- Mention that VmAreaMixedMap is identical to VmAreaRef except for VM_MIXEDMAP.
- Update docs for as_mixedmap_vma.
- Add additional docs for VmAreaNew struct.
- Rename `get_read` -> `readable` and equivalent for write/exec.
- Use mut pointers for `from_raw` for VMAs.
- Update safety comment for fops_mmap.
- Add additional docs for MiscDevice::mmap.
- Don't introduce and immediately delete mmgrab_current.
- Reduce active_pid_ns comment at Andreas's suggestion and link to get_pid_ns.
- Fix documentation test in rust/kernel/task.rs.
- Fix warning about unused variables in lock_vma_under_rcu when
  CONFIG_PER_VMA_LOCK=n.
- Fix minor typos.
- Link to v11: https://lore.kernel.org/r/20241211-vma-v11-0-466640428fc3@google.com

Changes in v11:
- Add accessor for the vm_mm field of vm_area_struct.
- Pass the file to MiscDevice::mmap for consistency with
  https://lore.kernel.org/r/20241210-miscdevice-file-param-v3-1-b2a79b666dc5@google.com
- Link to v10: https://lore.kernel.org/r/20241129-vma-v10-0-4dfff05ba927@google.com

Changes in v10:
- Update docs for `set_io`.
- Check address in `zap_page_range_single`.
- Completely redo the last patch.
- Link to v9: https://lore.kernel.org/r/20241122-vma-v9-0-7127bfcdd54e@google.com

Changes in v9:
- Be more explicit about VmAreaNew being used with f_ops->mmap().
- Point out that clearing VM_MAYWRITE is irreversible.
- Use __vm_flags to set the flags.
- Use as_ and into_ prefixes for conversions.
- Update lock_vma_under_rcu docs and commit msg
- Mention that VmAreaRef::end is exclusive.
- Reword docs for zap_page_range_single.
- Minor fixes to flag docs.
- Add way to access current->mm without a refcount increment.
- Link to v8: https://lore.kernel.org/r/20241120-vma-v8-0-eb31425da66b@google.com

Changes in v8:
- Split series into more commits to ease review.
- Improve read locks based on Lorenzo's doc: either the mmap or vma lock
  can be used.
- Get rid of mmap write lock because it's possible to avoid the need for
  it.
- Do not allow invalid flag combinations on VmAreaNew.
- Link to v7: https://lore.kernel.org/r/20241014-vma-v7-0-01e32f861195@google.com

Changes in v7:
- Make the mmap read/write lock guards respect strict owner semantics.
- Link to v6: https://lore.kernel.org/r/20241010-vma-v6-0-d89039b6f573@google.com

Changes in v6:
- Introduce VmArea{Ref,Mut,New} distinction.
- Add a second patchset for miscdevice.
- Rebase on char-misc-next (currently on v6.12-rc2).
- Link to v5: https://lore.kernel.org/r/20240806-vma-v5-1-04018f05de2b@google.com

Changes in v5:
- Rename VmArea::from_raw_vma to from_raw.
- Use Pin for mutable VmArea references.
- Go through `ARef::from` in `mmgrab_current`.
- Link to v4: https://lore.kernel.org/r/20240802-vma-v4-1-091a87058a43@google.com

Changes in v4:
- Pull out ARef::into_raw into a separate patch.
- Update invariants and struct documentation.
- Rename from_raw_mm to from_raw.
- Link to v3: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com

Changes in v3:
- Reorder entries in mm.rs.
- Use ARef for mmput_async helper.
- Clarify that VmArea requires you to hold the mmap read or write lock.
- Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@google.com

Changes in v2:
- mm.rs is redesigned from scratch making use of AsRef
- Add notes about whether destructors may sleep
- Rename Area to VmArea
- Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@google.com

---
Alice Ryhl (8):
      mm: rust: add abstraction for struct mm_struct
      mm: rust: add vm_area_struct methods that require read access
      mm: rust: add vm_insert_page
      mm: rust: add lock_vma_under_rcu
      mm: rust: add mmput_async support
      mm: rust: add VmAreaNew for f_ops->mmap()
      rust: miscdevice: add mmap support
      task: rust: rework how current is accessed

 rust/helpers/helpers.c    |   1 +
 rust/helpers/mm.c         |  50 +++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |  44 +++++
 rust/kernel/mm.rs         | 339 +++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs    | 476 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/task.rs       | 247 ++++++++++++------------
 7 files changed, 1040 insertions(+), 118 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20240723-vma-f80119f9fb35

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

