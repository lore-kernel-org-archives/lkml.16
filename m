Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD5E20D51A;
	Fri, 30 May 2025 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638013; cv=none; b=cqhe2gEJ5g4xSovN9lYUwH+jc35kinB7brofB0fPrYbLD+ftcTcxpi/Zdc/795ayr6BAgVP5S5qkcXWeN1pkJy5qR6ltlh6EqvFoKp0a264hiulKLHzrMUSL0x5A5jNcopyLwspQZM/jCPRk1yJ65bnUZG2fHbn6AJVSIo4Of0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638013; c=relaxed/simple;
	bh=Eeij9U/tAnYrpPQrtpZQuUH7VLcletCEw9lLNL+01Ic=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RptnvJmlvhpKj5CNKFZsdBNMAoMrKjQT9oWGuqYema7/S9oiwadXIzWraxHChkhi9cK4OHOMJWIVSCQJ3b7SKMLtiMgVLSRcrEiUeELA/OUpz8bIaOfspWT8ip9tdZywW4vT+1hWvdUmfX4KftMQ713Ulpcf3GEVb2jP97KaxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMnNPJxT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMnNPJxT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf214200so20437455e9.1;
        Fri, 30 May 2025 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638010; x=1749242810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXM14q11XOZfpsUAhE2ZsJHDiLVzqhh4p5NBJD5eKis=;
        b=QMnNPJxTAobw4kaUcFcc8aoYCoYMcCm82HpAxcqO9scrQP5xiu/q+pb6IM+VJmYkRg
         mqMkoU401ktQ+UFwqsdsIv6j8FgSHeniOy8Mw2QtxxrthbfvlCtAqFYuOmpNyGktuFIu
         OqDSV98LeDP0GxKYbg7c1vlkgtZ2BAuJwfU55qiN8QrQvVdvbfh25JoYzMFXcsBKb2QD
         vF4Mk2sk438KoXcAPuyJEZGvRmrklVpkOoBsPupLLsOp7latVH54QGyGNX26+9dguo6h
         XDpSRMVevQhcsUDz8ivw6hJ0zDgscmPorh+fCLrulmm4Yttant8llYrwbEg9XNIUFNhy
         pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638010; x=1749242810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXM14q11XOZfpsUAhE2ZsJHDiLVzqhh4p5NBJD5eKis=;
        b=xI83cWtq+YHu10t/ohuP/oATNAuDB+dxjsgQB2x9djOG2iKwYcGl0WOqgh4TCFkJ2m
         T7BYOy3075SUjkUJ6yu3wOfd5aSjMLD4tVebJAX6WPQeWxD3iKpjPwgOMJcIXVWAqMx/
         KdfJTwkulMkAyWZ6cw3OBXX9yBCisaDN3sjPZ4y/XcLGUDN4AdOYtDAaJG9Tpby9wgBR
         Ilkg82aGpmi+W77bdSWFfYmCg2THOKyFBoNvQMaZf4cTF33QfeXh3KtPsVhmhAt1ddNI
         Dl474OLb999lqVKenZSLCNMP5hEqkcTC5XAbbLUmgLV31hZwk/oquZe29K/oWkSaIMnv
         HkOA==
X-Forwarded-Encrypted: i=1; AJvYcCWXnl11sHfKUszitXIXJ8SetTpcXGYMbrb1ybFcYOaY7J5fkLpE6TBSTbFd0m7sX8Bn2FTOZ88lUcYlrJY=@vger.kernel.org, AJvYcCXoams+Gv7p42s+nN1hw9QWolZR++jRP+CvSY84+ATGPuBuQ9xO+CNDsUdHW1+iOp763n/zSy+eEy/XvL0ytl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzeK15tZf/gB8zWy1BgHZkECwMAYZnvQNrLKVAfdgH69UBEfpU
	2gwY4SUF4UrFgiUOtkhW+i7RH/U6SzhSQzVqAD+YdYhztyPoNSmQrp3MZmrMAA==
X-Gm-Gg: ASbGncujxSP6X5HenCyTq9csgNzFv/zbZAAdlGTJJCf3ROWGBRulsjngNrxwHTWW6Gt
	spQnQ5bAT5nY6TM8XDu/iC2ex+YyqQka5j8IF4Y09/I25/TV+buVbWjjOIAuy3OhNuZBuh65vjP
	FXegnBudgO4PhBFlImLwSr5HpELtyMHmRmhMoEfLUjGs3SUuuWrj8xhtFA8auOK6iEsxqSEtIfX
	zCmUcEHd0AW50WS1a1NOdmeRvRS+W7Dt5AKQyj+tYEDcdlZR4tVNtzm/Qeuxfn81qRvEe0orxff
	BeYafJoLYd1A5cjzL65jLFU7vwD1tsZsVf92AKgyx2k8DOm9m2k=
