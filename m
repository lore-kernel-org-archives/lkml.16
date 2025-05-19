Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E3EEB1;
	Mon, 19 May 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644107; cv=none; b=GW9QRPGILLfh3grnI2niOIkX9dXRQuXa0MKJ/+XR8c3S6LoSIXoWUiuXNq6ZZC5wHVdYXmIbnbl2Mxw6Y1z8TaX0BaWMMfpL1ySbmzuB1Li9J1+mPzm6uSWRDMhGLTV1XauO3RSYt8CELN1rbL9QpNRnAUlI6wbuMULr1IACv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644107; c=relaxed/simple;
	bh=FfeXpaI/Ry0jTNfKMExK6pstVzErw1I4Sfr4H3AVZGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V5NgCtRbDNURseRAnsg8gMBT8cxyAt25/ZqR9ER3GkmUwXnSdWi5BolA7MwHDAx8dG/fP2hOHtgRnNEeb+DN+r4gbDtiXqHrfc0LmIOx729nte+2s855vXxgfveG+bXtt1Pqwxs5j65j9kaXsnXWxn+7auyZqap8SGMZdSZEQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2s9fGln; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2s9fGln"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so2876699a91.1;
        Mon, 19 May 2025 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747644104; x=1748248904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvRUDBggjQrkeFVZcFd8aL7npkTR9uKvpgi0YdQ9wUA=;
        b=R2s9fGln2CZxSz5Z4gJRWlvuD+rbQ8tazhovSjMaaTkHUQx6cDGqjVLZfRNEcUJnhv
         c2Jx3wFGWWc0/Nt/93yi5+nyrsbfQH0Vl6wEhDGUGZ+5syp5IlqcEZG28fvFzn/lya1s
         Tf36+G0uhWC6be8qCjr5le1FIlPmGsU3l3bsxByiRV6l+Obx7ZUQpIU78IMFL/zyRObw
         gSeumfNBKk3HfJ5gnRd+xb7dorqTUvEWb4G3zrFrUZECqWd7hqJ6eWPynO9wEcDpgD2H
         dquogKhKTnGHV5PxNe1tfOwf6OxsJ/e57VtKz84kT1o4FFeJzhktHAWPD9L3lDv7c92g
         wMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644104; x=1748248904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvRUDBggjQrkeFVZcFd8aL7npkTR9uKvpgi0YdQ9wUA=;
        b=W/74HvESe/4sSNhb54xx87YiBnh+0Lsj3Eq5OCGkML9+gbMrAkvig4WmJbDOIkP1rY
         P3aho0ZTJQahDaJ53qdCLzx02aFxmfgC70iu0Gs51vUoRmpXhtk8/3Iwn56oAsOIoyzc
         MNS7yJcHHNKZx/5MfxMjWH8BkwGGwUiL65OCy6uZPZ1L0WjxtupXl4ogK7/8JyKsfVqp
         Vy1LqXPuIM9w90Mruc8F+zi7Zr/GefbZ+Anz32pRH6kes1BEp+T6Yqsd9hNrZta/uIsA
         aBotTJGyM63qYApMjxoaoQWK3o0Yi+omRBsgXIx0FRt+tYBjPPKk7Wl88UPuUtKfYskH
         chVA==
X-Forwarded-Encrypted: i=1; AJvYcCWb1tF5Y9mVZBOLb2uZHW0kwJd1KNxiHm+e+txua9SsfoVI4I5lT3VftXbaEpY7vwCQ+aB4fD0bAzHE3g==@vger.kernel.org, AJvYcCWfDvW6CFD1gG4iIuTib5LRf8J7Mr5nRuiYdpHZ/wHZ15G6HzuiyKkFnnSCICb68LQ2z8S76lg1gvVBgeTC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLg41zRHgRethVJ/UTrhclFMsiNRMPGARc/1l/JQJtvO+/SAAQ
	dGRulle2INO4iZA+67ka62qP+bqvTQEOnsfP0tvV9KIkgzM3xuqJ+ZV5
X-Gm-Gg: ASbGncvZbo61j/1NYT5v9MwHuu3Rn2101yFppXHnH+XPbX6lwBxyjey5xb42hFVB2Ma
	hU963QZwysr3vZDtff2hQf+f+8nztixsTUp9tjvKMdNalpdh69G7OPFeh8prbOhTGv4Iuxf0YUb
	+Ug/rWcY/YXlKPE6yr+Ef+sxPb7lQMATRR0V3uKbrxGi8LQXIoFIAo4HOcgCfUk3Ja1J8tsRwqu
	11O0vv7p8wk7Dl80Txv1XjQWA8e1PS1QXNqRa2Ys17UoTCJMy+0cdPW5PIx1Lpv71r+qcjUOrSc
	9wA+8I9t3msNoBWyhVhcj+5hDzufkkf+0+rx0A3d1VcupBw5ZOPjq/NZoMlIOTA/is5zn91lZtt
	pb8lC0+nqB8zWEURG+wYgx+ZA5k63BLCSs1s=
X-Google-Smtp-Source: AGHT+IF/EL/A6KgYWtiUE/oefYxhyRZnJUOJ1QhsszUFMdKx1Dg67NU7yO6eBgLxi0Q5L5yTdX8p0A==
X-Received: by 2002:a17:90b:3a48:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-30e8314fdb5mr22269718a91.17.1747644104272;
        Mon, 19 May 2025 01:41:44 -0700 (PDT)
Received: from ubuntu20.wiwynn.corp (39-14-65-183.adsl.fetnet.net. [39.14.65.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401768sm9870275a91.3.2025.05.19.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:41:43 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] hwmon: (isl28022) Fix current reading calculation
Date: Mon, 19 May 2025 16:40:50 +0800
Message-Id: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
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

v2: Add the missing variable declaration
v1: fix current reading calculation

Yikai Tsai (1):
  hwmon: (isl28022) Fix current reading calculation

 drivers/hwmon/isl28022.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1

