Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5384026A0BA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651985; cv=none; b=XDeETTeRWxNYb0unSNQuGpo5Gd+df6UI8k1+f66551lH9sfy52DbqrOWXh1s5iUeyisToWSUPCI8G3sNqgqbKPnt7oFH/JnGZc2BTyaxTzt5ir8Xx7C3ieQ7W2j3Id7AQNvSCAo9nBPZF7ehLukn854vzlRP3IcM5eOS6Wq7W3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651985; c=relaxed/simple;
	bh=zFVSB/jLkg54QmOKyFRdojrQh6FB/PFpAZlAM3Co3HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw4AUbwLY+EEics71Mhmg04JN5tcN5kVW9QAAfmdlZyRMk6PARhmFIUw1dKLOkuE1PKoTqKdoZ7uxdZK5yemtxJmObBx97SdClRQCEd/Q4yL/VQdkvKTo8f6Tc4GHhVtMW1pDT6ZQ0FDbypKNneE3LImXsbgKqabiTaPRNUEDKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lcg6G2b1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lcg6G2b1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F8no014390
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12IaN7eBq8hgvdzeUL9X3AaN
	AZFkI4T15f/kPp9SFK4=; b=Lcg6G2b1SOKlxBPjxEhfdQl2ueH0xpdGSZN7PUhv
	+C0Jz8GC30+1yWDiHcsdQE4NwlIu/JrPPQWHHcsIe4IH4qmvB5LH8Ms32BOyU5Xu
	y5xKhN68az798K5T02SAN4+M9AALMbHj+K76Nqkdpve38WmcWjHk1myCEON9O7O9
	Njym7qj3xNWZieOw0rHeWEN097x3Sb7nUnr5vzTS02AZ280bbg3ct3G7Qrs2VBvo
	1pnX9tfz4GRvE668K7rZWTV1HoQrD4MHHFgGPwqwFJwjAaw7tI/0eVWunoqiv/dc
	/bFZaLp8irDiWUS6kpD765SxLLJ+F75rKIyjoCxyp4EqaQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh4qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:53:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so962636d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651981; x=1748256781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12IaN7eBq8hgvdzeUL9X3AaNAZFkI4T15f/kPp9SFK4=;
        b=PbKBAI2W+CLX8Ng9bpNXBUii0rw6FOiUsRnz2TOR83Yas9xJ9NRuYnatACse25od1H
         MKiCH55AtxSoON5iU06uVoDhShEEpBDfVRx165JV23Sp/b8p4sf/B5o11jWefWPOFVid
         kzq0TLiUFIcYUKf7HFEyOI5EDK97PnaDS4+Ims1VhZA6DFJtEiMJF6EkDvWqd8e3yVdy
         /EGxcye+T7jY1BriqUBv10Ng4AYisOjUKsSzVZiYwbk2SG2kcVVp0L/iYDm+4iNYDSLx
         SGhfPcqi+9smaWbT4pYawSZJdkjoMLr9TKJbAOUCh+GJvGDE2xoSRI/x4qlZel+OUJCh
         ZtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPwZhx8cjrvgdZPlpEH+9woQbI8Hr3MMU+NPIDHawMLcO7KeH7Kp81bsOblY/KH66qAPn9RtzCSEB85Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLocZfG63qXWPhmOz4pZ386lIiXLvIYNYBHq6ZKrb6T/0SGEly
	qTRqxbyC6mLy8QljsDQAmE0VVUSheiWG147SjBRXBEvvP/W1mFwxSh5lIHiKzHYBsGDdIX1SCyS
	mej9C0sK/Tu12zsqf1YvWaB/o9LsGQXFPeKeiTXVIOHJ7R8taZqyVnJ9PyJ8yiACoAZg=
X-Gm-Gg: ASbGnctnZfhlWtjCLgQbDqQr2KugJ3ubN9dP5qTBkls0HKf35ZKa6bZuur6lRuQHPJa
	2E+j+IXW40G57pnezLxzfKaeNnBFbokFiI/CtspKb2JGTOMyKTRINnZLrRDxp3dd/kOAzftEBwq
	s084/+aMaEJ1yVWCKQz0cWTjIMYkivxbV1XKKEVgYKcgp+McdjOpFOFkY5tWN968jEo4lH532gS
	+ve7QJJAke44o5JV8qmc+MfYd1QAERYN8uYAh260GOI1Hk0P9gEJMaiZzGbv1Wt1HXb1yciNE2T
	4OB95VSzFvW+WBmmnOhTLenDZI9wwnNJSeJnT0PqPhzkbjNsMw1ma0xyqXPvoZ47JVTwzL3nSIs
	=
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517546d6.33.1747651981306;
        Mon, 19 May 2025 03:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGosXbIBhaFmJ6p5vH35mNxV1xQHFesDqXCVMHgt8ntxYyGnp2tccv6lOtEix4vLMhGsix3iA==
X-Received: by 2002:ad4:5cca:0:b0:6f2:bcbf:101c with SMTP id 6a1803df08f44-6f8b0902242mr200517296d6.33.1747651980961;
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701831bsm1809899e87.156.2025.05.19.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:53:00 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add sound card support for
 QCS9100 and QCS9075
Message-ID: <ni7ww76wwaxx63ikqzvrjaagyfai3dy4tm5aohxgltlrk4yuuz@h52leppsesd3>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-GUID: HWwEKAN7IySkUR3Qbtw-NqHKDXpe6Bpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX8JiZhx05FUqa
 u7XimKjZVelp1reHmpfYL/OE2H1986CBrMBoSOZgfa8s6KbYwhHALAsSLE4O+9b3P8Rr4OqYRuH
 NEMj3dvVBp/2ra+QJKoYvET8oWo9ceStbdOaVPt+/ZFI7qMXm6DvpatLAwdamqHOe2KJXqPPwdI
 hlRERzLsKoRQDnR+n18cyBaH3E5IlNZhVvx604InXrDpE/RBDQlZejCCjPfU+NWOrICAbVryRCf
 Xg/nK7LlnnpC/+zkjQ+7uLq8gIjVp4cbZ7ncPxng6grWnuaOk4SFSJY9oWNVTg3thR2N6+8Rjon
 YYr/uUMQKnbamrWcYTgepg/Jrt46OIOVWJajEgb4D8866XIiNQzL/vnG+5PGp1sKUkKcFfuMcrx
 QVszRPfbQMmp0DZOseprZKSuQD8sngnq1vTgZP+pTBPlOp0VX7db7XVvbLhKMnToNLkb7dI5
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0d8e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IAa2Q9qSwG3VCOmU5ZEA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HWwEKAN7IySkUR3Qbtw-NqHKDXpe6Bpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=716 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190102

On Mon, May 19, 2025 at 02:02:44PM +0530, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCS9100 and
> QCS9075 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
