Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33722A808
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266771; cv=none; b=ZgFYdhzm4sf6mSs5jNJsoTdxNfl9zrp3b7CeMxVz9vaOGXI/pXYJB6LkGEgYKNZVDwJKfeESwTY4xFyTh8Qu13Ss0uiTdWkbYwuSuuVUAtEkP0Ny1gozwSLYKkzGoTTIUWNrzSdvtti/GMDBCAPg88IFDigAjlShvUQrGTYB7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266771; c=relaxed/simple;
	bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDB9BmRE2puCkaA8Emd3WOyO0+XmNhTGlLBbMGwf5kLsC8Ni4rQ6vUJqzCwOlh2Z6eoAAtbjfwk8H1eTsjgpzTWUcdOfI/qfJLVTDmoaxTUIG39SSX5vihoSH/gVRI1VxXElo98rfKyqNd586jPjahleVvPQShxLZtjqaDAgdjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPZ7BrCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPZ7BrCu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EL4BG3015147
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=; b=YPZ7BrCujttzWefS
	7k52LLoHd8QJTzwQO/vxTEVo9omV/tg5k8Dew05cPjOh3isk1cwYDX34iIzw1g4j
	igq5KYXFwoEyKyvi0bNt9MULlip6eOdwpfYrybNgmvysUcI6oJH0VFcU5zM8HrQQ
	Irzoqvvf/eY79bf2nqrGaeVMPviY4WXHShYDDWAp7QtrrkXnUPiywGhfIvViZ5Vu
	nzZSkv6EfS6+wFybzFLdurzPV7/1Xrb5inNYNri5rz8JjZRXky6MX+ypwcFJEKKY
	CKFGl/L/LXe10A0wuItAt71F8Fq2KVVZBzeZUjw7qP6EL2hV8QO61ld3Xj9H38Rg
	oUlBpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr499r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22fb8cfff31so2813085ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266766; x=1747871566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=;
        b=ehcudWYNO48vziVK1WIEmQL9C4cXGqmVZfECRP+u25QXdW7bZFD7cSzpsk0n4DEkvt
         MvVxv15+P3A01+TDu14Wpc4/DEAcnDsLBMovtMhQacExrX+9SRz6qHEBuiiNVjU22KKb
         C/QuogCefIXOq4dP4mfw2rE7Q8nzPAJTXWGhsBuS6K3s6RXcHOHoCaPqseWesTbrhGI4
         CTQbZiif0y9BrCk39l8FmUk19B3ZtsfrwH4rju13iiVODy9hb6XBpWTW/pYIiKRbmn7q
         9Eizz4xP+yDFJ+SCt38+zph5rpqSVY0fw0eSZ8LPSGLdJxOgjeWWNmyZ/K2trx/8Lzok
         7mRg==
X-Forwarded-Encrypted: i=1; AJvYcCXqIq1l8ZsjzhGm7tRS1IdHdPCoK6WECwl98HuU9V3gon5hF2RNPl8TKUV50SSKSQHRNGHzU5pJlGTSEdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybLSFu/BDoVIWCcIvofnzNcBYqqliCfY3HDpaTLrP57EatHuGN
	1gCu8U5+0yw48TF4yXNk9inwEpJPEPkKz8Yd1JBYTjETcFdVhFx+gNiF/5pM//n80+SjG2DJMrm
	lIDv9zFf0b3VW6IRIwLRbN6jOAmU6mB65i5po6tfoqwE98lKBha1HN1TcaPns/t6i6tVS5Fg=
X-Gm-Gg: ASbGncthKkkiSj2NsXYSL6T8JdXb0a0d/srmBDOJJGvHeS6uIITRQfW7sMbx1oVhNT5
	1uEGvTkeEUzW2GteyuKpPXLNPbaHGpB77aNuykioPa/YJpJAm6q+zZ3JMyUWBs2qWzZ4YTNaJQ1
	5oD2/tH6R97hSgbdx91ic0+PH+pmkn5UxAY8a9UAylJ9L2jO2HVAlDDmzeGkdxbvMXjmUJ+6tPf
	j+YVqkZ4Za7GdU29JI4O/PEB9fY4jjuhUqo0UOEnHoWKFLf8Vrdwd++VwAbT4kYY7sk9iUHJU4X
	VmQjYrjeR/aeAA35l029ixg6s3Tf8kPdpfh+FuJP9JIolAJMPtZMXZBKaZyn/C9yeGZV5hih
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231983c8d26mr78384275ad.49.1747266766593;
        Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElBMMtlFs73GOE/CSJfWpv6kvzPVBPciQe95hl+3ogbQol8ic5ww8zShcsAEXLyX/lBBTLOA==
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231983c8d26mr78383945ad.49.1747266766200;
        Wed, 14 May 2025 16:52:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:32 -0700
Subject: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=1350;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
 b=0lV/29bwfrvOOIXt1cQk9FuWEEWPvaC+02GdLvIzrV3TQ9b+8xL/6i24PUe+kv775VH6GIiyB
 PYZR7MOt/YnBvHbmvbU+ftLOqf6bUJy37F5YtG9ufV0E3xKiNFyxO3V
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: DFOUc6BVBntHfwKV3viZEg1VKxXo1P4a
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68252cd0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DFOUc6BVBntHfwKV3viZEg1VKxXo1P4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX0+4MogP13YWa
 s08EfDwDBQCS75soh57mtw5QJtjrysJPB7F617n0QnFnJ4kF4OYeSsAzsYc0ICpLNCYgaT/gfeT
 7GMqQJeUjHSg4m7yxa1w5jxPFIlCCf04TW161u54BlNSZWiVuOtTTrIFaTL9QD99Lcl1cuVju4v
 2wDIkWz248VtA/+m5Nwxbepf9xjFsabuqtlcLfmKDIVDHVI7k4XMXtshMlwDN8DbooZ939TxOVf
 i3SjX6FhIxAOaI179khjIcE90wRrwm1s44X8D93CI9LcmYlUrSO8WAUOp6SvUzCkrSuxH1nMmvm
 P6ofLJr9MVKabFN+gJH6a5YWWkfx6H5tBsDncGN5P6I3UULM4J7MIlujRaQBiO/v8VWELfZe6QW
 +lKPlKVjSV9+D7O0JZxXfahT/HRWRprAoJUt2kXysAYtLnz/RA/pAjMJ096gWUO8AD7LmknU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902..0a198896f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.49.0

