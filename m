Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DBF1F9F61
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751815343; cv=none; b=TNUdtbswcBo+HXxJhfNzXsBnLQCCCnkvgUOiv9aymaPYi9/KkVpYVmhC3CrEeEJfcJG06gdlRS8t2WGxLmYMxoYVGsXi/6XySomSxkAHSasA4vTKYdQKlszad6gJhiFFszI6UWngbrWHXBgXQhxzMKM40VekF0/BpVI6Trw2Hug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751815343; c=relaxed/simple;
	bh=ezpW7ldJRIC7Zg98MoY/zC+5fz3i6rhShxcE+Y3sVFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ5kNxuqrV0bQfr4CFJAYwXj3sCGhwAXqQICfuydpruVPBEEGW6XSVPAMlohkDs5JWfvMRTr31qHxx+CJsTEheBraoArLeMRKhxAhNQoY3dDRMjwry4IACRR7keHn0YIWIKvRLwaxjYRHmu6+KsXnr84Lha/jvjcuKdFv6LWZi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq5x2Ava; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq5x2Ava"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566E0MsY032296
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 15:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=; b=iq
	5x2Ava7fg/Abq2+gXbabN1H2M8WGVoy/wY/lgL55PSd40jJVxI/OkDwcKvXDgC48
	uXLuFdJ8smq3AXiB07OBeoBC6vonR01VS+Qrbs2HCONFUUXSUPPCaKDtIoH+17pk
	wt3HuCUTn8nrx4h8s7oEVwpH2oUalcK/K9H15OAQei/DtmqhGtmvhbwz0xMCuSxx
	d2C3PFUh11q8ekBxQgOnwBeb/qHknHNYsrAsamzddZ9MyU7gI2u8+ypNm9MmNMm2
	cH925qy8ijBMO5DGJ0VOCDTBQK5NgKo/DY+0r/6mWvcY5LEGX/bYmau2czI/CKy8
	TsC2Sqxf/adf02cBen1g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk4xbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 15:22:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b4aec861fso2179720b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 08:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751815340; x=1752420140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=;
        b=aVLtMt+yPEW0Wl6kKnIBRV/y4CwYBUJVChDtu43brfZFS8o8PrIXBlRIrZyVRXA64a
         eeIDhbylW0tRCNT3cfyg+DBzKEG0hj+7Z5HCLCN907WcqCQ/FxxWM/gBg8s4fU48YByM
         97IDD++9gMnIcJWxaSV1CPA/8/mR3krehaYdiEoidnB6dMjbfH/bAYI0Hn5uuWd61rU3
         EDo0+vmDfJI0JuYk/TqLgQCoYDaUNHaNXNGkcaxeDEdXB+taL0xKcepdyU1X9lq8bk60
         53gDpjKts+VRsd/Xt2oWfNPpODKM3OWH9Wh0kqq+yDmT0X6GTAjuMVRtas13QTfTFzRu
         HTrw==
X-Forwarded-Encrypted: i=1; AJvYcCUSxE1fpeCE5CRnkx9qBovN65Frw/kx7RsrRdv05tvzvwpug5qZ4bXo0XCWJAbnar7u6okk/x3GNbetxso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTpiTovYHyYDUIUxvWnVflzN8xfpiouZYsoA3y69sWlnLMGwmY
	siCs/ApqjKM5n6cy4W/wXHUh0u9XkWCA/2jTrKadG2NUH9IEND7Th9Rj+8rZddHG/uxogoB3/Mt
	W4v6TstQnbxgSm2Ig2V1ZiUp3D4vRvaDBvuOCzkG3cyFJ1YZ5QicQX1dFF6/SdUic7fy5V/W1Qv
	S0mIS6YqMn8XFXonuNHqroItQx4P3boci0ayVZvuH++A==
X-Gm-Gg: ASbGncuJqWPy6TdL+dDoDNFIF5iKMtfRZ3efmcZPjAX+/kKpo2n0MfOzEEw9He91nwc
	me7p7Vm2jCm1A7oAv+W5alpPTqZ7NWD3vtxmmOg6KFzngzaLz7n39WB6KbYjF50JLeb5vMmI7Ae
	eziWlmD0RMYkIvtm2n3ApKy1OQLDNPqtfE6gg=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id 5614622812f47-40d0408029dmr6005854b6e.6.1751815340291;
        Sun, 06 Jul 2025 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxN5stcqiqcPo2g1epxKXVWRAu9xnt9wCI/M+/z8cfp/TkVVmdNUI7ChAXSQYRZd9Fm0WeEV9i0r3aCpJJxjA=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id
 5614622812f47-40d0408029dmr6005840b6e.6.1751815339964; Sun, 06 Jul 2025
 08:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:22:08 -0700
X-Gm-Features: Ac12FXxI38B9CTHaEggfS4VF8kbtpv5xLzWFy9U-kVeIYoAB-mrVEghY5jOxv98
Message-ID: <CACSVV01acTdzQxu3nKYWPzgJhBkfZa9_jvhSVMHRBDH2=wOHog@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dus0aFGLzMidrp4l0RBHfRBp2x-txYbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5OCBTYWx0ZWRfX/McAzISMXjZV
 YdD8sKykT6DUkN5aLe97AxWmYOhx54jCxliyARg8mXJ68Ld8+DNd3w8+i8pt9Rcf+nvKQ8yjEe5
 kip4DmVmw9n88FnTub/GzOdTwtx6825DFw+umEegkCsxD+3KGr91Zu9FBqSWK0k0F1BcxM9HqJA
 SuiP4IjQRzR6KJA1v4o640UEPhWeJhc0Bd+LN0ytiTK+ta8t/gSPgzLmEPbcL82k3PKShnglnDj
 Txmv1D4ZlrBEwcU+VehJRE3BvSfSe8pU/R5nK+vRlvui5Bivgjk8BzF2VQLvJefugrXAGyh18Dn
 6pNUdGL6c+t1Oy/2decJyc3ZcbV/2fS6es/kFjmzrID0HZYeAJ2tGCSdG4pVbXaAkAt8zdH5xoC
 2FlmQr9Ce3H3GV50JznVm3+YSkffy902U4Ye0Pd/frGTV6GtfAvjMwHpZnYMLqzS+sA7rwhR
X-Proofpoint-GUID: dus0aFGLzMidrp4l0RBHfRBp2x-txYbZ
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a94ad cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TsQm3OvnAaa48CA-nDgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060098

On Sun, Jul 6, 2025 at 8:20=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.  In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.

oh, and if it wasn't clear, that is something we can pursue, if
viable, after this patch is landed.  We kinda need this patch ASAP to
unbreak sm8250.

BR,
-R

> BR,
> -R
>
> > -Akhil.
> >
> > > ---
> > > I currently don't have access to other devices from these generations=
.
> > > It might be necessary to apply the same workaround to other platforms=
.
> > > ---
> > > Changes in v2:
> > > - Simplify the workaround as the issue seems to be limited to SM8250
> > >   only (Rob)
> > > - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-e=
f725033651c@oss.qualcomm.com
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iom=
mu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a627=
5d9c3ee3d084c215362 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct a=
rm_smmu_domain *smmu_domain,
> > >       priv->set_prr_addr =3D NULL;
> > >
> > >       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > > -                     of_device_is_compatible(np, "qcom,adreno-smmu")=
) {
> > > +         !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> > > +         of_device_is_compatible(np, "qcom,adreno-smmu")) {
> > >               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> > >               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> > >       }
> > >
> > > ---
> > > base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> > > change-id: 20250705-iommu-fix-prr-600451b1d304
> > >
> > > Best regards,
> >
