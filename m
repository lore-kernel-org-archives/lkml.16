Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E34224337B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749204; cv=none; b=M0jGLW+QSx7GVtSDWKeQIqCfZ9SQbr8ZppP391LUpWzrPaUWr7B21HIwg4KN7yRo/OLPnuvvABdSr0C9qlCGA6YUzIzvmdq0hNGcuoWh2UnUnj45qDrC6AXdSxCki2Ph9EtDolYjhcSvXGal8o53WJBizAyEbEk2HVIuBK1Kqac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749204; c=relaxed/simple;
	bh=NytEchRmD6ri5y6zBzI9MoKSpnGuOx8B4CkQWKB8wzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjPAKj/3Mlcr1kIpKsXLwCiBalt1xIIl+IFHhdQS6RBN39rUU4wUvyfx1OPV8YSPEYv6wCMrKVEXrWXHQpEgdaNIc4wn4W/QwAGxHytGdW+iIyYBXU9JAAB/nKcPdbzWrPLjAyjMhbHcA9qmoWERmX26ncMjiuuf3uaSLUF/49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itVwlzfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itVwlzfv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8vn6P006697
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzmmkJLGqmEy95U2mjSsJRItOa5uU8/07pfBFeoUYqo=; b=itVwlzfve9ZopG0U
	VlMKBUHKf6o5qCGd1JpGln30ho1N2kZETxNwEmnaryyzgQGDoizTyQDSc/gGVsan
	XRUPBYM1spQs+TiuEHgmzS2wlBZXFotQBXGv2AVVlOMGIkMuHkxFbmuOEQit/y+J
	/Oh9LoPyl7rjNAPDXBzsWB494eNNXIVU6LaK5Z9zyRQrjQi9mrvrjyKUxu8uQgQ5
	H/vzqs8noW8w1W2sZCOOwkfw1SyvcJId6Vlmfsnur7KYqaridSz8QnUjsybkilhd
	9sKBSZSnQlb5u90l361pRv7FbVn2ZPaL2CQdo4em3ylhVKmuCqywAVG+H+xmHGI+
	JgYPsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4qs8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:53:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8df8d4585so29506276d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749200; x=1748354000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzmmkJLGqmEy95U2mjSsJRItOa5uU8/07pfBFeoUYqo=;
        b=SlHYPsFpnCPDA4J9laWUyPG6KeJXvlZYxUHQyft86CFK3xPYVxCNt00tLukXXneBlp
         yoUcvGrVYU/qZ6sYKbCX3v1HvraXKeb0Et1AlvNRzOxD+hVHjC3FSJEJmeayO8Bzw7EL
         14tmVK+YhKo/EsQ1j2BDn+9Zg0v3NkqTZNv7e7wzu0lFU/nPMJIqVC9O1f/RbnXyh4S6
         Q3fntqGZD5Wf7t/u5gd2FMpm/qnIfvnl0qPGHW+zCgxDsazcRNMIxxf+WOzCUbFY/Ggc
         tyNa9DSGORtlobRnBwWXOVN690ceeT6knuGDtYKlw2jKR7W5g0xdMcZBBKPgtJ/XIgmX
         RJEg==
X-Forwarded-Encrypted: i=1; AJvYcCXOzAAHZzzQs5/WdDvLDovhqfbkjM//MtN+KkcOhv7hdZgaGlpSyRdVOZHPjx8hJNy7CEtKv9/kC00i69g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsoAr3Xr9lBh3Cg7dSj6VD5NeyLw0slWEq2LJiIGxf1V0AvnU
	vLtHgtBfSILBhVPNoI6SeqC+aPm31/cki2eT2dB5CJ7zUu3khmPPtp15JkIjvidZPNRdQVZGt5h
	jwThxBENALV4SdqcCLkzOilZkPsYeYQnTSremWxD15itKlZySOubU892FElKVa1spTkY=
