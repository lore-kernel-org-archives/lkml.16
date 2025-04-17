Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1531C8628
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744865509; cv=none; b=LbO6TG4zZbR+xHkgoy2B0VRCVpSnYUoTLLnHfSU0WvoNJhg8g4D75joPSAIo1DkpyNWajuYCvu5YTgY2il0NqVUyp++yBHlTWThlx5JTfyVreTY3cF0OUG1W30wS/PPreC4h7yjuPcQ+nYS0HyUTNltbeLqQS2Q9m/0FzQLZOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744865509; c=relaxed/simple;
	bh=KI+f9pSFTK0Yz/V8XLw98FlEOoM0fadozSuXtVurV60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdjJp9IHDfuEsF1nHYYi9B2tJQaWi0LaQGTRZLq9uNpkqWk5Vlub6ZKhTb3IvwmuAX9OmdhsZLIfeURxPBb8fw8HeM/DPjFNYWixuUkYAu16UkbvNH8HDdOR/TAorLAoizngZLxy4o6a+BUBLkfQdM3oRuyImrvP1cnQSXOMhT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cP6AgNNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cP6AgNNQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLlCgS007012
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzMOv8SgZJGivEHxR/VptP0a3kYs6RFFGPNr8etd3KQ=; b=cP6AgNNQCcfmPS+X
	HRS2SKnTdkuSdsLheCS2PyMxR8gCNOAeoL1Zv52gQYeLDwZV53TFCKCmPw7pe2u9
	3w9Rw+lG4KP/xOPHvM39tzB2b8hoYWR/1ObGpwmkkQk/indNRvVVdLRhhJtLNUoD
	kiJJ1u+ITsSyOlo5DMs2H10YcPssrPoksX0a4sPe6cmI6w7auvZEglyPNaj20T0K
	e2TU/W5X2BM1y6r78BpBpHLROaxUY9kruPJwoaiWfe7oUtinah658ynICcm0fMgS
	2rlPXW15acVW1GRvHtWlUKmVbc4AXC/JhbqbIsb4jDZ8Wz0hpr1pMjVDLb8YWXue
	fFnA9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6nr24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:51:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394772635dso243479b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865506; x=1745470306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzMOv8SgZJGivEHxR/VptP0a3kYs6RFFGPNr8etd3KQ=;
        b=W8M5gj7b3bXg32c84OKhqXGMvf6mRKSEI1ffsbQ6PAKJwzvT9cy00+BGbF/QU5jTI1
         7JqYQlMpbSqw836L61nqx0unOJXRaqf/xFvdGMhk+aiL3guuckzHYFeEz0yDu7e99zCx
         CoiunNwcfwGS5d+Y2fN7T+Q1l8Ag4w58sSEo4lElEpI34tc2/9TtT1b1aDCCam7vwwFP
         IR6ZIupkFAJGU+SMlHZBnK/HqHyQBskLpTjjYk3VAZdJL3t7KkfpnzI39VGqtuoXoOL7
         LlgN3aSfg4Ckr6BaRqD7nE6on0u7XZTZhT6nzOlI514aJCWSJos6H/GSsbt+W4myjuwR
         3CmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq/qGgiW3WCrdfNiF8Fi7389/wUUrusOEN+qjVYvtrClUUFZurPqPSo3Pkf+6dd4CTRCZqgRzdqRsfvZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcz8rWNQPUDBHINJeUMj1teBBZqbDMaeOqJM+blzR/PiKzX56s
	HnBEqYRYLRCcR5R+eZHwX8jh3bJlU1NbaZOOX8uOFuyPw7A9syuPj1xzkp0FXi/yCoQviCKxSmI
	/uvppbeiVYlb96147Hxi88l16DmvMM+KOXMLAhY8ER+gfyqrv8Syjq75F4q+JGxE=
