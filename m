Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F71EB1B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621782; cv=none; b=fzrirtkyZH5dB9/LyQvo+EYvobtm7CPCa0qEVjVxD91Wvc+3l9UmOf4OIk9q25yN6+tqNDOvG24FCzhmMNRKn2NVW2pNNuzbIkhvDiO30NvomggWGec7+DIQpaUNquNUORyItfCGGbcnuB0kTGcoaIyGdH2FjO89aVNTgwUawoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621782; c=relaxed/simple;
	bh=ljKOGDNIoGIYXjjrmExu3/2eCFL5hJ0e/kaT7Y/A0lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U0wUwU7y8bbOa8nhHZwj5ZzzOE9JlJYSGyoK2uIkoSiZK0qcyuWro3HffGFNNTW6GEREBU0QBUzvVu5qvU70f+s0hhGcS4M3KfEdPvXeJLXoBBfGdULQkkDs62SeKz58bOAw3NGwXhooHDHqQULcA1BSD2LosH6gGbn5MzDHmQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so313070a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621779; x=1744226579;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6EhU/9t2oF0mJIZOkkWFSnPLwKyGMReGziz75LxHrE=;
        b=ST5kdPZiFEKfFQBGxvlfoPhXPnW5gS5w1Q4xXipKpgS0U9g+Qz/Ajd9R0gxvBKFcP3
         E2i7vfMoS+8d1Tq5JJlR7OsOfwHsnt2xYR5u4L3L8K0ZQDvZxjLlRoT9/wsM/pbOChkR
         k5rct2sxDWhNcc3opag+NM+/tcFHJqIv6r0Zi7tbzB+70impEyrqkU5bTVLQqnnTNqXv
         736Bse4hRfCnPXMFKZQtT96ELz2O1RtqcUjc3fhZvCOH3Zs1McwBGBV9pShDPFBwc9tu
         1bH/z9rihhj+JxohN8lsmGwiHy2chUCVbUQ9y/pARy1JFYPE8HLmJvX2AAhEH28T49b6
         KUEw==
X-Forwarded-Encrypted: i=1; AJvYcCV+gK6OcOzvg4YB9h5V7GlbqXQdvq7UrMIUdGocrpRgZUvBoTuHVYbnPUFuJ6OUzS93Yq4Lwy3mG8AGLtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8yuGVPKa1BWQ60SokCbMnPLJilbzCfY+YNqa1rsT346gB84c
	WyO+ODkv4iGbaWTyIG06R3Zyaev4MwaTCnHdsDx0rU9yM5nEJ/3B
X-Gm-Gg: ASbGncvFT/V+YDdeq5aNIEjz50h/PmNLNoJ7ssS6u6oiDsl6pRfizNcDq8w4JsEJDYR
	BAXdZXwpWKdNCi7jjLxGZbK931x3VOBDDKbQnUyNLHXABQZI93Lu2KcY99QN0I5jJd8Qvttetql
	FSHSOJANz5Eu5tSt9vnou0c81lkwp52ZsG1bkf2/8i/ieGHimfyJplY8c9SGj7Rd1hr92mNONg2
	rIW6Tv9bXiciHKFU9yBy3H6yTmwdQINHi0Z3wevj9s0yyxvEPLgnNeA5X03ONlTQaLKaaAFsv+S
	u1Oi3hJjlPJKZNvc+WiNmY5Ka0g5HfOKfOjl
X-Google-Smtp-Source: AGHT+IEXs3QvvTarAPqvu5hZjvcXf2QeKhj0SNg+fmdUNOq6Y4HUDyeEp9v+k2i3CObdo6T+vIXudQ==
X-Received: by 2002:a05:6402:26cb:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5edfceaa4b4mr15696652a12.13.1743621778206;
        Wed, 02 Apr 2025 12:22:58 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm8949262a12.44.2025.04.02.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:22:57 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Wed, 02 Apr 2025 12:22:47 -0700
Subject: [PATCH RFC] arm64: vdso: Use __arch_counter_get_cntvct()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-arm-vdso-v1-1-2e7a12d75107@debian.org>
X-B4-Tracking: v=1; b=H4sIAIaO7WcC/x3MOwqAMBAFwKssrzawRi1MK3gAW7HQuOoWfkggC
 OLdBecA8yBKUIlw9CBI0qjnAUd5RvDbeKxidIYjWLYVl2zNGHaT5ngaX07s66WoCmZkhCvIovd
 f9ejaBsP7ftQLfo1fAAAA
