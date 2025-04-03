Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27291F03CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672759; cv=none; b=FAH/NEA6UK9vrkiusAKA2/wBz4tE52fF2kT+QJb0/iZCZrnqi2aUZW4Mfo9DPObOrxFA1UaUIR4YyMXzKcAgf2KXq7ZgD8PTx4ZFfYNvbE7/XxKIQBaOeE1gb7WHABPWxElIt/2BLng6tXz4FkPK5TZ/Jnh6J5MC9EmCB5Ewc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672759; c=relaxed/simple;
	bh=C1hIwuuWydhUmsZeICsCNt0BaAxD/8JL6ucpDLZScJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yr5GUqM6AG013S65oj1Id2XFgeZO4rpM9c/5bgcuZKREJMW3vWB5hXZH4zeNbqqWtTVvq8b1fdyq4IMhyDz6Uy/xzt0miM1p6yXN/7mYTL6n5olSB3IB0xv7gYkUKdXWTd+Nkg6oJR1XwqEQb2IEMiEc6GVt6eKcpVvPORmygJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+LMmw3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+LMmw3W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53382nx3019672
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 09:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kh5cviLkH4Q4/0otP4zxjw7j
	dPZJQhpNAbwNL+hN8Xc=; b=m+LMmw3WX/dJsB2EwDShBqcYImknfsf4x6l/ONsW
	QCl3mokgMULMaqQr4S0fqAtBdajFqT6QUjahEMlTOoqNG0YtCGFCijVEZKE7TtVp
	VoouB5L2JsxKqHDX/E42tkWbuIq7X0gk92jNBkJgUjppRboFkEUBy+nXi0gkuju7
	J/jBqh/cmwDmAhVYfkiM0vsDJSgtBCOdzVekh01oes65JIcF0+L2eXxgBX2oNfT4
	vC6W5txRN9Mp+jnerS3cCtM7MmZQX6OwCkRyDCI6YIVmpzYxpVhKQXSfd/kLF30f
	C+QbhsEwLVo4+piI6BqxYah/fAWgN57nJ5MNhklW2iyoEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a35h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:32:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227ed471999so7111545ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672755; x=1744277555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh5cviLkH4Q4/0otP4zxjw7jdPZJQhpNAbwNL+hN8Xc=;
        b=l5+B8sw1OFmv2uC1ikaS5fy0TY2qdWsplt/Q97xxQSLpHEpdcRM0QUBiV/bCBHpDr9
         orQxGvzCGFsH/hf+Wm2nGRuKzJgW8yH6yFCaa9IsccIiqWd3qUJU3+gD6vSN9UF1CRht
         VEAdDJW3CeaJIOeXghEPatKPKS5GaBry5BC+y0eCtIkGIu8aG2gt5CerMcjEqTFfT0Ri
         GnRcpyGiPL+hSBeiFwBROFPrE+DAK67+zuJh/VuQ368YxmI2RatRtg1C9QlANaB2LYDO
         dtKaBzCcNZLCbcApB9kFQxCTMlo88DnHfVQA9g1vK19PkX1Rp6PV+sJnPUOIoLA3eA9r
         nh5g==
X-Forwarded-Encrypted: i=1; AJvYcCWmG1h1uwmn5EHC2MiyPZRnChZpHjQNm+9gaHxtEK8TzQWt0TC+Uf0XKfWENcYBhFIEqZDocQC3N7Z2v/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzonXKJV4Yj8YIvNgkjYnyp2Ev7WcYclnbknAnYRVmS5AT525u8
	vOUyLzomkPijttS8BaqNpm2/c8CzHlbIsagR/Zb1/oweRSKvOFlBi6bpLBkyrt0Q83ie4RIqoKX
	WIPYXjoECdA5EWEhrtNPy+kvIGXTfjV2jeq3Ki66jQVugAeVeGKTfM4Dh4WyQeAfaPs4zbqbuos
	SEx8RXWpwvMJnT/JPbZOOBR/+qixOcBEDW3t1wiA==
X-Gm-Gg: ASbGnctj/+PntSRoay17MQa7/VuBT4nnXdIRYlYHbbnnLoaiFPPoKFVCQGQ8DQf+4Rv
	VZFyRxt+XJh5P7jJ0+6KdGFUu5m7URV0xmyQ5WlGEuRYVk3WOg9icTo1VC9zkB7pwQHhr14A=
X-Received: by 2002:a17:902:f544:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22993c1c2ddmr17206635ad.23.1743672754982;
        Thu, 03 Apr 2025 02:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtLmhjKaHvLJSoLZWG7uMOvqP2vp+akEOHe23YGHef8LwbO4+J2rAMsrGv9xExPutpPEYRS/78h4cS1/x3hVg=
X-Received: by 2002:a17:902:f544:b0:220:fce7:d3a6 with SMTP id
 d9443c01a7336-22993c1c2ddmr17206445ad.23.1743672754578; Thu, 03 Apr 2025
 02:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com> <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
In-Reply-To: <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 12:32:23 +0300
X-Gm-Features: ATxdqUEtj2XD36EBu_iDh8FwU3bH7sm6RQ2XP6HYMbObXH_JV7dWU_z_d-br-nY
Message-ID: <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee55b4 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0hrhOQxA14BuiVhCvlcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xcDNMTdBf1Lj3It0hXj_MUj4GPKVKBPt
X-Proofpoint-GUID: xcDNMTdBf1Lj3It0hXj_MUj4GPKVKBPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=754 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033

On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
<quic_mmanikan@quicinc.com> wrote:
>
>
>
> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
> >> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> >>
> >> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >> ---
> >> Changes in V6:
> >>      - No change.
> >>
> >>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
> >>  1 file changed, 40 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> >> index 0fd0ebe0251d..1f89530cb035 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> >> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> >> @@ -82,6 +82,32 @@ &dwc_1 {
> >>      dr_mode = "host";
> >>  };
> >>
> >> +&pcie2 {
> >> +    pinctrl-0 = <&pcie2_default_state>;
> >> +    pinctrl-names = "default";
> >> +
> >> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> >
> >
> > No wake-gpios? Please document it in the commit message.
> >
>
> Hi Dmitry,
>
> Thank you for reviewing the patch.
>
> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
> I will document this information in the commit message and post the next version.

If the GPIO is routed on the PCB I think it should still be described in the DT.


-- 
With best wishes
Dmitry
