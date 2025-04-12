Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C6E15C140
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744431853; cv=none; b=XiT6r2H/kTtKIfsbMZD8xnRQOJPRjDGX3YN3uHg8VYnmTQCMMOXS0jDzXu7LVaVdCbTvqJ+6zKFAlw78kiqlV3f1y0Dfn0O7zNoFPcNdQoX/YP8XoYCVozcAna+3veaEuWbrN1WLLYopdI2UeTVbBEhCwcY7jcnvzBySob/T9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744431853; c=relaxed/simple;
	bh=pc3QLyGRS3WeJa2O8oRhdEoc8MmaxBb+lN6USlBmKEg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oiVx5W7aSjG5WG4COCmkODPP5QdRr+JnLGbuDojETS0yznp6C+cGsz8y73Wx0BbrqntlTsRiDOnK0Q1aWPdDuxjLpxS9NxHpjk9uj4yQjpuEC7U9NJksJI2sVj6S2C+k6CVLf/snFknCuAf+PPwgR7AT4Y7pXexWpAJbFJ27ckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV4dFO4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV4dFO4K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jjVA007898
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHhxVnAGB9Zoh9+suD3lVtuipknXqR2QPNNThDAj9x0=; b=RV4dFO4K3N3xTXXi
	o4PUK1M+Hy47iUB7rHTx1Ye5e9UZRI57KH1Tpd2bQXFCbtelyeiZqM922ZzKPtzb
	daGhZfrg9scNWaBAAjK7bSlZ5KQB5agq45vT84VgE4JuCpT4Ve98LbzMtdp3w3Tx
	P72x82i95vT6yCXZFhnBI2RccX+mJdgu1CH3vp9G4FY/ttc6opG2Ee3pkX2GldWX
	soo9eUubImqiNy48D7S2py79VlmOAQQGl8KQ4zUCQabrIz7Y/nNaL+vNHexjRe3M
	8o078f9BP3M7/PdoULlnKhBk3TOkwkoUNB8yyDE7xZZ6v3TBpHPSln0o1VyEXW60
	NjXuMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4v84vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so2317910a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431850; x=1745036650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHhxVnAGB9Zoh9+suD3lVtuipknXqR2QPNNThDAj9x0=;
        b=rxOqTd86QkItERqwG8ug9Ldp4zFEiC1j2idKNPd//OZfo1MIXWyTYcalvLHbE2u+9l
         Pt5On01Y1W3oVxMrA2cYExEJGYf4Kk0a3OW5mRmYYahuwouHN4kFhE5wLY04p8Hlx3xf
         dUVCjc5Sm5vO5qRxGPFEajaaBiMtwLQJ4aACRgKteQRrBHXujy7VaKbY83/Ov8e00iFx
         vrB4/awEZ5FQwskHgF6JSRTM5LFj2BMxJpBrIHu8OLHHAiKxd0hXtZhk04deldZeL2ba
         K6/MOVVij7ZxwYblu71G6YP08XsmhpXRbQMqnSSMBiqXj9eC9cCr0gzEZ9cUYZBpT0pb
         przA==
X-Forwarded-Encrypted: i=1; AJvYcCWmjRIflbg/g46JksoGSmt1oLBmzXkrlqYG39dqgnIsdPQe6PMSg2tsbH+UUYLOcJti7ls5D3Bs+C26g70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3WXp6Aysfu80nu5acz4QEHqXj5rJProPQZK51OfpcPc7dUW+
	i520J7yhREfrRVm7Zx3k9aLgbPl4xeVAgfjSNuY28lt4Aw34WshZmzTvEBoxKi5kvN7VgHJOQVZ
	IoSARr5D7Bj/TgOvZcdnFJvgXtGV50LY8hlPfC9WKzh8elHhY5pFzRP1NdSyBQnE=
X-Gm-Gg: ASbGncs0appN0G1tFeSht0gaLXw4UzKM/nXLNd9Wvn5nLIfxRJTa1TYpxHMVGph9hqf
	Q9+VezPsnYVJoJ2BepWKw0tjIYpe8OcU1bx1MdKwpZ0Az7/lGvT0VCwS9/Tt/UoQJVZYJLd1GAj
	eiJpQu9VAoNSduWisPlXRP8evGQAWx+VbgKvlwzgltIYcP1+Huk8i1lBZ5X28AUlNSvh5BVIF+3
	CdjbQkrHdHldaVwECz75WDID0Fp9f2kizoiWcO/q/WL2UoRrIIxTB6z4eyU6+JjZyCebvvsom5I
	XXsSuzWPHYqXhXIjzHKlzzKeZgExY26tI8x0gHmfFYp+pDXM
X-Received: by 2002:a17:90b:5687:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3082365a323mr8373956a91.4.1744431849854;
        Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpLTEg2vWkUaoeaii00C38pjWMEPsiGj3v+UFlZWzDpgVqMQsxb8I9hd2bX5qPwxKfrzYZsw==
X-Received: by 2002:a17:90b:5687:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3082365a323mr8373917a91.4.1744431849298;
        Fri, 11 Apr 2025 21:24:09 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Kang Yang <quic_kangyang@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
References: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix cleanup path after mhi init
Message-Id: <174443184853.2972989.14317890740141451684.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 8XXrR6yE3ZhS3i6XT5GXxV3788zhCEPF
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67f9eaeb cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9DHkI-QYbg47g42TtbkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8XXrR6yE3ZhS3i6XT5GXxV3788zhCEPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029


On Thu, 03 Apr 2025 15:34:29 +0530, Raj Kumar Bhagat wrote:
> Currently, the 'err_pci_msi_free' label is misplaced, causing the cleanup
> sequence to be incorrect. Fix this by moving the 'err_pci_msi_free' label
> to the correct position after 'err_irq_affinity_cleanup'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix cleanup path after mhi init
      commit: 6177c97fb6f05bf0473a2806e3bece7e77693209

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

