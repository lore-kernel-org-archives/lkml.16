Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B8A27FB31
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420445; cv=none; b=RCW9d8uKq/89D9LFBuE2jxcgQXTKFX1986GRONQ87WnvBGWJ/yTtgYK3sYXoPqQyIcC0iHs13CK53cUbEcBRSzjqezCJLR0ysIPFkk4m+ATP7zQVVOubX5GfwFZY/MRlfu9f/eGpckDFT7ap2s5M0eovMthdE/tOCqpY8fXcVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420445; c=relaxed/simple;
	bh=zXqAoR4EfuKOxXCq0A/698ZrHVDeCN37DGgjfTfOph0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bNkK5VNmE6Axelp3YvJPxu4bb2cBPs9iSMHPMvuR7Aqwb38muNKBDHhRUYIXwlXIUFpyJcklc1PKgAI9Dn5B3AWxd69VOfJKNf/SWBDemIVFpktKhVrlEsK4oYcVrNi9aSdF49g2V+l5d/zQrNFEZ4t960Sy2HS5znJr1+Ko9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm+x2Ptk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm+x2Ptk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBS5lD024008
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rKtKvHPlmBU35ct81LUYhk/RNfjmHT02ibJBXpyRmo=; b=Rm+x2PtkHYgN4Zf3
	vCRjB3HJ3x1aIuRWsvQ0kg/6YwMm63VMIf633xxpcnmK2Ehzt8vsMX1nQs0h6PZl
	Ht6cFjZvZOgONWb0KjWXpLigySFecrxTTB4So6g6grYSdA707SOQK3rqXZY9+2cT
	Ub6lm5gfazWKIZiRha+5cajGEpPhBoSyIlD0joEW9BHLeImcQ3jFy648Bz6lxeov
	f64BEm52jB9hSDNI+Hh/yhtbiF+lScLQPmRBgyGRdWU2rhG0sUeRrPyHT3nUeUJa
	w28eZcfQ7RNA4vY/KHDTq9QAIQ0dpTMj+0dk8Z50DN6TS8Uvku/ddh6oCUrig7Py
	IrXxlQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq953m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30a96aca21eso2528318a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420442; x=1748025242;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rKtKvHPlmBU35ct81LUYhk/RNfjmHT02ibJBXpyRmo=;
        b=ZE6AdCRwuJOBg+voYS2/qKy0djh6+knTiYNCQsr5mZrT5U6q7/Nry64JQWSPRgT3qS
         kOXdoyovoBvoAXUsgggdr1yvaNKydz2YWpcPcVfYfSbEVem/HpBNPppTxaXXs0WRGfT4
         mG7/EAUwfySuUnhXzA9LowY4q/piCdvxhKRouVUUG4CeN8J/2fLeFnfJa7TGp9lqo/25
         xdVs+VSrfT5G9BO9+ldfNr4AUxdcGgc1+2r3a9ZRldeco5gt+06Xo/ZdyGZ/9qrtD7Vw
         ns21qd5/w9UI1Vvrq6296aohZyc9YGVU7uCosmEIhv4AvQ0toMuFVO6c0jVf1f6WaZCl
         o0WA==
X-Forwarded-Encrypted: i=1; AJvYcCXM1mLxHKZJQ4LTtTRqYNkWWoxxiHc0fzl9sKdtOtb/5P0gGnEUvTAVnF9rSXs/2CBkfYFZLM3Rfvnb/bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjyoMQIMTkOVtAmE3fPDX9NgVlpvGJzvJlVRakFo4V3AwFGdx
	CkgX1MU0bxufpFJMuyTM/FrCOze+SDy1+vEwI+23+DBkHo94MR6j1ZIWvXT3ne+RBiSnJf+JWV1
	gCSpj65FwS3VdqDo/jYpZkzegQze82ZUQBABSc4CHW+r8lnIbWPFfGBDKYFunFMQSV2k=
X-Gm-Gg: ASbGncvqGYHYJdGhvym/YbfEjZAWQ2J8wy5GrAsZokukyM4ARVYFAtwx7hrAL3ZMMwo
	P4OQygmJkjSEw6Xt3/GZGVSajl8WOhyCgIakOSpwpnGX65F0FO6HKrvYWWoS4tTrEPKL9WVlMAq
	c0Y7EivrTNDUOKqtqtrFs7w4cB4gqf70/x7zlT2nHCVM5Nk4nRm14OGo9W9lchKjQ/intCembgY
	gRvUzIGcRQZkE91iqc+CLHRP4a5o++Ns5DicELXJe/aIsrDeuq3G6b5hbF3MHwByQx88l8dUxG2
	5xZMbNrl2rT5x+ohJA+0L5BSnxj+g17oqnp/rGEcMIN1IvXr
X-Received: by 2002:a17:90b:55c3:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30e7d548c5amr6293557a91.20.1747420442434;
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfU/I+VS8P3Y2hHITlYwiE14XuPxHWro93S4ypSGLKOx03F5dtPTXcGPNIj8o550YK/qnMUA==
X-Received: by 2002:a17:90b:55c3:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30e7d548c5amr6293513a91.20.1747420442026;
        Fri, 16 May 2025 11:34:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:34:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321094916.19098-1-johan+linaro@kernel.org>
References: <20250321094916.19098-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix ring-buffer corruption
Message-Id: <174742044076.3092151.12237526642580787341.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:34:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Feu0vPC6J_uU1WF0yxsT-0xjuNETjUix
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=6827851b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9x3tSbx4FoV4MKPCUlEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfXzkBvyKTmGvqq
 4jky0eThJsbPcxqYq41QU5TfPc2ya8kPT/06eo9F3k9Z3hUPQRBgJlzKPW4aPKPTrlXolx8Duj8
 rGss2rLp8/x+qjTsm+NgJUKscIKBulDN4CJa4dElueqKXsViUBOZmIzzo6B7WZEe3vaGKUpzUfD
 JeRo7mK/ScptPP6T8CmRKTdZovCCLZi5y44ITxBzdGKD3GLMPzq8giqORNb10gs7zidSymWh+E1
 flwBR3uUVqEQTZ6RVJY+qb8GZmyO8pJxZJfSNJkwzT4NO45v253nbIKq5QLl8ZyLQL8m8obGLXt
 +nh8nZQvRcc0njHsGgnDKOau7tMMSvX3gIo3IK0TVA9LQUAyVJN7XDbX/ciBkG06YV/LhX0Lizq
 JCO3HHdaHmsUYVIM+oe9xepnCQAoGZA2P4BO3kGJPOl44DG9hPbpERyIS+y1F7CyCTIz8ePz
X-Proofpoint-GUID: Feu0vPC6J_uU1WF0yxsT-0xjuNETjUix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=713 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160182


On Fri, 21 Mar 2025 10:49:16 +0100, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix ring-buffer corruption
      commit: 6d037a372f817e9fcb56482f37917545596bd776

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

