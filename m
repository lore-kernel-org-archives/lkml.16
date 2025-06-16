Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3F3285C96
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078381; cv=none; b=NzcKS+GX77qL7NTYeFEXyhzYGz8wAKSdozY6iyhIrcNyeVmEp9AVOZlDjeeFIOTB47386w36K8fGbIeifHL9l/L2FA5522W0fQX6Y1xKvHsKSIDCiCyc7x2Ydq7wwWnq19wHfTzwaSfSGLaosZhk4137lFlAKXt99dLwH4bmxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078381; c=relaxed/simple;
	bh=xDo/CFd9O80cjbXr3irb8h8miFyh3mpLQ44oVF5ZXVw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFu0Zf0ffHf1TeXq7TNqJsPyScYjsJvrS5fvMs8raPCdVsfbKQIJhzd95CxfGpU0u/X6g9vfIDKcUO2a3pPVexJ5qcSzupyRlpqwYHLBnrk8WB56HyVy51UNuoEzYSI2Iqe/Re9g62G3Af4ne98JL0Ywrq/Ryed0/8c1dpPCf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLAFIxgM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLAFIxgM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8aLFg002625
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3KaQaSQSjoPXPxix0wFVI/K7
	2pUStJJyIYhcrvQzs8U=; b=dLAFIxgMECezCzCS9OY0D5uNzeiMkztyFQR/SAeb
	7IPY6AJG5N7oUpmMDS9TmSnnUIYXDUxBE2/hpkoHDMlSHyDoOHErAcJFOSUXi417
	JZ2eLoo+eYyI7i9ffDBB9Y17arBk3aQVT0WkHZ5BQFiD+UU0TLmILfErROT5dabJ
	rbFudxOTUNy2IgNFcHDAcLCS95YtImAjwRiQrvdCUbU820lULhOpWRSePM43FBnZ
	8+g/JlGxu6zEPd9Vpf/yxjlqLxd/7hNzDDUWALnegko5g5Q21dWZKsbKg4bF2mzn
	zSYmQgm8xx7iz4FH3xkqgggTNQiJnbD0Vd/ge7dcO8njvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvh8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:52:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso57056716d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078378; x=1750683178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KaQaSQSjoPXPxix0wFVI/K72pUStJJyIYhcrvQzs8U=;
        b=kJ0A+mC3u4db7ibEUQRAsnqWTMQyb/nz46U2l7ozmNyd4XJcjYHnw5aHQKMb//loX+
         Ucv33d7FTIZa2O9xeuwJLaLPWq/zD89tv6Pwfbo0gtwoh+nAiqBHR8yDbD/ANefW6hul
         7SD6bJm5sg3ULGXVGA7WcSfHlQb7id3i6eB39bl/3bN1vt6LlSpEm5DbXp8DxbR/Wf/5
         dsdE0izCY2RoX+LG2CxaKP9tfzmU64fmiH+Zv7fCWyyb8K5dau73EynULolegLvoKrGz
         rAqRnoD4rRB41iQAXw5ehvPZk8XgFTOs8kU8nqSzgTEMTCrxQW43Xtr7rHTgZzGH7Oby
         wBSA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRmyX1qyzM3A71NbffWR1JtaiGc4iaoujwD23HE9gcmEnVIYu7rihGKV1NkW/AJthNIDcrk3tlBFOG/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrlfMtxm0kByv0lSOwdU+TCcTnf1yvaCFXoUSoOfUKyNlmucB
	fKl3GRfZJi4/8m0nfY3CyQT7XTPomRdg0lGA3JF26RQoT8go3DEej4GVmhQghZnieeYiBd9FvE7
	47CVoXqjNbP2ZOPI9p0jA86dKw0PVqxp1iLJ4mN8ynQ+ft5y6P5dJ8EMUyYzURthvhcs=
X-Gm-Gg: ASbGncuIUIBAJW7IuXK51kKocgmPXd0vL2HHw+ljR2HXzfQPikqLTHHblcxI6bsDpU6
	wwxYu7ioe+Nlh4lES4WY2xVMLjo69qadSM+V6t55QjkSsFWMCuPtcQjRSoKOTnigU/QMiK6skiR
	K6DonjgiIDXcGb7Q9WneZu5OglYHKCjlPdonhI9lz9Is9j3W+/zfzS+QVIzXnv93/hkF69V7D0O
	gLhkUpLeCsLkvh5HM16fkeBR325KI1tkf/NuudckRRyRogoPpjZ9bF3eR63/0nT2Uo8cgV5Xd5F
	vQRzyhOmpu4VYz1eyIigcFsdWyp46471u6E3gTw5m07QjruAgaaJi4PjuQ==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128592116d6.16.1750078377836;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+OFLF4t7/ZWk0HbQ5uqeqFokxTATjRvaApyd+ckaiuS8GwJZ2WNkfZTT+6OXd0WtcCQEi5w==
X-Received: by 2002:ad4:5e87:0:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6fb4772a019mr128591716d6.16.1750078377401;
        Mon, 16 Jun 2025 05:52:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532f2ca228sm145532895e9.13.2025.06.16.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:52:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:52:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFATp3zoSgkrj3YX@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MCBTYWx0ZWRfX+43RtszH33jS
 1ZmlY4e8j9vN0n6BSdDAxMEsnHlsPhw/3aiP1quQma77Ov9wy1D/A+zB06yyvTplUzQNknFs1P1
 vafH6Lqu4XbUgBJTats29c/gW4w1e0vLGmTAjA5nuIkgsNQpNrU4Fm9Sswvwb4lAJobhM/YWjx5
 qWvAKF6qQsmkRnkLMkrZkRw6T5xBouajyH8w1sNOkoeZjQJG5gLT4eDPZ7Ph8HWmIUAphelj/SI
 BfZSzZ1nEZ9NPC1/bFYp5YBf7hNskdtjTaqotFv32tgiJwuBVh5wzIwrybebYbhAT/JBUrlOMtv
 BfotOufKWckxvKa87hopVc3EVIl7eK4/XCW+IYy8unuFMfLseAyAFA0h0GWZc6jun423z0wH1mJ
 NPekoCWj0nAC2r2JSzBEwLBdzSkvmHe+yzvCzsub/UVzid/cU4b9hcdCoDZnXZvesoW8WWDe
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685013ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DAQgPmeqjGmo1aN9fEMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jKYnyaRNSh36QA99TLMyDMHL4Kc21fd3
X-Proofpoint-GUID: jKYnyaRNSh36QA99TLMyDMHL4Kc21fd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160080

On 16/06/25 10:20:57, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:03, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  .../bindings/media/qcom,qcm2290-venus.yaml    | 153 ++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > new file mode 100644
> > index 000000000000..ffa72f1e27f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > @@ -0,0 +1,153 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

ack

> 
> > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,qcm2290-venus
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  power-domain-names:
> > +    minItems: 2
> 
> Why is this flexible? Either you have two or three. Not mixed.

please check 5b380f242f360256c96e96adabeb7ce9ec784306
