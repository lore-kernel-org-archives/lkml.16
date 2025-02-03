Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC56136;
	Mon,  3 Feb 2025 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738547507; cv=none; b=HXv9oSjwrsc+e1tNjklIDJQ48c0ZqPBiR0Aekc80zcJIq+kOxB0FmLq5Zfxqar3UBgOay4RTeYgqcv99jU332adkTk+IYgz5Gi3qrzUaExAlwU4KQXVTPc22XcFHjeHgGyRm/utb1ZsXmO/ree5+d3XJAiow7yt+sejV5jrOstc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738547507; c=relaxed/simple;
	bh=yyavM60DxR6SYYgvBwO70UChJbDUQ0j1pOFNYqME7HY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4077nnrNd6V7+6sBp+s1PWbDI6xdQr8HvC15HkAsODLDAxPcEkm2GBpvK1X0asDZsSLsS4ZpF06mx+Ye422D/PXk9G4ZqmuWF/0MG1ixEbmNPZBSJCCWxw4l0CCjIYW7xYVm77QGUI81g/PmfZ5wtj7oyV7cIP9Ku+jmAHgkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B841EB2232DD;
	Mon,  3 Feb 2025 02:41:35 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 0/5] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Sun,  2 Feb 2025 17:37:06 -0800
Message-ID: <20250203013730.269558-1-e@freeshell.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with StarFive VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110-common.dtsi needed for boot so these
can be dropped from U-Boot.

Changes since v1:
  Do not set unused eeprom label.
  Do not set no-op zero-value assigned-clock-rates, adjust commit message.

E Shattow (5):
  riscv: dts: starfive: jh7110-common: replace syscrg clock assignments
  riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
    cycles max 100MHz
  riscv: dts: starfive: jh7110-common: assign 24MHz clock-frequency to
    uart0
  riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
    boot  loader

 .../boot/dts/starfive/jh7110-common.dtsi      | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)


base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
-- 
2.47.2

