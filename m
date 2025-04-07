Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8B219A75
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051522; cv=none; b=aErx+z8KHiBvM9Kj3yAAC/iZFESw/ET1Vzc0ohMlFDfXd6giNlZD+oTuv9hS3zDOvX4HhtOo7Wloros+Bs1LCFTGGu2o+mkn2glccNb0ceNTd9G1/k90X1OGh2iG3Yt4Fq63+dR+tBoDlyHjGyG0zGxKweO8XSO+3oQlvEMwiaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051522; c=relaxed/simple;
	bh=PgikKRs46m9TKHYsWtcHGXIrCkcscWlTAKZRcjtqc58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhITC7ukXgdWbiJMjOB0yG0zSACB+cefx8iskVlsz/tqgXR5pE7KPQBUqeIyQByKpMJQ0hkS5CmcNMX8SjPBPSy8B93EZVFGevqZPQDWd6t8DXUAuFVp5gZVHtA2bw2cRO/JpC89+pLhIzc124OPum52ZlN5ZBnkiIEtDjtvd5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKhKlcM+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKhKlcM+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dqlI013398
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 18:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaTgF4a/34uclFeoWrPsrCmEq+pEEC8fdHAghCe2wqE=; b=RKhKlcM+kETrjZEK
	ii/p/I2zsOR5eV4qkbUZayHag9cccq8DlQ/ss0XDIHXyPLFijVzbVwboYSRHn/bF
	/4Bhh6C2OG9jyIEvc53xmttfM8K28dpYWCS8tCmSgevphF5IlTKsCk996YV7Ef+R
	V+u90ApRTSnVZl5H1/XxkDiOCwo1iw3S0Ss5EDGtRuOCOQS8l02hi3HUOzgGM3JB
	dF/9SyViyYyzIdmZt2wodBhJTwbpDqW1fLdGK7YjfZLTXVHSJmbVIW9gKIzLDIU2
	B6qanyKB/lWWlOeRkXYuSAX5w82eImG3NTKhl84G248pmuRHmedw+mAo2kcMTC7y
	I/hHlQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1d4w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 18:45:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-afd3f1adff7so1512262a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744051518; x=1744656318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaTgF4a/34uclFeoWrPsrCmEq+pEEC8fdHAghCe2wqE=;
        b=AOehCELGlHALvIj2LGo1dZS/1UWjmD6wvDmd7cNttkxtmm9k15PjEAHRt3fWidbn45
         dr7tOjfLM+v/HghRl5QsWVMdCHZhYh6eHklmEvmBzXRbMBESgRUYpFo4SX5v21hkLnyp
         Wt4GJhcmCiJP4s4oN+gnwdQjJ69Vcjl8vh5Mcxu7xGLKhFk4/dz7tWkthlAjck6VI44C
         s8SH4uKaT14SkIMI/B+3geAcimqTSKcUAHDPPL3plVH4JihUP7bJhYpP/x10QvFZHhX5
         zPR+iZB5xVNtfAOeDZvNUmZV/njThdHr7+TgLeTW/umtVP3pytCWD6f7aiXDvrv7zg/V
         2YOg==
X-Forwarded-Encrypted: i=1; AJvYcCVS8wdUFupZ5vjuAUEff1bnm7W1CGaaOgrtFVtVtecNgVZJ4xpeQIX48nd3b/ooenh0nIZiMUcY078sglU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFb7AcRBPOzO63Y8koKJuCX4hG6imCeFnimOC2FBQXrfxWeZXr
	0LN4QVazOQkHRdtA39BOuGB2gFElduNj0oBU/iEac50+fBppKuqcnSsGLgVy0KVa3mOmdXqpVp4
	L2mIcfyDRieHxIq6KqB+9+em0CarIX/ZUk5HRDeHNWLq492QfEWooPUc/om+Va0E=
X-Gm-Gg: ASbGncufvEYc88X5dRlW3yLi9+vSou99j/pYUgBcEywhEQKCeylB2P0CnCq2h4XbEfg
	/rZz9uvO0LUOR9xuZqTK0G9Vx8j3ELCEDeodezz3LJH5JoWYoxFLya+HUm9Bng6y056MB16NkiX
	BJe+pPmslo1FqCc8e1JLbg3KF3DldbIlNDwsVE8ViP7MPITZjAK5QYwA68E89HO+H6f8X9W1b4s
	QFx5cN0X1s3okXy1Fy3rTp8MXPm6jVL3a4JzC4efgyGOBpFsJg8NuvOPfyq+JKyWwOVUGON7q0d
	3ADvTff30J4jQ2QB5ANURvXLuOlPo++ZxmV6Yx7/Y3gSm/IMJU0PHO/g3TM+OOczW/y6serrHr+
	i2FQA9Pob
X-Received: by 2002:a17:90b:6cf:b0:306:b593:455e with SMTP id 98e67ed59e1d1-306d0be3b60mr680201a91.1.1744051517638;
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH27ifd9SidaNf0mMnrpXJ3YfkJFEZ9H05V+CJJvNNT8LXGl1cdmrGIclx6qauZey72sUoYvQ==
X-Received: by 2002:a17:90b:6cf:b0:306:b593:455e with SMTP id 98e67ed59e1d1-306d0be3b60mr680176a91.1.1744051517273;
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb90bedsm9449695a91.43.2025.04.07.11.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 11:45:17 -0700 (PDT)
Message-ID: <620d7c53-e8eb-4816-a9c2-d4bcd44b5d96@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 11:45:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] wifi: ath12k: core.h: Avoid
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <Z8-Snz86Xfwdlyd7@kspp> <202504071138.98D5B6E@keescook>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <202504071138.98D5B6E@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T_xO6EFqn5ai6j4GWhYYS5R9D4vKZk-a
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f41d3f cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=uvMg_fejPkrpZwH_nmEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T_xO6EFqn5ai6j4GWhYYS5R9D4vKZk-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070129

On 4/7/2025 11:39 AM, Kees Cook wrote:
> On Tue, Mar 11, 2025 at 12:02:15PM +1030, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> Move the conflicting declaration to the end of the structure. Notice
>> that `struct ieee80211_chanctx_conf` is a flexible structure --a
>> structure that contains a flexible-array member.
>>
>> Fix 30 of the following warnings:
>>
>> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Hi, just checking in on this patch. Is some adjustment needed for this
> to land?
> 
> Thanks!

There is an alternate solution which should land in the next iteration of
linux-next (I just enabled the post-merge-window flow from ath-next)

https://lore.kernel.org/all/20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com/

/jeff
