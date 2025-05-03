Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEEA27A443
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303058; cv=none; b=TeqFoeSY6vKXzWQJy8dCuznji8T9PFhvWTIgH1312eoKObykFO7NaEnUT5GklHA7qOHU3ZRj1OQPYr35mpCsByihhcxga65jZ9f2Dj7cLmhxoq9usgEjet63Pvra+t8M9ZQzPB57WBbZMMdKLWm4CDcr63AMiOysfvrBqTnQbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303058; c=relaxed/simple;
	bh=5jAzgltTZK1stjg4KHgkoUmvrmpASyagPJaFTrsivGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGL8ybKJlQCBg8gQavhvCpl45gzmLVcPt3avghvRIwtxt6q8VntL1uB612ZBhYoGvWAz8XeaNqDCH3kwdeIqrlmiue6ct7rmcybUdIbk3Dqucwst3TS5R/yCcH4b+n7AlcVN3mqiQAHjtLS526i034xPua8fkISWs+3RDdSU4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yPOrj21k; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yPOrj21k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=UXmmAlErtFOsXEtXEzutgc2RcV/BROHq0bT3G0kg3i0=; b=yPOrj21k2YRKQqJqEDNmNvBEsM
	BsqHrb/Sx/v0fedPx9GURlrT4D8Gpsq6tLpvtWvEzhvZE5dWEsAsrfUB/3c6Fvbxg5/duav7uG1Ho
	2KgvOMbBqeY3Iw9gEKM55ITPl9mJlu6bFz+UHAfDpf+kYuTnp28kMnseBejDB7L3K3PJAE4QELfqF
	J4cmmfY1MbczlXvH89NYUYDNg0CRVl3mQ+t1Y9c4Qwp8Od/dVChScrNA9zZTLlhITCE/Zffatnfj1
	ntwoxQvS4WrsYRY9nQ1AtNARMOM+anIibRCHfa18aeSIZmOgSb2/EPWJMJe8naeiPpgVpIiVEI5iD
	/EwFI3RA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJCH-0001e6-R6; Sat, 03 May 2025 22:10:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Some graphics enablement for the ancient rk3066 marsboard
Date: Sat,  3 May 2025 22:10:41 +0200
Message-ID: <20250503201043.990933-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable both the hdmi output as well as the Mali400-gpu.

Did this to test a patch converting the rk3066-hdmi to a bridge driver,
for future improvements, so it'll be nice to keep this around too.

Heiko Stuebner (2):
  ARM: dts: rockchip: enable hdmi on rk3066 marsboard
  ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard

 .../boot/dts/rockchip/rk3066a-marsboard.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.47.2

