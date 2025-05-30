Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA4221714
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602253; cv=none; b=AOqtqiO5rRnEnutlt4FZzNNxgXgmFJnmlmWKxv+A+IA9djWw/InRYDeu8shk5Eah3uVhvAvKnL/3G0OqJBroPMQxLY/IFuePFq/XppO4uKE3p6iIAHxbzu4/YzUkfsdruJwew6QehS73jCF4/ms7CO+2dJQzeyrZQrTJNSwalQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602253; c=relaxed/simple;
	bh=Y0A4aJWo1+DDao2XFJPkC1NveAkzL/wcYYWOAnx2c2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZO75CCkrXlkt5yLPhm83HNGW8L0DOJMQ429+BJthrqWcFj5w0TgLDpVHeKNiLvUa8AGn4UamZHdejqxEcfP3xL8bTptLmL5s6wDtHI0GSsAfZrBLQmZtCiWRNxAXeB4hAui942E0cO7tLnkLKRYAdnOTpL3ga+G0T0B/4K7fuRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MPIHTm7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MPIHTm7P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1Lf0B009547
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4rXk9vhivFfpVyuWsaM+pN+1TEWBMRApv34rh/4E78=; b=MPIHTm7PITR2O4hS
	Q+XdeINvaPtbSaEOMtecNAD9Gyn89cFndVtKkKnLV+RUz1i3CCPiUAVcURUtIYSY
	cuDqGBa03VOCbhXvDIFBlo5oprqCkqeB5RraHlLwIqTe6DXRYnJ33aYJOiKvnyfU
	gqdBQNhTBXNEgLKlFkMwfcfTC4B8BsO7kD8pNcDJTbiGZuwwQms4YysZlm1Oq+aB
	yETNHd43t5EDCk8OEwxPMZjfnj5SC08StB7TfhsfGQNq4ZQRpwd28zkCGJhZ0cSm
	9OGJflJupggL1iEtUp47Iu51CtY/lCBj9ahJ2R1uDOPdcenVOUfkKUoqxus9Xc2v
	DncS+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691kaym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:50:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso40301585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602249; x=1749207049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4rXk9vhivFfpVyuWsaM+pN+1TEWBMRApv34rh/4E78=;
        b=lGG8mgkyJNzXKu8za3btPFB5XPW54r46BVHalFxLG/hIx9JMJHVi+c5H/YY+XskGWy
         bN9zm0x/7aruRhx8E7X6q25O8cP7+wZ3o/7+BDa9bQNLEWGkgyHTXm5DrWzJz+Mxs0uw
         7oprPS5f3nzdutNk7PriXSYpi6M+MxxYXzK4agpJE0wK4vpupd7URb+zl5j+CZV1FWSB
         rvMxuLgxyiVzcRogYGhhS6SdeA2mFcJ5tzouHsX4wy/lKpabdPrgY9GgCeoKBZUWrMJP
         TfRmpU8SFUJnWdIli0yFPh4lnjh8rDmabSgGJYRT3cAG8WjWPTdA4bu2S6sKErIiKyqr
         GB5A==
X-Forwarded-Encrypted: i=1; AJvYcCVBjyAK2jt6IqF/Z1as8o52k/VT9a2RG/mS1fc77eqRsocXt0ceJ0hEzJ9z1NFIItAzdINstko7eV92hII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcflFk6dazymIlwk5WZp9ByfrjuhayXz8BZItvfAz2ozwvoyf3
	/YtaMmq9TeVIzvPBA1k/U4z3uXdYRvr50BDS80PgP5DZyTMieHxa54Wsiv1CiQ01LbnsA1IuwU8
	gj/6sFQv/qRih94h4gSS4HjvUhGwVeBRVd14GbTz8qS2Rv9TWVkhlw+ZqMdvx0l2gia8=
