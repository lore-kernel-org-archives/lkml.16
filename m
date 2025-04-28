Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAD327A90F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856859; cv=none; b=PqLfa0uAw/neTffa1gKgaeQzdZIGGyQ+9w+K8OSquUXoMAMgEWVLDP/K3ytSBF+FFP9FeIIYJMIsG5PDrV7OOYYl1ngmriOluStM4iYSb7dFibTj9TdsClCn9xL7U9x415/d9S4grJkcYx0Ae7NUMqRzQsVMsi8XvO2Fkw8Dq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856859; c=relaxed/simple;
	bh=jhY+hYNQ2r4ndw5PRb4PGVzEEi2I+rrNHKXGy2747b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3CT+3ltq+Hu0R6n6rhw0cp4Bec4Z2DZ5y47VZgXCQtO4tdBpsKoX053In1IqofHZKLI23a6ouhSBeo2PSFJSX4ApRkhaSTMITLcu3oPr3eVClhxuqrE5djMFd/R8YZo6jOBiDgOCRnGWRh2u0ZgvIAH4kDrF6nvpBbQQ33aAEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0JsYmGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0JsYmGD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9k1qK022474
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/V8Sk0jnYoMxTmrMu46NMhWrQw7hVUH5YLpHYQVbNKY=; b=l0JsYmGDncuP3wk9
	1mK1rJ/dDXV2C3LLhPfdUGHRo4Cssmf0vUefYPBQ91iyPcfz9oYa2Dt8i23Owwqp
	qBDKNJaC7GkHQM8aATOHGRO663CeFCv0sE2C4u+ir9Wp4Dppljo5hvNKPBzmMvS6
	HSRXg4rTgWrUfy1WgxMCxp22EXvfIjmQkDFMhuc/B8ZWaTP9jxwFAl0HXhP96/cd
	WMUmm2m/tEpFSQKp8eOD433RKZjafK9zF42eDQf343kRrysE+1whMNgr1dSOk2MY
	fcUJMTrAsmyTJANgWB6h6rUEep04NcHtZHXBXROF68iuCdfRAcTG77zijopmlz0U
	3u+2WQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn0my6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:14:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227a8cdd272so41690895ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856856; x=1746461656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/V8Sk0jnYoMxTmrMu46NMhWrQw7hVUH5YLpHYQVbNKY=;
        b=j2nJS9aXVoL3p+df3Yf4rq8jMmgg3E/Kq6FBCs3jfA0SOthSQA8lNpGVB22m5Yk6qy
         c/WatyuKAkrj5FJelM3syWn57yJU4Zn1kxhZNFW/qL9a1mj9E+6V2HbaUfb8SGHXNeiN
         WJWB52uZChvlBZeuryLQTIx6WWwFGpIqiT1StoexNbqIU73VD9pjB/D56WcHbFEdPjfL
         rbCCa2TJCKZlXEqG3sX8dDxQZ9oIpEv3gYcPYnkgS5+2K6VTMa3B992u+3CrAsVm5KuV
         fu+qGXua2JOvXLsSQNfKwzVnHwv8ouHaIK4wqcd84bJBXXBJVqqB8wz+UoFF3zcyS+D2
         R5QA==
X-Forwarded-Encrypted: i=1; AJvYcCXrkf1CwJsRM0MjeAwT92/IiamGJRv8QyAfkYfWIUaInKQj9245Hc/R3leExBmUogSWMdbp4L1vKd+i2pY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uzEeht7bj8+NTiNRuqpvhLbXx/08jJ8HLjlBPe2iTbOF3gt4
	ApDZR7Z8hA+RNzHdkHnsXFjmnFTrSlwvWnd/SPRu5pNuQ0ZMm+DUvqO2wvd4WNZCHtECbWS6zAT
	jWKviAIEpyuJJnMYGp79yOvI3erLkWt5CdzuiQ7FHw3iPJ8PF9BpuzazHV9bRs90vmcxsDpo=
X-Gm-Gg: ASbGncuDrNfi+VyoqIJ4Bs81Pr1axw03IaBfRPfu1uO8zyv3jHoawxEPzLVk1d2yaLS
	M3sDn1RCyMv9LC/vkWO6NutLnOPI4rHMniT1UI2uGTfB4M0wMmIIlP0GthQjJ847Qe5zJGYE+Rk
	Zb9V9iWAP8Gb/i4XWVY6941WXrPWP1o+32A3on1x/2uNy2TZohGx/pV+FWS8pei9rBfPj2BsxCE
	6ASRke2jBz1M14Cj073dJL3iAPYeZ7gIrpM8JA1rbIs47lySeGe4UfLWDBLEe8lNn06SQBjcXYm
	p5Ezwat47GFbEwH2WrpDPhBB88+gGnevmDugGJ9nA0getw1AmDO/DNPUTMfT
