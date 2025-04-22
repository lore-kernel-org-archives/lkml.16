Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793628540E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325207; cv=none; b=SbNbdF/CggpC3kOspBHUHxtGOHloREfLCBaZlOYhElSw9ZiRfzrOy31g+hjouna4WH2D6jGW29vvF70PvLk6GEqSKE6ozf2dEL6Xmiu9XoGYf9+CyLeskhT5U+F6P40r404m7ILrpLI6GJ6ieP++iae3ypClpOfowAVFsXafTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325207; c=relaxed/simple;
	bh=d1mUj26NDnBUlb5yI5UeZMAIfra5gC1dir4I7AU69g8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uWdB8jS3/NtugGA58Vpy2bEAbSHcumJkNWzDk7tWmldRnL0LHxPCOejzLbCzBwdpUGl1ovZaz/OShohowYFowmtfkTA6ib3vdoeg1idscwFgzePs832hshDz5JwfkER5a2s3FqEFpcKBGKC/6K7Vy82fSMghMWGc2pPoHNfvzEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=c8FZ1xew; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="c8FZ1xew"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301c4850194so3805519a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745325205; x=1745930005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6Yv8dy/LXRtnJqKWqNjItEnP+/tvKHfVuZI65RNG00=;
        b=c8FZ1xewE1CP+hNruVeE3y7urT1QVQrMRr4shvKYTpGsCHwLnmuAUmave/fcYWPs3W
         4/038M5XKiuIUvM2oKY3SJqeiqdZBqElHfA7dD9uLw0bvE/gOwEo/On221HsM7g4byAL
         YmuZUnRvknwpH8b75/OcQedZAD9q7FlBymkWZDqpA46lr6oLoHroF5+Kxm3dGc4LHebA
         N29okKMI7JQVdYiLHMP6tTAZaMnyCexVZgdA3MKW4WKfh/3OgAdIASpZ8hCuP5uwknB3
         +yCx3FdlNOt4+nSYIyAlPw+AXdfXRn1jvQmb9UAm1U+kJnhWcEPcdHU7UKu6ahu0oGrl
         A4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325205; x=1745930005;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6Yv8dy/LXRtnJqKWqNjItEnP+/tvKHfVuZI65RNG00=;
        b=qo0eRzGrwxHPQwREm9yZVnUdr4Ay57DrWRz+9s8TLmtWyweZ0Xhe5BFsxGWLIFUlae
         QL1ZAzGER/K0L7wkqK58SAse7Nfg53/mmX7HjSPg6l9DcRWJg10+GSrz4taNuDhr5BrQ
         7HdvrDIi5qDxoQfs20P8RHDXe5K2hNczyd4UsrJwIMbPDnePKDrljY0rqlgKy/uqOD8B
         I3FZI41Zmt5PRAYybzK5+AyJ39r3i92GEny4OhBzIdxFniQPsie5Qn1mSwu0N4vnwsip
         v3WLK71EX1YXnOXLM399OJQvDWT0FEmBrSAT+5y1FCiQhgEbiyUuVqCVmoqpS/dLEJz4
         pOFg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Q5dqqJTbOkxQI9GQeq5g004vTwdaj3tV/ZVumPsXDhHzI7uVzI1c3kNf4FkqJX4yC0WNNwYPRfSJcQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkbJoiv/HYWsbx6bSOKuE7emQzgfcP8bNXLjRZ01yipUUoE+e
	XW41+diYTZTuFKcZpZZw6ewcaPzmEO0A8oG/w82hUa5GRyi/QdjE7ZHHS7cZxQ==
X-Gm-Gg: ASbGnctoq4r10LJhD52oJohNWsUYB6JyTQpVxTbM9oQWT2y+YqAYsSNEVPTDkp2VJxM
	awjwwbHZpdmu1MMRnDuQynvuIrziT/AuiIMNhhcjsss37IjARPjC6pj/SpReFDUA1WMeN+yHCLz
	y331A1A27OMnWxOulvQDAswPqmJQ73RLRxQoJ/vSXPjHc15tOfgKe5MYAVKkrDl65rMYmd9gZu/
	gxqoXfOVEd22lu/IgeoHZkO4lVhFluh+w6qtA/zGhz5H20NnbJGJtmP+3iKNitTLytD/1ZM3MBu
	vrsbQ7Dnzf2utF2lxgGJtaZw5WXRb4Lbmo/INrCC8CKRmQA=