X-Gm-Gg: ASbGncucsGahGTH+Nv6x8wIqCJ2AZ6dx+XqNZBIPSEsBWCzMWPk6nZ9c+feOl6b0NLN
	uRl6TfXrAPkrX1cU4gKy4waxzVnam2ixo3lHIEn65rZcrU8Ey4YoTvbNuviMe2932qA4G84uKqq
	O7/uaUN9gTKbvYfbeEHgE2lxpwhp4dl3MARgor6WOnH3wpov9+uZiyjiE3IbfCG0YD4Sly7e9P+
	498U7gfCwNT2LnzVF6O5XWrx/3n6aRxrK9GfDOVEFSunx7q3uW1C162vIfIDHmXy1Rzzw21EtoW
	ehdIL4fSIubeGoITMm3XzEKcjtMgzwy/2C9TOSkKtseP8fWhhBo=
X-Received: by 2002:a05:6a20:9f0a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203b3ffb6fbmr7460315637.36.1744865506548;
        Wed, 16 Apr 2025 21:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcbo3BNjW3fX+SUNT/uTY1drXWRRK4WxThKide/oG1hNfmAP9eKfrm59NgdcaOP4ll1j55XQ==
X-Received: by 2002:a05:6a20:9f0a:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203b3ffb6fbmr7460280637.36.1744865506163;
        Wed, 16 Apr 2025 21:51:46 -0700 (PDT)
Received: from [10.152.194.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230de24sm11642290b3a.136.2025.04.16.21.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:51:45 -0700 (PDT)
Message-ID: <0f52f9ab-1696-42a1-b673-96c60f757361@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:21:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid deadlock during
 regulatory update in ath12k_regd_update()
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pgJQQucU_RNDHqYX3XWviVfMpLu_XJKd
X-Proofpoint-GUID: pgJQQucU_RNDHqYX3XWviVfMpLu_XJKd
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=680088e3 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9Z3WbG_t_BtRUmuvTSMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036

On 4/8/2025 11:09 AM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Running this test in a loop it is easy to reproduce an rtnl deadlock:
> 
> iw reg set FI
> ifconfig wlan0 down
> 
> What happens is that thread A (workqueue) tries to update the regulatory:
> 
>      try to acquire the rtnl_lock of ar->regd_update_work
> 
>      rtnl_lock
>      ath12k_regd_update [ath12k]
>      ath12k_regd_update_work [ath12k]
>      process_one_work
>      worker_thread
>      kthread
>      ret_from_fork
> 
> And thread B (ifconfig) tries to stop the interface:
> 
>      try to cancel_work_sync(&ar->regd_update_work) in ath12k_mac_op_stop().
>      ifconfig  3109 [003]  2414.232506: probe:
> 
>      ath12k_mac_op_stop [ath12k]
>      drv_stop [mac80211]
>      ieee80211_do_stop [mac80211]
>      ieee80211_stop [mac80211]
> 
> The sequence of deadlock is:
> 
> 1. Thread B calls rtnl_lock().
> 
> 2. Thread A starts to run and calls rtnl_lock() from within
>     ath12k_regd_update_work(), then enters wait state because the lock is
>     owned by thread B.
> 
> 3. Thread B tries to call cancel_work_sync(&ar->regd_update_work), but
>     thread A is in ath12k_regd_update_work() waiting for rtnl_lock(). So
>     cancel_work_sync() forever waits for ath12k_regd_update_work() to
>     finish and we have a deadlock.
> 
> Change to use regulatory_set_wiphy_regd(), which is the asynchronous
> version of regulatory_set_wiphy_regd_sync(). This way rtnl & wiphy locks
> are not required so can be removed, and in the end the deadlock issue can
> be avoided.
> 
> But a side effect introduced by the asynchronous regd update is that,
> some essential information used in ath12k_reg_update_chan_list(), which
> would be called later in ath12k_regd_update(), might has not been updated
> by cfg80211, as a result wrong channel parameters sent to firmware.
> 
> To handle this side effect, move ath12k_reg_update_chan_list() to
> ath12k_reg_notifier(), and advertise WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER
> to cfg80211. This works because, in the process of the asynchronous regd
> update, after the new regd is processed, cfg80211 will notify ath12k by
> calling ath12k_reg_notifier(). Since all essential information is updated
> at that time, we are good to do channel list update.
> 
> Please note ath12k_reg_notifier() could also be called due to other
> reasons, like core/beacon/user hints etc. For them we are not allowed to
> call ath12k_reg_update_chan_list() because regd has not been updated.
> This is done by verifying  the initiator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya
