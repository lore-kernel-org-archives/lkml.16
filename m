Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E933268682
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916235; cv=none; b=HHU5hGyRWrzmSFEcwrTmy7OPQeXghQ1aFT+Piw99WcBSiPUD0iNu/6Uqi1KJr7Tuie5Qd9BMq4y5Uh/J28jBmPcHXaTAyAIvui2wBA3JG9yk0NNaLGFKl9NisQ+69CKDK8Bo41ZcOu7Bi8ZIQHgYgwWkcu8ihJygu7TGS8AQfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916235; c=relaxed/simple;
	bh=r/iDDrr0XfmgJ4JFhFolvnmGEfB4M3tzmf/f8qCwh3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKsXPYYIzw7lKYo0/rE85URvgqGDIrZ7hRrs621iauEBnwFAei24dOzz6gaE3AJZVz1CVs/CDgr/4ry3pGVdisiCdOzIPV0kyBblGEuYdHMMNUvGT+iJaWfC719jGJNQDWdqTYXi8FrwRqr7ITpxnMZ53QStWsoz+kJed+yoasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaiO47So; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaiO47So"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8F0gH001758
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTNm4E8KMM0tOBGRYkPHrmoGvUWhWy8i+SlbW2+nzf0=; b=gaiO47SoPG6ZvyJ7
	1hr+FM+TAt1xz+OGeIDb3jozC1jcNU4wd5iAeh/hR8F+unZn90CwTjE0zM3NmUzL
	FoWycWT9kXG33zz/fBACGEfTiuc2PScGJL5Gy78Os2MYpYoSr34k1zKgZqCEmIeG
	67LhAyu9l3WR3eCcyChOXwLg7XUiN3ArzbmMDWVYMxspmQmvmwKQ9FB3o+RIJnKQ
	sFw1IQoDP3IBD7dhm9O6DN8SVaWig+KXfZQjH6E8lJ7Q1Ilz4eHJ0lN8pAkYHSjN
	lmaSWmIXNfKOyYXIOo3khheo0akoyZad9CDoVJAL/7x7vGwFDUAFgfFJHuD4vwX3
	/1+6yg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6x65g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:17:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2321215e4c1so48299685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916230; x=1748521030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTNm4E8KMM0tOBGRYkPHrmoGvUWhWy8i+SlbW2+nzf0=;
        b=igX/gE1RbNlAp98bcOzR0SWCWv12RulAcol+f3aJvOPaaqRZ4FOqRswqbNEqUuwgpn
         XXGfgyn/fgY5UqR3II1tyQ9CoFa42wCgcqS32bIisb0yqB+y+1IpZSFCloefIrAiryhy
         FIZKKI4JbIYD1QwUv/Jqi3Q5+5yAffH2/3FbO4aR0DriNDMz3zfYbDUYhTm5FlL/Uhuk
         smHS4L+EwsybO98x+781e1Dzg1Ks+Hynqwo00kT/171GDRRu/Zuf894JnUX3dAa1lKlA
         GxwuWRRv9OnCjm1hRLow4SLvhP2GVWluqQDtDM0bIp+75Cpq5ZUAsYI0S9Izd4ASHO0j
         McQw==
X-Forwarded-Encrypted: i=1; AJvYcCURIrKdbDiWbjjoasrw84IXAyPKsW9cD3X2W9J0NFHY6iwAjY1H/upm3gVog8ZrmtGxdm76pQTicN6c3cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqCveiGiUYC7fJmjkMQHVEZziP4rLvMOywRa2XVIeWWWC2T62
	zwz7HcUzpq0o61eO0hLe0XdQi+hazrZN2BWxoQwA64DQ2Z2/J3RQ5jgkl9OhzSYq6sH+FTx9PDg
	1xlBnmIlldOa6y1TxtOYJs1714WdiOdJ0o+wzgN9hKur2w8b2paQrIuOjUIqvNCIZMX2kTNf78T
	TNwReVfYEFZMbDoc2jlP0oKMarJ3hozHtJTi/r1oXkzQ==
X-Gm-Gg: ASbGncta1l6YpnFazUTrR72cDNXPUUjNafMEtgQWV26HFLaB8d2i5yzuqL+0f5uWK5v
	bP9J3hgkS+aYc95JZwPvFQPk1IGsME2Dh77oumZogAzJqj1ZgJrmuQY846gprRoSlTw42NGVWsA
	eHNThf/Vk=
X-Received: by 2002:a17:902:ce90:b0:232:5d3:aa73 with SMTP id d9443c01a7336-23205d3ae44mr310121125ad.13.1747916229923;
        Thu, 22 May 2025 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoSLXl5/4cgxXoGRMtvVyt7iK7+o/RJ/VrVLSgRKQy9k8zDOJHOO8r4gvb0ubtnF919mgbZwicxDSQ8BkmA5Y=
