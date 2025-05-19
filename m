Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B61F4CA6
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656979; cv=none; b=hQ7zV8bzhvn2Qsy90fwkRc++g5sohyT6AUejH+kOmppU7zyUKUbVqdIzvZHMEdt9f+ksgSbtFWC1kqN7nJugVp1xowRTTW0Hg8rgRdj0zUQ5/P60zVKPkTV275v8ksbwtHpqLnfPHOgKoNEOnfuKwVkXLaWyQqMv+0XzstMmJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656979; c=relaxed/simple;
	bh=u4G4v/3QWDx7UFXsSJeLbnLzxethnDdnhnF/yuDl88A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDWwOEuNdfgVY8Mpg7iAcpMvmSkYt4GEzBcrHuPAFdB5EwqwgsK91rdjHel3xb9ligMRODiFQ2/c+B2KxGpQns8+7Dj2OL9DSoCMQgjMasyvShDl5NiejbKpYb5hyyaTxkEX/zzQdFYVYqKUUdh2La8PmFmjySWUBuquBP7Lms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0vycz/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0vycz/6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9j7OB023329
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4G4v/3QWDx7UFXsSJeLbnLzxethnDdnhnF/yuDl88A=; b=I0vycz/65xIbhlSZ
	HzJdZQqIWkMD+AWh9lNYeHIMQpSisW3Q51HE6Lm9ZvXoo6XmZD3R4DmHVqPWBlhV
	V9E2kysF9y2xZm4yBj7nZbyAHwghU4cq/9Zd3cN5Vva2r2crxry/NWsZse6PV+rL
	JTNM5R//ur4WxUPn3AIK7iAZF254iPPzzqPWen2N9e79Yf4htVsZbDoyWzYGqK4+
	2T4lyb0EGkIpLiaRcCrWPqC6vGehKRbtw8oVQg52a7bdR3mHsowDjO1dtBAbBGPf
	26RA+2sIxpYKiPb3+SCJTXfUres6F7mVVzA0qM+c288fvq2+/nzwovk+/wEbeA52
	qJkv+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d0d7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:16:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2320ffaa4a9so30728525ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656976; x=1748261776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4G4v/3QWDx7UFXsSJeLbnLzxethnDdnhnF/yuDl88A=;
        b=eyJHyDclAJ1HjG/4ihF2UnsYt97aJ/8j+pY/7ZI0vLpvgqkaHjChXq3wVPgcY6vd+z
         meuz4a9o3J0Jx/ZxEq+cHgHd+EdJT71n3bsdRsrPehoPHG2SwP3uT0OLlO0pNmotFATY
         NVtlnbT4jISoqIWHZxpHhSbCt4r9DJR40hXuUgkeWea9Y7xHhlV4g+tr6Xw6raduIxHk
         J3/WWwPams/Yde3B50W3FrqsQY4vbhOot74veHdd9WvVUrHrHJXkD4GrVC4tWiBrVlne
         aF28Cooenw1khS1CwP2KBIfWFXBJ8rnWDVKOlwt+yoXeO2j+aPYk9cSkWY37kGbD0P6f
         hXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMr+JepudJ6RJkGTccnuq/eHwnbsuvsonb8+KCQ9v2zRZuvqrx+YrY1bKY8Suxq7fWRqgRbCLds89PCVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ocYDwCuCmrm+CYKxYNL+rYd4tbdQQjg4FjkCTm+YMMc55mlJ
	X/MbtrLvhUbUSphTRfH7ZOjhFojLkWVNFYYWXfWGVsBF89mRzXNOafOgPA0vW7OeoQJO9M3v51n
	7XxJvfOrmPOC5NA3qsJBJ/hvp76z84cqwfsOqipnEyhuIZLJzrWzUD2f0Hivddu9beRTH1yUkfR
	cXu+S3Is8lfsfygmXiY3shMc1vs08txLobIX6QfdVBNg==
X-Gm-Gg: ASbGncsHI7/S7SB0JD7i9vJqajrrACgVQkRko5WYP5G1UMaAftbECGyiMU9lEeykop2
	q+KLcuFq1e0rYsRFyBKEXSck0B1f4WsLeOWIOIzNPylJzyUy4y0ZOWbh4aItNw7W6V5OzlA==
