Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402301B3930
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739011213; cv=none; b=IeIQyvYqHB47uti+ffCmFMSp6LY97Tv6v429AlVQ38lhJrPqTkTI5iLsJDzTj2gYqhfX0rb82WiVaa/wVdcotBoH4EWNKpHzZsEI8Iz0VKq53vhRyIXLzw0DhixuJVqoCrvO2z4iDHD2wBtQ/CLeUuYFOMGLAwrQo7285FTnTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739011213; c=relaxed/simple;
	bh=D+4al5bpw+xslToZvxzJ/o9q863peT9z4PAuWSJBj5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kPesZuSKYfrlnHqpNi3ce8md1KaxG/SMBqf47UndRErrD7YlXjWAscGPhoIxJg/9Uptta/kP4n5KjPhdD69tt+uYeAtdxQkWtAPhqUifD6BGAU/gD9K33oDOYXGuVNcrWHuNM5gVrwBA3ItnoXyGVUpbfp9rkJ0vmbtZWs/BdaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZAUlXGxc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZAUlXGxc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f5a224544so15517635ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739011210; x=1739616010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KovnzCgz7AwVJ6lEFg7h+ozZOwfcsBPGYDizlK0um/Y=;
        b=ZAUlXGxcV5huqWFHRZTuWhTY78d2tYM9yFvPaCASkgQr8OcjEVjixVeoe3D/YPT86e
         ztnJNFZ33hBTicsQqGxzjGGHP1xgR1m3W4zgySOHj5t6WnNmFc1LtPL6msq65k3EWh6b
         VISlh1GcuFMUr864lX9ffA4AbJeAJgRFwPWwr9oat/dNmJfDdG9nQQ5+3JqdJlWVjFQY
         50sYHCbybZWWem+K0/ihJM480nYBkA1c1WuBm8yDNR5MeZnrHWLiwWgmB1XGvxThgzDd
         hPzkr6ORxfBdWrPjnVJb3/8T2ZBM7i4LCdBy4E+/F8ay+xciwMphDLo/fshljr7TyxU3
         L5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739011210; x=1739616010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KovnzCgz7AwVJ6lEFg7h+ozZOwfcsBPGYDizlK0um/Y=;
        b=r2mAs+7TZqEF1NET+P2vmPFqqCkLizALu0q24aIz2N7Z7eyn6iVu1kBJUwA0CpbTG+
         aWYFIGHAXlAMgufV9QbYY8mRUDygVbKOEnFd2sT6Bdl3wP/XrP2AwSoSyp6WIDLtRekA
         I5P9y9addBFUKHFvXxRqhFjj9JHttTTqrdeRZszdWmwQgli0MrW4aI1scq2rX5e+4pm2
         YG2RC8Rep6U9LRjfuJr92nnrz5+LRADm/vQhIUS72ODeCw6a246RFP4+dP0IWLU0isj/
         S1FWAihttgKlFEq9NFqVMeTMJXu7e4P5gsJeDQS9tnHTPFrbM+RxOshm7MQx+E9d4EcM
         qMng==
X-Forwarded-Encrypted: i=1; AJvYcCUU11pigPA7lRpaR0sUgGWNFHMX3GAndgD9IGKH3Y3DdkzZR2YVZbZg3kFyGTQvZTg0MMVaQwWwAK/wzK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJYS4a72/40Dxu2ZTuhXyaZSxf/WJgjRttiCn13m7XJMUQp7i
	7iRaKeaovMZZ5GIxVfUyv2vqkiC1wp+itq4UfmNKQJspveLlX2DGk13rcU63VAc=
X-Gm-Gg: ASbGncsNvEOr/SYH5PrR4yEJoFY/jvx46DSDpWtDKCH71xFuis4j3H/oL0l4EbW+pKR
	cFCT74xAOBbgM3ojceRU0XRSPUO8AkAi5V0dnbSq4OT+fbfj4/gU3/cZYYnaBzgxPjjAANo3Wls
	McfySDGnhSdJOvPsa9N30MG8IPcIhxcgVeVTunvW5M+kKgNkENEgN3/cPR6sjaRYO9Hsg7PUGmc
	PEQy9EjWBkTkSc+y65ThEfWPIxSIh8kU4DDj8X7jMero7Cjy4H3aMI4V6RU6QeoSUTAs2MWPJsc
	Qd1OtIA5YMxl12whGcBYnjLtV03m44csk5c1c3icwO0qZOSr8w==
X-Google-Smtp-Source: AGHT+IGSPFgo5QCYcimkb+XiEeh3bQEyqeTJJssvf5CdfYBuqY0b4jRyXxCKJwCm5DVcccofry+Jsw==
X-Received: by 2002:a05:6a20:d704:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1ee03a41bd3mr10089837637.17.1739011210415;
        Sat, 08 Feb 2025 02:40:10 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5460b8d4bsm216325a12.11.2025.02.08.02.40.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 02:40:10 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 0/2] Fix dwc_pcie pmu driver issues
Date: Sat,  8 Feb 2025 18:40:00 +0800
Message-Id: <20250208104002.60332-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1:
Only sent the patch titled "fix duplicate pci_dev devices".

v2:
1. New patch: "fix the incorrect reference count".
2. The "fix duplicate pci_dev devices" change is made in two places:
One is to remove the modification of the PMU name. The other is to change
"for_each_pci_dev" to "pci_get_domain_bus_and_slot".

v3:
patch[1]: Remove the logic of "fixing the reference count".
patch[2]: When pr_err, also output the sddf.

Yunhui Cui (2):
  perf/dwc_pcie: fix some unreleased resources
  perf/dwc_pcie: fix duplicate pci_dev devices

 drivers/perf/dwc_pcie_pmu.c | 53 ++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 18 deletions(-)

-- 
2.39.2

