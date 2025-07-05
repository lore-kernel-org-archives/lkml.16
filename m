Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406F1922F4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724579; cv=none; b=V44iPSHovMXty5AIsojkeDLzQgpzvw97/6ts3qiW4KVvXum5IDja3hmYZr/JyjxVgSYRATsnKvgjvCung1REPdgol2BudpILEAnHocR3N+tViTRdmIvJIiCgadKRwrRFsu/8NAfAl16zfWZR1VLvXjJEnynNrE57hBJh3BceoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724579; c=relaxed/simple;
	bh=yOeiKu4mBtr8VePwwU0rZXUhI1GOxOg8XAX7p3WgG6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acspSmaotXWQwECCtp6mzIsktHMIf8Hwk96tSGnQnfg3CMu06FNVvNLaXTTs6RYEGRSOIAKEHFkpFlvkbH+89ZH9n+0x7F+wgr6KUkcst671U+O1IcPSa8/Y1ibIlpHaV+wruWj7VKbBCNkIGNXSCPRUxkQVF5vFZ3n3H6MzonI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFrIZmK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFrIZmK9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565C0O1Q027828
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 14:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=; b=FF
	rIZmK98gOrDFTgLpU9cYQ6OJaKD7SMjEijqzCCkcnWOo/d1sJ/4HiX224ZtEUo0w
	OPrNiZj418+PzDvvDYjaV6JFPTocuepmeydVVG6y/PPNSlA8iyokzw+2L6gmolnA
	jN/IQlRu7CS9nN/G1mtzbXBHPctrCfm/R4YzAdbC1tT8bbPxcb6ZIemYHxHp2iC7
	GQu8c0SCvA7vUhza9RacY1pmkgvMSEN8KCh3sigeQe7eKReZBPQDTbzQuzHFPZJ3
	efbVo67SqtJHs0jlypt14J8w142X4hlGj3Te/RcjIn+oBhXfFvnZ+G7+S3Tzu8t5
	mGJ8/PLGQ5SnfkLA/DFg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk19pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 14:09:36 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72e2f2b9ea1so1936142a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724575; x=1752329375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=;
        b=K27O2QNFuFgGDh8/BEkVof/vMTfJ6N3ptLPMWNlXygr5c8XpzjZobCGoy2cPxBMDKl
         NF2DADuBgMcL4vSTs4bVq2395a3AhHSwfhwldlgSRtU2U8aWteq+zD/XcvAC3pcRu/8u
         kdO0RGqYz8U1H6z9SNrWNjUapk8YaFUIyEVqFi7VHHde6MlFAJOBiYRttX/WI/ddlUTR
         MTYtBEZ2r9PDdllaQ8X5jDwYJJlrYKD2CTwpkqtOHCK6A9PkzCli9isIRt0mY52VfL35
         x0hyJgmRvWWawTTXVFduk2NWgBrOP+FpvoayGUxqbvpEV3EJr8Xq4BUqTWvIl1fpo8fb
         3wvg==
X-Forwarded-Encrypted: i=1; AJvYcCWayrbsarg8/16a1RsSDD7fHRl9lLUsVzjYqTVvbfXp2LORVFm8dawdvGy9bai5dmOogFA0Jxr13LClX50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1RsVaRbBXS+kUFi5i6lLIug4YOOQ68BDRyLIywu/14qfEE783
	IvBdfm9rIH3+ECIVhRbaMIHvWuHH7lGUyVSqjuDhovCLeB3HLsg2xNNP/7OdKKNW/lPx17E5z7j
	EIfxPm5MoAD/KOUhSo/LmbfXw+1pplQa/7jpbw4Ca5wVItrqDOCrDeOs2iyqVu2ZEp3nDGwdJc6
	/PgFrV6adaZEWtIJ+RB/Jq3LZJsNd+oc3JXr01hTBOKQ==
