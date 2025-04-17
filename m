Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920E22424D;
	Thu, 17 Apr 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879481; cv=none; b=CBTXb1RoVDoSIj3ouFOGS8a7z6fnGcwUwcFY+xcnvJIgQNd+ySvMBnxyafnp56/gSNIF8U4D40hjTPJGfLBFJ0AlNWVF32FR6aw4JHIZO5YD4ST78EBFLHnDO9/V4vF9l5dwcyUyZuVE3NdgP/o6jz9kso+6ohVechHOwU0RsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879481; c=relaxed/simple;
	bh=PZhraFVEqkkbwU0S7ke2vhkoESu/QbDsvHZPg8LdjGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qs5R94uozlnDa1UQ0lRJRP3gI0C2+Zr1wkUxa4Ypruw+46vfHG8kJohblMtJC7Bb96VHpVTnIOhAoiI7rZKT2A7XwHtPaYP88iq4vjto5Y9XFLVDWqeVLE9Th+yugVwDahP4AeniQc1AkK0hoylyMCJnNZIVl9egg02DlPihcqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bht7BhzX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bht7BhzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879477;
	bh=PZhraFVEqkkbwU0S7ke2vhkoESu/QbDsvHZPg8LdjGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bht7BhzXNlLeIdHemSTFDtvGeSK4MFObW1n+Fw+uPUMRwBT+ngPr1KeC7xyiZDyF8
	 5R6+qDF1px5gfPv4sIR9AWGqSoWoD97I6D6KUwp1Z7CmZGyi0xxw1Id1v0HDNxx+9E
	 2dFxzx9SrZ7fjDAYJbsUksCVXNZbnrKYGANAHX7hVnWA+MFtawj8o2UoQTw5+e0VET
	 PrUxrERcCUUP4Gr6lz7nqDxjs+HaOoyyKcWJV6EBbBBqOS4N1hD7l4ZHUXM2QHALXw
	 cXMp0ncN10VtrUAz9bh2xRDnqpGYAdVXn8OtwRSVpZWsgDR1NZsRt6aAn7mnXhlBfG
	 /Z5kS+pegBvZg==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8475717E153D;
	Thu, 17 Apr 2025 10:44:36 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:33 +0200
Subject: [PATCH 2/6] ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to
 COMP_DUMMY()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-2-30587426e5dd@collabora.com>
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

ETDM2_IN_BE and ETDM1_OUT_BE are defined as COMP_EMPTY(),
in the case the codec dai_name will be null.

Avoid a crash if the device tree is not assigning a codec
to these links.

[    1.179936] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    1.181065] Mem abort info:
[    1.181420]   ESR = 0x0000000096000004
[    1.181892]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.182576]   SET = 0, FnV = 0
[    1.182964]   EA = 0, S1PTW = 0
[    1.183367]   FSC = 0x04: level 0 translation fault
[    1.183983] Data abort info:
[    1.184406]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    1.185097]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.185766]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.186439] [0000000000000000] user address but active_mm is swapper
[    1.187239] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    1.188029] Modules linked in:
[    1.188420] CPU: 7 UID: 0 PID: 70 Comm: kworker/u32:1 Not tainted 6.14.0-rc4-next-20250226+ #85
[    1.189515] Hardware name: Radxa NIO 12L (DT)
[    1.190065] Workqueue: events_unbound deferred_probe_work_func
[    1.190808] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.191683] pc : __pi_strcmp+0x24/0x140
[    1.192170] lr : mt8195_mt6359_soc_card_probe+0x224/0x7b0
[    1.192854] sp : ffff800083473970
[    1.193271] x29: ffff800083473a10 x28: 0000000000001008 x27: 0000000000000002
[    1.194168] x26: ffff800082408960 x25: ffff800082417db0 x24: ffff800082417d88
[    1.195065] x23: 000000000000001e x22: ffff800082dbf480 x21: ffff800082dc07b8
[    1.195961] x20: 0000000000000000 x19: 0000000000000013 x18: 00000000ffffffff
[    1.196858] x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000006
[    1.197755] x14: ffff800082407af0 x13: 6e6f69737265766e x12: 692d6b636f6c6374
[    1.198651] x11: 0000000000000002 x10: ffff80008240b920 x9 : 0000000000000018
[    1.199547] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
[    1.200443] x5 : 0000000000000000 x4 : 8080808080000000 x3 : 303933383978616d
[    1.201339] x2 : 0000000000000000 x1 : ffff80008240b920 x0 : 0000000000000000
[    1.202236] Call trace:
[    1.202545]  __pi_strcmp+0x24/0x140 (P)
[    1.203029]  mtk_soundcard_common_probe+0x3bc/0x5b8
[    1.203644]  platform_probe+0x70/0xe8
[    1.204106]  really_probe+0xc8/0x3a0
[    1.204556]  __driver_probe_device+0x84/0x160
[    1.205104]  driver_probe_device+0x44/0x130
[    1.205630]  __device_attach_driver+0xc4/0x170
[    1.206189]  bus_for_each_drv+0x8c/0xf8
[    1.206672]  __device_attach+0xa8/0x1c8
[    1.207155]  device_initial_probe+0x1c/0x30
[    1.207681]  bus_probe_device+0xb0/0xc0
[    1.208165]  deferred_probe_work_func+0xa4/0x100
[    1.208747]  process_one_work+0x158/0x3e0
[    1.209254]  worker_thread+0x2c4/0x3e8
[    1.209727]  kthread+0x134/0x1f0
[    1.210136]  ret_from_fork+0x10/0x20
[    1.210589] Code: 54000401 b50002c6 d503201f f86a6803 (f8408402)
[    1.211355] ---[ end trace 0000000000000000 ]---

Signed-off-by: Julien Massot <julien.massot@collabora.com>
Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index f0bb59cf581b1e3bcfa66406d31de446a917c6c6..a370b8af8c282bbcafce82561312e24c515beea5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -831,12 +831,12 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,

-- 
2.49.0

