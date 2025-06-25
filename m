Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713027A108;
	Wed, 25 Jun 2025 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846626; cv=none; b=gRy5Us75NlkH6qg7EbZi++3vm/8ApnxZ9WaOuCYlvD3jXdACG7gR42L3Z2op++9LOxotu0WTsY3aZqx1rmQ1saKM/EoDh1cNTV3y9gIbWWDCmudGYFsYTOUI953OfULP3k0qbqlCT2e/xR53kyFD/a9uPFGCrJt236HHY07ZJpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846626; c=relaxed/simple;
	bh=tm1noJylwz4/Equ8rThn/em8Uwy55/N71+M41irfK8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n8HhTNrpsWUJburqV2z8rpMMewLMRKJqGuKrdWMMngHKPzR1Bkq/j+cg+IReqGaaq6R7FpyO1We9+RVAVnNiJGufwp9BeovSUc1yVfj2BjWOFq9eHPrNjdeWfomXHHuPgKkonxvhafNNkzaWtzVB5DwBLrV/e9IGyOL0O+bTixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oF+3MC25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oF+3MC25"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P26qPU001108;
	Wed, 25 Jun 2025 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OxANXZaRNYfzQugbzDlHAn
	o44IrzaM+2nGw7Z96uKF8=; b=oF+3MC25u5mkmn9FAz3PtN02NhDZE+TqpCocEC
	mOGWKnKzTCEqtnXaKsMFUsgXbAqRD7VVXaJ8Zit487bSEdq61kXccIPCFxkHzUmy
	GTi0iapKoQDGU/lpfRYP2ZxGdOFNfCbMNnaTAnp7H2+BreQx6TIG11w1vZl2zhpF
	U5nirtZwVgVyBtLyV4H/Pj0/VY6FWSWJmZcV3KfCL4+d479pd5N9hE1gqkq17b2p
	Viroy1JWKGZCU1b2Kp/C6yprNB5rXjQnHZB/9UB8/ZVoA0IR+rLHxxtT2ouPzWJq
	agoP4TJK3RtDAIyfj5N79PYcXHzX44K3S1bljLEB/jBfkWHQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1x2sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:16:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAGvUC031027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:16:57 GMT
Received: from hu-akakum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:16:50 -0700
From: Akash Kumar <quic_akakum@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Jack Pham
	<quic_jackp@quicinc.com>,
        <kernel@quicinc.com>, Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Daniel Scally
	<dan.scally@ideasonboard.com>
CC: Vijayavardhan Vennapusa <quic_vvreddy@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akash Kumar <quic_akakum@quicinc.com>
Subject: [PATCH] usb: gadget: uvc: Initialize color matching descriptors for frame-based
Date: Wed, 25 Jun 2025 15:46:39 +0530
Message-ID: <20250625101639.19788-1-quic_akakum@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bcc9a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=4A6tj2Yrg6pY0tqrda0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PBC8I-7gvdcxe104Z-LhrjMpVLU8SJJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NSBTYWx0ZWRfX4R/+Ezdj309R
 Zf4sb8oEacf48AUXbJGe1PH3hwrf+Q19beLdX5zX08NPc+moH72lc9xnl2X1I5wkI83cV97RbMu
 oY1JrScKGxPHXe0tZRbPSQI2BFCn2MheSmnDiTCKlNqLTcPUoK/+UFt37uxriOXvzwb0O/GzcHL
 cGUc5vA6Gh6aXKFRCMWNyDOBl7hIRh81FgwlDsYcujGs9JCynaA3/eMAubbdfw8TBBAOT06/zpJ
 kngUSnumO9nA4Qkg8mfxc/fZBBuYw+lxqE3H+oCR6IR1ET+TFT2tko1yFQbXSSkki/ppp7bEXXe
 OJ69doUBRvP7HuAiCJmBseGK0p0zetCs9MG+l8/gnZvQOAjRhmA12RsmGcjgviveNRFNH2Edfqd
 xowPaT6V8YGWLaN0nbunlJtRnJZDVHCiNUwjNSrucDpufNr2Mglv6Rg+Km4FJ+oNrqSaOM1M
