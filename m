Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396943074AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778894; cv=none; b=Z0DSxSPg/EvYbWunhaDqhGIBu1pQ2u05fOpBb1HBZdKCe1bZdA+uFXqGeQlD3ce8uMF9H2vdZ7aByEhzDANn3NYmVvfPexEsZ+jW2DPFNYFctnyhK4L+LkaipvVdUAT0cvfG+tWMWcSXyx1ki6TBWvuAG/Vw/9IRLdUjmGxTZ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778894; c=relaxed/simple;
	bh=Dd2F0B0ISEzWA7LaglJfD+xCcbLb19kfhcNyzezrUFw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fqe/wZ8yjODx40jSaDtmnORGFY6lgvg8O0XLicu9buR/A0ZIHwWbYmAjkA84IwLYFHxMJVvsHoSZe8XVzEzzEna/qiokDChtberGeo/bIyvxXrvOI8qCtigkQgG1ZBa6LYY6XPDI8otnbABIi8JClCKSl3DTX+WhpXzPjUee4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wE0zUlpy; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wE0zUlpy"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso34287315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750778890; x=1751383690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqGXDhYSlvCrZbEH9Cv6es5PlTzM9evZxVnOZeB/MNc=;
        b=wE0zUlpyMM8d88qIZgDCcVUocUPz02fEeo02LWlsa8j/QTRoZj/0yBZIUHvmm4oyU+
         v/QL61nwg4AReugzai8+gZbabDv/WGey6tjq4hzdKLSVm/AcUrsBTF+8d16uzPJwNRvp
         caYlex7ifGSVPzjl8gdDT6/KxPREKVTSmhWtWu8l9cGCNyRezel/A/WXJKLligNhMLBR
         UcTKTefMp599UkhYFdA37j4A/x6gJyGncdYqyxRg9y7XCDyVEXcNoX33dGHA51W2Yq59
         TYnSBRT77ting4ujQLi+B3ae+NSRE4PghUxTaiC1ibcYouU8LVFuaRnM5Lua2vtlVIx0
         T+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778890; x=1751383690;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqGXDhYSlvCrZbEH9Cv6es5PlTzM9evZxVnOZeB/MNc=;
        b=ux8nlktKhix5CAvogFxbValNJT5sTXWTSWOkAtU0mWkFFu+BnjGd0j6NP3Rzko5Vhx
         aIf5FjK9XAUGy5ZsFKVoaMR6cQjjVhTdoPFpZ2Q1DiirWMPfDXK5VF7k/cholXVYF9na
         7PBDgVQsBo2/eV58cUa5cube+XqFEc+QEYxuLkVrgVyZ1hL3DwIcMhxYRThBBhGIm27V
         d0dGElQtzmiiu37tPG2ZfclHZSu9jH7QZV2CgR6N9XJgSD5a834jIbUxDLVhTmQR5tOW
         1WqIvp5TfX/tmFGmbfDWiGNhHu2m3S7yQuQ8lc2Ux+axJYXxPM1Qe68nHZGwdpVb41BN
         bKkg==
X-Forwarded-Encrypted: i=1; AJvYcCUT1EY+KMdI+B8hzCAf4vlBQtQHXo6ZoDfawGeF7IH8E8/QNAzLwWPbBRM2NkHvSuuerCmdBp8Ga5gMh4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoDm92/b0TdoXx5thFhYXIPimi4/VidytJdj48zrLj5PKshWoE
	G4C0EtZg4atUASwHF5mdR90+SlBCWHvF2wNcE3cnmHEKafVHcEdYc83l2PtBLjShN9hohGwKv46
	zS8Pl9vqNEN3g75xbzg==
