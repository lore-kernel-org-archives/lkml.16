Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3391E5734
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166922; cv=none; b=TWcDhOsMt/1xmMULmLSV4T6XRshK1YLeHJCK0UkDFKR0qh2hZGVuwu/Vgy1A1iutPK+/o1kc3HDG2RQw0jqoSBD99xDHFaCKu/bOialMPSslRx+hud93tEhB/GTgKAeqJxQ3hERobmkU4TekqvXj2HmI4xuqfYEP3oNJFfJ9vWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166922; c=relaxed/simple;
	bh=9TiFO9DpL8FHsnS7aosx7M8PyrtiI5uGdLX6cyBls08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OldWzSr9JiATCZMk6jEjWuk5Wae4Etm+J9LshVV1Dzxese3SASHrMaSt6eJxl/iFoPi0+PkKEkxbr9k30xWJHpSbKRVBZPVD6WaUDgFxZmjZn3+Tr3kfEf5pTBPc7K9sF/tRVDXzWA31Nul4txcN42YznnMHtGTAUhQuzDUYDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Aq4w/ymU; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Aq4w/ymU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1748166907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LRQtu9pAILXj3n3z5K+4GvIG0PBjcXeXiH+V/0+/9Ng=;
	b=Aq4w/ymU73O0znnKIRG9/TnTiAMhOQblGuBkUBUuMPwlznnhv2B0tVbsPUsU1awpFqrtAU
	T5dG6X3xspyZ45AmRciswZOarzAFab/twU2S/66Oa2xs2J1stkhErB2HHjte0Q4c6HwUEI
	6Pa5JuDBijviyXcQrY1Rz670EMudM2h/pnNO8Zvm2L9U7NXXtUOfPS4apeq2GhOu/TSCSx
	plDf1CLdmqR0LK/VAHYk5faI1NTbO166zRrvgy+p7wopXcdMKoUGcFWKXIdJyyV1ZmwfOa
	TacSJveg5pYh4hA+unJd7ujmj0vn0dI7mJBeun7+BLWhf51Gff+9GxzEt7aT8A==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Val Packett <val@packett.cool>
Subject: [PATCH 0/4] Add support for Dell Latitude 7455 (X1E-80-100)
Date: Sun, 25 May 2025 06:53:32 -0300
Message-ID: <20250525095341.12462-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello everyone,

just got a Dell that wasn't properly brought up before, works pretty well now :)

The hardware is very similar to other Dells, especially the Inspiron 14p 7441,
so big thanks to Bryan O'Donoghue for the patches for that one.

Works:
- USB Type-C x2, including DP alt mode (PS8830)
- USB Type-A & USB fingerprint reader (PTN3222)
- Wi-Fi & Bluetooth (WCN7850 hw2.0)
- Display, Backlight (eDP: BOE NE14QDM-???)
- Keyboard, Touchpad, Touchscreen (I2C HID)
- microSD card reader (SDHC)
- Battery info (aDSP, unlike the Inspiron (0.o))

Works for me but not included yet:
- Camera (OV02E10)
- Iris codec

Not tried yet:
- Audio

Bugs:
- NVMe drops out upon resume from deep suspend (all I/O times out),
  have to use s2idle for now
- ath12k wastes 1W of CPU power when NetworkManager is running, with visible
  100% CPU spikes caused by ath12k_mac_op_cancel_remain_on_channel spinning
  on a spinlock, called from NM's routine check (every 6s) on WiFi status
- SDHC with high-speed (UHS) microSD cards spews I/O errors during early
  reads that check the partition table and file system headers (though
  actually working with an ext4 FS mounted despite these errors didn't
  seem to produce any more errors and worked great)
- SDHC used to break deep suspend completely (nothing on screen when trying
  to wake up) at some point during testing but seems to no longer happen

ath12k also used to panic quickly after boot very often (i.e. unless it was
a "lucky" boot) on next-20250516, but that was completely fixed by next-20250523.

Val Packett (4):
  dt-bindings: arm: qcom: Add Dell Latitude 7455
  arm64: dts: qcom: Add support for X1E80100 Dell Latitude 7455
  firmware: qcom: scm: Allow QSEECOM on Dell Latitude 7455
  drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e80100-dell-latitude-7455.dts  | 1484 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 5 files changed, 1489 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts

-- 
2.49.0

