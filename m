Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C31D5CC6
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271371; cv=none; b=YVhvx3J5vN+YZNqcrDBWayysnhJ+9NAoCJlBya447W/Rsi/7Irf0Ifzy3JGa11MZ5pAjh1LNF956pKvC6eZjZ5MYvdzwoXlAXdh4ANR6KRk0Kdld20VSZfBvaGGcH3+GXtn1pXpGCD++Elxwd7DF9UhaWb9u40rQlrBql1JtsFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271371; c=relaxed/simple;
	bh=MeS3BLQPepU6Q5YKScG9gT9nw9PiCD2PnoRhSbQjNs4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QPG6clA7y65/HEybyglvtZEGYfaGIEiX/s/UqhDY2qB+NMmTkLUT5YWosQNFlj3T32cQuaXVl3tLuXc0K5E24da7obq2NgTBwMjiS0QLMZdlYdZl20mdoIf7xGjKyzPXj+xFV3Trw8zWscGaDk+1sv5HQrclml+3OGnjbvHsqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=glzAlW7N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="glzAlW7N"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso18421795e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271368; x=1746876168; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g10XSPgHLOdjLV91DDilUhysjPUWEuAqpKjpDemrB7k=;
        b=glzAlW7NHWyr49WqiAhvhO3VqMpVJQYaVg5CPx2W2zUookzkguCR6nwPNi8tcbEfyU
         2BRZ013v2e4VY3pv8qsVem461TT6HbWZPnYuAuL9PAp3XCfM2XIPfIkfvKD2NGmgOpjk
         ecXt1Whi0UtK4IdyMQwviq8ynBn8lXjymJmA78ZHK8cHTE6b09fBdU0fuC5HQnnb8AKo
         QBNmzvJXeSOpSIeD7UnwOBvEaEMSX5KYo7ovq3ssLKsCUzsd5Fw6DmoYXybnOHC02y+5
         RqyzvLfwoKwQ+ZhfE5tsSCgWaGxb6ZVcdvStE6ri25fARgNJqCGM3uDWFfMVjeRweFct
         v6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271368; x=1746876168;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g10XSPgHLOdjLV91DDilUhysjPUWEuAqpKjpDemrB7k=;
        b=MouR9eCWsNUKsXZSVXGsGubHi+nx90VjXu6YKje+CyrsUkrAVd97+efephLvEV9/DV
         ctQv2YGSZ0RF6P57pz3UHvNL2Eo03xE4vDSHjWoy9uLIOqWENPq1YzH8g3h0/CtYIHM5
         IJVUvc05+QlSpRH9wRDT7y1Q9S/Aay7HfSwukaxba+qkhxsoqTYR+BjozOBaalz8CHhM
         YdF6a3bdVZz3mog9n6wX8oFYhrSLRpWPz1iTpqt1vA664GACil1hC0K3QSmE7RUpo08y
         jnYJmFb0P7UKQFXuVV+V5U2EIx5uo7Md6sA1xyLUQJVjqJeCn/MXUfxHIKD72FYOos2f
         u7Zw==
X-Gm-Message-State: AOJu0YwPqG5nnDMlmDvkOZdwAcz7YYC3jVeGQ1ca0/gytjtNoIZdLMDD
	+3TCIcncxkRY7bpgHsaxxHgg2Nfv7xMFUQqqCO5K7d+oPcy9kX/RF49mHkU6zYwq48IbyQ==
X-Google-Smtp-Source: AGHT+IGS6gc41WjV6YPvRsSPQdPyW4NetHk6qUna9dd3u1qrw83UJK08+9UNNoppy2euDQxSVhPngjde
X-Received: from wmbds22.prod.google.com ([2002:a05:600c:6296:b0:440:58dd:3795])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d1:b0:440:6a37:be30
 with SMTP id 5b1f17b1804b1-441c48ce8d8mr8110115e9.16.1746271368179; Sat, 03
 May 2025 04:22:48 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=ardb@kernel.org;
 h=from:subject; bh=ubkPW3t5PeWznwLH2AP8mn83R+MI2lE8Zn0E3117kbQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0j9MBQ5VoV94LcyxvV/w88bfPnGvT/Naf27+0Nu62m
 pur8Yuxo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkzyRGhhnOXaEhYVd3MH5l
 XDOnbl4h903768vOGdplr2CxfvW9Vojhr3yC8pf/V/o2BbP1n137b5+LSfHN3J393y/l5Aqvuy4 YxgQA
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-5-ardb+git@google.com>
Subject: [PATCH 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move any variables accessed or assigned by the startup code out of BSS,
and into .data, so that we can forbid the use of BSS variables
altogether, by ASSERT()'ing in the linker script that each symbol made
available to the startup code lives before __bss_start in the linker
map.

Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Ard Biesheuvel (3):
  arm64/boot: Move init_pgdir[] into __pi_ namespace
  arm64/boot: Move global CPU override variables out of BSS
  arm64/boot: Disallow BSS exports to startup code

 arch/arm64/include/asm/pgtable.h |  2 -
 arch/arm64/kernel/cpufeature.c   | 22 +++----
 arch/arm64/kernel/image-vars.h   | 68 ++++++++++----------
 arch/arm64/kernel/pi/pi.h        |  1 +
 arch/arm64/kernel/vmlinux.lds.S  |  6 +-
 5 files changed, 51 insertions(+), 48 deletions(-)

-- 
2.49.0.906.g1f30a19c02-goog

