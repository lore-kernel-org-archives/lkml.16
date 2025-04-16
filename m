Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50342144C7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822683; cv=none; b=dGBDfGL2B0hIA59J61Zk/Z2MAJpi+w+U7A0t3JGkYXkkIxpPmhDhCTS9ntaZyhWDWUIK5MoaEJ4paaF99j6oraXy0FdRykiw2ClwqY/Wd0Fh76TRqNIeJAKtyj9NJyB39EZDTGTF0E/66DAMGKbjWDYL2Eb+kYZ+wU9RsJ6WrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822683; c=relaxed/simple;
	bh=K6pLnfWwXU9CUrSrZB7vxbnKjaj5uNFAr9G2599uI4Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T27rZcKkV2B5yntEVDWyyniItPNmBTLGIedi8DWEu71g1/qIg+Hx/jLDtr9iy9pTpenKNRWJDg7bIeKWciXKC2vV1aEj00ZHbRG22O6ufSIBt7G3l7AX0AviMocu8vdBc11UlY1XOcLJf1YAh5ad3f7ikWPtvY1bbcVx7EMc/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SStQOg4X; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SStQOg4X"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39c30f26e31so4725697f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744822680; x=1745427480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dmdBoA6zz78+xOLW9xsC44zh3bW6ooVzFnjRvgSK8Hw=;
        b=SStQOg4XjPpD9E9kjRv45wZDJbglf2KWAnEO3apsUqojSCNKUZp3p6fra1ZFWaX5LW
         6UvBD3hEna4otZ6s/KJfObAAaO2G6bQzHggb/SHRq+tOraspvmkb1+PJTEnkAF254l9s
         Q4D+spD6d563AT7pKmJhS6ih6wkrB359ZoccqlbLrDXJRmtkCg12t7NO5SgVRIfpPVMI
         K7vyzoxE+u+ybobKXoJhscgdyloMM02yIYf47f1Hy143L2NDJ8Iz9FjUF9MgjbEQbU1W
         cvjaUZFsOVbT7atffyH+xmQqgP6ScSnF9kU0pRrB0z7d4mXVC08BFUSaYtAVLuS6J/vf
         Aq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822680; x=1745427480;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmdBoA6zz78+xOLW9xsC44zh3bW6ooVzFnjRvgSK8Hw=;
        b=lQ/KJ89VKvPhY86VYqfKJ3fyDvfIO+/I11+qgnTGwUTaXOyUJyYWrjhJyZImSHRocT
         rR8IHO7kRBmPgmw3wKPfddng4j47Hh2Yql+1ITVAiUWWmCIu1bywLZJx1f5fqYwSqp1P
         DV8aDSXFViYNUKM7YaL0bJC7w4elfGIEmT9vnuLtz86gsaSpwYhLuDb5qCtIhshNaU4o
         +0WVj9pqOYKnHgciKmFJGgRTq4qMyVjS+Ob5XP8/YPKFBixqHs7dqaxOohDjkYKeyESA
         fbdErgDF6SKqBlrQAIELHTZB9C6m1X44UmgI+m3li1KPbwx/xKuBAS20XmhAUihZJKDd
         UC2g==
X-Forwarded-Encrypted: i=1; AJvYcCV3j8P7K6eCcQ6wJVsAX6HkvfZwN+NQGh61+uAJuJRLYR2VTkZpj7CyhmmNgpa3o8FkLaB0aBfgAs7zcDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrsk3ychvUmvHCl7clDtF5g2mUYxpvGTv7YNcC941Pw4JgiG28
	Acp0wqSW8FVBm6W8F0xjNUfWagNDn8VQutgwtpfCYeN4RNPnSYY2D8cpA0o8udbZ6eicBw==
X-Google-Smtp-Source: AGHT+IFPFFb1EniwwTjYw4OJuOpLJGMjTOv5HhlzQpBXQ+xCVbnT4IKosegkJyCI/sHUbC8u1XWfVfsL
X-Received: from wmqd19.prod.google.com ([2002:a05:600c:34d3:b0:43e:9aac:5a49])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4201:b0:39c:1f10:c74c
 with SMTP id ffacd0b85a97d-39ee5b37021mr2691786f8f.35.1744822680255; Wed, 16
 Apr 2025 09:58:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:57:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=ardb@kernel.org;
 h=from:subject; bh=N+fKRIG32MGIDHSfCLW8zpajv2xa0m+Wt5yRK9xdwD8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3/ww77Y6YHuNIePlGd7KElHDCvi3lD2qsAtpj45qrH7
 56HBud3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIl0eDMyPHNiXH7v5e+Azruu
 9wO4kltvM/h9eaLBvrh7uxrvrV+L9zIyzH+5INhg2wrFs2vtdp9gexzbPvl658S7t113yi6S0z5 UxQgA
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416165743.4080995-6-ardb+git@google.com>
Subject: [PATCH v2 0/4] efi: Don't initalize SEV-SNP from the EFI stub
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Changes since v1: [0]
- address shortcomings pointed out by Tom, related to missing checks and
  to discovery of the CC blob table from the EFI stub

[0] https://lore.kernel.org/all/20250414130417.1486395-2-ardb+git@google.com/T/#u

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>

Ard Biesheuvel (4):
  x86/efistub: Obtain SEV CC blob address from the stub
  x86/boot: Drop redundant RMPADJUST in SEV SVSM presence check
  x86/sev: Unify SEV-SNP hypervisor feature check
  x86/efistub: Don't bother enabling SEV in the EFI stub

 arch/x86/boot/compressed/sev.c          | 33 +-------------------
 arch/x86/boot/startup/sme.c             |  2 ++
 arch/x86/coco/sev/core.c                | 11 -------
 arch/x86/coco/sev/shared.c              | 33 +++++++++++++++-----
 arch/x86/include/asm/sev-internal.h     |  3 +-
 arch/x86/include/asm/sev.h              |  4 +--
 drivers/firmware/efi/libstub/x86-stub.c | 27 +++++++++-------
 7 files changed, 48 insertions(+), 65 deletions(-)


base-commit: 221df25fdf827b1fe5b904c6a396af06461a32f6
-- 
2.49.0.805.g082f7c87e0-goog

