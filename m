Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C79BE46
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079763; cv=none; b=CSG//ermeU8cG8gLyRX00VAM9qN3bvVutzhR8DMCyq5AMT/AA1UqqrvB1dy87EZDP4Yz5KIQGTCCqmxUPejYnlgpqbhxOvFJLCCEiWxhY0/voKgVY4tkhRUA5fzXzqsVxBsUXdTyXKSfdzltvaNs2bM4mrn5SIweMlW95E1WFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079763; c=relaxed/simple;
	bh=HPCRtSTGwz5zkPqvv1wbF7TQq1M+P6roUP+I7n1ctIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=syD8OvNqWpO5md1dBucgYd+tgvgzWSZ3ijji3PuQgyRhae7sb77DzW/qJ3zFxbJ2yYzGTDBPU+Yh076P5iNOS3P1NJOaMkiZXswUsIndTKotRecNt4jTy26ZsEjEdeIvZ0sIJw8apu5FRJv1WArfUdAk4CEXhoYwXkwgKJjrTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPMNTleF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPMNTleF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S2Qsej007958
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ca0LgcLkNFqV2mw7hYegHH
	5vRj8FHsSnureGggYKmUc=; b=BPMNTleFOulZunmD1KM7BipbyeiJ8tavf5pOF3
	6uo4NZyVT1sJvI+3zPAIX6Aouq0sXvc5ssVoXLh55jtjzw0Ye9GBNJAOCnnT8sjI
	y4gK+6w4i1mfFGsfBnjpy5kFfow+UkTRb86rnDJfLGbrLG/vR5j7n170Ikf22sDH
	IUspdgDVpI04tbmCpmlvUpfFqQtXRSaMn1DgvqK22x7QYurxoStRr6cvSwYSXDth
	ENBAR2K7J9zfYoJc4rQj/cEmOyZX4VtrBZi92EGLH39uSQiPBO3e3fGGNKwfQDhT
	l2VeRa72kfW1tgJkhPemrP70msCUQhDstFMM3H46mGoQHKRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jvmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:02:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d15c975968so73206985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079759; x=1751684559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ca0LgcLkNFqV2mw7hYegHH5vRj8FHsSnureGggYKmUc=;
        b=B7+IXkjDPqVv+Bsz70qT5KvgQ+Dtu2mnmPt/qC9pqNWBmnj89D6SW0tAlrNf2QBRNh
         JgSqGT7plgLqZhNo1PSOaf/fyJgyGCBtDdBWyVD5KJ3oIPXZtN/gOCCjYUCwWlxo2d1R
         aGNUOQceyg8YuHg75O/wNqndQ/VREgoxjgnxWnVaoIMKv0r8KZLzbT+qxUgIJI2kkqhE
         lGpAwM6i51OgHtL44pvB0TSzKsJGphFTYBpZXezf3xB+2UMOnH5td2OtuBTsJOIDXHDW
         Dts40/dHYZRWGp5WyF6OH3v/dj9KGFd6pHabbjJPMv+8X2WDxU3MCfUrNB6FaxIw9LQ9
         MsQw==
X-Forwarded-Encrypted: i=1; AJvYcCU0FQT0yO50oVEFWoKucvj54zIi03CmGp9J2CdeurGDOtIag2AoEY5RHlExzgadmzH5x//dylN8F8NqcyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmfBOwgonCKXlLvaCz1NjMQtS7E+Pr0C2QdEJDFuzfn3nYiBy
	rpmalYZMRhmlp/xjsv63USRZex25hHCOVjj6rEXvX25kWcLLZ2VFiUDD2Zy8NtKFVLcHpFlnhJq
	cOyX+U57e1ywMaW5Q5Yn+1I/KvKtbX4yegEXsPuC1lUDYquN6YLZ5lt5TPLF/rFex6pk=
X-Gm-Gg: ASbGncuJkidzqqEiXDvHxPKze/xIIqyHc5wze8bzD1vn9gf2lg3BMvEqx+WZNCOlmWt
	eY4SqDIcbHk/edr9aQ7U5+3xKrYU5kw+H+ovc+uTdRYL4xPhL12CaMLgNVt73M2R0YDGcxBxnPw
	ej3Agv2u7ylk7A+RVKReuun50wLfLCooszZwf8S/bUn4XkZ0WfMcmDfDc1opFd6BXKIGY8cKDpS
	BgSKMDip6D9rhX4+7lzSGmSXE4fci9EWPi3wGZ+NplSNY5JfaVIRKKuy3zSrA2PuYEc5zPhx0JV
	SJ72hw1NKQ/R7G7+khaxmYhyUyPIsYSr5QRv4spA4MTk2GHcBJ88t3JXH+qKzk0AmHuQuaTbxL0
	KM9qf1MoQc4yzR/8PGZWlq++AuAPQ6tO9wXo=
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id af79cd13be357-7d44394f4b7mr697101785a.19.1751079758759;
        Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDYWANWNuy16+nJ5OMuX7E6djSxIFc/7BaQQh+t5tnbRh+Z++1SUzPh2ZlXOCteDcaEDP4PA==