X-Gm-Gg: ASbGncsC7FfBXht0lZwsAukGtTMimEV1zgmnCl3uQzShSzWt53WPX2v8Q2e4k7GuCH7
	7QV1XqLuT2D5CfZ7lFYbGzp4OmWYLsrUIyEJNG7N1Lzqc8Yxgeoo25QnzKHRGIV/uYSQt1J+K/W
	rPnrHAG05Vsq2/OZfBIS+iwDRuICVFrjAWZPxsVF4ktIT6VRwegif43zZkD/AOS1mXFKVy2LFsA
	4iMZTkaSIn8hxLw/0HDgyVWSbyAo0MM22Kvx8lwYbS/Fz9tA0997BLJRNVa1MZYDMORnfYH5nYY
	qbl/RGqzbPiZa5Cz5g/9RdnK3PYDmL886I+rQ2slRKh3wuEkamUl929YHVbzJSYtFE+nucL1QD0
	=
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5264 with SMTP id 6a1803df08f44-6f8c23c84f2mr149748116d6.1.1747749200024;
        Tue, 20 May 2025 06:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpbUSkwGfbZZniCfNdqu3+I6X+lzhrHJKQURfdahHBBDAeuuxwT7dh2le41RV5OLb0mIkroQ==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5264 with SMTP id 6a1803df08f44-6f8c23c84f2mr149747806d6.1.1747749199646;
        Tue, 20 May 2025 06:53:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f302c2sm2360020e87.61.2025.05.20.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:53:18 -0700 (PDT)
Date: Tue, 20 May 2025 16:53:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
X-Proofpoint-ORIG-GUID: 4PlwkaCBJdN1oK-YqYpRjriPPM_EhSNH
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682c8950 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BA8RXWgV6jDCk_iHtoAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4PlwkaCBJdN1oK-YqYpRjriPPM_EhSNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMSBTYWx0ZWRfXx0HqlMGhSwzW
 taflIKVkLSre/H+JJ0QOZgJHbJMrpp84ob+BtKP/q4YHkMao/PltJBSOGUwwVXGYqhaMQbd3jbK
 DPXOckTzLrPhpcVosMN4hi0oHnCSiOP4yh1s13776MvaGc3Rzbh/SCKznzqr3Y72FejSQQsDWJG
 iltxeA60WjXXuuJCdidGv3uglnl+RJinhz4v9jZ7HtDY8cNBrjT4C5NHEaNOP8gktt+37RmjOFH
 Qt3zI0N9t1b7yimfixt1Lxo88Su9n9xE2Y1b+nt/ueujWNkZ+34LZezlp6mzX1fs8q0s2Zd5ZzM
 1OyYrOtzux/1zJI3Nk80J34DCagfOYqmHYmNPd7edcuyqj0AvqEZlFAZq3Go0H6DTWvPyo3TCEb
 EecpbWH6DYZRN29y3Dp8dbLoUHpweBM0kJcNA4JOvvzrIIQcEgx8mXJwJ6dLYg/raOBwYJKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=933 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200111

On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
> > On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
> >> Add reserved memory region and VMIDs for audio PD dynamic loading and
> >> remote heap memory requirements.
> > 
> > Why? Was it not working without this heap?
> 
> yes, it will not working without this heap.
> Memory region is required for audio PD for dynamic loading and remote heap memory
> requirements. For more info, please refer below patches, it has provided a more
> detailed explanation.
> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/

This triggers a bunch of questions:

- What is audio PD?

- Is it a required component?

- For which platforms ?

- What happens if there is a memory region, but it is not used by the
  driver (SM8650, SM8550).

> 
> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 8e86d75cc6b4..d9af79ff8c4e 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
> >>  			qcom,client-id = <1>;
> >>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> >>  		};
> >> +
> >> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >> +			compatible = "shared-dma-pool";
> >> +			size = <0x0 0x800000>;
> >> +			alignment = <0x0 0x100000>;
> >> +			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
> >> +			no-map;
> >> +		};
> >>  	};
> >>  
> >>  	cpus {
> >> @@ -3863,6 +3871,9 @@ fastrpc {
> >>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>  					label = "adsp";
> >>  					qcom,non-secure-domain;
> >> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >> +					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
> >> +							  <QCOM_SCM_VMID_ADSP_HEAP>;
> 
> Thanks. Will modify this.
> 
> > Please align '<' vertically.
> > 
> >>  					#address-cells = <1>;
> >>  					#size-cells = <0>;
> >>  
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry
