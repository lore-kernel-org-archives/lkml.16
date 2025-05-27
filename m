Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CF29A9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352803; cv=none; b=obExEYiBVyN3nsTlD+3bxWuKcsBmTXMNvnYta4XFkiS2QuPkcHYF7+h/+sUuE0lqtYe/gENdzBEWlqXLodLFW6HjK65H+tY0P4HuhUqXnA3Osm49JmJGIciZ3LxVRu9zu3HGBFjjrF9RSY2V4QTAUm5pCQ24MYlEl33CcIvlbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352803; c=relaxed/simple;
	bh=wR7Njg6dgwD8Ok8E4irPjOJteY0XUc6ZQZzhYXAYtZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlQQMk2tEoLxkLXtBiEw8iGlks4K0TGX2rRxt4AmGe2XeGwrytcGUDY/+ejwIQFkx4+dpVBECyBPM8EYjFdkeFWODurSwu5GEHWXJHDThRCKocSm8KgSxzQKk0z4iF65tiWiz8cReqCABWlgoP8TdaMViNbJvSeab3LFyODaS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6Fnt4ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6Fnt4ew"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAFa7E010166
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sf3ZDOW7jLeRaHKCxewndBSZWU52iW5rDGhJ3dY4AS4=; b=a6Fnt4ewlwant/Y5
	TrzK1myff8Ttll60bfCP5g5o2EC4TnGrqLVSBwC2HLHcyJHTQXEaY9trkukWkV0L
	YDZfaNQz0tQPd42OKZ9OJJYFnT2PnRThYtMaWzv+wvOAaOSAMimLEGsnaeKuBDNt
	9pJ97U8/JR2Wry29pN5nDQ2EFY1XAKavo3GfzXZEK+F4c1pR0CtFPuEwqFi3OA61
	wMKuzAoShKtYlUmG+CRgNdd0FRYPEZt63wfN39FP/Eohw5k4FcbRtvVkG1Et78L2
	HbiCBtFTxaErE9+geZDLVrtANhuW+akmvp/g7nIx8YqPXTaNkb0sYYlFZMVSiP+J
	C71qZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjq1we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:33:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so108022485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352799; x=1748957599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sf3ZDOW7jLeRaHKCxewndBSZWU52iW5rDGhJ3dY4AS4=;
        b=KkoZZ3cCXxy74ZeP2GdcB320GtnhtfdHp6rH3frxnjRDodjFXsUi1lJxpoih1MB29t
         OScDU7Yypk77FFyvMVaV0G4nWRpO8rwtnp1F+8QcPq+WDSGivSapp5UVTcshgmy7usHY
         mevW7SsGvPqe0lH6RYab3n9sQo1gYoYQgki6XOxTvuTcb6CquLK1MFETv8wFI398maEf
         ArTPmWHIjxklheJxeKpKs0sHieGi/mR7WOKdJ/GllLatko9azL0YBfS/3TUI+0jJyTNf
         Q1yCg7nbRO/fPMU8BXIvQes4Mnq7g037q05gWQMrR6Xwn67nDpwFbWTMr88wSwLTCatg
         jkmA==
X-Forwarded-Encrypted: i=1; AJvYcCX/nwiorNtPlhMwrbfUbisbWupLEcDMCab9H4AXIbOmUdx9bSfieIZY3R3KYVfR2dyTxhV9ycZL1wy8Yu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6698KheuQJURbSBRVFEdob2u/5+w9lqj3+PGIryg0qN/7Zzd
	BmYUZtl638tp3VWpJS+c5daiqh2FKDP9LJBiNlNiIdkRGeB/kgT6re8StrBBVc5sfC+dZQHxchZ
	rUd3e/m8ZYnU1vdYJP3ZtWrKDyXTMgiW4xfz+kubCZ3ovmo7xFsV9B/LFS6jJU8VC+CU=
X-Gm-Gg: ASbGncvQN78T1PJGMzChO82Hm4Ndcqp0h/hQwTPUNg0Rd3SiBFiiZyHGph/kczjUyNW
	p6CCMnfsvdMk1VcOxwaAer6o35Zkr7/8dBz7Endf/bQclRT83URXv/NmOCjvw+C1hrVVcKB0u0/
	P5Ttm5PucSdxP6QwJbqfSA+kKa5NSgwq3CDW7Og4aEG5OlYhWaL9uVGdN705d/7rph0R6i1Gt0a
	l4N7RFCkA9BkQMgIuCyv6MfWEnXlY/nftmfQc7grhMfgYTsRdVJypcGDDe6YfvaW6gBddHUFWHb
	3uhelKhOfKXYhWl3f/pr0FN9Rw/Hh7NPM0nGyxH0yC8i7vw1hrAufVFbEp8gb848Vw==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr707844285a.9.1748352799520;
        Tue, 27 May 2025 06:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxHp9Kq6xACUrOLZeAPK3xKbLCPdgK3Jt6UEMD1d7N5UrCW5O84Ipwm5LgeRSnuCUJQpgxIQ==
X-Received: by 2002:a05:620a:1a85:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7ceecb968afmr707841985a.9.1748352799038;
        Tue, 27 May 2025 06:33:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f33182d8sm4940505a12.7.2025.05.27.06.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:33:18 -0700 (PDT)
Message-ID: <fe4d2887-59bf-45fe-acce-604185aa4081@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750-qrd: Add sound (speakers,
 headset codec, dmics)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
 <20250526-sm8750-audio-part-2-v3-3-74429c686bb1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250526-sm8750-audio-part-2-v3-3-74429c686bb1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6835bf20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=er6kI1bek27KySCzKVEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: g8tk7lhFba3eTAZAxCC_7EghmwNUyg5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfXwlXRBVqfWFT5
 WM/e91gkJNuOBZVwVQEOhdWDlk2byf3VmCEnhYH7yvEZmsTLSeHcB9PctRLzQu3O/t4/UQcRaYY
 I9bffw26C6okCoI3R2WOP0ingCjbn/5o6qib8BM9Ymj6Foz7fzeMdycAqndOHYGjOEiP5ZsTWT5
 yrpWoehTKFLkIsD4GxJj9v/CZ9VJZ3N7XCAhDy3RXT1/RxMP8LYqkdtgYFArix1wyXPpdFdhCZw
 SHQwPKbLrCAqWEJ14UgpOY0sLHBZFjbznRriMZWAvcsc/RO4VoHZ+c27DIur9huaDZ6Sw2R1pJ5
 ZSbS8X+eCkbaKHwE2xVkk9FahGAiLFJUQLHSkezr82qcPzfj8puCJ51aIcFuX0eiWTQ3XVV5B6e
 6Pk9kQKc65I4S7yhVMaigTqHWuOXAu5ipNFZaFhcXFKgqELLRZET+QWnkzVRT4SVee1sQMLM
X-Proofpoint-GUID: g8tk7lhFba3eTAZAxCC_7EghmwNUyg5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=911 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270110

On 5/26/25 1:46 PM, Krzysztof Kozlowski wrote:
> Add device nodes for most of the sound support - WSA884x smart speakers,
> WCD9395 audio codec (headset) and sound card - which allows sound
> playback via speakers and recording via AMIC microphones.  Changes bring
> necessary foundation for headset playback/recording via USB, but that
> part is not yet ready.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
