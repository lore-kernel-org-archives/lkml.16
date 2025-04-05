Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44EE1B0409
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822905; cv=none; b=OBZSN93EvpVhvXtNG345U+eVLRW6mictxM2GbtkoxiIsHw2gR5IhMXYfFBNZIrJdd07upB9Mhb2O9/kQET4a7adpSmU2k48zDqlBaYxECO7pCk9uZSoayS+7ylbvPmf5REmLCL8gn9TLoDsHCQDed0CQb4mxcl2G32y/hvoPqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822905; c=relaxed/simple;
	bh=FaDCV0vblsYuERDwYstIhbGlbsR6rec8Z2iCzRgwIyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPm23E+v92JbOZw4TF8lfDUhSUpqaarZRSfGSulwB0laneiHp9X3SihclIFmWBswkN9udn/H9bCvOHSZy7EOft8n+RpBMMX42l/0X0/KZUVzN6Nz8yDBZ5KIs5VfCboJhspOcXqD3T8rKQFYI5MQyTAlAeuMj/8LQ+OXT4ULjyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltXrD7bc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltXrD7bc"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso1530010f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822902; x=1744427702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5PzPw4Buo1LkvHHDyhNOl6/oB8IwjF4H1+iNNPSCcI=;
        b=ltXrD7bcxvUc+Tqng/hgBuJCNcEA8ueRELOFCd8rWo0GC1rg2nq4XBg8l0f47xz6Qy
         wGBq5oD25jDdlXzuZKCRfbqp3WWSNWfFid68Owb69mUx9u7YvoMsmNL1Z+hsMREKydYA
         gUA7+j/weP3YNpDYVw8hm2qx1mPJJI0w8QjeMYgUtE8EvL+0BWF23viSZyuHOremC/sH
         Gi7iloIEFc6n7DutUeZzLXkA78gWj4eIqjDncouKcqtsZXGnS5HeGcPHunnk6f+KOrg1
         0jCFMylKxBMBUcymw5Wmli2xgtR7QIC3YmLgFWlgLcDyL+6CRozCLEPBx4htQVB/1AI1
         ouPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822902; x=1744427702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5PzPw4Buo1LkvHHDyhNOl6/oB8IwjF4H1+iNNPSCcI=;
        b=AMCDryWUUV0y6oYJ08s1F7L56E/dsWsOLDnQ0Z03G0CQe+2VJi1i74Z++vEl3eeN7g
         5uKC8k5ZvTsIPU0tKlSttqce+MrkwEd/WT5k9GRtRWKn7yf6J4qnOd1OlNLeK6JWTDzK
         sod0/tf1BzEEpPvkD3F590+gpF+yBghfK6NiwT6dedZTHLbXBsRcW/fksNiLnIJb0idb
         8BuQ+UpHO9VswnjGgmuJMh9/vlCG3pQcvCof39PPLFNCbROU5CiTm6dPRECnzFv6d8BM
         ll8tDRZ12yyvTO/qovCCAF+Wan19jDJhd4235skBkAQnCOBx4OwgD4RsKJBVinuNU1Jm
         LAew==
X-Forwarded-Encrypted: i=1; AJvYcCX31ASrUvDqiKSbhAFV7lSkyR51WcrTkoD9OHnwzNCZBJx7240cNunCj9wfO20rz0Doq3xuIvS0Hqli08A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxL1h3OBohrCZcl+fGErjKoEtzkUqSe1DGtcQHwGehjZjqOwk
	YVYK/xBRW0lPTmXnZ3Vp9CRB/k/QOie1mNZiLojs1DLHsTjr8kVw
X-Gm-Gg: ASbGncu0EBvQfavMqYfhk6wATr5riG069N4RfuLpYw6IZNt9ltbN3DVqARAwlEEPitK
	Unj5xnOAt/8VKtYC0t5PyTzg+ItnjJ/k0rvYY5JKSGC1hBo6AiCZw+CuG7Nf+u790UTaeMFk27b
	UhakxIg4u8/Cw1vWdZzOCCfouH1gIppp9Qlf3Zh6zNP1VU0nWX35ICXhJzUK8e4tMWEGW5w1nYi
	1KTxj0LANVAganHciOmLk83juXSzLauakNFXTIjwiMhauTqbp1+1rPilSdScXkcyNSV1L1gmESy
	tX/P+oNa3/ugt4XegcJsCtwzJ1LbALpw20rA2Y0WBw==
X-Google-Smtp-Source: AGHT+IE0vSAAtWKqhoLkdngcKVrEQ4uN3i8XPo8ttA3scwcSuIvdkedudjulMU7aJZGNd/kAbHh5+w==
X-Received: by 2002:a05:6000:4310:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39cba94dabdmr4379280f8f.25.1743822902014;
        Fri, 04 Apr 2025 20:15:02 -0700 (PDT)
Received: from pc.. ([197.232.62.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm5832250f8f.62.2025.04.04.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:15:01 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Simplify local variable initialization
Date: Sat,  5 Apr 2025 06:14:47 +0300
Message-ID: <cover.1743820815.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset address variable initialization at declaration.
Key consideration that code executed between declaration and
initialization is not necessary for initialization and changes
do not affect the readability of the code.

The patches can be applied in any order.

Erick Karanja (2):
  staging: rtl8723bs: Optimize variable initialization in
    rtl8723b_hal_init.c
  staging: rtl8723bs: Initialize local variables at declaration

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  56 ++-----
 2 files changed, 57 insertions(+), 154 deletions(-)

-- 
2.43.0

