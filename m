Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9B20B7EC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316467; cv=none; b=bTcySelPpLFlOCQVHywZJQxNdBcTuspaECWD7J8zA6ndrkDIGkD0TCa2ZVGDZLzUNor9OQA7jsl7tSnn5tfgmf3kkc+4o0ga1c77CCT4sDHQbm2RXW+KYu1Cf/vApCVaa5VslxDdwLJJejiqXEkktvG5aCPe+6NtJKPZemB02tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316467; c=relaxed/simple;
	bh=1fR0dH0RintstbFqdmCL2UAT0LsEVGuHzSa6RyPdsaw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tAvf4oP/Njq36eTYS+wTqh/FVFi0QykuY1U7QRn2c7SoeqcZg5QcOliJooGNF60KRPqFhTPG+T3hRv5AJACHYiPhx150TtbUe8k7LC5ZQ1qXQMM+ZnC/6dgRYs0AfTM6/Mw6+QXzS2Ci7E8w+hWKNddZvZVmLNztrR4PDLuH6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QdLxnP2X; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QdLxnP2X"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a064c45effso157854f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745316464; x=1745921264; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QDftWqKzBlMt8XCi/V/Dahfsag84zMOHOMka9GDde+A=;
        b=QdLxnP2XUueIscvv9E79caySR/LwTN6e/6i+86LKzHZSh7PUMhFZlSQYNyiIg3glGK
         DoMkFNOBQCW5SiAhPHVUHwZAzU8+jxhopQUXOOUw5AYuYwp4ar0QQr68A7GiT3o4VlGx
         TlEBdm2w96LV3V5+HN8i2/GTVwUVR4D9d/gxCTFqYC63wVD1LUMeddLoQqSAyph8AraF
         tD1wFxh38W8CgPsAanzco9tKWgzwvGPsC/kW+lyFcsgbUoOzGwCFA9upod7idiY7KAvO
         gDyYW8lIGsxYuVID9q7PjfKQHPv3ND7kxMCeUNMHhHD0msPr54aFpC5lB8hJ2EZ7yWLL
         EPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316464; x=1745921264;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDftWqKzBlMt8XCi/V/Dahfsag84zMOHOMka9GDde+A=;
        b=mWMgIkLhhHln9VoDYx3/+oaINPO5FeQoGgfntnWshobcvYcddW3KL5h9/6zExaAjPD
         LCGGTEd7TvHb7RTbq6IeOyISiXt6lB9PLujB+BNH8DyQkwOc5+VssusfOaB2j8ANJkIO
         aOPNrvBe1DyeS31YDvoIrJKrTTs/8ZQ3fV0/ZspeINPnQIjdG/AuFI4cZU3Uu2hHU1V7
         APf+bLIkzDuLlGex4JRYNF/iIRoY9IrdfX02/kcS4nDaEwtZYeHBMLD0EZrwqCjwPtAJ
         dODFq0lQKkNJb4vRW+K8ouLXdkKo8grcGt5vfFY+H/KkY5nFoTSjGe6An2M7DEMkAtH9
         JyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLwNDZH82aflQf/l7vA3NPKTws/mVGb1UOGqkB6jujJEeRSi68hM0kNI7zojebZrtbKgk4Bwgz+zO9Y3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQWRAXUkR33wvsY8tb/A5W9sGBHqDGKA6P6f81vGgtFswlurc
	UEkZazqeEgQnNBo5J2JJRy21/uQOCAqkJ06iRvM+Jy6BDGXu69EpeXVBJQgvWsz6/yXFXw==
X-Google-Smtp-Source: AGHT+IGebj0qNJk2EemHV9syWL6Bji6qtR5p43PHcYDuuG3MkT7auWDh6gJqd2jdVjcHGKOREjTkWg5Y
X-Received: from wruo4.prod.google.com ([2002:a5d:6704:0:b0:39d:7be5:b8fa])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1862:b0:39e:f9e8:d07d
 with SMTP id ffacd0b85a97d-39efba3fe8fmr11328319f8f.20.1745316464089; Tue, 22
 Apr 2025 03:07:44 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:07:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=ardb@kernel.org;
 h=from:subject; bh=W86JfsY6FfgryqNMQ3l2xd2Agk3plBhuN6POLUQIVIQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYM9K/FBmeoNxvceFRs1z3zqn/JQMtgjSsXfXLN4yjWjz
 gPXZJw7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQKcxj+yof0MS4592zexD1b
 J+bvnbOnt4rzo+f1FVu0XzI+lUszEGdk2Gw54bbIwm9MnyLXzDjx6pTKzZ7KOiaNzc8DDN9FHfj 8mBEA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422100728.208479-7-ardb+git@google.com>
Subject: [PATCH v3 0/5] efi: Don't initalize SEV-SNP from the EFI stub
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Changes since v2: [1]
- rebase onto tip/x86/boot
- add patch to remove unused static inline fallback implementation of
  sev_enable()

Changes since v1: [0]
- address shortcomings pointed out by Tom, related to missing checks and
  to discovery of the CC blob table from the EFI stub

[0] https://lore.kernel.org/all/20250414130417.1486395-2-ardb+git@google.com/T/#u
[1] https://lore.kernel.org/all/20250416165743.4080995-6-ardb+git@google.com/T/#u

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>

Ard Biesheuvel (5):
  x86/boot: Drop unused sev_enable() fallback
  x86/efistub: Obtain SEV CC blob address from the stub
  x86/boot: Drop redundant RMPADJUST in SEV SVSM presence check
  x86/sev: Unify SEV-SNP hypervisor feature check
  x86/efistub: Don't bother enabling SEV in the EFI stub

 arch/x86/boot/compressed/misc.h         | 11 -------
 arch/x86/boot/compressed/sev.c          | 33 +-------------------
 arch/x86/boot/startup/sev-shared.c      | 33 +++++++++++++++-----
 arch/x86/boot/startup/sme.c             |  2 ++
 arch/x86/coco/sev/core.c                | 11 -------
 arch/x86/include/asm/sev-internal.h     |  3 +-
 arch/x86/include/asm/sev.h              |  4 +--
 drivers/firmware/efi/libstub/x86-stub.c | 27 +++++++++-------
 8 files changed, 48 insertions(+), 76 deletions(-)


base-commit: ff4c0560ab020d34baf0aa6434f66333d25ae524
-- 
2.49.0.805.g082f7c87e0-goog

