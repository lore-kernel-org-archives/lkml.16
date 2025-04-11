Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234227CCCF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356422; cv=none; b=HDvy/3rqn3itEGHwaDH85L4dgY8pm8afWzRziNDVPCq8TiKb7UIyKwJgixC+qql2cENd0LkNl2l16pldM2SHp/l88uo539IqrvIX/za333lu6k5vNzrRnE9jGLwzd1xmBjmzr8UpwR/BtP3G9Qy/5eFOplfbVFbe2xouZ0Q0T3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356422; c=relaxed/simple;
	bh=6CIxqCnMpsn1uijT53CZNGETFFyaodRiqhBE9B5ubLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oUlIgzHYhqnnA4fwZuMK+H6rIrR5y7OJcSknffJnUjsE2w4pUyIaLn2Gj2VCfKp3/Pmq2wbcvjKKn3KTQedo7XYejaZUORq6cMpY4hpkemhw2fnQakz7Ybrx0Hzmwoc01YNQl2r4f2Ksi8iCs5M45v4sMXtWO5j668xMv1mKOVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I6A+MJdc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I6A+MJdc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so1339027a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356420; x=1744961220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGU0BWR52BomYHqM8E+XMcmBlKB/OaTdF3+KtqlI85g=;
        b=I6A+MJdcyDnTzdIJyo7sMQ5GADkN3MYfhorFNqML8zQqly1Cqh8NkdfgihKHqO4LVx
         vbm/euOspknaoA89MwV8bLfxImGeal/G2NEs3WJpBNtB1vUiTbYIlLKqxy1JibLbYgG/
         VplJ9fQNQ01d/mHBcOfcT9uhc/EXwNWjplBQMqNHxnwrbb7q8SAPBJ+KN9GCPi917AT9
         qW0WRCl3qv86Y8O6ZnFghYMnsYUnw4ok2OqkXvDPwPaRG3jfOUl0gvQrZAjOMywaQQMJ
         j23BNPP8yjxf+xtvZPcfqUAGDqieTTXCR2abx1AOgDa8KuBGFL84CDxbmB8tGHgmJDyG
         Lrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356420; x=1744961220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGU0BWR52BomYHqM8E+XMcmBlKB/OaTdF3+KtqlI85g=;
        b=ZvgQVEn0e1OqZTMYPTwshulw3qVck3UAp+DvDI3FFTz/TH5O2rKT8m1vhIEAsVKbnj
         B0BUDxLSLhPymJ89rmZhShbd53/KbW3cQigu8qSjetqFMrjIDS1+VbaxVeyCZy7J5zyY
         tBydJ6usssezEwnyzgQPBNE1XrftaaAMcnAISfOPuQoXe+/3tM0EhPYEMPe8BuJd/hYB
         WPieKKQcbUItwD1UG4ECzLMoLeknnjB6S0X/X4lRWiNv+c1SxLKKZIHEbwlhBpB1FCAg
         0BItLsHMOae5oaKOlKAKg9qAMqQAxAH5sIjFZsU37EHVOC9dZP3sEmw93rWCkV01egRV
         CjHQ==
X-Gm-Message-State: AOJu0YwvNtdUmF4smUejm7ir8eK9HZcBjDZC3XLvCOKP7VwZ9JzSm5lD
	vN+RKr7dszeZDtw7dY+zuQOe7QrdX3g11FQFKSNY1GiGTQ5HpzbBy/5CPE5YrbU/AY0JZns6bEX
	y6S5Bumjx1LcwyAI0ldFJF1iKfFaVdkFyYi+6brvufn1GXGkH9Ti5O0Lat38OIWbgunbKoQk2J8
	TUT4g89IW6rL447QXQvnR2rzG7a74yVZvB9bF7b1g/ReS4jA4=
X-Gm-Gg: ASbGncvxB2tio9Fkjt+n1xH390X5OoKOVB1/N6tIVyIxW+nwi2HviLf8+cszaDoVAmF
	coi6NDcM+tr1hG4k0mfmyZ9ZzHTGq+s1kG25JvsA05QRfQVWKl94jUw3taiqDOj6Vc7G7gskK3F
	OXUMMK6z+4dHm1eU9Ql90BnGeGC8NLCGg68tyC/U+GdKf7ABeHhaPyL3Dlw4RDcALz90162LQNm
	vyQZxBmscdE16GIv9VOwFpUnZS3esJmp7ko8ltewmtboeF8yd83oefa3B8fEDjg+rdjJ7W3dOjB
	YpuVy+QczwxNSCJ5LZXfdGQLYpMUfwFbj59t8DgBDgZsbCDhpL7I6ZWfrtVK8pvlTWUlnZ9M/8z
	6vpF20IcsC+7d
X-Google-Smtp-Source: AGHT+IGHWHeQo2R6RInraQwLZWCl25okBDKhcWO3jXSiWRFgrc31SRGIvaMkKaqaxywnFToViY39+w==
X-Received: by 2002:a17:90b:2246:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-3082367cc9amr3204474a91.15.1744356419636;
        Fri, 11 Apr 2025 00:26:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:26:59 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 0/2] riscv: misaligned: Add ZCB handling and fix sleeping function
Date: Fri, 11 Apr 2025 15:38:48 +0800
Message-Id: <20250411073850.3699180-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Adds support for ZCB compressed instructions (C.LHU, C.LH, C.SH).

2. Fixes a bug where copy_from/to_user() calls in non-sleepable contexts
triggered attempts to sleep.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen nylon.chen@sifive.com

Nylon Chen (2):
  riscv: misaligned: Add handling for ZCB instructions
  riscv: misaligned: fix sleeping function called during misaligned
    access handling

 arch/riscv/kernel/traps_misaligned.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.34.1

