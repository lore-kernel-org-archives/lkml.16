Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F9278E4E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416938; cv=none; b=PCArNxrlyNHOvVLGvxobxjfsM5d63NsS7tsJMQy7/zihe1o00zp/gs/eutJUXlFwL8IAfuq24GUsRZ5Ys+JGcZ7g+Kq6aQXg0yM3QmYILG37DMCcCY5QT38mKZxZJ2u1VcJQ9t+8qTUeq3JrfBjz6CrkFZptVpzu1akOJnF4krM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416938; c=relaxed/simple;
	bh=jgYns2TOgxV6iqVe1INjn5IHye11fmmfFJEWnM04QMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgpZYxib7IyMlY8fL8/4qx/DCCRJTY4aXFvwEuK7Ok6++cIr9IqzKUcX3z1Q4XSqW7LFUX4EbJse8WvvTE7IUd3FK7mr82rrfZKzeipiy9B6lV40QSP1AjJiAmOzWOe6T1zE1RkG3h44rr4CpQzPjVqWnur8CVlkX89DE0D/CUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX1Y0oNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX1Y0oNO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA9mcc014551
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYqjZBz7hU6e+os2UyNU99kH
	YdkV2CMMguhrFZMkXSk=; b=pX1Y0oNOSzBkw9fNKEtQ2jGfTmi3EKy1e44lqhUx
	8rCOKEKsAeQqotbAIsVbyvjmsUYkQHGCyYDHMjl2SRJ8XatPVyyuuU+hNt4m1+8E
	ocbOFTpSPavRuPtCLrTEMhuMB5TYfpsvdPyFmWdE0FJX9OECXUG+xq+Bme2ycaBM
	LSr7nBc/3z4Wvs71QdBTr9tn/X1lMewpL3id63QZFq0h797QmOxknBjdP7+TxmmP
	qUHP5YuIacD7VLdJ9Sqv8seIXdmy+aPfEMK2T8WNLNY2CewzirF6xR66o402oqL4
	5NCLAmUjr3vP1cCUd8GwUPZUl1COqNz/ZPO3MHoS46+JkQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jarv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:02:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227e2faab6dso57183765ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416934; x=1746021734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYqjZBz7hU6e+os2UyNU99kHYdkV2CMMguhrFZMkXSk=;
        b=PRtD/luKFXmbcHZxQ93nkUcQ6K+6GkXMOuhX3OHTy218vV/uuGpVVs1xHNQXiXKk3A
         xu/xzGk2BRn1NQiM/KcZ1uXoVxp4KRV4MIG06zvYdYQd7klzItFV+Ok1zWlu6YOPcq36
         eoXo1EED6J/ny20kQcnPPgITb6lM0Eext21d5pDA9limx0nXRyP3XetViSBJpdTsyKNN
         iOyzuLxrmsEqHHjnL4kzz4VnlWhYrB3tfyiXsJPQBSrtjlCMahPITDcJq+Ccsa47Pmla
         CGDmCc0BihUlAinOKYiQiRCu/Dv5sKnUM4ejuYjmLr2z2k+GUfo/KLIVcgwEmGCs6mA4
         LzAw==
X-Forwarded-Encrypted: i=1; AJvYcCWelSrFIO7de7IdBNSMDL7KJxkpeLDdivbc1aa3wYtIDyfboq6m+KMif5W1t2t5c/GGybtVHGukAsahjLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdnmXqsGtxZpQBMhrucplqt0VmAxwBL3WtPoLP5zpaQfC7EMU
	gIPYGPWqGQrcVRPGbfbEdcBE/ZHNqQxpdPtHE0ouPDDigx34tFUKpwHSNIFS3NYUd9LGIZsI/5k
	/9ppEWya/TjKQO8L2EtDB3M0tko9Ns5Qje9JvCymF2W8NOyg8u9pdNP3U4ipDgVE=
X-Gm-Gg: ASbGnctzm115uulyg0b5ey5/FkCGBpfQ00SfDm47UarxISF4cSLckQpJwlbogqPUObX
	4bYJPt7doIgGzAcoLjxT/r4MQ3wMpC23/9ty6vmS22CrKZCHk52zkCGUmg3qXjnDdjBUdzXa/XD
	HdDcZNt6MkKSLHa1YPDOaEASYmGNxBpVAPUz8NGrjMYCo3cjvJCRbaORZexNQIszQRk+ZDAcFIm
	laacJMmHf/KaApdfS6qIQWOHWtcZFM40HDJ2EHi+KVOZuLyda4NeIz5hsZ0JNR+SfX6xn/6utY4
	On/CGPkMdSk3wV9h6Taal4x1sX2ZYpdJkgW5Rxm8QWXIonsagOtMfKkDRoqfR45nlBLPLnud5Qc
	=
X-Received: by 2002:a17:902:ce82:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22c5362f549mr264884075ad.49.1745416933564;
        Wed, 23 Apr 2025 07:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+ziVnPKv4cdqoYsZ6mCeKLxSWMY9yJ/8U2DEVsr8nbd9+zcUmUcrvDat8ktMBosIr26XTKg==
X-Received: by 2002:a17:902:ce82:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22c5362f549mr264882975ad.49.1745416932808;
        Wed, 23 Apr 2025 07:02:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e542496sm1523096e87.99.2025.04.23.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:02:12 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: Deepti Jaggi <quic_djaggi@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_psodagud@quicinc.com,
        quic_ptalari@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: add initial support for qcom
 sa8255p-ride
