Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25B81E;
	Sun,  4 May 2025 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334813; cv=none; b=gUdAdzIsjFi7+/zzby+A2VCiDhaSXbOFurcs2oy8cUn80h50gFqsd8gDJBrbYdHyM5DvlZV6HpG6sQ2wAh+uR8O/SV3pEzYYV58aazSVHo27BjbGpu6G4Bcx8kY0vbtZ5o1q93AWVpfncQu3YdlJF0Sxo3Tp+Gl2JZhJzhgyMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334813; c=relaxed/simple;
	bh=QY+7yavVCHtLJMt0lDbNynox2WS6qpLllkdUvJMEt/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7yMjhkQkRSJz3fy9skBl4qT6/lW5H+YZOwRQXC5hQfBgV7D72LmPDTcp9txipPYXD4+/4ZbPGB1W2iui1Y7v68g4bmiqictfZRBFOvW1AZvHZS7YrbsrWS2yyu91fbF3RLCx1c+68qe5E4jIjLYmxJfwFlyqFb8d9uSAsQ2/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwnC4Heo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwnC4Heo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3131084b3a.1;
        Sat, 03 May 2025 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334811; x=1746939611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irH8Xym24L82fOWR8hhQ7rAUBy017/0lzmy7hdmSARU=;
        b=iwnC4Heo8ssnFC2AX3e4GuD4b0w1iOkXhZ0txHdvj9oQ4B2erHBve+gf77uxo+ErMc
         ZM0fo20r9D3c5Dz2Ih/geIK6Ad6vdzAOPvm4yr3NJE/JpslbzJyNxoh1T80A5Q2KU51f
         D3vwumSJsmkqIuKqQCrNVo0Uv7vuCyFiMm+DRissXTRS7UplWzBWw9/PuDlF2d+BIJP5
         PNzDz2mm0bKVgvbG+Ia+NUE9uBhgQlQSQsw2Y098wQTU302PUAtYlWSqFx9NMjfr0mdV
         sxkE/UJPK6HDeaUgAY5Kh7ySoT8QmlxKq59OhgMyqU2FH8ltHAVIzHoKPk+IOdFb2VQd
         Wqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334811; x=1746939611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irH8Xym24L82fOWR8hhQ7rAUBy017/0lzmy7hdmSARU=;
        b=JdOIJusZjVu9NcY04AWlLEujHjiOy910M1IraWaNHOHrhpTN0wl+FtJcyl4rhduLsp
         8v/x/EWhHEEumXTo/qNGo2RAHgAm4PCOtXOKcHL8bovrlnm1txAkXPo3YJMKelxIqnFr
         wilpa2tSRs6bipIQmkOPjftInsjBYZc1+WSmUQOmBhZptlEPRMoRi9QIyn8GM1Wo6h9t
         86UW/00Zyjj7Ho+12UZ4GId577Dg9DD5cRpnt1joshy1COYwTU8cvQQh5A5Q8Of01qgH
         MMAOot3DerDDGOz01SzYiZ/KR6gHwBKbDqnUEFRnmJ9fHlY6fTeAd5V+sh8bDObNWyxA
         2B1g==
X-Forwarded-Encrypted: i=1; AJvYcCUU6IvJ9rTDW9dLEvDpyHV0g2YrMBelg/RYQ0gWMPIS3+q0rl9yjQu1aehu03iq5LMyU1fv9ugyPbC3tWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKRqeJXhMZ5521QyQF5Xe0G6ums+Nug9UVwDXeueA/uv37WGR
	ueXMzcH2Ws92aUJiCRNBJRyPGkivwo85CG1BkwnG5eux+n0dLea0xm7GwtBl
X-Gm-Gg: ASbGncsBtmezQx4Mpm2nQ0zvzxvaKVWcHuI1d52y+C3tMuO2SdXgDwh1RU+/YBLEVjb
	/+xakFczEPiZtQcg5VmJNfCcrZprUynt75n6V2HzJpi7sd+5/KdaQIHnU8RinDPNESMOYiwbr1j
	AYgTTeGPt2V86zJFYeKnonJVyR/LoQRpm3HRXYogEfdwvkilbq4SUVnFNxSe+UYONDNtVtdMFrV
	vNIPOZ2DEsSQYBQ5DHcbSYyvLFt11QuVhHuxegpkMvZdxfjUVijlYyyu1R+t4SASWopvNZOOLFb
	LnhKOGtn2jhTd9m3qSm3C5HAOpJsxAxebTDXsh9T2qFSIFBsfZ54RkmsWrN286Qk2bOFaaGBa1i
	SrljlWZmfF2VJnwQTZA==
X-Google-Smtp-Source: AGHT+IG1eGBInTddWgvKB8xXnEItLfXAXdf7lE+tTCbiXc5vGnAIRUS4w3kiTBP1RjIK3mLrRMXGTQ==
X-Received: by 2002:a05:6a21:318b:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-20e9650f43bmr4585569637.18.1746334810834;
        Sat, 03 May 2025 22:00:10 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:10 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] rust: time: Convert hrtimer to use Instant and Delta
Date: Sun,  4 May 2025 13:59:53 +0900
Message-ID: <20250504045959.238068-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert hrtimer to use `Instant` and `Delta`; remove the use of
`Ktime` from the hrtimer code, which was originally introduced as a
temporary workaround.

hrtimer uses either an `Instant` or a `Delta` as its expiration value,
depending on the mode specified at creation time. This patchset
replaces `HrTimerMode` enum with a trait-based abstraction and
associates each mode with either an `Instant` or a `Delta`. By
leveraging Rust's type system, this change enables `HrTimer` to be
statically associated with a specific `HrTimerMode`, the corresponding
`Instant` or `Delta`, and a `ClockSource`.

The `impl_has_hr_timer` macro is extended to allow specifying the
`HrTimerMode`. In the following example, it guarantees that the
`start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
`Delta` or an `Instant` with a different clock source will result in a
compile-time error:

struct Foo {
    #[pin]
    timer: HrTimer<Self>,

}

impl_has_hr_timer! {
    impl HasHrTimer<Self> for Foo {
        mode = AbsoluteMode<Monotonic>,
        self.timer
    }
}

This design eliminates runtime mismatches between expires types and
clock sources, and enables stronger type-level guarantees throughout
hrtimer.

This patchset can be applied on top of the typed clock sources patchset:

https://lore.kernel.org/lkml/20250504042436.237756-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (5):
  rust: time: Change Delta methods to take &self instead of self
  rust: timer: Replace HrTimerMode enum with trait-based mode types
  rust: time: Add HrTimerExpires trait
  rust: time: Make HasHrTimer generic over HrTimerMode
  rust: time: Remove Ktime in hrtimer

 rust/kernel/time.rs                 |  15 +-
 rust/kernel/time/hrtimer.rs         | 288 ++++++++++++++++++----------
 rust/kernel/time/hrtimer/arc.rs     |   8 +-
 rust/kernel/time/hrtimer/pin.rs     |   8 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   8 +-
 rust/kernel/time/hrtimer/tbox.rs    |   8 +-
 6 files changed, 225 insertions(+), 110 deletions(-)


base-commit: 7b33a2d9c12023a73b7ba105a3eed77c3527a94e
-- 
2.43.0

