Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEB31624CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507439; cv=none; b=a3Qibo7lm89IoyOndOAa1unC14rXrXIlaPypATT2PM8tA7Qc2W4g4Z1nbUFeJdBo6abeUsk0HlhdKWfxV0Yn/oSTGCZqFIMJbasH/oZFJW53HCHflayExKiftlcuFr4hsLueIJCgKxzpnslQGswlvgK6BxS6iEELIoQiVp/NFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507439; c=relaxed/simple;
	bh=ippx7mwC54eJmUHEwJWcTHQzmsugXPAwvfuGdSUFg8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmX1XIMCDQno9lkEI8dn2j5kL+fbvFclPpUw8tyAYlMWDpVRNUuGXE7wI8qq5BPw97ONOhLSf/6z9V9FMu5P1JsvNRIgIRrcusMwWxet40uOXHNLFJ4dNq8xTRB0IOGV10YDeScaG7ef+hsWU7lvYSI5gIRhR2NxCJHVrMEStJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LDIKg0FC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LDIKg0FC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so2732445ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749507437; x=1750112237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LMCevDXMHdSbreINi9ovgK2lLQA7N+OHtW2WG25EAI=;
        b=LDIKg0FC8g/NPykctwpCNthlhZIV+H08nvtTQNWNNuBXVlkyb6AxbLymZUpf0IB3Yi
         X6l+Vk+1TCbBsQk6TsJtLikllnCSzqw6vLdIF3u9SuoYzrCfUBWYP2eGu/9STP8bmupp
         am9kjDh3m75qZ+3iO/DAmbg/PjiPQFVH9SVs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507437; x=1750112237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LMCevDXMHdSbreINi9ovgK2lLQA7N+OHtW2WG25EAI=;
        b=VQHvARKmZWiOe984Hdhdihl/ev/Y/0jR/FL1rJUUqMCZGHDik3/Hd5Dh+BaMtWwJfQ
         PdzBnzzGRs59C5f8JFnFyr7+lRxTnEGiPKskgIr3KUVC6dPoe05ZmWiTziE+m6EAUBQQ
         idk/UxY/KhNns8z/tXqGYtIf/CdVZlH7Am+++e8uLnWQxjWRJ6g4kJhGtFPDT4oH7sm5
         jfFL6DFxNbFIJmgblf/BpfxJeB/ZFPz02XXp+ExbcNOYPXxmAEeoBzcChMCXAQSOwJtY
         8ZnBX6OSUo99r358mUuYRm9fVsv5eF+RBsuRYcNH6KUgnxmO5O7D2r8Hk/pJOI9ac9FH
         8TtA==
X-Forwarded-Encrypted: i=1; AJvYcCUN//moyBTXPlu66an+kFwMlBRk7mchvF7tSR31as3zk2gvA7MDBsvVnLYoS7o81g4SBekE+rHHoogNYoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybzslhPjaNJY2kYiMvJWbUR1tjM6KEpQOxFkQrVGc99W+IYYM0
	41WHHmWOUlEOVlPSQIysNt/59mrbHtSOwEzdCLvQesZRazojs6SOLhNIs9QUb9hiVw==
X-Gm-Gg: ASbGncvVCS1XD+xb+6QTXhwchc3XPgqqhCxJFRbrOFD1RmEcw3rvBrhw26hqc5s18Dk
	LIRTUcFNgKG32CtkE41Gzji9x68REE22nsJdIuOkrMOx+TWA8VujCpCX0MhDvn3oYqkrJi2C0fy
	c2CkzrB+bWsRes3rrWfKmSfyEYD/QHc0YQ1RtGOOfC+EU5FlpiKPOHWOid1X5UNGSCCcaz38yIR
	B8xz25zjg2nKCpYbEoY51B5UYHNqxw3cXLmXU8mCai/IxaDP9ELT10eagXbqjSiHNp8q6s/vS5D
	uOY09xgDBSoCeo5Hbscje41NBsZlswgF+jh/jYxxqO/InyDu9Mea5ltD5mawla532gQqYSfBbff
	Ah2xe7pAnRHRm5BxVCvpz5fkRfBWIkp/dfj1VIUgmPg==
X-Google-Smtp-Source: AGHT+IFUjmcbbkIOR7TTH9wu7tiMbf9RN0Y6LSdxDSg6pkLLd4mf/C1TRHZZ8yuUsvW2madDoeJTXg==
X-Received: by 2002:a17:902:ea0f:b0:234:e0c3:8406 with SMTP id d9443c01a7336-23601cf42b2mr215945945ad.1.1749507437017;
        Mon, 09 Jun 2025 15:17:17 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d65sm59290415ad.5.2025.06.09.15.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:17:16 -0700 (PDT)
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
Subject: [PATCH 0/3] PCI: brcmstb: Include cable-modem SoCs
Date: Mon,  9 Jun 2025 18:17:03 -0400
Message-ID: <20250609221710.10315-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At Broadcom, the Cable Modem group and the Settop Box group use the same
PCIe RC driver for multiple chips.  This series adds the CM SoCs to the
compatibility list as well as some CM-specific code.

Jim Quinlan (3):
  dt bindings: PCI: brcmstb: Include cable-modem SoCs
  PCI: brcmstb: Refactor indication of SSC status
  PCI: brcmstb: Enable Broadcom Cable Modem SoCs

 .../bindings/pci/brcm,stb-pcie.yaml           |   4 +
 drivers/pci/controller/pcie-brcmstb.c         | 193 ++++++++++++++----
 2 files changed, 159 insertions(+), 38 deletions(-)


base-commit: cfc4ca8986bb1f6182da6cd7bb57f228590b4643
-- 
2.43.0

