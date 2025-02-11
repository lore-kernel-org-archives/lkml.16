Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A571E9B12
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255686; cv=none; b=pCC5k6kAeWYC3j+KQwbN8+iEnFo5PT/jsw9MejJZ5oVWRZmxcLM7lMM3BMG5TT4z0UZco7zeCb1m/q2xQGs3yHhvHrpcDYMTPH7iVB4AeTSmPjY5Jp0Of4rrbFXhs6deWXEvLPk8E0ztmrRIO+nOeoxgBWVlecus4UghV0KZhY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255686; c=relaxed/simple;
	bh=DUZ0Ag5R+ipE/i7O6Td15Gg6pzWpbSDbJF47KID46KI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GH/OQCeMc5hBK36gyIhTMe5OIGRCNkUlr5YbSuR6HLB07UFqh0z1p4e5fg19I1VujSTzB94tyhzrASm6yE8JOLQhnylokySrB/dSpqNXs1T5rHO4YOcSIDEKtsX+gYPzA+NSNPUxO0QOmKlU6E3y9be6TgPf5OgPb7PGaLWeeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5da52yR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5da52yR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f7f1e1194so58504275ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739255683; x=1739860483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIGioHqjxPLbfQpIas3VjDLrxJe4mEXBZafVCBMRGrM=;
        b=d5da52yROId0DVOF/xAXaj3r3JJ6w8HTajVE3zyxhK2xAh0HXd5NXse+w+5EEP1kQP
         msr7iffVwwEyh8FZgxveIpbtku/ZHiVhYjnW8Cv8KjVjNRhP4+37M+FXHvh3IauAiPqS
         V9ZzBe2mv8OJK7kY4vPYs42nBbp0wwd2TNTlasevqiZ8s02WxY+JZ8/USI5WkfvqzvP2
         xmE8Y0isV5C4iGWNAK186LkPE/9JEihjrce4Bci7cAUP+Tidw1i3gIpl9Lt0BocjyhZl
         7ZrEyIfbcWFvBvW8zKsSZTR00ijNQ276oHJYL936Mbff54MlGGDFKN/0a5dknNfl0Kg1
         QJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739255683; x=1739860483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIGioHqjxPLbfQpIas3VjDLrxJe4mEXBZafVCBMRGrM=;
        b=qRnfv3iTMBsRUvDLa6O7dF+XEyFtv/XmHUBlhIfxHkZUI8l1aZduATdVrHcnhenqii
         j+MGp8Z8kXzBmYz0oC77TvKpN12Uv75yvblr4UVCyAx6/L/8aWKc3wlSooBiVC0SYAdU
         Nv9T36hQYM3z3krZCBoi5kaovZlOPWViG5/Xcol8rjM+P9VaYWYOOap89J4e/LO4X5lB
         a8pC2KszJTWpVshzp52e0B8k0DnkWRsiYzOz0jPM3aTyXECpQWEdtfr1LLhQ5V7ASslC
         /poHn0O1trXxzkYhNkO7cT3n/YeIaPe7g4UPk1YT4x5fzLFIAllt1E7raHJ5HY8/OtUq
         J4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXQVwZ4MUfcy6zk/Q6NqFdOgyjweWgS+Kera7m+28k8JBmxgEQgqRk47Vj6/rRwlzYnBl5GaIl1sgxOxlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziMHXVccX34lg/5YCi2di/QLLFg9YSvL29E4RR54oe2tcU9ZZu
	HdCchsBPRrQ7UrNjGb/jgsQ8CcM7HlbLHchiluSxS+VleT5xY/IU
X-Gm-Gg: ASbGncsRFgRxP40Yx47l/11nBIVaHXSEoDMfluTghCXDXkL/2Y8oqnqOhpnmlqCc2OM
	TT8jgCuRN0RSe+ZIeOqDaOhZW83gi+ZXoDf9XzFaLBobEz6bKgdEjUjuH9bc+/V0QnVHnXBeQ1U
	FRWqL4igHDuFyF5tJhpaNlzv8yviaWu+7JJ3GFX7Rso/b60eZy3S08bKs0fh0tHtRMeY1eWcOlA
	GIVWRkO9bmkaLQdjTS9sW1KRaV+NlPo887pVXhtPx+o2G9obZi6xtbBJWtRv/27KeUlV0tjlGFm
	bkDhxRPUlZTZVq/AsgPlMMVakz+8ndmwAvwq6PY=
X-Google-Smtp-Source: AGHT+IGhfPVRD1oybOavBoo0+ctgSXR//pe6eww4PZDoI4CrcFrWhXb7gEHYI+WFNgVRGuwAYIQknQ==
X-Received: by 2002:a17:902:e846:b0:21f:f02:413c with SMTP id d9443c01a7336-21f4e73efc7mr246438085ad.42.1739255683020;
        Mon, 10 Feb 2025 22:34:43 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f4cf07b85sm74268405ad.137.2025.02.10.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:34:42 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 03F088039C;
	Tue, 11 Feb 2025 14:45:12 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] Add support for Quad Input Page Program
Date: Tue, 11 Feb 2025 14:30:26 +0800
Message-Id: <20250211063028.382169-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Support for the Quad Input Page Program feature.

Some Macronix NOR flash support the Quad Input Page Program feature, but
the 4-Byte Address Instruction Table definition in the SFDP is incorrect.
To properly enable this feature, a post_sfdp fixups implementation is
introduced.

v2:
* Add a partname comment to easily identify flash entries

Cheng Ming Lin (2):
  mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
    Program
  mtd: spi-nor: macronix: Add support for Macronix NOR Flash

 drivers/mtd/spi-nor/macronix.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.25.1

