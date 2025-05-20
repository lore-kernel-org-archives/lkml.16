Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A662010EE;
	Tue, 20 May 2025 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727086; cv=none; b=HwgaIW2utNFKhVm/p+9LnVN+xw7wTrGyxHEbKYuTG7HZ5J1gMa2XS9oZ32n/9HWd66bz6RXtvntXR+pl9LkhqOFfmDG5/4rmn+4WAFyHiVRx2qp899yVMSwI9n+gVwz/zDeIpBj0BmUzhBrAjdJ+Cq/U5+szTk7QBkWmadVAZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727086; c=relaxed/simple;
	bh=2XGlz9R8H+zhZDJ5kNa0PjUKq77CWh9IQL8V2XTDtw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cK6AiuDJZrz1SKr/k4yS5KCbDQbaGIYu5pANiVBxdRV1jLjPpUbMiubQeOa+D1RXMuMrz+YjHG2Qw77j6kMQ+lLIF2Yb638l0sq7owaOkQqjhvII9Dd+zE2yilOF3/K62WL+7gNM3UphssfnOTzV2pd3PJODJMv4+tulC9GnQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMbN3d8D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMbN3d8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064D7C4CEE9;
	Tue, 20 May 2025 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747727086;
	bh=2XGlz9R8H+zhZDJ5kNa0PjUKq77CWh9IQL8V2XTDtw8=;
	h=From:To:Cc:Subject:Date:From;
	b=JMbN3d8DC8scld5c7jdCdayYQkAyNvArAuJCNCr6X8yEvCHsZOje861OunHeqkq05
	 kR3CCwYXYG4y3XZaVuuYV/N5XZjNflV/Fy7P/P5ttuX0RtEjBitLPmR9LeWqfs1HfX
	 9QJLowFXp6606GR3T32V9hqHKEK4qkerzd4OGW/Zaevn7KTpw1HDal2adE+GR/EJEg
	 sRdCmeNMdZ6IUhOBoB7q5VtM2Msnqgwn2iTGdBlQ1a9t/pkgKCxdV3ft6XyVj7eujH
	 Oy7thN/SuZpn3g8maPPSfXWqmFoyEj5VKPy4dHq1HdJzhrttZRa9ts1GHJbfhdLkCJ
	 SgXncVH5xJxjQ==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
Date: Tue, 20 May 2025 09:44:38 +0200
Message-Id: <20250520074439.655749-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54..1ac1f0219079 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -57,6 +57,8 @@ properties:
       - auo,g121ean01
         # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
       - auo,g156xtn01
+        # AU Optronics Corporation 23.8" FHD (1920x1080) TFT LCD panel
+      - auo,p238han01
         # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
       - auo,p320hvn03
         # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
-- 
2.39.5

