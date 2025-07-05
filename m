Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B21BC9E2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738718; cv=none; b=o5QttgWNid/8wL3i6i80CPvg2/rMdE/F/ptEHxxFCHNvbq95m2CI/8NAXItinstKJIqaqYGdvXNf9w1rgzbhgFuhCm4mFua3OTCLc3GcJNjVpOOip755WdM48Dsb2sTf7AlfDtSOWSjG9QVeAbisAL9crSLfVtfkI0end8ZflRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738718; c=relaxed/simple;
	bh=XQVGIRJw3+xHjhRPG4C3JVHMVjLczj49kVy13S2Zu2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OltLC798MHGK9OmZVORU/PvAKkciYv+tdXi+Vag5oTcJ2E978Iz41ZRQAVW3ZVecupxEfCu/4q7ir6i8OgRjb/dXskctIXYfSA9cLer9KdHW7g4A6s4FYJfaKG9DIMjegE58IBqs6V+QuDs+aGdAhyaIew0uUiqKjq+JsZf2Zow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjFY4ojF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjFY4ojF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FbI3m002299
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 18:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=; b=Uj
	FY4ojF2Ye/5mhZp9iOid/+tD+pwhZVz6wxJ7h0gdl7rcImRU3ka3jIiSOea2/0OK
	2vz6zuVkPLaSN3TogUTjNqD9E+2kD/chZvWsvmAv9jEAInCf6OjqX8g5w9e2tt5T
	qvSxpfXp1KcIizeWrBoIpUY2rd4BWUBpwv90EOehUa2b35t+3eIHiE7XZJ7vCWo0
	FL7dowoggiAgwZe9JFCyOTBr+c6xa8gVoV8Cj1SEYEj9T2DcjHRB/+t2bJWsYQ2T
	Xiqr9cTS+ZNeNDsSWwzOROMcsyTp2fxUDKOpOCExl8soAvJH0xlV7OvLtO4cZ2kE
	b94PUM0kviELH2Dt0C/Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x9qb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 18:05:08 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-406792ddc01so1710274b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 11:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738708; x=1752343508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=;
        b=Vkmhx2Dnd2JIJZVjr7vGjuMR0eLNvHDYzNYihmDt8FGwHFHivT13lKJAHQw0YDiX0+
         KlOlV+EIzB82lWBA3Uv5PLPUdaskTMbzqyQj1f+qtx7aHcobMr8Hr3jNk30l8SYLwtca
         2wACeu5bq7ixRLo80whWUbxhQd6ftuQOJGMwsUbVWISAdv1KqQSqFRLGNbQDwDXgcVQU
         vb4lx06ikfb1NqajpIHbxvbGIOUiKhiKo87gbbNvCUaFp2KRmZnDWK7ndl5E0mr2Fny3
         lPzR+ZMboY7nij5HzU8GlsUW1FzHWSZNscFnh56jvjVqT/+dco8yRCxSxaq3qQDXXhuB
         D63A==
X-Forwarded-Encrypted: i=1; AJvYcCVzznuou4Y/jLnUBWcONubNdEa2hpIda2LYmtd8sH3Taszw6dpopVRzfx4ZKSjMVbXEfP7KUF9rZ8IxhyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0d9fEVkgDh3LPAEaMoTzZhsrt79yOKkZWIHw+pnLTDlV4BiHx
	K+BZpvx8vDPXnKcix3NtWfDweZREpqQotx0oUiRsL0ngMfOhMyOZTxDkHsJs+BPLIwEFfqVTdd6
	lrfThAcLZfIIMPHIjGNuZN4/m6un5Nvr4idDUaT6Svl2mlsLMfQCial8l+6aIU9x2iBrcmJGZR5
	wkILVYrE6PKideCVQVxhdd5+OqLWaqc/pWxsYriiJshw==
X-Gm-Gg: ASbGncsl0+Bot6DTigflXlTlr/ABpwdyKIHE5BqyKpgl/cZtA0o/qxYJXNuS+SAtmTW
	er6kBprg9Kfhebgy7SyIOoqH5xO7HfbfpSZaHESiszhAHBYe+hZ5MdY40N0VA5VybGSwxyLEGC6
	nGST8FO/8rdq/fIgtibzgGuTIKgWPALLutM5U=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id 5614622812f47-40d073ed168mr4931754b6e.32.1751738707912;
        Sat, 05 Jul 2025 11:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA1V6eDhxgL68PhGByEGdZ2yGlPoePdjpJUerLbX2cT9JRZ/ymGxWYtpk/nq8tCGPhn0PxFjOVFmscNcrUN+8=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id
 5614622812f47-40d073ed168mr4931737b6e.32.1751738707518; Sat, 05 Jul 2025
 11:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 11:04:56 -0700
X-Gm-Features: Ac12FXxPGf3OtS1hFIiu8JcWUGDwoozM4YEfH5zfdc7rWndBMdlpthog4m8uuIE
Message-ID: <CACSVV03E5QZWuyiejY0BkecQbnLFYCOD2btW962XRJ+n4-KfWQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDExOSBTYWx0ZWRfX7mHy8/4JVRla
 XsQrwczz2G3hUoDTsW5+h47ftDUF2M8uvq9a2s9L5Nm9SnANtXXPXeFj5Vvc5pPvlM3g5TsHlrU
 KZMjVVqrVqkkSaf49tOZDgkeNtohH5do7jC/zSQ6RI/LjIG3vAoV+eNqM6kc0Y/Kf4b9eWTb9b0
 0F0APdqLqY3Xf5yaCKwrXeqJTsUG6qcmqYICikkKSTzR43/KlyJL4eLFcHSo/UU2ESECVwEZXaT
 +XXhyrDDtYejZgMmH4kPn+nqpvODJ19y9nQ/FsgY56xmG854HxTeR1TMSn93VEtFrD45Y5sZhP1
 K1lV6yyCmhx6oQ6+Vo5wSRZM0Gpx3q0A7pPKR3ocwaJhVEHYoeeuaBfb1oOTa2itHFZtAR6PX4g
 9YKH8ScLPo9HoY0lcTIlkeljQ4rwiSlwYkYkFvcvjGTiNV7FL54G175fza+gQztV9KRAqyXb
X-Proofpoint-ORIG-GUID: 9gf0-hWH1P1m4vRFVvuVlrRDRYr7Kh_v
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=68696954 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2B00_WpXKG7Y0WWvpoAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 9gf0-hWH1P1m4vRFVvuVlrRDRYr7Kh_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050119

On Sat, Jul 5, 2025 at 9:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725=
033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c=
3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->set_prr_addr =3D NULL;
>
>         if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> +           !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +           of_device_is_compatible(np, "qcom,adreno-smmu")) {
>                 priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
>                 priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
>         }
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
