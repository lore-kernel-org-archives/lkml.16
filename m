Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08347264638;
	Tue, 10 Jun 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587283; cv=none; b=ojvsCmVfbEYME0JL5AYN5qmMZmylR1AsMvEcufwrdcF0GDOc6h4oeAQvVhUMWo6iTDjRkn7SzQywcUASPLrdcE7XbPwHwDyWugTNQOoTF0v9EeQK2tXkMCsyd5B0Cf5nWhOXEwXCFLbe8HkdfH/BU9MS8noN6SUZU3EZNJL6g6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587283; c=relaxed/simple;
	bh=OqkjsE/LqheZo0eeLbdYgZQ5VTogm33rnK3E5UYdBmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j6s/fUXC3K83kY4NQEGhU65ys/IPFb+q6lY+qdy/Nqk81yLMDPzGIcgeMk8u84EbQksbPMQkN33eu5WD+zWrn8Vsgmq+FdmlhH6T6us4zNtBFe7p5N4bCA2Ab02eBfp3SMtwX4HTtSNuWBa690fi/XfoA4azQLClOg0d4MLkYFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYtsxMNg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYtsxMNg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so11574895a12.3;
        Tue, 10 Jun 2025 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749587280; x=1750192080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECz7BsNxN0V2sRStdYiJGvZu1hKC9kmBDIPLidciKcU=;
        b=hYtsxMNgu9B73C5JD1/X9XdQiCM2RtfPgmrVpWRPoM1smjQ7EKKGdzOAT1i+dKGm2S
         JdtFkDSYL1nXwZQi+lE1nqSnJtZU7THkunuwPYPgJK1+rt4ZY1mxFF+3ZQoFgmWbaDOl
         60HyYaZRxgm/hhtQbSKNgzjQHLPUCMRD+CqNEVMs4ZyJq3bFQWr5PjceRTnFgKgu81EU
         L8gm0O23fV+Fo7LctWxwqb1bjUu8pfR5D3anqDzicpeOqCrb37UuNn7LjpK+5pbYr1DG
         WJfXTzbf1aYGwDu7GWb3CZU7wMvOs5v9tIuuliwQ0D/ST66GPRZchQFZqH+BH8mLHaEK
         X5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749587280; x=1750192080;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECz7BsNxN0V2sRStdYiJGvZu1hKC9kmBDIPLidciKcU=;
        b=FYiMI+p19+FhSNU6gVpUUXR+HiGKrAhkJlkDTI/+UCymKh88eMf25O+qOBsTOtJ8Vz
         nsUwrguGs0xDKkhPrecSfFZ+7LrBSMPZoQweq6M90smr752Soj8YB8xlPbcZB1JAkZYK
         eW2oEaTWhVn9BhDb2iYSwxvwhl45i1BYeBZVGy4wuNSFS+qbJ3JJunRRPPGix0Me2Juk
         SKYnYmRzv+iZyK4S7p8do+v88xYj9+WtoEcYuzKI83vAQxU1Z0X4iCwUqnMI1Xn40TCl
         zJjf0Y4qQRng2963hLP48R80HQNs8YOBLzOWU5PzMCSCRImxrHChqL4TOrF0WW/yWg/w
         wnXw==
X-Forwarded-Encrypted: i=1; AJvYcCUOkRJTG0ofmJfDqb5rUwW84Zo8FyjK0TPMvQj3AVjR/5snCFUDjQD4NlIJvNU7/IWZeEJfgizf8ipbcgUEGfs=@vger.kernel.org, AJvYcCUeHdPjBs0x5kxuMc8AIemhW52vIn38PYg2ZMDsFU62njmj636uUro4JjkybM6kbq/Fg8ELwK2dGx45zYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQV/e/ixsPBtqcVQ/FYzCr7gg68cvoyAAFJxmBqE2dDpECtWFi
	EkhTr3Oee/rj9AKNB4czjdfLTW4ULtSJRELVQaOXiPA5zpg9JEuV2A01
