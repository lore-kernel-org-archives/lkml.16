Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C184199E94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755373; cv=none; b=lbieselUIejwF3lM0YIJFidijgJNIslVQNNOIBYfOFfV56efP6X0u1ljlYpNYwHoi36YGTsBMaBNu4rk72ivKZlPpBcJlLElsSIbVpMnTG6YL7e9kxWbrBQr/u/+grYxEr1l6CCm4ZYBZhr0ZO9f2MjixGsDug5uewmqEA9KXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755373; c=relaxed/simple;
	bh=DFmNe5JvFiTNGZaZsBYdcCBsxvzaOJI5Rug9sW5SFEQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Sfu6/jmbWFf7fRETBKULDJH8f6+waoBg5YxAx8sRlAb+s2t0sOSxfCIYzGNt4ZFmrzw2y495ijo9xTV2zn481g2Y8y69ecPQ55j1sdPFd1iwjFMdbem2Dl4IKjlBAMRvB8j7EH8CPGwd8FZOXJ4a499PC/aiXTy3vpGQZa6ZXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I73KhTWG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I73KhTWG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so13740395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743755369; x=1744360169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYIyNXM0vwLPLV1EeWTDyUP3htQY9SK1l3EQuLAqMvA=;
        b=I73KhTWGmU/oLTytcnRywu0Bd/Xodp9gE1TtzdC84+P5lHrfaxk87w9y0HlPEPDiIX
         nvjlyYfQYoQ5nyfhridzyOmIYm0Mk0TNT5GPlRELQwssUnDT1TXVYuWTu0orx5nzY373
         xR+MACTKucN+47Jeo0LqAa//uSgVDKza8zMhG+OIg6lfCHBrklgX42RPPnZ0Y0ETRA0F
         Llo7ZGE7Sg5Io3yrM5xQr9ICEMxci+P19cVpU393O1UeW4W9wxo9lgsE62e05fV418KH
         /uJ0NWr4OsQUl12NIVnZgsZ8hXjYLSzcfA1MaPAitV7f6xTaJ890cLaYLElnUFS78EB/
         0X4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755369; x=1744360169;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYIyNXM0vwLPLV1EeWTDyUP3htQY9SK1l3EQuLAqMvA=;
        b=SiBCWgE23QITcC+Faqq3Jz+SPFNMm0P8fSEs3k0kCVh1k1hUczEnjza7qdGoDfeaqC
         5wV43BjQfoZV8xIOGL9Q/C0troI/Tz1UfBYoWKydk3jrENebTrscjWDGINnAxohMxaOc
         5Rz2Y64CTdwQjuDkPa7n3oeu22B+xQiVlILjVpYJ6IJcrn31HZls3/BoQoGxwV4iq6PN
         b+dhk23vYNNOvmreCtCFgOGutKZTj+Lyaeb2L8ZqZ09KAw0c/GqtF5LGxJVkZqHgWEl/
         GfA8jIEZRJYFNbcIEIK2dBn0j9sKiryi65qzmVFELggoM2o95t8iFu9NgBfbNg6iVLYz
         AVNg==
X-Gm-Message-State: AOJu0YwQf0J3+hAQlUT1SC4fwbYDAuLoxOvLWBY52v/ewsIeDGqaGVGu
	r9mJbLJNhNNGuj9on8nhuJ+uaYDBIvSEzOFYIC6/oqVx7WnOhqMxOyvJH9l1lJMqWs9Ucw==
X-Google-Smtp-Source: AGHT+IGt1kx4p3tVXJXXQiU86uQVsuAjXKvnwGVk8rK+pbD8J+Ww+M5Jb8vb3MmrGdY1Db5pwBw8mkmg
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:43c:f6b3:fa10])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1
 with SMTP id 5b1f17b1804b1-43ed0da49e6mr21629155e9.30.1743755369616; Fri, 04
 Apr 2025 01:29:29 -0700 (PDT)
Date: Fri,  4 Apr 2025 10:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=ardb@kernel.org;
 h=from:subject; bh=jvhLG3F6XWiSeBek2IzB7QFy6uo7jHqZMkjSa5K85uU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf39jKT55voNy7NZk3KjlhZ92cEie8X93fz5vNenCs5il
 vz+r1G6o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzk+m5GhotCKwNKtH5H31mq
 0vlj9qS6xSfs2x5sW7hxdv+P7RJHZH0Z/mn8fvHm9f/XMkELf2mWmfTlLdfuDjU3X/J+4ZHDpVO ivnMBAA==
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404082921.2767593-5-ardb+git@google.com>
Subject: [PATCH v2 0/3] efistub/x86: Fix early SEV-SNP memory acceptance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a follow-up to [0]. Instead of avoiding memory acceptance from
the EFI stub altogether, switch to a separate API that can be
implemented by SEV-SNP without relying on the shared GHCB page, which
cannot be created yet when still executing in the firmware context with
the firmware's page tables.

[0] https://lore.kernel.org/all/20250325091614.1203411-2-ardb+git@google.com/T/#u

Cc: Tom Lendacky <thomas.lendacky@amd.com>,
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>,
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>,
Cc: Kevin Loughlin <kevinloughlin@google.com>

Ard Biesheuvel (3):
  x86/boot: Move accept_memory() into decompressor
  x86/boot: Use separate API for memory acceptance in the EFI stub
  x86/boot: Implement early memory acceptance for SEV-SNP

 arch/x86/boot/compressed/mem.c                   | 47 +++++++++++++++-
 arch/x86/boot/compressed/sev.c                   | 34 ++++++++++--
 drivers/firmware/efi/libstub/efistub.h           |  3 +-
 drivers/firmware/efi/libstub/unaccepted_memory.c | 57 +++-----------------
 drivers/firmware/efi/libstub/x86-stub.c          | 41 ++++++++++++++
 5 files changed, 124 insertions(+), 58 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

