Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AD18FC80
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143468; cv=none; b=NrZrGKt1V55c/fX88JvfS7AP0dNXXny+BoGcf2+lxfcwIZ0vQIauaAa8CbkzesPHCNNlvvdsPnQUgx/nxMwnstHsp9EnoyWGnT/JqlOf5RTyPCDKswTUOwiaM/7QpAhPDO2pGRm8voCt72LT5vziye1NUXXjf8DH5hDKDILNh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143468; c=relaxed/simple;
	bh=fB1yAe/8YPxqkjKUXr0mBOSJPer8t+LsPmMwzFsmdis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERMJK6GFBRIeHI9eRw/fkJUZviHyB3UXswoXe7bKs7tJoWSLvTgvp8mx6rAl/LefazcMI45y+U2E7T59RRLZqEz7hob8SsZWTlCToajj2BQzbPn4NaDmNCDhhJcOnXG+EGRnN1wklsX6Yy/kbZSfFGmoRGq4D9d2Q2Z7PSK+x/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GD/4xO0G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GD/4xO0G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHkNZn027326
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMIf4TRueEPEiBL2yiZsauUeNzH0pwxH/E1DOBzCHMM=; b=GD/4xO0GZRj0ZRzZ
	kG0S6iO9KC9Rdz6PP4/aS2qBgRmuWccwd+kFE528gPKCFAcwNcTP4qu00AGvIlM+
	X7e8ROemOsdgUihAfzMR49pszuSz4LxCrRMnOZMANIiufjYXe6BPZ0YoOveOiawy
	H9PN81H5hANEW/w8YV5+K7nfv2u9UPcBD5kPus4hr1lHzjRpljjpawTr13rrTFI2
	G0V3BftTMGpHMLbPSse0gv60H9Hi9KHI5NPbfMgJGu+gBqYYOadd03oGnG0OUJ04
	zR59duhpx2snyp6OzNRYpDBTbFHpAP5EjU9MbQrGTUN+rMxVYKRC/WTEijIHeStS
	BPex1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crq37q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:57:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso4405807b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143464; x=1750748264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMIf4TRueEPEiBL2yiZsauUeNzH0pwxH/E1DOBzCHMM=;
        b=Oqq6Uc1Ci4XQGFrxebBzr/M14gJZVYsAZjnu/8PBzSdjk+1pVArEAOmQ03pyx153sf
         p6q9seiGeLxFMnJAKDsfmWluu6JfJjfSksRmtV4EV/2RN9Jau/Id9CJZm9B4owMkiMQU
         HyrixUrOmwdJ8xr+RiIfEkTNTlzlRazYUHde7FFHfbau9OGO7d4X53DHKpNQgrVRjgdj
         nRPk5Sa/OBBTpjEXWGx8i0M+MMnZ5L6rghFh7mrkrNa3JReGfGMyBTrxAcd3M035c++X
         v4m5LL7gkrtLlnoC+3EcMX1+gCzZ2nlBJefUwngwFhOOl5WM18WWkDHxGeDVj71ZwbcT
         qmzw==
X-Forwarded-Encrypted: i=1; AJvYcCXjnIJLu1DjvKOI1TP1iGJsNRL9is0JHD+/9EI7uKBaNpq7+7arDXhBioArscvpqCdXYRJK6+rG1zpTK68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/eqJ6/iOoheTXfERO1pOazYLlpv6ZKN4uFFP89ZkHun15DvK
	T8TIpKc7hR3gXB3sqd2owaD9ngn7Go3ztNI1mHoE6gt/Xe/lO5HXtLLoSyfrF2P3JjREAlNMcu1
	6+C6JkiQ3Qob7HBpO+CLsMJSi1/tuV9zmVjIE36weM1Coc74YpoyWmnxCxkmx0wbwMoM=
X-Gm-Gg: ASbGncum9NYQ4wfDjP7K1dT4t/oR0jJRBZhE9rj8DtJtHOEr2k3VMMraMtg8/lwDwxl
	Ap69/aHIoUr70JJsM84XKy7SRF4yh4n8QY3PA35o8HZcZe80XDUFfB+i5C8QRGlP8y/RRzoUPtn
	BFaz2owEsEgm++6+x9hoKTZFSWz5eitHC3tHbN3usYgd9hY1r9ckG8R1tSDrbqPqc32IkLQIBAz
	zmk3XA1ThYzVqmlOB3vdpgSl7BCfe9LodvaUem2yuWY376AeAJ3KrwibpTDimdtJJWt/O4xgVBB
	DVg2msXKTvhedldB4sLnvToS7LtFoaVkRcDhMoLyA7EMBZH3nKg=
X-Received: by 2002:a05:6a00:4613:b0:740:b5f8:ac15 with SMTP id d2e1a72fcca58-7489ce46ea2mr14924354b3a.10.1750143464423;
        Mon, 16 Jun 2025 23:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqHC35uDfaFevhuxUS9cNRFZiz2K0P7SW247TESFvxZsqWNF7VvcGs2WjxAz66Giamg6SqJQ==
X-Received: by 2002:a05:6a00:4613:b0:740:b5f8:ac15 with SMTP id d2e1a72fcca58-7489ce46ea2mr14924319b3a.10.1750143463980;
        Mon, 16 Jun 2025 23:57:43 -0700 (PDT)
Received: from [10.217.217.109] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d1ceesm8007163b3a.161.2025.06.16.23.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 23:57:43 -0700 (PDT)
Message-ID: <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 12:27:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
 <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X8pZtKKovOH9xRaH3w5vPihlso_NcK58
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=685111e9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=-8NblG57_WyjLwp19yIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X8pZtKKovOH9xRaH3w5vPihlso_NcK58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1NiBTYWx0ZWRfX9DhRhBC5AtLE
 wewv64knxl1VWae5AqPXMv2l8+woPN+zOouVVi2A2Zt3VW7YncqByCVHAW7u6gvcBl7dGL4dt/7
 W6ZI5rcf5M+GogpYlvcmtpAEl/1P+g1WA3REeYE3Nln98F/8M6aXoMVhe1ncnIB2AoH0se4E7qK
 LBYYB+SwuIIWIXYD/L06oyUZdoNFMVZLSvXOlN28qWmzbx/hz3YYjQYlNOD8SdRsoF2HoSFGkCa
 NqMVZF40zekIWNu5OaaoHxWAWCqvZOAGs9w73pLgKB+eBxNFu7Z9DUUj/CRwloIFJjBPWUn66bQ
 uvXWK93J+CEMxB11wmoLWFy8o0ao2dFuj0v9rCH+dVq2p9vywRIvZMy2Q9NmSdLVLXW3Au4+v89
 jLTbmzpJAPHXRqRLAonIiSSN13deB0qkKyPVrrs6qzd0h8mCYOBzXr+o6hrfG8xrdee7X6OS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=962 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170056



On 6/13/2025 6:40 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
>> Add cpufreq-hw node to support CPU frequency scaling.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> +
>> +		cpufreq_hw: cpufreq@18323000 {
>> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> 
> This wasn't build-tested (or was edited after being compile-tested).

This is already tested on the QCS615.
> 
>> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
>> +			reg-names = "freq-domain0", "freq-domain1";
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
>> +			clock-names = "xo", "alternate";
>> +
>> +			#freq-domain-cells = <1>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>>  	};
>>  
>>  	arch_timer: timer {
>>
>> -- 
>> 2.34.1
>>
> 

