Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D6233EC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354212; cv=none; b=joGir4NZFathugrHvxN5qQ6kkWWT2Ovo0V0RVL3k5FUIgng6vXdjMKyiW6pdU3OrYP/wLWDOoCSPe1pH+KlF8IMUQMYn7pIwocWZooGQze/jXCmf+78xdvAlvr2f2iQ2WOlScU4tXBsEzgGn5VsT81SfODD8Si7HKtn+K1Sba+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354212; c=relaxed/simple;
	bh=iBeS8g8EZOuo0Ct4JH56aw8BpDZuKC7Ao9GqsfV9XmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWC/MZh5FVBnvPbh+tqSM2wOMmlTDk3SeFGXSbBWR7Tr26o0aktEz2j+fZMxrGUtMB1TCExTJ0hYh9+UZqj2U0VPr7Veo9e8jJS7v/6BnAPdFptHu98DkZnizvChw0kH0Vof/WLGkrK2SAObTKCMVMqkJEC/avE8ZSSjcMLhY/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQXTx0s2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQXTx0s2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614JBZw018912
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 07:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7bePMCNo6s9CWEn8nZAib32fStGxAXvblHwxacgH9h0=; b=YQXTx0s2gmRoRRTu
	/1t/pdWyE2Xs9QQDcY5YDNwCtHzQHla6S6W2qfhvvK0lqxe2cOaHoIDMKRDLjtWz
	o5SivkPCM9bhz1U6LjXi3RheObxzWYUv7oQ4sGkPDcwCwX3B8Ij3UMOiuAReypMb
	UpOf7OAu8syH3yv8TEA5vnTzvG1g3n8pY0lAC3rCXOSsNHvExdBwROYd3lm1FYZ5
	5hwbl74IPhXbmlCfXo62yWJCWRA7jqduzMUqLgJieRUb+DEuZUjEjPXki7mlN4IW
	rOm8j+d+7agM06WVFTrP4pql/N6Da1Pq0FJY1xdS6ZTDwBoEjjiiwegffMlqXPwU
	2XVKLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxfhyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:16:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so1563787285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751354209; x=1751959009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bePMCNo6s9CWEn8nZAib32fStGxAXvblHwxacgH9h0=;
        b=Ss2MWShHVEEaUbv5a8wN+xAOH4OKwtOvQ1aa5QtfBcoWV7eTKxjHfRVa6VE6pV0oOu
         Ss/1H0zGVtAPsE50Y321TDoiaomhxBF0Z7EB9w9F/AFCYphWrkjEnznsWCfDHmRrDb+G
         VOOxOBj7opnhzykVQUdaonrboIzrDbBfMJdxS+qkbUgci27xIF+iPLhtB3Nsh5HbTGZJ
         Oprw+Sjlt+F7pDaKl/wxzNDcPUfsJinRea2+FGB6QNCc4rz737jq77q3497JiaAlOA4S
         hpyH7T3rf6KbRYjotBhBQRFGqMUhKsweiKH1H2AU2i++tkOBlgZDgrV9BEM5TbAqTv4W
         H6Og==
X-Forwarded-Encrypted: i=1; AJvYcCVuEmb24n+8izMAutxkcJpC6tobuEn0sPGydgarUwhE+G2X9YccqyWWAQXcakHxF0gGxKxSCW1SWyDQbYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQT0aumw5diJrmgatS/UADylNaoPxT/yjg/GrrHDVUC4JtU+T
	bslPVCxLDbGbfQU3FHK8rhT8zBU1Dv9rcvM0Fo9EJzKZeNuIH98XI/qkxihU0ucAFI2bd+BY71y
	cyrDqRc5M+igTGWLWOgfg4bp+F9TsAt/1tkFRn3Oomo8235iQyonB/VyWtMme8ci5dhQ=
