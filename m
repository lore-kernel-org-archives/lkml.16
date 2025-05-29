Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBEE242905
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490186; cv=none; b=uNfWoBB+x6Ya3gIWOSnWel615FQk1ofV+mDT+rSyZkFByWIziIbCcmUcaLu65Fk/t/FlNs5/n1oqEotSrojMxTeOlj/3/R3QoxZ/qrPOhipndX6VHsuEznOScrb2EtzitD/QdyzT4OoNy/ViVLWVs+QxZmANvTOvNlmIey4JbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490186; c=relaxed/simple;
	bh=583QTW0Fgm57f0V2KbAG1+o2/IZEzHAon91F9qSda7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=crf82X4X8UWDJGh+zww97cvLX2G1oU9kzZ+eDcZOGIwhqpRwvDupVd9f2ckpzK+CwFqjSj5clHAYGFc3ArSVq7QVXMc55iyVmpgJ2XiOC55HKMdeSiCe95cK/Ea/jtuWD2qnK4xotsB72gxU16FUxZm8s9y64QWhwpS9hz8UjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=cXTvg55P; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cXTvg55P"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-23211e62204so4072915ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490183; x=1749094983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+X6gW7XSHlHgq3Y8KWFL+6OXGY/o9qJGU4UY1R8oD6I=;
        b=cXTvg55P9mc6Eav/ojd26ZmFyivUGKzgL+To6TIaKlG4zuIR1PBBy5wGbwFnH9Dov6
         fa3I3PI09a3bc56ZvTMXKh8f8RB7wHUuORRj27d2AbAZ+wJDk286/HcyqAx5IjfO3GFr
         YtZPc/cguLTxrKfywuBzBZdCaLMJvO1Hq1osBOgkH2DmXGp0q/QeedudmE1NZ4kprLCx
         4qHGqN1mCHAlQrS8h68KcARI+ryRAXX0iUxiV2IXqGiMND8fWhBs9bzpDMeeke0mIYVM
         ess1vFVk5/lBKu3yP4StBjnTvmXTmdF9YyJYkLEAGA/wjUBD/3M5SgWvCiV+di7EU5So
         CPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490183; x=1749094983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X6gW7XSHlHgq3Y8KWFL+6OXGY/o9qJGU4UY1R8oD6I=;
        b=SREHLpZZDzAZaC6cG7fKTcL096sBUfuKJlfWUUGX47/wfwAIHV8Fw76Hl/gXYtzAcE
         UTX3zo/TnTsg+NMEnOEHYiRe7fYMREUegF8QkPFfZhBypsfcOsSCsQkSxOiVNjIBdKcf
         qzw7CZ/BJgneEcliBsaX0RnrgN6fLX8IMdSG0Qn77+AQY/xg/wlLT1GXt0w8tbtUvTby
         n6uRnG3ZVonOtVpk82MUZt/dTRTfCRVb8HWiNG5qte9u+lbeC3x6EgDMJidTwVTq2Eis
         q9f6PhqfYSLQt/b9o1/u390qZgfPN1yWJgD7ONsScv20pyoIWI9IGlmbVtkRzHf5EJiZ
         tgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWKvpxzKnTLW6aqo8J4lfntycDEilCklweDZm4lIzdr8KwxcxvHEnnKKADRljrAQa2rFCmc6KgV6hAbf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQ36R6bAvRSPmT+y9Dgn8I3TNatnOQbgtD/MHKPe1l8M9+LKs
	9cBFegrUbx/zfNFeH+BKShimHwoiMHN0ZUGURXdq4BmPxeMsaLAlMpN4hLpBuYm2b+c=
