Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF32F2A;
	Fri,  6 Jun 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237760; cv=none; b=d4MGTE1/ssEiF6+r1xVRlu15GJUNpEShUgPphmLuyceOWVdhjkn+uRp5Gfd4UAvedzqbtI7UWZLgn2Ae8c8xpWrwqtOjqmNvuav0QDANMQEdVb+3/MWkURYX+p6gRcAyX4mKYkF1besFSj2sfPXMpsiBlez+4FTtCyYeJ7+0cz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237760; c=relaxed/simple;
	bh=jh5+SJzcvX14OSbdn79sGuKn0olgW/m/Y9b66LH0NZE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cdLh4fCkIoHYclwjSDxMQoIDwqOWQyMI7A9Sb5LUp8dLp2lo2A0YlVC6w+LtzrgUWJzDaE8wL9TsSbiQnMGxG+SdZaFiR0/JicPnG3b1lFq3hb35Uv1/IWNYwmy5MOs5/jkdPuFA00pmQ9XDmzv5lB+qdqB/6oUl9cUY4CQ3rts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1I+EXau; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1I+EXau"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442fda876a6so20342115e9.0;
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237757; x=1749842557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlazCEab9PCIfCSPMgFb4BeOPrc+WPM3MHVdbOBtAeE=;
        b=K1I+EXauq+DEIcjjtmiELhfDPc49OjO3DG1jWRzgpNce8SHYkSgtzhESQO31xEEhQx
         gadGqLvrE+u4eztJNdMzWixVXyF3x9lRrNnbZO+1mJ7tPfUKawwimSjjpdzJWVvaOozL
         Ku3IpgQLdXITfIL0I4Ntv6v00BJeWPFGHSO9qvwfvYnSZOXzdJmv7Eb5j65xSaFxuBVR
         bfHb+QBpCH2vo6lg0p3NPzwXjlpFInSCcwFO5O+piTby5rBc6LtbkeJ4nk3sq1tpWmin
         C6DrTIUIi5bGF8F9JQs1YOwcJlR8HEYQZnq5tKpquyy8APf+3Z6s2ctzmGABnAlwaj2q
         diCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237757; x=1749842557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlazCEab9PCIfCSPMgFb4BeOPrc+WPM3MHVdbOBtAeE=;
        b=jTcW5n2vxpgvrVtxpNqqWMjzywcbq4WUOlm7ZSSUsyO+hsdCaP5gt+zTbwuQZZo0vo
         g3Lek1IkDi64LCbyBUNR91K7/OSY6/5qHJCxnOn5f8q1hXuNvRt+nHJpW3SnhImhL5pP
         TxZOafv87R1dW0+2j8UMwDAeu3kYQAD3o57CeQoRWfVbiT+KklgDPFya8lFmLcfpWRYr
         6GKrq26lHs/LiApAqJiaFydLXA/9rjl30agOM9ngiD29bmhbtjZfpmkPIVaANklIqPiP
         /Qc7huo1NT11CwZ8ul19N8fYE4i9KwJKuRFNZcKX9Is8LhsExzWIkHNKU9zPwMF7ovhZ
         KupA==
X-Forwarded-Encrypted: i=1; AJvYcCU/BQsCJkDOeFRu+DTTCklpNDOq4FcPJtxy1Ir9xRHWLgbKJQfqKvlAtEYmyv2EMk2K5hM3Uty778X+@vger.kernel.org, AJvYcCX8x8Z6X5x356R/PF87zEHObN8YI6o1bDAOSMTskTbL3cSATODznF6rvjsyfTPfTVbR4RNNivclRWqr71s2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/V4GnKBhG0Qt0U7ENQyxJpOmIQnni2TtjKJQg3goF8LDmZOxa
	SzZfkmzczp/KPBRksj+cwUVgbHZtQHzkliOSGhtABen7UauBfgSqcYPK
X-Gm-Gg: ASbGncuvF5V7CBvQwaADz7RdoF+M1xshdYtBKbOtvJoaDy4SncjEx2aroGWy1iTchHn
	aMBigXKnDVEJCUzqXgT11Kz3brahL4rNrX4GKH+Yknbi6oahgqC/+YHuX/SCF5KLr7dWEkJFkDe
	6QZYqvaYHvcDkv2UA9DzeWjjPKHzMcStNWsBeNp/ZiM+6DmIqVPzj5RTmNWUuHC1S4yqewV4rnp
	1/6V0mfQoByrKx8HgwnSHYQ1tVVG/yP7avbjQJAYcJUFeyP26GSGwlJCYwxlvbq0CfsnaxsyfrA
	OuTKk7D2MY656IgG8ZJ1V+qiBhl1qWcAXYTQmMcjCD7x2An9tiLK/xRPe1oFSvvfhXYbdvJJnKt
	S8BXsADc2LzvDZlmc7HOu
X-Google-Smtp-Source: AGHT+IEw/6dmOwp3prbi2DO3yB49zmc9WP0nbK2kCidb002uvYU077DaQ9rddciHPvHuj++HjpiSYQ==
X-Received: by 2002:a05:6000:2082:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a5319b69d2mr4142128f8f.6.1749237756611;
        Fri, 06 Jun 2025 12:22:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Fri,  6 Jun 2025 21:22:01 +0200
Message-ID: <20250606192208.26465-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series move the current Airoha EN7581 PCIe PHY driver
to a dedicated directory and introduce support for Airoha AN7583 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Moving the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Christian Marangi (4):
  phy: move Airoha PCIe PHY driver to dedicated directory
  phy: airoha: add EN7581 tag to PCIe PHY driver
  dt-bindings: phy: airoha: Document support for AN7583 PCIe PHY
  phy: airoha: add support for AN7583 PCIe PHY driver

 .../bindings/phy/airoha,an7583-pcie-phy.yaml  |   72 ++
 MAINTAINERS                                   |   14 +-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    3 +
 .../phy/airoha/phy-airoha-an7583-pcie-regs.h  |  550 +++++++++
 drivers/phy/airoha/phy-airoha-an7583-pcie.c   | 1069 +++++++++++++++++
 .../phy-airoha-en7581-pcie-regs.h}            |    0
 .../phy-airoha-en7581-pcie.c}                 |    6 +-
 10 files changed, 1734 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-airoha-an7583-pcie.c
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-airoha-en7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-airoha-en7581-pcie.c} (99%)

-- 
2.48.1

