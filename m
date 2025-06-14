Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8D3FFD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894849; cv=none; b=ZXHpjVW/jzNNLvBAZkM6SwydrmO5rmYd6iPO8lscPWQCoIvFCzgF8tN/VDvrpW9UDmgkt3y4UiZecbNlONlv0WNCRVrHs7LdCW/MxI2/hvHjbbYQctCiB4li2m3P9iJlbU8F1KJ4vNLO3Dw8A4RZafnMqpztD74dJJMixUVNbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894849; c=relaxed/simple;
	bh=TlmZ83wY8kxKLeUIXm8/YC1HyeK2sQg8XDLpDRFplLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SB1ydgl7z8+4WXZ+apqsJRCuzGubaw71VmVSNRT/gY/77EembHsCa5Os2xNnPexSlpc/00BKwGKjaDWQq9shaI7z3uA7YKs50EIXLq3a8rRfgIhYG4Ot0Xd9vEFi4iJgQcXquF64V8q4UUBZ9kthCpJJDRQcMjptz+h8Br62XYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct7p7Ud/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct7p7Ud/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so25567375e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894846; x=1750499646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PenxFJtE27socRIdhOPEBBwwmh9KmVwGAq9SQtsUDeo=;
        b=ct7p7Ud//dzU6xhRCk/i9Yry2OwDoSXdHU+cA6twFyNX5TnarkTgWLG3Frzy7FbiT6
         uZW3Qzdf3QB3DmVKkM7SiEL5Ns2dUXNutjSwdATKnuDHD8o8rQoM1xTXA22YjGrwv/u/
         CvO/ZrD++IrWgiGGzjUWscwCscB6xMKu9JP/RAPoE1j5xbQgMgSpjrlTxSdDiP6WU7zy
         VcDDJJkI+YFG5JoYHdt7aYEcX7VeQZHjmiLjc7ysS814kPWMOd9YUtVV+SrWd/dhs54q
         4plCCI+w+BuPQj54nzfgyUy6fnqPHoyd5axFsVd2gcPTN0+Qwc2xRiCtWm/wF05sH8rf
         dbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894846; x=1750499646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PenxFJtE27socRIdhOPEBBwwmh9KmVwGAq9SQtsUDeo=;
        b=iVrdJ2ENXXKzQMhsZDOufvIcKqtobwZOkDmMxT2lAbNDW3/M79KN6tioRXhGYHfQeM
         BxnTpd0aRMi+MTJdfWUrrem6z+Ws7fgfuGxarW2jxPHZuQ4PWeEv1RisRx1so/mzwj8T
         p4QhwuGIzlLgG0FQo7Gyr7HUKyYj+hsHpANBY7wUx5Aom/Iw3gI9oKoKy/X192/Dy2Yj
         Modcn/upM5PIxPFnP+GFqvHUpYKG592p8dkEbePeOIJkZfjta0J9MfhX0efryYi+jyT4
         fJriXexpGVwLfU5+DAnAHwLQgKw2jMGtb4KAwrF6zZHQRbYAyrK6l1lBPZvqWA72bpyZ
         k0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWudy2RRtgZza5mX8vUcTRmzl+a7BMyotbtbjQIBXDfnJn0KR5NGxBZl11Pktrk/yhgXLlwRGF4W0r31YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoiXjua4jEVt23xn/Xdw3YZ1va2oILkFDYO6CmbMFHBm7sj99
	6ja7RIFp5WjYJwvyc2nI2U0C8dh4Nc6PNSmse1tcSn168YPpm0cCRtHPWzki3g==
X-Gm-Gg: ASbGncvUi/UCVOlEQwVfLoiwPQm2loRJAR7HzCEazYxpx0nisldMUJ8+Vie0HwWdQdq
	F62YvtXz02J+Pakcg/8cjdXTLcSbLes0D/fu8e4/6xif5fWdwZR6BXPyqGneXBTJ+dSDQBfRZ6s
	mBhC44E8gv8ytLgit0LSaGTkngKvqLW9b/wZhZkQjBW2cJ8GInMBZ2QeUiEzKmJzhj3K0D7quxd
	t9CDaFKK+2aTNGdSSB8mSlOCyO27S2cjHF0KT8wNXe9kiDZRlE2Dp07BJel5Pcadl7NnH3m7zO1
	aEyAsF+ZCuczDBfQe8MTAdz4ASdZDng6USTnh+ytfenzEVMPIHY9wUVSaCEdvb5xd/ZL6kUTbYF
	bf8mZ8FvyLANPVrGOSD9Zx1u5vrVLJpVAumv+v4ubsFM=
X-Google-Smtp-Source: AGHT+IHxToUdO36hneMLnIaTyAT20FsGtWsA1aQ/74o+tUugwIlgDYIuIBdu3yBzcbtzBESj6t0Tkg==
X-Received: by 2002:a05:600c:a016:b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-4533cac06acmr25611245e9.24.1749894845721;
        Sat, 14 Jun 2025 02:54:05 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:05 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 00/10] Implement mul_u64_u64_div_u64_roundup()
Date: Sat, 14 Jun 2025 10:53:36 +0100
Message-Id: <20250614095346.69130-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
This can be done simply by adding 'divisor - 1' to the 128bit product.
Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
existing code.
Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).

Only x86-64 has an optimsed (asm) version of the function.
That is optimised to avoid the 'add c' when c is known to be zero.
In all other cases the extra code will be noise compared to the software
divide code.

The test module has been upadted to test mul_u64_u64_div_u64_roundup() and
also enhanced it to verify the C division code on x86-64 and the 32bit
division code on 64bit.

Changes for v2:
- Rename the 'divisor' parameter from 'c' to 'd'.
- Add an extra patch to use BUG_ON() to trap zero divisors.
- Remove the last patch that ran the C code on x86-64
  (I've a plan to do that differently).

Changes for v3:
- Replace the BUG_ON() (or panic in the original version) for zero
  divisors with a WARN_ONCE() and return zero.
- Remove the 'pre-multiply' check for small products.
  Completely non-trivial on 32bit systems.
- Use mul_u32_u32() and the new add_u64_u32() to stop gcc generating
  pretty much pessimal code for x86 with lots of register spills.
- Replace the 'bit at a time' divide with one that generates 16 bits
  per iteration on 32bit systems and 32 bits per iteration on 64bit.
  Massively faster, the tests run in under 1/3 the time.

David Laight (10):
  lib: mul_u64_u64_div_u64() rename parameter 'c' to 'd'
  lib: mul_u64_u64_div_u64() Use WARN_ONCE() for divide errors.
  lib: mul_u64_u64_div_u64() simplify check for a 64bit product
  lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
  lib: Add tests for mul_u64_u64_div_u64_roundup()
  lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
  lib: mul_u64_u64_div_u64() optimise multiply on 32bit x86
  lib: mul_u64_u64_div_u64() Separate multiply to a helper for clarity
  lib: mul_u64_u64_div_u64() Optimise the divide code
  lib: test_mul_u64_u64_div_u64: Test the 32bit code on 64bit

 arch/x86/include/asm/div64.h        |  33 ++++-
 include/linux/math64.h              |  56 ++++++++-
 lib/math/div64.c                    | 189 +++++++++++++++++++---------
 lib/math/test_mul_u64_u64_div_u64.c | 187 +++++++++++++++++++--------
 4 files changed, 349 insertions(+), 116 deletions(-)

-- 
2.39.5

