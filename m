Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2112264A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979721; cv=none; b=bzlqxbjU7NEeYChiT8a9JMU9t70PZyTGSWFD03maXHh/BIVNWdJoCAOsOXFc/CZcJ158huh2n6XfZEaLXn0YaiaFU0dbVBOtpWXIECw7pkdxGtBLcN91obxL8wxZDuow4fcQwGmBXd0hR194E4cey/YtduTMZQJdoTAKh2j7lL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979721; c=relaxed/simple;
	bh=umNmeih+NCcfNo3NKezPQrC1JTTx2F3NeUJ9cChDMcI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HoP5kF93L4bTT+NUles2QFx5rj2ee4ZOi5XAD39cNJGUkTC4DDcKIByzAgTuX8ZhnbJamr82Ns/SgB2w9wbX3LyPO6DlnpVGYjtURhV2cIorUs6m/0o3GHt3vJQdDsIwI8Vie9tOWCXa/v00EBfTz0Hd1flaSp17FA+wmE6fiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m90FKIyk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m90FKIyk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIdhJT030229
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6v7dg9aLq/3BqM4qFRm/sKBzay6K+XSiGPaARUEG1es=; b=m90FKIykcJWK3qc4
	Qv9Ed4RAfvhgxTeYtwMNMi9vtrOs5pJYqukOEu03Cg4w/1N7OyuiONKoJVfjOeqF
	7dd7neKGPYXlW/Fj0zDuVYJYF8AVwXsbIPPcsPeLKbdA2vsLgLuiyREYn07Aqe5k
	KX6SXBahwUH2Jo0VDAI11HGnWGmbHVOo53Qx3MV1jYsIMSwG0HDiozSXMvQ5Y5hq
	xGRWHFn5lsm1CS6NstTlgCsNF9kjqPmDGfsMD/GrvuwvB6f6tW3m2Vdy9ljI5jd5
	MYJSzW7Owoou9l1cAPQ4cb7FwD5dj+WJVDNbMYYnc9bhyUG6szBw/QYBMnQ/e5P/
	PZ3LLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4x3p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349498f00eso20684985ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979719; x=1751584519;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v7dg9aLq/3BqM4qFRm/sKBzay6K+XSiGPaARUEG1es=;
        b=vHIu31t1nGV0+ZkDam8QY//EaoZzc1C7ap3O3QU8DixU4SZrtbFkkTws2ffRaFQi2C
         5ewprvS2rZRCUixxaAbZzbv4WnFUUJnO7d9Z3GtfTzw2VJk9ZcHA2TuWv38RKFowCh24
         2O2KirzmJWcrUK0LVf+jq3Rc5/RJKa5/RC34vLby3iCox8vuOQDX5sivCKUKT3hbwsOL
         Psd7jTSA5aEWCdAIpFuvjz95w1VKjVeUku+E7SqAC/JhlEtKGiuMQT5/bW8aXymMyHCx
         wn+7t4lIUiUucjjm9VHxnOAHRBJIt2lGGvUdzHAdf5fIajoePMfoubG9gHQ2m8Xf0okR
         Xw2g==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ivy/EtU6Iofwy4DPTnlYuohfGGmviE1FqspDLUOeTVI18Q24wGl/Srx8DJyNOzwiUxt/OAmGKXcgt0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/SsoZ7WzbiULQC4uwzNTcZSBN8pB2/SNc2k2reugVdOw+VKlh
	IwyQPkjZ1rRnyQA3cRsIzqvIi4ZSFg0W20rpNeEDcm97YxAI20mdK3TNlnPSsCcAp1bySwC3CxS
	T3xcqrrsuWpuHErnihjyut0NhTbOyWGQiMKDUkjlFX3YP9+b8/x71nXlqUxVB6p0Ir1g=
