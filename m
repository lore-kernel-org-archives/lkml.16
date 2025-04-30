Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B220D505;
	Wed, 30 Apr 2025 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006123; cv=none; b=UINkyFwos8k8848Eh3AAH/oDC3D2f5+y5uU9qEqlOds80cfo90t6MpEfvkL2/ITw/QkSZVyY1YlCWw1AwGBbjANSCwIQFhL0B4lGuUrcVx9J/jCpxnSxrwSi7ajtKH8UCheQ2UPOG25oHvp8K1I1qXSV2vH1LKVlXgiDAHB1dSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006123; c=relaxed/simple;
	bh=wc6Yn/jcXcKSRZah9p0lLzGLn5hdD1b1lUHFAJ6k4co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KjHObzaWsEgZ+evbFkOyo4vcCx6TLdhqH8GNBzpU5Sytikf1h1gc319DwU35VcKuxGtrBrR3MuH7QwbETGPZpb3qEquZuFe2l0C+k9WekAJumkMrFSO7WSOZN5j4y2ysUcoi85W5BnqJ9n+68Mm73luwKEGYS/bBM80Vs0sJckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=iKnUWzP1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="iKnUWzP1"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0D6F81FA38;
	Wed, 30 Apr 2025 11:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006118;
	bh=Kt+PJysEfOP7r2Wg4l8xcp//IqyeBTg9yDxzQtKWL+g=; h=From:To:Subject;
	b=iKnUWzP1eoXD9trFYsk54XxIcT1NqnIAKw60ytYeX4YKPTsXjSfPd6dzWlU/sX9yn
	 Y5kkx4u02RVNSQDlXN7saZqJz1uc7IuSWPTORvBg1c0cWP++QZIprYE08WUfS0451J
	 hy3enqHpdNCPXbXK68u6wz1/VrICJ5mtHIMIZiiBwaxmf9E+oy++pOiE9j9AWKtTgc
	 Uf9rFtKvzIEhoGCPNMnBAvM43ewAdLaKwOADpNGjghe73/PqjIcAxRpf/VecZJlMbi
	 HgAWoAAXpG+pJfY83Qi9bB0SgS0bMW2khvd4nZ2I5tAjQhwKCK1RNGc5XBvf5NNmVG
	 l5eIWoJttW2LA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: freescale: imx8mp-toradex-smarc: add fan, ec, gpio
Date: Wed, 30 Apr 2025 11:41:46 +0200
Message-Id: <20250430094151.98079-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add fan, gpio expander and embedded-controller to the Toradex SMARC iMX8MP
device tree file.

All the required DT bindings and drivers are now in next:
 - https://lore.kernel.org/all/20250331072644.17921-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250414171455.155155-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250402102146.65406-1-francesco@dolcini.it/

Emanuele Ghidoli (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
  arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Francesco Dolcini (3):
  arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
  arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node
    name
  arm64: defconfig: Add Toradex Embedded Controller config

 .../freescale/imx8mp-toradex-smarc-dev.dts    |  9 +++++-
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 32 ++++++++++++++++++-
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.39.5