X-Gm-Gg: ASbGncvTXWReVGj7CqRv3Gi2KdR4wnFZwHCXM/ZVeqDP8+H/ODLVaEEkqTd864SLPMV
	FIKuRKFdkia5PKLp0X8gClHyqJ7YV0IrkHOJiM6O01g3/r8LUaTcZzFN2GzW/PQ4W4Wd7P5j5YU
	988Cyz4kPWsjqMCVgL2GcWHPVD/wkPDBSkmCY+PWG4VKxrLr8W6bgR3dzBL+eRQ7XaUf5p0Cjjl
	b7X/+VCoi2nN/pUEvVruDsmWQKc99jAW3V35XJABfyiZJ7ODUBs1j1ZETkXPsLrl8y2VN4Zl434
	rFHnwymkZ4O6gUr6lYXeLIGTJdLTePpEaDqFI0pc3XZsXIXZseH3MT1Vt9aGwTMs2Y9yI1k=
X-Google-Smtp-Source: AGHT+IEf35HlaDct8byrol0fa/1eNaGI/mSo9CVCCECl+Lw+54hcBiG3P8ZTbXIYa+nDrU/V/hBO2w==
X-Received: by 2002:a05:6402:2695:b0:607:edbb:4bbb with SMTP id 4fb4d7f45d1cf-60846cafc84mr519865a12.28.1749587280174;
        Tue, 10 Jun 2025 13:28:00 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-607783e67efsm6552678a12.78.2025.06.10.13.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:27:59 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v6 0/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Date: Tue, 10 Jun 2025 22:27:54 +0200
Message-Id: <20250610-b4-rust_miscdevice_registrationdata-v6-0-b03f5dfce998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqVSGgC/5XSUWvDIBAH8K9SfJ4jaoy2T/seYxT1zlRYmk1t2
 Cj57rt2g4Y8ZS/CX7zfHZxXVjAnLOywu7KMUyppPFPonnYsnNy5R56AMpON1I0Qe+5bni+lHod
 UAlBBwGPGPpWaXaVacNVxJwRYC8FL2zKSPjLG9HXv8vpG+UTPx/x9bzqJ2+3//EnwhiP4KCwA6
 hhe+sGl9+cwDuzmT3JhKrHNlGRqa6PALkTncW2qh6mF2WYqMgN4pVBKC8qszXZhqmab2ZIJSij
 nIhjU+7WpH2bXbJxTk+mN8dob5+hcmvPvAjN+Xuh31L8tzvMP5PmylTsCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749587279; l=3859;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=OqkjsE/LqheZo0eeLbdYgZQ5VTogm33rnK3E5UYdBmU=;
 b=LT3NdLyIarnfKYo0ASbG1aFu3G1HEeblsjHC1xd7XXUGE/IReaBm1MSpXTXrpYe8jn2RwnSQY
 etbZj3BlYMoDbLGlYAu41AVQtmKLNKON8LZeC+okltv+IFYsDYj9Ozs
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

This patch series is based on the v6.16-rc1 tag.

Link: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/  [0]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814 [1]

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v6:
- add `Send` bounds required to use `assert_send`
- rebase on-top of v6.16-rc1
- added missing newline before `impl Wrapper..`
- Link to v5: https://lore.kernel.org/r/20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com

Changes in v5:
- Remove repr(C) and PhantomData (Benno)
- Rename `RegistrationData` to just `Data` (Benno)
- Add bound `Data: Send` bound to `impl Send for
    MiscDeviceRegistration` (Benno)
- Add safety comment about `MiscDeviceRegistration: Send` requirement
- Add Invariants to `MiscDeviceRegistration` (Benno)
- Slightly reword safety comment in drop.
- Removed spurious newline changes in sample (Benno)
- Removed spurious typo fix (Miguel)
- Add Alice's Reviewed-by from v3.
- Link to v4: https://lore.kernel.org/r/20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com

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
      rust: miscdevice: add additional data to `MiscDeviceRegistration`
      rust: miscdevice: adjust the `rust_misc_device` sample to use `Data`.

 rust/kernel/miscdevice.rs        | 104 ++++++++++++++++++++++++++---------
 rust/kernel/revocable.rs         |   2 +
 rust/kernel/types.rs             |  26 +++++----
 samples/rust/rust_misc_device.rs | 116 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 205 insertions(+), 43 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

