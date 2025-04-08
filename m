Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61F2594B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151125; cv=none; b=O7m+07kXo9JRtw5qQThQO47YPfSN8+zEch1VEwkO0655R6NLHg5unCZEU1Ct4J4KYQz7Xmao8x1hxxxRQ19XgCjnfIEUv/kdkS0pD9fi+mGNapruaLGJx7+09o/dtx5WxOLbU8+45LjqfeGbnh4lyqTBmWXLlKwmR7IcKheBAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151125; c=relaxed/simple;
	bh=ywl14+VR0rQwTc8R0tz8Vziem1U2C1o3dk1jlyk5DE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNwQ0CsvKktGgdUJukHh6XitIYLn43wPJViFmZU5mvtZolVm8cTUXVw9QFA/v+fhH91CrQBRviG2zVxMykquwc0EfhEDIStTHWLjTFc9GaeCgIaEj8eyrtWpGmM1QSeztk/owu0zG/etIQ2X9Bo9T1iKmeWFZ+BVyqdIAGoKtPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=cSnfJj60; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="cSnfJj60"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ee709c11so5125552b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151123; x=1744755923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvVYl1QVax1j5pUd57ASVBJzAMz2KKqzNiWOQ8Iq0P4=;
        b=cSnfJj60NcQ2XMrnQM48Z1nvBYgnV1fkVT9wDNruKSquZ2df71NJwuIf6SXcLtnBlh
         ZuQX/30RcXuFAVX2QfqpNY1qB/NpQ5zDar/pqxnX9pyeR9tjGPel0q/KKCJuGN9nsKJl
         qMP6Po5JQH8rMpxHUy0WXU7EXobOshfOLBvnlAHM5FyO9zUhft8YCwu68Pml0fAzLP2V
         j2e+I9LUJuvv48F8KPrq3U4O7tiYzxqo9NvxrT59I9Ka1QJf9ZdDTeme/Ew87vkUhkSp
         khdktWAx1OBMGWl9XfBM/R2n6GX0VZQoNyqmUEECj2R7P091gQt81YMAiAp/rwgUegeS
         jQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151123; x=1744755923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvVYl1QVax1j5pUd57ASVBJzAMz2KKqzNiWOQ8Iq0P4=;
        b=FY4vyq0KVKNADVVcun1Yy+HihcHq35oTHVfz8hvLUplC+Hd0JrCBX2/TVTi7soJrbl
         PoVJwGRMCszRNSh2zvfRS0KRpQ6HDRvYzDz8doAad2UhUWjnjl8moiDZQub9aM9UP7De
         T5NBmQWa2qu6+gfH5tZGncaNAjlXRx2wy0iFU6PQPfjzQqId2gQATNOnSCcbjn3RWgu7
         SaXffJWtEnx6N7UFxDl5qhH/D2RzWZLn2p7ueB6+Ur2Lohgl01x+7JKLvnEqnKgXlrj5
         dmXmz+nitI6XFX/p6Ogce/Km45bj8F6rMYxg8f6esoLLHzxseqfBCy47+fYuAEzGOc5i
         4Xwg==
X-Forwarded-Encrypted: i=1; AJvYcCU851ObhnRfDF0d5dpUpqaIG1HOvNy3n4g6WaermCDMG4SbjvDjkMEWlakrnkA+MKPYma+gnPCPhQZbfv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+CVvU+fyT8LemSm1QegNB121QWEiDbCVccTE5DKYxcJhIps3
	lSY1VKp4uKdqX1y6eJ4K4lVprjg7WETt4WxTdJqlZ8Yzk9TjCMOvebayQuSsVQ==
X-Gm-Gg: ASbGncsSGO1AHaL1UzldPSHUBCH5Cz+mVVx+RGToPzHM8kXDkO5opHQinl+ubBQi1rd
	eZkRYMmwpLdxGlbEayh7fGkssfw1yp0FRwuRN8lPfexaqePi/J9az7uoDVcP9nX9xA0WLY2Vxzx
	2wYETVufq8YnfAV+u/yZCcA6J2Lma1dVeq5tu0PCw5ucj/WN4n8NOcUU791W3rbplhhBPN7kqW8
	dYkjY4Q+CUgtVPXVKoBzl97X+eKgVi+YAszoP3vPZ8PCFNp7gvIejhM7RDMolqjT0KCxYOEOnba
	IDGXTnJpDLs4c0CViAxaFhFdZCdm1Czo1jSOViMAs870XckbkXpUI6YwbdRdCAwdOAHNyJNH49A
	vKj4ZOA6zxg==
X-Google-Smtp-Source: AGHT+IEJFm7YyHd4JvHyy5TwKXxWEM5gOTs98uM11nmzNLPeSawj7eF+IRJv8cTyjxveJT1FNyiTZQ==
X-Received: by 2002:a05:6a00:1941:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-73bae4d12a4mr754636b3a.14.1744151123476;
        Tue, 08 Apr 2025 15:25:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0801sm11117438b3a.119.2025.04.08.15.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:58 +0000
Message-ID: <20250408222504.186992-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 0c71a038e444..82627ca838e2 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,8 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
 struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
-- 
2.43.0

