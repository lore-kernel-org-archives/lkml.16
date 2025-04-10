Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66028FFE1;
	Thu, 10 Apr 2025 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296029; cv=none; b=rzfB3rzYqyPT9OjO2W56mnRx3UzbAQMo2OTApdwTrCz48KvYfWm2h3rQpBA9xCk2gMGT9QCnqRS/hAhduTFSaZALNIPUFwfE3JWIDdtNWZA++UVHbxiC9WbKx/7s9hFI/MF8PctFmjPief4COEiml292ueP9K5XAMi4Z3ci7JGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296029; c=relaxed/simple;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+8IDXv66XYQSVTgMERGAog+pTzHo5p6lHDT80U85bylf+a5HOj8MeK8L6dkKlVpif9xRIhDCIdO8nJomlFZX7FYtwpJRdnU2Mgyb3UxKv5jzXd39E+daeZbd90cLTRcQRFzcRB7NGWEwmHIcVvVtsZVdGSxbMJHINg785bmAWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Oa+Jj9gE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Oa+Jj9gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296026;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oa+Jj9gELgWEGAv6WYEL2QK8dVMFuy7Ec2o5AkYPK9n5IXCHJVdZPGfgoXSZ1cErr
	 nVVZpCiKxACoV7zSqAsQSoym1W+nzUlIoeqFVmWfrcyVchyMDnzdY9R3F0O/z5zNht
	 R9V11x1KP3rn1M5PWQ9QhHGGAxVUJxi6GbT1B3yP0PJrrgyTkcCN/4qy7rAWLbCApK
	 ymRCG17LpoS3au45gAQVv1PH7sJbEHo3jrWDIT+MpgcAhIV9lc5yDONXjmOVXGPRrN
	 e+VE6D6xfGxAnH+ht/cK2kZGOSuQMC35EYKvK2b2Scr/RmyGF4QPrstHYlF4yMtM5I
	 +P7mqTLPLQGzw==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B4D217E10F7;
	Thu, 10 Apr 2025 16:40:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/5] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
Date: Thu, 10 Apr 2025 16:40:16 +0200
Message-ID: <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
regulators over DVFSRC.
This SoC uses different values for the vsel, hence it is not
compatible with the currently supported ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index 704828687970..acac5c869f2c 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt6893-dvfsrc-regulator
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
-- 
2.49.0

