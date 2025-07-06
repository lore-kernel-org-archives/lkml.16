Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1B224FA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807478; cv=none; b=FgqWEXG8rzNHnlqjHIWoHFpk56wxw4UHCq7WBbS3xsf1mRmhMr5LcRtoCIHLSoHBznPRr9DbG/0xVpVFISBRLayrAryX1ozccbpet8KPNvPr/omwuP0VgxoG87MMq2AEzSxIksBxmocWp4+mudFEOpQwpABV4v7oET+nroM8M5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807478; c=relaxed/simple;
	bh=5zXFd/csToypAcdWn5CHPzqGgBYRVWZgKbZ4gfK6s0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHF44UkXuFvXAxwrdu6hBMespSOrJygcICJ3bXULlTbxXLUHvmGrNRhnMpbh8++7yVcQrh5ooWwCt3XILYz0yODvtNDIcBUQjxUZ2jLO1LHZmZxwSoWbb/corTtTopoyFvvLQJxH2f2z8BEtGACvNYrZwJI+7sT5jxrGinJnCe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVjZpZuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVjZpZuQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Cj1ip029942
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 13:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=; b=bV
	jZpZuQ3RIYyAoKLa6Lh8OUzNMeAPpsKgTXDJ2SQH8f3UpKNlOBT7LO2cGYK8V7Rl
	oUiDPISlePREROz+zb8TjNx0t3W2yKLYtOU78N0gfe7ysJMVhg5AquiLgARB2niY
	8MZlFZIqPlOcSs8MRclKGZBaGQU6lucSNGW+jNJ9B3EmVMABQs19jaDhR2XnHVTw
	cSO02QdgdXaxZxcOc4ZmMYi0QIZvZjpYvzQSEwjc4DyGzG280FkfLWluSspioybs
	s5b0Jw8prtwSNRWsySIQKiPJC1lIbre86lKj7oc7UzrGvqGwehOOQEHXNJKTIbNt
	PQkdGf1k6Nl+83G2/xhQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk4cxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 13:11:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40cf66174e9so2591783b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 06:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807474; x=1752412274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=;
        b=gwZYbmNTsg5h/lrdBCOUxUeoYdxNcZhZI21zripAqZT7+7hUCN3oXE3M+JQ5aLpw75
         nnTwHNActd+FThVoN9EY24O5/TN07LmDZwI0fWfcKLwI7eDDoaNIL+SWThIRblcDwCRJ
         O2IUrc5ZtbMc0Giqv9rmVoLg/5di8x0OscCz72MKciqAhjOjvt7zf6n6oaXpdyI82YBt
         d9dMwTR7oFnTdPYVjRBELyQOCWWkJy9JEHHcOKCj/D16PPca5v4pYS4X74cjcNj8qNzI
         xSIWM0IVCmt/e2SX8eQx2wS0iUp1UXxAy18Zr+zk+XjfFItNHY9Kt1s0dsU/XzwjkH5c
         u3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8WeywmM0rBHL87mJg3RRQAvlZ+45cRj3AfxG13YWxG8/YNa4JeVoB7JXBr4VDDt3IR03Zz7oUpAWzZAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ji886BP3jYjkCUw6aFK5gRmFU4+qPFS+A0OOzVkd5EhuIrkw
	Ne7KAk4UnFCBJQTkqHLOgtTy2vxFmVP+fgmjmns5SGb28T3vkNba1i2okD2mZwZg0TS09mlCBx6
	8rJJjeODOzWjMcjAsiakl2pntPvUnoRFWowO3CRQ60WWjaVKxSdlc7MWZT9LRK35mf2dWMCIY1I
	zCv5tZLfn761Uf/NCcrJUv4kC5l43/wTtM23kYGUuXRg==
