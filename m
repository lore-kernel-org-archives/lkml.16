Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33F21ABC2;
	Sat,  7 Jun 2025 21:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331621; cv=none; b=l+2Eqe6dZJbYmrBE/m0WKwoVM8Ff7tv4Sir2JWiJzSfmy3FcWfxkZIrdQ+CJw6JlQjP9Kr66SZl1WJjba3LtulSsCSFRQ9O8h/cXK7I9QtyW7XGmjd1DpCRcRnvrNUWp92ujyV6Rm7CtaRXcQIlDh6exCUWnsDYcTEkB22gh7dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331621; c=relaxed/simple;
	bh=zlfJ9MFXhBJox/V315hfuNb1xbGA2xxs6JAlZwQ6Gvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYbk4uGmDnlAM8MnK5CXZwv5QOZj9obdZ0Hft/DR0iGSu49oPi2s0JFibcEZPvzhn1DjbvPy92+rp5JcKsOs43VWAGBWG47vCLgbBUMJ3C29aXaAqZ3rYGwuOgFBTX0bRXRzaj8rFSrHXjuDJd8ukXAVBBLYuSFbZY7hP/aks/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QliP0p+G; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QliP0p+G"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso20111565e9.1;
        Sat, 07 Jun 2025 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749331618; x=1749936418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W38WbDZxYH8R3C3FoSWr6WuJZqRkttgyfM9+3TrtsDk=;
        b=QliP0p+GtkZ05nKy6BckTT496A0HWC4yCVT4VUuM/ifHVwBOUEpL8RfUk9hH7ytx/M
         2k8Dg7TcmdAl4pJVIk0GZaxGbcUuzHswTr3Fl+d8IzXt+3nZEnVIdqk/1yvZ8ufjKZnO
         yd5nya1u74fQBKreGlqAVJErA0Gpku7aB/FhHxx0fhXrMGFwpPF6KkTxu8TU+vOT8jcX
         MmhEmKppB43Ja9NwyA7MwS5xSVq9OJyl+me3HzMjbglVdKGWZcbiXDchZXJG3Mmfp9kA
         0JvD+9guVNSBvSv/0LoLAQ+7HMt8n1uiIxEii8rl5DagTBqwWjamsijtShCPdPDQSGkc
         m3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749331618; x=1749936418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W38WbDZxYH8R3C3FoSWr6WuJZqRkttgyfM9+3TrtsDk=;
        b=uaQlyoPJVv4xM3a6vAQ8jHqWkKZblYvhT/SqF+/YmneNE/ccPB19/2sSm7Gpb9i7O2
         IFfng6U7WDX2GJ6GVHJyAK6LjQlZYAepmTSHVd2UdCwjayDPdEUlR9VrIhgYmTohkhhx
         eCsRRJK9FBCvk2A1j9iEZdYByj5Psv/qalo3qxMH6czTrnSEO6q7sk3r8YptCkr7dTHm
         WpRVLfZio27k5quKcZOYP+QCaEavzeIzQVWO5c6tnqGfBp8+hyKBrs8JmPciZPjV4B6k
         SeSvYjOJhHDBIKZWqy9Xfljpp6iAjmYGkskxwoaTKKvCDduAnMayaAcXuG6Ro9P8vzl8
         tiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU7sxogiBJTFOvbyWiTOBwt+bOHCy+ch9MlJjdPVqvL9SA6z+Q/+FuCBtUbCt/T5yb9uQovGksE79HFO75@vger.kernel.org, AJvYcCVvfKzdsKe2awPexkg9shEe37V6H2yjfaGii5+/iilykyyRoHaHnhJ4xQV7CrIgpe/2Tc3iUDt9se7A@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+UlVm+Yg5UfcOCc2kTjEDseBBozpRB7AVGxN4pawYHYZ3bHE
	4tmJQT6PKVpT9FKe+UADcAY8z45C0tgr1bUaU2hRNmfdnCE0DHQk30w=
X-Gm-Gg: ASbGncvKxHOPTUxuj/+C/iHqqwtQAHIv9wZp4oTv6h86Orw09HsZrmaBsKbIpNyr25r
	oJXNGmzyCUbfau185bcb8Xg/lA/OOFXCg1nZfjUjjb6RheVfu+FipgNPpUUvisPODbhARH6XKSk
	4b7iKZqSUlazOjKTFjFk60o9buGcgj+8mLBnCwVAVDnZH7u7KBCDRRIlRzZKQKaI0vpFvRbDsw9
	7x83poz1cb/eKo2G1PKanXImSt3yjR0OTD6DrA+R2LW5wD46UzhdlQX8y9Kn8xSpQt/yK/tbnOj
	wzjOUTO8SyAgexlsJuBNTD+UnzvH7q/KvvIRwWBjUXguVVAJfneZaOeeqot/BWwlypmx
X-Google-Smtp-Source: AGHT+IGeRa7dua7uSLyCyRrVm3+JRcC4ZtZmkzR5yMhTJMxUZbBE2l0bZHD3VhYoUgre0uLvU7l88g==
X-Received: by 2002:a05:600c:1e8a:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-452014976b1mr65517015e9.21.1749331617631;
        Sat, 07 Jun 2025 14:26:57 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fd02sm5449632f8f.75.2025.06.07.14.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 14:26:57 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz,
	konrad.dybcio@oss.qualcomm.com
Subject: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
Date: Sat,  7 Jun 2025 23:25:37 +0200
Message-ID: <20250607212654.126412-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a very simple dummy consumer driver. Designed to consume
a single regulator 'vdd', the driver will power-on on probe and PM
suspend (if supported), power-off on remove and PM resume (if enabled).

There are two main reasons for this driver:
1. Create a pseudo-consumer in place of real devices which are not or
   cannot be described in the device-tree. Examples would be integrated
   USB UVC camera (present on some arm64 laptops) or dedicated keyboard
   backlight regulator (hypothetical). Instead of leaving regulator
   without consumer and `regulator-always-on` property, one could bind
   to dummy consumer to save some power during suspend.
2. A great development tool.

Tested on Asus Zenbook A14 with webcamera indicator LED imitating vreg
enable pin.

Aleksandrs Vinarskis (2):
  regulator: Add dummy regulator consumer binding
  regulator: Introduce dummy regulator consumer driver

 .../bindings/regulator/dummy-consumer.yaml    | 39 +++++++++
 drivers/regulator/Kconfig                     |  9 ++
 drivers/regulator/Makefile                    |  1 +
 drivers/regulator/dummy-consumer.c            | 85 +++++++++++++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/dummy-consumer.yaml
 create mode 100644 drivers/regulator/dummy-consumer.c

-- 
2.45.2

