Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F001A23A9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879723; cv=none; b=HUm3Yg6y5xh3h1LUFsI1hrptJpqeZi7tdiyqWaUb5Qo5cYKUZbyjMAtm2YWIT8uIDgNDTNAFzmjCNhaiDdVLuennptFPmwmDleTOO1mvtZ/tr+PhpIah6bwRtdmRPUkbRNUppoOZE7b2AY6rK8oMLV3IHQE4pHGas/0K7FKM9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879723; c=relaxed/simple;
	bh=tjjCvBxWbRxuzfcmwgt2e14BCgemhZ17sHNnbJDoRqo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpKxSOGf5gZgP7uCFVKUcKeR5v3eXjiVGP+VmWd1Q64YYEuC3aE1/rRLfKg0oAyKxVu3y5yLzKzrrdiDqE0SlTcjg2725JtBjmaFWhp6hCfnV4Xa9pnVADqeNm4zsMUCD7Zy4dduCWeiHNZPrLWKhR5DjNDQPy/Q/036vs1OmOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRn+Zj9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRn+Zj9b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676p65C013890
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngeouwKDCRN8FHS2Ov3SiLW7
	xuB2mIEuudvyrN1Stik=; b=gRn+Zj9bPJLipbfniCQ+2soZ1LekeEo3ru9DrdYp
	xpO1dZyRSt0kAkQoVyunkLhcb1W44MwZYyNrgEprB/4jKQa2CZ0LQqB6yR+X8xk8
	H7LZJKC+nBNzUK4hBGAX6ISwXfkZ0xGgev0DosLyJuyHUSmwxA0ea7tCdc+dog61
	yN0cHDZMaLf2oe0dsToMESJRStQKHAxMAGlj3NiTE4vf4fOYHgyPV2OviBI5gvcB
	xznn3wii1j8WznOX3hNVJSpoKnR+YSk5JUVlGsE2laiPYbFS+kzVakERlaIbQeby
	ZFNbhdF6Ksb7HVCqH7a7whGOGzfogP9IWEFZY4kIXnqENQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0h5ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:15:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3cbf784acso865842685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879713; x=1752484513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngeouwKDCRN8FHS2Ov3SiLW7xuB2mIEuudvyrN1Stik=;
        b=W2w3ED+pNSTy80cQNlxiRulgOW25kE6VAWpjZ22z4X3cYafgVJJJ18WVtPE3vu2E0y
         tuHJOlNVQNn6S/H9i6taj5KGmBEbXWG7MAv3aLQATR9oiIwTN+6DPGlDNXntrE5Sx5NO
         63L6uZ75erwBeWdOnMd4nuwQwiKgbHH6zBkHKwcRSW1eCksZTr8WCgopRx/KgkNnIOQY
         TpshZzCdJev3GU2ffdiACTKm6es+EOdvjMOpFXG+qA+cHmeOFVQMH4Vj0g6BzxDQa6qR
         ZdfvFVIjuGIhtc5s1ANU9eur/L97uDrG2UUj37KTpGoRGoVhP1sv240CqMCsewsL/zP5
         j3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTos/6BwjMHo21rVjCQpDtbK82FAev5q5LZqr596uxlhMN6y0FM36ytjZCALQcw1D5D+5SJWV6uCX8B5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Y8i9O+b/DUiV8BHNOJtogSpxq5o1OThuYRMjmjMMZ61mt0NW
	xKg7aHJ7YvCfA9EyFDESCrhKEAuo9A3ROfc/nkrhGoX0UJwcPWQmQBFGivFC87ExhVClecMOv6u
	7Jj5QYrDAeyOGEeoJ/se6s32oX/4Lfmy/oU/HZGsD+YzUDBI0OMaY4xwi4hTWa6xbSWU=
X-Gm-Gg: ASbGncu22bbMFuxgVRZOnE3iCDJ7rHSqfBUUBYqnyfmqFH1J9orItm+ZLl0ezR4TcLM
	ZmepxpVzEgBqvPxf0NgsioBn4DWl4865tiuBiwY6SEiKh/wAd8cQXXtz5nfTD9ppCaBkKgHfoa4
	XFk2N/l2TYYptDhR/DNwJd4msgZrQi/D8xScGj2woJaAW5URDDjdjiSgIOoKoLlzZXuCMze0bt8
	jVH9zypkTcJptYQHpoA5Sls2Hkn8PteafKsARGsGORnfO7Kgs2kru3IB2Q5wDGWpXhHs8T9Fi7x
	14L451PKIEKXb4D+rEC3ACjAeGt/+sgRZI0bfCXgWrIpP435KLfDKB8=
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925299285a.38.1751879713280;
        Mon, 07 Jul 2025 02:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpbSVqCx6tFJzqSoaUTECC1w7GfStZZinCZQdif7BWXOwJSsYmKAa+1rKlwK+D1nlqL0TnFg==
