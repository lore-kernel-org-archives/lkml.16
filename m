Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2FF1A5B86
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843726; cv=none; b=IFxfZOLllLZ9cwho+rJFVtQQ9QO/7ykQd2lNJI0MKUnJGLzqjXFk/QNfh8Phd7L027wd/1I//ekXSfiMolBH7kEEl55o2wuLaoMLEDf2ubpjce80s+m6bj0Wu1i4GXmIX4HghVjc8JnXhW3NMUBjFEpIz7bD36wmH4ZklYBbkqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843726; c=relaxed/simple;
	bh=GYmBRcAK/FeEY5frsVAXpbsVxVjYCuxDnfkvY7Ngcy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgCceX6KPhOpb1keabgOFwGjoJiF68PxK6NszLN2exo5YLtb9NNqaoHl0xjQz4l6QP/wQeOK1WE4i3NoGLB5dLTgjsnDd6wDd0yK3806cdef4fM1ua6eoIUcjr4zBiX83hzQy1di2LYs6Bjg5ijW6mMjb1ns8nWDU0dpp8Cci48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvWTVsUs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvWTVsUs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a363d15c64so3298948f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843723; x=1748448523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUG+vkFh57CR3B/+EqWY3NGOAXvFGC6HaBPuiNipVwc=;
        b=OvWTVsUswL4YMTf4cl6uDRk6C9XJOxoYK9wPvkRRWTeaUqsqKUvmX+DfcE37n5/PGg
         LEthIrw6tvmCpF8YUQ2o7tVEIPMYJzwDt2mG9BcXUxhCW1VhiLWzLDtgFyY+b4S9/9uf
         oa2zghEe3IZh9wa/Q2ZqenNjys2hGjUVh6NlM4tV83LSXfMNSCC9uwq8Eol7g6Usk3dp
         gWcJRCj4k4ikb61rSAnmgMqMY82mZeTpMuPcnhkdrNLm/UUVdvp4ZUV4NvYV9uaOXv4m
         WXDXo75nNU1otnq7Hcyvj0JcTxUtRJUuPuRgIDcRWtvxZt4WPU/ic1Wn6ixVe7TsN5X1
         AOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843723; x=1748448523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUG+vkFh57CR3B/+EqWY3NGOAXvFGC6HaBPuiNipVwc=;
        b=AvN1dodKLaFOkST7tyYP72elLklL8ZITnyGZjBCR9lqSzcTGzGAuIwkJ2QO31VWUFd
         VHSzQIAJyZr/Co8gg20S8/wxOdqEjYA89B+kBflal5gGBvnfn8GJZVzpZdZWOIU+dDv/
         rgSXLSemGIVH52TTAe4Rf3y8IsrIM7lOMGDApK0sX2yKmvSf56EGi99n2Ub5FMk18aoN
         YNo19f7D3k920lL6uXq2rz0y7iQIyyalBG+2b1MrFwqzo/b8nDLb2L8keOVwtbdU0r7F
         AUMFcmoyfBrKgNqCMAhOFMqvZCBe1MUGQY87fDuNbsGJZGCvLM4TF2Uau3sMifTqFoch
         4jEg==
X-Forwarded-Encrypted: i=1; AJvYcCWqJk8momcF/u3SAVA578u7l2bPBL7MLPsfP1TT+vO6/t39Nf/VSF1L6sqw4yvIegehjD5NoRzE8Y9ETLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTnbt38Qsr7kXS+fjXElkD7irf5AtMUrbJv1RtbT1vyTtHV5YF
	vdFaIjK/C+7jRHa1GCPECEqwQHoGnTjq9uYH4YCPtxekKpCNjjYGF1I3
X-Gm-Gg: ASbGnctrMU+mS+wtm5JiN4moskg9VtjfrqbKjK845Mz+WEd6teZcl/++YtR4ociBJur
	0dsZs51ho3bl2V2ZuvARKWpyvBXInvNG4IgYXVCwyuhbJvCvR1Ue5VSHjF1Ws3XHeA3mVrHPFur
	BH0qo7IPNaTrixaTw/pYidSjnos5ZcHknpN8FnbaQO9J8v5VkDrGD7+bvLdAG3qzZW/YPgDl9jq
	VCIddf/u57n4yz5QoB6CGIBNdPsCBUjHnXsPwOh4BRFr31Kk+BDWmwbmi3Zb7ae98Xapqmf6FCI
	XXYoyAPkLYo74gZwYRF3nIt8cuAxaDC0Bm3Avg8C3b6FNLsK33UOcQcXjbQzGOU5/kA4UddE50x
	QilShYV6Wzmo=
X-Google-Smtp-Source: AGHT+IEDrfBSfT8XTPUz2cWYZtcwP4Iceco1mJpPmtVOTs4DkC7/5ymjq3xKUnLDqO8a5wA30Q5LnQ==
X-Received: by 2002:a05:6000:2403:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a3648e1b9fmr17758891f8f.6.1747843723050;
        Wed, 21 May 2025 09:08:43 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a37fb452e5sm2499514f8f.20.2025.05.21.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:08:42 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Update TODO
Date: Wed, 21 May 2025 18:08:30 +0200
Message-ID: <20250521160830.30454-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we no longer have any drivers depending on BROKEN in Kconfig
remove the fix broken driver line.

Add a list of checkpatch checks/warning that should be ignored.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/TODO | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
index bf2c39742548..ab41a7f9ca5b 100644
--- a/drivers/staging/gpib/TODO
+++ b/drivers/staging/gpib/TODO
@@ -1,6 +1,9 @@
 TODO:
 - checkpatch.pl fixes
-- fix device drivers that are broken ("depends on BROKEN" in Kconfig)
+  These checks should be ignored:
+    CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*board->private_data)...) over kmalloc(sizeof(struct xxx_priv)...)
+    ./gpio/gpib_bitbang.c:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parenthese
+  This warning will be addressed later:  WARNING:UNDOCUMENTED_DT_STRING: DT compatible string
 - tidy-up comments:
   - there are some "//comments" and "// comments" scattered around
   - sometimes they are misaligned
-- 
2.49.0

