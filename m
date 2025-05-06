Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908A280A5F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542557; cv=none; b=HuhO+43Wm13Ckckpagu5UKlsHiR8NlK1/WywdTX6m6nYiC6+rNGvnY2h2zRCHv2MA6tpkcWKQndSzt8zO1cmvVCG9cHTgmlQsFzdQgam86spF9XosuO/kx3UIFQgnqCWEC/YvedspPzQbP3Ct8arWeHLtwPkXQELCLCeqPv1haI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542557; c=relaxed/simple;
	bh=NVuxPtmNgFRLLO/QEEuCdsEnIPhYSYgqnwTKkSkHlB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8Z+3D0qD+/4hSDgBYkBSd6xwzavWPeIr3WdQTmBYWUjYzDCKOCHQLje69RSksZ91kSn/v9+lNXBaOgyHRVFzbOFSPJXn+QvwndFb+sAcRZQmx0o+dRaPTbkv8Oyx0F5YCx/fkfrWaD4AlAUkc1weAga/A1LBW9CMDK7Qjt+K2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm+aKk81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm+aKk81"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468njdp007590
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 14:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VjgACMnGXxy3UlT5YxgJrb2cSeHYPLeC1Xee4gzTH8=; b=jm+aKk81D9yzSpwd
	P+4aDZBe+cSFF1NF3Zx7gJM3FR6Cs9rjarzoTcGmjaRWYStMzUTYIoKnj2kmTZHs
	vV+R0te18Pw37vbGoYoHP2SmAN9WXe82s+aFqL8mc1y9phhTfl2hBXUMTBWvNxyl
	/aqwGbxEay0HI/BLPNYR5bB6YD0joIQV0FInFDwBaCBpolrEiWaSnqKqiRcVaigI
	xfi9WCxzltMntgZcZyWo6dYBroSVeKkEaWnBR5HLvK4wPc3MsPyREHBUIgm9i3Qs
	Cb3iD6WeBuAvPJpFbza3Svk5/+dHS0u/UtyS2rfMeTd0sPNf22hU9/kvbXob7pYD
	EzVgTw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg2jxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:42:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7395095a505so3958414b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542553; x=1747147353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VjgACMnGXxy3UlT5YxgJrb2cSeHYPLeC1Xee4gzTH8=;
        b=kjgrZB3CMZ7Bfd8pCckpUaS6TCm+Yz0kQtQL0SgZWsdMiPa5afXMiuM2XXRfi7AOKH
         zLvqqzwrDwkL9zesR4opd0F2XlR9uVvuWrOzkQF4x+aCOuIAUVQvvqjwENC7kjy5oQ2y
         kHvlMzfUu2frCMbWqj29e+WUuyLE+U0jfN7AwHR/BPUlOQB50GomajncnWLcTUEeozs0
         fRuWrjwp0xw4rO4HTCngeT7AI27NfxQ5F55phevdHOO1Kwg79UZUIHcdWE4USSRb7VAj
         2fi6omUsNMt4duspaBGZ8Mnrni/9GoJDo1i56cDuuvJx2pArHrRytulSwC8q9vUCnIcv
         a/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXtNL8avOOsknO6KfX7BQ7D4VWVZM+S4IGCMGkiK/BB6OniCa+Srqu9kMZQzNAmVKXP6RvHjbMChwLrOCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R+TuWs8TaeL3IY2Pu52vfvvFvwiMjvVCUGcS2C7lcQLkNjx6
	8bpSDiz6iG4n1UvWN4ICebA/Qb1rq6Nfcu0JGtXKwO7Nm8Z99xCjK7Yj3U/a7rT9lJRZyKLvyIM
	fQZ6m6C85nK5PqLEoFOdrI8YCaXc59G6I2whOYeqc5O1heEM+oJQwVWuTDu2sRtM=
X-Gm-Gg: ASbGncs3/tDQyBIVosJTo6cJ97nMHewnyUWL/7AEYqGW2dd8ql6v5N4sVDXKgk5v7hL
	YsaTAvkriXJeneLV2424ci/SBZlRmE/3hNcjjoXgjdC1jlkys9K3b3mC7gjmmXo+hEZX0y9Hya+
	knoJv++0HyuODjfKQeSIOK4itdS9NubBl0Rwk2B0YEqT481Fzere5Ll1v6b+zQETIKxa/OPryEL
	67rh0G7gCjhvlQ7BT/aX8R6U27QeWR/UTOqAifTMnyiBjlzdfFe8bqmb0msNd9yMy52Qlchjfgo
	J9RNa1+z2rsnTnS5Ii5rSWKE9IE4xdLf/8Zkyvv9JJajxDY36fZNQ0ml3StlLLm3vKs=
X-Received: by 2002:a05:6a00:2a07:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-74091a937b2mr4842335b3a.23.1746542553023;
        Tue, 06 May 2025 07:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENE7YHnc3ggGxLX9mbaGNGvNws07uOv9xUg5kw47zlhrUsZlSNkxEzxWCz8ioV3P51rTswQ==
X-Received: by 2002:a05:6a00:2a07:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-74091a937b2mr4842304b3a.23.1746542552655;
        Tue, 06 May 2025 07:42:32 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dedcc4sm8989298b3a.79.2025.05.06.07.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:42:32 -0700 (PDT)
Message-ID: <2b85ccce-70c5-44c2-b598-d148358843c8@oss.qualcomm.com>
Date: Tue, 6 May 2025 07:42:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250428080242.466901-1-usama.anjum@collabora.com>
 <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
 <3732e542-5b8c-4351-8e41-f9f0cdeb4643@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3732e542-5b8c-4351-8e41-f9f0cdeb4643@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: doBeIMO5iZSswjhdcvNAAipwWQb-qa21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0MSBTYWx0ZWRfX33gzyYXKX4Lq
 O0JslpV8UF7vPIds/5lP8OxKghSTVE+9pbZYaMUz3mvZQkQq+tZRXkLt9qaHD6Kj4V/5OATnsK0
 TPScT2SJQCcoQWJ8pVeqhm/97dx/Ki5UQbPM14NG1i97OxOwrehEA3opnjII0wjXe5y+eta2hNH
 ZOqKS9X4mzC6QckEQKijpA8w12Q5saTN1Qcel254TOCxHoKlr73U/M+nOlALeDvSnMiJKDO0HhY
 jGzV9f7pT5lxaQRvidSyP1uV5teXk11Unt0f8Bxl9FNENl2axyUZKGepcNvlwhkY8CFQSX2iRSp
 l7lU2mN/CruwgSJB1mKmjccxHbhmHj6wkADw6lxvQxrSN6dEK3VLijsasn4nyy/SRucOzRXYaYz
 BS0ROoRsweGgnhRG8N1XAb1lhsNZzv/ARHIwCgEz/AJeZx9sa5BYr1j/GYUVihnW/C82jPhN
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681a1fda cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=X3YIGVxls8OrOZudXCwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: doBeIMO5iZSswjhdcvNAAipwWQb-qa21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060141

On 5/5/2025 11:43 PM, Baochen Qiang wrote:
> 
> 
> On 5/6/2025 3:17 AM, Jeff Johnson wrote:
>> v2 feedback was not incorporated:
>> For starters, can we make the subject a bit more specific, i.e.
>> Fix MHI target memory reuse logic
>>
> 
> Ideally I prefer below subject
> 
> wifi: ath12k: Fix QMI target memory reuse logic

Done:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=ec570013de60b8b0bfa3cafd516ba323e6e29a8d

