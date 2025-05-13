Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF60224395C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131039; cv=none; b=XcO/KZlapis8m9bucRukZu5ObN8rThpNqIKIPvp0yPK9wUFUin488BxiUolk6mus0aqEvJNoyqYFA0Vhn0feuVZYnRZgoIDM/NrIG9jnITxyQ3z8ei8QaixzZLAt7QcTXUJMAx0lFsfb07OMAlApDsgbjC00pznrh7Di2VjtGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131039; c=relaxed/simple;
	bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEqzJKQlCTPlye6s8jBXxASBLeVNiPcrrDxhizYxhmH+avh/sTds0QEPZXGtACMyWDq6FpfHyitFAGKlKGmh7ujWiWocn+fsTzJy6vwJJDwPviYqTBcCd7C1fomt0PYG26mrfe8qdGgUpoOOLBy2M3qP4ojtfRbzq7qTQdqVGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2EGmgYn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2EGmgYn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440668acbf3so2694585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131036; x=1747735836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=i2EGmgYnTv3attlg4uA7zdfFhOXHjtJAJ8XYVdBc00hgLOdaXdoI2053lvr+GwV+Us
         ynCXe/xIuGqFesVdcgtrgC+/gyg5Ztu1T3GJGmI8wrzv2DHU9MyTR32J5TnFaqvH//Ae
         giHJhRCGu5ZvI1nbi/KyFDawgsZyr4CdRjAU6s6tuXWzMtYPr1HJNwsz23X7icbwNdgH
         piPTEBP4FuZdWUd4la3Jy98AZuQJmZ2ypLSV0e5lEikMZsI/+6+ph7tRU4f0kV6kYHm8
         q3X4+xfZae6wlhWTc4Xjon70R7HF6t+zEfqP1mTdobXqFO+HqnrJ3afpzzu9t0JP4d5h
         Xd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131036; x=1747735836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=lKkmlJkOQ6Df12UoSCZ54lgKbKAYa1qhJzP6KpSYRMrCNOQd1T/ojaI8h9W4byj1Sr
         D6dertPUBYhCgks/t5/0CIHWf9l/kS362LqmZJS6gAwYU7MKYPIjZxJoj0kCZTmN9xKw
         1j635YID7X5DS3zigUfyjQMidUUMSJRenJrfpwZ+T2RUyLfWmCZuSTtMdPrMmYe4dqrW
         zXekkyCzQKBzBuBYdUFIlyuXREZnfhusqrOnTJlIYhpP3PqMmjleujjfjNG7BuASG1DH
         cY7zMclcA3GIvypk3OJgdLFORpbDCTMnkVhHgfTNmp+kC1kLowCDb/mjipCPcomZQlyn
         f0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWZgQQ5Tlic+yRqkjcTspStz8q5/gDvP+CDdK7G2okVqkC6kS6jhcANVTySyfczq7bfiRhkaUc2ndzcP1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlDzPfpO9N+uoJ7bpZcqw7aGcSj3HfRcA2wLyaB3Okre25yzF
	Evlg3U+Lfmzf/SeabyD3M0qr8CkNXQQH04slxZXbeopp/Jz/ac9vZ4XiaG8S+32nsZPoDCP+BnI
	Dt1Mvdw==
X-Gm-Gg: ASbGnctZuThrKFyKwm03lSi4QnS7HSBv1un/8RLSIpY8R01xBUDX92dfK57bYqjL7pc
	Hu6RimhoJBogWUznjKUdRAEjCTGHhF40BrJ0WGvc1v6kccWdEOcUpCMqWrZ3we20M2hoQ7u/Dlc
	ltt0rQHBIKBFl3KqHjyxrJaX3OgmTbyRKfBHWbQZ82dPVpVvky9VPpm261xS3ieRCVh0wPkwnzM
	2xd1C25n0zP0yJndJJ7KJt7vFkkOITAJbLUNqlh2xIvCqU2b2GK5WjBHE38TM8+LRsDMJNuU6+X
	ulGCY2uwlpkIQThnqM5NEY4+rJ0xKz77it4v/w0Z/Vnm9/ewuWDcAgRcg8dnAdy7CfrKdkGQqtJ
	zToYCQmwnmf8AfRj4OthJdvVQDcw4aWYULOcIg3c=
X-Google-Smtp-Source: AGHT+IEMONG7o+2qqLec3J40u8cxE5Hikn1gleQY4dduRgG1LUtg8CN8da8I9rkzzSsfliL822Q/Vw==
X-Received: by 2002:a05:600c:4f43:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-442d6de79b0mr53581305e9.8.1747131036030;
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
Date: Tue, 13 May 2025 12:10:22 +0200
Message-ID: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqPmFvw4YlLZILw8ztH+LBScalD7xKqIX+Ch
 i/m/UIVK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMajwAKCRDBN2bmhouD
 1/eqD/9MbCSa5fsTfL4M6Msdl6XVHg9QIaMp8B66liyP+bBooJn55w6uXhxdlwHF9ySGKC641F8
 0Q1O0VRsta3YWmVqQswD9tO22ySzkEyzl0q4aKLWMuasrAHJcQcVIdgOQC0yNNJip17k1LvXj3Z
 UHxJULw7Td0SC9sdIVsYgteRyMVemT8dZK5zpNGPLwTN5oKFrDtiJgyDI24sFknyq745ownKXvX
 WZ2iukaUZ8tQIe2JiOy63Sc4OHe3Aqca4auvoJtF3k3o3+u0kO0wN4DeyNubrYXKjm2zgCTLP6F
 l0CyTXp6qLXSXc8FhOwM0TLdrJvfyYDSGsqI1FnXyGJ+xlZOKkZQ6WOKILmPVA4DqSbvIpPpXFZ
 PDq9RJBQt9ryi5c2neECV2UWcAEhvfuWf/A1M7g6MyKofT8qf9bWbAyCBDV1qlqWRm1HbWQmOF/
 IeEgAn4K3cl0l4xRZ9FuxhRxTk9peYXqenF/s+o4vnGHsewyHM8EAKzRbWejkywbwTHsE2Wj7s5
 qUHiYm79dBT3JNWbYJA3c71y65aW96Uz7nH/T33/sKRbmHDAnaFxvwzcOUl/y1ZDntKGKW+Wl6E
 E1u3eXEFPjrr1v+0gRTvgG1vGf8uFKkN+fZM9uBSQezJZCkwjVxr+Gv3ly/VRKhcIvnUjtLBrBK A/ZSg49r/gysgUA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Please pull for current cycle. Both commits fix issues introduced in this merge
window.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.15

for you to fetch changes up to dd303e021996a0e43963d852af8a3277e6f5ed88:

  soc: samsung: usi: prevent wrong bits inversion during unconfiguring (2025-04-14 08:51:18 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v6.15

1. Exynos ACPM driver (used on Google GS101): Fix timeout due to missing
   responses from the firmware part.

2. Samsung USI (serial engines) driver: Correct ineffective
   unconfiguring of the interface during probe removal.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX queue

 drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++-----------
 drivers/soc/samsung/exynos-usi.c       |  2 +-
 2 files changed, 31 insertions(+), 15 deletions(-)