X-Gm-Gg: ASbGnctrOT4EpD7MlDbr1SeS8ua3kppKzICGvpUq2N5qEeaYpir5Sjw6CU6C2Zf3Wls
	EjlXX/8VZnPWudndXndQ+UbvLtTYhJ7/lqpL2rMlci/fcrUtgsCAvzI3dtM5ujyTNQgpSQBZd3N
	v1yeU1A4Z6BBxs2CBMzjXSND3sCzII69zzQ6Tlph8ydtPJbkvLkB/FvIpsrs6BCzFXPOe6ryPyV
	/hCj4pBEU9J3E9/rlUDr8X/JugOlSM1u+Oub7n2YImemYwL7r5ygtswW39d7FQ//3Bkw3hEo0A/
	C+by3+PcIzq/zxDat7w4/ItAC7eYLx9ZYQtprJtYuillBMIL4JfQmYX5xTCRDE1doJsPTlY1HWi
	Ie2J1Xk+/m5lJ
X-Google-Smtp-Source: AGHT+IHA3e/MRESokLCrydvndZOnsgaMOwqENguhDl4BUycTQp0cNyR7aJWgCKVR4frkoE+M51f0yQ==
X-Received: by 2002:a17:903:1c4:b0:234:9374:cfae with SMTP id d9443c01a7336-23507ff8707mr9917715ad.19.1748490183135;
        Wed, 28 May 2025 20:43:03 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:00 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v15 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Thu, 29 May 2025 11:53:38 +0800
Message-Id: <20250529035341.51736-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the circuit diagram of User LEDs - RGB described in the
manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual[2].

The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period.
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to the driver.

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Updated patches: 2
New patches: 0
Unchanged patches: 0

Changes in v15:
- Squashed patch 2 and 5 to combine algorithm changes with related comments
- Squashed patch 3 and 4 to unify rounding logic and idempotency fix

Changed in v14:
 - Change `frac` from `u32` to `u64` and cast the constant in `min()` to
   `u64`  so that `do_div(frac, state->period)` no longer triggers type-mismatch

Changed in v13:
 - Fix syntax error: Added missing closing parenthesis in do_div()
   function call.

Changed in v12:
 - Replace division with do_div() to fix __udivdi3 modpost error.

Changed in v11:
 - Fix rounding consistency in apply() and get_state()
 - Add code comments to help clarify Reference Manual errors.

Changed in v10:
 - Add 'inactive' variable in apply() to match pwm_sifive_get_state()
   style
 - Update comment about hardware limitation - it cannot generate 0% duty
   cycle rather than 100% duty cycle

Changed in v9:
 - Fix commit message to adhere to 75 columns rule.
 - Update commit message's subject.
 - Add a variable for inactive logic.

Changed in v8:
 - Fix Signed-off-by and Co-developed-by typo.

Changed in v7:
 - Remove active-low strings from hifive-unleashed-a00.dts file.

Changed in v6:
 - Separate the idempotent test bug fixes into a new patch.
 - Move the reversing the duty before the line checking
   state->enabled.
 - Fix the algorithm and change it to take the minimum value first and
   then reverse it.

Changed in v5:
 - Add the updates to the PWM algorithm based on version 2 back in.
 - Replace div64_ul with DIV_ROUND_UP_ULL to correct the error in the
   period value of the idempotent test in pwm_apply_state_debug.

Changed in v4:
 - Remove previous updates to the PWM algorithm.

Changed in v3:
 - Convert the reference link to standard link.
 - Move the inverted function before taking the minimum value.
 - Change polarity check condition(high and low).
 - Pick the biggest period length possible that is not bigger than the
   requested period.

Changed in v2:
 - Convert the reference link to standard link.
 - Fix typo: s/sifive unmatched:/sifive: unmatched:/.
 - Remove active-low from hifive-unleashed-a00.dts.
 - Include this reference link in the dts and pwm commit messages.

Nylon Chen (5):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function
  pwm: sifive: Fix rounding issues in apply and get_state functions
  pwm: sifive: clarify inverted compare logic in comments

 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 12 ++---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 12 ++---
 drivers/pwm/pwm-sifive.c                      | 52 ++++++++++++++-----
 3 files changed, 47 insertions(+), 29 deletions(-)

-- 
2.34.1

