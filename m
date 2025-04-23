Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712E148827
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414476; cv=none; b=iVHUUYJr3KBD+8/yZ9P1ljp52izqzBzQ95BEzbuM8MKlLu3b/FIHrJlY6C6DkUOh/MXuLJuqm6NiFaNMi1MBKhvgKcQarayhYHnJZjNBptLS68nb9LlJgmv30HXIcCmgHyhpN6Bz3+I6P6XOB3t9vm1rNrbpXT9rHf1z0LNSvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414476; c=relaxed/simple;
	bh=R5zt8+seeWqdaQNo/sxIqIG4gmwtAcsiYh8skbbmtcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFxnSogXsrBK1mQ6vnPTlTL16lr/gKrSNDuV6AB7Dmfup6OgLzCZSzv2qxXw3Hk3N2GS7eoCY0Vu1G4Igk8X0nuqNRF9rGZVyGHh+lXcjarL7RRfVcGA/W4VDNEyAzF0C1+KwD+yP0NLRNM7cOKDbveE1SRyJ9GTgYTizQJo73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwfqo26k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwfqo26k"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA6mhT003811
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0Oojh+DOVkC76UOAHNrHiaA7ZHX478F8dAXStkU6sU=; b=bwfqo26keTZguCUI
	lpFj1PVfOvesj82rvdjoEPQXNXnQadeUl8hxFEs60qbBjGgUKByuKmIIty+JUt0Z
	1iG+B6M2ng2pDbbR3KErXPer4so6qHukcVDOyHn827gdZ1ceCVmDUj9cQFX9FCCG
	etndl05X6EAzNkTGUrTlA2SwND/bAJSJA+y+PM1M6hhH0446eGgzC1WF1pc+ZhgJ
	jllaqY4MO0VdxvmvaUpcXA4kOraQH2dumRY11UUDVBvz0jy59xhliaIQhBlkaqs5
	FxYJ7ippD19BNgReAjUR6XisBOtFW0IS/1RjbWhxLFwBrjjsUw9ne5hCGpWLXgvR
	YVYvZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy27ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso8563334a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414472; x=1746019272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0Oojh+DOVkC76UOAHNrHiaA7ZHX478F8dAXStkU6sU=;
        b=L0nc3XGjgJD0QGMIU/HXDTyo7gZYXK7l450GrUM8094GNRYZABAxpLNng4R4xkXAV/
         rPH1ge5yVWFNpZXfv4N7JPsT7mP1PWzxWPNAiieIS+vW5LuMHdPk7nWwKd4ifmL3flxQ
         xPRXzR6Xp2GOq7YRozyOrjPmqg8Hu2Ro9iNzhKeLsgW2M5eOjpz6LA8cU3+L5YjTnCR8
         axI9wGRtsH2DRBDwPBLaIL5NN5lTYQ+24BiVECpY05L3O5x5EqkQgW1GDizrDC5i8O3c
         7eMmCL7KHZkTMthiY64CzlTXb0SbXtwiQuSMuPfvQ2dF2S4/9ILnn6WX0qyr1rPDZ2Cy
         tMNw==
X-Forwarded-Encrypted: i=1; AJvYcCXo0CZARCD/j3e9MMXLDAZ+DmB5Fa50EKxWOlK8fIGqewF4qJWIuNXCnMfMAyhpuVsfXjQgpx7L+i/gwt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJE//xUSv3skPK0rrzsAX7VtVQTZYc/cU+r9R0jHTILdkeTo4
	dR7pf43FUbfqw/qWT4xcR0m3AyevRiy0W86Q1IvxWM1Tm+3gtKUABA9+abTaCcYsYfyVTAWH/+h
	SDblOuLGBQurVG7bk4rrSELma2MaFUts1sV75V0xS0I47txd+S3AT6qwMqL59mgYHOr2/3gPTFc
	mghEozhNcUWqAjBAzG+Chq10xaPRO/xmjIt2CWbg==
X-Gm-Gg: ASbGncsmSICMQYWnar8lzfdcUAbMv+Jd9Vq/9p0hQ0U6ORY2GS6VDKHkFbDjsAcXGGe
	iIcChRBH7+wf+/SuOhUE8eEdNZUean/tsuETTIJF4WswJx0kNeULH+oBqFn0seXBpwRPmnPDveu
	fVBFJmeCpdfDwANyPPBajDmGEu
X-Received: by 2002:a17:90b:2f48:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-3087bb418dfmr30784366a91.7.1745414472176;
        Wed, 23 Apr 2025 06:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqmjm/2kDzMUyAfKU30umWUUv1n/JyBQC1oaF07FgLHjm7bKHWdrgbopbp7m+vpW/yO0v9Q/VkT8i0fw84gas=
X-Received: by 2002:a17:90b:2f48:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-3087bb418dfmr30784318a91.7.1745414471636; Wed, 23 Apr 2025
 06:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com> <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com> <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com> <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com> <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
