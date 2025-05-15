Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1181552FD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324359; cv=none; b=cobMRutX/BDi+OMYv65Ku6gmsn1fRNeBH3iq0UsIYA47fIlcy+D0J5gAGdGaE5bmNJEqBmvRdxFdObCxzu7iOumxGfbUotyXlbOBSkZr5Yv8TCCnV2kGulEKouxM7AaTYXLSCNN5M29NICmYlh7cJodoFxCeTyVOrHSZUmgAmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324359; c=relaxed/simple;
	bh=lGeDorq0qICcLt/slCL+UOnehjwhsYWEa4SRdbqgYRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFXJT3Z2vC2QNBDdjH0yQ77AVdcFSlzTmOiDlPqpfKLnZE6l3LsCntkruYgObudkHiLTVUGl7DQmDtNGeo+HTHmQ5KSqhrc+5InmZWNFFwAZe6Ni3uz3wNrftadpO+of9aehO0ZzcmlNv8vzq0Be5H/7P9zJMWU3AmBau1phXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lrxfj1VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lrxfj1VC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFcOR026631
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=; b=Lrxfj1VCnnKJH6aB
	LQGvZdV0KHsUgasZWpTn7gqQwlr2iEZ2lQ6Wn3SKdE2Ffmnf0t3voK4DOXDjzbmW
	/G4EcgS6MYXs9xZWLY+Uu+SBzNgolAILHYuO2F9QkH0ZUYxP2PP77ZiLgy6wbrpl
	2DzLo7aWfWIuFnJoD5eUXUQUhTq9x1rN6gmrVBeoovEqLV5elpQmp2PpE20eWru0
	xgE/ItC1QDhn4MvwMlFeMDSMQR/w+4dzXaW7tYT+Kb97dkznYYnnDvgEYsY0YnzQ
	PyFjYiT2SJE/2lbo0HbOUWODfIw3SXofdDDYwRIJ2hgGMKLFefCyvekAIJiQgHHj
	4DEV/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyputg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:52:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5560e0893so14031285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324356; x=1747929156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=;
        b=tWOnK4eQr1EaM70U4b/mosH6YRkJoat7LHhalBhsJHdkxOzKtJawuQUyUxNHiJ7TdN
         d3F4l1+93u/IyI7J2BJZIKLXXXYpHok6zh2TfaxZ9jQxpOTbBDSRNa5678WEY2IeLQmp
         pk2wzjR0hehTiDl7f2SJ+b3I0YSkC912jpKgWfcY6epxHZTxzIU13XTBEIFFbF8iBAsa
         d1NQfe4K7y65wcajlIskKbquPbYbRm5N+ci0MjuoTmG8uxEvS11iLPwt5OORyAVzzGr5
         bDdxU6IyH1g6ygv4KC2PfniAo9VgWPZdSIi/zLX0UJbrCLhTRTmEUA2ZOG3ZTY/pp36z
         hFmw==
X-Forwarded-Encrypted: i=1; AJvYcCU6o2i9tJEsbquJZlYCEmSRYNzPakVBehOOEgJjIr1de0cB9qysUonfhah96QRefm+uXd+ad7GthA8v9c8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK5KN/IgqLH+Sarapz80qu3PiTk+JdQ767WTh/P9/4PDyPIMA
	mxYQf87mCqdui6JbVz1yDcPOaEautIlRXmMz4xqNk4ZNPEJnvou4OyEYFVrH8tbdejIVtHKesRP
	AJwn0hd4mty0eiUcaOK3VTxSRXXBzczYSkc/KpdWXF5pDa7/vXBW7lHeHBFcjNFgIlPI=
X-Gm-Gg: ASbGncsnYDUbp3WrbVj1MOSUTKkQ0vJR2ZRWu15Y6Na4VoN1rmtTbe3Wf/MUBRru5aR
	jk4VW6ueni4eJOvaIanGWrJLjsZAr0blYxk5XnZhj8fYHIMuppFPlkyt9Vp1IGF21yqEBZF5hOz
	/sgUCRvypBcIFoxtxIF4Dknph/SnO4iT8TTvtd1iukgZmjxxKJdOTa+Nev6hSdMZ3PrBfaSN8bw
	PgrE3sLQYIN/dWwq/IeJMWUJor5ogkOCuZDBTKPN+5RpCuMMlVr11pWC9Ld1E8Gpynv8GShdqi4
	yKzUS2mGjP1ecuTxXQ2ecXXkV9VFcydM2+K3ND0Y0AxTvgUOIm2ykm1Gp4TQ83u4Zg==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cd4673b3f0mr1352985a.4.1747324356118;
        Thu, 15 May 2025 08:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrFV/2EQXmPxJircJAV7XiXDHBdvEj6UPYt6UTWF/ixiBBQlETA2RLAhwfWdEO68zo3VBYbQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7cd4673b3f0mr1351285a.4.1747324355750;
        Thu, 15 May 2025 08:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm27454a12.43.2025.05.15.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:52:35 -0700 (PDT)
Message-ID: <a068ae00-fca0-4c53-9b59-a855caca12a9@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:52:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle
 override
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
 <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sHPDIyNQOymZdUiDYLvaiVLbnVRasQB1
X-Proofpoint-ORIG-GUID: sHPDIyNQOymZdUiDYLvaiVLbnVRasQB1
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68260dc5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jslb4AC7pnrZMK7c9NUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1OCBTYWx0ZWRfX8tBlCZs48OVI
 fsOfl0brlbUFZ/ypnYt7cZ5TxV859UQlebZdmEwBwqymxNn9tf7NAnnnqqdANq1rkoRgTTeKgY2
 dXQnL1yehlI5SMdxIa8YzXU7X5GmwUCW7NIaSEifR4iS4MqOV3Ejo8+q9o4Lxo127U+ZmGZGgaF
 UIfjMz39Xu3eT1iQbjN7LUlYeif8ctiZ1R8KgWGbxBYRpk1FOVDRXpsbSmjpU6J7lGmpIIhfSND
 ryBgc0qezPpWgzgjqIrAp5aPCO6khOAyhzJNjRzvdGn451JS9ICGeg1dAutPfSgPynl9fyTahb1
 97b5TW+MkFmecxJXoFVAY57EqQB9g5sIfM3uZu7UdsHpsx5uH+jGiU4CLwqO2sq2FebHPvenB7m
 COkBdydTM7S39E/BWjIHI6kI2+ySvUTUukSIoNHD1gSQA/Tc8wsR7OVJiWZlCWfx6htsrbNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=737 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150158

On 5/14/25 10:32 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
> programming those). Should we fix all of them to use 6 by default? Or 7?

I don't think any default value is a good idea - this is the sort of
programming error you track down 4 years after you go bald looking
for it

Konrad
