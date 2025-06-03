Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621422820AB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943685; cv=none; b=n5KnUjr8WlqSus74ZT5wVt8eVCw2pT+xAQ2sVHbqITay7zyqJPU7y+t+AEL2Iv78xqXoUrAo8/mDHWYECVp+pOZOdKcgfO+VVkp2C7PURPjDDI3/wiREgNcbuxem+kgJknyN8zbW92/8AqM3i0GL1jFF8XlXQq2INu1cSfrEhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943685; c=relaxed/simple;
	bh=a2U4FmurpsjLDQRzuqVxLuBHAisBaXSQsZ12Hk8wsqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2dp1vmKsoTaD5nkPF7qj92jokQMqJIvCtjvred3xSebW1+WGDVhGjNBsdMYv5IpbdBhSPwY/XdqUAAqjMBgxpgdtGeMsaL2yQTLfbknL/ngkjcfHTYKlrLMLYcOh/QeX8d+0MWSSdhb2PH1XEn5KkIZdm9zI/HbYvyf0JJG37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1swABAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1swABAK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JnED002000
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 09:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZgFxUUH1qzOZLDH/W0RuvDMG333L7//fcnO2XCla+8=; b=Q1swABAK/2ZNP0Q8
	/nuDkvmVfVLlVLWps8geL7fOvX/MENbAixSJPB7igYd22p4juByHEgeVwf5V99fA
	9oHqUNM6ACNrXQn5KRIHMgVYcL4QGhyqbUTQVc5OBgPOSy4XuN7BmmIovg7q8FGg
	t7IVMjSy51dEEbpXN1zmCB/yMH8zx4GEv9X8ypJ6dixIaueX7TmxVWZxr4iSrk1M
	OBpEG6TqM70dhEsKUgdFRO8HlhA/4l+CvndBiwBdQQbTrIFXf+gPPpBEWD5eX8sJ
	33ixZOBR6uF+vVOLxXCO/JSA1RZEIDX7QDnpMDt3ba6EmCvJoKr8IL4agllJsoMs
	gsYKFA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta41e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:41:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73bfc657aefso3914820b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748943679; x=1749548479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZgFxUUH1qzOZLDH/W0RuvDMG333L7//fcnO2XCla+8=;
        b=kEU2edKX4Ede96hPhnKu/WJCQDNXaKr9SDuZuLehkD6+Uz18Wk0svtbIFmrKT1K7PX
         +yZuvRd94Pzdnw3L4+t2x22XsISDp+lHHTDR9i2MRcerLMbMPFqGfGHXV7BeOfDQP20H
         r2wjj+hwBNSBnO9zp8WwkFoxdqbIRhB8T2y+Aw3KRe2Hl6cirCK8BcCzVKZMJiW3nScj
         v9RenpJWrxdn84EYilEV5W3faiOcNrMYfbLkRgDsHn7CWogNFWhoOfaiybszK9oNZFRM
         hoc+NCUCx7pIox6EDL5wrvVctCciFw56dxF9U0cgsaCmUGU37uHPGd5Ngw55kFCzW5Zb
         Atwg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQk3WVoLAQ8GmbU2k2/LTU55sr3WBoD//mlhKhRmtVQMRflCx0mJgdMPLMoGxkGUp85riWXE29b4S/GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFJJ/QRzr7NuVpnmoba1IXWjdp2GK/f5IA0QbjJKX1wnAKjPx
	Bt+8qU/sZKpyQ7pFwQikcbtM0nK5wmEIUYF7j5VSlNO17kPcIr1cYy92idLIl/96+U+fjH/6rFD
	pAW2YjKy+c8eXy72nFnsltHZbysK0AW70BwJ2W0D5rGLaScCKuWiyuUZx9q6jSLUz0maVhBUA5O
	w=
X-Gm-Gg: ASbGncvNKWEifbhurDFziqFYlnqclPjBppqysBDekMQzzxffa5WrQTAH2OH0NL4E/mO
	o5TOCWNdOKMCj2LXj65G8gDysw+qjetIz6Ws8rpDohbF2I3i3fBdfMtTBDgs3Dtf8mLrBL2Yxpg
	8gVDmzRwVXm56O7MbzCYqv2tk9y6dIWy1UkbD6Pe8HG9pm6vBgc6sKhdYHo6cwNnbKp0kG+fl70
	GjDwPtIyoNsyMR3uB3bcQLf2CsgDekOqhsSQfrLsllapipWk+XpLpflnqTa4HUBsGLUrAbNrWds
	+wLS46eoDqQO4WP2Fl5rYU/kTjk95mNjhp/dNj/Ileqdup/3cWAQ21hW2wWcfl4Y
