Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD522FF35
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809303; cv=none; b=Eb0SQeX2qfgz0IkDYuWNCUMy0lU7xmJmYB1uTp1i/K9BSH6drIox7JSadI7oeuz8XwnpazGE5P8WbipMgioQEJILRo9NlARsOS3ebyFm76OXlbL9ZJpyr62nxaqYEZxlCBLb511cZTjvVwN1YrcdE4kmLEXWf/+ZveKrPQ3X/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809303; c=relaxed/simple;
	bh=yX5uXk8xZuF8KykN3btTAQn+eR1OpEbcKHd8ywumTVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrfVGOg3QOnrFFNoOjfwL38w/XTJM3VSdS9r7mlydq1G2PpCCTdDbWKDLBi/W7Y+uYU8nPQ67xOKczzBt4iSLgc8cBIbZMKD7EKJLSOjhGTWztjntxB8qFK3a0zqQlnR4u6qErNNfuSyeV8gsaAohI9M092B0glf05+la8QzTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+H/JhV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+H/JhV3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5xUt6013462
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=; b=B+H/JhV3PLJpUBSs
	ILfVntPasJvRg5MuEQm7m/GebKraXecKRXtAvjzKBr7HD3t+miPrGSQ0B52XA+s9
	a4HnxK3IaPuR1r/2ZROJZvQy1lH+NvXJypDYDRxR3DQOpI5GLQ7UJyXbgYSMT0wn
	FwSJTKzCdUlJj/xVlzjBV5u8Ltlob3RztSKOgfNbT90r9LDHXeOGyBpExc5iXO8P
	khTyGgePcFVVNvEA19V8rFkRrUguEZtsU+0m1INgf/tH3M01ghw9xSJwruQvBdI9
	uU8MzoPqLSJk4zggSBT/RGdm3k1BElqhMKpFLGiyHA+ruqUVgRXYn2+o7w1UwKo+
	cDWRBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tg2yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:35:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so1143464285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809300; x=1748414100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ9hKputcd1338BrnRNmVIdwAO2+8E1/p45jvoCFYRE=;
        b=VeZw4WicA6wuOhPvWXFKOrDNQ34JV1Nf0DxQog5x1Xekew8qmEXrBLsOrSYTJ4m/e8
         ZIavwH/hU72YlDSFtE1u9GT0d/XlJirpZnGF80BX2pftoOffBNhBy7MWYLcySJ8h6n8B
         VNITLReF8DwgAMWXsyEwkGCIn3peWVTfCUR5PujN0UMj7bhq9+oDVrITzhPdIyFucLdl
         e6F0VZydhJygPD88LVzvRUawU68YM8rAH1zaIEJQbMOaRoDnTESO1RS/P703cq1WN/Hq
         5bn34PEWhFeF6j8HiWwBfkyJ3Ps0xoZ8E3MMm0F8PqfejMQsKkOk7VEBlid2j3FdJSgz
         Xu9g==
X-Forwarded-Encrypted: i=1; AJvYcCVprcUYWE8So2UdeOi+Gmq8O6C9D1HOZGcjNk4OCmkjGDOCUBIhU+v6yP0CyQdQ/55uZHAMMEugxBFz4Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3XHg3ZIUFxxV4Q9UDhrjjmt6hFhHqURLJSo9Eu+H86wePaPf
	Z/gxgDOIWRjmc2RrArxvpqczFZeTm2Ths7X61vfB0fc4hYR6vZhB8S79J6N9c5T0z6rFvNm+M5F
	qo9s6ADcv0SR28dV0EX9oEaRIW5pF+4ITQE1vKynV6Bjh66TuNN1hhse8W4jq7B7BS6T/Fac5L0
	HtBqRhL8Q5QYOse9uiH6htGMJxiOgo24SqUMbyx9r6vQ==
X-Gm-Gg: ASbGncsJD02ViU9Vj+yJWp6GkoXRusKPJOFy3PmwoTBkSKjCYhGRIhGxwRzqr4RmADP
	qLG/+FPddit791zi6H6y12PJhKZprykhYIhNcrA4WmmFVnqXR9Xd54cd5NEn+7tZt0P0Jrw==
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id d75a77b69052e-494b31640afmr313606801cf.28.1747809299966;
        Tue, 20 May 2025 23:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhL/8XUvaTvdbPP3M/jAlhpC+jim7euSMn6JxVG7/tX7Zqm2OcngXdvkAaGGLBTeDl/gT4n33IPTAgb635QxE=
X-Received: by 2002:a05:622a:5c95:b0:494:b316:3c7e with SMTP id
 d75a77b69052e-494b31640afmr313606551cf.28.1747809299623; Tue, 20 May 2025
 23:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
In-Reply-To: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 May 2025 08:34:48 +0200
X-Gm-Features: AX0GCFugv4ozE6oN7_Lq0Cwf2qtCI-Rj0snyB97U0vzVGF9Yp5a-qiJ_uQuP00w
Message-ID: <CAFEp6-26HVokO-0+HEUf+cm1V7=OO5z1ndP7zVAk=Qk440Qviw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, bryan.odonoghue@linaro.org,
        todor.too@gmail.com, rfoss@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682d7414 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PPW_EwrsXE-T7dBlnmkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kySnADiKfzWyNl9rIn9RKkK_MiGHjsVX
X-Proofpoint-GUID: kySnADiKfzWyNl9rIn9RKkK_MiGHjsVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2MyBTYWx0ZWRfXwxKdTSnr3qJG
 8+M+ET8TdM+knnfjc5HfbboLbElJO9/mjeh2rrP9LMNXE4EjfKud6mwiXaiVYUmM7TV3d4MoBnM
 ehStLYCHO0shwJLp98f397v2sXI1/6YBJC67nsWwdkGLFCQmmo5RInhR/CpcgNwdkG8jJpWpMN7
 7D1/nRq1egxh/Btq2VZXDiCqLfr9BJsxC6r8tgziUMbZJcTtHtcuY/GVSICItyFATx2uAIAi0ra
 +Ky2Q2N1hXPnt2V9VtqYhUVx6feWnyj2Ck5lvZLkKTPMimM+bE4vzeNknOLpCuDXCGhKdfh/iro
 csxox1DNp1ggvHGjp8nyTxxR9dTuz55tzWoTqfyN3KksPzVVllhktttY/G+IZmHT/yyoegUlCL5
 9O45nKbSqjWEtPItJ7A4ELMQE24pTBPFuOW6GUeLLUeDxAwll4OkKWDT/+FwHp/NzzIzG3MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=863 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210063

On Tue, May 20, 2025 at 11:40=E2=80=AFAM Wenmeng Liu <quic_wenmliu@quicinc.=
com> wrote:
>
> This change enables camera driver for QCS8300 RIDE board.
>
> ---
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
> This patch series depends on patch series:
> - https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quic=
inc.com/
> - https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quic=
inc.com/
> - https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quic=
inc.com/
> - https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quic=
inc.com/
> ---
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/=
dts/qcom/qcs8300-ride.dts
> index 3ff8f398cad31a36fa46060855b075c8c2020aa7..97281d6d7376a406e5c31466e=
175358b10441256 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -207,6 +207,10 @@ vreg_l9c: ldo9 {
>         };
>  };
>
> +&camss {
> +       status =3D "ok";
> +};

Same comment as for qcs615, what is the reason for enabling camss
without an actual sensor? If it's for testing via TPG, I'm not sure
why it should be enabled on this specific board.

Regards,
Loic
