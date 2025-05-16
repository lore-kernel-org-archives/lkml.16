Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B691C84BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407560; cv=none; b=a82e3tylpICSh52cWzvNO2r59ZbXCwDNc0fJt/2IVy+8lk2188MZX/QcL3M8IVT82Ik2suBQSGfhwrWYjMryqOl4zI30tr/Ad7EQiQvYXcMAx04KCmYdMQ54WnnLYPrLaPPcqQ6UWOicxLzlMNo71KZBweTq+roWDO+H0Yc+E04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407560; c=relaxed/simple;
	bh=cXNyu6wGlniSomvsFvAqW5/72I3yBkBq5fuIF92Y3cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hD9AZCEM6lQ0BE798y9kt1dAtXj6rIpXeSGylPOO7iLQJFyd69UcwmS30BtIfjgBD0F0gYX5kSOYuye8IoXqsQ9uSJEEy6ue4NqgM0d9UiJxZG1sE/hyfhYrFDyEHrbT/wFSJeXggQs9MRZ9P7PSF9pSaZIqDhdokUEpMktYTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsMV7N3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsMV7N3M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC6EhJ007889
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=; b=HsMV7N3MCu1q1T5B
	bKezIwRscC1Nqfr/1En56HB5XBQ4yewcbBMUReoLYHSo+THMPx0Vkn92M9rUvFW9
	LUGgb694+Rr7LhG2Bb+D8V50MsjtpoWOk56mqu8vjvda9RbP06dsYEOPyxjAJHbl
	iemC4vM9SgP7Fg5C8EpGM8gZJWyh7Fbr1qKF2+6W+PgDU4Zo0cDplueiSTw8WQBo
	BEAzhGDyO0YI/N0AFFYInCS/p9W9B3Xo85JlfueNraQkgGkuTS50Ey0diHI3f6/O
	8Y/A6xQDcMjggGZ+Ugz1BjJa2Db8bj7iaZGkMbJnib+tcKSNyXofBPs2Vlxxweij
	kdthvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq28ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22eb21a2788so30879675ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407555; x=1748012355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90slheclqHTeFlUy8kLs7MTzw3fm6eIhnYeb+zUtODQ=;
        b=cCbVBZ39YyjT8693jqrdwDRHcduotOjNu+XPW7dd/wA1ZLh8D/lxDm7FlO20A2F7Ua
         4hxZLWahFY9hrMb9675hQ3133c571ELz/0kJ24izXQkMjzevaQ0oI+PDA10dWWdE1uSA
         /dRGz7VR7Xkc30qatcPewlk6tvIvO+tSyP99xYJmO8i2mVvcJS3bo3t4DqHDkZO15RP8
         UIb+0Rn8QR+222yr6kl5sEMx7j0FigPFmEswuNDcrTCAMuTnP3QWsHfTzjectYU14wNs
         1h2J+/vbb2LLwqs/5qY0kuWXZPVbANyZ5Apw0BWOBx82FdjuGxjIXQgRjm7CuUvqX5Yc
         hVsA==
X-Forwarded-Encrypted: i=1; AJvYcCUt4ayGhWCp2n76D6PqNmZVXCrJ9U6H+SduVRHqCNR3BoBdcD1TzOdkldEplvsmNFHULCY20OzEzVjFwRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSrhw0Q4DSTAfN1VhZoC2kVr7duzZj+2mUOSaw1xosOPqIhWP
	MxXUo1GNh5SuFTIkTF0GRzMod2IBSX8L2N8r8Bb5f58uIQA2ET2kZVkPyUfDTKkXCRKQXFUGQuO
	vJPoroYgUjVo3R8WZENjoFJuOUx7TbQzHi5s39IhdLZiCi8DA/BBzPBpAtYgpwxc9HEY=