X-Gm-Gg: ASbGnctLPu64xXHaps1kcyK3mQya3PnQBfjYsIdcnWh6aiis5aVknRridUsIqdlMOKe
	51bzSG9QHBxU01D4W0CYfBRis3u48B2U5datwinhPi/j7jyGJW94bIaaXhfMIkMaTBjGDQ2JJcf
	yUXTplKycZoT9n0+6lasobgXM4fn80YEZw/JY=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id 5614622812f47-40d071d00d9mr3649972b6e.0.1751724575179;
        Sat, 05 Jul 2025 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA3q5wqh/EEUmvvZC73mDnOVowdgQnzs4lFfcQ936+1v/mgxLsm36MjdYRojGl9YJyJa80drv/pWEU7h6E+Pc=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id
 5614622812f47-40d071d00d9mr3649953b6e.0.1751724574700; Sat, 05 Jul 2025
 07:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 07:09:23 -0700
X-Gm-Features: Ac12FXy3XxVN2bch22DCGw0GFR8wOdtcX4y80G4QjD1Fqf0Tx93RWyLsTzUvS5k
Message-ID: <CACSVV01nA4jbeUx-cbbKKvr0GPaLo=RtBJD-mYazFRnwbV0Wwg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: disable PRR on some of SMMU-500 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: sJdis4g1q5rD_9IdBdzyqXmP2znxM7xf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5MiBTYWx0ZWRfX5GH74tOYIu4F
 dfLmddHg+JWqTFM9NFgVF6twG8bGqUPTuXYkkvKpYSiESO8l3PiCVZrY5L4QTZsn38YEh4JcDQC
 JBYRC99Xzo9uwRDQPRDnQXAax+62du0DkPSGHRutF01ehGoOElIWy4SKQ60BtHwykenocsAF5iT
 uHaji8yyXXE2SFMzkAc1CKFwsyrrIIhvp2EWVkFHee+jqS3ulHY5ZOKIOiqLf5E1wQUHhn2lJIG
 bwGvdDiRy4Ac5JgOMGWB8ep7zT9AHhn6b58bSs3FxwzuzXnCGRTqh9ZCwoBUByH5g/ydqlsIt6L
 OzuqJp86qjf6I2bpaobdLUMkVrtOE/2gpLp9EWeaclL/ABE9+9XVw6xgqdmu74/X6TwpGiS+phd
 nUUyTPRk+WWd3I3jcHH2pZPWVIODaAhpxdRJX6bhFcm9qM7ios4SWjnQDw6gcAsjpWvyo4ME
X-Proofpoint-GUID: sJdis4g1q5rD_9IdBdzyqXmP2znxM7xf
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=68693220 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=gUAwG1mKp6tzq-jN0zEA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050092

On Sat, Jul 5, 2025 at 2:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On some of the platforms (e.g. SM8250 / QRB5165-RB5) using PRR bits
> resets the device, most likely because of the hyp limitations. Disable
> PRR support on that platform. Instead of adding more compatible checks,
> set PRR-related callbacks through the match data, making it easier for
> other platforms to apply the same workaround.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.

It appears that a650 is the one special one:

https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/adreno.c#L1257-L1262
https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/kgsl_iommu.c#L2657-L2671

so I think we can go with a simpler compatible check

