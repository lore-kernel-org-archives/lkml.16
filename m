Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8021ADAB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746829708; cv=none; b=WJ/0kAjByLpZHcUmUee1dl9KAX/QaEv31cpiD4Eh4BxtLOZ+GjCSWUi4ndascLUvCKkUnH6rIPL0CBVW1bASZE/x8Kg1ukxD2/x0jFEEpUCvG4a60Ah0AQlI03eZgzCkW7pWwq4/tHadyQp7FQzGNpz1WD0Pkzj89ntP+eRfXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746829708; c=relaxed/simple;
	bh=8tLcmcPNDjDv2wNIMRwkFTH/IVfOGzil3SZBQKcfqD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRrz2d+luxnT6uX78/+c4FSLsQFBB8YwL2BDlHo+e2H7Try5M/UYKIxXNJ5T1Z68F406CSHMr8UM7ohHKXtScfXwkhQyP8M6RW3vVcr5mmFAzpgVTG7/fblVdpXbHTCnlG+BPN/rl48DyWJ4LCKcoBFaR/NZm7jKypVSpKlZx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UGD+Ntob; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UGD+Ntob"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c336fcdaaso27382095ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829705; x=1747434505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=;
        b=UGD+NtobAmKKju2DCjGQbP7E+ijgWEuM1TB2+3KQlPk8+wqBRPtwAq4ZnvVZ7LA1xa
         XwrrKWRsXHUwlnkc5RY7BjxVRz0cELHe4j5uk30BXk+jmydKZY1hGjloT66c1Iyoz0c/
         bT/0znOiShuDHddGcZAWYnHyg7SkweVLa2myo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829705; x=1747434505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YuvwOYm4GSUNUy2wD5gyT6WoJqASKId1GoOL6RjMuAE=;
        b=UKU5vJyt0PxPGZW0zczc0bMyYkX168aVxUOr+EFyX8bMFUYw58OIcXsIlJ2Bl6RQMS
         +TSkaF5hbgsv2ZaL0PDWwD3K5UExpX+mHHTB5jYWnYWVHYVx2y3/IHosnGWAt99El6IH
         Dmrlb4xFCed267ckRVcggBsfeh15CSmHeMO/qsAnBoaZUcYQmKVFyrupXAc4rd+ffcoT
         izgyKd09ngW3F0AaOCNA4LAwo8UZVAXOx4r7euyHi0ukSXoEH3N5dImq18uwa34RosTB
         Hpcn33XnEnUQ4FjPmicWlfvd1MeO7GHe0HvQo6WOP3l9B0Pg1+/fa0osbLY5wiaQD0mF
         llKw==
X-Forwarded-Encrypted: i=1; AJvYcCVbYJbZWGLOUqI+vEInZpX6dBpFtOEZDd4L/mEPYIG57fXZ5MFp3SG3aulMWx+pSClUVleSEj95x/lYxJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUCpfl4ypCJLjVhkSza3YzP2L5twiuYHpactnTLuS47yzL4Rk
	3EFNERG9rV89LE5N5r3Au92VFBaitMLNaEQvFMRwoWObHMBidw63210T7csqiA==
X-Gm-Gg: ASbGnctgJbZ+zVO+nb/sWL/rBzxvSWGseWOhoc3qTGu6Tz+X7wIs4V/Qsm7hkmA4Y6Z
	4JNFBJKv2L1UOiBVQBrnRtfnLAwEPfYj4dKHJzhnEzj3A+mC/EFCKK1O+P7O+59arpUSvsLfTWm
	jJAg6GpSGWeTuMHEu0cFQy1JAfmw5Wk21ZzbxCM7QaLCd0voeMXlbNNHOhb4w1h4lfLZKCX0aGh
	QVJId5bBEb7rfVT9r7xhgKbq6IT7W7hEmMZ7dypArdceJ2TGQQ8omrCkwQez6uUz7qwxceyuYxv
	tnIbWnMF4dVkn790boNyUcHxWPJ3ERjYrspiMDsTto6Ns+iARCMpx//eXu4ncG3RGjBm96GGw65
	ex9sEz7ni1odQbOwuJgci9OuVINs278Q=
X-Google-Smtp-Source: AGHT+IHnRTtiNbjExYWwvoR2t+W7MP9bwGubNxYQG/OewKoIdPhHsxX+NcKse+IqZBIXhDqj/IpvGw==
X-Received: by 2002:a17:903:2b04:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-22fc91caf3dmr64938435ad.52.1746829705327;
        Fri, 09 May 2025 15:28:25 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:24 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/2] PCI: brcmstb: Use "num-lanes" DT property if present
Date: Fri,  9 May 2025 18:28:11 -0400
Message-ID: <20250509222815.7082-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If present, grok the "num-lanes" DT property for Broadcom STB chips and
configure accordingly.

Jim Quinlan (2):
  dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
  PCI: brcmstb: Use "num-lanes" DT property if present

 .../bindings/pci/brcm,stb-pcie.yaml           |  2 ++
 drivers/pci/controller/pcie-brcmstb.c         | 26 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.43.0