X-Change-ID: 20250402-arm-vdso-c4b0c9f35300
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 arnd@arndb.de, kernel-team@meta.com, vincenzo.frascino@arm.com, 
 maz@kernel.org, anders.roxell@linaro.org, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=leitao@debian.org;
 h=from:subject:message-id; bh=ljKOGDNIoGIYXjjrmExu3/2eCFL5hJ0e/kaT7Y/A0lc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBn7Y6QmPWVYqn8sXqLtXJY6ddJzmHk5lG7gS9qQ
 25fb0TT+eKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ+2OkAAKCRA1o5Of/Hh3
 bdN8D/90tSUXwFJX/AQtgyjEV3xiUwShqy9MVfqcdiPe1zBo9wMj6mRZvZZzMmgBhtblBUuCg7R
 tf7oy8x6jIR5AN5rSVbi4/DFu8swmXKw+23KBdpDSsyqdQ74VC7qMjErh4P0fykSXs8H4zfTAjo
 BU60s/JAuQrHLK0cGVxDG0zDIY3OfCz4DM901rWHUzbMLT+nfyM4EpdwNjEcZAv/x4YBsEMdjE7
 lwAmYmnN940wov9Do2+8AuSbsvASMq/c860JiE9U6n0tqzI6hcdwIPjgIclnHQplM6Wt9WaSO45
 2g9g3Cw2nSsuN/kUaiKvfewKcOWh+QDN/3FyNr/l9lpbWbRedYLQCO+jC9sWIYa9sM1fSiEUzTz
 TU4DVgMPVRGvB57SHK3o4RO7gcS5yR41JIsMLIwbkBuzRtbXrrw4j1ohQUoFYFQ7D8Z6rCCpES5
 5DizLWUUgtoLRliodczaZUnFxt+wj9DiBAOAUeImpdW3Ytfsz3jNaOPqAS6Elz3SFdy7gWcXmS6
 RLqUU+5HMu04IbVno0mRBO/mNvs98ZoyrR+JN1nCd1CPFesQyOoKdTcUEWcOe6efBZqc0se/DSl
 70u2VCfxtGsWZNJk7KM6KoSv9bmR7tlmR4KBVNtbimgx+q6qZRefyqDCSVQBdKkwVjchJr8Kmn5
 pfI+oVMonLe+UcQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

While reading how `cntvct_el0` was read in the kernel, I found that
__arch_get_hw_counter() is doing something very similar to what
__arch_counter_get_cntvct() is already doing.

Use the existing __arch_counter_get_cntvct() function instead of
duplicating similar inline assembly code in __arch_get_hw_counter().

Both functions were performing nearly identical operations to read the
cntvct_el0 register. The only difference was that
__arch_get_hw_counter() included a memory clobber in its inline
assembly, which appears unnecessary in this context.

This change simplifies the code by eliminating duplicate functionality
and improves maintainability by centralizing the counter access logic in
a single implementation.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
I'm sharing this code as an RFC since I'm not intimately familiar with
different arm platforms, and I want to double-check that I haven't
missed anything subtle.
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df..417b5b41b877d 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/sysreg.h>
+#include <asm/arch_timer.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
@@ -69,8 +70,6 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_time_data *vd)
 {
-	u64 res;
-
 	/*
 	 * Core checks for mode already, so this raced against a concurrent
 	 * update. Return something. Core will do another round and then
@@ -79,24 +78,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	if (clock_mode == VDSO_CLOCKMODE_NONE)
 		return 0;
 
-	/*
-	 * If FEAT_ECV is available, use the self-synchronizing counter.
-	 * Otherwise the isb is required to prevent that the counter value
-	 * is speculated.
-	*/
-	asm volatile(
-	ALTERNATIVE("isb\n"
-		    "mrs %0, cntvct_el0",
-		    "nop\n"
-		    __mrs_s("%0", SYS_CNTVCTSS_EL0),
-		    ARM64_HAS_ECV)
-	: "=r" (res)
-	:
-	: "memory");
-
-	arch_counter_enforce_ordering(res);
-
-	return res;
+	return __arch_counter_get_cntvct();
 }
 
 #endif /* !__ASSEMBLY__ */

---
base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
change-id: 20250402-arm-vdso-c4b0c9f35300

Best regards,
-- 
Breno Leitao <leitao@debian.org>

