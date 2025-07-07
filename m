Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762611373
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 01:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751851327; cv=none; b=uWEKiZ6U5QHPLECVbUjZdR7dX1kVX0PlLQmk9V09Sj9YZd4Gdi+LeMHPoDvuWGzn2uZ3VSHgtkpOy1g6Vm2+sGCNL5vVtwrCzmNu/hWsXT13yuCS+KUzqYB12Xm+5vcSCMZbu6YDv5OrbPjKF4sKIfddx/2Z99yhBVsaSGXbl78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751851327; c=relaxed/simple;
	bh=9NwGVncvxKMkaM44hYWhWAwxYrfgYjHJFYDWSh/PDMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZos+Lzlhb5gT/C0lBimw+SSeOeOBkDI+WXWT5IWxS5KmNckd+4GKHECwMRRhY2mLYuhZAo4uHjRqtoz496oTtafsVH2NdMuXZ/ucd+witHMsD7B/W50b9rRmakI4sSNLVYFiuG2AcVCm36gTUFRSBN/BzaaSyjxgHPuY0sPsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjGjmhOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjGjmhOp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566MurAt009670
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 01:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=; b=NjGjmhOpTMbWmN33
	mO3imoHpweZEY6jBfi/omYJl/pKFRtYRJ6sMhVkOIIoaIPHQpVMJnFinvQ3in5vT
	6AuvvOwiRY8vANIXvbF7JBu7jjDoy4+PsEqNSJe4nPolGpqmhxGQtNVZ6ZLcGV3d
	ODRIyn+ZQpMyaw8S0r6TOjzc4Yk2tuiPxzXOtiOAvzaiRkO8bPblMqeDACid4fq0
	+FTaL/qHv8RiCybJ3AOCC1fTzHl+FxCKI482mtbYVv1WeCnxWTQHxC0/xX/KTS7q
	I+ngBIkmIhqV1GABdAWgJmjcpasugjNzrMiuDMFdhSE06uNxhfv6kRF3MGUxwKXA
	ZcRsYg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk7mbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:21:58 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-408d05d8c03so700523b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 18:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751851318; x=1752456118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGTEHq4IajGxUn2mf1ux8G7XL8Yixn+AipVYC3nee/o=;
        b=ZUxemKMrXVQk+qZT+1KDEKMUmBtyxhJtVYBQSKSt7+27moOKHj5NDrlME0AfG08rrr
         R7qQr8e/zzrCLHieiTlOmZLwlfXsQ4wOfP80HDdgfNdQLFul1ysX7mT87NydZU/xU5IV
         pExxCFQZED3BBrZheLH6wtXXMt/by7mRSugJJIZMkV34XsOPA1NXnuOHlsYGQzWsyGBQ
         y7EPTd/HXeaUz+nRR6+L5/AIP3NTdSTEBUEtfvDsi5eZnYS4/h8FVgNLco9UY6Tm0GoE
         elLWIsmdMvA9SYt8WMEAKyNfJgf+HBWQfRFbWZS4C4E2a1thSNWczz/RVP5Eswf8jiwX
         La0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnE/DEhOSeRhtFjrvCwK0T7sDijvAMFWEAtgHWl0kRybc0pSU4Dk3hzLZU+IS9APzRWWRuSKuLXjlZh34=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHfmfTd8kSQRDHltPwkRx/ruTY+59rqQY9UVTOg1Il5tWkRFL
	uhuK0WexBCvdvrnmg2Mvp8DZTuwrf2U9hsIm5y/dhOf3uEH9n9hhetN9ZJhinqQI1p4/kDq9ZPt
	FDVTEVhzWjf6fL348pKcaAeC0MaHU9YOtW8GkKSo5G9B0SwILd8EYfM8cXZlUMe8L7lyMlO/sRk
	9mclA5df+FH2d3JtIQz8q/yQExPXoc6qiQBsbPUaE/Sg==
X-Gm-Gg: ASbGncuV3XWB0RCGH0TUsc3D2N01qEzIBtA0R2PpcamTHW86K8jKunuUYiduzDobBER
	maR1sWsOl12NgCZkN9NH2WHy3pcwZ+Zxo86Vj93yugv9t+XwL8QcK9QjoWR0SA2n3x6mw6VDFGk
	OgvmumZYnxIS9LSLR/lb7yk0mkrmgzUZtPVWw=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id 5614622812f47-40d2b968e58mr5796407b6e.12.1751851317863;
        Sun, 06 Jul 2025 18:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFs2KQvXeA8I+eNNlGJhs4a9HX4VvgO+pAA9xWcKrJk8Ka7dlkr/CtyJI2GXTeTCdlInF915oStCiYnr0X/MU=
X-Received: by 2002:a05:6808:6c85:b0:40c:fc48:33b5 with SMTP id
 5614622812f47-40d2b968e58mr5796393b6e.12.1751851317490; Sun, 06 Jul 2025
 18:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
From: Robin Clark <robin.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 18:21:46 -0700
X-Gm-Features: Ac12FXwpGmCmQ8_MwW7xpPT4fw4jzAuObtuXcAM1LUtEgzggh8phHjbplkb8mVU
Message-ID: <CACSVV02AvJb_mb+Hw1aQPP+WTDTgG+f0n=kK50On1g54HnBuMA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAwNiBTYWx0ZWRfXxkhwEjJXgIh/
 wCo1lPdMMgqczVXCi0c4JCbmSafXpGVNIhEU5oFZ5jOJ5RowkETLUb1Nd1GOrts0FKIt45cnNJP
 16gqC6boavsx1tYh/9vFZc86YHDgC3K3olcQjHCOZqXSLdvkqcjuhbBRmN1Pd+KwjWpRuvgJIvf
 sgViMxb29QMR9ZrL9a8P26aipL7oM/3AA9aW/4mSfFl3/kAc2RaZ//7uyEeeaeyzEQhPvs1haYD
 QMUygDx2wotQb2eiD4kEOhqS7ooCibwskqBAuNc1cO27ioOcbiP2aQVq64YsdnxgYkZV3shxxTA
 IJNSdguUnuFsgU/HyBFbpYUBqwbKm+59RJVxdrPO7EE/NZaEy+m7Hu5jsAE9jHSvHgHtbMyeup8
 Vkn2hBfRLTWT/A46HRduhGoyhoOlmHCa7wf2jiwpXIjaoGnKhclZN1CmqeZpBqdTdUiCaDSp
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686b2137 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=1Na2Qn3s6HqEfW6eAF4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: B4cRYKKPzwk4B8zN8g9VvFFN7lEEsw9Z
X-Proofpoint-GUID: B4cRYKKPzwk4B8zN8g9VvFFN7lEEsw9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070006

On Sun, Jul 6, 2025 at 4:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca09=
4903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
>
>  #include <linux/soc/qcom/ubwc.h>
>
> +static const struct qcom_ubwc_cfg_data no_ubwc_data =3D {
> +       /* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data =3D {
>         .ubwc_enc_version =3D UBWC_1_0,
>         .ubwc_dec_version =3D UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_dat=
a =3D {
>  };
>
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8016", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,apq8074", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8226", .data =3D &no_ubwc_data },
> +       { .compatible =3D "qcom,msm8916", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8939", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8974", .data =3D &no_ubwc_data },
>         { .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
>         { .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
>         { .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
>
> Best regards,
> --
> With best wishes
> Dmitry
>
