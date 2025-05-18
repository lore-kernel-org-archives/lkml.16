Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA179881E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747549944; cv=none; b=TE1gY3JokIbxrTMKwMx0VWq+jT6T3idhhIxM642YhVQdssRH4YUamBkneurCxAcOjiPpicY9qyM/dVEfgJMwfVHdFbkDpM6GVYUM+xMyZF2q1aTzXR3QSvtXj9MRqp9M2T550iBDRgONBm2o015v+WKPUKhT2fJsHD1E2b2MphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747549944; c=relaxed/simple;
	bh=k7e232aRXBYnLIidA4C1W6sTVW1tyPAB4FFr/gmyPl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCQEG63sKIlKqYgnrbYjTMnXLDdtCrmXZGu0qDijTgIBCKLVOcG0qTiHj8E6uBRVj/ISWRKfNnHunW+stMzv0dCuGJzzizrrcY4LE5/F9rne6eQHlhXJEjTfYSwooAamAPUUtDBoEBWTKUExaKC4FzcznGWN2XZj5lSX9Otqcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=StQl3kXn reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="StQl3kXn"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3da7d0d7d58so26332995ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 23:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747549942; x=1748154742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwP48AH0f+VzkpR044SBe5hj4tEB/4qffvp665GiJdI=;
        b=StQl3kXnZecP1Yh4PJyQXbDqdsKBvk8LZNxvhqhlgTqm5V9E3Uqcx2VoKcHdPqDKLc
         LQgCLAkOI54zZ8AkOUNHz5+FgHE76DyIfc5EmIMdMGhNkRQNJcaLR5xeYpkyfiFQ9JJ7
         YrALxyO+l6gm7zlvIKxNCr3J9+MJeKclOCJ4Gh/fjfMBolagwwlyEcCfEmm7LDCzGohs
         yAEmj3p0fEZPABOL+S5vcC1sy47aK+edikphDfVKi1/THPmiOmyNp9MrO+FnyEuEZu3f
         MATZ7DlbRiXXV1GYbZaAwzUUQCPTZMhXqqJEGyVJzcyyIF9XB0yqKLyhBZhMnjRfbpfe
         9Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747549942; x=1748154742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwP48AH0f+VzkpR044SBe5hj4tEB/4qffvp665GiJdI=;
        b=n7tcnVOaKOZOw3Z6Bodbz/jdzVA2tibojMRq6lJrVnFM7uudGOLsT5ktIE3S+eMYIx
         hVp/ZZGk9WDx0+svwFGmczqsrAOYdLARMvz0F+Xjk3Zws2UqsNoiFZJH5x9gWbsy8DEH
         UAcQuSPERa0gcJpX0gwJ3mJeHBa2cZlQLinc20BY4znsi3xA5TinIQwpsDngeyQvImuk
         5nyntuRQS8dUzVy/SSffUDIs5CKxz28lZLD30fUfpmp+UFttSQFQeGdKDUKf6iSJcbCx
         3DOhnsMQIzVBKpRzSSzBELkvcczIUsXlRNokCK0uYG+o8dE9Z/4SWUUC2DBUBC7nx3dn
         PwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1eYn02AtEAQs1oV/51vKWZs98To0gjjMZ77vt6sIcNYlfoY+Nt79t8OSSAXSMA4K6TfF4sadbHyqgkpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtnxKSQLRcGDVe/NrRJ+4Z4RLyfvbfo8/0wwOyzsjg0SbFGu6
	lfG6y4pFBsVx+7s2PVMbiRHiDztJROrbRqqh+JU5RfEniUSnnxIacw0ftnkRap/gx7U=
X-Gm-Gg: ASbGncsV2La1IBBSUatQ+/XQHjEMBpLumqiWl/Ze/xGx3We9vk66asKXGUqloAf32sN
	Qh6GrwbljZgH/fyqC+ayFsZkS0+t+bxsLZ5tfZXtD13zXaXi6jAnMGpaS7aIIJaM6dyaYAw9oK4
	RsMJUM8BkjT9vW2wzlHaySbKXqYHDDxxjZk+ubzBjJmj6pwTzcqLouh30iBp1qUoKoMatq0YYZc
	Q67ZxWkNSAkfLCCmUK7gfY/qMQZVRTViHBbTf6c5HVf7lgChUbwBmI32ypKIl1NOni4/Djzez3y
	7OvxrqX47hjNrG6TEWSL/YnRC0T5++d6vJivOosuZc2lv/fPH3+CKCvLUAQLjmwkYfp+hqqxgdG
	Ge7gMG0k=
X-Google-Smtp-Source: AGHT+IEJnu7rOfOWw165nj2xc2++BeA1tyNcutxhMIII9tv0OpltHssTeqXnkk3yhpYX2DQ5ZUgMnQ==
X-Received: by 2002:a05:6e02:330c:b0:3db:839d:7b36 with SMTP id e9e14a558f8ab-3db857bc504mr89067845ab.21.1747549941790;
        Sat, 17 May 2025 23:32:21 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc61e15b2csm4945525ab.58.2025.05.17.23.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 23:32:20 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] kselftest: x86: Improve MOV SS test result message
Date: Sun, 18 May 2025 00:30:26 -0600
Message-ID: <20250518063025.1467672-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently, this test completes successfully when it completes execution
without either causing a kernel panic or being killed by the kernel.
This new test result message is more descriptive and grammatically
correct.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

