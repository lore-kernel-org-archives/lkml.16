Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF921C198
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279341; cv=none; b=oKb7v1gFzb7NhCD2mIv81k7u4MzL0QGTZjNpyBGck3qT1PVcTDZacsINU3lYb8oaheziMF9CvpvT+yttkMeqBixTwJVYKgBdpcqHgdoG059GT2kp9XbO/z25jVPK3U9k8VGC2FsI+zzvnZAfQMJ9LMBjR2m1wa/WB9MoKljd1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279341; c=relaxed/simple;
	bh=4jHjKU1B2jvzMf0pb48yjmVml8QrRI9r9cIknRem0Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZankmniWfnIf+hmMCkZ7QZWlmTjfNZdU5trMDarW72VZSRVAuLuqJ0jV9ENfTeFjuXWh7XhqheYP23HCHXBvWG9HqG+/x4AKFQvxLR7VFw8TX81Iy+rmnoUTDu9Rdn0BLJmOm2xMQTioA/F/+PQCIRjznCRqul8pTd7XrvgyXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IbOW1byN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IbOW1byN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750279336;
	bh=4jHjKU1B2jvzMf0pb48yjmVml8QrRI9r9cIknRem0Uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbOW1byNzjCJ9z5S5lb+mpoAG2SEsTagqH1tKwqfmA7J8AGKL6piNRKXPTJgAnFg7
	 UTi6IkMR0DpRLDoo1PeP0EQV32qcRhqJd0dT5fnHH2mQdDgRywJAoCMyll47DLWzHh
	 S7gkaK+Fxezllt8/IwsNaAJdnj8D8N6Au/ajK9Th57IWyetz6mtCyehvnC6NIyG5mm
	 wpSNoTjhcORHvUDdZKesHadkd4aULp+RpLvwxqg8v9olLh9B1pdzUv1pOBYzRoqD2Y
	 9xy5F/lvQeAHz2c3r453YdGdLKj4c1AlJBfBsLDDI16RGbAOim2y69QzyC6aHjLSFu
	 pFUC/RnjGBztw==
Received: from localhost.localdomain (unknown [89.186.158.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: gerddie)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 721B417E09FA;
	Wed, 18 Jun 2025 22:42:16 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v2 1/6] drm/etnaviv: Add command stream definitions required for a PPU flop reset
Date: Wed, 18 Jun 2025 22:43:29 +0200
Message-ID: <20250618204400.21808-2-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: move some defines into the header that resided
    in etnaviv_flop_reset.c

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/state_3d.xml.h | 97 ++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/state_3d.xml.h b/drivers/gpu/drm/etnaviv/state_3d.xml.h
index ebbd4fcf3096..f728cd6a0301 100644
--- a/drivers/gpu/drm/etnaviv/state_3d.xml.h
+++ b/drivers/gpu/drm/etnaviv/state_3d.xml.h
@@ -4,6 +4,103 @@
 
 /* This is a cut-down version of the state_3d.xml.h file */
 
