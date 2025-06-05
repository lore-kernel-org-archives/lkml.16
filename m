Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268B92B9BC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111907; cv=none; b=VaPsaL5shwTGusa8GFZKfGsOtS0IjnLOxnF0y1rHZbnzzZyJ8FJhybcoDhlmIFie8SpsBRFTHjqxuZ69NNYR3YS+qwmerr+OvJJsNyYouUKkZH2PU4wgHRNQqjAyC5NUyebyAZCoyUwdBBGpgmbDY9kAPoYpHiI1RRQUSXSR5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111907; c=relaxed/simple;
	bh=xZaBeZfytCrJKOrjxBjzXhmtknBq7xCcBctElbMsMBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJSfrC3MGKZ66uSoWUDSf5fnb5u5T5WyuWQ+EAuvesYrznE+94/lkejYmf6ufilp1EOQ9KFwuk7IlB1L/Z8VzYHUIrLOa3qhWyVzA5Xp5TfARlsp/JA+lQuPQUb2fIOsnS/B3Kw3WZI/SXRSM8jZh3f9Tmdx6E3z/TJDjZ8N+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esmUzvm3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esmUzvm3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557DUXb006332
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 08:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtqcVj6Ok3Dj6NeRpJglAQeZgn6trv34Ds7Go5yrpew=; b=esmUzvm3cW8H23iF
	rVcEDPGn6EbXYZArK0XDbOxU4YfnOkb4uRSWRZB31Pd0Fqs7eY+W8x3hf/HuB8EY
	XZkF83spB64HgrCeV7RN3tH74FuPPxsPMZTWM92FmxfCr8wnhIius+VXM1sBn2y4
	K69otmMDrJpc41dOJHQLoHGxZmFLeC2PHc7nvP/x+8V98jm2lE+rO1NtivJgSm08
	Ja2V50M7QgtvZOYjiw81JaaNKHW/Kq6M2jM4nNGp3wcSV2g3lCTvnnDte2Vf8t1J
	DFId6dEvTCq/41xJCwJZa2oK7QvI7h7gRojzmKtJPdqylamXZXMoiegzh9SaxN+a
	b/erxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t0n3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:25:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so137939585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111898; x=1749716698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtqcVj6Ok3Dj6NeRpJglAQeZgn6trv34Ds7Go5yrpew=;
        b=l+BayMzE6k/iXqvDXmrT05xU+vFPrkkjz3+PE7OS3MlCud7DaqcfJZRwedSSP4Gakg
         G3RZBsqx+CSfb+zQRTsV9hknwxBIviM7tZiIudcrYKtSZ6XM8njSH5CkCMpmvjbzAt1f
         Thj3NBCMFko0gexZd2hQG4mVgclwFO2QMNPj0vPt7lJDjuqFMPuYPFnlrxTUFTFphKC5
         rkVKfBZ2/jRUy7X57me3qI/4STFxc+gPdMYOTiOdVYvo828Jk2GBjuOOm4Im+iL+wNHG
         5E16xyHXEGX2J0kNge9xP0jpK8Tbp7w/xQXjtHwZzjBAmtoi3CJ4Yk4ly0fb2p9i1bOr
         54hg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ZNW70R/1xrxtRiOOMVH+G7jXyPI+jhNjBnndSeuz+FDxuyylHe2TpMdAE4S6ZuEeqUF6TFJVLJlkiiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBkU3QblaVs7/6zBMzE6NfRY3/RY/N9hWw+l3v++7Nc/hV8zh
	RO/yBibmEafdC4xivLSiutdzkOBo06IqYHagF4SHmBLc9gs/iqgNAEAWJnvm0WRFNQY2GIpTsuR
	29p6jZS+U5pjTOux/vigmtStZ3PGgTiXj/ZDFXETfK+nESpLdnI/tL5Unshhf/pPQpzIW8MkDbB
	/L3ZITwSKbpbu1i4rH9hcTXF6EdhQ6Esz6Tub1FEP0qg==
X-Gm-Gg: ASbGncsZ+NZpU4MRF8GnnajJ+LAe2FwnszKSvVbCWxs+oRmT57BHcr+IKL9R/UjFZWh
	K1VTl5FACksIegPvOB8QJ1B/kGbXjBZHYdfNfVR3e9l/sk5ARt4zuDhNf+QHeQdIIlimTGA==
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id 6a1803df08f44-6faf6f9e8f2mr86670256d6.16.1749111897897;
        Thu, 05 Jun 2025 01:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwCWJddjYrv66EpklTX8+EcEihxS3i6p2Y/uBi1wSP3SPDwA7FauNdbdHLl/D99kI5j790nOP61NBUmgl1UqE=
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id
 6a1803df08f44-6faf6f9e8f2mr86670066d6.16.1749111897530; Thu, 05 Jun 2025
 01:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