X-Received: by 2002:a05:620a:1aa6:b0:7d2:26e8:e91b with SMTP id af79cd13be357-7d5f17e5c89mr925296085a.38.1751879712780;
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3e2bsm97448195e9.0.2025.07.07.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:15:12 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:15:10 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aGuQHk4tpPl8kAsz@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
 <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com>
 <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686b9027 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VQ7V1meLN1WFzF7lOz0A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX6GR4bKOsdtfR
 RxO5myNiYqFYh+Ex1LouqvcqMU49DYNaPyf6IxpCx/vX1YfEvH9ScfFjTZOAzbFk0zUc+kEXSwM
 eqeXV9x+Zx7kXEuqUC8OOhEZIEolE9D129LNU2IDQI7ik2QrW/ZFJM3g077o6sSlq/d96ySbDZB
 RRX9soSQ9yzGNT7vpqRm/pfl1v3dENbTf9f512J/LKpnLT1NSwG5i8R0tlEkWFQ85vamLPhf00j
 SYlWGdPDK0lNo43U5hSzQG55EayH7i430d9FfCviPLASSh49pS6jJM5lIPP4v5tjkZkMBFp//b6
 KUX3FR8MKvNlLACzrrYQPPock2pCYBXuTsx5pUiIQInP10PFQaGAcibsUlx1FlxmRMER3c5Rz5U
 x+J5va7+02WhQRCeXC7eZhXoeTUDa1SKLFCM7jW2sbsfB09Wfkas3PmAS6njOBWIe0vw5HKE
X-Proofpoint-GUID: o8TNODfiDlXkYMiZyQS1gCgLyS0knUCu
X-Proofpoint-ORIG-GUID: o8TNODfiDlXkYMiZyQS1gCgLyS0knUCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070053

On 27/06/25 20:42:45, Vikash Garodia wrote:
> 
> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
> > On 27/06/25 20:28:29, Vikash Garodia wrote:
> >>
> >> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
> >>> On 27/06/25 17:40:19, Vikash Garodia wrote:
> >>>>
> >>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>>>> Add DT entries for the qcm2290 venus encoder/decoder.
> >>>>>
> >>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >>>>>  1 file changed, 57 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >>>>>  			#iommu-cells = <2>;
> >>>>>  		};
> >>>>>  
> >>>>> +		venus: video-codec@5a00000 {
> >>>>> +			compatible = "qcom,qcm2290-venus";
> >>>>> +			reg = <0 0x5a00000 0 0xf0000>;
> >>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> >>>>> +
> >>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> >>>>> +					<&gcc GCC_VCODEC0_GDSC>,
> >>>>> +					<&rpmpd QCM2290_VDDCX>;
> >>>>> +			power-domain-names = "venus",
> >>>>> +					     "vcodec0",
> >>>>> +					     "cx";
> >>>>> +			operating-points-v2 = <&venus_opp_table>;
> >>>>> +
> >>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> >>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> >>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> >>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> >>>>> +			clock-names = "core",
> >>>>> +				      "iface",
> >>>>> +				      "bus",
> >>>>> +				      "throttle",
> >>>>> +				      "vcodec0_core",
> >>>>> +				      "vcodec0_bus";
> >>>>> +
> >>>>> +			memory-region = <&pil_video_mem>;
> >>>>> +			iommus = <&apps_smmu 0x860 0x0>,
> >>>>> +				 <&apps_smmu 0x880 0x0>,
> >>>>> +				 <&apps_smmu 0x861 0x04>,
> >>>>> +				 <&apps_smmu 0x863 0x0>,
> >>>>> +				 <&apps_smmu 0x804 0xe0>;
> >>>> keep only the non secure ones.
> >>>
> >>> ok
> >>>
> >>>>> +
> >>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> >>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> >>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> >>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> >>>>> +			interconnect-names = "video-mem",
> >>>>> +					     "cpu-cfg";
> >>>>> +
> >>>>> +			status = "okay";
> >>>>> +
> >>>>> +			venus_opp_table: opp-table {
> >>>>> +				compatible = "operating-points-v2";
> >>>>> +
> >>>>> +				opp-133000000 {
> >>>>> +					opp-hz = /bits/ 64 <133000000>;
> >>>>> +					required-opps = <&rpmpd_opp_low_svs>;
> >>>>> +				};
> >>>> Fix the corner freq value
> >>>
> >>> can you add some reference please?
> >>>
> >>> I took this data from an internal document - not sure why the downstream
> >>> driver supports different values or where those were taken from (AFAIK
> >>> they are not supported)
> >> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
> > 
> > I took them from actual documents (which might or might not be obsolete,
> > hard to say but they were the latest version and as such, they
> > contradict the downstream dtsi).
> > 
> > So I'd rather not use downstream - could you point me to the reference
> > you used please - I wonder if the fix is required downstream instead of here?
> 
> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
> is the src for different venus clocks.

sure, but the question remains, how do I know these are correct when the
documentation I have claims the opposite?

AFAIK downstream could be wrong, no?

> 
> > 
> >> Again, good reference for such cases would IP catalogues and if not, gcc driver
> >> in this case which have structures defining different corners for
> >> video.
> > 
> > The PM document for this chip only confirms two values - the other 4 ones
> > claim they are not supported on 50_LT
> > 
> > but we can discuss offline.
> > 
> >>>
> >>>
> >>>>
> >>>> Regards,
> >>>> Vikash
> >>>>> +
> >>>>> +				opp-240000000 {
> >>>>> +					opp-hz = /bits/ 64 <240000000>;
> >>>>> +					required-opps = <&rpmpd_opp_svs>;
> >>>>> +				};
> >>>>> +			};
> >>>>> +		};
> >>>>> +
> >>>>>  		mdss: display-subsystem@5e00000 {
> >>>>>  			compatible = "qcom,qcm2290-mdss";
> >>>>>  			reg = <0x0 0x05e00000 0x0 0x1000>;
