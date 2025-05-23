Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22B1C5F37
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=uvK/sixBiKrCSUPyzWox0lUUaTU8OHwGsd2YSVoIgrfrVU7OTlvhPlr9OjdUI2FkFMc/HsOVqW+EgNw/nnEcaJoE7nII3a9cE9Noj4NHePfedabl89jk6xuf4jkROcaJPy6lNbadGkipP/gwEhxEjvB2k92vcpLAHExtAmDtEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=e/J0slcAPFlAeKb3Rmtwb/HqgsdPPK5dqNn+4ShKjiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fioDNvN7+sVPv23IZ5OybqLl3lvLVstlKcFNmF5YvS/M5f/hO5SypYijg8CPjA0b38Y1ryNTWAueUGU2IZrYjRKVEZeADsEZwMJUFOYDUDYBQioZQuPeROpnL/94Qa33AZ2BaaSZU1ii4fGIyZGprbC4Loz1mK53olad+e/tFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cb9I3s1u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cb9I3s1u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE71FC4CEF4;
	Fri, 23 May 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990145;
	bh=e/J0slcAPFlAeKb3Rmtwb/HqgsdPPK5dqNn+4ShKjiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cb9I3s1u6vV3raqI+2xvTiDFd8qLuBVoDZKz9vgCd66/9oxjOPplcG1GQql4fvn5d
	 yaxMu8xokBnWNJk+sNZU8BEyCOnKULe3tdhLbbcrK2wqKrC4NcVnzPxlbxAbflwEyt
	 E3spZFClIPeTWrxsLxI5li3FdRI06z5ElfhbB/CZCgkH5fcyxumYq+q8qiRH5rGQx1
	 jGpL8MsmM49HythrrDTmrpvdMGiNyLwTx2tgh/CVnnWKU8LsKWCndU0bgndMSvaCDi
	 c4XDyAExcxHuf3ngJCwCvywPt87YsKqRHCeKqvob5EpF7gPswYF23U7p11fTYjHxRL
	 NosiNwyLt/f8Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5Q-000000002sm-09VH;
	Fri, 23 May 2025 10:49:04 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 5/7] phy: phy-snps-eusb2: fix optional phy lookup parameter
Date: Fri, 23 May 2025 10:48:37 +0200
Message-ID: <20250523084839.11015-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523084839.11015-1-johan+linaro@kernel.org>
References: <20250523084839.11015-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_of_phy_optional_get() takes an optional name argument as its
third parameter and not an index like the recently replaced
devm_of_phy_get_by_index().

Replace 0 with an explicit NULL for consistency and readability.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 232c5e8a554f..328e67ebfe03 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -581,7 +581,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, NULL);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.49.0

