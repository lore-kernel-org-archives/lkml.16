Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14726773C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690128; cv=none; b=G0yqcSiQZ9i+aNZuT8fQy05ifeStJBeVXAmobCFT+JSMMG4SsVnW4yGCfagsC89OzxG0ZHyrctvVVSgekPFej6bn6crQ70SF4gVsKxujWYS9TXNNKigTmg5NjAMp6snNOdiSHPRIkUNXM3zn6DJdMMWgFESa1QV1ZbPIV4f/QXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690128; c=relaxed/simple;
	bh=nrwvzlaqQUC8YAY+W2bmqWO9HhH2p11gVxDbaWx0z2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FnR1oO7Kk8lvK3QNmEbsr/14j3L9PhbB0IleGHBHjneesn6U0JLe94LDhqTXbx9FBLYCe21XYKaQb2vsC8U5/8gG47mmxcQ861XbfeGLWXZ5XsiHBPypT+8k9eF3Ceri8yPS81rXA+zwI6/1I3mfTooe/ODQhnDl4YS95leGBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfMmGWn7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfMmGWn7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NEkPVE025021
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u2UsWwNOHw0K5RL0LIdI2bAlituELP+9ZWGZzNcnro=; b=ZfMmGWn70YeX5kZo
	YW8ck/uV5F+/T0g4IIkgOSbw2cLr50iYze25lNfj2be2HIhmEisjdtDyeBF5f4fc
	vnTMIUVDbvWqxBNxHAfbGRl694bUfxqi9GHR8JOxFikKItWlahW7aG+PjaE5ICLC
	1UiT4ViOSaqshAsS98roIhwCJNmMDPEf1RTw645zRAuSGTyfhBv31a8j/VvkOHHL
	pz5pho84jTUrewYWomlMGxaiDw/YGOIiLmDFMFcY5LIFirMjVPT54FeWp8t6Rxrj
	Tqz5/t6PLVO5oXexDT3jS+9Isqkn0k8qr0bnXtN83uksw0E6YbndBIGnFgGnU0VH
	/Tk75g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymr06k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4594146b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690125; x=1751294925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u2UsWwNOHw0K5RL0LIdI2bAlituELP+9ZWGZzNcnro=;
        b=w1uM7Z4zRJUq/uF3vyk2Q4h9lOy1dNGDFDxiSidDjD4I0pQ2N5xbSsMZv/7i/QxJQe
         aBQGRgYwBVazvKfMRcrcLxYXOIlIbfomOCUuCjdxygd+cgWUSOBrXc8dh3zaM68I2Qk5
         Vb3nxQ0cuYJQxPOK97FcOB6Vnzly6/d+GqN1NNFDwSk92JFiDYDXiDaNIdCOm+7EBHWm
         5Levo7kGmpkPcv+MiRTlCaXDelEvln3E80ae8D3J9LKas2OPkhDGKNvt5m43i2NxgwGr
         QHjanScilXpenGrIjzq86ztfY/gP56u191erdorQVWURohZ68Xb8/D2/bhmIOE9M5ySq
         y4MA==
X-Forwarded-Encrypted: i=1; AJvYcCWRWxoKFiMDjswt0UjYBm2evdMsqgWtcPO8XFXrxbU+jE9+MLve9pQ1aP/NBnt4z8SwADT5meeNVlCNzBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzn0+zukVVzoR+rOAEfCuAec1Js8ftuH075Me8axwC20DpzY1q
	JXJPd+X/oYNbcPsGMUoU6YrJ2GmaoAKycvR7chZ8q/DGRHtEko2+AjMLGmobAjxMi6Qd3piVHOY
	W+xMrrv5/LEVMZjkOyYzanvQb9qPgL4FNuNq9wgZA3Y6Vkw6mXKvDTTAD39PHgaBMeiQ=
X-Gm-Gg: ASbGnctoi+edebZEBRegPc2wU066QSEJ2Reau94sAzfe4EguuoqrAOBeTI6/8+x4LFp
	+JyersyPhxVhBsAuNeKeBXcJZiiMcF97+brBQ95DXMGqyp3rWCZeSe1NFzWNRbvbe52/Lb35Lec
	beChxQ0QkvI9wo2l8FYDLtWrsqufJpLtMyuBjP7VGtVG1IL1cUvcUHEkWjFcHyMdRgW7Fm1SOb5
	3VW74biuC4FLUnTl81Sy7P397wQhDxFQLAtTNuCYuCiyKDebG4Qf7fBu7qE6kBrngrxWfMrGiAJ
	YvvR5gExZCFbGONY8zDZIB92QVV/+EeIwaWAKhqwEl/FFgaSCqKzxMCItRY=
X-Received: by 2002:a05:6a00:4146:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-7491e600defmr13374394b3a.2.1750690125499;
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQRVvYAXXguR4h45hA8mHP72d4LBWLqdt8dB/qCfMgFAV4oWSoJigOJ4Z9ErviJVTpXKp06Q==
X-Received: by 2002:a05:6a00:4146:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-7491e600defmr13374358b3a.2.1750690125078;
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Message-Id: <175069012445.3758471.34015701209057251.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXwKve8Pp9KL9z
 jVGEGg3uauhUjny2Q3yV4HHfwk4W1MYKvb1GBuhQe17mwGhwnhdo62sjbAjFxwOVrV4o0nFEvDK
 aGIf/sLuofzXWQU5Np5QPY3ewEH3areLs4x4+sjjwX2jl6qvOeoLyC+7ATdZ/b45dgrrMYce/pA
 HB64ZJQYvSbpjNX6psOMB7+k99wU6TMlH4BHv9npitbTMTO2D/dW2OYfV/p8zYllvABXJxhqPF1
 +TBH832rh/rOyN+qyqUCMtbhruGtaZisMlzNDnHXQDrCE0uay9D5FBcxBDsEoP1gUogO+oJk0fA
 h0UpR30NQTQs3AqAFER2uTlH1swb+VrRMnlAaueDOh+7iGHyPjOSTNMyO/HqtFSYjirnw3kq4FO
 6W+LPYTvGsPPZE77bGh06QEGagWtw9dePrO5erio9+b5v8EWTDerSafOAmAZH/DxManqdW1j
X-Proofpoint-ORIG-GUID: JDt0fikJbVsEqOf7FfNInch-020rauhC
X-Proofpoint-GUID: JDt0fikJbVsEqOf7FfNInch-020rauhC
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=6859694e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=921 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088


On Fri, 23 May 2025 11:49:00 +0800, Baochen Qiang wrote:
> We got report that WCN7850 is not working with IWD [1][2]. Debug
> shows the reason is that IWD installs group key before pairwise
> key, which goes against WCN7850's firmware.
> 
> Reorder key install to workaround this.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: avoid bit operation on key flags
      commit: 49375e11819b0d0f59ba59726d8e0b47656f5406
[2/2] wifi: ath12k: install pairwise key first
      commit: 66e865f9dc78d00e6d1c8c6624cb0c9004e5aafb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

