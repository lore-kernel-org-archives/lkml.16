Received: from outbound.pv.icloud.com (p-west1-cluster2-host12-snip4-10.eps.apple.com [57.103.64.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235C2980DE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631362; cv=none; b=d+gT5zTZHRzDlW3SHDhbAOcmJckltVPzKzRekRFa2vvaXOVezriqT71AH7ZV9N20tO5TBgRvpjp9cC+xknt+53nbBiIngLmjqdc3OPBhGkGZ3ZzTTIMavz14yIgDs2V3J43X68+tQ/LLA8lBFnjqZ8HD04WzcPJ11j7eqcukBRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631362; c=relaxed/simple;
	bh=flqKRrG+cUbNuOxatPRrz3/xQCwHu4Csd5h3eiZGLzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ERx69D7k5eVRBzJbpRpNHzS9r0NedRJgiyOLD6TTMmUczyIB8tPNibZ8jgL+oSMuRy4PQhlkgmKnTUm5+IE0ixhwpZz6L0+zt8SuF/Zwl2BextgzMEyQBBfVdFmi3ldbduqCLKlW5JLGq/Yh+bS0cOKaZyRPZCB22RO6Y9NJP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=A0hu0MCR; arc=none smtp.client-ip=57.103.64.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="A0hu0MCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=b2KIEz2420Bb2pMgV6oZ8yidp4SHbkJXc5kwpa6Ezmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme;
	b=A0hu0MCRBezRYXjEjMRXpk6MkNwm/G0Z5AU+nywzb8WE65tPyVpyjtnQN0VWyJXFd
	 B8QXhSKtVE9aAUAIqxqOFhJz0S70oSST9qlxUJ4MsfjOfHBrDm99ySDzzTwvdguBN0
	 1+eWmtjh80LLLlhaorTNI/VplrlwJejPJ/9eVbYO/9dweMtz5mTVaDlznVdpVrouVH
	 UG/7EtFg4tdsKM/zjBgmehShjNIsX7xvnFez8WDuG15MpJupu6/Sb/esw56KB2vePp
	 BnAbFwjdX/E8BZESB8dTwP9tyAq/+H1s2lvoxHhHgTzoMKWEiMqC4mtF/Tbq7nnR3V
	 8NS8UqrmvrWHg==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 785D218002B3;
	Mon, 14 Apr 2025 11:49:19 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 32D141800282;
	Mon, 14 Apr 2025 11:49:17 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH RESEND 0/2] phy: core: Remove 2 APIs
Date: Mon, 14 Apr 2025 19:49:03 +0800
Message-Id: <20250414-remove-apis-v1-0-6fddc9a5a16d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2

This patch series is to remove the following 2 APIs:

devm_of_phy_provider_unregister()
devm_phy_destroy()

Both APIs have not had callers for more than 10 years.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
Zijun Hu (2):
      phy: core: Remove API devm_of_phy_provider_unregister()
      phy: core: Remove API devm_phy_destroy()

 Documentation/driver-api/phy/phy.rst               | 11 ++-----
 .../translations/zh_CN/driver-api/phy/phy.rst      | 12 ++------
 drivers/phy/phy-core.c                             | 36 ----------------------
 include/linux/phy/phy.h                            | 11 -------
 4 files changed, 6 insertions(+), 64 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-remove-apis-b4e48d4c4712

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

