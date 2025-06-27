Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C329AB10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015582; cv=none; b=U46b8tXEQXCq1vVBN0pBZcrpl3hC5jOykOHL1cbJjAgsI4DfgN6Rv2VHSlZnCgPxyBPIbCqO9TkSY8foV7tLH59IvRkeMO8RKFM5rFeiQiJj8XzM9grQrBkKWImWhmJSvO4seDqNKaS5Sg9fFYdNPHmiVx9P7DJfAErJs3n5m3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015582; c=relaxed/simple;
	bh=8fXFkUR+Lc1tk8kOkE5sv9OnxPn8iF8vc0Fe038bZOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dslhxHmz+R3vhM9s+XEDAYqNAsB+l4PO8//qKmDUJsStVDfWB7T4YR78JYhnwpPHTapTVpMjeSWoDIkVMEScNHB0KelrD0RCvjA9OXOitPfOkY3ocLgkTUkb21ri8bPekCRFWQey4iYkybCOS3wg+oYoQAr3DmZJ+TcyNb6kb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k2JYZRMS; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k2JYZRMS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DA13438D5;
	Fri, 27 Jun 2025 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6olnAzZt8q6c0vxZagmakWT4mAYlJndaPLBUR1ASfw=;
	b=k2JYZRMS3N3ZmeEMtgDCNkdwgV4jmgZ45jfN/cvpukMIEayjvT9e2iswamBIdZXtUW9Fs7
	N8Bo9tHaZPnBQEHfZuEZmU547BgcmXBBGeETIltByWMFEtrwJFOhpQBPMChrmKTbV/xJzE
	FKJ9SBDkmT0z9nBsB7xWUxzxTfRoXL5NohbSudoR/MgDbxsIHy5J+h98TMEQ/5twTtSB5T
	TTMO5IAguH06a7V7TM4WJ3AgMIqW9qpzaW0wsR9rdmzSxjIxDUaL14N3sdUNmYivn47PJp
	5bbmTS732w10WJzpbAjFNzuy3POsFMxA5ROYxueLrduOPnt7CrZ0P85bgYwS3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:35 +0200
Subject: [PATCH v5 4/8] drm/vkms: Add support for RGB565 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-b4-new-color-formats-v5-4-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2212;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8fXFkUR+Lc1tk8kOkE5sv9OnxPn8iF8vc0Fe038bZOo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCMG+QNArV9IHi1DefOQTUyn/g1vwzRZ31GT
 gJ3mTNFRUOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjAAKCRAgrS7GWxAs
 4vyPEACrGi6cX3z40PnG6w5c3u74+dUq8cOBVPYC5HDUeduGlK5wT3BI9Wb4u1nQUHVAyE9MjPa
 FbBTX1D7JcriRWgyoE7Ta049Tczw8ZmDVQZ/IxnojndlPNsDAa36GEZR/W0FnmIQH7ROoPrPxWt
 e+xR9tY7xB71R5sL9bTiEP1QVBgWiusGUuCcE0ofleDIi6i1gpjLaW27rom5g86ROOifRzadlKh
 0Vqkpc8tgBiN0ydIpRi+7lP+dxIo3tWXc19VLyI6yUNbb6+THA6ZY7rOwqrCPvuEEbUFUvwrgj8
 nCi8iaYQJE87n+e2Sx52f7GMZku7e9NBXGSmgeMdDRAosU5u6UXELFrHpo0llp57pQWtTXBBb0/
 a9IrUG0XMJ70RhcRUSQ2Mo7lrtaOJIy6W6bgU9RRqsmlFxG1VHaKU8M86IAxHXv2tvo6FAqx/VJ
 iHIR8Uj3wqEmjUb4+O9xUD/LaDu9zYwUCUBqpT9M5lReViLoMiaa++imVwIw2BGPRooEmPJgYHy
 YmTX2fMoBQJf/l/du3h4fl68SjPZyFFZFTqCohxZshKffiHlh5cuFEwalpFuwXPOAaYoZ0bvERL
 Ixe4Pif/SaFzUZGyeepQr8angKF0aDm8SdANsDLT9tu4G/ZF0HidTQQwT6u9NI/nmhZq1BeQVHE
 9A5ZCzke6Mg1rug==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm

The format RGB565 was already supported. Add the support for:
- BGR565

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 44547f56e4b2..c4c623472e04 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -259,6 +259,16 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
+{
+	struct pixel_argb_u16 out_pixel;
+
+	out_pixel = argb_u16_from_RGB565(pixel);
+	swap(out_pixel.r, out_pixel.b);
+
+	return out_pixel;
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -445,6 +455,7 @@ READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[
 READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -669,6 +680,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_BGR565:
+		return &BGR565_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4c51b4486f7..6e7597ab935d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -24,6 +24,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,

-- 
2.49.0

