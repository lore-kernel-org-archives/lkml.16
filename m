Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FD2E11C3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914159; cv=none; b=pCoXNwzkeOz/xxojPrxGWVviBMAZqEzt7OXWAaImG9TavgTc1QXDBPpsQBsiNQiqpnpYmT5VATojpkQ7/1Yzk55ew6yMvahaf1bjXvDzt5c8kTSb0I5ZNbl/WQCs1vmMZYXZKqzPK13reTDxdfxrGTuMPxlPJhUVdbv7j/jDQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914159; c=relaxed/simple;
	bh=4bHOjfvL35CBAyAAuwF4+Lt9w8pvbI5ki9X27hppBWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2vDjlPz1zrB/Ydl/7RvDP7nAK2QI0WwqevkBgAlw8FVnIdKIZ1k/AnDMgGKOWUAFu1DuuDNe7fTKfyOXMHzbg/FYb0hf+GkUzpM0dXgGggq7KzYB2kfsvmhv51EMITTU82pIY0ERD/IA2+O78eUozyv2UaSpbN+1iUzAomG7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1ul7Tvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1ul7Tvv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E4eM6A016150
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=; b=Q1
	ul7Tvvci9pwDP6eqpn0ZWDcQi81QcBBQjKEnCFPg42/fjAQC01+JsgFmESWvMVTH
	OQyzUQFc72gTAmdMvF18jlqocvbFA7YpHHajMeDOqcRjsw+Un0wJlIU4WyVfYFak
	pjM5wqnMzrWp1hPdO7ruHtz+bCnJ/ic/2fd0um7+Yn3ZBmQY8VLmaRwKBsFUx9Uk
	cyIOq3gYuXCreiqThbw86zsqmehfEq0uPuSVfYqlDa9dnH/urjoJRnXydKAoNW7F
	1eHfEgcd1Mkw59nDfB9c3hkggDSFb427VZbi+NMRXKzq/f9K8G8s19vsZBNkBPrT
	l4HykaVbpkw+Nl94d2MQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928m8mu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:15:51 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-406682d29e1so3115336b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749914150; x=1750518950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=;
        b=U77KwkQnSWlwo4tYUBqiG2CN8ffcPamGjGKDC7FzEGBQjsaB8kM7eXK1yhj/tsfvC1
         G0Br5LZotYvvkYCFCxYE4UYbb7/5SAC4HiVH2/Q+n6OQUvbCN4fKOnq9yy0Xxgx4J4s3
         JOwPnVVWNv/bjL1uqY4T9fJ7EpaaVuhAIrelfnP0s4jPZ15B7ynh8Bd2cuQTYKZBPe+z
         hBjTwc9Wf0ctlPUpyEZuI/ReL8d04T12vGLwKCp07HcxXrbe+uckNup0r2nD99PgDDH2
         Uf/WOkhEIuimLx0U3oiQQ9EgwBm3vJcQiXkz6chH6MpNvlWLedmvn3phUb9h7SHLHI58
         0rMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhLvdOVTG1Y8gCeGL6KJ65kmOM4Y39/YBvCGzU1b0uN9n+mJCrbvLbVrtdaRtjZ6b61+2efOSH4aIbdr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqHe5tWqfE7p2RuoZ1OHot+dtKPhkPLGjqRQKNy17ivVxlBoe
	+R7jQoMNIPxrjiPeRyQAn59BBBpVnx8TTyttB8cjHLan55YEGDNQQ84NC6ceAatPilK/ZhBa6nP
	KqMyG21KbOQDP98QamnxPvpzLILId03d0o2C+M06WuRLFdHb8FKs4aabufNZky/V+legHBcqBLE
	EkVzkcBvua0z6IK4FcohqHW+yORVuLRGfioJcrA8KDbQ==
X-Gm-Gg: ASbGnctQDxycAXsX7u1xNDstLTuZF+JdaoWfyNausy/xGwE97FHC3YIQo9/aE2hxx5D
	V3HT675kzyKJDxTbtgHfI6LX/WiHM6/ZLJbNW+l1x4ujnvOptp6b9HRHfcDSOU20wmHBdo4dsM0
	uS7PP0szcgwzx93xDqYdNcwWUJsBG5mNEoc+w=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id 5614622812f47-40a7c13a8b6mr2349821b6e.8.1749914150375;
        Sat, 14 Jun 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMbwblJsD/pMG2FwsGL3eZLj5yHznrNfIA7Pmr/sCExEn3egU7d2pTqU9/DLMoErYH02zZS3uNIJzPax6X90w=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349807b6e.8.1749914150052; Sat, 14 Jun 2025
 08:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org> <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
In-Reply-To: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 08:15:39 -0700
X-Gm-Features: AX0GCFtPk9tPdVg_KDSrMIfi7f7qfSkV0Cof0fPtpyMc67NsnsiF1f7jX-9Eurs
Message-ID: <CACSVV03_GEuFWHPDB3gGm+Mq9uR8QJ1HabKcKVxnQjagf65v=w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOCBTYWx0ZWRfX0zXA5zhVZg6r
 Bp8+d1R8UhO0/4kWTm736EzsoUi2lu8FRmu1pmO3MYY7Fi6MQODEoWFM3CKcmIDjvZqmIJ3kIwx
 dGaB3fN+RjMZragd2EyxSs8rO1b3BSbgpLYs7HI2NDATX0cRJOCBrbcowFu8uvjeX/C90lUh1Qw
 KYydy5tRxjMyrLrWGVxethFLGQiOxkuKeedRuOSTw8faiCtFUY9df/jaQthb5m+GUBm79xvM49G
 eRB48VCh2WAmRbtSLWA5QItqdzgTp5FaCagQxiXVSkwJDi5vR2JA5dAiinhNhQNrLkVNJ5OnzIE
 2OUK2Azf1d4LeEp+jKWK3osW1IW4wLlfclW/LsMl0GvOLciZmpjHbWZelh+62GbKK987ZFlkTSO
 Srzn/2oxq35+z1Z8ad7CY1hqtLZAz/CMUogKTYNUcMEPoAKHum9HfF/fDB8Ohxt5CQlOFPxr
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=684d9227 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uiBUSSwroAowxIVJ74EA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mqgHgkkF3S6rBAxClq6KrdDZOQZiSCJ9
X-Proofpoint-ORIG-GUID: mqgHgkkF3S6rBAxClq6KrdDZOQZiSCJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=705 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140128

On Fri, Jun 13, 2025 at 12:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/13/25 4:57 PM, Alexey Klimov wrote:
> > On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> >> We want to WARN_ON() if info is NULL.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before =
bind")
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >
> > Apart from tag problem it is usually a good idea to add relevant people=
 in
> > c/c. Especially when you fix the reported bug.
>
> with Alexey's concerns addressed:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Oops, forgot the reported-by.. but replying with the tag on list is
enough, it will be picked up when I apply the patch

BR,
-R