X-Gm-Gg: ASbGncvQj2YjCKTLLsP2zF0uwQSQyuY32ey9y37dWlxcx7Poz40j7K7JKvy2hG9PwQP
	kF+Gd5ESUEh9bJEtKgLeyMnQBfNMW9HipSV6jq6qiytIiFdo9uaHN+bA+jc10iNfqYdHSf91P+v
	uJxqaVbQgKfHOJQPfWf9pjk7Xz+5z723tiZ9w=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id 5614622812f47-40d073f722cmr6309748b6e.38.1751807474438;
        Sun, 06 Jul 2025 06:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXqTIxYOpfrcpl+16hlqYgFIybIHth3/Nw1AkuewmfHyr5AuL3eQcE0fbOtAaXCzTUxvDDs3JmQ1pGw8qClxo=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id
 5614622812f47-40d073f722cmr6309716b6e.38.1751807474001; Sun, 06 Jul 2025
 06:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com> <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 06:11:03 -0700
X-Gm-Features: Ac12FXwEujg0mUTYK0P_aqc5R6aQdoKJa1qQ7yp3VRUOl3NV_roo7RTcVDixtuQ
Message-ID: <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: elQtL31opIoCGJf34KuEIhTp0RH3Ksu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4MyBTYWx0ZWRfX4IC1mrySVSZd
 VPn1cJoj6pOvADpZY3YKiu+9n9s09UcWuNly55rogw3z2Mk+IKm8T85SP4hZs9jPWRHt0UCN/NR
 t8dkLbQH30N4IU43ZM2x+HD5v7nH8jodZ4MVruWl+fmFoYxrVpvQiOeImZSwC6kNd6BWnskedvy
 2YeXN7e2d0MXjY9Y57DTNcU8wJFCZTf9iMHuE2xyHQwMVVyneKcSa9Fcp36djmhqAhdIfzv/uZv
 +n+UWBb5TSoJi9yu1UQO6q3KkX4OW8VgaU4w+hdWVtrHUapUWqFH/J6rOQG/FEmaRTWeA+iXEwO
 RlbTeyiJy25n9fVFgJwsXoGnU+aohi1+WWXuOyFhxxpGIhTbDLA4C+2DrBmC/BsixSGMVEDt+Ek
 FwtRG3+pI8XCjKyyQJ/sLqzo0TuiJ1pi1ky6CtJ0qArWNNeU/xyM3CTzePfaYGn6wRmnMwUI
X-Proofpoint-GUID: elQtL31opIoCGJf34KuEIhTp0RH3Ksu_
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a75f3 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=hIhbsxJwIuVk7VQtvR8A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=941 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060083

On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Use the msm_kms_init_vm() function to allocate memory manager instead of
> hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> device, it's still safe to use the function as all MDP4 devices have
> IOMMU and the parent of the MDP4 is the root SoC device.

So, originally the distinction was that mdp4 didn't have the mdss
wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
returns true?

BR,
-R

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++---------------------=
-
>  1 file changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/m=
sm/disp/mdp4/mdp4_kms.c
> index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052=
529f36fadf15cd7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *md=
p4_kms,
>
>  static int mdp4_kms_init(struct drm_device *dev)
>  {
> -       struct platform_device *pdev =3D to_platform_device(dev->dev);
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms));
>         struct msm_kms *kms =3D NULL;
> -       struct msm_mmu *mmu;
>         struct drm_gpuvm *vm;
>         int ret;
>         u32 major, minor;
> @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>         mdp4_disable(mdp4_kms);
>         mdelay(16);
>
> -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> -       if (IS_ERR(mmu)) {
> -               ret =3D PTR_ERR(mmu);
> +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> +       if (IS_ERR(vm)) {
> +               ret =3D PTR_ERR(vm);
>                 goto fail;
> -       } else if (!mmu) {
> -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no long=
er supported\n");
> -               ret =3D -ENODEV;
> -               goto fail;
> -       } else {
> -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> -                                       0x1000, 0x100000000 - 0x1000,
> -                                       true);
> -
> -               if (IS_ERR(vm)) {
> -                       if (!IS_ERR(mmu))
> -                               mmu->funcs->destroy(mmu);
> -                       ret =3D PTR_ERR(vm);
> -                       goto fail;
> -               }
> -
> -               kms->vm =3D vm;
>         }
>
> +       kms->vm =3D vm;
> +
>         ret =3D modeset_init(mdp4_kms);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret)=
;
>
> --
> 2.39.5
>
