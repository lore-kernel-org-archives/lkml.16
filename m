Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8A32253B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311085; cv=none; b=PJNFu5WTtYrPadnFFInbwYR9LB7LHl9H7jMqxBkDHV4l+ggHck8x8kTMK3Or+jv5VRnj4NZ+Q6hczAMeNC+7oe5n5OvMgw75M0KfMSHQOdNbZfZfq9VuCFtRBTHCXx8zGCPe4PXzcOjsTLqxBAXiFeMgPeq5x/0EmDX++hlEA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311085; c=relaxed/simple;
	bh=eyOoOX7BlJURWgC3lUrK1LFj8wsnvQ6LRXMmWw09+us=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=MQsliCBRSRfDncGMu5gIDt5icLRVrs+uhZsLdRr5Vm+8Sj+Oki5Zu5vNaEAdyuLd+rlBY6TH+wrO/hGoJyoy9RsKCRryYy1RJw4WZ0xTIXOwwJPKt1AwDNzrty6l13mScVJtuRgS6/2fHVg4aGJKoLU07y8florTRBSFCSxCIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zypvz3HpXz5B1Gr;
	Thu, 15 May 2025 20:11:11 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 54FCB49i003322;
	Thu, 15 May 2025 20:11:04 +0800 (+08)
	(envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 15 May 2025 20:11:08 +0800 (CST)
Date: Thu, 15 May 2025 20:11:08 +0800 (CST)
X-Zmail-TransId: 2afc6825d9dc093-d077f
X-Mailer: Zmail v1.0
Message-ID: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <lyude@redhat.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <airlied@redhat.com>, <zhang.enpei@zte.com.cn>,
        <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbm91dmVhdS9kcDogY29udmVydCB0byB1c2UgRVJSX0NBU1QoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54FCB49i003322
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825D9DF.003/4Zypvz3HpXz5B1Gr

From: Zhang Enpei <zhang.enpei@zte.com.cn>
As opposed to open-code, use ERR_CAST to clearly indicate that this is a
pointer to an error value and a type conversion is performed.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index 99110ab2f44d..43ad467d09db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -646,7 +646,7 @@ r535_conn_new(struct nvkm_disp *disp, u32 id)
        ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
                                    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
        if (IS_ERR(ctrl))
-               return (void *)ctrl;
+               return ERR_CAST(ctrl);

        ctrl->subDeviceInstance = 0;
        ctrl->displayId = BIT(id);
-- 
2.25.1
