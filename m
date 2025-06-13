Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6B47F4A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859033; cv=none; b=ri6dfh9Od4tCnakFN/DyAk3uBPF0i+fA1ww1Al65/O/5lzylFjH0glfjSQ3nrvTWiRz98NYiwHzFwejlpgxrOyTDhH0ofo1t+UAgjDPFE/9vEfgQ8PGaKgUFQ2b52usA2Coy1D546Xb3xQ8L2yLjQWzOB8iBPKHhE6hZagiOK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859033; c=relaxed/simple;
	bh=zNB5ffXRLwWFyZW0OnYE6qGfnMgP7l23FYbHK7hDPGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZ//zx25wlW7q9hNBrLnbY+Y89YHLCWw9m52ODCSUUIS/f7NqycjuEgIeO4DGm54JU5AO1I2NDWwidhVeCbE6qWyIMFpgb+gGCgtJaN4fCm/wr7d0VvXfg/wah09m1YEWXOsd+mPzYGea911TMg7Fk6rgGc99RZA9ScZpGFjYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYcXUohV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYcXUohV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DNRTRD007081
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+
	3AnuH5Yc=; b=iYcXUohVmqKL4uIdQlfsFSW8Sg28c4PoVHPpLqQ3WfbpCs4sso2
	ZVA8whL039C9NKvi0KGXrQQ3A9yCoT8n17jBTaNz93gDBOn3HZh+xp50TPdMcFmg
	Ab7mCELdJ2eeXCDeTep4TvOLi4U+OR75Vjr8f9gt/foxBvUIm31+E0/yD6LvWQa2
	+yjJVMP6z5UK/9n034UMhC40qKjj18H+St89RtznmcbtG2/nnRoOa3BHGJ3vtLK6
	HNETvXQNa3Ct50ItH1EhWQHB8P30yCZayH3S6MF9NLqcv3Orkg6tVqsk+wVUfAFl
	3lCe4LDU36K77zrihXYJoZ20rNqRU9AEDBA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcvr0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:57:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0f807421c9so1666395a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859030; x=1750463830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+3AnuH5Yc=;
        b=UR/LPUeFXAmNw2fJN1o1vqLrHreVxHmCQddog/omBX/U7ozBz3YZamYENNKHJJJgd9
         3WeD44rVjrZYEk+1aXwffIxZmNbP2rNbq2CXRfr4EWtq95OK5Ad92iGQQM1hAh4fUku9
         8k4Z98C4sHEnbbT2zOPdAPEwfWHx66gyhHeneKL6C42UBzsPrKa9Gu37x++rtveB+Y15
         VIvJa1TRLOx9E+z7cE9rk0d5nicGnihKzZonNufzIrvX/i+zbLDR3lNYFEha+XUeDgHu
         d7MwmBMa61tzgUrPANTK19MQo8qe90v3H6aEHIjrJImrlxFH/gJBGhaZ/y3RbPvMP4BS
         HPlw==
X-Forwarded-Encrypted: i=1; AJvYcCUvabLhihwudV7EQ73awyZ2XRKU47/zC7LoxUKqX8DdR8Rbn0RBJvKHHaoTazYaj/C2ZtPDx/ra+MfAJig=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkl8F65uqDaHnB5IPHJPad5mpCsgd+nFO3mn3vcNhwM+XCD/n8
	lMAwnQsI7/KtXenE9yOiQpUIlBhZj8vjM6W/UgJrXUx58H9i39t/cqZvISI8SY/r4jnt8SFunZE
	AbhGZwLcsxxeJh+emO6P6C+UHKiKjb1YWlgqXlrLP4ux7QKbksVBXTP8ZYa1wdCIeRCY=
X-Gm-Gg: ASbGncufrP352sbIfsnvHIptWzNRDPdH6xQl9hFhGLkLAHpQ2iVcLTiM5YZwvcwL9AF
	8H1G54fwZZDtNpjDf4j4raVzSTLIgyohyx4QoOyRVRgF41y5Y221wUTZxk8Xo2v4jBqRq75l33Z
	5Pw5jiz9WTunikqCIDUDvxEsRrlt7enQmHHtXeV0CCWUbpRvST94k0/P4wtCzmbYnK4+pveHndG
	/GzKaCH0w79tpHQzlgnk3FJlXDmJVW26Z0x3EHJJM5n32KnhgzqKZEWK8ihk+zOhqbxbO+0F7Ox
	rcURL5GyBMmzVQe1e11d54XZsUJzE/hK
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-21fbd4ca4c9mr1765508637.14.1749859030160;
        Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnJbt5NIgLECytUdxWBytGTQ51ZldvE8PCrvMN8X7vGLEoCu4MjtZ4dgCdy6WCUnaT8c/EOw==
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-21fbd4ca4c9mr1765474637.14.1749859029726;
        Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe16432b0sm2384679a12.24.2025.06.13.16.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm: Locking helpers
Date: Fri, 13 Jun 2025 16:57:01 -0700
Message-ID: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfXylUiO3fFCzaF
 C+5EO8TyxZd2bK3VDKXk9h29pMp333vJ1yI69KkwuVjJj4Qe/vR4YQojo0RSFr6dSrqNJBYpAju
 dmZzmIZEDf72E8vhzQRRMdNq/PYvmcDE5SlvvfNpJ/giqXeeeIqCVqxsIDkk3T53R4/H3geLMZG
 svlrfvCNOGNNooyVFQ02TKHKSMAgLX7mhAe2LuF/Ilht67BeZRiMO1xAVGHsbBo/FnbedFfWyE2
 taDJfzaG99oy1kwMBHSOUO3dst88l+CEZaikd1s13SHaBjVDl4WUZkZWGP7BGYXwGzQUnS9aCOc
 54h2vwElAwuvTAaAPleDMLndyzup39SSIygI27Hm5fv5qSZqYLf9MT/HWDQgBKHgwgMkksFOUXf
 v6hunAtnjS5wNUUu4oIiF4xlwBcz8Eepj6y1k2SusbALXZ7hDP0rmoBVwhggWbAfxc7hVDKP
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684cbad7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=aKBb6tC2I0So4jIVd84A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MWKg9I981uO0qJY9n7u6clXmbFDeTRex
X-Proofpoint-ORIG-GUID: MWKg9I981uO0qJY9n7u6clXmbFDeTRex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=888
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130177

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     | 14 ++++--
 2 files changed, 95 insertions(+), 6 deletions(-)

-- 
2.49.0