X-Gm-Gg: ASbGncuxK9ZFzpdnfLsCnr2AE5FIvH2pNFCAYfE2XZjj+x4lMlkxATLjcGaQKeeZrJF
	r0ZNgiz/8rDfpxUWDGDUBL4GOjSar5iddCcsrAMwjm4UQBSsYoor+Wt1n4IBe7Xw2fyOdlPJjEf
	ZYSosnRuCiP0WA+zI6QB/3kdD501ng8koLp7t/R/95/pgkAj2/qklgUJesh8vdMRvzDtvO47ydA
	qoshnmXdWIqcUiKSVo40eZFMhJ2Pp1OYJ30EgS9Ag44smvR4muJWVlykaNARE9cKybqhNXjjmoO
	8tavQKubsBzMQQxTq8hL75hLEE3WXsyVXfwpiAHbRH2byNV9PPzrqfx7+E4=
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr13412805ad.13.1750979718654;
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8MyYb5DgNriJcxgS1vLDwImzLrT7L7rSqE74R6A7X3DgIB+k3j9LmAbjtcQvtoy2UgGWcIw==
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr13412375ad.13.1750979718235;
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250604143457.26032-1-johan+linaro@kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v2 0/5] wifi: ath11k: fix dest ring-buffer corruption
Message-Id: <175097971753.153431.15108889978896769332.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685dd487 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5RTc_1txDYSjDPOt6ikA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wROksyn-CHXOYJAsfh0ef-vXyxIPjfoo
X-Proofpoint-ORIG-GUID: wROksyn-CHXOYJAsfh0ef-vXyxIPjfoo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX+iX2IRUkxq6f
 JoJgO4dKgk+R2dm50fnOMRWv2yXjMWddYFnLerbdUNY3xQc3WmS3zss+9lk2aWM274Vw6gKUXhW
 7aln4bibWG3OZJ/GAJEEnPqNM1Q1PSYOV1irQ/ehcharjoOyD+7gIFRUTi2zMvi3MYbL2tw71dH
 V+y5HetlCXdYXZiSVAT10nh09pn0ZebBz9NS2g6bg7jxpJi4qWAQARfZERq7Cr6CZtqqBQCM/sY
 rmaZ4HaNWsUwKV2G+xhHboLU7/kPC4M4a/YyhkHtD7ozrYx2Cg7Snlbm6fnKhN7WcFD0pBLfxSv
 Nqm/v+CG2qiTsOtCc8ZJeqng/xImio5uwb3vIT8pUMPo7sgz5VqkwdL7zb0xcaTN+UM8sFq5M9g
 3LMl+BI07/VrBejrbLNkvcAaHFhgtQXRe8mwbAjnpW0m2FJCdNY+T+NptGnax7Y9bX1XCYBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=925
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260199


On Wed, 04 Jun 2025 16:34:52 +0200, Johan Hovold wrote:
> As a follow up to commits:
> 
> 	6d037a372f81 ("wifi: ath11k: fix ring-buffer corruption")
> 	ab52e3e44fe9 ("wifi: ath11k: fix rx completion meta data corruption")
> 
> add the remaining missing memory barriers to make sure that destination
> ring descriptors are read after the head pointers to avoid using stale
> data on weakly ordered architectures like aarch64.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath11k: fix dest ring-buffer corruption
      commit: 8c1ba5091fa9a2d1478da63173b16a701bdf86bb
[2/5] wifi: ath11k: use plain access for descriptor length
      commit: 3a690e9091ec07f70cedd9a7dcc074c8554f1bed
[3/5] wifi: ath11k: use plain accesses for monitor descriptor
      commit: 4aba95fb1faed7fe7f6e1edfb60c333e0275dfc1
[4/5] wifi: ath11k: fix source ring-buffer corruption
      commit: 6efa0df54022c6c9fd4d294b87622c7fcdc418c8
[5/5] wifi: ath11k: fix dest ring-buffer corruption when ring is full
      commit: aa6956150f820e6a6deba44be325ddfcb5b10f88

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

