Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776E91BD9C9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328825; cv=none; b=PirOsjdhv+SqMssDAX44Xhqpm88vaqMMf8rDvFeGSgfhaQBFaOBZx+aEme5+HFZu0qGf1c22dgYshiN0xjpJgjj5W74dWljHWyJnqNMxPh8DbZewUERjW08SUwcR1X8YNlR3iLmngGfUHKb0fELtmSnJcuRQNjfaNSF8u4GaWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328825; c=relaxed/simple;
	bh=tFyJCy/K8B41yM0mnXdn8pKsFHaDMNuEeTac00ImmcU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cmGgy0uXGANoZ5h8rATrN194n2Vb/mzQ6luT2uGnjtl2LgnjsbX6VTYIDDwW3DKKL76uzMslaTKHI51MrPdyl1umAoZMBa/MNrqvTmAxk1nTqH9lXzy4uBS5QkZ1QNQh3+IYu1rmYNxdycNkYbEfJ8G47QL9QOyyg1euDev+x/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: nXnsUZqfQ929Rq8kR0tzew==
X-CSE-MsgGUID: T0l3bknqTvypqtYkg4PB7g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 May 2025 15:53:35 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2CFFA4000FA5;
	Tue, 27 May 2025 15:53:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH v2 0/2] phy: renesas: r8a779f0-ether-serdes: driver
 enhancement
Date: Tue, 27 May 2025 08:53:05 +0200
Message-Id: <20250527-renesas-serdes-update-v2-0-ef17c71cd94c@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJhNWgC/x3MOwqAMBBF0a3I1A7o+CncilgE86LTRMmoCOLeD
 Za3OPchQ1IYDcVDCZeabjGHlAXNq4sLWH1ukkq6qpOGEyLMGWfnYXzu3h3gBnPbS6j7EFrKdk8
 Iev/fcXrfD4oeg45nAAAA
X-Change-ID: 20250523-renesas-serdes-update-3ec462f16ff4
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748328812; l=989;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=tFyJCy/K8B41yM0mnXdn8pKsFHaDMNuEeTac00ImmcU=;
 b=mMmil/CVmMOLcRb3JyX7UgN1YiwKgd0i0VY6yH0yBuY3xJnnKRVM2t5FOaar56nM27wO28OuC
 Od6KgXZNh8EALs1vFiWlZ6+XI8l6emgp+GTBwPPJOXvdTwouad18yYw
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Hi,

This patch set adds the following to the r8a779f0-ether-serdes driver:

 * USXGMII mode support for 2.5GBit/s ethernet Phys
 * A new configuration step suggested by the latest R-Car S4-8 users
   manual V. 1.20.

Changes from v1:
 - Modify this driver for the R-Car S4-8 only
 - So, this patch set drops the followings:
 -- any dt doc modification
 -- X5H support.
 -- 5GBASER support
 -- Registers' macros

Thanks,

Michael

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
Michael Dege (2):
      phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
      phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet

 drivers/phy/renesas/r8a779f0-ether-serdes.c | 97 +++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 12 deletions(-)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250523-renesas-serdes-update-3ec462f16ff4

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>