X-Received: by 2002:a17:903:3c48:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22dc69f3b04mr143095815ad.9.1745856855814;
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHppuR8dvYljPTYcRZKu4BHzVYSZldfYQM9vAmQpN3t2WmX+8VasqrxjptsnxhSm3w0u+/LRw==
X-Received: by 2002:a17:903:3c48:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22dc69f3b04mr143095445ad.9.1745856855396;
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.192.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50ea421sm84982105ad.109.2025.04.28.09.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:14:15 -0700 (PDT)
Message-ID: <1692f2f8-c77e-87ce-db70-00b4d9fc7c95@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 21:44:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 00/15] wifi: ath12k: add support for 6 GHz
 station for various modes : LPI, SP and VLP
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4c2zxTykIR-8zr0QGKeXjWKkYs7mtOF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzMiBTYWx0ZWRfX3u9VIJm3vvo3 0rcxoW+K7ZR8bqK/EpfRqYLwwYODfFRqc7OQGqpOhwEbFc7q6PvT/a2aaGppZEV4gvLkwL+1khO z4KIP0F/2Lw368HoGGejavTyRPRgbBQvfK+nLU4em1a+4KhmKYqCHDwa1A+VkBX9wzKW3yJHkUJ
 ZvOZK+IukBT/019+vm153dAHTlJN9ZzVvH0HdKEkn2Qtip6M5kOrvLteyoQ/GgmOTb7QLZf/0pE G7fW1FVpFJYhrc4NATvlEC7O7K2G/UGG77fq6lAQDvRjtAavyNAfhclloNNdF5RkAWJyR46qC16 VWOpr7L4DULptfJX2sq75YhOhbzo12iOhLD41A/aEoFpqmov1SjYVNFX23OY8pSlGG0EYsNzAH2
 lyEsOKYQe3RYBlicX5Z8pP0BxJk9Bfyj4owj+omxUbR6+IWEmHyf8P8/TdUzDmnWtyfTo1LJ
X-Proofpoint-GUID: 4c2zxTykIR-8zr0QGKeXjWKkYs7mtOF9
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680fa958 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=XJI/iaC0GbrNbCf3OOiYRw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rSFznLUdu7_CRTz4a9oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280132



On 4/18/2025 8:25 AM, Baochen Qiang wrote:
> Currently for 6 GHz reg rules from WMI_REG_CHAN_LIST_CC_EXT_EVENTID event,
> host chooses low power indoor type rule regardless of interface type or AP's
> power type, which is not correct. This series change to choose proper rule
> based on interface type and AP's power type.
> 
> When connecting to a 6 GHz AP, currently host sends power settings to firmware
> over WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G commands.
> Actually there is a new command WMI_VDEV_SET_TPC_POWER_CMDID with which host
> can send more detailed parameter than with those two. So add support for this
> interface.
> 
> Before above changes, some fix and refactor are done to do some preparation
> for following patches.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> Baochen Qiang (15):
>        wifi: ath12k: fix a possible dead lock caused by ab->base_lock
>        wifi: ath12k: refactor ath12k_reg_chan_list_event()
>        wifi: ath12k: refactor ath12k_reg_build_regd()
>        wifi: ath12k: add support to select 6 GHz regulatory type
>        wifi: ath12k: move reg info handling outside
>        wifi: ath12k: store reg info for later use
>        wifi: ath12k: determine interface mode in _op_add_interface()
>        wifi: ath12k: update regulatory rules when interface added
>        wifi: ath12k: update regulatory rules when connection established
>        wifi: ath12k: save power spectral density(PSD) of regulatory rule
>        wifi: ath12k: add parse of transmit power envelope element
>        wifi: ath12k: save max transmit power in vdev start response event from firmware
>        wifi: ath12k: fill parameters for vdev set TPC power WMI command
>        wifi: ath12k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
>        wifi: ath12k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz
> 
>   drivers/net/wireless/ath/ath12k/core.h |   6 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 527 ++++++++++++++++++++++++++++++---
>   drivers/net/wireless/ath/ath12k/mac.h  |  43 +++
>   drivers/net/wireless/ath/ath12k/reg.c  | 209 +++++++++++--
>   drivers/net/wireless/ath/ath12k/reg.h  |  18 +-
>   drivers/net/wireless/ath/ath12k/wmi.c  | 198 +++++++------
>   drivers/net/wireless/ath/ath12k/wmi.h  |  62 ++++
>   7 files changed, 905 insertions(+), 158 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
