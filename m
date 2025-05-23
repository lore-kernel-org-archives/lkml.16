Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F171EF368
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990146; cv=none; b=FKQYl8kMNbCTMQdDyY39ZnbX8lJSEOMPO2DNTa1SEnbrOWjyEtLi7An8B/RzvS+oHXk7YgKdO92ZngSXvlTLnIJiDmLp0AXS7w4wv4qo2wg9gNGRJOOofLw7Bb76aSpiaorpT0eM/LquXAF7s67FOTj2I33aBb6PvmQbPo0dxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990146; c=relaxed/simple;
	bh=44O0pIXLXYb6xgrbxG5UOz2GoRN5lhv+sgEH3kFJxIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvPR+E98vDuDiygz7M5SCYulxDZjvUPjQivN6NS4RI1+H+8i83uPqtLqqjq7/xmPbsvptvWSxKTgnuQlB1Kxam2vFwXJ99lu3us0zM4rgAR/3Qji555ZT8tOjJccFDFwi4+BehUaB4GpBIr8AO9LQfKypvMb/cVJ2X771g5oM8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tF/iu7ai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tF/iu7ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C333C4CEE9;
	Fri, 23 May 2025 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747990146;
	bh=44O0pIXLXYb6xgrbxG5UOz2GoRN5lhv+sgEH3kFJxIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tF/iu7aihQIOj5z3vuguuymFqzR9jw7zoNinvNSQixZg+WSg7A3cy62chYad8XJ34
	 VHD+eMAV2KPUtjvF5dAbQBuJPveXm+4jO8FdxAje2Edxko9Va/czBqoY+SBwax4leT
	 ea57NXNyRTQXOKIZh8gyKpzbNBMIZ7Ly7aUgPBWKma4L9OVFa8VPsIRUKGBlSNF/2W
	 Yp7H9AfeYxFWiphZSbhSQqEV3UdBmNitm0ZBG4UcSZ0yHuJnP74F6JRozWBtJ2taE+
	 5FvNobb2HGxanb+VJynsf8/1EcOO9WzlX/4FikCalaAQOPX8zAywEhWsXCNtjdiRWZ
	 r7Aj59Xp4j2TQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uIO5Q-000000002st-0oTB;
	Fri, 23 May 2025 10:49:04 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 7/7] phy: phy-snps-eusb2: clean up id table sentinel
Date: Fri, 23 May 2025 10:48:39 +0200
Message-ID: <20250523084839.11015-8-johan+linaro@kernel.org>
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

Use a more common format for the id table sentinel for consistency and
symmetry.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/phy-snps-eusb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index c67712bd8bba..cf62f2221366 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -611,7 +611,9 @@ static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	}, {
 		.compatible = "samsung,exynos2200-eusb2-phy",
 		.data = &exynos2200_snps_eusb2_phy,
-	}, { },
+	}, {
+		/* sentinel */
+	}
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-- 
2.49.0

