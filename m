Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C420E31B;
	Mon,  3 Feb 2025 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614811; cv=none; b=tMYn0F4aad9sF1Szc8pJW+BTkjVmq+HoQIcZfUy2VYFoAkwyMBdjstl+4w1+4NIb++jJw9Z6zvBHq45Fp8JfgMCTuwWnSGTmDV1nmbwzwbOaE/bGOkkV74HArLQN993dqleopolrfawOdk+hS/+8FKGygvdo5IBUHp9nnB6XFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614811; c=relaxed/simple;
	bh=NgHB5DloDHIam4+aHZexc6F7ttmxCu/XVF8xokkwquA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I6GR6y5b30RJKDXAHdMoZUHc0IO5co8+HE5EAJMvp+X1oOV73n3oxl4wtpEZxTgXtCNLAT7wKsf0iEZo6lIaVUPOfU0wLjw+VY6oDvPamBxCo0V0Tm/5OWuBBIJ0b/2kzbrvGG9uKmcjX/RjbVq87/SZY2F4Lx8Tos9wNWgoTSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=etUCW7mX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="etUCW7mX"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F231425B89;
	Mon,  3 Feb 2025 21:33:27 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1VD7i4Qv6NP1; Mon,  3 Feb 2025 21:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614803; bh=NgHB5DloDHIam4+aHZexc6F7ttmxCu/XVF8xokkwquA=;
	h=From:Date:Subject:To:Cc;
	b=etUCW7mXaxEUohnid7vIzDmGYJQvqdoZ/K75O0As/cCGdzC6ikHvG/ohbNzJfzUH8
	 RhNMc0bADRR5GnS/q8qS1D7Ly7hikZPvuHpgrVQQK0EEGADMndpwMKDJcwrB3jyOw5
	 Kurt2CYP+6XAALO/R8Lr+qhmRGWBRbw9zFCscdhl1t7g2XTPQIXN5g6LEdJ12BctY3
	 hNdi0tnNEOFax3kN6RqJ2tTcF25bBVTDqEnsUAc7bJQAZJYV9dD+ridtHACtLKkGux
	 3/G8kz5F3hesrs1xERrvbqmJCanuOrTOMYsNnJnYcbVUMX+nZRANwcSv3cSaPaw+Ky
	 WYd6kbFwq/GjA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:02:55 +0530
Subject: [PATCH] dt-bindings: gpu: arm,mali-midgard: add exynos7870-mali
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org>
X-B4-Tracking: v=1; b=H4sIAPcnoWcC/x3MTQqAIBBA4avErBN0JPq5SrRIm2o2KkpRiHdPW
 n6L9zIkikwJpiZDpJsTe1eh2gbsubqDBG/VgBI7iVILel7nUz/0UhzhEtaaUQ2E2iBBjUKknZ9
 /OC+lfCMxd5BgAAAA
X-Change-ID: 20250203-exynos7870-gpu-ccb918e23b2e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614793; l=1463;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NgHB5DloDHIam4+aHZexc6F7ttmxCu/XVF8xokkwquA=;
 b=PBJTIzt41PAjc/hotUSp07aBNxP87+pnP736BGstyhJ9LDuyFH2fPXTB8la13Qbeqi8Ax2+zb
 QqZS4/HqxTcCeykc5Sff8XpD1WnFor3JSpbobd3mUib6ZtJZ/eKrGnP
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 SoC uses the ARM Mali T830 GPU, document its compatible
string with the appropriate fallback. The T830 compatible is already
defined in the panfrost driver, but was commented out as it was unused.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
This patch series is a part of Exynos7870 upstreaming.
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 0801da33a385b42fa3a7ff367fafee54b1aae458..48daba21a890d24c02383672518bbd5cd7885d16 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -45,12 +45,15 @@ properties:
               - samsung,exynos7-mali
           - const: samsung,exynos5433-mali
           - const: arm,mali-t760
+      - items:
+          - enum:
+              - samsung,exynos7870-mali
+          - const: arm,mali-t830
       - items:
           - enum:
               - rockchip,rk3399-mali
           - const: arm,mali-t860
 
-          # "arm,mali-t830"
           # "arm,mali-t880"
 
   reg:

---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-gpu-ccb918e23b2e

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