X-Google-Smtp-Source: AGHT+IHMf6+raYFA7ySd9EOL3L/GCJqSmyssi+lARWuqdtFQtng4gPOM0JqrpSdAJ63ohOD6ZI1hFzGmAu/7bIE=
X-Received: from wmrn35.prod.google.com ([2002:a05:600c:5023:b0:450:dd5c:6cd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e8b:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-453653a3984mr181253065e9.4.1750778890698;
 Tue, 24 Jun 2025 08:28:10 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:27:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPrDWmgC/3WNQQ6CMBBFr0Jm7RhaA4or72FYDHUKTYSBVquG9
 O5W9i7fS/77KwT2jgOcixU8RxecTBn0rgAz0NQzultm0KWuylodUWZanozWy4ieXkim6k5sa0u kIa9mz9a9t+K1zTy48BD/2Q6i+tn/rahQIWluGrZ06EhfepH+znsjI7QppS/3BG9drwAAAA==
X-Change-Id: 20250617-opaque-from-raw-ac5b8ef6faa2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Dd2F0B0ISEzWA7LaglJfD+xCcbLb19kfhcNyzezrUFw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoWsQDO4H7Uc99vI+/NQXVnCqQ0zwkewq/nEH9F
 ZHfpAlsfs2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFrEAwAKCRAEWL7uWMY5
 RmKCD/9KzIHB/0Bwb5Tbi86a+ap+B6v9Th83f8rJ4H+bjGAULY3/bnpn7/ifAl50NGXQzM9LSJY
 v8AKtlBzlOOKwBh4CDVhHjnQkP8if2W3Hlub42KE8aUMk8tKAuMhyqUft27wGEhfi3etqLFCObp
 QvrVv8S5+xhSevIDYDFSxNHZFleo0bec8P1Qcvp4wj4VjNcDQfKaeVyCzt8hhM2hGT/CMWYoEgE
 Jmww4psDMOo4BtIPOqaMK/L4PTNX8qCOGRe/xH8SqOIgcWgJjw7vGq/Wj/AwxXnFIDSzjbh+xQK
 ruN+aEZHTHs6L6diBnDQG265pEX3RAI4+/T1aIClhslEi/Mz3V5UKrK5WFle1I2fPnL/alG368x
 Ozy9S1XEkl8oc7d+J0DbM6QSqeDPIS/XucQtuWj0qgohWQNmr4Q/w+DEH3ColkJLnjBRBGqTZcX
 VlMXS6QlMRLkYuxrOFbV5Pnxn3Lksh4CuicQK8r+RZ8hWSmbfZS7ZpPUVDihyn83Nwf0GBysTre
 fZyW+rlK1pUT+65cuYAh755/0+Bm7ToeybUvOl6qE/zQvtm511tpbTz2KY9O+dcFU4ppYho6n3y
 4nNlL5NUXcCPCmhlUaffKBiIY1DypR0qQwbExRkGOj9XGVXw1H7qS04yJ5x42wkHyYxESsgKFct vLVCfrkt2HGtQ9w==
X-Mailer: b4 0.14.2
Message-ID: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Subject: [PATCH v2 0/2] Add Opaque::cast_from
From: Alice Ryhl <aliceryhl@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
`container_of!`") we have enforced that the field pointer passed to
container_of! must match the declared field. This caused mismatches when
using a pointer to bindings::x for fields of type Opaque<bindings::x>.

This situation encourages the user to simply pass field.cast() to the
container_of! macro, but this is not great because you might
accidentally pass a *mut bindings::y when the field type is
Opaque<bindings::x>, which would be wrong.

To help catch this kind of mistake, add a new Opaque::cast_from that
wraps a raw pointer in Opaque without changing the inner type. Also
rename raw_get() to cast_into() for naming consistency.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Use new naming, and rename raw_get().
- Link to v1: https://lore.kernel.org/r/20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com

---
Alice Ryhl (2):
      rust: types: add Opaque::cast_from
      rust: types: rename Opaque::raw_get to cast_into

 rust/kernel/configfs.rs                |  2 +-
 rust/kernel/drm/device.rs              |  4 +---
 rust/kernel/drm/gem/mod.rs             |  4 +---
 rust/kernel/init.rs                    |  6 +++---
 rust/kernel/lib.rs                     |  7 +++++++
 rust/kernel/list.rs                    |  2 +-
 rust/kernel/list/impl_list_item_mod.rs |  4 ++--
 rust/kernel/time/hrtimer.rs            |  4 ++--
 rust/kernel/types.rs                   | 11 ++++++++---
 rust/kernel/workqueue.rs               |  2 +-
 10 files changed, 27 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-opaque-from-raw-ac5b8ef6faa2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

