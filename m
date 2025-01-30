Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4E1B0F29
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229181; cv=none; b=IAj28uE1lX61FS80pJ63vdMrq1pkXKpWmcoIbgFfCRPxw3/BHyWAdGMwXTEmXQ7QgzKH00hMJt8MjdC/So2qNWG89BeLVRIeIYOO9fI6yhxV1VpqzP2JZgo/JhA0yR8KpDSJlfpC9xhXSK/V8UnnHm7M7ihAd8V1mwUvpvCF0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229181; c=relaxed/simple;
	bh=6494x1NsziKlFATjP5K/hvSwS6QGIDEkExL6srt021Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdGwX5cydJ9KyA3ijGjJWfMewbBRR+QMIoHQ5uvIG4gfG3tJKsaPN/PE1/xK7B8p6L2xfdjj1wl0j6YNKk9QDLcXBfWsgMs4tImmpxBQXjwdIXAFEiWCJRY4AHLnBtvgws6QBx1Baka+CVXkGfVyLGoC2lFI//LDptTkEnz1I1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWL6G0zm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWL6G0zm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9J89Z028252
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eePmyQ6AyToHFq5ZzRudtzKbdM2PRLlCrpc5DW2Ub5I=; b=lWL6G0zmDNerUlaW
	G/LIYKhkLnZ62yp0XY3nKsGLGHSdlLmALA3PoTpdT8tfHIEmKPsF+6E8agbqc8nn
	gEtu8qd/LSnCp8aufeBP3daYAQP23LV3ChqU09j76d/iNJyJyjOKtPcQ670cSWC5
	bXoUUZEScDIre1Yk6YACkVNscpFq9sXEE+TCBCo0yST0kg5MhbZs5qApwsmntcC8
	y8L8xD7zMBsSzYPIBkQrpcJ08Lk/JA6nLYwcCOBMV1RvgMhCFBvtr62tAteHv7zt
	J8LvrghgMlFbrIG5j6kcw3iLbXInAfpXRLUn5g10efHA7JcL5I1NaMm49dNIeQ5A
	K64p5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6pa00gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:26:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679becb47eso15303721cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229172; x=1738833972;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eePmyQ6AyToHFq5ZzRudtzKbdM2PRLlCrpc5DW2Ub5I=;
        b=TXf+EX2QHH1X4cnPBbYn2cROPtTzfT2V3DNKg1pJoIf7VnxiUNwnZRR2KAX/XRKflQ
         hhp8O4UXEmWAIO3K/n4am3C5jEzI5U5BVCf+mGC5+J8urL4ICwIVI9bC7uJgpYAXie5A
         A9xvKJD+srLT6eCvsQTcTWbcagmHzxVDQA8K/69/wqC5oebx63xsM/GXkCrhgZx1uYd0
         Iibf0bF2ffg813v4gp3N4lSp9++i4Qwfb7OfHxwvzCrobEFcPl+IfqmGl7BsMgBJx9vA
         HO4TtHHjcjci/Se7f7hBASJeD1RhIZfwP+P4mwF8Y1eZ4OIpTWu+lrCIdp3l0zU2tXsx
         8usg==
X-Forwarded-Encrypted: i=1; AJvYcCXwwedce7Tn82ZseCEc7hwpTdj/lHVSE5NOgkSZ+NKZKaSxcALbrS61/tgxHrPdDLXD+w/bvCdYL4fEZ4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3n9aNOcZdkkhx8unwLh2XGV1lF9/8WPAXhMKJ4tIk6Xosv9sC
	rWA1n7yV8G7oVIDq40VD/x2U6eriB42LU0tN0iCTcTNE3Bzx5VOPfVABqGIfu7SVFyWYRVXfNAh
	TVV05c7vlUS7LdTgCCckzz984UTAsXCG8Jy7dt0iIdkDspJvDRFsIk5cuDngh7mM=
X-Gm-Gg: ASbGncuLWSNGZmgwXSUCkSp2AiGGHywS5Fh3TYY64e9LudS/prcJzYp3a0rOq+BKOS4
	71nivaD3D80oK/V/SJdcBF1lJqDdQnsjwwfL12ZD/1bfnE/axhIc3a9APGVdmYgW0ZO0lY60/2u
	5vpkdAH+uAjS3Vh99VsGdAj4Nmq3d+xga9rFbsXcmHEn3V+Euq0tOrKoRX2Ll2KX7kvVNUJaa8y
	rN4XiKmYcGYbYQpqvO2fuqTnTY6I+u3H5M5Jq7rKfmBu9d841XDkRTmLCJ5hEHYI2QUT7JDY9CC
	2vGrBgEsa+roVUhjgUXIpdh1gXg51pinkF0nHzY=
X-Received: by 2002:a17:902:f60f:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21dd7c44516mr103038875ad.5.1738228703440;
        Thu, 30 Jan 2025 01:18:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRttBzfpMMi7+IvNp9nzNnKCJLwBTy4+pzP5Bx50uGqeX9D+oTbLTRBPYM8mM5/vF6FVybGw==
X-Received: by 2002:a17:902:f60f:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-21dd7c44516mr103038655ad.5.1738228703061;
        Thu, 30 Jan 2025 01:18:23 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f8004sm9620975ad.74.2025.01.30.01.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:18:22 -0800 (PST)
Message-ID: <94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 14:48:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Remi Pommarel <repk@triplefau.lt>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
 <Z5s9CO_mmazq2Kg1@pilgrim>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z5s9CO_mmazq2Kg1@pilgrim>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XWmuSsLRMj7-747N_uM9zlb92yWD8kZ6
X-Proofpoint-ORIG-GUID: XWmuSsLRMj7-747N_uM9zlb92yWD8kZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=735 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300073

On 1/30/25 14:19, Remi Pommarel wrote:
> On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
>> On 1/29/25 22:25, Remi Pommarel wrote:
>>> Currently in ath12k_mac_op_sta_statistics() there is the following
>>> logic:
>>>
>>>       if (!arsta->txrate.legacy && !arsta->txrate.nss)
>>>           return;
>>>
>>> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
>>> if it return for empty legacy and nss of arsta->txrate, then the other
>>> stats after it will not be set.
>>>
>>> To address this issue remove the return and instead invert the logic to set
>>> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
>>>
>>> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
>>> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
>>> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
>>> mac_op_sta_statistics").
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> MISSING_BLANK_LINE
>> 'Tested-on:' tag missing blank line after it.
>>
>> You missed v1 comment? :)
> 
> Yes sorry I think your mail never reached me, did you CC me ? Do you
> need a respin ?
> 

No problem. No need of respin just because of this. I think Jeff can fix 
in pending?

It's strange that the v1 reply appears to be delivered from my mail box 
and it is sent to the list. I see even Jeff replying to that. But none 
of those are captured in patchwork. Not sure.

Anyways, v1 comment was regarding this blank line and one suggestion 
that in future submissions, please use base commit tag.

-- 
Aditya
