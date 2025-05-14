Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1FA1F91F6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204468; cv=none; b=M8u2XKQutgiho6f56Xrys5aewSCn19FVF4eX+3pk4hAZOFUUsf7JYyDIbbiOuS98a8P1bqONmZefVD6SAunMMyAvvLmsyrg/FmgIHxBFmjPSiOdotaFNWOYPVHeZOdfTd2Ab0uau+IwjsbLtEdW2xDpRyc0hAimHIGMOYOp+r2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204468; c=relaxed/simple;
	bh=gAVhYts9N7NoNYyxKr48+bfVkq1pO2AtXQfG3GXzNnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=lwmCCeSorO/oQVXrSwjrMzbLvWBeBwQfW4ffeuDh09jTloOG06XdTI+/nABCsNyNCxojkbyWNpTH7ZAc5s0/B5KakK80n42HoCYaB566GVm06eudiUVUgnb8Z/BnYIHQsCUq/o5n2Rkoc0BnsSC4j6NEWD/BojAQK66sTH9DzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kW2+k1Jk; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kW2+k1Jk"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250514063421epoutp02264dddf37ec490724319a94dd35d347c~-UTNhcyHj1735917359epoutp02B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:34:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250514063421epoutp02264dddf37ec490724319a94dd35d347c~-UTNhcyHj1735917359epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747204461;
	bh=Ygru++xll4r9DyOIK9p1wHB3xyd2cdMnyhRCSd9GSME=;
	h=From:To:Cc:Subject:Date:References:From;
	b=kW2+k1Jk756+e/vrQeX11/DWepVKi1Cc8wGwAsmxb0/pnHkyN5xVIWJKuB2FJo1vH
	 0m1JPoT5OnIfDsd9lf419eAWcOWlv03Aa/awxPrI+T5IbTUyIXGDMwfbiaN+rVyMmU
	 Mv04cMVy4HTYjMhenthpKfSSJpIATyS5nQ7Fhlfc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514063421epcas5p4e0139f7ee7e1ec5ef68675bbf9bb603c~-UTND1hfF1896418964epcas5p47;
	Wed, 14 May 2025 06:34:21 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4Zy3Tn0Fcwz2SSKx; Wed, 14 May
	2025 06:34:21 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e~-UTMxkWzK2033520335epcas5p2A;
	Wed, 14 May 2025 06:34:20 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514063420epsmtrp246d23f96284c6851041db264e6cbdbc9~-UTMwvSQN1215612156epsmtrp2e;
	Wed, 14 May 2025 06:34:20 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-9b-6824396c8cd2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.A9.19478.C6934286; Wed, 14 May 2025 15:34:20 +0900 (KST)
Received: from hzsscr.. (unknown [109.120.22.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250514063419epsmtip289f09527d11800048bb75084174ca090~-UTMCewyQ2546025460epsmtip2j;
	Wed, 14 May 2025 06:34:19 +0000 (GMT)
From: "feijuan.li" <feijuan.li@samsung.com>
To: jingoohan1@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	jani.nikula@linux.intel.com
Cc: feijuan.li@samsung.com, hongfei.tang@samsung.com,
	minggui.yan@samsung.com, qilin.wang@samsung.com
Subject: [PATCH v3] drm/edid: fixed the bug that hdr metadata was not reset
Date: Wed, 14 May 2025 14:35:11 +0800
Message-Id: <20250514063511.4151780-1-feijuan.li@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvG6OpUqGQcs+TYsT1xcxWVz5+p7N
	4t+NT2wWm/obGS2WX17PaLHiy0x2i8u75rBZLPy4lcXi9u8ONou2zmWsFnuvHmWymP1uP7vF
	ljcTWR14PfZ+W8DisXPWXXaPTas62TzmnQz0uN99nMmjb8sqRo/Np6s9Pm+SC+CI4rJJSc3J
	LEst0rdL4Mr4+bmHqeA7W8Wx9/tYGxh/sXYxcnJICJhI3Jl6j6WLkYtDSGA7o8TszcvZuxg5
	gBJSEl9muEPUCEus/PecHaLmKaPEultdYM1sAtoSm/6cB0uICHxhlNj+5SgLSIJZIFtiybF2
	RhBbWMBb4tuyRrA4i4CqxLwTD8EW8ArYStyf6gexQF5i/8GzzCA2r4CgxMmZT6DGyEs0b53N
	PIGRbxaS1CwkqQWMTKsYRVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxgkNeK2gH47L1f/UOMTJx
	MB5ilOBgVhLhvZ6lnCHEm5JYWZValB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7NbUgtQgm
	y8TBKdXApHFzhc7UpUkhNR4hKlk6MdzitsEBV1ZsVT74y9Zrzy/WHqGd8o0x2+/s0ec77L38
	5+nrpXG7kxX6xVLdxfaXmfDvD0g51nq1fA+/6YHoVEa++y1CO5lmmh6ZeCF+lfb1+RMeuh3/
	tFFMT0+HVym0TPxH5PMTFz8JtftNf3dsed0WU+bUJ0EnvtolPNmX6cP+4Jftqsjd306s+yQ+
	c9fb/2lp1wpmJ8X2bJo5L/HpgqvzTvvnnQwWEWaZVeEU9dPD7NkM5XnLKjJEQ3tqY1/42164
	MPfH38igrU8nTezL+tGz+aTegp0Cn08fiarY6f/xlK/HpVqLDKWdnwOb897FMs24YOHqwtjg
	9k3z6KFuayWW4oxEQy3mouJEALw0XZ7oAgAA
X-CMS-MailID: 20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e
References: <CGME20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e@epcas5p2.samsung.com>

When DP connected to a device with HDR capability,
the hdr structure was filled.Then connected to another
sink device without hdr capability, but the hdr info
still exist.

Signed-off-by: feijuan.li <feijuan.li@samsung.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..9edb3247c767 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6596,6 +6596,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->has_hdmi_infoframe = false;
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
+	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
 
 	info->edid_hdmi_rgb444_dc_modes = 0;
 	info->edid_hdmi_ycbcr444_dc_modes = 0;
-- 
2.25.1

