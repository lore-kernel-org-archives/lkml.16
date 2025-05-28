Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60126A0F8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419877; cv=none; b=Pteys5RoYz/zGZXXa4f3mtXOvO22D0yDM1agOCmeKK2i1+MabW7vSU/MTjq023YQ0Ag1I3iwKlv8PD2PD7soF0SsIDLYaOHchm616QOOIF1hLfF6oSINSBPVikK+upfVdKSO3zcz/P3JfboRM52/pMc1A/zB26Yh+d0N2+yoa7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419877; c=relaxed/simple;
	bh=Mou1ieGyUfMk0Ql4ddZnpgGEyPlSxoqDatPUfQa5VIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otLrF2UhpMYZCwnv/QDfFnRNtx35UUF0p7xQMVhW+rDiVD2TpedmsMu16hpvyjMrYmZ188nB2AzVYeiouorBJdEJhS5IsrQlVLzPmJCegeKZj9cJWvUrcf5qONxqWvr6mHnaFLZY4Av5Uc8Rdd4wKDRXUQdAls9S6xoREQOXWDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kbk5JKQJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kbk5JKQJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450caff6336so942285e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419874; x=1749024674; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eGBmhHpAoBCXn4dDL8o5LjT2W5woVp7uljWhl0TnKw=;
        b=Kbk5JKQJO6bcJ66sbfD5oJcyrM2Eejliy35OG+5TsyyaDjs1UphVXxvz3EiP24THym
         W8TL8L77U4YHJ2uEjz3x+Btwy/yLy/yJS1kaOqf+jRurQ/gbdnkgCjhiXLx2CbwwrlHF
         i4e+NhVR2c5Wd+mRuO5N8OIC9X6XkYb/X/lx3sKJH5zZa9J/DSQ26ZkFsee+QbtBOg1G
         dIgKxd+ojQZ6gOxEpVtS8F0VPAXFKr0keXb+YXs5rIa0gJOUnsj1lVfjGNbF+d3pTjrO
         7B5BJGNvbYJpEKWDUbZYpc1CbLUw5lLIb6wTFCSapplHE53XBpb+LM6c3JEEEBYnXvSd
         D8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419874; x=1749024674;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eGBmhHpAoBCXn4dDL8o5LjT2W5woVp7uljWhl0TnKw=;
        b=es6IpPStrg5WnlgjRGLxsjAaj5XhkktC7VtronV/jg5f51dr9xOa91SwAhx3vWY6zM
         6K6dYRebULL5jzsOWqn9DC2d8/VtdcEx69CUW0+684OOBOkF8lobfJNuCX6SYrwVX4/6
         ZPKMe77YLSIx8mXOyK1+iCsOLRS1l4gI475FGt7GRmyf8x0+/6v5iJiZYmdtg1JNvMv4
         cfr2tWPakvZbXc3ZsIt8TF1h4Lg2WscP5i78HTCOFojOWt9s3fWplTb3cP4AnKurnDRO
         vrKurjw7wTLoge+0/t1C79ontGG5sTLLp/gNW/goSF5BggP86Drabciv0qMZ4wM/Seve
         +EPg==
X-Forwarded-Encrypted: i=1; AJvYcCXk4xeOgCT2hbfiGKGfb6ViYh48Xww0lLTOkQjaRjpZVczXbcVKEbhs3/845Ho5BDm3S44ZTivAgop1Y/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SkaYY0jio+9dtR3XTKVpu4yt/hiDHbuVR96soNc4gBUUyso4
	N4LZ7KpsXZVlIoyL6NQ6i5td8Gcv94dyW6J4hmvmeGwVjqJjKGL7CwCJaIblYIZMh2k=
X-Gm-Gg: ASbGncvvyvHGvSqGd3F9t9dA925QdqwhzZ2O15zc0R/DNIKwyRMms/kFLVmM2mJ4uFj
	fZumF81Ta2eCyIGhpGawHdJO0A2dEdtEu4toVvlsFqaNiRO2t43HIxyQK6VhRCMmo+Dp26Df0Rn
	MEhtwtIp9+Eo28hSwWVmBgft5tlAq340GzN4TBMuv0vjf3BKkOBhy+1AxmDQRh+oOuVHy3dnMjM
	5UKu6hzSFad5dRLPoBy1NgKbzl9d8WWhvCjsmkYGKbyH96SjVbCU1g6ZuR1ka1GtjEKYVwDlvWa
	2P9u4WyiZZzDbEh3LPXYi717kptjD8ZEARjP4DK+wlo+tgUwsIng5rbL
X-Google-Smtp-Source: AGHT+IGyt9pIlXzNb8QFnz35HETogZyJleM14B194rW68Yuuufz6AtscehzIU6fQJn738bKFOwrivA==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a4e8bc0917mr1162825f8f.8.1748419873739;
        Wed, 28 May 2025 01:11:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45006498d2dsm13303805e9.4.2025.05.28.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:11:13 -0700 (PDT)
Date: Wed, 28 May 2025 11:11:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eugenia Emantayev <eugenia@mellanox.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Or Gerlitz <ogerlitz@mellanox.com>,
	Matan Barak <matanb@mellanox.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net] net/mlx4_en: Prevent potential integer overflow
 calculating Hz
Message-ID: <aDbFHe19juIJKjsb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "freq" variable is in terms of MHz and "max_val_cycles" is in terms
of Hz.  The fact that "max_val_cycles" is a u64 suggests that support
for high frequency is intended but the "freq_khz * 1000" would overflow
the u32 type if we went above 4GHz.  Use unsigned long long type for the
mutliplication to prevent that.

Fixes: 31c128b66e5b ("net/mlx4_en: Choose time-stamping shift value according to HW frequency")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use ULL instead UL.

 drivers/net/ethernet/mellanox/mlx4/en_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_clock.c b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
index cd754cd76bde..d73a2044dc26 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_clock.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
@@ -249,7 +249,7 @@ static const struct ptp_clock_info mlx4_en_ptp_clock_info = {
 static u32 freq_to_shift(u16 freq)
 {
 	u32 freq_khz = freq * 1000;
-	u64 max_val_cycles = freq_khz * 1000 * MLX4_EN_WRAP_AROUND_SEC;
+	u64 max_val_cycles = freq_khz * 1000ULL * MLX4_EN_WRAP_AROUND_SEC;
 	u64 max_val_cycles_rounded = 1ULL << fls64(max_val_cycles - 1);
 	/* calculate max possible multiplier in order to fit in 64bit */
 	u64 max_mul = div64_u64(ULLONG_MAX, max_val_cycles_rounded);
-- 
2.47.2

