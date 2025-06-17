Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288614E2E2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120203; cv=none; b=luDFdzlXecNSOq13vruL55OoggI6RnFuvjFNptbUKOJqVQx9rEu6S7ihgkiWYngk3a7idkWFuPxY6c3VHgEIxLSa5TTKkwS+ItPN7spqbVVNEd4wHfFRhfvMy7lz2lgZfKjmsaRobC4ryAbgkD/8RDVHZPglvKUPxNixfr3tOb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120203; c=relaxed/simple;
	bh=/OvAXeXnbc+SV9Vq7CWaLCrhrnHUxMr1vpR5Fbdm0Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEO03mVh5J4eoEhCMblscIc28mYDP1gqDRfJKh59zguI0mZtRx0sDydFfmpRWafjJzLpdH295zLXgk+qc1Ku4DGHxnKagjAKGxU0+A9rpzCS9v7eyR/wbcWHc5ePetW1dVDstrqMFYaprBVRPHJrlaeKb2SqLK29wVnuWdX4fQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVig9xNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVig9xNP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHCZaf010256
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PxBxdB6UbGf0Xh3ZJWJL1VY5sPor29vDeLUN/9Oy33Q=; b=AVig9xNP007KmNUZ
	3ZknusRj4RY7El0ln90ryEoAzzf9DfFJTbVHUdyiNs7d2SrzkQy2wjfQJWNW03du
	44cMGgB4GKEWygqtVe6FamKUKuPfyxHPScMEGqCtm+9oaE/P1L9LfkCHxcEhKX8C
	1F6D7Kk3uGk7LOVxgKPFHuNQcTz7sg8preOmKQl1EhRFXvhLhOnlYYzJ45dLHPDU
	MuLll+5WtgNtvRgPj9K7yQt+OBs/onG1UZOyAar2JVT/vf78np530uVig/dNoNgv
	3bkgFmlqKmXzBdH5zoBqMSo5yVO1FuAQfcl2hTwWer0rMdx0K757G9BTTDIwqJni
	iIDRaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f769n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:29:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311d670ad35so4944348a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750120194; x=1750724994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxBxdB6UbGf0Xh3ZJWJL1VY5sPor29vDeLUN/9Oy33Q=;
        b=isclEuntrwObJJ1C9a1FvfHxoZwmFNVgRnL9gVgdu/UzxU+lmCm9rvcSI388vv0Um9
         BX+HgJcDk26vK4hpzRgSIIb829S9VumsJFHViPdbFOKoWxRkzzc3fz9X2RjK8OzwHqkO
         6v31uVzxozCVRnftSgFRHUHYVDiWvpdeY8rNVX7EZLIBln6UiW6ulIou/jH927SWJJ9K
         tjlygIRUQKQnFAcPsDmiE5tSWbtXqDEs2KQ35ufLhxlYTglC0Jqam0o63xZm7fF1x9Ja
         PVioBlezij/hUijr4MUv2Xd3+ey+ApRhMio3OMeozoZi5/Mt+ArrgTs3rrSYfqt1fDbW
         wwZw==
X-Forwarded-Encrypted: i=1; AJvYcCVPLiHgY1wbRON+Qs2+sz0/9vJxdfwyzRe0dJ2qmEzu/FfJuGSAHAYyfcqV41dnFklrJoW+dnagxhQ5tMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs09XbmFM+IqdJPobBFZn+PhHxqD4fXppYQTv73vbL8tnztVEW
	Wuh3XGTyG+U0L+VFDyUlf8fr6aoMeeI1tvaGGF6ukdCtyhXlFkI6WhKQhkf7Mv135w85jYUR9/G
	2878DiDblE8ummM1wvjG/jVbxzqzfgeLmlHQMLIHrH21fL4CPWDZwPDAWTqtBKsFjvBEyiAFyhO
	3nVOuzz8Tpxo+XYOspTX4PM1bRnoDWJloAIdI29QGEYA==
X-Gm-Gg: ASbGncvlmdrS/G6Qfxh0jZyBtiChWAdB8yRQd3YvbZCCnTqu/VGeI2KhuIuSOyOIOSC
	lRczIR0OFWEgOvA/6EPzY2bACSQODDzb+qukmukeZAt+1AsHpj80tr/TEcP43GAacnz901eDQQt
	x8DTxl
X-Received: by 2002:a17:90b:48ca:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-313f1d4f258mr19603856a91.17.1750120194154;
        Mon, 16 Jun 2025 17:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSNC2kTDTNGwuTiWe+hV85H22cRA1JUcvRpOafMzvyazp3L8h7VPy14wOxOhT9JVskFD/RQnNoBw74CrtV0VM=
X-Received: by 2002:a17:90b:48ca:b0:312:26d9:d5b4 with SMTP id
 98e67ed59e1d1-313f1d4f258mr19603817a91.17.1750120193711; Mon, 16 Jun 2025
 17:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com> <20250609160042.7a8940d7@kernel.org>
In-Reply-To: <20250609160042.7a8940d7@kernel.org>
From: Chris Lew <chris.lew@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 17:29:42 -0700
X-Gm-Features: AX0GCFvc6F2pbAeWVNoCAEXGSMZa2DpN02Ww52JJsSMr40FBqwooK56KL_L_0sc
Message-ID: <CAOdFzchj8KKoBd-wz-KZbNu6V4BGWq6U0-spPdQx7TDCv7U9nw@mail.gmail.com>
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAwMSBTYWx0ZWRfX1kegcIfZOpvl
 gEffrgVIU6KBWD+SzcTuTvLTsiPVTkdA4vHNBz5snrE0KhE+FJeSU1qXnve3l2wWb52kmUHiHKU
 hliG4PUZhK0CyLMB2BLQEGJVKtNQyolIaVxLnhhIUtad0QLOWbBPlflwcRTXEbVm6dJhSY1gPOc
 zfVp2kxbB8cQMfNteGP+uYpOCWhbcR4N7ySkbVqPtWrb6IlJu7K/Y9gzokS8uHpO44y152sIe8n
 74tL8r80boLD5JfroVO2CQdWXP9WgHH1Taod5zC7PyKl4EzymQvcWRVuk/f1IO8R1k9+mkXh8Zd
 tSMUMmJ3vKdxyAbzmnRjsYPUYT1L4jb/wcULbMJY0xxqkJgtDkBmFqeumpjb7PW/EanEaonFpxN
 rs9ZiqfagDM4Zm4TA8cBYVSdpbAT4Uv5W4HBcGzsrAwFowqws8pFtzu85YxjMiqN+jhK66pF
X-Proofpoint-GUID: rv-wW6CZmYRrjxELdIwD4EaDmkggwO93
X-Proofpoint-ORIG-GUID: rv-wW6CZmYRrjxELdIwD4EaDmkggwO93
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6850b703 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=UYrFKEw7bejQHJ5Mm34A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_12,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=691 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170001

On Mon, Jun 9, 2025 at 4:00=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 04 Jun 2025 14:05:42 -0700 Chris Lew wrote:
> > +     rc =3D qrtr_mhi_queue_rx(qdev);
> > +     if (rc) {
> > +             qrtr_endpoint_unregister(&qdev->ep);
> > +             mhi_unprepare_from_transfer(mhi_dev);
>
> is ignoring the rc here intentional? may be worth a comment
>

Ah no, not intentional. We should return rc here. Will update, thanks!

> > +     }
> > +
> >       dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> >
> >       return 0;
>
> Note that we return 0 here, not rc
> --
> pw-bot: cr
