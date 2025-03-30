Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B971C84D4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369497; cv=none; b=TJtk1962YbLV+e4s0iI4WKkfXPI4USyX8Qz3eqQckH3AP+EPmT6G1B9cUzBQMp08FRQiPXNxY0UI167eb8wYeQfDFEfvBVmLShMYipSRhnmR9DhB2yltXRqLzZpCwG9rh6QPr3CsQ9CeP5tUqU/tqhQU5zV4nwrAm6Qk/jv1u2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369497; c=relaxed/simple;
	bh=Ooa4UcGNscB5a35lf6i0Tw6kXOLOJYWwKJ0KUvILWyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkhT4iZNItIl4KC1cAatnQ6G6xX0106re7Dz6afZttOWwmyh/HCG86SJe3S/qLiVUyKKH3bUpelh9cmnEtQo4QFF/WgBoHs8PaOWDqK2UxJmAporO8DEPPSRQgnAEqohxMUfJG7rrlYwSSwHsrWZNPbhlQ/VHE+vtmmHY9/AtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb1AsJUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb1AsJUC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKhX9a028637
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Paayu8WvfEGwEqdQbUj3+ZGD
	d1cOdWz4M9UO1SwtVuw=; b=fb1AsJUCSOSzNfD21cezt7tvkihLf6jcbCuz+ZeV
	SMkxnxnA5r5KD3z29dwkdPGLtkDrIxfIEsay5bf4t/FG8HQyKoti0wlmULHwvtaL
	gJhIFYuCTmyTGmHJOTh/6UUSd1ErEG3dfnNm00nMq67RFb9IPgY60Fr/KkBta0nk
	qRbQQnPbZttwkvgbl4PvrEFqqLzWbQyq8XJW6N9efK4gN5tKHG6UEKt2dvsYG60j
	J/wJBkI76m0cLA/pe4oGLj7QBrlDe/OtX9tvKQFwLBFyeTK7GPiVSxFWcUFkaNK6
	dwOHKemuHlOJw/9tMQroYJO6L89Wf269fBI4VjdH7SO1QA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvav81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:18:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91d8a7165so61389806d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 14:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743369492; x=1743974292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Paayu8WvfEGwEqdQbUj3+ZGDd1cOdWz4M9UO1SwtVuw=;
        b=dNIJuXQvZk6vXNgLL1TaAZhtineMlREHP94OR5HCBwrQbAAf//I3gH5gYIgbpppT9Y
         zcnh15Z5ZL05IYBv6UGOrWnXr4tKF2TFKlzzcSpeei/ezULK816Qbu0j2GAiHRYmuiyg
         UYdwL8SaaXNYm7krkoMf5MuOn2lV+ToQmx3d7Icq8R/LvJs0WmSHBn2fb617kC47VYWI
         ihxiWsQlRSMWQcDtOsh19tYZz1nh/bqrnR/KDZm6DnGy8M0pQk1AlYChqpXxSrUw/BM7
         wpjpmWcqN5tjS1fJ4vDmMbYA3KvzJAuLXHtPpAoULt2OyYu0jpTZYOq0TeDZDtBOdOen
         Z6UA==
X-Forwarded-Encrypted: i=1; AJvYcCWFpaIRl8gSVMaqpG1/IYmdYGgT1W7WY/OOfMf18ULBKNgFhMhqA3bXesCYF4HowdinrlLzIjrXbZUbvR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1UYgsvGTlBd/l1bCkb31qGMlj1tmqOJ+755pMtCAcQm8Fs65
	9csX1aKsKO0Gi3CGo4p68nyTvjbj9L+WewAgaxKkbUPpbjJWXoEjae9sVmtPtkxguj414VRJLPJ
	RLoOo1kypg+DsEiqCU2q1mE07MsdI1BhQsamURnfXeM3/hj4ZjgQsRoR23Uh37yE=
X-Gm-Gg: ASbGnct045uGkU8u4KUQfg/K62M2Co7tZ/gmxz16dl9covDFRvCr/jK2BhJiXG0ql5Y
	06BZJBg1IMw7rbMh6N/pFfgWGsx7YYU/9FFZDEaon3q4nTCdZVh1Te3tyfB2DfoqARprZQ2jynw
	bUxoserLz9TjJmgkvouropxW3WeeUMW5MaIUomRrXsCh6eCE8SebwShhbF4htkXb9k2D3buxL7w
	Pmgq05ylJ1hC691GfozufxJN8xDgjWd9K1gjtBe/+xI9vTCkkFuJVaQkRhri0OaScN7HhjDnHLl
	bVb2DJUgP1GXLaut4J2pWFZ6W2TuGXECP/AY16/mvjgy5UxYidTj+nTeFlcSXnDralpp8HpTHSc
	mHso=
X-Received: by 2002:a05:620a:4722:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c6862ef454mr1103733285a.1.1743369492219;
        Sun, 30 Mar 2025 14:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAv7jrTxDdjg78EAAVbYKt+dMneuIjLdd38so3bZG7Hgu4I+zdN5YTn/dl7VRlOI11qb8vvQ==
X-Received: by 2002:a05:620a:4722:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c6862ef454mr1103729685a.1.1743369491843;
        Sun, 30 Mar 2025 14:18:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa92a3sm12169691fa.12.2025.03.30.14.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:18:09 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:18:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/connector: hdmi: Add missing bpc debug info
 to hdmi_try_format_bpc()
Message-ID: <esfrpbkbcvktjfu3u4m3wlc3te73t42pz3k2eb5pthdl2w7o4w@mwgwseljuaml>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-4-294d3ebbb4b2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-4-294d3ebbb4b2@collabora.com>
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67e9b515 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=Go0fpDh_rV6_VJzv3a0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: TP0NEnRu-y3dXxTuNiFQsDNyTeP4r0ZQ
X-Proofpoint-GUID: TP0NEnRu-y3dXxTuNiFQsDNyTeP4r0ZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=849 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300150

On Wed, Mar 26, 2025 at 12:19:53PM +0200, Cristian Ciocaltea wrote:
> The very first debug message in hdmi_try_format_bpc() is incomplete, as
> it doesn't provide the given bpc in addition to the tried format.
> 
> Add the missing debug information and drop the now redundant message
> from hdmi_compute_config().
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