In-Reply-To: <d67b8fe7-ab92-4756-b549-827210240593@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:21:00 +0300
X-Gm-Features: ATxdqUGiKzLZZWpft--coqQChZkRh8TF47Vs6qYx0rHMcX_qIVdwunZSkKSPdaU
Message-ID: <CAO9ioeU9_MsLn3THJDkR1J6efmvm2u9vPZSu9U8Qe2mdHx0_tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MyBTYWx0ZWRfX/DNiGmYcUz04 w/S2odNmpe0yzffSdNDV2vMdREk9JiLhj6xbB9abYJpJlZ4KaPxfST1o7BnbB4wnh/lX9kzgSur J7bkuuyW10k4dKV4e0NfZ/tG2WiqEwxIfB3ifkEOfPSodgGwxFUweQSuA8omsuJ2J77NwCIcH1O
 qhGtCCIOxv4jppdBeJg7B+azJeALvsIuppHJGWdZeq5Xp3V0717te649Id1SoC35ICOcTqugo5i +kNjdWI3Yat0/zpCA1NxjUiTesrwLGFUshEJ88g+XR4Wx4kskgaiZSipttZG6c1r2CDEwjGayNr R04kts2LlhxAY4K5Z8IRAMei+uaQAh5bs9GmQDY3ldx5isWz6GRGwIalXBQ4HPiMg68I4qttE/s
 icJT41pi5ztim24CHAwfY9lr9Xth58Le2rXD9Hf/YOOnjUyyQmWKd5WgmKyMHzReVePaFCce
X-Proofpoint-GUID: 7zTETcecH-01knYiX6pzMYJMkO2Nwic0
X-Proofpoint-ORIG-GUID: 7zTETcecH-01knYiX6pzMYJMkO2Nwic0
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808e949 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QMXKlZcuWh9fA9xejY4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230093

On Wed, 23 Apr 2025 at 09:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wro=
te:
>
> On 4/23/2025 5:27 AM, Konrad Dybcio wrote:
> > On 4/21/25 10:13 PM, Rob Clark wrote:
> >> On Fri, Apr 18, 2025 at 9:00=E2=80=AFAM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>
> >>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>>> On Thu, Apr 17, 2025, 1:50=E2=80=AFPM Akhil P Oommen <quic_akhilpo@q=
uicinc.com> wrote:
> >>>>>
> >>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>>> On Thu, Apr 17, 2025 at 3:45=E2=80=AFAM Akhil P Oommen <quic_akhil=
po@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> The Highest Bank address Bit value can change based on memory ty=
pe used.
> >>>>>>>>
> >>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonabl=
e
> >>>>>>>> default (the one used prior to this change) on error.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu=
/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319=
f20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>>  #include <linux/pm_domain.h>
> >>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>>
> >>>>>>>>  #define GPU_PAS_ID 13
> >>>>>>>>
> >>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_g=
pu *gpu)
> >>>>>>>>
> >>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>  {
> >>>>>>>> +     int hbb;
> >>>>>>>> +
> >>>>>>>>       gpu->ubwc_config.rgb565_predicator =3D 0;
> >>>>>>>>       gpu->ubwc_config.uavflagprd_inv =3D 0;
> >>>>>>>>       gpu->ubwc_config.min_acc_len =3D 0;
> >>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adr=
eno_gpu *gpu)
> >>>>>>>>           adreno_is_a690(gpu) ||
> >>>>>>>>           adreno_is_a730(gpu) ||
> >>>>>>>>           adreno_is_a740_family(gpu)) {
> >>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 fo=
r LPDDR4 */
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 16;
> >>>>>>>>               gpu->ubwc_config.amsbc =3D 1;
> >>>>>>>>               gpu->ubwc_config.rgb565_predicator =3D 1;
> >>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct ad=
reno_gpu *gpu)
> >>>>>>>>               gpu->ubwc_config.highest_bank_bit =3D 14;
> >>>>>>>>               gpu->ubwc_config.min_acc_len =3D 1;
> >>>>>>>>       }
> >>>>>>>> +
> >>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above =
defaults in case of error */
> >>>>>>>> +     hbb =3D qcom_smem_dram_get_hbb();
> >>>>>>>> +     if (hbb < 0)
> >>>>>>>> +             return;
> >>>>>>>> +
> >>>>>>>> +     gpu->ubwc_config.highest_bank_bit =3D hbb;
> >>>>>>>
> >>>>>>> I am worried about blindly relying on SMEM data directly for HBB =
for
> >>>>>>> legacy chipsets. There is no guarantee it is accurate on every ch=
ipset
> >>>>>>> and every version of firmware. Also, until recently, this value w=
as
> >>>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>>
> >>>>>> To be clear about this, from the moment we introduced host image
> >>>>>> copies in Mesa we added support for querying the HBB from the kern=
el,
> >>>>>> explicitly so that we could do what this series does without Mesa =
ever
> >>>>>> breaking. Mesa will never assume the HBB unless the kernel is too =
old
> >>>>>> to support querying it. So don't let Mesa be the thing that stops =
us
> >>>>>> here.
> >>>>>
> >>>>> Thanks for clarifying about Mesa. I still don't trust a data source=
 that
> >>>>> is unused in production.
> >>>>
> >>>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>>> clear up any confusion about Mesa.
> >>>>
> >>>> Although, IIRC kgsl did set different values for a650 depending on
> >>>> memory type... do you know what source that used?
> >>>
> >>> KGSL relies on an undocumented devicetree node populated by bootloade=
r
> >>> to detect ddrtype and calculates the HBB value based on that.
> >>
> >> Would it be reasonable to use the smem value, but if we find the
> >> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >>
> >> That would at least give some confidence, or justified un-confidence
> >> about the smem values
> >
> > The aforementioned value is populated based on the data that this
> > driver reads out, and only on the same range of platforms that this
> > driver happens to cater to
>
> Like I suggested privately, can we centralize all ubwc configuration so
> that it is consistent across all drivers. With that, we will need to
> maintain a table of ubwc config for each chipset and HBB can be
> calculated based on the DDR configuration identified from SMEM. Once we
> migrate the downstream drivers to the new API, we can hopefully move to
> the HBB value from SMEM. This will ensure that the SMEM data for HBB is
> accurate in all future chipsets.

I like this suggestion.

--=20
With best wishes
Dmitry
