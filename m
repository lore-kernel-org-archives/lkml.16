Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE262580E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713850; cv=none; b=gOxppkh1WPvL1/fJy/cwhKF1D4M/rhE+mTa+vGkXFBmxU2xg7xgK8YOF8jB9yvIE24qEABdTM/zuQm98/RyJV4r+NAjhkysIWYF8wzAmioCZ+/AeDppmkWh/OeuZrKKd7xcYwWacgc4R3pNRWdYKhGZbVD9tkcfnYIjfE1U/qzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713850; c=relaxed/simple;
	bh=KMb6HEc989YS4nvOynxObwK2sZg5PsL820yo8xKWB0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYpfR/ilxIE9ZgA9ZiRuT5Iz5XH8dm3ax1IbWWUt/hudiTGlIHXMTtVxXWQ7wwhgSh4Nc+nHRixEIZpY2d5tHjsc8GwSh6K55Ft7NjUajiIBKGipsFhrp+TDRNp4fCCYllDTxhT0ZNRs5XEVcsnJKAMt7iiK4Q2V5yoe2z1a7js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzNNnOPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzNNnOPG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JLeaOi008568
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=; b=MzNNnOPGPyV/g4gL
	Io3VpNxBw/F+jVACkQGvFl0/BXrvWr+zDY5nVInGTf8gLF6kI9JmgqpNIhvKW385
	/4dk0rIZDiP/AkSaJI/8ctqm/DlEUJ/u34ymu+XQVht8xG3xP/CVMbfJ97/sV2ty
	XtDRWnQQW1g0+2xV1/ZDKu8e5VfkbhqBMRLqQ/hKaOyP3IrDlszg/7/nopdJabSJ
	F/j0KWltPyd7FzKWqH7HicCnyYpNHTkWj/w697dOgfd20RcP4u/kqWoqc2EQTMQl
	4zq/i6ns5gO4SdSZMDxj/hYPx6IQ7VTz3SgH40qTZ/2bFLMH621ogpmrmaKabgO0
	cu+VIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsxb5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:04:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742aa6581caso3209420b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713844; x=1748318644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+n9bkF0VD0V2oJ0zneDmypvwTmyRBfAOtjQDo3asjA=;
        b=uZFMHrnaZ5Tgzu2cAKpzXyyKoL+wDM464J7da78ZfaXz1RtEGD/6m8yd5kqAWheN7d
         MipE7xV5XfAyqu0wIKwIvlW6pChnPL7IGrx94MitEmVrU0YD49is4LR2/LP+RAld+YLp
         oFfY3Nh4PXwwyQvcH4MwAlLua4Jo9mWmoPpkC3XfBf4VpAn7lmNUjI4eHoM/ezzROJAH
         m9btg3MCet3HhJAqQIg9t0cdCBEWIGqp4zuQTxc0KLnb8g/rs70vYbMwkYDNz0S/qW6l
         IDbEBkgEnW/AKKrX6gNx78GNSQJiDYyX/HBc+A81R1Apq8uT8ih0LDDuey6gkIL4zgNH
         pBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaO6aR4uKKWvNlJrVBCyjS1s2TEx/bSuLLxCVQBscDZGNV99953uNq+KmNSYboQtrWQBpsCfxKqd9nnOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrsl8cL83023maxcbcHtiKly3MDDwSHIMVYBtpjZqdP7Kdcomg
	V+PMG5uUu1hR5JHoBGtxwkzJQC5VkOrzrV6X6X14Y1tV2yTegbsecaZiZptgTjzgteLFGyGTCUg
	pysW2aqP72HyuiCxQV5NjY9v79gMefW4HJHwf4P6x8NIWKDf0zkrxlbz9TLWl5z/4hF0=
