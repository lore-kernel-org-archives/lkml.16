Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0222F153BF0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=QBIyFI2Q71zTQsgaROF1Xx1HhbjjKi7FVNnqn92Yqfd+FOWkKbw/Z8BDaENnXFjRi2DnTOMJGWoSQWhAB939hEhDe7reORzUnH3n5NCyQUMozumrkuyXFDSRpY+DLxwLHCccsQbvWD2PYLu+sKAkNOiGwqRTBZZKSC1nHH1eygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=UJS0OYy0ef9mbviZ+sxQd1YSz71cZ9/kFDU1csLnVqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9MNaH6+3q2iEafSMhWV+7YkcLk67BZHZovy61m5MxpBfyNL4VqlkPtQKxYM838gCY8rjIpUN4QYySL2W42TLDT8RP6XbmbJPD3nhOoDXUb1y61vSQ+iizFrpa45TsXx652Kiel/RQe9h76Rx+3MjrZkw0rLOn36+9I/nALrCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWz9trbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWz9trbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6059C4CEF1;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=UJS0OYy0ef9mbviZ+sxQd1YSz71cZ9/kFDU1csLnVqw=;
	h=From:To:Cc:Subject:Date:From;
	b=FWz9trbdLY+aUWbXnbtR2nDar9Ve6QYzpBLkOsAJ4wPx5+YrwmQbXIxruFdElikfd
	 5PKBIrvhBJN/WeUzurJOB2pINI9R/sMK8/hUjHoeAkLg+alILUNoNNCTgpHiSipMjI
	 5XWhsjzlw7EgxzOLASaS01j2p5Mt13JhgAqKItHcXHcazyv6sI9w5NYzW3CDThn4v8
	 9zOAUbURK4d7+AEwBXLC82+SeSuQAvhNlU+rOLpIgzgGnT3qq7RD1z+Jsb/L9YjKHv
	 eq5kth1xThAmELH4+ioMfs9ufDQYDusaE2Psi0XIzohqW+9GQnWC+5wVyJ4tXPuscZ
	 asy0ZvV5cwE1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5O-000000002sa-3Xze;
	Fri, 23 May 2025 10:49:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/7] phy: phy-snps-eusb2: fixes and cleanups
Date: Fri, 23 May 2025 10:48:32 +0200
Message-ID: <20250523084839.11015-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are a couple of fixes and some related cleanups to the recently
reworked and renamed phy-snps-eusb2 driver.

The clock and repeater imbalance fixes are not marked for stable as the
first issue was introduced in the recent rework which is queued for
6.16-rc1.

The repeater imbalance has been there for a few years and
could be backported even if this is now complicated by the
rework/rename. Since it only affects a resource leak in an error path I
decided to not mark this one for stable for now.

Ideally, these could go in along with the reworked driver for rc1.

Johan


Johan Hovold (7):
  phy: phy-snps-eusb2: fix clock imbalance on phy_exit()
  phy: phy-snps-eusb2: fix repeater imbalance on phy_init() failure
  phy: phy-snps-eusb2: rename phy_init() clock error label
  phy: phy-snps-eusb2: clean up error messages
  phy: phy-snps-eusb2: fix optional phy lookup parameter
  phy: phy-snps-eusb2: drop unnecessary loop index declarations
  phy: phy-snps-eusb2: clean up id table sentinel

 drivers/phy/phy-snps-eusb2.c | 39 +++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

-- 
2.49.0