BR,
-R

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 134 ++++++++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  11 ++-
>  2 files changed, 91 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..f1cb30cd99af6020a8b472f11=
d4999ad70d0bce0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -55,6 +55,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_=
device *smmu)
>         return container_of(smmu, struct qcom_smmu, smmu);
>  }
>
> +static const struct qcom_smmu_impl *to_qcom_smmu_impl(const struct arm_s=
mmu_impl *base)
> +{
> +       return container_of(base, struct qcom_smmu_impl, base);
> +}
> +
>  static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>                                 int sync, int status)
>  {
> @@ -313,9 +318,9 @@ static void qcom_smmu_set_actlr_dev(struct device *de=
v, struct arm_smmu_device *
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> -       const struct device_node *np =3D smmu_domain->smmu->dev->of_node;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>         struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       const struct qcom_smmu_impl *qsmmu_impl =3D to_qcom_smmu_impl(smm=
u->impl);
>         const struct of_device_id *client_match;
>         int cbndx =3D smmu_domain->cfg.cbndx;
>         struct adreno_smmu_priv *priv;
> @@ -351,14 +356,8 @@ static int qcom_adreno_smmu_init_context(struct arm_=
smmu_domain *smmu_domain,
>         priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
> -       priv->set_prr_bit =3D NULL;
> -       priv->set_prr_addr =3D NULL;
> -
> -       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> -               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> -               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> -       }
> +       priv->set_prr_bit =3D qsmmu_impl->set_prr_bit;
> +       priv->set_prr_addr =3D qsmmu_impl->set_prr_addr;
>
>         return 0;
>  }
> @@ -558,65 +557,89 @@ static int qcom_sdm845_smmu500_reset(struct arm_smm=
u_device *smmu)
>         return ret;
>  }
>
> -static const struct arm_smmu_impl qcom_smmu_v2_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
>  };
>
> -static const struct arm_smmu_impl sdm845_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D qcom_sdm845_smmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl sdm845_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D qcom_sdm845_smmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
> +};
> +
> +static const struct qcom_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_noprr_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_500_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
> +       .set_prr_bit =3D qcom_adreno_smmu_set_prr_bit,
> +       .set_prr_addr =3D qcom_adreno_smmu_set_prr_addr,
>  };
>
>  static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *=
smmu,
>                 const struct qcom_smmu_match_data *data)
>  {
>         const struct device_node *np =3D smmu->dev->of_node;
> -       const struct arm_smmu_impl *impl;
> +       const struct qcom_smmu_impl *impl;
>         struct qcom_smmu *qsmmu;
>
>         if (!data)
> @@ -639,7 +662,7 @@ static struct arm_smmu_device *qcom_smmu_create(struc=
t arm_smmu_device *smmu,
>         if (!qsmmu)
>                 return ERR_PTR(-ENOMEM);
>
> -       qsmmu->smmu.impl =3D impl;
> +       qsmmu->smmu.impl =3D &impl->base;
>         qsmmu->data =3D data;
>
>         return &qsmmu->smmu;
> @@ -686,6 +709,13 @@ static const struct qcom_smmu_match_data qcom_smmu_5=
00_impl0_data =3D {
>         .client_match =3D qcom_smmu_actlr_client_of_match,
>  };
>
> +static const struct qcom_smmu_match_data qcom_smmu_500_impl0_noprr_data =
=3D {
> +       .impl =3D &qcom_smmu_500_impl,
> +       .adreno_impl =3D &qcom_adreno_smmu_500_noprr_impl,
> +       .cfg =3D &qcom_smmu_impl0_cfg,
> +       .client_match =3D qcom_smmu_actlr_client_of_match,
> +};
> +
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless th=
ey need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
> @@ -712,7 +742,7 @@ static const struct of_device_id __maybe_unused qcom_=
smmu_impl_of_match[] =3D {
>         { .compatible =3D "qcom,sm6375-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm7150-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sm8150-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> -       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> +       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_noprr_data },
>         { .compatible =3D "qcom,sm8350-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm8450-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,smmu-500", .data =3D &qcom_smmu_500_impl0=
_data },
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1c9659fbfbc68a84a3ab1267b356e..e805ad604339463b706a43e35=
9ccca657d42a602 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -24,10 +24,17 @@ struct qcom_smmu_config {
>         const u32 *reg_offset;
>  };
>
> +struct qcom_smmu_impl {
> +       struct arm_smmu_impl base;
> +
> +       void (*set_prr_bit)(const void *cookie, bool set);
> +       void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> +};
> +
>  struct qcom_smmu_match_data {
>         const struct qcom_smmu_config *cfg;
> -       const struct arm_smmu_impl *impl;
> -       const struct arm_smmu_impl *adreno_impl;
> +       const struct qcom_smmu_impl *impl;
> +       const struct qcom_smmu_impl *adreno_impl;
>         const struct of_device_id * const client_match;
>  };
>
>
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
>
> Best regards,
> --
> With best wishes
> Dmitry
>
