Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F371BD9DB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175853; cv=none; b=jOsSZSH/sAl1DNiW4KpRFSfPpQAgpoEfFg9ksbTlp1PlS5lV5+iVrlvZHNvXSR7+fs8E5SX/v+xrIf7zxhKLbXQuXihUnNoYoqh6jrDtZWJqXvKOSV2QFrgShDH1gB4cp95cHMUwQ3LSCON321ocsYcJVXpqHVzg8/hgU1i/dvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175853; c=relaxed/simple;
	bh=4F3nvU/PACynY2wgko4Gm9+vXkERZ9uWaA48QMu8+PQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cz9bVJ7d9IyJgw1ubGA8Cliua9byqjVdbPScCH4KqqJyMt1un/O0da0JicUI1UXAAgByUfYlZbM2f7R52uyTzTwfQHNTKs7hpkkkkLCuZG3kxumj0B0uJ9LuFwfbCIZs1yHxtUQN08eeAWXhennswJbG1QYiIPnm5Ghc+WhR/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1thP5E-0001zJ-SJ; Mon, 10 Feb 2025 09:24:00 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1thP5D-000DBk-11;
	Mon, 10 Feb 2025 09:23:59 +0100
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1thP5D-000qER-0n;
	Mon, 10 Feb 2025 09:23:59 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v4 0/2] Use PHYlib for reset randomization and adjustable polling
Date: Mon, 10 Feb 2025 09:23:56 +0100
Message-Id: <20250210082358.200751-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi all,

This patch set tackles a DP83TG720 reset lock issue and improves PHY
polling. Rather than adding a separate polling worker to randomize PHY
resets, I chose to extend the PHYlib framework - which already handles
most of the needed functionality - with adjustable polling. This
approach not only addresses the DP83TG720-specific problem (where
synchronized resets can lock the link) but also lays the groundwork for
optimizing PHY stats polling across all PHY drivers. With generic PHY
stats coming in, we can adjust the polling interval based on hardware
characteristics, such as using longer intervals for PHYs with stable HW
counters or shorter ones for high-speed links prone to counter
overflows.

Patch version changes are tracked in separate patches.

Oleksij Rempel (2):
  net: phy: Add support for driver-specific next update time
  net: phy: dp83tg720: Add randomized polling intervals for link
    detection

 drivers/net/phy/dp83tg720.c | 78 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy.c       | 21 +++++++++-
 include/linux/phy.h         | 13 +++++++
 3 files changed, 111 insertions(+), 1 deletion(-)

--
2.39.5