X-Google-Smtp-Source: AGHT+IGjlY51JkmxEF8M8YzsQ1qfJNgbcCEhQt/k7wBKDBOjC2bcxOUgSvxJOkT5aJBWqwrSmfscjQ==
X-Received: by 2002:a05:600c:198e:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-450d885e49bmr37147055e9.18.1748638009808;
        Fri, 30 May 2025 13:46:49 -0700 (PDT)
Received: from [10.0.1.162] ([2001:871:22a:cd68::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450d7fa21e4sm28045405e9.11.2025.05.30.13.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:46:49 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v4 0/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Date: Fri, 30 May 2025 22:46:26 +0200
Message-Id: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIZOmgC/5XQwYoCMQwG4FeRnq1M2hmtnnwPEWmbdCzsONrWQ
 ZF5d6MurHhyj39IvsB/E5lSpCxWk5tINMQc+wOHejoRfm8PLcmInIWqVFMBLKWrZTrnsuti9sg
 HnnaJ2phLsoVv0RYrLQAag94pUwuWjolCvDy/bLac97zep+vz6QCP6f/8AWQlCV0Ag0hN8Ou2s
 /Fn5vtOPPxBvZkavjMVm40xAWjug3X0aeo/s4HFd6Zm06PTmpQyqBfv5vgqJtHpzK2X33bG8Q4
 WAXfHkwEAAA==
X-Change-ID: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Benno Lossin <lossin@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748638009; l=2987;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Eeij9U/tAnYrpPQrtpZQuUH7VLcletCEw9lLNL+01Ic=;
 b=369MkkC6d6driZntI2+UuieSYXJj5kExDdaLO/WieFEXP9HeirtKquFyrf5/VNI+QnKPje2UG
 DAg0KX59mkMDg/i8HgEDrAEhZkw5I5Hn3XIcPDlYy9BySPWfz83Pu4a
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Currently there is no good way to pass arbitrary data from the driver to
a `miscdevice` or to share data between individual handles to a 
`miscdevice` in rust.

This series adds additional (generic) data to the MiscDeviceRegistration
for this purpose.

The first patch originally comes from my `UnsafePinned` patch series [0].

The second patch implements the changes and fixes the build of the sample
without changing any functionality (this is currently the only in tree 
user).

The third patch changes the `rust_misc_device` sample to use this to 
share the same data between multiple handles to the `miscdevice`.
I have tested the sample with qemu and the C userspace example
from the doc comments.

Some discussion on Zulip about the motivation and approach [1].
Thanks a lot to everyone helping me out with this.

This patch series is based on the rust-next branch.

Link: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/  [0]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814 [1]

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v4:
- Rework to use Opaque instead of `UnsafePinned`.
- Include `impl Wrapper for Opaque` patch.
- Link to v3: https://lore.kernel.org/r/20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com

Changes in v3:
- Rebased on top of my `UnsafePinned` series.
- Link to v2: https://lore.kernel.org/r/20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com

Changes in v2:
- Don't use associated_type_bounds since the MSRV does not support
    that on stable yet (Kernel test robot)
- Doc changes and add intra-doc links (Miguel)
- Use container_of macro instead of pointer cast in `fops_open` (Greg)
- Rename `Aliased` to `UnsafePinned` (Boqun)
- Make sure Data is initialized before `misc_register` is called
- Rework the example to use an additional shared value instead of 
    replacing the unique one
- Expanded the c code for the example to use the new ioctls
- Link to v1: https://lore.kernel.org/r/20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com

---
Christian Schrefl (3):
      rust: implement `Wrapper<T>` for `Opaque<T>`
      rust: miscdevice: add additional data to MiscDeviceRegistration
      rust: miscdevice: adjust the rust_misc_device sample to use RegistrationData.

 rust/kernel/miscdevice.rs        |  79 +++++++++++++++++++-------
 rust/kernel/revocable.rs         |   2 +
 rust/kernel/types.rs             |  25 ++++----
 samples/rust/rust_misc_device.rs | 120 ++++++++++++++++++++++++++++++++++++---
 4 files changed, 185 insertions(+), 41 deletions(-)
---
base-commit: a3b2347343e077e81d3c169f32c9b2cb1364f4cc
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

