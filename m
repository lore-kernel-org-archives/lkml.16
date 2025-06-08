Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F064199E94
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749399827; cv=none; b=bvIk1PlPzgtoUgn878v9rFOU4ggX8zV9vB0HM3VCYATna6EDDgVQu9vFNXu2VZM0rBfc8qi/imFo+XKHniZ3h5lJCMa6tAnmZ8W7tfL0rPsXs9OHuJK12DjCjXRMYK9uwxZfar4mhjrG51y9jKegnnOocA6LtwecQJ37/M/7F6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749399827; c=relaxed/simple;
	bh=QQm8+AyHgkZ0gD9VdoMAGwcz088zAqpdw8/EeR1Naas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLdXGWLbmXaiFvSjPg/qgdRI9IUmKhfUFw+lJ28QkQqdOqVS21q++jpunVOBqCA9gBXsx2F4VWMH/D/6lZ4NCjKqp5CLqiJfkMq6dRLaDjwxIBTugv/twvCewkFPKASv3wcS8Q9YRb4AWK5vUBZm6XIAFu/AI/u7pejV2aEzz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItSyQmRG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItSyQmRG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Dv0Y1032152
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 16:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8BqS9FGjG6k7xRfoTZcE473z
	hdynVB2jR8LCaPdZRKA=; b=ItSyQmRG1EBBs5ffrgyrg3pFJwmgWjD2NauJpulX
	Wx5/+bAzLz2OzI4PGCEfe2Hg22K1oMbZLn37Z5Sjng+GggnhAGNGuR4j1cy9Qg1O
	qHmb5XX9wbM8RCK8XhA4nIy0serAmfmcJGxi/I4BlRo6Lfzw6/MjE5iQgiYJ+srv
	FqmX2N11IOxnydogILWb8mHk3QP0QGNGQrkU+Do1pwQZ0pAY00TsSqww7IRcZSdQ
	H282VFtQ+4CEJWrrMOzV2U4lqSQU11aR0YOyUThtf8Y2Q805BCyN2g/HgEc/glSj
	2koLs2Nrdp6n7pdeHx/BoAuWeevYTbf1GmWz2kNIQn1PFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv39dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 16:23:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so656391685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749399824; x=1750004624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BqS9FGjG6k7xRfoTZcE473zhdynVB2jR8LCaPdZRKA=;
        b=XbmaDAWGn9ZPOG+o2j99W/bvZp6Rpr06fenu2nmpWRzU0jZNjbCh7zCyW+daXpdK9u
         /WnCY0+8utDLj9ooMGuuh0FiwH1Kv2yhFP+FnIt1ZTKeaV3ekGPogcGuOknaQeyrm/7X
         m8vQ1ZHB9ppVnkol/yOOovxtgBt7Vh71n0ynU6xM9buZ3Zo1ynEszI8sA0Qg6IqDtOhT
         erjDQgN1kuqFWndn4HsxGb+oCbko1CsXxtiWKcsJO7HrbEZsAn9G3HL09dBsnQGEGxKX
         5ZYCS9Qh9z318hMlnfbxZhFlf8ErYXHzhL99KNBKpIKmXGzq2+QZQ9UD49iJQM0kYki0
         OWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWzS3zvLD/ZfuQLjjEl1nLb0l/nN8y7KAmMQ5C0olShJ6Ce7PNbc/nkBNt0Z193hK6o/YECNygHloOg27M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzII7t4h2k6ICbjFmQzPK3NZKGZgBD6yU068YOE3W3KVG6Qb88h
	CE+lMH7SAOPHemBEO+QbQ5SGKLQO8mhSet0b6orgTymErFe0wrwa3F/sdrj24oCNFja8xUCoPSq
	JmpJcT8Micwla0tyqjcyp8CyX8dau8aJQK6C9xMvXyOZg4F+j+n1X+sGWkpD8RgZIGPo=
X-Gm-Gg: ASbGncuhxxe7us2MYiqMpbr/2k9nN9PJs4R+psOh5fWEZlgXmO6tYCWttGSU8qlBfkq
	gShoVoc9vdFGhySUaT5gj0MP9GxnH1nurIkzR8pUViOnfoaHhRYT3tbQTLpmhrZ/C0dgsQHzWhV
	wwHiDBubhuB7ECXITHdHUviJshUjuhXahI46TjUSEce2hEaGZs41wwNhXaB3ivQShexKrpePhVH
	GezRn4ZOa+noRtwBiXUej+ywAkzmGjvLF8ZUPrRf4nFKF1e32RKA467IZOiyhF+47SuTTE0n5mZ
	uoil+ZAyPJ1xPLjA19Xoe0aR2lGwih+KTUTF+I7dQ6s6XRenS0LlGT1ftfxpBWhh48Brsicnusc
	=
X-Received: by 2002:a05:620a:2496:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d229896afemr1619597785a.4.1749399823884;
        Sun, 08 Jun 2025 09:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/LDaUtrNJz2qS+VkpV80cbp7BJtD4VRp369Ja9UkCitZOa4XtW2IA+TnAf2D4cUhuqPPFw==
X-Received: by 2002:a05:620a:2496:b0:7d0:97a6:4539 with SMTP id af79cd13be357-7d229896afemr1619594885a.4.1749399823567;
        Sun, 08 Jun 2025 09:23:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d002acsm7590901fa.100.2025.06.08.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:23:41 -0700 (PDT)
Date: Sun, 8 Jun 2025 19:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] drm/bridge: analogix_dp: Formalize the struct
 analogid_dp_device
Message-ID: <ow5357zq3c2ovps5qssnh4afx7cp4qor2n7zhzsya7662nu3pf@3gbs2ocu7qiz>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-2-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-2-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: 48ugevC37fcPk8rMccCVtYyTVRrmcErV
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6845b911 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Eae2FfFRo20rfu4mho0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 48ugevC37fcPk8rMccCVtYyTVRrmcErV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzMSBTYWx0ZWRfX92ttAc5Df7VL
 o7QsidxtZgybDRF1NZGarMhBNw2wALGUoRb7xXX/+wYuxxkMNRR8kgqT+IYV8EG2Qk2jEueAx9c
 OmYxxroYUnD73CvWD5hdkuxBLwv7iAuDzaBFqTnP/gn5Z3eUZrNLk2xZxNb+iSvC+VMlmYMnZzz
 Q6wzLNXmuBF2kZBrjHoIi9g38WQN1o9IRMG7dyXjYeF4sJ7uDn/sWa3DoGrz0/sPwCSXXNJXGXd
 5PBMl0Y26mpmfqdFYu6xeUzcd5EHW3sX2VI+x0Ovamzop9fpfMDhBIxEfQdW+ISvpY8YPgpLTqI
 h6SrMXQ5ckKqr0w7RK6HlI/5ur+oLqYhsavcxxb4U2k2LcoEeyDr1m8A+dxJAyTRF/zlGnAuBpf
 6dq4MVJ1akXRK1E4OOi0IwmBYDHRTtAzFAe+0D0ygis18nt3GrhCjRzsWoJWzHvNhd/lbZEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=835 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080131

On Mon, May 26, 2025 at 08:07:40PM +0800, Damon Ding wrote:
> Use the tap instead of the space for &analogix_dp_device.aux and
> &analogix_dp_device.force_hpd.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
