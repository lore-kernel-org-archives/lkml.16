Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DE29B22F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873043; cv=none; b=PAs1yhDptYSxBHk1+SO+o0DwC1XvM6ovJSMwUxMmKSpRBDXdCRsX5DVRXVBNv1GZDUW8w0PmJCRM7D5mS9ZUFpJcGuV05rb8mCI9dBNchPgXWwwtp2P+hti7fg2x4B+g/Xr1giUzjVaY+dQp1fsV81vm5wNzA8OOfMjU+alrGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873043; c=relaxed/simple;
	bh=GaZeC3b19Lss9cuHmvYQt3eAyVG70HYyhb4xdv8u7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVK78nEcgh3470hFyWt7HKF69cKwCIlMWIEIb8a65VkDLJTDXjnogiReQ++w1n+caprsb36d4lpO5D2U5kdGLEYfoo+P6uFMLhulzZoYCiWvf4AAzfHVMxjdkC+1SaG4YNOuUHqWvrw7Wgqu3oaAtwAdt+GMF9G3uz19JDK8tsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgH7mbUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgH7mbUO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1eZq022996
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
	uErvpeQ4=; b=MgH7mbUOHHW/lCffajxpilJA4qxUyYlkCLaUuiZVb8aCA7+T6Fk
	ApFjTacpyfNDUEkCVTD/RUY17c+GfU+k71KWianbgGvyPooE5tUO88cXmtk6iUwP
	EhMnT9aFRyMss5zu8jaJaIlhKEgnCs/MLtK3Rgxy7R9lCa5HhtSpdfOf1kHkrJXY
	rrhTb879sZiDhCLQ5bOpdHRFBytz0o7HdwNa3/oPQAY4pEcscwtg6oI579IWj+up
	lHLYXhcHezStN9vNbPXXe5rwgCXHgYhNbrfaEaKCRQh2TqW+xpnDGZTC45CUK02x
	rOSInZa4dzgzWZfqmAtAS3p3W5WQ3G6DZVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fagjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:37:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3122368d82bso102725a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873039; x=1751477839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
        b=uH2lAW0dGw2/i9lYKZl08mtsKYoNPDnrvF6ZBKQhfqG+uDZhXu2av9/aFPERoPNctu
         le20Zu+XFI/7UcOco6eXrn/UlNOzEie4MoGcOCLGQns2qNVIlnBmNfEwPHNI2VID0Uzj
         orJTNDxRYSR41jd+yGLoE/iSMSr7R6eOfgKaEul4N9FN4eN4GicETXOSC9A99rpMHY4N
         WPKuZz4E1es2XN7sjXGEIOAK5iLDbk1V6MN9S72GMUYXTFEffF/euRVUqL6gGcVEAS31
         q5EWoBVTof238g5fK5FWWfkMnkUmy1IN4R2UD2J6i7XT1GsjbheBcXIgYr3YBmvg8wrl
         AYeA==
X-Forwarded-Encrypted: i=1; AJvYcCUiTpZ7CiU8QW1p8Smznh9y0CJ/TnXcvBfOZYitNwRQbz1hZ9UlfCHWLvz/8tqtERUx03U9iuXMQcmmhYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpa8mfDoe7FwscMjENKZ8tQWUWQtgMpAlR2pKHOXZdK0F4alo
	Kbi74GXLjwFn6f9D8788yTpxp+3N7UfTp6+GcjaKLJGqa4C/R6anB6WFug94JmAeC3ciGsgIgg1
	lxOdV7hltSbkhwNvGBzyrPugcIDtFI2tjxKs1nd4Wx4p7BMT4AKPNLMSZuT38hDdU5v8=
X-Gm-Gg: ASbGnctOUpFw6aKFz9XzWo7FB/VGWW8nnBlQ8ttcGhcj0ynRmAbLJOIo771tPF8EOJx
	vGavB3dSZPCkP1550ueIdrzlvdlXiFzy2p86Hxs62dFdSZmIHvwIywBk08Dut9bXJmwKUqvPyLN
	/D5HWajddUC/PKgLDPiptf3Om2WuZb9BqBVWYOS4YUTcOF3TiHHwvG7ZNIVF+fkoM1k98X5koAS
	D3Cj+x1YvS6bzFNUbVvZMsqlgYQw8tCLyI4mxql+ME+//qVHrAlyRTjsTR+ORP6bUV0S8/stb9l
	GN4PC2dgGq+tl/ve4Zq/q0HDRJ1M3dED
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-315f268d07fmr5817784a91.27.1750873039534;
        Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMKQs3mspG8y9JNMpqoIf2y+cWR9YznGJpkP1ouykLoRzvg0upnUv8nTz+gS2rxDvr0WltPg==
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-315f268d07fmr5817746a91.27.1750873039081;
        Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53d9098sm2219224a91.31.2025.06.25.10.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:37:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Wed, 25 Jun 2025 10:37:09 -0700
Message-ID: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX1xwCrVcX99rZ
 LMidwwtJOsneos/du3gyf14dEvOuPxqhiA3LLsFSSl6wBh5Pk0Ay2aJJCLg+lt1YQq6bIAwfr2A
 RkAI1JtwK2JcFBJhamPoLLJNn8mAvj+6t2wxqNdGCO+x2q7GUzb+L5AjaCRGU+VuV2F/PPz7OpI
 oVdWd50r/wyHe7hlCU7cAR1cvTvnDIVlPELKNLJwMP5Eevcwxsk6Vyq3dOaWXlgRzbpgPcJK3E+
 wJoyiwIPgABJrO3HErdSYNCdhaTmK+fjq+lnjAUfj9NLnP8cbrOoFU4M4Sa9aoxIzifNk3xojcc
 njHcfobtQjKNuVklbZ1csWfICXrOM3mD6HMZIX9JsMWAJXhQ/uYILTJBdcImNEy/dg8LeD9VVWG
 K3QZdOeD6LMR5BggkTfPz1iW0XRQJLZLS38CiuBUEIOq8uEe6DKAtDhDqa5yIn3B1SIiHf7w
X-Proofpoint-ORIG-GUID: eFjhpPbCWZiOX-8cad4unSSAkT3nQuOA
X-Proofpoint-GUID: eFjhpPbCWZiOX-8cad4unSSAkT3nQuOA
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c33d0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=998
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