In-Reply-To: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 10:24:46 +0200
X-Gm-Features: AX0GCFu6xWPgyNFI69TOSuHK6IF_kGY0Cv_eMSlpv6YDKdLvYpYbd911sy_xsb8
Message-ID: <CAFEp6-1h01SScjbv_m8rU9DxhEgAFOBT_7U2mQegFZQq_O0y4A@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Chris Lew <chris.lew@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IP0msPpEdL1pyC0kSC0KuPNz6UIq-Owm
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841545f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=us5iPAVF1rjgtYe1CekA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: IP0msPpEdL1pyC0kSC0KuPNz6UIq-Owm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3MyBTYWx0ZWRfX+5aembVPm43i
 hjYBaOCHYA1xwh4atJxmNYR+6JwzMkRmWU7VCqed0BJlKT4/ycaHyLI/GuSXrWg1kmta6SPiP5w
 XEcJF0u45bY816bWOz7wZNegQJAb1As2qhFMkdjmdB41nXvoo1NeIrJH6uWyhK7aLe0LW3rMGci
 mAaB0pUF/icRhQECKwMhATjSFzlMPANtCKkFFAD23jqhhs1+jhqgymNporg6BjIcqUIPzMUt03F
 XebmdlTTKZRwTSnkrniG2YmHEzj/t2utxg/zPRjwOob4w4obCMwYXGs2G4PKknOcLIDBkMZ2lM9
 95TQ5cSrRra0NZf7+ske0EbGAkhbhqAXQZqeXMRhGHU+9g8SKl4a9zvZKNXmZR/LNjMPrQNFZ4k
 tDJLdesKMsAftPEZwg3S9hh0FmJh2yTzxC1rWxpnYp3ZnWahN1ZrE3U16xWunKJGB0/XbFNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050073

On Wed, Jun 4, 2025 at 11:05=E2=80=AFPM Chris Lew <chris.lew@oss.qualcomm.c=
om> wrote:
>
> The call to qrtr_endpoint_register() was moved before
> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> callback can occur before the qrtr endpoint is registered.
>
> Now the reverse can happen where qrtr will try to send a packet
> before the channels are prepared. The correct sequence needs to be
> prepare the mhi channel, register the qrtr endpoint, queue buffers for
> receiving dl transfers.
>
> Since qrtr will not use mhi_prepare_for_transfer_autoqueue(), qrtr must
> do the buffer management and requeue the buffers in the dl_callback.
> Sizing of the buffers will be inherited from the mhi controller
> settings.
>
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com/
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> ---
>  net/qrtr/mhi.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 5 deletions(-)
>
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 69f53625a049..5e7476afb6b4 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -15,6 +15,8 @@ struct qrtr_mhi_dev {
>         struct qrtr_endpoint ep;
>         struct mhi_device *mhi_dev;
>         struct device *dev;
> +
> +       size_t dl_buf_len;
>  };
>
>  /* From MHI to QRTR */
> @@ -24,13 +26,22 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_devi=
ce *mhi_dev,
>         struct qrtr_mhi_dev *qdev =3D dev_get_drvdata(&mhi_dev->dev);
>         int rc;
>
> -       if (!qdev || mhi_res->transaction_status)
> +       if (!qdev)
> +               return;
> +
> +       if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
> +               devm_kfree(qdev->dev, mhi_res->buf_addr);
> +               return;
> +       } else if (mhi_res->transaction_status) {
>                 return;
> +       }
>
>         rc =3D qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
>                                 mhi_res->bytes_xferd);
>         if (rc =3D=3D -EINVAL)
>                 dev_err(qdev->dev, "invalid ipcrouter packet\n");
> +
> +       rc =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr,=
 qdev->dl_buf_len, MHI_EOT);
>  }
>
>  /* From QRTR to MHI */
> @@ -72,6 +83,30 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep=
, struct sk_buff *skb)
>         return rc;
>  }
>
> +static int qrtr_mhi_queue_rx(struct qrtr_mhi_dev *qdev)
> +{
> +       struct mhi_device *mhi_dev =3D qdev->mhi_dev;
> +       struct mhi_controller *mhi_cntrl =3D mhi_dev->mhi_cntrl;
> +       int rc =3D 0;
> +       int nr_el;
> +
> +       qdev->dl_buf_len =3D mhi_cntrl->buffer_len;
> +       nr_el =3D mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> +       while (nr_el--) {
> +               void *buf;
> +
> +               buf =3D devm_kzalloc(qdev->dev, qdev->dl_buf_len, GFP_KER=
NEL);
> +               if (!buf) {
> +                       rc =3D -ENOMEM;
> +                       break;
> +               }
> +               rc =3D mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, qdev-=
>dl_buf_len, MHI_EOT);
> +               if (rc)
> +                       break;
> +       }
> +       return rc;
> +}
> +
>  static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>                                const struct mhi_device_id *id)
>  {
> @@ -87,17 +122,24 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mh=
i_dev,
>         qdev->ep.xmit =3D qcom_mhi_qrtr_send;
>
>         dev_set_drvdata(&mhi_dev->dev, qdev);
> -       rc =3D qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +
> +       /* start channels */
> +       rc =3D mhi_prepare_for_transfer(mhi_dev);
>         if (rc)
>                 return rc;
>
> -       /* start channels */
> -       rc =3D mhi_prepare_for_transfer_autoqueue(mhi_dev);

The autoqueue has been introduced to simplify drivers, but if it
becomes unused, should we simply remove that interface from MHI? Or
improve it with a autoqueue_prepare() and autoqueue_start()?

Regards,
Loic
