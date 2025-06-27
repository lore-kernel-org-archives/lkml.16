Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DFD2EB5DF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047365; cv=none; b=qbKa6m55U+e7yi+cQdes6JlBlYxDMPu9l9e+T5v0l/n9fs9hrEX0I0ZPOP/3I0dPHUEPRmAHkborsbPpH2VXR13ltWsyeEyunDq7o5r16o1dHxJuSHZ0HPRN9lCJfG5A5kgtM6JjSo/m/jPiar9NGQsYSoWmA9AWlTV7ILliKWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047365; c=relaxed/simple;
	bh=7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpIFzl7K+TJZ/OMcQfpvSm8YTfMKvM0jggQK+7M1M8HbJaRa0wPBTjdjeO6plYzcpInP3y6OJANm8zto7avxGC1Ed9JznxrKTqjIz+bndrRGg6L5Yks9B+X6qDgWJ9Gx48tsr8vz6/kC+Ocji8mS005Mgf6ScRSypMR11lIU8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3NEW2b0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3NEW2b0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCW5I014518
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=; b=g3NEW2b0bFIfBcyC
	mGcLZ0xUBLf4+Da1X7MTnb1+BsglquiOBXcG48LA4YA6Ba24qIhbGyencYdunnOi
	K7U5QQgmxAdoHBIiUgLulYL9llvhfB+bvh3OMSBcbCwIKFKXaZ32FU6TUGk1YBKk
	3+PH0VpOlw+gnBDBI3GhFnHZ5yOmkwY+3CXgcrrXoFUu1eimTaw2yorYCU3XJIqb
	mfDax1Giklbr/xjd2VWGYp5M0S/RExWybMKoAJPfYCVmVb4nmx2j7fksY5NU7JRg
	d/DT4r28f4D7wXCVcVgTbffWMuy9pKpJWUWD+S5Qb0DcK504eOoUmqqKBceONBKT
	tP+isA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn1enx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:02:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so208822a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751047362; x=1751652162;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=;
        b=W1gyiNy4ZA1Au8IXQWPENSFh1wgZ9/yIXbH1sNzOLEjJM2F42nTwDsYvw9hfKQrCNv
         17d3JXZ2eeJAVIoIpHN6E0NP2j/7PLMQZgtePvra4rwVcg7zxiZdutCyKelVU5Ro2Mpb
         dswmMryUs1IDKJhlbKCYeH0YXrufz5NqTPdap3ZbuBzAEG8ZDGKS+MAwCDFUdQgYKXY4
         6vKQBe52qnIb1MGlOQxU+nhn6u4NgIsMd/TXN3zwSq1AhfmmU/U/0vr2L3EhgeF+IV8G
         I/sto8QE+EpNuV7Q+qayV/GXCtIl8UBRUVqIOp4ef24dy3I6O+IZzRXWOslYiG+Oyftq
         w/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXNN6tFIikz0X2CM8UKb5sYYTRmeRimRxHbpSmsdr4fKuz2zaFGd60BvtBGsxPgC2B6zKGkKBgn3i3SjoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmYkMoUnY2hC+NYejCxYJM8K/kIjJSyUsnBZD88+irGfOp8V1
	VPLU1iN+ndW8TRp6Fk5U8CpmpzcHswqWddOIeKVciUYg+rxV9BhcTVSAfy/R1/m5QHy2BDna3Fx
	vn6vnFy5+Bln+Ce1Kt0AdvgU/hdWcrSq0FMotKgwriCv1iEve7xwolNx9wRkTEEpk9cBGNzM46o
	s=
X-Gm-Gg: ASbGncvkYZ64t+yQ5LSEu6Ga3Yuo8/Y02oBqydddCYnZCNWbhOQKFSzjY33DaITT40p
	otvHGUPhpk4fQMLCuoBJNbWJRR98Ue98YHKoM8/zW6u8SrZaYIYZxLLjDBSew+yOESnP5E8CmZw
	MsZ2Is4fl26tlCCI8YRMKJ8Ng4Kko0+pLDWNCKbmw1hAE0YrRIe7OScsmB9vDZ41funjaTv0HE9
	cnkFPRlTcO6G6jlcNw1KImGRFLQOesF+VcaA6oXbYJTYeWjbagSWVs0a1CcSRVry29+M5WAFlMt
	0B9KJd474a6Cmx+WwlVC2xkvrZBfV0qf8zKcTl109ymR9pWCfmclei5HC0hquUdggn5u5b98KvH
	RnVmqSeo9ddhH7yA=
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr6489708a91.2.1751047361900;
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4o+Zl6QsXsdfBN7hrGiRGlLA6WRZLfmh7CC7eb/MtvMgcOsqRL+ouKIiVZVN9U4e8XHCtuQ==
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr6489669a91.2.1751047361456;
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5427099sm7491870a91.29.2025.06.27.11.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
Message-ID: <9c4be921-930d-4be3-b231-f7a45908b774@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 11:02:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix timeout while waiting for
 regulatory update during interface creation
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
References: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6SYXjfDhFwD8wL82EPtlAt_UiWqT_kXT
X-Proofpoint-ORIG-GUID: 6SYXjfDhFwD8wL82EPtlAt_UiWqT_kXT
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685edcc3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Cu1Hzb5Yk4M5GyBUqqUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NiBTYWx0ZWRfX20OxZ7YJWczG
 lk5965u+uSWbMCHyTzgu1kwIoExHjLprKPWXWRm97qLPotidRvvu22i7V3u/VOYwvHz/yZa8A6t
 CzMoVkRXfYc5WiDiLwj4P0hC5VzZOG3gRfVVt2QXhbPGI3xQG0pVbZfByxY6Gsx0Ek+hHXtGTtD
 C4uF46QbaseP/1bpohx0h5Y45n1xDbnnxNUyTcz+LIaWeMufVVjfi6BG3AJM9DvfsklubFtpM90
 s/FkttOLS8oqGuLHtpWWOBc0YxCyRX4ruBBZwxO5L0d6KiAGyyPJTShGvElvXNa/ijz/VeAEo2f
 0JFPP7YZ1rSCvjvxXHG6AaN9dQdZuQOgJiK8IUKUNpPCmXItkHFO+8L+W2Zb4Lml/msP1WARE9v
 cufVV5BZTp4dc5wZZs1eBaOvqIw+ACSjFmCZ5zH6WJ0sMrnXC5AnPoVV/Q7MazOSfyahfrTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=737 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270146

FYI this should have been tagged for -next instead of -current since the patch
being fixed is only in -next

I'm in the process of picking this up now

/jeff
