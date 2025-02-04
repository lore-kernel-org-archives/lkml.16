Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57992063C5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654544; cv=none; b=ZhHTenWDtdnjdCQ4h6KjwF9RgXmmvahOi7grl/Vuo1LjaQRvIdRffsjaULrO2VCNE7dbL7vFoZORIMcOEC9pESe++0GERCM793sLy80DxGaqnfMJkdmku9641o8eP6UVWBjcW5QUEUjVCnSIl+TVH92vhSqQoZuRH3TqVB0hse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654544; c=relaxed/simple;
	bh=UVE6Ky0ozJFP73SEeYl+6tLR2vKwsp/lsx7Dhk3iQTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdbVEoQXb87gGXEvK8YPuFFnaFrEh7kuOB/zyQ/iBWoqCESeSWnin3RL300VuTVb0oQ5E4R51ZtximUSeibXvLBDSZBMx1uaipIiSx2F176haGvqHzDjcKOg8ZIGFyCPtGKeuw4swmOVygpGcXMfyUcNFbeJAgcGEYBGJ4EW/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elhIx59F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elhIx59F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5145dZTB009074
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+Q7fwg4Y/Yig7iso6EaoY+cwSC1kIR0eqU/1fGE7Wg=; b=elhIx59FZmqV71uF
	qmxP2jQP5MKJxRMo3csLPIJmU4jL2lt0vwF5zG/WFYXJZ+rhwOsqfiNm1Gwtr08d
	Ik8xMMp2wvoF/8J8BGdgyFL45duoWVE80uuVjXX2NT8Iqfdb5ClyRbeBCV3YyqKw
	MQ6dpBZWoIbMj8Cdcs5CL9WhdTtDtHXVBg2RundF5MV9/iV4r70vL8ypm4usxBLX
	0ALh1yXUIgIbjemLXwjSBHf+UqUCX0xwsicWUPq10JTF029mgjtjM99zHZw9IHIW
	otfig6xd8Bw2wJAXXC0kZogFgR1kj2eDlaW2AtHTdF5ioIEOr6j3a0AD5dLGAufy
	ZvE1NA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcxm877f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:35:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso9766967a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654538; x=1739259338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Q7fwg4Y/Yig7iso6EaoY+cwSC1kIR0eqU/1fGE7Wg=;
        b=wqDAEpdjO0rzZNAaZqrEEn94epFtEL8dyZe2+8dvt7R7LA//Laq3jEhhSJ/9BKbLhD
         c+5ZCjPblTREyKaY5IHetWc40IHrAbmSNAsv3pKec6IhjcDqAhBREgjTGx4a1fs7fxco
         kGX218mExa+ThTBjgJGTxs/3201o/BZEu8XWvx7Oji/Ke/8Ay2j2bduj16j2tasaqrRa
         HQhPb5wtIBBcFNh5p+6n1bOA0oWeyNFT7V3cuUf5aPsfHkYcWgiot5poSr+N/1fePtyh
         w1hptCeDiMI89sXhr4ivLVAZyuWgul+3kk429Ip7fma5MGGhcVLzZuCqeZKC1BM0f30t
         +KWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV5afpH6Sip7E6kRLlm1QN0GMe74/cFILmOCdRQBsrFCfvPL0M3B6gGvcOt//bJL5+M4r77R4Y/rfJbdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXc3BEkMuJ1gIvZ+6jyttMiYKD1eT08HB3vIt/Bp01wPqD0yo
	B6iKuG2Yfd7z3LFAkEIoj/dlmCr3Aw4pt1WwS88dtp7QjBGiGWlnO/wTuwqPW4KIDsekokQ8aYP
	RDAURrtUKtajxh0aQiKYnJ4WcofEWI6KY2A3PabN2nNd/+NKhB1V4PGvKpCzPB5g=
X-Gm-Gg: ASbGncsgGE0Y7XOq9cEyBJBO7RE6KguqWT5nbF60zHpb2dmoQB+pbiU4udmq3K8Pycq
	YQE0RBsEaXurCRWY8Dm1yQmJ/zUAazH0KKq1oK90A64HstZ3JijTt8XnG883t1NgnYqC8A8aihs
	khTYjKBY9LsiCL/ttm29M+SEerQ6SVaDLm7qbl7VtLk+XAM9+m/Pa3uvZAlBX+eckV8Ex2HsLD8
	2DOnummYpq7w+eTsx5mdCJjPFzCoJSoY+Vl/UpKIEoMXyPm0I/nIaPy//hrp4nWCp3M/Gqpe1JK
	meLoUnZSC9TfbYf0r2GX/BbqDY71kDqnUMt76U/YPaGjx3A=
X-Received: by 2002:a17:90b:4c0e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2f83abd8358mr38267861a91.9.1738654537399;
        Mon, 03 Feb 2025 23:35:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC0QmdALcPNaB5gn6f3dvnGZUrUa/CC1CIXJWYwdx/zV2uoomKS2WhrQZZyEKUdXB6ADRMaw==
X-Received: by 2002:a17:90b:4c0e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2f83abd8358mr38267750a91.9.1738654535578;
        Mon, 03 Feb 2025 23:35:35 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f03b76f67sm7507785ad.237.2025.02.03.23.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:35 -0800 (PST)
Message-ID: <ed89aec9-99ba-7b17-d50d-93fae9436498@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] wifi: ath12k: introduce ath12k_generic_dbg()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-2-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-2-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y0sPS_6JGVm1bU3WRYqR9ZIVeOsnLc5n
X-Proofpoint-ORIG-GUID: Y0sPS_6JGVm1bU3WRYqR9ZIVeOsnLc5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=792 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040060



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> There might be instances where ath12k_dbg() is needed, but access to
> struct ath12k_base (ab) is not readily available. To address this, add
> support to print the debug message using printk() when ab is not present.
> 
> To avoid the need to explicitly pass NULL each time, introduce a new macro
> ath12k_generic_dbg() which resolves to ath12k_dbg() with ab set to NULL.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
