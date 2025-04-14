Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E1D274655
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637589; cv=none; b=C3YLAbDOr519/1JUAlis5ac55zkGIQ3ztSmc75CMCDhbNEpYgvGXAq6TnVvv9n4YMDB++IGJlgqohQUyKwSdRp60D59UGX0GKVlawuyRwXDpda4PErhTurgcSdAyBW69pOKyd3MN/k9WPSxUi5lMmyN734m/mIVW/X+43cn1mNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637589; c=relaxed/simple;
	bh=Mexb/ka+sQ+udJbUyAzq/FcB1dlwaiJ5OOI0XY1Z16M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6Yn5MYKrVSuQlt5NETwTlfFyGey6G/aBg269pMEblZ/72XJH1VBPWaIpltxYnJ2ANHbksO5lZvBab3vqZDcaAjP1TlKEuL5t2gbJWESDYMz3TZBqNUGuQDfIfRfoG7JUhMBGYez9RPCKCRLft1jJdOCuBKR3TwNtq4s/dM7AcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXJVnQvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXJVnQvH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qZV002955
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70R4Wlq0wxgmzbbhGoHPYqBhEc6uJKRw9xgtm6cqfWc=; b=ZXJVnQvHzGhSCElD
	5QwxJMEYJ2K6PvoIjTgd1Ru0kaenp1HCw4bTmsA1RTTAr4TX8lOxbYEfMA74iIj3
	SnLTQepLSSuR2WH/oN/XEBuWuuNifaFgdLwFDmsG10/ARnF4BKMJcoWlsfA8Rw56
	HcNkFbOYtApDqMklpgFzjMWdLDCEOajeV7i01VjS70LzFBdBlajdyxTk6srefvT8
	QVW2SSADLynSe2S5avT6TNnTDxuIwSPvbH76EoHcQSK82YLoYCo+UeDZ1eD0eLQs
	Zhf+QQmOgCmsG+IH8vw3bzvTUDQwRZqPsEiYbOwgvlQMW8IoAbO9xwKwU9jm5RSM
	mi7IxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpmh8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:33:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53d5f85c9so107037185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637586; x=1745242386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70R4Wlq0wxgmzbbhGoHPYqBhEc6uJKRw9xgtm6cqfWc=;
        b=wrv36Mmv9AAGU9pHjrLswOkC3QDkXIdWKwmztTAvZvpsJWEtfwkjTq1F9ZplruPsbP
         dm63P27TKEMjXySP+dT2m9exbNJJKkEXkuw010FOk+raubYNxshuGg8+98Q1TEDyHYwD
         /zhQYWYMimjdGo7Xh5l4NljbiktwSGsscTcCwNx+/X0ZXD+OZPs38FsKX7Ew19SSYdBL
         eOt4lNW2gkVvHh5gIXBlM2Pt7u9gO/qFdxe9k9cw63M3J6ixV3VZ2MUn+Ndk9+5YhP2A
         HU/Q3sUp+/ceBEFiiPkuSd/GBVYSrHJxiUznunq/nlERzi+SeYl3h0YMZc4pCU/KsFNf
         WdLA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Ywl1xM4U/LWKpzylZn5xqaV0n0zvdPucs8ugiR+FaAoJS1jV1ThWIwhi/kT4e18mQ2sNYbjGfacx0Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6gL4WKjH5BdldPBcJeQSEx4GnNDR3oyOVbSIcBlbFDRaue2z
	FA6e9dAfRFDdq52w2uSCYeX27nZMGPm4JR48l2KoyauQ7KXtfnrV+vGmYR4ZlXGtQtJLWL3FB+L
	kiHwJEFqZODoQ23bg6b+4jm73r28e0IabACwKyhYf0BkFQSzpPfyYBiZc5kOTodo=
X-Gm-Gg: ASbGnctH6Y9bNbNTaBxBOpiz4Ol4bNdy+XDpH5MjNJvSRwK0yz3DjksuzVz/4FvG6b5
	opTVvn7WDX38ul8qOHczDPeYt7wf9NfWyh7wDB2LEeg3rPavwRZdDVL8TBjAzQf3qVawapzGnE7
	/Y3EmXopws7eQUwR4ipkl7jcLuCduR7KJopLRnezUrzxSNs1V6EHxAUBf+LbUdlNI6pMAc8u0Hv
	S/EdH9ey0Wb4mvyaaKU4S11HF4+RCOkBbMvjjWWHx/b78WtgiRO7HOp2/LGX9m1xprzy2+pkY/B
	5HI19AVTMafunVfVgeILDVULk5gBohIXJirpRSoq7p83lK0OzqCZMmDyeLK6nX1fiQ==
X-Received: by 2002:a05:620a:29c3:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c7af1cc7aemr678415485a.10.1744637585552;
        Mon, 14 Apr 2025 06:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUe0npc3TLvwqNR6wtqiM2/SmP6DFIWYIL1xzlzV8bbpOCM08P2ZwhZmEGjvipD7cMspjgRw==
X-Received: by 2002:a05:620a:29c3:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c7af1cc7aemr678413785a.10.1744637585021;
        Mon, 14 Apr 2025 06:33:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54ff7sm4900378a12.15.2025.04.14.06.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:33:04 -0700 (PDT)
Message-ID: <84945c27-f4c2-444b-81bd-27a58f9afeea@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.garg@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
 <20250321-dtbinding-v4-2-6abd4575bff4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-dtbinding-v4-2-6abd4575bff4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _G7BCjCuBS7TmGk6mbOBq9jOlj0VT3Gp
X-Proofpoint-GUID: _G7BCjCuBS7TmGk6mbOBq9jOlj0VT3Gp
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fd0e93 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_X3inPpGauY9ifWkZVMA:9
 a=V8wHjwFqwvvTs-IB:21 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140098

On 3/21/25 4:19 AM, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d13003417a15e64c9e47833725ec779e6..6e4644b95fb678fd201310463709d7482d72d6e2 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -3783,6 +3784,76 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sa8775p-iris", "qcom,sm8550-iris";
> +
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			memory-region = <&pil_video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x0880 0x0400>,
> +				 <&apps_smmu 0x0887 0x0400>;
> +			dma-coherent;
> +
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;

I believe this should be 530-zeroes, not 533 and a third

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