X-Received: by 2002:a17:902:ce90:b0:232:5d3:aa73 with SMTP id
 d9443c01a7336-23205d3ae44mr310120615ad.13.1747916229543; Thu, 22 May 2025
 05:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com> <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com> <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
In-Reply-To: <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:16:56 +0300
X-Gm-Features: AX0GCFuDjJasRehFewEiiJw-x3UccHeyPWTYxkBPQlNLcvub_E3TBxXS5baFHug
Message-ID: <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for audiopd
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: T3nMishFic4G0gNTwhErdYGGTiMjQMCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX0GS76dttt24q
 5u4AO9ogmGk6XpX/HkPJMI7n2yxhSNWHepf4a4Ni7mJ2wfpAGjtKyahMrrovkCCpZX8M6qGQ9N9
 A00I7CRGe/MTHOGdBWR1GgTL3knoA+V6ayjgTEVJo+YffUIewIhE14Tb/K+JHdV48ZwLUz3O3jW
 iD5YWL/MJhghUGF21/rRkTHsqgHXn6qY5LuHGmJt038PpXM2hPgytS/c9ZBzvkxXPDGd34Lh9CN
 Yk6g5Pd9XHnxe0VEayC2vbPMkFp7FgcT66n6h156N5+jPhjvVVJJoGQhJNiDw38DVl2BanOkWzp
 ySSzEsWhrp8b4DD9oMIEsOh1TKn9NlfqSFPSQUWxwPje8FLrryN3NvfsKT8IguCLvd+Gg/02O7V
 xFR7s/w52AQxxJisRpZ14kBGNm7b7Ba8rcHDRjfudC70HHxZ9e4WK81e2LKlgPbd0xpZ1tIY
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f15c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bh7bGpV3_KY8qhbZdMUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T3nMishFic4G0gNTwhErdYGGTiMjQMCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124

On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>
> =E5=9C=A8 5/20/2025 9:53 PM, Dmitry Baryshkov =E5=86=99=E9=81=93:
> > On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
> >> =E5=9C=A8 5/17/2025 5:47 AM, Dmitry Baryshkov =E5=86=99=E9=81=93:
> >>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
> >>>> Add reserved memory region and VMIDs for audio PD dynamic loading an=
d
> >>>> remote heap memory requirements.
> >>>
> >>> Why? Was it not working without this heap?
> >>
> >> yes, it will not working without this heap.
> >> Memory region is required for audio PD for dynamic loading and remote =
heap memory
> >> requirements. For more info, please refer below patches, it has provid=
ed a more
> >> detailed explanation.
> >> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.q=
ualcomm.com/
> >> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.q=
ualcomm.com/
> >
> > This triggers a bunch of questions:
> >
> > - What is audio PD?
> >
> Audio PD is a protection domain which is running on DSP for audio
> specific processing.
> > - Is it a required component?
> yes. it is needed wherever there is some audio use cases where
> DSP audio PD dynamic loading is needed.

Which use cases?

> > - For which platforms ?
> >
> For platforms that require dynamic loading of DSP audio PD.

Please be more specific, we are not playing a guessing game here.

> > - What happens if there is a memory region, but it is not used by the
> >   driver (SM8650, SM8550).
> >
> It won't be used.

So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?

I'm asking all those questions to understand:
- whether this is applicable to previous SC7280 platforms or just RB3Gen2 /=
 IDP
- whether this needs to be backported or not
- whether a similar fix should be applied to other platforms.

> >>
> >>>>
> >>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/=
dts/qcom/sc7280.dtsi
> >>>> index 8e86d75cc6b4..d9af79ff8c4e 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>>> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
> >>>>                    qcom,client-id =3D <1>;
> >>>>                    qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> >>>>            };
> >>>> +
> >>>> +          adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>> +                  compatible =3D "shared-dma-pool";
> >>>> +                  size =3D <0x0 0x800000>;
> >>>> +                  alignment =3D <0x0 0x100000>;
> >>>> +                  alloc-ranges =3D <0x0 0x80000000 0x0 0x40000000>;
> >>>> +                  no-map;
> >>>> +          };
> >>>>    };
> >>>>
> >>>>    cpus {
> >>>> @@ -3863,6 +3871,9 @@ fastrpc {
> >>>>                                    qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
> >>>>                                    label =3D "adsp";
> >>>>                                    qcom,non-secure-domain;
> >>>> +                                  memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> >>>> +                                  qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS>,
> >>>> +                                                    <QCOM_SCM_VMID_=
ADSP_HEAP>;
> >>
> >> Thanks. Will modify this.
> >>
> >>> Please align '<' vertically.
> >>>
> >>>>                                    #address-cells =3D <1>;
> >>>>                                    #size-cells =3D <0>;
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>
> >> --
> >> Thx and BRs,
> >> Ling Xu
> >>
> >
>
> --
> Thx and BRs,
> Ling Xu
>


--=20
With best wishes
Dmitry