X-Gm-Gg: ASbGncvGcjOyMZf9bX4tqs3KLhYL+VN5/YmhekPPD+S/VrrjWXK2dy4ILGRFLWkJAnH
	ygTCCitekw1oJLANMWERUQLORZqwOgQAFum8dpLtgZTYJFmFK2058W7pAMJ1ftTRQOOJIvx+QzM
	BPxBJzIPC2qR8wYL5acZeoYbb6mWwk4GjKpgGsHvnyrwaVbOcxrnAUDVYt5PBiSR5zU3IEjE3o4
	H5OofX3XdQsmUyHx4jR9q+Z1OJg36gS9oxL+xWujt20MF7mKT9gUhRTyqNFoIFkJSQDoROY+d7V
	nxULn/6fslXocR7eJuCFfN/8BHD80dzJzyyHgVxA7Q==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341308b3a.4.1747713844016;
        Mon, 19 May 2025 21:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtuj7Wq5AEHuJuYXpcnavQTfMcYG2SpoMb7J/CFpeG/fY8muA2u1bn6wkzdg+/GXDT/INQfA==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr19341277b3a.4.1747713843631;
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970d777sm7243378b3a.68.2025.05.19.21.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:04:03 -0700 (PDT)
Message-ID: <48a98603-d2b0-c279-6b04-0c89baf32d05@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:34:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] bus: mhi: host: fix endianness of BHI vector table
Content-Language: en-US
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250519145837.958153-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vRmnAxDMf4VAtmIVqirT-v1clyvcThV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfX0rVn8qMbgsT5
 VUzMkvvft85JCr/0M07QR65iWV7BKxL43OD2ZCv+ORAKDOnu9qhJSnZpdDYKsl2OmnBuByqhVFq
 SrNI3VEXnR5SKD5p4ItlCDQ07+E/TzDQgzhs4LmOSA4gR4Ea06O+f07h0wBBv7enjTXkR+FD/76
 ofvb6we5ne8kDbm2oHPehqpTPPbo1xeTfy0YN544RztqkzpIjN6B1KrQHaliriap+VGyWE40IEV
 bmSBEBPJblH+bDUl3Qo5HdzEPnmZfoMrTFVALKWBJqLHBye+WafXJ3oZAOafb4WN2yeOWrakVot
 rDJ77pGhLeYUHbnPWbVidTDF0U9QY5pzHUd6idCtGbSeDVY4YF/QGYiZdy2QQwAyRAE6+sYQQ32
 FsvJw3Pgk0P8vrAh3lnXD+Mi9Z2kozXvfqvsaljAFe0GxluO3P0A+XR9e1J0CeWWdY3wpjUS
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682bff35 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=QTSRpw9t3mQaVZ-RB_kA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: vRmnAxDMf4VAtmIVqirT-v1clyvcThV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200031



On 5/19/2025 8:28 PM, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly.
> The following example shows the error messages by using qcn9274 wireless
> radio module with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 
> Fix it by swapping DMA address and size of the BHI vector table.
> 
> Fixes: 6cd330ae76ff ("bus: mhi: core: Add support for ringing channel/event ring doorbells")
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
>    - Set __le64 type for dma_addr and size.
> 
> Changes in v3:
>    - Improve the clarity of the commit message.
> 
> Changes in v4:
>    - Add missing fixes tag.
>    - Fix commit message character width.
> 
>   drivers/bus/mhi/host/boot.c     | 8 ++++----
>   drivers/bus/mhi/host/internal.h | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d..205d83ac069f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   	int ret;
>   
>   	for (i = 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec++) {
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = mhi_buf->len;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(mhi_buf->len);
>   	}
>   
>   	dev_dbg(dev, "BHIe programming for RDDM\n");
> @@ -431,8 +431,8 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>   	while (remainder) {
>   		to_cpy = min(remainder, mhi_buf->len);
>   		memcpy(mhi_buf->buf, buf, to_cpy);
> -		bhi_vec->dma_addr = mhi_buf->dma_addr;
> -		bhi_vec->size = to_cpy;
> +		bhi_vec->dma_addr = cpu_to_le64(mhi_buf->dma_addr);
> +		bhi_vec->size = cpu_to_le64(to_cpy);
>   
>   		buf += to_cpy;
>   		remainder -= to_cpy;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index ce566f7d2e92..1dbc3f736161 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -25,8 +25,8 @@ struct mhi_ctxt {
>   };
>   
>   struct bhi_vec_entry {
> -	u64 dma_addr;
> -	u64 size;
> +	__le64 dma_addr;
> +	__le64 size;
>   };
>   
>   enum mhi_fw_load_type {
