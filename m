Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9995182BC;
	Fri,  4 Apr 2025 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802840; cv=none; b=Dex4vObxmPe3tGu58sM4buL7O88jSNqOIkbl4ycc3T/by6ulUJgvPsit7pdfaLm6kGoiiLi1aGa2zoU3N+I0NB4p5/y6C1SJtW2bTxi4lC/tGq6lLDD8m2LOdo6NfVWLUNq2r6u0cJO8vPLyb29JyaKhdx1dNYE6NrQCBcInPpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802840; c=relaxed/simple;
	bh=zFEs3x1/XsRtCRQwZtP7pGruMSG2FDF0PmU+lKKJ9YA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbjOuTLXHvp1MElTrulsltAVkime+fiiH6M/w2TqK5+vvhmboPwxNN/arfhR+u1aFRncgNKPRcuX0xJlCWDiOV36ZDpqwjPrMVjaurnrS+QMWJ2zGyjDL1k0HRdnjKHsw8lKwfJnBCT7hIQabMSp5y6UO18RzuPMExxZ7XVJjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJOZ37XT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJOZ37XT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050E1C4CEDD;
	Fri,  4 Apr 2025 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743802840;
	bh=zFEs3x1/XsRtCRQwZtP7pGruMSG2FDF0PmU+lKKJ9YA=;
	h=From:To:Cc:Subject:Date:From;
	b=lJOZ37XTk6Gzb058yCFIkSasbWMpjaSRo0WBYPx7oY6I29arVAfkMJzlDIq3Oz2dk
	 OxrS2E0bPYx0vVtvExa1HT+SKWo2fPbvwpMWpYoyp/bI03lRa50nFWQoVLCbgrwTNt
	 +YF+OBmSLnZ/qPjNCX3+bwJkTjRf0f3NuR7S80xejJNinrTllZIBi+hrSjSs/sjdXW
	 mOWTBqGz4NUOV0jtVHZSe38vBj1DEygyCP6abYkDJ3sI1DgJZF/p1cLm9KdxxdBh13
	 E5nG2vRHjEgPGZ8YaRFhFFhlkD5bkCmMrGHzvcyrgR6V3IbeJWwoGPvV4nE6CKd1Dn
	 Ac0aoJnHA5TdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Date: Fri,  4 Apr 2025 16:40:29 -0500
Message-ID: <20250404214030.401629-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

assigned-clock properties are implicitly allowed in any node with
'clocks' and don't have to be specified. The max here also appears to be
wrong as there's a case with 4 entries.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index b339b7e708c6..8b5f58103dda 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -73,12 +73,6 @@ properties:
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
-  assigned-clocks:
-    maxItems: 2
-
-  assigned-clock-rates:
-    maxItems: 2
-
   iommus:
     maxItems: 1
 
-- 
2.47.2

