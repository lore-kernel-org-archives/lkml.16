Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAA25A2A9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183414; cv=none; b=VdPcgFa32Qp4iunBBDJB9fwRIyCB02/1gj6srkzjCmZ7KBLGfK06ZdDTXI4rJqcWzZEC6DJh/5ddaXOwXEzT18EJH7gUnXhctbFmAcz+RpkgfxPpdXVuPKJ8iEVWs8cF99Y8aas2sKvXihdQLi1iFOMKFdL7tjIV6hdNkUYReOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183414; c=relaxed/simple;
	bh=TbCJOIFZxOuGyD8oWXw8Z6jUczKbN8HoYWk4bAX9skc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFRtYSp/DJ6h2xfB7ww2JvAFyodA00BhS2fkJnVWvlzH6IvNv2A/nHJHx0lhg5rUTYGfp90/2o2O8jyLkODrw6p2JaEj6Hq38kdmD0BYbf9yG95xSOQa+Tpv7CfbXAR3Kszo2YYRXpf7XuIvSyT5OM+BIPhDVplmnw+RmmTGbOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdIUS0XT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdIUS0XT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZ1sP006872
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 07:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGopHc8M8UiNAurUBT8tbmUjbBdi9nDkUm7yBzqMldo=; b=mdIUS0XTGKVtMDDZ
	H3rvzGmwgrXrm0T+Ydx0KIFg4NI2TDT+27Tbt9YZPKsjs9KVZefnbr+ncxFBDT8v
	FYtXZhJst6HFgzfiA2ivQcYdB1j/kmdwU8ddd/nB9kqqhZCvCWTYT4rOajx1rSAc
	engn+O6tC1NNQN8/fFVjvIWWQtmgaFPfIjdUmpkp/MNAvyC2PgdwsgMKL2tr/GzS
	VZ04VabI3LwSQkl7TwFovkANnzI+50ONEVzBgLrd+lgV5/QiObXdjeCMvFB9DTeL
	lbTZdkCKvCDGCm8IG9WgMBPZODiNe0YZIOYhpSBEEAT8c7WNGKbbLRBBQHJHeVxP
	uyLWFw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3jdct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:23:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736b22717f1so333910b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183410; x=1744788210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGopHc8M8UiNAurUBT8tbmUjbBdi9nDkUm7yBzqMldo=;
        b=DmZ9VEc2VSyht5XVBl31QOwC/ccQ4r4bQDcAxo4tSi7lTwpqRkasZRKyt3CxxKon2v
         im/8nVnrhMqBc4kyCnQq+Ig1wJJ84SE+iCk7h3rrhtNz6Gw7trTKV5wILPE/ZHqBLJfs
         ifucHs3IY23P7eMo2Xxj5eCIEVaokxNXkTRv89+bsQHP+HBgqhUk2QZIS3sdzgnsSuAJ
         /VY/UWFSpdF8Qx0wBPGcbb8oPgKsChoiW+yyoz/PkbOVGv1N66Hgk/4PoOO5Z8vPevIz
         ldezx6z6aVt3JpBBmt8sIelpK2UH6sNIYy2doikbcU3gogt59P9pvRbnSw54RhmI66+8
         +CPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZqzre1Y/RKfy3gbBt4UJzMblkPleF0ZlfWo3PJuX6Dy//4SkStD842Q3s6e3SVMI/vj+h1CLUeWCgmog=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+v0kPMpqb6EcpcK1mV1pNMVY2+iPKGTVT5zILa/R6jN2TyNa
	1ewFxQxGIFOnvT539pvHKL+DTjypLiPS5yzqb0HBKa/RbkdVPmjcuAG/O1mg75Ym6z2oVk3jmyc
	8rbkTCgkDDfeC7GEo31cttPU4Zga9kk3MvrMx6bZGFypnWuShwEXwlICcZF+S7eQ=
X-Gm-Gg: ASbGncuADfKR2j8jZBFrnmOh6SkcgS/qbFl7DhUxhXSoC9TSvAlGtbodb7qpmQt21iy
	ik/3iRwqimqfErmV5pDYh+Xsr+WX3z9LPA2tv6GnfitY1TQVgMu0bAwR8z46t/vTls3ai5cTE4F
	WAC5PkwqtCkhQdyaZd1pR9C2oJ+LLzGb4zfQy2ILsTLud+8/rzu535y2DYQYGE4/siBeFaYPRVY
	8mBXS85c48ndnhSRYwjoe2MNxc8QHFvsRpqdqKqSxrSKlOnNi7o4a4PHJCIGfOVv9RRbY7Me2g0
	ZrQpoHwO4hM73TkS51RNO9p1PJNrq7D3joSXEAJqiovx0oW2J9gOjA==
X-Received: by 2002:a05:6a00:18a5:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bae3ff744mr3170243b3a.2.1744183410020;
        Wed, 09 Apr 2025 00:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPtgVisc7CCOafLf1M/gX+5QZW2iaobdlIZE4fEYvLA2WNor2YEuBrLxps+jQ8y/aA3Q6YcQ==
X-Received: by 2002:a05:6a00:18a5:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73bae3ff744mr3170201b3a.2.1744183409441;
        Wed, 09 Apr 2025 00:23:29 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2afefsm619328b3a.16.2025.04.09.00.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:23:29 -0700 (PDT)
Message-ID: <7378fa5d-5495-ec0e-9f15-6aa7e63d204e@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:53:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix cleanup path after mhi init
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250403-ath12k-cleanup-v1-1-ad8f67b0e9cf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: detTh1poJC3sEZN0ydtnGQdMziIR8uem
X-Proofpoint-ORIG-GUID: detTh1poJC3sEZN0ydtnGQdMziIR8uem
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f62073 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QRlmjJKdkydlmUMDs2wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090032



On 4/3/2025 3:34 PM, Raj Kumar Bhagat wrote:
> Currently, the 'err_pci_msi_free' label is misplaced, causing the cleanup
> sequence to be incorrect. Fix this by moving the 'err_pci_msi_free' label
> to the correct position after 'err_irq_affinity_cleanup'.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a3012f206d07 ("wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector")
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