X-Gm-Gg: ASbGncuw6Zzyi+0kZaS3gvOgeO/znB8gY1mayCCXb+wGO8mpYQwxzcDJemj+lYFGZfN
	WBFuhajktdrt7Wh4XNr95DO6WAFGK/nNLlWOdTKLozkqJeHHI8avQ/6DEYSlNzJYl7d84rcCabE
	dYOJN5xfy3f2W3bQnrJtSLz6n2XOSNXaRns/GX0ugpn69F2CGKEmBD1HW0Mszi73f0nj7bIcVM1
	93bQ4vLygc0SOwdEpDd80NrMp7h8qOXINhBJOb0CslNhaTeC2CxtaVzlzds9U86ExA+7HhSJqbZ
	B1p2r1W7g7BVtNNTMGSMawhH4SQbVZ42PCtc5XJU7YclkuIBKVb+KH1ia/6dXQ==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889465ad.27.1747407555416;
        Fri, 16 May 2025 07:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9QUuer/H2zXnlCjjwWpwBnKAXckxeSB/Cp2w6YMZtX7hgsrBVAG8oDxbzoZZTSRVT91y46w==
X-Received: by 2002:a17:902:cecf:b0:231:b407:db41 with SMTP id d9443c01a7336-231d43bf736mr44889065ad.27.1747407554961;
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm15328575ad.147.2025.05.16.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:59:14 -0700 (PDT)
Message-ID: <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
Date: Fri, 16 May 2025 08:59:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250514081447.279981-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: __Kg3l8EE9y7Nbq5zW60YVrtxlLwRYSI
X-Proofpoint-ORIG-GUID: __Kg3l8EE9y7Nbq5zW60YVrtxlLwRYSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0NSBTYWx0ZWRfX/3YNTpDcAs+d
 /p9rABXzRomANfMBylW0yvO6evX3ZArAUBOl0oOswGnxPXd6vVboc/JrBk8GaA4fnE30p9tHab/
 Qh70KyDieq7Su4RcxopOtMnIrlmI7qfuOtzqsc1WpE4bVUuBwe3+zr2VLWyM2p0WrMqTky/e8LF
 T8DXDYyVDboPXpL2M+/bhj02dHKWJTTYkbYPNhXQoJ+tolTXKcMAmzf+ujSyWL/qPQKs5Wx/NaR
 1QpkkoxnLF2ZJ+a8hpXe1WLt+B3KTTrddITzMAvRNU+NrQ1hXQx0u1fcBDZaRS1W2QIeme6OMqb
 0T7mJ6aWETNhpEIiS0ZhOM1p9oY6JdlTO+7uoMqlNhNsF11XDL8tGywjnfSeE1KlOfszweWJ8/n
 EJizDTKlLf9664m0Lsq6sbBuZNZtaryY8aj7QAFEfPsXvoPkyqyTtFtuYzDAAGiOp9HPsfxk
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682752c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=rJ0JV_LFfDDBQ4JBDEYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160145

On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
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
> There are two allocations of bhie; rddm and fbc. Optimize both of those

There are 3, but you touch 2.  I just commented on this in v4.  Only 
touching two is fine (the device for the 3rd one doesn't need this), but 
the documentation must be accurate.

> allocations. The rddm is of constant size for a given hardware. While
> the fbc_image size depends on the firmware. If the firmware changes,
> we'll free and allocate new memory for it. This patch is moticated from

moticated?  Motivated maybe?

> the ath12k [1] and ath11k [2] patches. They don't free the memory and
> reuse the same memory if new size is same. The firmware caching hasn't
> been implemented for the drivers other than the nouveau. (The changing
> of firmware isn't tested/supported for wireless drivers. But let's
> follow the example patches here.)
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
> ---
> Changes since v1:
> - Don't free bhie tables during suspend/hibernation only
> - Handle fbc_image changed size correctly
> - Remove fbc_image getting set to NULL in *free_bhie_table()
> 
> Changes since v2:
> - Remove the new mhi_partial_unprepare_after_power_down() and instead
>    update mhi_power_down_keep_dev() to use
>    mhi_power_down_unprepare_keep_dev() as suggested by Mani
> - Update all users of this API such as ath12k (previously only ath11k
>    was updated)
> - Define prev_fw_sz in docs
> - Do better alignment of comments
> 
> Changes since v3:
> - Fix state machine of ath12k by setting ATH12K_MHI_DEINIT with
>    ATH12K_MHI_POWER_OFF_KEEP_DEV state (Thanks Sebastian for testing and
>    finding the problem)
> - Use static with mhi_power_down_unprepare_keep_dev()
> - Remove crash log as it was showing that kworker wasn't able to
>    allocate memory.
> 
> Changes since v4:
> - Update desctiption

While I'm commenting on spelling, "description"


Code looks ok to me. I think we just need to hash out some of the 
documentation and this will be good to go.