+#define VIVS_CL_CONFIG						0x00000900
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK			0x00000003
+#define VIVS_CL_CONFIG_DIMENSIONS__SHIFT			0
+#define VIVS_CL_CONFIG_DIMENSIONS(x)				(((x) << VIVS_CL_CONFIG_DIMENSIONS__SHIFT) & VIVS_CL_CONFIG_DIMENSIONS__MASK)
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER__MASK			0x00000070
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER__SHIFT			4
+#define VIVS_CL_CONFIG_TRAVERSE_ORDER(x)			(((x) << VIVS_CL_CONFIG_TRAVERSE_ORDER__SHIFT) & VIVS_CL_CONFIG_TRAVERSE_ORDER__MASK)
+#define VIVS_CL_CONFIG_ENABLE_SWATH_X				0x00000100
+#define VIVS_CL_CONFIG_ENABLE_SWATH_Y				0x00000200
+#define VIVS_CL_CONFIG_ENABLE_SWATH_Z				0x00000400
+#define VIVS_CL_CONFIG_SWATH_SIZE_X__MASK			0x0000f000
+#define VIVS_CL_CONFIG_SWATH_SIZE_X__SHIFT			12
+#define VIVS_CL_CONFIG_SWATH_SIZE_X(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_X__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_X__MASK)
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y__MASK			0x000f0000
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y__SHIFT			16
+#define VIVS_CL_CONFIG_SWATH_SIZE_Y(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_Y__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_Y__MASK)
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z__MASK			0x00f00000
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z__SHIFT			20
+#define VIVS_CL_CONFIG_SWATH_SIZE_Z(x)				(((x) << VIVS_CL_CONFIG_SWATH_SIZE_Z__SHIFT) & VIVS_CL_CONFIG_SWATH_SIZE_Z__MASK)
+
+#define VIVS_CL_CONFIG_DIMENSIONS__MASK			0x00000003
+#define VIVS_CL_CONFIG_DIMENSIONS__SHIFT			0
+#define VIVS_CL_CONFIG_DIMENSIONS(x)				(((x) << VIVS_CL_CONFIG_DIMENSIONS__SHIFT) & VIVS_CL_CONFIG_DIMENSIONS__MASK)
+
+#define VIVS_CL_CONFIG_VALUE_ORDER__MASK			0x07000000
+#define VIVS_CL_CONFIG_VALUE_ORDER__SHIFT			24
+#define VIVS_CL_CONFIG_VALUE_ORDER(x)				(((x) << VIVS_CL_CONFIG_VALUE_ORDER__SHIFT) & VIVS_CL_CONFIG_VALUE_ORDER__MASK)
+
+#define VIVS_CL_GLOBAL_WORK_OFFSET_X				0x0000092c
+#define VIVS_CL_GLOBAL_WORK_OFFSET_Y				0x00000934
+#define VIVS_CL_GLOBAL_WORK_OFFSET_Z				0x0000093c
+
+#define VIVS_CL_KICKER						0x00000920
+#define VIVS_CL_THREAD_ALLOCATION				0x0000091c
+#define VIVS_CL_UNK00924					0x00000924
+
+#define VIVS_CL_WORKGROUP_COUNT_X				0x00000940
+#define VIVS_CL_WORKGROUP_COUNT_Y				0x00000944
+#define VIVS_CL_WORKGROUP_COUNT_Z				0x00000948
+#define VIVS_CL_WORKGROUP_SIZE_X				0x0000094c
+#define VIVS_CL_WORKGROUP_SIZE_Y				0x00000950
+#define VIVS_CL_WORKGROUP_SIZE_Z				0x00000954
+
+#define VIVS_CL_GLOBAL_SCALE_X					0x00000958
+#define VIVS_CL_GLOBAL_SCALE_Y					0x0000095c
+#define VIVS_CL_GLOBAL_SCALE_Z					0x00000960
+
+#define VIVS_PA_VS_OUTPUT_COUNT				0x00000aa8
+#define VIVS_PS_CONTROL_EXT					0x00001030
+#define VIVS_PS_ICACHE_COUNT					0x00001094
+#define VIVS_PS_ICACHE_PREFETCH				0x00001048
+
+#define VIVS_PS_INPUT_COUNT					0x00001008
+#define VIVS_PS_INPUT_COUNT_COUNT__MASK			0x0000001f
+#define VIVS_PS_INPUT_COUNT_COUNT__SHIFT			0
+#define VIVS_PS_INPUT_COUNT_COUNT(x)				(((x) << VIVS_PS_INPUT_COUNT_COUNT__SHIFT) & VIVS_PS_INPUT_COUNT_COUNT__MASK)
+
+
+#define VIVS_PS_NEWRANGE_LOW					0x0000087c
+#define VIVS_PS_NEWRANGE_HIGH					0x00001090
+#define VIVS_PS_SAMPLER_BASE					0x00001058
+
+#define VIVS_PS_UNIFORM_BASE					0x00001024
+#define VIVS_PS_INST_ADDR					0x00001028
+
+#define VIVS_PS_TEMP_REGISTER_CONTROL				0x0000100c
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__MASK		0x0000003f
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__SHIFT		0
+#define VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS(x)		(((x) << VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__SHIFT) & VIVS_PS_TEMP_REGISTER_CONTROL_NUM_TEMPS__MASK)
+
+#define VIVS_PS_VARYING_NUM_COMPONENTS(i0)		       (0x00001080 + 0x4*(i0))
+#define VIVS_PS_VARYING_NUM_COMPONENTS__ESIZE			0x00000004
+#define VIVS_PS_VARYING_NUM_COMPONENTS__LEN			0x00000004
+
+#define VIVS_SH_CONFIG						0x00015600
+#define VIVS_SH_CONFIG_RTNE_ROUNDING				0x00000002
+
+#define VIVS_SH_HALTI5_UNIFORMS(i0)			       (0x00036000 + 0x4*(i0))
+#define VIVS_SH_HALTI5_UNIFORMS__ESIZE				0x00000004
+#define VIVS_SH_HALTI5_UNIFORMS__LEN				0x00000800
+
+#define VIVS_VS_HALTI5_UNK008A0				0x000008a0
+#define VIVS_VS_HALTI5_UNK008A0_A__MASK			0x0000003f
+#define VIVS_VS_HALTI5_UNK008A0_A__SHIFT			0
+#define VIVS_VS_HALTI5_UNK008A0_A(x)				(((x) << VIVS_VS_HALTI5_UNK008A0_A__SHIFT) & VIVS_VS_HALTI5_UNK008A0_A__MASK)
+
+
+#define VIVS_VS_ICACHE_CONTROL					0x00000868
+#define VIVS_VS_ICACHE_CONTROL_ENABLE				0x00000001
+
+#define VIVS_VS_ICACHE_INVALIDATE				0x000008b0
+
+#define VIVS_VS_OUTPUT_COUNT					0x00000804
+#define VIVS_VS_OUTPUT_COUNT_COUNT__MASK			0x000000ff
+#define VIVS_VS_OUTPUT_COUNT_COUNT__SHIFT			0
+#define VIVS_VS_OUTPUT_COUNT_COUNT(x)				(((x) << VIVS_VS_OUTPUT_COUNT_COUNT__SHIFT) & VIVS_VS_OUTPUT_COUNT_COUNT__MASK)
+
 #define VIVS_TS_FLUSH_CACHE					0x00001650
 #define VIVS_TS_FLUSH_CACHE_FLUSH				0x00000001
 
-- 
2.49.0

