Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FC720C037
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019679; cv=none; b=hi63fRHWDbPAprnXhnen4E/uue2S9fVjzHaST0LaoVC0FaXBjdBk0OaEFIKxHhcw2SIYMcr1+D+R0ecERCQqejvLCuHQXATGdMJqP+9wXQbWJTYWm+f/xrYakQU0wwP7NZl38c0N55+TaTH9nYJcN0WJBFK3aawX1xh6uUQBdZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019679; c=relaxed/simple;
	bh=6C0vozgC31EMiPaikNIk3gz1e5iKRvGvdRxBSvzVylA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQFyajNzKsgHrmoOp5zuKMklaJDWzPCrkoZijXM4MdH4+Xfb6fNvsgyIGqAIw4YLswsJlAWU98oSEgwXtLhEkrQfW1hPY6wv5JPjMwqfqHgadARz0TB4mXLqRAVoeDG83oEtPg+DpqoUXhFGkTacBeJ1twqbYsQssB+WQ/z2vKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mE6nSEC5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mE6nSEC5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IG2La0013274
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGWkrsI6bbJMRZrZKPu35wIq
	Uji9PLOWunitcRgxc4M=; b=mE6nSEC5ujtcc8FOu5n1qH0jOhzQscWdH2jBNdcf
	dBGmsntq4ab3ANwzCQMSw+sJcfj1/Eszp0KMV2XuhNgLtQfspSyTtmL8vnonxxRX
	qcNQyq71t7PaiXw63ryZzQeCZZph6waGNHHBRacOsgXbxbZG4Vh+f4fA9f3ygl7Q
	ipDdffRxIZuAaz+ANEG1ED4+lyRvNsZV0pBidyxT5oftz2SAnRjoL4ABb51op8lX
	qG5GJUa0heBfNELFOdQy6zHIHlA/owE1KqQunjbcZYr7gwZG9mnyOqMBmJFoe58P
	goKIHEHmMKzJr1J1QuRaNfo1oo9eZF0FNJKPQFqePKp4pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvgfu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:41:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c8f8ab79so347911585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019676; x=1745624476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGWkrsI6bbJMRZrZKPu35wIqUji9PLOWunitcRgxc4M=;
        b=VvZsv47fUzuCFvFQ2/C623hLpzoxAm75WmF0YUimkmeyLtH9WRKiQMgksK4Qo6WULq
         4woS4xMwvUVbGIMjkpkJn3/r4l8P8IcCa6sociN6mh7aiCxw5ZuuoCCP2vYN2IrKvBe/
         nNFF2f2M9RBVcPCRB2CVV5DmNioVlMhiZPhyY4ZhgTXjiEHKOqUCLdL8NK6vlyG5cRp/
         WX/RGNQKrIuY+QUWdKdHjaBug+adkZF1FMBOBGkAKGuVJxAJZKidCoeKmZQc7RDujBgX
         755g1Wr8D+Uot8PGBT6FLG7PNHc81kej6voHr2GyeKvuAVAtofmHR7VsmibCVg3t4chs
         rFyA==
X-Forwarded-Encrypted: i=1; AJvYcCXiFvC4w6tbXhyn6FNmedsGKiPZzHyLsTfppDmlkMMXgd5Eqn2KpOoxsrp3xNWtcsHxkpUu7GND/paRnCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMAdSZ4NtUVFWSD1JKDBR0QXIJEYHVnEVOqZzcHbDQTI+vIyf
	1bBUNr2cHQJ1urF7YGV36H1ZZEbU4mngPpkXVOqfC5Ww0SwPsYhVdfjPP46LXZEYjJccXYUQHqw
	KwrHjJyWRSnuXDpc9eneRpBdqtyou18hxTZpT/vgJEG5+jksvSznNnHA651ujg1o=
X-Gm-Gg: ASbGnctZJETdC/THUvizzrhZhY01+Irn8MBcsV12BXVwuGgf+oaWZSrJ+SJ/QtaEsD6
	bIlFdHypChG8vTg1/RgLa9MIEvVG+XkY+gxdbZOhKA69ZwJ2vpkhAHir45WHztu3G/ncMlf1b1i
	xJs0lKP+Nng7+qeHXsuRhnOlGX9qNvA6gPirw8blJTgOUVPK3mSnvC9EXXJPssQZkCSARQs7kfk
	P3BaLsHFBmZTgucjA4kx38a2mnrN4nZ8EFtTXU1ffD+nX+FSfAhnQQoDBAEHM7l4HPXEnYakU/m
	x2KxfJQw/AAqHkRxqcDMK9Bb82mmccVRk1FWjz8yVx0dnel556iWIEvGU4pCWQfRhGMiIzvmYyY
	=
X-Received: by 2002:a05:620a:2887:b0:7c5:5d13:f188 with SMTP id af79cd13be357-7c927fb9062mr570342285a.26.1745019675912;
        Fri, 18 Apr 2025 16:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNEOqCTwH7E7vLdne7Oh6e7Mb+h93X+PhMq8Qo+whymIytCNczG+rD7jrHK6N9QiZxVSL+pA==
X-Received: by 2002:a05:620a:2887:b0:7c5:5d13:f188 with SMTP id af79cd13be357-7c927fb9062mr570338685a.26.1745019675504;
        Fri, 18 Apr 2025 16:41:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cf943sm305840e87.137.2025.04.18.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:41:14 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:41:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Message-ID: <q6eqlq4ltz6nnnqrja3obpv35qjbuqjqqj25ekcl5wgd4yubeq@gw3n6r44g32d>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-5-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: fEfqBw70bj5SkJOgc1whSucw1KdN2uBA
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6802e31d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CXSf308d6hWwThVqTUoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: fEfqBw70bj5SkJOgc1whSucw1KdN2uBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180181

On Fri, Apr 18, 2025 at 03:13:46PM +0200, Luca Weiss wrote:
> Add the required nodes for sound playback via a connected external
> display (DisplayPort over USB-C).
> 
> In user space just the following route needs to be set (e.g. using
> ALSA UCM):
> 
>   amixer -c0 cset name='DISPLAY_PORT_RX Audio Mixer MultiMedia1' 1
> 
> Afterwards one can play audio on the MultiMedia1 sound device, e.g.:
> 
>   aplay -D plughw:0,0 test.wav
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