X-Gm-Gg: ASbGncuR20lva4ewrh7n8z8e8OtHTmqlbqyb1P0aXz4ziJu5LOZZC7JoQssP+mydasf
	2FfAoiczGtAefCcKcDQZY+J//FYTXeXRIIocchuy9DHTW1XMSWrvWIR5R91bnMwB47jy5924b7d
	4zXzX80msq1/TiUAznuIqQmLGZ+rFi0AHKseETT+cO+WGyBJZbkqCGU7T22NaaeNDdCNb1DY4uU
	gzyhOVS7leJZVROrDjf2tEGs8xS7RjUs/PHUmRzMtsspKiWa/EMnjB9S1/ZrntcEM8V9hrfTKPq
	W+JAAiRTSdI3SHydfamGMbZ3BN0VGwWyFcLwPy+8y00bXLbUHMwoC92OwodrsKF6JDd0n3tpCsO
	k
X-Received: by 2002:a05:620a:3181:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d0a3d4c675mr106124785a.3.1748602249373;
        Fri, 30 May 2025 03:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYC21TQ5zDddZNnJ9XnAJWlOSBf5rU1kM5wJE04vL9iTjxKtcyZldXI0lj/F+I9ByGJY+gw==
X-Received: by 2002:a05:620a:3181:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d0a3d4c675mr106122785a.3.1748602249000;
        Fri, 30 May 2025 03:50:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39479sm303640366b.124.2025.05.30.03.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 03:50:48 -0700 (PDT)
Message-ID: <41ac26a6-7a5a-4c11-b05c-9ce688ad1856@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:50:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com>
 <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
 <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=68398d8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=x3Y3bNPYzO7REJDPTQEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pHmWoLXEPxICgFrzFeHrgREgiEK2cffx
X-Proofpoint-ORIG-GUID: pHmWoLXEPxICgFrzFeHrgREgiEK2cffx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MyBTYWx0ZWRfX2XV2H8RjPDt9
 sKc44xJhYaEZEEMbJK5s4wUHe5es8F9T39e38GZW4+oMJqy8KxyCWLzuo3aR+cE8DTduGYgf95x
 RE/f23yErvQ0W8LpeA9UL0k1UHnjzx0iO7XKC4KFqdLdXxSFcU98jWNzafRNlGV6Q7/7lvJL7OJ
 7nxmCjSykYcXn2f8mt75B1HAnKzcsugtTB/yDHRbNl7vZwtDSIStr7/j7FvPE1Kcx/HsY4PUTQU
 l9KU5ThySW/WV06dL7q03T8LHtsFfVPS7zGaP6kBXKU9gX1WtW8KzhJVPXKdjUUBI0S2DiBBXhH
 n0dRk+/ETQnsbUOKVWa8b7DwdHhUnkkktR8dEXQdmDsB6PGyWG1ktBase2V1vFmqNTGlLH+StWM
 5I5/629XcOLs3SgNwGR6iEtLvz9kxbLSWCYFMlD7q4nZVwgnrfQryj3NIjIwQRLQwhoQwk6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=890 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300093

On 5/30/25 7:38 AM, Mrinmay Sarkar wrote:
> On Tue, May 27, 2025 at 4:06 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
>>> On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
>>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>>
>>>> The maximum link speed was previously restricted to Gen3 due to the
>>>> absence of Gen4 equalization support in the driver.
>>>>
>>>> Add change to remove max link speed property, Since Gen4 equalization
>>>> support has already been added into the driver.
>>>
>>> As Gen4 equalization is already supported by the XYZ driver remove the
>>> max-link-speed property.
>>>
>>> "Add change to remove" is a bit clumsy.
>>
>> I'm more worried about this node not having these gen4 eq settings
>> (i.e. the part talking about driver support landing is true, but it's
>> unused without the presets being explicitly defined in eq-presets-16gts)
>>
>> Konrad
> 
> Hi Konrad,
> 
> Actually stability issue was resolved by this patch series:
> https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743f5c1fd027@linaro.org/
> and I don't think we need to define eq-presets-16gts for this.

Okay, so there's multiple parts to it..

I was referring to this series

https://lore.kernel.org/all/20250328-preset_v6-v9-0-22cfa0490518@oss.qualcomm.com/

Please check if you need this as well

Konrad
