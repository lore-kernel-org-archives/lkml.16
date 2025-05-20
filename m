Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282626A1D0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738342; cv=none; b=sYH7d3Y0I2eNp1UyL3hV6xTqgT084g8R+lMoP4FE4sjl1n7en16oE9h+2oeMGXZac8xGHGd97zTLfIvVvc2fYR/lJN3vk7h15dPcj3Ri+LkrH8eRhTTygaRtliVz9xbERbu1ykpfzN+9VJvX32I18T0+3bjOXA8UrpAqXYWap4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738342; c=relaxed/simple;
	bh=Oa9k0noCv5pfsZvbyv4j1AKu0STBRVDPhxiDXfVsT8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsEDBzj6JCE7bLQO6bsdHM1H9z/8fkcupn8cwX7S+rJx59/oGeY2y8nZ2xoHAvoS/Hgz7H55v0uNH1QhM3Ho3dY8EvjHbr/5CGx6xTaKA0ChYKmgSc32gVafptDoUDM0JtSoUHbfLuJ/94FL7Q8o+Z6n2cpyg9rmfDI8ftrLFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2kGfE39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2kGfE39"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7a355015695
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iu6hQ3FOP9u9YuNt9OId1rpc
	oHm2k7ZRa3DQfZxPW7A=; b=G2kGfE39xHXtJo3JfPN9p5Gbsjy6vaDU78zvVggd
	AjNF77Cj64hMIZVcIkerHarinstxprWv0Up9BBc9pUu+TLfRGRs4PnUH8D1NvdDc
	VHu+S+9PzQoCoryGCTmWAgf/iT7AMy4iL91HZALsh3BcUoDbOGErbnnmFGFvptxB
	3B5wdgF8rxl76WznhcKzJKWhTFDVg7kNrMkT37VLPmDY9J2mBj2dbt9n5CODS6nm
	/C2V946jtTtjlSYNn8C8XR6WSYG1zZ6WDwODyiA3niI9heI6SdvSLLa8vX6AcstA
	d4xMglzrhiwYUmZYn7GX5+TZAF78n0Q4XYFZ0XD15gqeWQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyqjat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:52:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-52aa2e08ce5so5103998e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738336; x=1748343136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iu6hQ3FOP9u9YuNt9OId1rpcoHm2k7ZRa3DQfZxPW7A=;
        b=F46+Equk595NnOym36U7mWZPXlKDqZdfTqWOv03M8clyb9eWnrn68GPVa9Eklp7fm6
         5PC9t0pib/o3QJg4KhVC7SpZTVltEjx/5gHrMG8Kf/VjZxNf+L0jrZlAvsntLIGt20IV
         C+csa4Ehz6TTJkIuNfZIkRd++ZwbsvXQIzb+1yn2G7A1lPKEw7gtViVxJKfKBLF8HjzC
         LIYs/h9AjoXLqW3DFjotaP/dXJlFvs2bkBLkx4sg44gMI3vWjllXLjlO/5b4AlOLlgaV
         rEhPctJu49mD+tfXNyXZmnVqUrOGy2Es8onnqfXO8gXuqWtnlWoXDCxW4o9bj8ML04sT
         rvUg==
X-Forwarded-Encrypted: i=1; AJvYcCX8x4+XI4iHPQYbefKsgFoH1FWU4nGgNMfKxjntj9YWGfFNhfkiaPN0DV4MWxjijxd3sdQHJb9x54ntfg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMuAg4fj15KobAY3qbP+NDk1H7zWJuaHxD34vFuV5FD0+mINe
	tjqQGc6Ba5e1JeKMzndRWBtVsE0S8TAkDwnvNqJCYGLuNBu3vFRZ7pTbMQ7UL/yBB+mKsBl1ibl
	0biNPj1D7mbSU8wKCA1fayhN4YgcyEzceBqFeamSxtSWYfdqbRUH1ehPsGMdhymD1j+twOfqgZX
	0=
