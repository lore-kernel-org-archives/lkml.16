Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9141F1927
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271377; cv=none; b=JrjMTqgcrrcx9CKxFWJXJh5vk6GVsHnxpPP76ychqN+xjsbk/q2r7bHx+uITkdvNkJMi5HXH/r7fuRT/sbQJCCCZMftV6YbRC07osBJKjHKGU6iMpxmibsBjww5HfL7TH24460fRpTTR4VRLOhLJDW+C06nnewu7Gsd0iQJiGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271377; c=relaxed/simple;
	bh=Ey1IGpeyUTEQBR1CH2WYTdzMrTDVKyzLa3v5b3Ov6+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mFewLKkYhmRuqvSpLFfAQiPKNb6yB4uGHDgd508itN34OdWwmQZ/qvLbRD9mLiXJw7PHMXU6oyHBsW4kJPZ+v5P2ECgNtS7pjAtl01Y32vgva1mUSRnAt1SpW535KKdo99AQd/UiQlBop3lSAtvZ7Valncn367cmG2R73NNBvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fTqKljZf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fTqKljZf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so20412415e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271374; x=1746876174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SSo2V5DW0c+y3j+ua7cR3q/eHybtkZ4S8xKtKJs3yI=;
        b=fTqKljZfr2qD0VnVxBgrEi7zA9dGPsw2NC8WSqVBT5O3ty1H3JUJzdzgMz2gxWdAjo
         Z7s6UnZn54ua4p7d8tDfPlK5rRYeQdExciEb/GIO+ivS26QTSYdWwL+0YuEJwx4Hrryj
         zWMAaRTAJF3Ytiykhs+sEOqFzUD8f7FuPOpYvQm9pR0baw5PkU0BzQIHvn5rnF926sh7
         z4Lk3r08e0+x+Krkn1JyV4fkiq6ag1pJkZQD7Vmdmc4pX40+WXLFwYvFYF4GxSmGDCAl
         dnBV1o5gZGHWN7qbKOZW+dNfgqThcLnLd9JI2r8quDwkcZ4Dh0JSFPsB+UOJcI0wOu+N
         tLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271374; x=1746876174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SSo2V5DW0c+y3j+ua7cR3q/eHybtkZ4S8xKtKJs3yI=;
        b=QnFZgrHXek0ENG6OYOeF5TCIXedZSdGEnSmws2xiC8eDqhgxyVUfnAvSY+a8jRaEke
         VzzePb8Vn3j1h+vDHI0+m92kWEb4hddqjlDbfJT/xmtMwTUciq2SJRZjQE9nbYTH+VQb
         sYNm45ssiekE3bYpode3mVLPUkvqRBWyS5ubblWho2fCdrQ7ZIeGZOtMoxoszM9EsW6T
         Nj8V6+3HGmgYS/mqAXwV+TsWIhTiQQzvHcsRxLaH5GlO+WYTKX2NB0O07kVVvRPDjPjy
         t4OrRzLTJZsIBcB2jm/AYACt+EyiOZuy5GjE05bG8MwI5Mb7xbh4njqB1tiO5p/BRI91
         IWxA==
X-Gm-Message-State: AOJu0YyQgoCPBHGbOQ6HxxlNyLN+RkfpC5TFHoawoba7CR/mI7mqPiXt
	jDRlzIVohuSmGb/354LcAr/f3LaBLccHTRZPdVxwje1F03zXT5FOlUBRlXoBu9AMPOARiw==
X-Google-Smtp-Source: AGHT+IF6yejisH/hDvE4jSPffTRfG+SXhs5IVajQ7lr9xpPhKHKJMphHm5b0g1Gou8Ej+L5xPw4dcEH3
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:43d:847a:8ccc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3554:b0:43d:aed:f7de
 with SMTP id 5b1f17b1804b1-441c492371cmr5292875e9.21.1746271374100; Sat, 03
 May 2025 04:22:54 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:41 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=ardb@kernel.org;
 h=from:subject; bh=z7mNfjQpBpv68AAd9mLqKIgg7+5n4LTGUtL+5ULXTPo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0jxvfFp07//euOxcgzJRTJtTTV6q79khId+maBWuLb
 R+FtTR3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkIrmRkaFycySHGGGp27+gj
 TW+tyNUn+/bn78zdVl2q9itT9IF+AsM/CxEdfuuHR0Olm06Z694+tckiatbUB6zLv70O2DXx8d5 sHgA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-8-ardb+git@google.com>
Subject: [PATCH 2/3] arm64/boot: Move global CPU override variables out of BSS
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Accessing BSS will no longer be permitted form the startup code in
arch/arm64/kernel/pi, as some of it executes before BSS is cleared.
Clearing BSS earlier would involve managing cache coherency explicitly
in software, which is a hassle we prefer to avoid.

So move some variables that are assigned by the startup code out of BSS
and into .data.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 22 ++++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9c4d6d552b25..4f7a8050ab85 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -758,17 +758,17 @@ static const struct arm64_ftr_bits ftr_raz[] = {
 #define ARM64_FTR_REG(id, table)		\
 	__ARM64_FTR_REG_OVERRIDE(#id, id, table, &no_override)
 
-struct arm64_ftr_override id_aa64mmfr0_override;
-struct arm64_ftr_override id_aa64mmfr1_override;
-struct arm64_ftr_override id_aa64mmfr2_override;
-struct arm64_ftr_override id_aa64pfr0_override;
-struct arm64_ftr_override id_aa64pfr1_override;
-struct arm64_ftr_override id_aa64zfr0_override;
-struct arm64_ftr_override id_aa64smfr0_override;
-struct arm64_ftr_override id_aa64isar1_override;
-struct arm64_ftr_override id_aa64isar2_override;
-
-struct arm64_ftr_override arm64_sw_feature_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr1_override;
+struct arm64_ftr_override __section(".data") id_aa64mmfr2_override;
+struct arm64_ftr_override __section(".data") id_aa64pfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64pfr1_override;
+struct arm64_ftr_override __section(".data") id_aa64zfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64smfr0_override;
+struct arm64_ftr_override __section(".data") id_aa64isar1_override;
+struct arm64_ftr_override __section(".data") id_aa64isar2_override;
+
+struct arm64_ftr_override __section(".data") arm64_sw_feature_override;
 
 static const struct __ftr_reg_entry {
 	u32			sys_id;
-- 
2.49.0.906.g1f30a19c02-goog

