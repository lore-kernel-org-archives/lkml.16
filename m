Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8BC227EB1;
	Thu, 17 Apr 2025 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879484; cv=none; b=JGKgJE+gBaOJWPamLuOjL6A7KXLzME00a77O9T46Hzu9Ke/ErX1b6Zlwzj02zSn241Znz7cLHAYflcZpM8LSP321gvqiy6Qd3sH1s5I1dx2sTtmMlJC9I8n6NxLQmO6WstUCUXvswpH2zSbZXiR3SVSagzEpAm/MGRLHCM6bkEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879484; c=relaxed/simple;
	bh=yYuncH4o/OXu+LBXvJQSH5seIVPQe5LqP78BPBexpWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPtsoCOuB4jkXflaKzsGz5JEQjlo04k/rtt2bZ8ZvlPb8yD1qRnbEKH98aJf4SQFCROq8MgkvInBcgRKPbj47cG24fjpn/cIsgCBUWZ4Yp/NAyeun85yvJBDN8uN/y90vpph2axKXSiKdNv3zBSQaznI/OZ1O7h5XivaRsDUH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bQ9G7o1O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bQ9G7o1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879480;
	bh=yYuncH4o/OXu+LBXvJQSH5seIVPQe5LqP78BPBexpWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bQ9G7o1O5KE5HrcB3TN3qvG0lAcYgiwSq8nLNUDwggbHNXkUEm/vJp5dWR7P5Ddo0
	 zZu9yVmDkMG5hH1Tw/R6gRFTl1rXZbaYVcVL6T80bHpnklT/4vLJY6vGwcdHF2ZU0W
	 5ZeQX5xatb6jSWo05Ymc6or10ioYQh+N4gTa9B4IngYp0l2m50GX32OQvrdPlnQ87q
	 21cb2xNifROdMdwFQPnvAGBeTyl3s0qrmfKzog+TvMCs1F5Nurtn+/d7svQ4lNXGEw
	 +RzEnVvlGCc3/CQmPaJvsUeSIZvBX90+U/CjOWDXmJRrGyNB9dZvioPrPnffc22Kaz
	 W/wfu2stcKu/w==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E19817E3655;
	Thu, 17 Apr 2025 10:44:39 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:36 +0200
Subject: [PATCH 5/6] ASoC: dt-bindings: mt8195: add missing audio routing
 and link-name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Add missing DL_SRC_BE link,as well as Headphone L/R that are
provided by mt6359.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 54a53d15f40c0af56a2a0221025f3a090a05b6e6..356e1feee9620981aadbf91115af1d67a735bb2c 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -45,6 +45,8 @@ properties:
         - Right Spk
 
         # Sources
+        - Headphone L
+        - Headphone R
         - Headset Mic
         - HPOL
         - HPOR
@@ -89,6 +91,7 @@ patternProperties:
       link-name:
         description: Indicates dai-link name and PCM stream name
         enum:
+          - DL_SRC_BE
           - DPTX_BE
           - ETDM1_IN_BE
           - ETDM2_IN_BE

-- 
2.49.0