X-Proofpoint-ORIG-GUID: PBC8I-7gvdcxe104Z-LhrjMpVLU8SJJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=710
 clxscore=1011 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250075

Fix NULL pointer crash in uvcg_framebased_make due to uninitialize
color matching descriptor for frame-based format.

[    2.771141][  T486] pc : __uvcg_fill_strm+0x198/0x2cc
[    2.771145][  T486] lr : __uvcg_iter_strm_cls+0xc8/0x17c
[    2.771146][  T486] sp : ffffffc08140bbb0
[    2.771146][  T486] x29: ffffffc08140bbb0 x28: ffffff803bc81380 x27: ffffff8023bbd250
[    2.771147][  T486] x26: ffffff8023bbd250 x25: ffffff803c361348 x24: ffffff803d8e6768
[    2.771148][  T486] x23: 0000000000000004 x22: 0000000000000003 x21: ffffffc08140bc48
[    2.771149][  T486] x20: 0000000000000000 x19: ffffffc08140bc48 x18: ffffffe9f8cf4a00
[    2.771150][  T486] x17: 000000001bf64ec3 x16: 000000001bf64ec3 x15: ffffff8023bbd250
[    2.771151][  T486] x14: 000000000000000f x13: 004c4b40000f4240 x12: 000a2c2a00051615
[    2.771152][  T486] x11: 000000000000004f x10: ffffffe9f76b40ec x9 : ffffffe9f7e389d0
[    2.771153][  T486] x8 : ffffff803d0d31ce x7 : 000f4240000a2c2a x6 : 0005161500028b0a
[    2.771154][  T486] x5 : ffffff803d0d31ce x4 : 0000000000000003 x3 : 0000000000000000
[    2.771155][  T486] x2 : ffffffc08140bc50 x1 : ffffffc08140bc48 x0 : 0000000000000000
[    2.771156][  T486] Call trace:
[    2.771157][  T486]  __uvcg_fill_strm+0x198/0x2cc
[    2.771157][  T486]  __uvcg_iter_strm_cls+0xc8/0x17c
[    2.771158][  T486]  uvcg_streaming_class_allow_link+0x240/0x290
[    2.771159][  T486]  configfs_symlink+0x1f8/0x630
[    2.771161][  T486]  vfs_symlink+0x114/0x1a0
[    2.771163][  T486]  do_symlinkat+0x94/0x28c
[    2.771164][  T486]  __arm64_sys_symlinkat+0x54/0x70
[    2.771164][  T486]  invoke_syscall+0x58/0x114
[    2.771166][  T486]  el0_svc_common+0x80/0xe0
[    2.771168][  T486]  do_el0_svc+0x1c/0x28
[    2.771169][  T486]  el0_svc+0x3c/0x70
[    2.771172][  T486]  el0t_64_sync_handler+0x68/0xbc
[    2.771173][  T486]  el0t_64_sync+0x1a8/0x1ac

Initialize color matching descriptor for frame-based format to prevent
NULL pointer crash.
This fix prevents a NULL pointer crash in uvcg_framebased_make due to
an uninitialized color matching descriptor.

Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index f131943254a4..a4a2d3dcb0d6 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2916,8 +2916,15 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 		'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00,
 		0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
 	};
+	struct uvcg_color_matching *color_match;
+	struct config_item *streaming;
 	struct uvcg_framebased *h;
 
+	streaming = group->cg_item.ci_parent;
+	color_match = uvcg_format_get_default_color_match(streaming);
+	if (!color_match)
+		return ERR_PTR(-EINVAL);
+
 	h = kzalloc(sizeof(*h), GFP_KERNEL);
 	if (!h)
 		return ERR_PTR(-ENOMEM);
@@ -2936,6 +2943,9 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 
 	INIT_LIST_HEAD(&h->fmt.frames);
 	h->fmt.type = UVCG_FRAMEBASED;
+
+	h->fmt.color_matching = color_match;
+	color_match->refcnt++;
 	config_group_init_type_name(&h->fmt.group, name,
 				    &uvcg_framebased_type);
 
-- 
2.34.1

