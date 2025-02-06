Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E588227B9E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847994; cv=none; b=VCOZMsDwj+q11B1s1ZH8TvCPvAHmWdNg/5dNOgOLC4yU5+zznZzx44GPm1ENL0t97dOGJI8girSz0nWuuFQGTWOfFXu4HjP+3bzBScJM0YIl5fAVVNxO/FGiAKuDa4obiOVqgrvyUShqhyHadAanf16tugKDozqxSlvg2bmE/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847994; c=relaxed/simple;
	bh=FnH+hEd/jOysJrzD6EbQwOA5F3HBH9Mq8jvhDCPVw6E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RpWuPxP4XVQie5xS8GrgCqhDpTcKjuzBD5tTffyOg++oFJOzkyu8ifcDdb/G/9lQAKZO8SqnJRvKWmSSMSRM/si9lvKhaLGZ+iylqpoR4+adKKrxn2AfpgelcvXwn8lTLE8reiknfW5OlYoDgCBaxBJ5zJE0U41emGKIuT1fvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ujs4GxpX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ujs4GxpX"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9d5e0e365so1231042a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738847991; x=1739452791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdj6PVBcwHidoO5BXn3s9EOfHL8khlRsKQpRtEXGdyE=;
        b=Ujs4GxpXBp1GkOmIYfrWB9tvKSN4ue3nnZ6H6EUzxp/Je/Tj54jzy1nP7oIGs15uwg
         /ItVyHwbSb7oMKqGEvt3BklDsEurexYGDjPUYmaJYU9NEjXkk4mw0SJggOPaRJQ0JEu4
         VTyOg1CIiGlAyMn0WQSl8rmTl0BV1b16tFLhrB/b7s4BdMaL3XdKRIICoK5Cs7fxry0v
         hBQuNsJrK+cPwb5JL23Rocbqijkq6dSWC995LVa+OG51XqHOG+V+mVu5JYr/IWizE2g4
         e8GXUBWW0Xh7zb8CKLo6cj7sCTWdCwT7zL3MYTbj1qFxqhB2MDQ/9VR3StKrh+Sxf/6W
         dzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847991; x=1739452791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdj6PVBcwHidoO5BXn3s9EOfHL8khlRsKQpRtEXGdyE=;
        b=reFtbBqvKwGbmRgEihQ3gImY2XOZu05mwmY1R8J0R0BLI5CCj/PgxZLgT73ikFyA1S
         vYslNDjtrXPll/ABZpTPwKDxF9qrcM9C/0FTd6Nu4gs5R0c7hzqsiQWkQnxN5d7CzUtv
         cN0LmWijvpihUhIlfIs46HUbKVpN/T3VU4czhoGTy9qeiO/jNOBcdTxUFfm5T8fYn41R
         QbnzA/FfXgTl62D5axM1rgeKorqvkCdmiUGc62qIiGtMR+ixhZuyivswi4OwrYFQCNMQ
         ncpSvojhEIQu5dOdhYt6r3pJoU9athn6Ty42ysQ4U6Pif/dm3zVtBp976dxgGOW603X2
         Cq7w==
X-Forwarded-Encrypted: i=1; AJvYcCX91G58EEJQF5MKdc88xS5weRTqX0qKGG2Z5khq5I384zV0a8G3huIE4/u2jI1yk8g5IcW9uTFGXRwZyvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzazD28Dgm7ivQU4Vfx9tZDAs24G5DgwVkMHcgCn5jjY0cubiLo
	JZIO5xS6qYeQnubkfp17hhP5V9+8l6+18OLJxpLK6HSLm46/xNkZxhjhFkKJI68=
X-Gm-Gg: ASbGncv4B8rMaHPKXTbFEcyQBHQ879Lz+MlhP9peBbxwE908IDNjb3ubwPebGsQPqS9
	3PSpVDwZCff468omQEeOe4Nz9uEbzhMRUZ8UQUVEhhvJiHPAWSDnnSnTmQQ4IEfIXRTV2XDoQdH
	3pnqaTKfhTzydkBkeS0/vFIH3G1m/SwR0Hopu48ubIm/GbUNTWFqy/nH3HaHP8sSvbtK5E+6rJ+
	4vSqRmIuL59nvTM4L8ZDHQGFXRWU7wMdiuvmPK5vH1wuVIH9gJoVQTzkdLYLTM09Mh1+K8yyr6B
	q959i1ruF50UqxWfyg==
X-Google-Smtp-Source: AGHT+IHfXnIXGHHOMLsW93QKlkZW4Ccyu2SXidx5aNBvkoYn0PbZECkavhjDqZaPqEQhZX0lGCcrNA==
X-Received: by 2002:a17:90a:d406:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-2f9e0761240mr10760981a91.8.1738847991406;
        Thu, 06 Feb 2025 05:19:51 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.19.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:19:51 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 1/5] riscv: select HAVE_ACPI_APEI
Date: Thu,  6 Feb 2025 21:19:22 +0800
Message-Id: <20250206131926.91289-2-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

The current riscv architecture code can already support GHES,
GHES depends on HAVE_ACPI_APEI, so enable it

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..df01fe8cc24a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -120,6 +120,7 @@ config RISCV
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
-- 
2.20.1