X-Gm-Gg: ASbGnct4MOSSZEw9RR0XlYkatd+WN9XkZXw9qVJiiG+/MCLivwuIxzb8muoWGW9XMdb
	RZIcsl8YQTDz6PVlrWwcz8PYaNl/oJPhlvMnRHeCZW66YR58ta1ofeEcVdunt8QBrspzlWFl7ZJ
	odhWEjTMyDIvrqPmvZWIBgan6qFc4l0a/jZYNpof3VmqMND8w1xgOjnQjzs9J0MM/sx0YSa92UB
	8ClIMeVyhhKqkNPssMkAHt70K5fSoCOxqvwAVL2l8pZyL0QQGhiCok3a9+iQHwyW9z9ItWG24Ut
	9ceuH4nHYz3OxogS6Sq6+MmEtfNAh/GuuWqYkfP48n2h292YBsXTSNLeQpkzuF7s1XtGbE0zt+c
	=
X-Received: by 2002:a05:6122:46a7:b0:523:dd87:fe95 with SMTP id 71dfb90a1353d-52dba928373mr15602812e0c.9.1747738336044;
        Tue, 20 May 2025 03:52:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKLSIG2Onln6gXMObDRG2o81ByYnYJZsZgsh86zfCf5MH9TVDxED5HmWvf5vBdtOWBgkCTTg==
X-Received: by 2002:a05:620a:44cf:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7cd4608ea23mr2402476385a.0.1747738324922;
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f47csm2282736e87.237.2025.05.20.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:52:04 -0700 (PDT)
Date: Tue, 20 May 2025 13:52:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs615: Add support for camss
Message-ID: <gsj7aya7lr3quuw56n6p3utvz27qaqn5rxoihkvecsgfy4itu3@zoekpc7fyabs>
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-1-ac25ca137d34@quicinc.com>
X-Proofpoint-GUID: hPo3KzMYWAaMXNUSqmoV9yda7FTFU895
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4OSBTYWx0ZWRfX/cRPh5bKgTfc
 dxtZrKgGz6+mxF/8Td3pUUbBraoxJs2slFCnSi+oqWQMrlOlBtoU8OrBJfaS4JS1rDOudMI8xFI
 7D2AhGNzdQxJw2Jxsjwx/Q8TEmeR9vKrEtaqJc7oS4sBPNM9/QxC2ogaT0uDzuAaH8vjWXwys7W
 GaP2ye4dVrPN2dqmuIob+BU63bagUOHX0fDgyKp5aLqD+4abmWVWIOXQOE8GwRJt1yImBwCHtt7
 VoVYI1b/bWap0y1ISPXVmMqNoSXIRO7ZZcDkqlkL9izrpu/OSK8fy1MVrldK4ncJ/ouZsu2KhlR
 4MMjY7O/LQO6H/wiVE/x/6sN1vUNxLSYrIJV1Bec2bOn9Aa7Hzgmr79l1yn41wkmZ3XYuMJz98c
 FcYZN77KQOFq+FAQ5xCss0UkCXSOHYyh6sn1rmL2sYBufPaB1Wj0DHb/vHcDy/8IatHbSFUa
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682c5ee3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Sj07yxY_p6yHqL6ZhSQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hPo3KzMYWAaMXNUSqmoV9yda7FTFU895
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=770 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200089

On Tue, May 20, 2025 at 04:56:51PM +0800, Wenmeng Liu wrote:
> Add support for the camera subsystem on the QCS615 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> QCS615 provides
> - 2 x VFE, 3 RDI per VFE
> - 1 x VFE Lite, 4 RDI per VFE
> - 2 x CSID
> - 1 x CSID Lite
> - 3 x CSI PHY
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 133 +++++++++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 47e350f175860e7b06f7b2c13fed75a65e489c8a..535251efc6b559447482b9ecc67ca26e7efbbb8c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3242,6 +3242,139 @@ videocc: clock-controller@ab00000 {
>                          #power-domain-cells = <1>;
>                  };
>  
> +		camss: camss@acb3000 {

camss: isp@acb3000 {}


-- 
With best wishes
Dmitry
