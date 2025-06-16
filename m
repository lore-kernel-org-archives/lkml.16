Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA962264DC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068283; cv=none; b=HLQQUHwUflyPjyRnJv6JK35VQQUf4c+NfAow3O/VOpS8+rrXXcP0bKwJup+7pdG9Y/jZpe8Ivutz5J13I3l3khjjF4u9y2vAIn3aE1OMeS0qJRYT7rLjwh3DUBTfoIySu9H4Ho+3EESJqbdVQMPmeSXjS+CShVFYMz/4aIYok64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068283; c=relaxed/simple;
	bh=uHrG9AeiPfO2ujCvATyl7C613FFrJeskk1YaGMKCsyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4Qizrbuxb3F0xJRWb083sngKpC4tYgflO1CRPrxvpXLCdkbkrhRGqSwaJkagZXeaoA1trnwIPgNuSvCrOJEaFsHhgMJmorDTeOcUlu6D4/NuMzxgKiBYRYQ7/JvOP/O0HGmtUF+Re/6sz7YvC3uB62EywHupcp1sJBrRnG2Osc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOV9yn8r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOV9yn8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750068280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cdzwj7ImrbS9o0Bom5tv9zCMbeN8T26Ybl8KaA09pw8=;
	b=OOV9yn8rMlmB4/sBKDYF/3MwacCUvowJy1dso4R3oEncuoN+EYKQU/2rlIhc2Woz/Zi97A
	POZYXctP75IdhHC30A22gw034dggKjrWnxSIJw/treCl//PyRlXPYMqKR/RBywyA6M07CQ
	fbAqPQIM4H8MurMbtL9lzr4CmI76JuU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-hbjdZhxhNYaEDpFPibhwig-1; Mon, 16 Jun 2025 06:04:39 -0400
X-MC-Unique: hbjdZhxhNYaEDpFPibhwig-1
X-Mimecast-MFC-AGG-ID: hbjdZhxhNYaEDpFPibhwig_1750068278
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb94dbd01fso407843766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068278; x=1750673078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdzwj7ImrbS9o0Bom5tv9zCMbeN8T26Ybl8KaA09pw8=;
        b=vbCsAHZxQm50ouumJTIcBa5TYRcqQfUq5ns32v43c/KNjpqIfTCWBwRGmMohPbWTUD
         t/ozB9HpJ/8gVWcgf2W8fqEpPgQrt109EVv9l78oaB5WBQn76+E2cE/41TllXyYM4xlW
         zIIltzuyCwqZmjth26hPnDWF2PMsY1+XjUn5HABnO1vX5JN+KJbl5phHsyZLH9/5S73x
         EqvaCGhNT4e9azQTevhkdExIEZ2wD2aYJGrFn8FA357JFutUOZnNAebaoz5/isxF47Cq
         vMMXH1DG1EQ0HnCFD/muJ7jU7y1UFgQDHzi+M20/bVVczNGFvPcPtbUaUZCRV8Tb1JKu
         qaBw==
X-Forwarded-Encrypted: i=1; AJvYcCUJGwTaEjPYNYQVTEaccgF9p8bvK/hSkwX8fcOtjePK1SRQwUH05vlKjm8j8EZkc4rqryd0DhfzozE5miI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNYu+Wa/6D+ZmMO0Vl8qMVoKp65zOT2pLO9vYbNPdR89GhjAz
	zsJcQvhtk7qndGJiQYcTx9IK76QNWmQCsWolnVOgQB7KzyCjm0mE0LuUdnLsEF+x92Mw17LlYyO
	7BtQj5Ha/6ZJjzCyvLO2P9dM32a6KGgvltQXnkskvjDQQF1WNecEXWR+IUmCEhXujcA==
X-Gm-Gg: ASbGncvjwRJpa2idrGVEWIjcyWtgdCYlXqImDWmGAw9l4d1fJa5jmn3zTfH24Nxjlg4
	2DX8iEWDpZHETAtWT/7mc2e4rhCv2zOskQ4eyi34CVf2R0rDJhAS/t0YucW2yNHqwYUAhOiunId
	DZc08ZdM6tp0NR8ud9c0+Lv3txqbA/sCpEfX48tERnhnPNV2P/5IG/e4ti+56xeMiw66ARWREpd
	bQ55fiTwd26UxHZGizTfh9ihCkDOBHYNhSNfqoCgmuMnRo54Vb7K27nATGHBtGVzMN8GsBhacwB
	jbxk46X2jtkI2ujt1VRWzyCnSURzIWlxB7NHAyyY2qhP+Ayc/56WB4nOl5D4KLlcCia8
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-adfad686483mr812056666b.55.1750068278296;
        Mon, 16 Jun 2025 03:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmpyH9jeg0f77jDm3nySdq6N+wtnB02XFddQoRJxIvvAvLfKSuRlmjGjjHEdBqpoEQMLrfPA==
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-adfad686483mr812054466b.55.1750068277873;
        Mon, 16 Jun 2025 03:04:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec815992bsm633223566b.13.2025.06.16.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:04:37 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/its: fix an ifdef typo in its_alloc()
Date: Mon, 16 Jun 2025 12:04:32 +0200
Message-ID: <20250616100432.22941-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a82b26451de1 ("x86/its: explicitly manage permissions for ITS
pages") reworks its_alloc() and introduces a typo in an ifdef
conditional, referring to CONFIG_MODULE instead of CONFIG_MODULES.

Fix this typo in its_alloc().

Fixes: a82b26451de1 ("x86/its: explicitly manage permissions for ITS pages")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6455f7f751b3..9ae80fa904a2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -228,7 +228,7 @@ static void *its_alloc(void)
 	struct its_array *pages = &its_pages;
 	void *page;
 
-#ifdef CONFIG_MODULE
+#ifdef CONFIG_MODULES
 	if (its_mod)
 		pages = &its_mod->arch.its_pages;
 #endif
-- 
2.49.0

