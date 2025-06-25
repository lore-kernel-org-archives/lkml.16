Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAD2D29D5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873046; cv=none; b=E3ie7hzhZcTF8wHaLFeYZ9nvWbCfuOOFEYbnQynhi7tDbVLaxqfhEU9zEL4LLeRD3GIrOsAdoMgDy3U2Sj0jhySlIhNnAPXA4W2g10IJtw8ZWsl3T2e29PsJ1885M/Dh/jVFSc6eqV0iHld/U4sMWI0oQMrYBXETdYqUAgqoZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873046; c=relaxed/simple;
	bh=8PB8oES3RJFPhWVRT3Tvtjybt+TrM/SifZn/9Eyo4UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgFYyMjPWcboon8kKkbMVkBReiNnzIt1e51JxKkDMao4aZyYwzOc+U2rZUOKPBUbJzR2PQrZnATNsHOL7SfEhaludtR9sNbPJLofP2PlxJZB75cHbk4j5dQKPuXfxapyzlVgt1CYpuxkXd66zn41Oe8XdVsG1U7L18jdu047Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAt/yoOI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAt/yoOI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmm8015564
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ckmpcZmveJc
	msZUFuiT/RpgJEDPikgftzrJym6w4+0k=; b=IAt/yoOISlrjfvms2SYcBU3NWDJ
	ziIUjVKYkVfYJskuW83tRi/WBwd4BOTUvv9B3iO6QASPxxVA/h4fLzucz8umMLzr
	phZHnwum6YBph0oIbdwS0hNByekX4s3/J34qblAulrwFVjVpRRz/zCIoGN93n5vK
	v3vjnCvvFNxpMfnxapFG6z6F0cFZa2DmSscDvylOY2S4P1h1fSuuZheEdyLjk5Y+
	sIjFT5UUyEkiwKE30QwndOg8gAWIRJexl+eoMd3JMMoyGjDP8PHMuf5cZmd4Y3yM
	rFO8B1LE1mDjSGg1I/O3gNVfamlXubaUOL9jVkLBOAB+XarvrW1iZ6H0yRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqq7g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so88108a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873042; x=1751477842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckmpcZmveJcmsZUFuiT/RpgJEDPikgftzrJym6w4+0k=;
        b=tSilQjiPC0cpoV7G28BO3YfUQU9ThMrXMqqOTTa2bNHom8vCQxjJj+VZyvsC61vvQs
         ppa6vLQjUarMVCOqhYX7x88C9Ceb63BOieFt6+R5GoiqJevRpNiIbRVsZqApaJfbDmV8
         yE7R9Qs+x/Dm8U7ipG6JjXijNNLb0EqXOrF6Q0CuyluGX78T4BlLQiHEnPctHuQICfF5
         yXHJNjZe0NDvfyY56Rl9sO4CcxmqyPVxK4I5gJH1EnPmOWhcnOvzRDWsSFimlw3uQ7sZ
         d8DWeNrFIwEgasNrimuEtPEmPP1uNi9rUWYTl2N/9SY0Xw2FvYpruPoq/ttFASd0sh3c
         n8Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVZHxp52ntMYJw3dlb+Dz/Yba9xdnmKggbqhQi2yLo+49CjGfjOEEfEbds/HH7c3jhqmpqR6ZJONPQSmN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyynviX/9CdoHTMa+7cuCdg8nYzSEFB5mHRa++K87KuucEbTtlF
	+0FvIv5g4IjLhlOTnqyahJ+BeznlUjjNKxEU4ZmmTIEj+UjbudEYEVL79yrVn/rTnExfv8jjCUf
	Winx3v5jyVTAY5rYQYLA7U9ynA70Uu7gQOTp/MD9o/QVKbjkN41NeKeF8djGbIZuHesQ=
X-Gm-Gg: ASbGncvhZBm2FkJJpIMtuZE5UOAhQsSrQY4hup5468hyJ8rrWRPMFyz3QbKvEpT5pCm
	ciqDhrRQwjCA4s6rqsCQfOCpzMG9/eBwM9iy1/nADwkj+yOMfAveQsDuoldMOHELkPmXR6XZqus
	eAe7xX9vf3i/vFZUhIJdFY3e26N0n9wOPUyjYOSSG2098GQAB8q4KzStHsMjlyQRKlOTplWAn3f
	9eAJDM3HmANcWpN/SLOBR3HVsMjXymnQy8Ip6sGwGllRr63q0ajFX4RaiQ0Y+JBsdJpgS/pCfpb
	AGwTI7UpevBStr4hXm5DwSYbNpLZVdlE
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr6932417a91.12.1750873042098;
        Wed, 25 Jun 2025 10:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHisPZ8e1PdIMAqtxONK/SJTKlziax5CcCuFowOdaVXodfUQiW5C7P6F/abrBzQuGI6mBDiIw==
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr6932377a91.12.1750873041680;
        Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e862sm2199928a91.16.2025.06.25.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/fourcc: Add 32b float formats
Date: Wed, 25 Jun 2025 10:37:11 -0700
Message-ID: <20250625173712.116446-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 94606ZC7Kvhwq04-3cCficfXq9VsK2TE
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c33d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=n6CFGpYek-_V9AMlogEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 94606ZC7Kvhwq04-3cCficfXq9VsK2TE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX5SJiVCMxZx3p
 drLFpeJXLN3CSnw261MEwVsHD4O8YzHZ9fpYZLEP4eZZGYGCLLyYCMn4fdeKz+ZGnekq3s6bUuo
 glwaXPXTvekTeT/KI2QLFpwpofckcJDMHe8sY0Ewqno8mA7oyo9XmfQjgaZkfE3gLrVmjfMih15
 XQhKU7U2APU+nqZP5QCg/9h9v1YnSRgNkhNWZFx0zWMN3JeCYJJQh6Lo9jJCIHcTfCtO0gFY0kn
 n9RPTiV52n0rNLnzUkAmcu96QhSLDsBDn6gvi5SbcGrgbEhcsoEWx3kquGWbE+EPVschdlYRomQ
 XEPEJN95vMVurUR8d5m3H+DQZp5ngT6UPa4/E7end83fFxx6TtkjBm2603ipjw3G9wlGcKkPwmc
 VV/e06OFyNdWPbYy8erMIjJ3nAcV8cbFkYIr5/U8HSMVkWrpXOsUmJ9k2xeh1/7cG2N4eqGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250131

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

v2: Fix comment describing float32 layout [Sima]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..6a3f1b32cb30 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [31:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] R:G 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] R:G:B 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] R:G:B:A 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

