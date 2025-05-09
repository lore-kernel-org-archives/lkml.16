Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51452289825
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797843; cv=none; b=iNv+S64bqz3wI39S5HCn62VXIY4QwP9wT3fCCluF5Ra2vHerBk1K36E27IAjI0j1I1nuKCojrcmFMlv/4Fx6QSgRgJPPaxwGc+Ns32OXQ460Eu9HvbKRj0mPmdfz/qZOVTn6gtkOXKGT8FeenZPw3i2bG8a/gAvGGJCCSHXQm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797843; c=relaxed/simple;
	bh=qb+XEUmhlx3kw8QCiQxtMMbGJ5P0bCkJDO2IKyTgjpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrJ/Y/6pIgn2PgnDPQDmTnXEW2KetWtt9nJd5XdKKLcnVPpLJAdL2qSzkUt6FTpC/3G5j/HrU5RWbwiR+AJxv++dQ3fAhwGJNUhtTB8SDOy0DyANlEPNrQgCHiJrnDcbaxX4hUzp0e+oLLCzCQPpK3mU05COWn9HdviDye3Zh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXmS5b2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXmS5b2n"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bi0wk010135
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 13:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=; b=EXmS5b2n/lmS2bQ4
	CW2Vr9rM/WGS5/AkIlhPpJWUy0r1vsBGPIco4kOoiAKRUcJt3Xuuogh9cSa03eBk
	jkoSun1dkKF94Y893RF9AX/sDMbhjToeY1r1EgLQU93dMeCYihv0wk+8dD06HooW
	BEkL4P4spVMQtYwGdVETFGPNtMMTmkl8hXaI5uZruaH9rhmoT6dgsjvCh1MxCWmJ
	13I+duS7m5+nslS5MJAvGx1volYuoG3PW6TUrecMMYqAXIPHcPOF/fc9DmDRBfX+
	tyPiUl/68csQvb2Z6kFb1lZBbVdF5s31Sl0Z4TKP1a97Ewys3tFgxgsWaXBCRZNu
	2w3BlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7cw9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 13:37:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5560e0893so23185085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797840; x=1747402640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOOyMJiEKwo0E2wR4rThFjXKnQmgdnx4JZVsMPqv+MI=;
        b=FZd9iyqP8PHfwNHY1FhnECPBtjFtSldU4MBHvyoimQxgHqGTTj2DcRmbTmvdxYausT
         s470KL0JHurrlo/l9tpXWbxHq3HICKx3r7AFTw5LIkrwsanXtDFirYI07+MDTd35eKxe
         mw8KvWoB/9BNUbWXGnT8c1O3tePVZWJvkFWK7ParwXzWKD/thlnWDrzbi5ucVZ2QTBE+
         gwLAJUHAZt8GMV+Qt8XPr48CHiKrNtkyW6lPkP3zUAhF55HbRTUkKbu476vTPlB8B5gC
         BLbUaTnmbxhBK4uZ5+rgW35GHCUblbNv/tLGKBXZOWRrHyVdUwul/ZV1oHZ0jq6UJ8tG
         D9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpBR8BhFHk3hUSmrTNFDEtv0lCKpkEujqH86bCNEtXenWi6GToL1zMElCgjNwVx1/A5KKOqkftO6nCPbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFEbAoBHuDd9a+D5Zs7GeLNKRQRkRkFYOufMWNcpmarLADmbMc
	2CTaSYhVp3spWoPF9KPhBZPYV5kf+BGmgpJMRF/N8Nx6NuKpTSJxvp02siP/zO03gzK+iY+fvTN
	68JxJ6PVHTM7L/mzXPvcEfOYqIDRGAA+Ez+hsqJKturrhTU8Erkxg0MtUP+ccemXywAwjRo4=
X-Gm-Gg: ASbGncvHeLnsbjxvRa3jAJnUt0rfvRlRVu8JK7T0gATj4qER7FljK1OJNLXBEw6kHKW
	/cUpY59U+A6tLfIzCu3tU83SVpFgz6Gk72dhuVeYycwPUieiUqeYtnu93R1sQSoPDQXSVYuRA/W
	qOaTOB0a9fu6acd+Hc96shgcietW2xfzjO0oPbPOwuzRAXzr4H+tlBG7gQzjPfTVjvsR7BF1OXu
	LprW4gwj1tZwJ/Cjnl05uFoL2pQV6u/Qzq9cTT9goP++ywMTqBnwn7qlujZh9lX/lrUz6HfU/mu
	aneQ3v2/AGhE+yLRz6elAiISe3KDINVxOIBiVRf35YpSy5lmb7yQBNfJNqvkEssrDww=
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7cd011520edmr199008085a.15.1746797840076;
        Fri, 09 May 2025 06:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuHC/kx6/TH6m3sFD70X3TGhAwdHUaPhxaRjn4iosPvYhb5stgDjoSjqTnyk/F9Gh1p1qG5g==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7cd011520edmr199005285a.15.1746797839676;
        Fri, 09 May 2025 06:37:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197c5b9csm150979366b.159.2025.05.09.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:37:19 -0700 (PDT)
Message-ID: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
Date: Fri, 9 May 2025 15:37:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMyBTYWx0ZWRfX47CGt150aakt
 ULfvi5QE+A4BEBxyW8n569H5S11gat1jPVYMBPZj1QfiUctt3hAYRJ8TXbA+XTXJtBBRK5RgQCp
 heE/LL8zKyXkrS3HUtapL3mX0hNOY93gszM+HnqIfn2NanSoOSqWMmBtguN63ink66wpXJsV0iI
 VGavNDqS/TFTFldqt4Q1Vwttt+sspTGGff4m5WWJYJcHaRJ8ivVG1fs4wsDnqYfBHEwhvh9g4Hh
 Qr9R4h5vfUf+mL/ow30nXZOK/ILRJ2w1v9GrBF6uh9sqgyaHwpXV6uViAYoS35gdu9sPOzt0tCg
 7TGjXJcTxyWZhL48BlkidhOPuPMKsmrDTfkXFagRuS8IfJRUI254tSbB5xOm85KM4JvR4y2/7FJ
 vdAdmLhIsLXEAmErt+IVoU+OnDaOnwbFgAafCmdXQNS04XlsH67Gcmrg5k4scE2F3TZP2Tge
X-Proofpoint-GUID: Wl30aD993pFoCRGJobg1Tt9SqvIMYnAU
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681e0511 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Wl30aD993pFoCRGJobg1Tt9SqvIMYnAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=897 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090133

On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> On 5/8/25 9:26 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> On A663 (SA8775P) the value matches exactly.
>>>
>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>> turns out not to be a problem, as the bits that differ aren't even
>>> interpreted.
>>
>> This is definitely going to break userspace, because the kernel
>> doesn't expose the UBWC version, instead exposing just the swizzle and
>> userspace expects that it sets the right value for older UBWC versions
>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>> It looks like the data for SM6125 is just wrong.
> 
> Oh that's sad.. I'll drop this commit

Wait uh, we have this data in the common config.. why would it break
userspace?

Konrad