Message-ID: <agbftnk7uqj6e2zyw3igxlp3cctl6xhk6ix4gp6u5dot7nf3fm@cipkx222ffo5>
References: <20250422231249.871995-1-quic_djaggi@quicinc.com>
 <0482cd6b-53ca-41eb-8721-a83ce8a7c733@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0482cd6b-53ca-41eb-8721-a83ce8a7c733@quicinc.com>
X-Proofpoint-ORIG-GUID: PNILc6699h8033gQ95p8vFeuuy-nS-XQ
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808f2e7 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=_kXIXTmCewcQjYOuEkEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PNILc6699h8033gQ95p8vFeuuy-nS-XQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfX3B/HcnOafCTL jjJT8z97sHc6fnERTZ3Glt3S45sS/25TkmYMG2gN6zdv7QAqSZOg+1n13FJA6iEv7UjFzFwzJDf H/5iI/m7QJI90aCAXPyEo9mzdFfgHD+lyFEEtDrOoFV2igCRY22jBYu9gQBLceu1FlE6Dkz/F7W
 Jk0qUBytSgdVfdWI0JIciiZbkhAqk4tWQJMlqKKLpTp2q4oDx97Awtq7r/IhxwgP+ck214A4VGu pF0ErG480SVa6k1U0uPQJl8LtrzO++jD/jiIA/CYpUOjrARGvyxGTW6wHKn21DO4FdTJOakSdGl BhZbD2Qq7WAzu15UhtsabN9TxaA7vsYdw7phFdjBpC1QnPMq5JiPz4aBiBJm5YmJNnzA+04zDFH
 S5E6nArxYaPZkUDV7jbVB2S7oIyuRSgutVOVPFwLLwsnXeHkU2W4jPTnmOO3DNMI0UCYKasS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098

On Wed, Apr 23, 2025 at 10:16:57AM +0530, Shazad Hussain wrote:
> 
> 
> On 4/23/2025 4:42 AM, Deepti Jaggi wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > This adds basic support for the Qualcomm sa8255p platform and the
> > reference board: sa8255p-ride. The dt files describe the basics of the
> > SoC and enable booting to shell with ramdisk.
> > 
> > The Qualcomm automotive sa8255p SoC utilizes firmware to configure platform
> > resources such as clocks, interconnects, and TLMM. Device drivers request
> > these resources through the SCMI power and performance protocols. The SCMI
> > platform supports resource aggregation and handles parallel requests from
> > agents, with each driver having a dedicated SCMI channel for communication.
> > 
> > Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> > Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
> > ---
> > This patch is dependent on [2] for booting to shell and DT bindings.
> > 
> > Changes in v3:
> >          Removed the patches from original series [1].
> >          Added arm,max-msg and arm,max-msg-size DT property in scmi nodes.
> >          Changed max-rx-timeout-ms to arm,max-rx-timeout-ms in scmi nodes.
> >          Updated commit text.
> >          Reordered range property for qupv3_id_0, qupv3_id_1 and qupv3_id_3 nodes.
> >          Reordered vendor property(#qcom,sensors) for tsens* nodes.
> >          Changed cache labels to lower case.
> >          Removed unused i2c,spi and tlmm nodes.
> >          Updated reserved memory nodes.
> > 
> > Changes in v2:
> >          Removed scmichannels label and alias
> >          Modified scmi node name to conform to schema
> >          Moved status property to be the last one in scmi instances
> >          Changed to lower case for cpu labels
> >          Added fallback compatible for tlmm node
> > 
> > [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> > [2]: https://lore.kernel.org/all/20250418151235.27787-1-quic_ptalari@quicinc.com/
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile           |    1 +
> >   arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi |   80 +
> >   arch/arm64/boot/dts/qcom/sa8255p-ride.dts   |   94 +
> >   arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi  | 2440 +++++++++++++++++++
> >   arch/arm64/boot/dts/qcom/sa8255p.dtsi       | 2075 ++++++++++++++++
> >   5 files changed, 4690 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
> >   create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
> >   create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
> >   create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index adb4d026bcc4..7437e51e5849 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -134,6 +134,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
> > new file mode 100644
> > index 000000000000..b00c2b05cef7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +/ {
> > +	thermal-zones {
> > +		pmm8654au_0_thermal: pm8255-0-thermal {
> > +			polling-delay-passive = <100>;
> > +
> > +			trips {
> > +				trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +
> > +		pmm8654au_1_thermal: pm8255-1-thermal {
> > +			polling-delay-passive = <100>;
> > +
> > +			trips {
> > +				trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +
> > +		pmm8654au_2_thermal: pm8255-2-thermal {
> > +			polling-delay-passive = <100>;
> > +
> > +			trips {
> > +				trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +
> > +		pmm8654au_3_thermal: pm8255-3-thermal {
> > +			polling-delay-passive = <100>;
> > +
> > +			trips {
> > +				trip0 {
> > +					temperature = <105000>;
> > +					hysteresis = <0>;
> > +					type = "passive";
> > +				};
> > +
> > +				trip1 {
> > +					temperature = <125000>;
> > +					hysteresis = <0>;
> > +					type = "critical";
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> 
> PMIC is handled by firmware on this SoC and in my openion we do not need
> to have a dedicated sa8255p-pmics.dtsi only to have thermal zones nodes.
> Can we keep these pmic thermal zones to sa8255p.dtsi with other thermal
> zones nodes ?

For the PMIC? No, they are not a part of the SoC.

-- 
With best wishes
Dmitry
