Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2B1EE033;
	Mon, 19 May 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635493; cv=none; b=Xr2H8VxMy7z827Y1dULTyEPAvNL/Cao3BZBTh9pm8cirGFQuMIRhauvlIEtmqTJqKmZkg7DtP1K+CS1jbJhgsKrZHTl1uZgK4ajlT0LEDI0uH1/iwyvuageF7ddDCXFmgDugiHSTU3LYtrIsdGSLdBwEu8ZGWu8ZZ6vycFrkc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635493; c=relaxed/simple;
	bh=DwzAh3uul21Rc9LKoLuWyhXw6BzEQ/4SKGweSYtjyDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EhCW+YO947F8gyOBdhjr4Ty4/nPsVQBTb9KGNFvXXSUWpru3JAkx54rkdgkWdRTtb6EUYDhmfppcWIZtMs0r13+Nrg2L9DArNV4bcOd2I9D5XwUQ05xoyovzspAR7YTxw1mFoUmFWHMajdC1r93ZLBvVESLQLdHCTZNu3d1jlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFf+E7dU; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFf+E7dU"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3116343a12.3;
        Sun, 18 May 2025 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747635491; x=1748240291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1XNyLS3MYweSxdB6XKUY1yzrxAkvmahpAqggniDWZY=;
        b=fFf+E7dU7cywFH2M5sfBHc0/X6Gn0BatNmyiCwBVwXsZ4BtgK2Jm9zYFsdqk+2IY6N
         LW4bofmbHHYvvcPUAI2DQJ/7ULUjLYbcPw2LxTnLgoX5mq8NqbBdoqc+S5EVBUiNlxc8
         ahwFF9wGCGre3EqThRm4QNYGxG4/JobObWWt4GhodWEgsqkoQcGYOBZN+yfxPFhTkuMh
         Ap63QdWRQkW1oy0jkZY6skRUxhtSnAuLFEaOUdZYksZYdnUCqjSvVhz9hX4kQHSnOZn0
         7Et0xI4njtEEpvH7VA3vRNpf/7qyDQTGrcW5oPwLLkeNuymRfZj/qHCxqTNB/8C05URD
         pkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747635491; x=1748240291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1XNyLS3MYweSxdB6XKUY1yzrxAkvmahpAqggniDWZY=;
        b=sWvm/mXVsXx6FwnW0sOJfXnrFPeErObr36phkQtVLuIlFHcSClq5n/9F2FXN8dkeOx
         o7TiKNGJBgrhJ+bUlVIwLwbwXsBYOxnT04yagEaU+ZSF2KTzuGSIcw14hZ5dchBQMKgG
         lfhVwXD3qc8sYaUvVqMC7Y7nnOHuf6DGOQ0HRlmzFo0vLN6866txU0/1vTXuo1zR1eC4
         OrELcgNJNO3IuL7NfIEll+eGy1TckdysOkqeJUEpm7kc7HbGGmFtqlTprZTz3gjOXZ/A
         7XYhnu3K7rMdyLgkb4pFcpJJLSUMWnf+B36g1ERrD02kZueCICtUb9wWG8/PkjVdqeh8
         D/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4AdcMf8BAMx6VJW2FunjjGbcv86cgoRKSL0NifBicw5hxBEOVNp30fsC+JoCze6VPnhTV+jTlRKfCLA==@vger.kernel.org, AJvYcCUE/PiZzDuUCmQmDlDY3YB7QZfBQfd12VEyaZdO16C8+BSxhTpAJNs+FKaC4aXfYEXrQBFGXaU91tM17jsf@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBVs6kWGyAOL3yE2uxKFIMS0+hMl//4Xexk2lj0tcihQi5866
	/tG4oXp4LWuqSiW5MHfdsw8me7UBmGoPZIdHhIF4xjsNRN+JM8wdlU3C
X-Gm-Gg: ASbGncvYNtADMnxQ19gxa0rtqYkfaFnCoC021ZavifGMAHE0X1wdPXIDUqsvRlTHH/I
	C6ePHZWUzWjqkxw7qbsH5EwYPsteeRSrvnEuCoWzyhtEF3FZS7h/jXHR+Yl+JEUR285yxzu2ChK
	nDvhwsAnyPYO7gf330Cj4JT2/wa6gWIn6osseU273bAzxhYvQexwtkH2kAVzhaDGjnRgcDGrTzz
	VZN2fxYJwkMEyVTMy4HDM9l+aHkb6F1CRqA78B95EH6hb6ke8zIDM5ymm504IkEX8LWr6sEfd7M
	xZj7d6/X7aS8M1VIoVYrm89IWcuItJ6haANJCQG1H5C1VUdTErfZaI8hcR7xXJg8vzv4GDWyu/S
	L+/yPZO0cE/cGODnMvJ9trjbihfHCIMS/Z9/rwavqSy5M9A==
X-Google-Smtp-Source: AGHT+IEJGAKAYczBX1MwlEjsNrBVFKH1sFvHSmkm9SlOHwPD1aV5BauqFUqxU/GRdLSwy0yYuWQ5uA==
X-Received: by 2002:a17:902:e950:b0:224:162:a3e0 with SMTP id d9443c01a7336-231d45cbd41mr163541065ad.49.1747635491275;
        Sun, 18 May 2025 23:18:11 -0700 (PDT)
Received: from ubuntu20.wiwynn.corp (39-14-65-183.adsl.fetnet.net. [39.14.65.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eedb3csm52200935ad.259.2025.05.18.23.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:18:10 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] hwmon: (isl28022) Fix current reading calculation
Date: Mon, 19 May 2025 14:16:35 +0800
Message-Id: <20250519061637.8796-1-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the driver for Renesas ISL28022 power monitor chip.
According to the ISL28022 datasheet, bit15 of the current register is
representing -32768. Fix the calculation to properly handle this bit,
ensuring correct measurements for negative values.

v1: fix current reading calculation

Yikai Tsai (1):
  hwmon: (isl28022) Fix current reading calculation

 drivers/hwmon/isl28022.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.25.1

