Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E11624CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710587; cv=none; b=BKZjXSBEoREsFEgsy/qY7+HXLFsqS4vmCsU7OmjdfBxhE2X2IlL5ufAl8tFs3q2PfYJFt4X8V1bKqIr2EIBNhs+dC2hBe5RnCgOaOh1OvBJVKCoCEDiAq5KWezSKZrooTfH3NeCXUgqpzxbeOGadAvgU7fZJMQJ6jEYtMduzSJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710587; c=relaxed/simple;
	bh=52LpJpjDjE4yBWBRZ4EBwCQtvWp1jBAGSwaH4q8wP3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/cmwnqlnDrSMessiE1OWIC6b7Pj0Ue7y0fdMON8KRpeTPWX6ASbYCz7pgLDfhPjN3hWARP/SWzSnxNApaFLaGWLNDwzBAwgpwCdBWBfUrergBVR8Ld9VMatCows0awKxVNFLIlJvd4Qty5CTx/jQjwtI4IkNSH8pbeb/TC5JmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR2rNzqq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR2rNzqq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGfp005840
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=; b=HR2rNzqqCQRNtosu
	jEyA4Dwg+NNBmGGuCP+gFkw6Sr3hJ7PnCrYM15v3TrbbxWlWj2G+WYbGAcbRFd42
	kapFPavs0vYmmIcTTg69pEtU9PzAapxIIsqm6A2GTa5Qt8IQCqN69eMogWNqoRby
	Rqa8IGGo0sz52m3mMvnBsonowiawCWbZynuGm68L/Ku0+HaiLdcwvMXdVlyXNJxq
	P/Jnh2niB/eBa1v4GseskiAOZsVQDwVDnssPhA3Se7nCxGTOHVYJS+1EYoMTNKWl
	M1h7HIMsbL+w54teqwkwUXKGRIWwUkNxzCCcGhNojgUsAPKqumjKdjNrvLo+E1du
	44q52g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7rkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:49:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54767e507so882466585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710584; x=1745315384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOIM5yPpo9MViTBKkLNoXdzuS8SDS+QNfkUos1BVNLM=;
        b=RfArdi6k3sOvdzucXy+3O2PzD1EW6fZydPfFKDVI6/bAvEsBanJ26nfzBrAdzFvEJc
         NfYcW2vz/e52jIN096W1eAoZ+fXYFfBRhaJjKlX5ZvNjwHwZSb6QW3U5tq2NlvhOpGpj
         kYAw3s5HZIRdZ8GEcyFrD0+XK/lYjRCAD1L7t9fwnlPc+HMU6w71o/UNDwinuaJd+OFY
         A0C6GcXEp7lK1GmWee3eF/6F30zZp4rcZfI5eA7li6dDEWUSau3FOdLp+km9GiQAZ2SQ
         CkELXNfGP5rOg0Iur6umC5rB0AGh0jKj1yxH2aIqFlHhBDXXLiUgKAvAK4Hs3yBSirra
         FkNw==
X-Forwarded-Encrypted: i=1; AJvYcCX0R2R8j5eFkFW3/zW12Kdb12wJBCMuB1gQpm5l7jqohKYUsDfZf/PQWX5wHek4soV6RnWa3VipyH0ngyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3ofGW7oMknb5g+J09AqSEiMilQhqZmm9uygZouyr/D3k089j
	kZkb33bp/Tn3Gg6DbSGeWkUGaZ6thC6W5EPtSjFkRE2vujq60tfL3U7yFNMwa9UNo2ySC5Jc7ZF
	OpTLdgUbIXgPl+aAgGI1EzWPxiNpDQVKLgwoHMcwPy/T7wABp+d8b3G6yBCz+P9Q=
X-Gm-Gg: ASbGnct1CPvOb1Wt8PO68ookAzEwfLUjKh334TE032+z9v9kncTr+DhJ397nw35SeM6
	V4qZWG8j4/a70lnlgoocyz+Prr246NbMnCWj35oGKwuh2cSLSMoa3kQxiFjo+5OFzbgEzEQrErO
	7xDjNARIYQfjVNtv7g5IhhVVolby6AKZnMiwmhm9F49tDxqgK+sjW+BdCmHd+NS2B1idVsWX1Cq
	7BmhxiZHCw5bC0qJcznfNvKKFBzsHJdwkP6Hifp+QwjMHMkNdrzHf60ngYHJaxxohVwPv0MDay7
	3/BE1wa7QJEd1buOBhidxF6Swc4jY+e2mb70DDQxEf6nW/Q2qn761jhxqmhcRGIKpTexj90Pvqm
	8akY5yWC05112B24Ev8uDxrpbnE00AXMxMFJoiQ9VVLOMo9Q7gP97GLiNWry4
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c7af0d3d1emr1773053685a.14.1744710583703;
        Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHRiOt8l67E2P0R7QBa24QR77cwJMkGHiQzo6vMvNgAnJNTeO3hOBWB7ssd17odFt1mGM6Q==
X-Received: by 2002:a05:620a:424c:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c7af0d3d1emr1773051985a.14.1744710583367;
        Tue, 15 Apr 2025 02:49:43 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f46623c2bsm20611601fa.111.2025.04.15.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:49:42 -0700 (PDT)
Message-ID: <10e8c3dc-fbeb-42e1-b810-d80e768ecf6b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:49:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
 <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe2bb9 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=01dcSNK4EstfxtfeDswA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rdEZc2vI3Kr4KurTqJ_AOck_q7eleRL1
X-Proofpoint-ORIG-GUID: rdEZc2vI3Kr4KurTqJ_AOck_q7eleRL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150068

On 15/04/2025 12:44, Konrad Dybcio wrote:
> On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
>> From: Dmitry Baryshkov <lumag@kernel.org>
>>
>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>> controller. Link DP to the QMP Combo PHY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem", "cpu-cfg";
> 
> The first path should be always on, so that if CPUSS collapses,
> the display may stay on

Ack, I'll fix that and send the next iteration tonight.

> 
> other than that
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


-- 
With best wishes
Dmitry
