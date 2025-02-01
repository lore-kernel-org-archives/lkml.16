Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C91C5F34
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430504; cv=none; b=aFAp31nIMb42RGzLi6zYbKfmO+nM5DRWabPjrBV25CP/JkgQnm935bMBLXxy0TdUWfj7iCqwYTiBXi8XktS0xTfalphALrGQechYQ3OX18u/7Qxh+zoE/VuxyMrCk+s9iY10AaxAVAIx0iCEpWsapDvTa4oOEh8St3n99XD2QUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430504; c=relaxed/simple;
	bh=Wje9jXh/Lzg7dNVojpTxoJYmqBjn6FxH5ERgj9QJZNM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rwV533n0GsaaoZ7P7plsxIwpkp3LUPGDfFsVGz8N8fIUIkdoKrhlQaFYGasenTp4uUK/0W334Z5rbG41pRYrNh+j/v2gDZh+VkOpKX6/ROPdUHbhTepDBYJBD81zcWUQSudleLPMOGR89z9PdU4PAbyynCkFrIVpEs929uqHVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2BgXYy3; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2BgXYy3"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5d3f4cbbbbcso3289906a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738430501; x=1739035301; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LKRxqv3rpHMXNzli1kxx7NaVjQ2CKQKlOaLUroi86/c=;
        b=S2BgXYy39/aFDj8K1qnQHszr6tlpO3jqEjgtAeElTDlpwmVhaZBp2n2V/DLC9+NSbY
         2nQYtQnV3Kaqmn4MwEcA51gUDLCW7pyBc+o1Cs2BK5KJlaTeDebccEQCxIuAR4lyXO4i
         EgaQUHcsa33128R5JbmSUUwV7rx/rjx9gzxGG6II0pV6DScPl+KLgsZwm/jkVqZy+BDS
         OCnb5UYVQ+3ZGYkhVguIlsx7d2+DIEF7L66iVExLZQlEiYgAUVQfCG0u5qDVmmm0um/1
         aS+ppWSfRJci5sGMqZI7xe95xUEl97BymnvD/Y0689gIgZ8zj+B42fqajVIxNbBTbJ2j
         1mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430501; x=1739035301;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LKRxqv3rpHMXNzli1kxx7NaVjQ2CKQKlOaLUroi86/c=;
        b=vXcO5x5PopO/2SjAKdYhi+ripzLBSmg1XmqUZ8LRkImE8Kv3+qYLC9GtrD38j1nz2O
         qMzgHPoJEpdQzVgDf1OTquJ+UK8/KZy1fy5TTr7SfzNNp5aCcGHn8Qn4eS2q0MlUhdht
         V86dWsUXyKUlFX5Jlfmj7O7BhvTb188yyadL+zetc09pNChncg6Ow5T4mYZgKIAgG5Xz
         n/BeZSPHXcQWM38Sj+Mg0F4TZONOZdSDOCoQOX2BjZOpAnIDR+WXpkJY/flqenquBXVY
         Lr6nTSpZABi9nq9JXyExPRlNw6+VBGoLa0tlW95GZ4ATwV7BU/cTDVX64kzeKPag7ugj
         VjUQ==
X-Gm-Message-State: AOJu0YyNrNInhfxd4r1RkTM3hod9t0KOU5Pt9qvZnzkQuZtyc6LEtOOM
	bpleEVqXRmtGE13wa7BT4Wiy2Jn9nHi4mTyK4lnL5oj+HoIfAvvGf0EglQS/+enfhUqTDw==
X-Google-Smtp-Source: AGHT+IG+iioIcLE1n2x2b5wS9rFGgmHjtDC2eNRzzZJ7bBkw6Q7fp+IlwZekIdNJiM3C+zWK1UVZnF/4
X-Received: from edbij11.prod.google.com ([2002:a05:6402:158b:b0:5cf:ca78:ecdf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:51d4:b0:5dc:100c:157f
 with SMTP id 4fb4d7f45d1cf-5dc5efbf5afmr19486211a12.11.1738430501387; Sat, 01
 Feb 2025 09:21:41 -0800 (PST)
Date: Sat,  1 Feb 2025 18:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=572; i=ardb@kernel.org;
 h=from:subject; bh=nigpWL6qVv3nStiJxVFaJcS25/39Tm1V0wccEmiRXMI=;
 b=kA0DAAgWMG4JVi59LVwByyZiAGeeWB2gRIbc0Rrc54+L/uCiwNdGFr6PxVYQL6sRJ5wf1yaIn
 oh1BAAWCAAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmeeWB0ACgkQMG4JVi59LVwaVQEApSmH
 8+Jyl75SnzF+L2n77H5dpRk0rHoER1Baq9UW6XgBAPntTLwPZiiOh0cRqVTzefa/KJbd1dRYmzr nKcf9dYcB
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201172133.3592112-4-ardb+git@google.com>
Subject: [PATCH 0/2] efi: Add support for EFI_MEMORY_HOT_PLUGGABLE
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Adopt the EFI_MEMORY_HOT_PLUGGABLE memory attribute definition from UEFI
2.11 and test for it where appropriate.

Ard Biesheuvel (2):
  efi: Avoid cold plugged memory for placing the kernel
  efi: Use BIT_ULL() constants for memory attributes

 drivers/firmware/efi/efi.c                 |  6 ++--
 drivers/firmware/efi/libstub/randomalloc.c |  3 ++
 drivers/firmware/efi/libstub/relocate.c    |  3 ++
 include/linux/efi.h                        | 31 ++++++++++----------
 4 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.48.1.362.g079036d154-goog