X-Received: by 2002:a05:6a00:218c:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-747d1ab07b7mr16015857b3a.20.1748943679656;
        Tue, 03 Jun 2025 02:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtJm0q9o9BMa2e0j0DqdXOZ+URVaEthN/FLWSl6c+aw1P36W3g4vD7j6XelFjFJRDKdtp/MQ==
X-Received: by 2002:a05:6a00:218c:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-747d1ab07b7mr16015833b3a.20.1748943679234;
        Tue, 03 Jun 2025 02:41:19 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb3efesm6767985a12.68.2025.06.03.02.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:41:18 -0700 (PDT)
Message-ID: <81a19e4f-525b-17d6-86e1-774d3132e610@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 15:11:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: handle link select and
 inactivate
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MyBTYWx0ZWRfX0pVp4eqcKjB4
 Ep9xjx4+9sj8g+eOKK2WC2I43v0CeTUBH4o4Bs9fJfcssvD0nXjYokTNShAgVWN8LlnyWZ97xjC
 /ANKEUpQekpRXRqC0L/w3pcHg6SoKYcL2To0bzlcJipdQ9andl0T2bqY69xJN9g0aKb/thW5nf6
 syjWvzR3WNsNbPKuRaeStKrg7Zse4UDW4x/SDEx6vWcOTh5hj/z4gJrFf/WuPJ0qTKuOGfaYPQs
 WYBj4nOWiCrGpsIobsklGfPwyeQlkV/ltsM4jWP/QUDBiCSQuqrH2BlnOgVAAX4auGWZrvIfRTL
 2IDEurkXClpRjIuv6UMxRmYjNAx/EakFy6VUjYjOzQtFsSFQNhhIvifCHeBXJb946EQUbRiD55m
 WwCWWUKXxMtb+1aV43zQ2K2IXZE3rY+MKdHeldztlgebq6tiwKPI+LK6a2JUO7pm5jlvWz3/
X-Proofpoint-ORIG-GUID: 0VYfTH5CB9dWkEP7Z061Ie-BMrwtj75A
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683ec341 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rSFznLUdu7_CRTz4a9oA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0VYfTH5CB9dWkEP7Z061Ie-BMrwtj75A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030083



On 5/22/2025 2:24 PM, Baochen Qiang wrote:
> Currently host activate all useful links:
> 
> 	ieee80211_set_active_links(vif, ieee80211_vif_usable_links(vif))
> 
> this leads to 2 issues:
> 
> 1#: If 2 links are created/activated on the same device, and both channels
> used by them fall on the same hardware MAC, throughput would be lower
> compared with even one link due to MAC switching between them.
> 
> 2#: If there are more than 2 useful links, WCN7850 firmware crashes when
> host tries to bringup the 3rd link, because firmware supports at most 2
> links for a ML connection.
> 
> To address the first issue, host needs to send
> WMI_MLO_LINK_SET_ACTIVE_CMDID command to firmware such that firmware can
> deactivate one of the links. This is done in patches 4 and 5.
> 
> To address the second issue, host needs to make decision to select 2
> links out of the useful links to activate. This is done in patch 6.
> 
> The link select and inactivate are both based on the knowledge of hardware
> modes, which are advertised by firmware in WMI_SERVICE_READY_EXT_EVENTID
> and WMI_SERVICE_READY_EXT2_EVENTID events. Such preparation work is done
> in the first three patches.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> Baochen Qiang (6):
>        wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
>        wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
>        wifi: ath12k: update freq range for each hardware mode
>        wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
>        wifi: ath12k: update link active in case two links fall on the same MAC
>        wifi: ath12k: don't activate more links than firmware supports
> 
>   drivers/net/wireless/ath/ath12k/core.h |   6 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 364 +++++++++++++++-
>   drivers/net/wireless/ath/ath12k/mac.h  |   2 +
>   drivers/net/wireless/ath/ath12k/wmi.c  | 759 ++++++++++++++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/wmi.h  | 180 +++++++-
>   5 files changed, 1305 insertions(+), 6 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