X-Received: by 2002:a17:902:e801:b0:231:7f29:bda0 with SMTP id d9443c01a7336-231de5b0ba7mr160018185ad.52.1747656976187;
        Mon, 19 May 2025 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHd8pbYGLE6SycYb8UZ6wrWsr0sYw3IPLE+tXeV+ix6q6M438C0T4/cbceiUfp/qjiHUeu+4uzOdIUmRTLGKQ=
X-Received: by 2002:a17:902:e801:b0:231:7f29:bda0 with SMTP id
 d9443c01a7336-231de5b0ba7mr160017815ad.52.1747656975770; Mon, 19 May 2025
 05:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com> <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
 <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com> <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
 <bpc4tsp4kghqohoxm42qls7gzd5me7xrpodmazyhpvjjlkkay2@paoq5zygczdd>
In-Reply-To: <bpc4tsp4kghqohoxm42qls7gzd5me7xrpodmazyhpvjjlkkay2@paoq5zygczdd>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Mon, 19 May 2025 17:46:04 +0530
X-Gm-Features: AX0GCFvgmiM69A2CqrAIbnHrTDa4cVJKrTijAb5UUN_qj4VtV9AOkvTBIyXtUYc
Message-ID: <CAMyL0qNQWN1ORReZu3wrw_Ex+nAmAJxhTMCt4Jw6PyEN4tEtGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDExNSBTYWx0ZWRfX5kKGnEYGidfN
 u/UBKBc8UH0cD1X/WOjb5dEvx1s8UNNnXJ2bjqnxd1s45zKbYi2UimEVy6sCZLv7WxTaHb7R7Ln
 PGxga0kwUMJ63cSz37pb5uwbpEaE1htF6B+tVs1VyErVztSaYpkkSOiDCE0rII7U9XWDmZ9pBIq
 fpc2PpSbon1PweNSEvYObmBy23aeJr2IHnYVybhvdLr69ne4om6Lhxl+g3JhSV+Wn9gtAHDj09c
 4WxeHhqYf+dbzkTGiT7unMShub6YcOWZAjJ2bUsrfoxBMAAzlzeInpyYYNo/zzKr5Msz8q+An/q
 9vf0aNjJIgtNPnfRPZ8uu5jSwJ8j+zKtpZLp6mw9yfLGgXh9csW8Dexj3id2gvUQYVxsf+SCCm3
 Cd9XA5mWYGJirdugQAkptq60yYsw+c3OdYxgyVxgdunIF+uT8X2dza7lPpJtaEJN3eZscDMk
X-Proofpoint-GUID: VW0wlzBXTZoQ2reeV4X2roTyINuPXcwt
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b2111 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=12gvMKcd2kyX8A_DGUMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VW0wlzBXTZoQ2reeV4X2roTyINuPXcwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190115

On Sat, May 17, 2025 at 3:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 16, 2025 at 03:59:02PM +0530, Mrinmay Sarkar wrote:
> > On Fri, May 16, 2025 at 2:30=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> > > > On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> > > >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> > > >>
> > > >> The maximum link speed was previously restricted to Gen3 due to th=
e
> > > >> absence of Gen4 equalization support in the driver.
> > > >>
> > > >> Add change to remove max link speed property, Since Gen4 equalizat=
ion
> > > >> support has already been added into the driver.
> > > >
> > > > Which driver, PHY or Controller ?
> > >
> > > Controller, see
> > >
> > > 09483959e34d ("PCI: dwc: Add support for configuring lane equalizatio=
n presets")
> >
> > Yes, this patch is helping to solve gen4 stability issue.
> > >
> > > and commits around it
> > >
> > > does this change depends on the patch 1 PHY settings update ?
> > >
> > > That I'm curious about too, but I would guesstimate no
> > >
> > this change doesn't depends on the patch 1 PHY settings update
>
> Then what has changed, as previously it was documented to have stability
> issues.
>
Actually this controller change is solving the stability issue with
gen4: "PCI: qcom: Add equalization settings for 16.0 GT/s"
https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743=
f5c1fd027@linaro.org/

Thanks,
Mrinmay
> --
> With best wishes
> Dmitry
