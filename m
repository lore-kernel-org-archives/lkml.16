Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84A233715
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391358; cv=none; b=hsCADBexjAYeEkDW609Kr1OKh0rJtYkTCuVX5APD3wP4tgGC0CRJ8OY4psjz0qTT0/X82CRxsGsncJQgx+39TVAqz5jz9qFK3W2t0wJOxzvQTjY+eUw69qonR/KG13wrWoGRvt5SKhuvRYnDJZSlfzrQe2PZMeDSK+Akr2BelI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391358; c=relaxed/simple;
	bh=J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVHqk+IYsWNARLXoxK8zAR7AZlKZMQIh3Oc9ZUi9k9sF7LTcJMUQSruEcB1Go3rqZog3w9Bs9TX2+7+Bg1PpAW/Nil71enQ6+M9CqcLnpNmkfjfI6jexK2Sz/XnfQxC0rPGLgWkJWmkgG7fLkJq7ifsycpyWwnK5ZqCK50wLRdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mh5cU1vp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh5cU1vp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3HNlJ026261
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=; b=Mh5cU1vpS2vvPs3m
	P4YI91mGBOx94fN0jt+pAjvNAJY8pzAm+IHgVNi0prP3uD79bxry9ddHpCFlUBEn
	0vYFMkeExKP6IEEKDC9UsNlR1eDJL0N2i31w6PUFvpVoEHbwqPUh3AW3wD8hvCPd
	WMp7ZIteXIOFMz7ybxpRYl9hDjLvhsqZqSAqe+plnZ+DcV/o1KLIw4nSvRFUCTup
	YTEH3ED+urLVoJyVRyTuSeFgQhlbSQ3dOfEYU1ll4zoqpqY/4xKudw4jmte/bY60
	nH1qqz2wlNtuHqzqLr2JQsv4WsglL+ejGwvbcTcEHPu4wk93VJMWvCdri8KJ0H38
	qLLm8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyssrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:29:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e40e747a3so18503385ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391354; x=1747996154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=;
        b=ab4WMgtIvUtzewfMGczZJX6ZJvCm59AqEk0k1WECedJ3fvNHrPs5PmV2tNdz+TnwlB
         ndjp/CnEjCUD5e6Hbfz+4jB8ZzQG7TN9h0anagB89UaCPCfZyNHU0DzX58lNiZ41CqM/
         +9Lo/YkGY1Lv45206uHQTuBFUSCmb0DZyYjheLZvGrPX2g/DHYbhrQ/glJNZoXi50PFz
         uVIgLSEuaXrhsQ5Co3oOoSDVKWoHrpJ5Tks4rKy8dGwbhvXtvIwUPSD/+cocbQF2QpeP
         KaTZinnBU3iqwSMbnrADHbUVGquS5OpAnNBnh+0nvTq+YAZmbHkA5G5/oFhmskb0zESo
         gaMw==
X-Forwarded-Encrypted: i=1; AJvYcCUuRELwken/Hn7/Drx60pPWHTZq8Fc4jePsqAqLxTvcIRmOgXGtTApL1rivgFw360aY8oc1CWHVhycBEzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LbrULQv3NR4qrU9MXnq96EnR+/V1udsZKT3y/ZQRDUj4+5Ai
	idtKi2jaGcEUa5u/lUvedEV4v+DklbZYWbjclOorIW4TjcbxkW0aqi6BDuWX8P6ybqI7EH3Aqoo
	ISdUl0Qatpz2fSjRJK+47mLC29kgAg4/vbkGxV0WU1MRp1FGeiP5CVp3/5udQS1NxwOAinON13M
	vJ7w+U/7LrkKD4nc+DVCAuJOEeJa3ZKCPY5CZqpEJbsw==
X-Gm-Gg: ASbGncsxHdBsZk8naLF+fURvDpiTHvvJkXbX7SS7Jlb/GKMxTxGj9SrsseEvRjl6zhJ
	FuNqFbExgCAhvBycykGGMcyJ++CaGF2Xbj5CEljVTIdwPu2HtK3Glmj7w7HcIcrV18Tp8Bg==
X-Received: by 2002:a17:902:ccc1:b0:225:abd2:5e4b with SMTP id d9443c01a7336-231d43a18c8mr37734255ad.16.1747391354577;
        Fri, 16 May 2025 03:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAc+CeMJekoQFW7pX27l11esuS+Ik/pvnn5IvCnGgOf5pBzK5VCsUKGY1MWIIJgATFPYlOTgG+hSzTf1RdEo=
X-Received: by 2002:a17:902:ccc1:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-231d43a18c8mr37733975ad.16.1747391354168; Fri, 16 May 2025
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com> <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
 <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
In-Reply-To: <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 May 2025 15:59:02 +0530
X-Gm-Features: AX0GCFsiaMZlXOS05wODRIxixqHxUY50BuquyqtK7dKtFH-53SX-bL5lc5kBz7Y
Message-ID: <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: z8RK-qZ752LbgzsTzScMwb8_V6UTcpy_
X-Proofpoint-ORIG-GUID: z8RK-qZ752LbgzsTzScMwb8_V6UTcpy_
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827137b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=U-jVYuukGFQHpZbOjhcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5OSBTYWx0ZWRfX6gt1MxpH1jkT
 7Gk8PNI2u+1ZJuqQfQwQOOoCLv7f5F9hQeWelOrqfktH29QuskCvcazWvzyuBMq2AV7cvRP2nGQ
 a05UFflxmO3tIhlxlixeYQgX/b7w1+f+3hBd841DQJtZRJ+eJme8S3C9hXQYQnW5p01CWb28GKz
 CO6T7XAXa3Kz/xwvpzDglSaKi7yissh0w4JeOC+eiD0KoF4Uaz/WWMO0RqIufHlGTiYWVMNRtYC
 /i7eMYAHHwPAQBeXpi/bBjNWqT7HYT9TGJnCRjG9T3psHQWCM5QTkn+JsWoeA3sfWYw2zy80gLe
 4+lZK+vxECB3zjP4UnwkT1dCChvTnjOdRe5lYNL0c8rUa/3xY+B53lM0y9CS2tPuFC/214Hph63
 7Pkd6Y9kXqn+aRKPmRQVVYST5Ojm/af+JqQOP4W/AleO+gX4FNAsF/QzuFwn7rVsfvQ0XGXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=895 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160099

On Fri, May 16, 2025 at 2:30=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> > On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >>
> >> The maximum link speed was previously restricted to Gen3 due to the
> >> absence of Gen4 equalization support in the driver.
> >>
> >> Add change to remove max link speed property, Since Gen4 equalization
> >> support has already been added into the driver.
> >
> > Which driver, PHY or Controller ?
>
> Controller, see
>
> 09483959e34d ("PCI: dwc: Add support for configuring lane equalization pr=
esets")

Yes, this patch is helping to solve gen4 stability issue.
>
> and commits around it
>
> does this change depends on the patch 1 PHY settings update ?
>
> That I'm curious about too, but I would guesstimate no
>
this change doesn't depends on the patch 1 PHY settings update

> Konrad

Mrinmay
