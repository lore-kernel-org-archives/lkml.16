Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370FA20296A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409950; cv=none; b=lH5Ls8jbeUbwT6wz6g0Fc9j9w6x1ww8CiiIQ6VXWXiRbgubgtzyakkC4EsMaa7iVIHqDgzdYVZkr+f/VToLTMBL9C1XHNY+gb5SyBlG9U+AJLKIpkLjB16gYP2gcASb2JdITKp5vbyym796JVmaKv31H4qfR11tEK4j6ve94SAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409950; c=relaxed/simple;
	bh=0kyZ4m3Y4UQwKjvbj8YXdXEVhRm5J7o8ugG9z52fs/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f9ITgPeKS4GodX7urE48DMj+ViozgO+w46V+o6RGASXMDmBBHULnjYsQDAzwyL/mqmucM16ZC8OfX6t3q6hJAnIdJasOmlACQkpQQGuVsQpLkjI3Rlux4Ym7NFrL31d/K7Zcv+E6e+9beFYoUKZs74q/jFxyV9qp/Suz3Iuii/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: VsJxNp3ZQ/uLDYy/SExasA==
X-CSE-MsgGUID: YQwMdWRNT5ieinerWDHpDg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 May 2025 14:25:40 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EBBCF41728C9;
	Wed, 28 May 2025 14:25:38 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Subject: [PATCH v3 0/2] phy: renesas: r8a779f0-ether-serdes: driver
 enhancement
Date: Wed, 28 May 2025 07:25:23 +0200
Message-Id: <20250528-renesas-serdes-update-v3-0-8413fcd70dba@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOeNmgC/3WNwQ6CMBBEf4Xs2TWwLRA9+R+GQ9NupQeBdLHRk
 P67lejR45vMvNlAOAYWOFcbRE5BwjwVUIcK7GimG2NwhYFqauuWFEaeWIxg2TkWfCzOrIyKre7
 IN533Gsp2iezDc/deh8JjkHWOr/0m0Sf9Gfs/xkRYI/umt31j3Unby7d3tPMdhpzzG4Y1Adu8A
 AAA
X-Change-ID: 20250523-renesas-serdes-update-3ec462f16ff4
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748409938; l=1321;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=0kyZ4m3Y4UQwKjvbj8YXdXEVhRm5J7o8ugG9z52fs/4=;
 b=Ci3aNmr359XvUjFWg5wdbcrdjlSbDyS4bbxWExa5Er6A7Hg4G6bP7O3zxdthxmNxqu7M9G9wf
 eAjlegETIVmDj0jKwI17aalyEcRKs7lU1/QbRIaDM59C5KmRDzF4P9N
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Hi,

This patch set adds the following to the r8a779f0-ether-serdes driver:

 * USXGMII mode support for 2.5GBit/s ethernet Phys
 * A new configuration step suggested by the latest R-Car S4-8 users
   manual V. 1.20.

Changes in v3: 
- Fixed wrong macro (reported by kernel test bot).
- Link to v2: https://lore.kernel.org/r/20250527-renesas-serdes-update-v2-0-ef17c71cd94c@renesas.com

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
To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

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

