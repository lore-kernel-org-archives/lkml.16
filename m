Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41888239E61
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811407; cv=none; b=gceypp5wAcR9oY5JMMwTvoUX5cxbA0+3GhBCQ/F+Sez8VRGM2twhVQyHinv0EIeVMZc4qJuPcB4rqVGof1O84I3HpIbmLhtLO/kFafaecgHtFdfzqaVlqd30/yBXIUzR53AD7ZXu6+2bbpHRcZIzbWFEuDbPpFwYzPTNZ015elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811407; c=relaxed/simple;
	bh=p7CnOI+eB6urGUFpnCOyOafwARFO+PzXylkm/qR4YuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDsbjwYHHH7RY07IkbmvDM9K+rs2VIYbqXmijURggHwHLbFdWl5A4srhb/u76LrXXtJpydC/uy7a9oEhpHDbP70oXortNCYQ++0OikcColVsrCdi0euo1YYUxhA0fk7cE8LzOCkpHaSJxul6cbObm/z6MHCScxgV0VNeQTdLgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1rOUacq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1rOUacq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BEBoH010313
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 17:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmh3GZgplEnn2RGKAzJAQOcuqEH4ffRTlVelkfCzQwc=; b=Z1rOUacqE3LfbypC
	jkp3OdHQZ1tA+qYFbrX6/L9ydisjdV/ySkHrWA9ARdnC07SCs6R3GdQfI6J6g9w1
	oYE2wBr2vD/HjIURRmcbX+UoIxs9s6dSl/INw/gdbw96GomUkTdZCLdanP/rchRh
	ohkf4z+DssYhuYc+LTVfiZ1vaUaTIaw8rG1+ap/NwMFcuTCJecnrd0OyA8UnqhEH
	6LH1Hn/UIqeUSeJoT5+6O89h/tnp+XDK18onP0pyREQ8UdjXZyNa33WxUEYVDTSb
	4AKAcrCIvOv0dKg64oKTHdcQA3W1bdDaduT0ocVLKRfWFj4J+86Zvsqb6DrlQw8W
	fkLBxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7dfqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 17:23:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso51436485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746811402; x=1747416202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmh3GZgplEnn2RGKAzJAQOcuqEH4ffRTlVelkfCzQwc=;
        b=Q0wWtuhK+/Wil0pkQP00Z+kssnhUpQFSyvRKqji27s1gkz0e5k3Zxy46HLAUupnLB4
         1w7/n8+MDLQH0MMLPYcXYflbXGOHGZSXXaj49PBNCAUdct8vyOjc4ciSQrOQWqGXShU/
         Fq5o7lgAIkstaV+bn3JO0KbO2FpMBXOJzm+uVOkBaRR+uYGWL2kqfX+qXPGHF/9AFTfC
         AqgbR9esG4uHmh1yGvsDG9A8CjQ4+zmyK90FMK+TywZCfiBZ5isBcmY/JNsd5NOrX6ye
         9hX0EW25L2uxu34jlc916sNBESjGdYc581ElqptJLyq14GWdOLLS0JddUm4b1zOIb9GF
         CMLw==
X-Forwarded-Encrypted: i=1; AJvYcCXk6tdHueUbDG7pPuzALqhjQfzj+gc6stMLPxrn6Fewm5KjoW2CWNsegah+SG3hjRBiL/ZCh2VKbS/b254=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxql2LVYGK9yDGzX7LQCEJXRIQe6b0FS95bqvAOsMRCIefZwH+V
	8UWp3xWobtEt5hh/qVdj1FzHetRcgczSYSu4nFDD/dS4yMf1EIgqmwztS4rcBULPZL0sgcPw8GT
	h7lUNVhVanW9+Mwpb1e+cCC9UVqNX8z7fsULB4gl/tey+np0tiAFeA7acWFPAzRQ=
X-Gm-Gg: ASbGncu8V7plozFTkKuuGvIGSMsuTQ4epEW/TOPytRouxeg75v4j7VNcTKhmNNgl7BP
	M7CXbcgbLoEb0c5x7fVM2iHkHcyRj/85MVOKfTv7kRmWKjbr6sPQzykSc9iOyArdwLeFOmjGY0S
	U3K18TMEayod9MQO0Z08fyB1i3zFPq7wBuGqKTDyLdO/smYXrBVYQxYW2w35f9Zvgd3vrNmmc//
	CL8Imcevm3qcfy+kqpnD7zblOoZm5hfVp7l6kMob+L1tHoJC0K/AceXDqLEQ9ehYw/AfvSW/6Ib
	Ra6PpO5OoJVk2wwILuCj/Fn0yAios5pegZzYml0C1nSNGFDskt8A/A6OJcQT7gCIyZc=
X-Received: by 2002:ac8:5f49:0:b0:472:17b5:dc3b with SMTP id d75a77b69052e-494527db5a7mr23857741cf.15.1746811402070;
        Fri, 09 May 2025 10:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5QRIK4iJ4tOkf2Lkv/WKPhvF8dNzthNmK3CXlwA30g+Lj2Iml+YpRYF3Uf6pB2/U4x4Hxfg==
X-Received: by 2002:ac8:5f49:0:b0:472:17b5:dc3b with SMTP id d75a77b69052e-494527db5a7mr23857521cf.15.1746811401604;
        Fri, 09 May 2025 10:23:21 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746cf4sm179304566b.102.2025.05.09.10.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:23:21 -0700 (PDT)
Message-ID: <3d871abe-1185-4d30-a99d-ad59706002c7@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650: add iris DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
 <7347ced4-980b-4630-9b5b-4810df249b89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7347ced4-980b-4630-9b5b-4810df249b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3MyBTYWx0ZWRfX9veLWV/HNQUe
 ZV+cneW0R1eTuq35lSht2ADqTPI1LwQWm4zKfNRIdM7tf2RLSYB3uQqpLtoZNrYs6YNSyJ6V2Rg
 LFMCXjThDKPmegQ9cusb9nPtlVQplJ2GRM3g6w/Lxe60F3jY6qnVNFhiSYXAYtYUolmFEcBZpN4
 8KvP39HUwo4YqHudsq2YSQe+UrskoH3dLgZKUZhQDkWHSvzfhLjsfKhXFMvIxhWi/4NKvkTDV1B
 x7NzQef4A5YRaRtuxQGCEv+6Mql+Hs6rNrEy4tYEKU7i6dQD2kZ64rSsIC+qXNdgF5Nh/2LKI9U
 wEEibQZup6z+ChJXieJbgIuYmCLs7+Q0pgfbpXWv9puykRV8eYL/sBDymc1ZXo8WtuBga13i8Pi
 cOP/9nSUbzy0iMzGTEYZPr2G8QG0nK7pmhyawyTNxcB3h8pB2jQDYOEzCfkqH/na5LjQAeK8
X-Proofpoint-GUID: 7hxDeAiI_aXCj8Gl5eT5iQTejY4RjleW
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681e3a0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qJQYiIqyEECs_jX5HgUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7hxDeAiI_aXCj8Gl5eT5iQTejY4RjleW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090173

On 5/9/25 5:58 PM, Konrad Dybcio wrote:
> On 5/9/25 5:28 PM, Neil Armstrong wrote:
>> Add DT entries for the sm8650 iris decoder.
>>
>> Since the firmware is required to be signed, only enable
>> on Qualcomm development boards where the firmware is
>> available.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I don't like the new comment above status given it says what we've
been doing for a long time everywhere, but i won't ask you to resend
just for that

Konrad
