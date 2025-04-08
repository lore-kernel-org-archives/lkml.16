Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C33C00
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118502; cv=none; b=DA7TrpY0uKtf5BXy6wZdFCjBZaMjMb3OkbWNXIAY5WeK7VjC1vBiAAib24KHRy7yIxadU11HjqveuH+DLufvdQjNOSXqBP6LaAxBzbU5DG6HcTooidAtEdSw0aFlGZR2IxxnKW/s5jdv+QX0qCejv0eQhSKXrtpp6yYc21UGkHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118502; c=relaxed/simple;
	bh=JykIIwYDCyjawEXtijT7j0iU9oc/WpKabWh3X/j+B8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D0uwo5XNYV5S+P1MTGId77BVfGyB2VgAaRBli7sWsqKzal+VOmFX0VZ0pONCdwwmpx1GGeUcyBOG7+SLvGp0O4MF5d8ulmiHJdGyanRRJZfA+XUdTUiG1wUDax5QhltLXYqrFkzvWHr18QzaVLhEDjtUeyrP2XiQHy4r6ZR2ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=u8/j49+t; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="u8/j49+t"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6620781b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744118498; x=1744723298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXhow9G6LfPKft7ESsFuZneQo6aQLWh4r6wFJN4PTzQ=;
        b=u8/j49+tB2P4ZzBEY+z9VjkIrsEIyBqQaqNSXCzB73jnumnX8eJYaceXCkjSS7bV4S
         JJuKDESQxB1AV5Zc69Lj9C0y4Pi0b4Q7K1qvWLoMUD0+paomls/RdfDsCSeL9LHj+Dq6
         Kp40G6fHhlTYdWvandxI/Tcyf8c6pR3lk+/BCFYTuIv5VzOl/v7W6y6Kmj4ZZ97g/MrP
         nDK63pPdc07c+0v0qchcxAdE0UU10qaCh0L6vnZkQbk56gHcEIsnHIYpwHenhuf96lzh
         zKCQ1vBhPu/BKcMNp1GpyyQ+DzIq7EXbb9WmnL2j4ndrHHtDrKxLOfqquRp+i2W9sHF0
         eVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118498; x=1744723298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXhow9G6LfPKft7ESsFuZneQo6aQLWh4r6wFJN4PTzQ=;
        b=gDO6W/sv6+SSpMjsnNvvXW8uMY6Z/N0UchwSGk0tdt29QYrJvTe+GHnuAyIEOkDu8h
         2WcahO5u88F2XV9uJwAB7hg1U8lXclwxbid3gnA4wwa/xfBol0PXy0G1vlipeJMyF4zu
         +2ACOOfAFxmkA/AXO+Pt7tEBdF40HdOtR8/qYKDebcWF3zr2AXTxyaXhT81bD04sIh8a
         HskfsJPmEpWGjodWvNcor5zkc40XisY1RPCU+L0Im9NdHFZPmQrz0H7xK8Q4Np45hNDs
         usSnlEC5Gr/2a+3Ey859Z/hSNZu67kwV/V3q8oO6LDjPSM3KV3yiVpiZ8obVvRwCsy0L
         GpRw==
X-Forwarded-Encrypted: i=1; AJvYcCUDbsGJ57lWYW3GaI7bJpzyXqCFRErUG2DBnSDU1nu2H9ar8WugsipaWipEfgR9zZoKOM/BbRA5NSthAyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2PEmphzTm7g6LZlhMPX3K8rsWarCJRpiKTSwmTlE7SIvhmWbS
	PqsS/yUP5C6YLpKeuZMvd5bD4KVXbcWzkDd4CSbyuQyJMcRECyasrR9NZmotYUA=
X-Gm-Gg: ASbGncs4RUvH6CFYtDFdD3hwF+aQmPwZ9gAyM4V7Rnvl0hvGLzL0PIaDt6uptw5cBaL
	CO3m/y+XJu7UTx/kSbyIjTyPhPnHDiCQEc8IAxnG4xYtnAJGqGXm9+tIRWL/pz4K5Qu8m9ZTVmW
	abcJmcNEYHRNRifgU/DKpheZ/fnFBfrry4OSooCHCDZ+394Up8MZUwRO1hurZQHFILZ6bQPQ8ey
	kI5pbwKLZD8Z/+JZ/LqjdTAtbO8LVtycRGCjcuMLmKpybb9tcqxmEOZtjUnXlZNY/2T1zPHTVxK
	15wQxrjZd51CjvEZ9QBXjekhZ6MlyJbmkInn584GjhDe5fV8xbUpWeALo3IieUJCs1AlFHaHoxn
	DH0DhWuw=
X-Google-Smtp-Source: AGHT+IFz565EmwdZI6G6fqS5eARGKS6h/lUhrUYOGgeKnNkpmHWtd/3dLP7BxOpQYwBvP6XvleclEA==
X-Received: by 2002:a05:6a20:9c88:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-20113b1a932mr18860716637.0.1744118498123;
        Tue, 08 Apr 2025 06:21:38 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41af71sm7439565a12.75.2025.04.08.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:37 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iio: adc: ti-adc128s052: Add support for adc102s021
Date: Tue,  8 Apr 2025 06:21:18 -0700
Message-Id: <20250408132120.836461-1-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series adds the support for adc102s021 and family.

The family of devices are easier to
support since they all (no matter the resolution) seem to respond in
12-bits with the LSBs set to 0 for the reduced resolution devices.

Changes in v3:
	Patch 1:
        - No changes in dt-bindings

	Patch 2:
	- used be16_to_cpu() for the endian conversion.
	- used config index enum while setting up the adc128_config[]

- Link to v2:
	https://lore.kernel.org/lkml/20231022031203.632153-1-sukrut.bellary@linux.com/

Changes in v2:
	Patch 1:
	- No changes in dt-bindings

	Patch 2:
	- Arranged of_device_id and spi_device_id in numeric order.
	- Used enum to index into adc128_config.
	- Reorder adc128_config in alphabetical.
	- Include channel resolution information.
	- Shift is calculated per resolution and used in scaling and
	raw data read.

- Link to v1: https://lore.kernel.org/all/20220701042919.18180-1-nm@ti.com/

Sukrut Bellary (2):
  dt-bindings: iio: adc: ti,adc128s052: Add adc08c and adc10c family
  iio: adc: ti-adc128s052: Add lower resolution devices support

 .../bindings/iio/adc/ti,adc128s052.yaml       |   6 +
 drivers/iio/adc/ti-adc128s052.c               | 149 +++++++++++++-----
 2 files changed, 118 insertions(+), 37 deletions(-)

-- 
2.34.1