X-Gm-Gg: ASbGncvCsoi/c8Y07TUR9poYdJtMJOhKZgeYSQ3TYbQTN/aT0HSVrNzxuyS0JcAeVTW
	TISwTwLnCLF2wzg3xJVLvNu6Wdp8Q4QR3eqVdWojRDJPbJtQsgfjLr+2B1TS1we5WHCr0KUhnBX
	J9bDpNsNQGxI5m7fKZnhm4QYC+jsyC3ukDfPgRqGpwjJnwhsGoFAD67bC+s1JRN1j2GAtXdGYQZ
	GKJQigcqcpu6guhrpbhRfCkp8PndOFHuLbDO6EXgissvvOdk3Uy5FN3d0drqAkSGsyqNFcC1EHR
	yrzRYV9WXGvo8AshR71OLwVyd15UVs/VzKVYQDuOl68wYT69u+qnWwaoRIOa4LR0ppqsYw/J2Xe
	N6lRpwpZjCbkC1FEkIxNbQ38jqA==
X-Received: by 2002:a05:620a:2905:b0:7d3:c6b0:1d91 with SMTP id af79cd13be357-7d4439381f7mr2124839885a.16.1751354208721;
        Tue, 01 Jul 2025 00:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeqXswStv+U/Onv2RDcDW1Mi4IfFKQEKv8cqdvaojVe4eihQkdJYBwt8K3nhFjea4N83Gxyw==
X-Received: by 2002:a05:620a:2905:b0:7d3:c6b0:1d91 with SMTP id af79cd13be357-7d4439381f7mr2124836585a.16.1751354208233;
        Tue, 01 Jul 2025 00:16:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f? (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2dd7b3sm1703993e87.228.2025.07.01.00.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:16:47 -0700 (PDT)
Message-ID: <958a0e70-9cbe-4362-b7b6-94ddd3acc240@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:16:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup connector
 by encoder
To: Andy Yan <andyshrk@163.com>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Herve Codina <herve.codina@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simona Vetter <simona.vetter@ffwll.ch>
References: <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
 <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
 <20250321-majestic-cicada-of-argument-15b2d0@houat>
 <vw2ncdomx3rwltb2xlo6nf3rapgcdtcjcodofgmecrzzabf7ji@pybsfv27jkq2>
 <mdwhn4wml3qpoqgzegiczintfs6geuuet54bip3uxlpc2a4bfl@c6momnue7z7y>
 <20250619-polar-aromatic-agama-1d46f7@houat>
 <6a46190b.5467.197c4a63530.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6a46190b.5467.197c4a63530.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfX8Dp5c/Qf4S0t
 0eBaRpw7N9dq1w9vxQNrjY2FUEid69EsTypGC1h8Zj/dTfjV7oApUGLcjnVGO+gE0bFbfQ2EKqt
 FofFL4kj23iY6XnXdK3/gXw+QWGdkbTGONaCmDU+NSJWpL2Gu//V5hlrPDDbiuLwj9pnL6YHGLs
 sOrWs9VXvY7oJKbqnT0YFojJFpKhyUFoLUB7K01PZ6BXKCQe1e8FXTWoRP/EhBs2JEHLaq3Xgqd
 6BceIVNGw6DpNS1HtWLgktwJPVdMkxYrlaJN1Ly3sRiLbpTYe745ILAi4iI0PN/vOqPs6J/l8r4
 QBW2PssPCQF0zF4sTXv7w1uI5Tozj96hvY34j9xP2syl1D7/91M9TiKWxySy0AhkAGWMxAqVeI1
 Lm9/rqYLK1vpDlCsR+7Qxs8TPReuUTOA3npIHPHDY+AHCRvDpZj57PVAMLqHJkjGonJTcbMk
X-Proofpoint-GUID: AidmoczdwlD-E_SUeocTJbUHoiJYLfRB
X-Proofpoint-ORIG-GUID: AidmoczdwlD-E_SUeocTJbUHoiJYLfRB
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68638b61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=kFPgMliZRkh9n9dvXI0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040

On 01/07/2025 09:21, Andy Yan wrote:
> Hello all，
> 
> At 2025-06-19 21:09:09, "Maxime Ripard" <mripard@kernel.org> wrote:
>> hdmi_audio_* have the reversed order compared to get_modes and
>> edid_read. Could you make sure the audio callbacks are using the same
>> order doing so?
> 
> And for the parameters order,  Dmitry, if you agree, I can send a patch
> to make them consistent.

Yes, please.

-- 
With best wishes
Dmitry
