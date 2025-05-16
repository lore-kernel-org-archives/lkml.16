Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63827F16F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422536; cv=none; b=BYylFAIdanBP1D2JMsQySl95bxbdSk8JagVxvVjG6HyCycAqEZPMAEqcwlgt7MNNFW6HtpKrCUBvDVm1KzZkoltDl+Ssf/IvchMzsifzrjjB/Dd/fkoafXRTHkwmIyy3xgGqZQNdqw6VuMFKyVgIZ/voWo9O8IJYIXE4mSLGIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422536; c=relaxed/simple;
	bh=pxXpE/fZNq6yLvc52y7PdDeNl9o9v335j69UIWK1LFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r40hl5k0/iDT8quezZ5giHuQhtVOdYQjc6DdlGEpW1gN+cS4sDEoIHSbzh95Oh2tDYYeg6RhPM5+7mhxq/c2jEZNvK4tf45UGwE/7YER2s1fZHWDqXP6p698A+uBYaGBf1mfKkoEftdnlmxDU5vARgdRkkHXXAzmlsGpggusdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rh88UX7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rh88UX7x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GArhpg024323
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=; b=Rh88UX7xz+3klM2w
	aTUXEORusMkVUL3WJQOOb3b2/WiVDz6HndDxyIzoyosIg9PJK2r6iH6H1BqCuadA
	1Fji2zptDczbA7437/kxynI4nB1ijYe1Y0XIebjYan5Wo/1/DUxCH1Fo62nLqG/R
	SsCBNDwHi6SUYkT1wMbs1R1k5/HwnVAe26DEVa18hh9heI513OIPktfYscrgIfyB
	8MzssdGq+f/9mo81ZGjp49Av5NU8nVLmEs62umkqCfoMDdgHvLejec4yRZA+cgS6
	AHOdZpAiFm5hKMlgNRsY3F5O1NcUfwsCHSoGon0To+vBlTZj9eAURzpV0sWg/n89
	yG2ZRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn355g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:08:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e7f19c8cfso1451442a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422533; x=1748027333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=;
        b=uJ2GGk1WPzqNSTCBsGgTjIyEXCjh+Y3ByXsGP/FCcXWwoywQE1LZE5ZKgAjIjNM4NM
         Ax4Kpbc56Or9p92iZiEBsUxreLpkNyKdi7la2jA5duQr8uJCMjHyT9mmJ/FGyz/JUYVT
         IAP1hMgF+D1yEoCvUsmndEg7BY6Lr7EnpOFUTaqr6qcA1xcyB/d4VVRp0OlEjrrf9SNt
         DFrzu4mxZS1XlkAuqjhFlZ6BYQgcNFbwDfkIOSaQpJqhe2TbxiGrv99XhbGZKlhSVJIy
         vxnzpC7/RByV3Pe7Oz3MnjunJZczTHRQHHIT1rIY2ezoST/l4s+WKxYXdly31QcEVVRP
         CSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQsml0BwDsi2PCKTBFdeTbiMfJZSACN0Q8RxFWMS0+lUbTdi75efT4dUK0RJ5ik9tuhhkG1L26xfYHxwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzBlHmrWLZz3GPkkuXOnHaV6Yia+V5HmlmQnl3G/aDZgAo34n
	DqRYu1wU/YhL4NhDLIsFMaiqdL9tRAx9y8EpOJ8BGGBOKwlE0/LBinjXu7TagpSq51Bo3DxRrYa
	ovDjsdV1yo/S14ZnkC48fL4vECBjAoUBRLvCCiQIAh3mOYoXIBPiKYH8soQOBQI3VdYo=
X-Gm-Gg: ASbGncvjYgw11F9eWciYVQrksCpXUQDjHVOadasnsyYUfQtxoCfinIon+WY69Cr4AW5
	oRIser5eo/22IDgs/khiOmpyXlymhIYIB59ZS8TtIL2DtMr07dQM6sIlb4K598cOqQlzGc5ywMt
	tDQvkCFGKe7Lq3mXmVsNUFFjhs3Nh/JDiT10xaxaKGVjAE0Lop1WQjveXEL28X/CD2/vt4QhVWR
	qcFgqc83bi1i/I/7tuIQNi8Y0Gs0zCO/EJsQ//EXMo0Y4eNBKYRSwHmu5xTk3RijgTC+Qu3B8Fc
	dS1lVuZksFN/bkKq4Cvlx6DYH+tpSbJHgv55VwK/9uJzXysNGWFFfpK178Dtyw==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537227a91.6.1747422533664;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCoMdR7R7xPNjV/d+MGNlVvf+FoMIYIPH77AH2OP/4hldS1ZVPlxtnh5tCoi/7JYkYDA0OQ==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537202a91.6.1747422533311;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334fb87dsm5537527a91.47.2025.05.16.12.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:08:52 -0700 (PDT)
Message-ID: <7fa413b1-99ee-4f60-b458-cce2a2bca388@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:08:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>,
        "Dr. David Alan Gilbert"
 <linux@treblig.org>,
        Troy Hanson <quic_thanson@quicinc.com>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pTVfDly1_MmvPYf06rLXEcxJ8GhMoeMq
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68278d46 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=uZSOL5_7EVOPlFl7amgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: pTVfDly1_MmvPYf06rLXEcxJ8GhMoeMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4NyBTYWx0ZWRfXzex3RMwOniMw
 vJ6XgAqWRpnO416qFWJLFQtv17nd0ephIa6wKCEP7ku4m7jom2TS0Fd6Kfuz7z/IV5DFy9WkfBU
 +F1FBFESFJT1fI1u2KPP/jCxSq/Cr3kOZKJcaz5R/dGQabOPvH3hzglhbqNftbuTUO8ksUag2d7
 HilK6e2C7I3NF1E6oUQTI7tWK4VbXovUGKy810PdKHWI4rr0KksrztEd+j2VbQhR5dqZ8Lu/P4h
 Q69lxAleziOM2aZbIfKq4YWB4aUFGRG56i3tdF8DAnIl5BwqHwoCkMFeDwvFxGPWcX2JROwuBIQ
 a0xM4Dtd1JwmfpV67snqvKjZb+LwckrST7FAV6ZTIYxNkOSUrsp18DxzfTKtrFwYQJtM93rah2i
 qLFQCqAW8nqZEdE/REgvfgU9nVcT8F8G8p1BYvCCGxD4Uf4q6atih75UekmMzfgEe2w5uH8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160187

On 5/16/2025 12:49 PM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> Optimize the rddm and fbc bhie allocations. The rddm is of constant
> size for a given hardware. While the fbc_image size depends on the
> firmware. If the firmware changes, we'll free and allocate new memory
> for it. This patch is motivated from the ath12k [1] and ath11k [2]
> patches. They don't free the memory and reuse the same memory if new
> size is same. The firmware caching hasn't been implemented for the
> drivers other than in the nouveau. (The changing of firmware isn't
> tested/supported for wireless drivers. But let's follow the example
> patches here.)
> 
> [1] https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2] https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

I think we are in a good spot now.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