X-Received: by 2002:a05:620a:6188:b0:7d4:3af3:8ef9 with SMTP id af79cd13be357-7d44394f4b7mr697099485a.19.1751079758366;
        Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:02:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: display/msm/gpu: rework clocks
 definitions
Date: Sat, 28 Jun 2025 06:02:34 +0300
Message-Id: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpbX2gC/x3MQQqEMAxA0atI1gZqpGXwKuKio7GGoSoJzgyId
 7e4fIv/TzBWYYOuOkH5KybbWtDUFYxLXBOjTMVAjrwL9ELl36YfzJYx7QfauHCO6CK3zk/k6R2
 gtLvyLP/n2w/XdQPrpqSiZwAAAA==
X-Change-ID: 20250628-rework-msm-gpu-schema-0ae305d252b6
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HPCRtSTGwz5zkPqvv1wbF7TQq1M+P6roUP+I7n1ctIo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Z8tI/AxPjWoLQivp0SXotle4rlTAWfH09VX5jHkLlKh
 nuBDl8nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACZiwc3+P63z0bcTDGW9UV+m
 ajLa/z8o08CuXPaucf1774fKHzVuNa/PensxbzK7lLBM17rURaeWfOc6zOvx4/OHbq7HhiLTFlk
 u3ebXu/DC26R415k906TDz6/40Jz6JMLLZxkno9m5h7vXa7lrMFzsyGlKSpJ/bFRR0JJ8We5n7c
 7wJJbwsxe61t4yvPSpcga7X27/gn9ZR24mRO7f9U+s45eeg+rmyRNPT98rnhL3wkPu4MHpHMlnU
 qZd1koJrzwUZ6pXH5t5M2ZhEBNjTLxBlcq+DCX2R5Obc80ubvVz9nGM6BDneNG2ga8mvGHq/IZ3
 b35IpyWWm599Y7U85dOsC97rAtSSlHeHJ1+y3bbhjf9GAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX0HtUY/Qena4g
 C0tKo6TkonTMjVTmEKN5T+pP2Z87N3GYiRiUeKGuFsoOZwQzr+EnHcyA0UDix3iHXToVpG8eCM8
 v0VnR9IuI5kCcnLfvqn0P/OcEQQl/mCNcmWJ/q/KoRgi5grD7roy7tCLaCwXW3m/M0synasfF9G
 hvQa3ikd+4M6+iZ5huSGZuK+Ju4fvKebLjRKYk0wD+76CHkD0k9VASsyA9n20RWGWHjlwvtgDxH
 xR6cla5p5v8J8ikgKDga+Z4iwJDlOO8AZ3CukwqjOaYM5fA6QaK1s3dXAcH/8pEP/bHFcfKWQQ9
 2va9hxUkmIEtXldxwv+RZVdiNDMmtu2rFXfa8ip3bKLwnh6bXkCmqKdxDvBIvSMMu4jdi0KoAj1
 vhtVPJ9H8BpDhCifrDmgmMlyR0MVUAx6EbnDeNX+eeVjLn1xxUwZAIx6yAlMfftkr89jMkZA
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f5b50 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=h7DytwQeoaBOExqUImAA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iNfon8J25d0uNlLC2ac6u49mC0-y3o32
X-Proofpoint-ORIG-GUID: iNfon8J25d0uNlLC2ac6u49mC0-y3o32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=962 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280023

Currently MSM GPU schema defines a single statement for all A3xx - A5xx
GPUs, listing all possible clocks for all generations. Split the list
per GPU type, listing exact clock names for each type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      dt-bindings: display/msm/gpu: account for 7xx GPUs in clocks conditions
      dt-bindings: display/msm/gpu: describe alwayson clock
      dt-bindings: display/msm/gpu: describe clocks for each Adreno GPU type

 .../devicetree/bindings/display/msm/gpu.yaml       | 223 ++++++++++++++++++---
 1 file changed, 198 insertions(+), 25 deletions(-)
---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250628-rework-msm-gpu-schema-0ae305d252b6

Best regards,
-- 
With best wishes
Dmitry

