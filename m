Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B335244676
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749852531; cv=none; b=oqv3pup7QDY4sZG/sPXqFEXTVO4P3Iq/bg6yq5VLmFIARaCp59qGG8R7DuBNq8Hn/C7BUFrfprcOntvNATSs038+0oKesOftFjVUSWFt1EwS1gmNjrWJCAM7aeBcQOC8lFe0ET6qVd7I8jbVlaXCOUlh2O4Fq/m/2MdSMNJS6lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749852531; c=relaxed/simple;
	bh=3adb9iwNDL+3b3ddGAqTc0sKYYYRuE6AuAvKLz29u68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eY8zT60mO9nYytgtFcisabF6+u7pf6Fnfh8dCrl7KNxhwT3g6OoasfpP9Qc4r6vq8MUC/Psd4H/YXklOuPUesZUKxXMaFAKAseaVfo5PNER390X55aATcqWKP2wFMhkpJ8+b3JGol4U5i7avscdnZ+KzYMfZGlB/3eVfFY5UhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bxurvE+N; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bxurvE+N"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313b6625cf1so2118943a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749852530; x=1750457330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks7Cb5yRG2wcSUyuDs1LCaDeK8IldkGqaX1oBwewLMI=;
        b=bxurvE+NaVOhvA5kAfE8u1sU8V0odIeXp/xzv5vQ8HwBzUtI5HmqFUn+aE06V/ZnQB
         1OIsb/rpDoaHnllOPQaVBGrsNT2+/RPPAIrn5+cT50t8eesDVC/GVDQLl8peBtZUNwct
         gX2bmjXY2N3Dk9Y21vFiH/WhDpb+1xLIUqgwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749852530; x=1750457330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks7Cb5yRG2wcSUyuDs1LCaDeK8IldkGqaX1oBwewLMI=;
        b=B2XgbMn3CzNKpOtO1d8InvAg+Om2m+EZQd+bhjjUgd+mn2MPWT84RK67Uoj3bQhiSI
         wHFqplZ3lShXKzSlbx4e5k4jAH/7Z89XeGEcFo+/pE0alZy/TAZvpGlttP6bg3vRcS3A
         SHmNn9nc4A0c7FpnZH4zPXcXWTVvav1LFPX6DzC8ualllrOPDinMEZsqxtZiKhw2bqI/
         5U2jpwF74yCmP6ePdULe/FD0eu2kUtB6RSBJlGZ/Hd6fcf9Ij0YI8xN/nnMOo78sc2ap
         pLChO1jeE7dLQSMQYHmE70n9wVlQ1rgNVIMBBokNoAQs1tan+hedJXsKNZoVa/bT3cb0
         Y36A==
X-Forwarded-Encrypted: i=1; AJvYcCX/UNPpI/qKiDT2NZw1aftLoRt4PyJ3e9OKa4D0QwHx9pzqz3kfXNxYjxd7UxlWd79qFehEe7hvgnjX++A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOT9UJEqRYGrwHdUHxZhgXBXtJCruq2SmWtytvzVkIDnzVgHa
	3bwjCBSUDIDdFrjPLEvG7fOBp/31Turd3jKJ3JpZyaVqKE+B8eNp2F6DuvUw7o2IvA==
X-Gm-Gg: ASbGncv2liiQ/HFCnmjLaj9rFjCIMFoZ0SGwPXv7aXDex+5kL8kSCvXDDtIliOqjQL9
	q4s3kimWXJUdG0ofvK4f3pBsr/9NuPEdxsPqr9ETvRmmAK+hU7wBlArUBla0Z1RtGMepxWA4vYB
	tBD1R1+pMsJV29KEDP1Ux4lJ0vfZd+cd8lxOzd6JZuaNpzz2TQI/LEBK1GKUy7vX6foQjueYIcV
	wsbvCbjR/abYPru+LAM7OXp1O2KkVCdtFcFXpZ2H81JPOZr8s0uJ9oImyiT59fdu97cJsqlQUVD
	KBzMnpHAl1rrR5bEhDIp9NU9+8ZuQxvwFWxOX/8JjQY9H4Qf8MzzfRtKyiRlAAXDmYa7lacllMw
	GJRdoVh2NiXEOYvy0ryZbEUyREc5OCFvLHwcay3ZgEg==
X-Google-Smtp-Source: AGHT+IGGXunzvDx+YWUHR3DJ8A7LTZeXaJD9LY9Vb+YqHFJOh93QCg2y7/MZBfp5hRzq6QWzHieHfQ==
X-Received: by 2002:a17:90b:1dc1:b0:311:9cdf:a8a4 with SMTP id 98e67ed59e1d1-313f1c06c51mr1846023a91.8.1749852529544;
        Fri, 13 Jun 2025 15:08:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d74sm19593105ad.152.2025.06.13.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:08:49 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] PCI: brcmstb: Add panic/die handler to driver
Date: Fri, 13 Jun 2025 18:08:41 -0400
Message-Id: <20250613220843.698227-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first commit sets up a field variable and spinlock to indicate whether
the PCIe bridge is active.  The second commit builds upon the first and
adds a "die" handler to the driver, which, when invoked, prints out a
summary of any pending PCIe errors.  The "die" handler is careful not to
access any registers unless the bridge is active.

Jim Quinlan (2):
  PCI: brcmstb: Add a way to indicate if PCIe bridge is active
  PCI: brcmstb: Add panic/die handler to driver

 drivers/pci/controller/pcie-brcmstb.c | 193 +++++++++++++++++++++++++-
 1 file changed, 188 insertions(+), 5 deletions(-)


base-commit: 18531f4d1c8c47c4796289dbbc1ab657ffa063d2
-- 
2.34.1

