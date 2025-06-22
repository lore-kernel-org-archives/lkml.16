Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729D17BD9;
	Sun, 22 Jun 2025 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750577413; cv=none; b=f0tW1u73wG9ENxWHVQak6u6R0gH1X52sFVFpxcXscKkDRIzH2hIBYiN+iGIu1oM5tuG5HYAnTy/yLJ9iTAw4Dj5BCiC6ZL5NZ1gG/YpzclhktNKk47rvxHKC1lyS82Wykn0Vn1ftLzwyFF0KEwbSub5FDCfFx2hjORnQP1VT0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750577413; c=relaxed/simple;
	bh=AA+X8Jca0Y1XgOz2omclf0o3lWNO3s2sp1OjFcok7Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uu7GZrpX9hppIqSjHj0eEN2WX6ACdnMolH7WRZTdH44pfi8KTCo4uZ/NIUOhM48Afkb8I6A2KCVYvlXZmaLfhcN1xgmhYiNhaBP6AYqO7ZM/DIoluWJkKbZ7g6j1r/OOdlPeyXIICcGLBzNoVbTtl2Gq97V3gFY8wVaISkehqAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HvBXXZJ8; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HvBXXZJ8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M5UfD2003589;
	Sun, 22 Jun 2025 07:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PiyUR
	CDgwowtJKwZVUMY/7yXYqSzxSEKQ0WqP0Wb89M=; b=HvBXXZJ8A34LFnKazA8vy
	oeiX1RYwv/V8pAFiaxLoEBASphIcTKMfCNkEe++DqQejCfaTn5bxyVOsR8i+9vVg
	MJ5VCo/6cXTFWnQuO9zygQOVevFrK0KWp3Wr5FGPnIE7EH/0WytwQAgwJ9WlaL3+
	0CfoKcM0WwUIW89Kwove/lWHlKBSuzVDafDUS/Henl+nj3uXrTrr2jFw/BwVWwkY
	rP1i4ZhcF6A335tHorxwNiAs1WghBBugYoSujuBSRtbt+df8DXg5nV9tuu5y1Zrr
	8ulSAJCXQF1lwnSjt0mjMji2oTD5/7nn06CfN+35+qDQT2pQoQyHhXYSoJxnR2fu
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47e1t98gf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 07:29:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55M2oAcS008642;
	Sun, 22 Jun 2025 07:29:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47dk6e6pkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 07:29:52 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55M7THrk031282;
	Sun, 22 Jun 2025 07:29:52 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47dk6e6pjk-2;
	Sun, 22 Jun 2025 07:29:52 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, davthompson@nvidia.com,
        michaelsh@nvidia.com, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/mellanox: nvsw-sn2201: Fix bus number in adapter error message
Date: Sun, 22 Jun 2025 00:29:12 -0700
Message-ID: <20250622072921.4111552-2-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506220043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA0MyBTYWx0ZWRfXwx+ggWxd0Hr4 hskox+xuZmCcSZEYdwnHt1FnJImMQT4tdA2qz9sCv5Ii8aErXAV2ufGgm6QAzVl0TKPDYeFrPV0 0K6DhpdXkUJ/Bw+4idX4NCGRbC5WnrE+yNjIw0mZPlxnLb3HNKuFboqlA/g3RgsqzaZnyeAEzfg
 +XvVlZw2CrcGZHjH5GaKm0aoiJVzVuYExnAz+GjxTXHsrrS9hTeeaOyTzyi+1X5WZNpRYoUWYyE 4xAvfvyraTNFpRh2mYPujk9wVzs55ZZy4eCCjvX7WllRL6C9g6H8Ix2V0LApiMefKDTM+v7z6cx 9KoFB1L0Cm3M+f1+yPfgLv6iJacZ2EIy4jQzJNgsZOGDjK+i3Hr/WEhIl7vKH05E1iUvrsjDA5/
 w+4NVopafyC9Q9CPx5fLHIEyORqiPgM8x9dVhaztYBqp/3H3KTI0DFv/P08t34/atadkxFq9
X-Authority-Analysis: v=2.4 cv=fpjcZE4f c=1 sm=1 tr=0 ts=6857b0f1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=860j-12YmC-qVKlw99IA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: HHIjoaPzctR3ARWOFwqUa4IIMUrwaiX8
X-Proofpoint-ORIG-GUID: HHIjoaPzctR3ARWOFwqUa4IIMUrwaiX8

change error log to use correct bus number from main_mux_devs
instead of cpld_devs.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index db31c8bf22553..51504113c17ea 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -1181,7 +1181,7 @@ static int nvsw_sn2201_i2c_completion_notify(void *handle, int id)
 	if (!nvsw_sn2201->main_mux_devs->adapter) {
 		err = -ENODEV;
 		dev_err(nvsw_sn2201->dev, "Failed to get adapter for bus %d\n",
-			nvsw_sn2201->cpld_devs->nr);
+			nvsw_sn2201->main_mux_devs->nr);
 		goto i2c_get_adapter_main_fail;
 	}
 
-- 
2.46.0

