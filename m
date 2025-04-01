Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336C202F9A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509652; cv=none; b=O8Kg261JKziIIn1z9NLG84GMziRPPqgs2Dv9vSx1VsZadtUhA+3KvD5R9/j8tdIJaaI4kEEZVesbACS0wf2CcoBWjIuZ5Zue4vT/PncpgEsjBaVgDhLmQNHnwRILw0bAvtOsAneZWFzyiMOcy3XF/mry01jhfZjiGK3axJuw/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509652; c=relaxed/simple;
	bh=YGXFqr4IfFV6Vu7eYniP5uzR9SdS+C3yWU1Sa7ToHIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gr+QGGp5OBzCh9YdusPFeMvFypaaSpQJovSvbazIkBR6FoDeq02KzPBhwnM9DStMm43AStWFF08DNMO/ObJZHNpnz08jz0QJa/IUwGGzJNT5CV0930069hme6DAmmCW2oq4UTzsvulzN1QkEL6IJC+FZO2qynvUisA6Vt2UYMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2EDj0IM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2EDj0IM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743509649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bobstMjPMV8DhfUNqC1sgNZKJxQFcOqPnhEWn4RzBRc=;
	b=A2EDj0IMDQneKmVvVrctFKC9v7sIsHQRZmF0BmosiRvaFrCgStTAd+o2bgaZvg98SDM1OD
	B/GKLhM7UG1w5YE3hOGRwCJ87O++4yn6gmXmHPw3R11cnMYSJqRHEKypS5kkRazGweHudh
	gpFZJvEV6XRiLVuinljrWAjZ2JODunA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-KiF_w3H7M9-DhaM6JA8xSg-1; Tue, 01 Apr 2025 08:14:06 -0400
X-MC-Unique: KiF_w3H7M9-DhaM6JA8xSg-1
X-Mimecast-MFC-AGG-ID: KiF_w3H7M9-DhaM6JA8xSg_1743509645
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2db121f95so443885166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743509645; x=1744114445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bobstMjPMV8DhfUNqC1sgNZKJxQFcOqPnhEWn4RzBRc=;
        b=cte75OxQmHTuc28OQBNoFI1xfW5+IbGW35WxwsCUulpnfIPydjYCorf/yn6I1vcQzB
         SAMpws1tavX/XmgHa3BlMiUiGFxG65Yy4gwMqdxF/wp4EQe0TBKT17I3PG4IWi4HhsnR
         JNTThdlMCKKxAg0sDP8WdFjYZQh43Dud+t4QnEMiYmKZ8hSho5DUPMb85H+hsUjnFtsJ
         8UTKuKWN5afry7to7aF7Xu86BuKJ1FeBQ+xCA00lGdi7Wv9/jV5BBf5FuPUxI24Ca7T5
         CTQN2G9cyQW0xLTZEM7OgVbB8vI/vYnpBkQ41IvkQ+YP3xh6L2J/odd5DhpDjdnu26zU
         fSgA==
X-Forwarded-Encrypted: i=1; AJvYcCXQBIp4p7a+uHJeaVkpFUc3jvoSWjB74wfwDNhkoFExzSQwJf4bm8LuDvd0ZjmEhVjdaKRDlTG4c1hsUqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YziYUFxnvLqWvsF1UkqeqqBkhCG3DclX9D8buSxuusDFi+QFC+m
	6a78BBelh7xDgBasKG3IFLpr1MHZVUZ9iGdwLizFV+8FrI8gh5ixKEqo7uOZVGd9Et4WX3Rx97e
	EDyJuw7BsdLbtCsFFt7Me/gdWEK3m+lyMYqsF8WuplX1PnqCjn69O5tMbzCSKAQ==
X-Gm-Gg: ASbGncvATdjZ29CXSiRWEsl5Vujyk4ZCZZBq0sAR2GVtrVMvCJcVDR4IojZSHwP+pY1
	LPSOBTmB7mM6LFeKg6kvsN2WCA4DkHcCq8WI2p05VWr795e1PFyTSXT6wHPohvSn17SHJ1aLOZ9
	xtKifzXqZZ+s5az38XqL6dqMbHJt3ZzhP2cwch4N/ZXzYQodAdc6/IttkO03EW8VbL2ZeeF6D0p
	xf2BLIBz2GN4X3uebz8K5MZWP0zx7dkrbTh1nns81KxW1Nq3uxgqIZZPC2IFMYe1A8mhnpF5DL6
	O180S5GwR02XoB7FaJwyEqWO320bDbjyHXd9jgokPO1kCae7BE/kDp4w+XVY3kM=
X-Received: by 2002:a17:907:7f0d:b0:ac7:150b:57b2 with SMTP id a640c23a62f3a-ac738b61acfmr1115335066b.41.1743509644914;
        Tue, 01 Apr 2025 05:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAUNzsyCaoMuUKp8KrX5TmH5LqHQTBd4duJrOAEcTk1GtfF5/Q9pgFHfstQ4EV56ENzCLV9A==
X-Received: by 2002:a17:907:7f0d:b0:ac7:150b:57b2 with SMTP id a640c23a62f3a-ac738b61acfmr1115332366b.41.1743509644468;
        Tue, 01 Apr 2025 05:14:04 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192ea03esm753963866b.84.2025.04.01.05.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:14:03 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Hannes Reinecke <hare@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] crypto: Kconfig - correct references in config CRYPTO_HKDF
Date: Tue,  1 Apr 2025 14:13:54 +0200
Message-ID: <20250401121354.20897-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3241cd0c6c17 ("crypto,fs: Separate out hkdf_extract() and
hkdf_expand()") adds the new config option CRYPTO_HKDF, which intends to
select further hash algorithms when crypto manager tests are enabled.

However, the select command accidentally refers to
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS with the CONFIG prefix, whereas the
references here in the Kconfig file work without the CONFIG prefix.

Correct the references here to its proper form.

Fixes: 3241cd0c6c17 ("crypto,fs: Separate out hkdf_extract() and hkdf_expand()")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 crypto/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index dbf97c4e7c59..f601a4ec6d1a 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -143,8 +143,8 @@ config CRYPTO_ACOMP
 
 config CRYPTO_HKDF
 	tristate
-	select CRYPTO_SHA256 if !CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
-	select CRYPTO_SHA512 if !CONFIG_CRYPTO_MANAGER_DISABLE_TESTS
+	select CRYPTO_SHA256 if !CRYPTO_MANAGER_DISABLE_TESTS
+	select CRYPTO_SHA512 if !CRYPTO_MANAGER_DISABLE_TESTS
 	select CRYPTO_HASH2
 
 config CRYPTO_MANAGER
-- 
2.49.0