X-Google-Smtp-Source: AGHT+IGhlup07gPArgxdYxxcGKBkNJ+E/sZ4154y9wVwSq0OQE+qQL+tXZJ7RlM9rOrwBQkGs03u+A==
X-Received: by 2002:a17:90b:4c84:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-3087bb5324cmr25543239a91.9.1745325204674;
        Tue, 22 Apr 2025 05:33:24 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df05025sm8484220a91.13.2025.04.22.05.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 05:33:24 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH 0/2] rust: Add abstractions for applying devicetree
 overlays
Date: Tue, 22 Apr 2025 18:02:08 +0530
Message-Id: <20250422-rust-overlay-abs-v1-0-85779c1b853d@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiMB2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Nz3aLS4hLd/LLUopzESt3EpGJdY7PExGSLJEtzU6NEJaC2gqLUtMw
 KsJHRsbW1AHvymKxiAAAA
X-Change-ID: 20250417-rust-overlay-abs-36aac8b9752a
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=d1mUj26NDnBUlb5yI5UeZMAIfra5gC1dir4I7AU69g8=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBoB4yHl/ushgkYiNpxhNoC50PR4lYX2Xou5FMS1
 4tjMfy7L9KJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaAeMhwAKCRAFzvXHieVa
 dO25D/47ApqBDuJeGAsNb6/gotpiTJx6jBJDfYXmZYBpAyt3qwQMtfiWGEB1lXgoJHEWqPAYZvG
 FzhURrhDesrI78JoWN+MyWOi8bvu92KnC7SwJ6B2dEl6fEjOdE5/mbtDoAomIWQjdrbe5YpWr9q
 0c29qm7WtNAeGEXYuskWnkQSACkd0+wnlwQwZcx0q0E2yWwCDijxLo54JGLns543qHrhflbQkSz
 YSkLiQl8V4P8SIuGPx3hdHV1P5vm/2JnQl2Ik6K7JTRumPJahkJzZHv1FEyXCCF6I9QiMbiC5NB
 tIfgKrKvLCitdddCp3tZV9JaPdXrNGZMTGJ17DI4PpD26XEI1nQKDv7AD2jrcVR8KndbaHCgeY6
 bd21hbnemBGpvAQhM1ZBSbBvu+Izg1XQVxRiT8JoSNOLgqjM1R2HwxuYQDFcEUsyvFiHqPVzHcW
 txbSkuhI4q4xvaw7PcZODVWPnXXttBPeTkLV+GnMVT6GpP6AUXs+PGq8rXEpxEytZopnKn71QJS
 mdcw92fTD0HAforSIDWm3BxHdI0FJok9C/e77Z4kZ2L086UPKWmQHXXwW5+dzGbRX7Jse77EnDC
 HL8YHOt6r9Ec7z6bOehzSZg6AKj4rM3ZZP5BViOXZ+jRh0dkYpE40SbBcZZdmQryHAGuW1HmjX1
 0jEWseGMunOyxVg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The following patch series adds abstractions required to apply
devicetree overlays from Rust code. To see how the bindings look in
usage, see my working tree [0] for a connector driver  I am working on.

Open Questions
***************

1. Should `DeviceNode` be Opaque?

Since this structure is never read/constructed from Rust side, maybe it's
better off as Opaque.

2. Removing overlay on drop

I my usecase (see [0]), I will only ever have 1 active overlay in the
driver, which I will be removing dynamically. So removing overlay on
drop works for it. But maybe there are some usecases I am missing.

3. Only enable bindings when CONFIG_OF_OVERLAY is set?

The kernel header currently seems to provide blank implementations of
these methods when `CONFIG_OF_OVERLAY` is not enabled. But I am not sure
what is rust-for-linux policy here.

[0]: https://github.com/Ayush1325/linux/commits/b4/beagle-cape/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Ayush Singh (2):
      rust: kernel: of: Add DeviceNode abstraction
      rust: kernel: of: Add overlay id abstraction

 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/device.rs           |  5 ++++
 rust/kernel/of.rs               | 53 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250417-rust-overlay-abs-36aac8b9752a

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

