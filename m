Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4421E1A3B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747604844; cv=none; b=Ay31+WBlD2mBPZmQCXlqQITQiv3G4TCyPPrXCUunVrf+rMqAg4Q7ubze6hQY7JhvHU/wv+pAyUPyexMhQWU70HcfWdtQKLhv2TJ8XBSNpP4IZpAWNzYyNU4Obv3zFtoyPE6zi25Sv7kosPYVRKXPH5bSB/cNivB6Ss7pAGMwX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747604844; c=relaxed/simple;
	bh=8USPPKA8F08m/GfxBs2kIB4QqaZhO5O4rhsWjIsjEFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIuQ+MWhsLiF+Vk3d82MovV35d5agg8VsNkkw8o6Nv14R3m0gAyHc1F7AOw5TR8E9cDx2fWXe5uLv/vU8AEV3FOdRi2tNJ+OJM1CGwoZRjPpdxmrdvWeqDVQWY4l4O6PkJHbEzQgLEkyK5508woQSD9hFasGMTJxy60S6qaiwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeP0Lyu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeP0Lyu1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IKwOnD025251
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kWR32uQPCPLrbktI7pQ0oTp
	I2aRreLj3nIlYIE/3Vg=; b=EeP0Lyu1TGOr+KqYeKjy8C9h0ohluTsNpAlSQyhz
	82KV9YCHQOVl5CJZLaRU0ie+CoZTQfB4rwBbKZPxKnluLWOfnP60P45upbPR0rxf
	3BPX13eSldQV3FJ8uekUwWsGU9zbZbE6keQLWQqP4T/+8XyhWCk58PBCqrYJIbbN
	/krtPymI0ykugKX0KIAItNsjS0mneNLncmBp6sULvTnkzsoTkWUqe4E9SJvowdw9
	mflmx69nwYodDj7wiAtWh13+osUaiID0m1TlsL1s3qFTtNCaqxGZS427t4kgFmW0
	WzrkbTof3iv5eqzVMUEG2lNeuf0GOf2x/Qxyedsq/Hqfug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyjg9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b0a75decso110339946d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747604841; x=1748209641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kWR32uQPCPLrbktI7pQ0oTpI2aRreLj3nIlYIE/3Vg=;
        b=peV+esppyz5+bgsWT67GakUMV/9htk0T38OaYGpeLj7KJN/LWaxNJXxnFBqTQkApSk
         1x0FBziyj/2FcASeZBOUAzOkSPumbh+x3OvaiwIlXh88VMVhDzjMlDqlkxhA9n725zHL
         m2r9+Ut3yOW+RSZw/skCJT05Vy9PdUDIHSPYozfUv4lF/kS2rJ6WvnyQvU11WECksfdk
         8dox+JnRq83X+VtAIVsZrsADnlLRzb3DbPfFTNc1lxaFFihOwCTN5zEmGd7w71DVKtbm
         +R1hXMNzwZsa4XT1vbkasv1akyV7CQ558p9mLI0vfj4stqiapvxqykoEqFoh96x4OWy2
         tm8g==
X-Forwarded-Encrypted: i=1; AJvYcCUUekD7xG8p+q1gOrMK1b+AXe/rbLJBV7rby6DVEgyaFkRXGsyY9O/NQfqQVp/zMs8Jwm8azlYIyT7KXys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZV/wTmd+5CqX9Uv1Pc/BUnKlhzfAnTITOv7xrr1d47mM1kVY
	nfhq8HvMGo7NiUtN7f4jDpywN0veZqfatoLiZkl6I1Z6+b9DUt8Hjv8M4px6O2L0p86nl6AW80l
	RkxkuvZ9lRigwgUy5+zzV7Ud9Ol8GiKA97u/FiIDt1FW17GUpn+ta/CrNitKPpUD0Noo=
X-Gm-Gg: ASbGncvRNmH7dWtuZtdBFF84jTNO51IkVu1xWbwbrtb6JLpoG2WDbtlhvscb+gDhYuf
	/4iszq1nTs6QjBx1slfHMFnGq09carUieYk2yfH+u1L7DgvshT3NFTnn/Ugg8DaC9V9aCV5lpjC
	BTgq4UycuWR+m6cVsc02l7tOAIsydP8DZxkq7jahmasx67B4D+obQQ8C5bNmCu7NIZOYeG0mqzq
	FEOZQQ/NKR6vzhwx1xd9fC6q4TDp1ki3m5gG1ezxASLkqox82JSn1NeatDZJ1alIgbAm0mYB46p
	/dkEHNUQc9kHuDqCPrSA/u7lKUvLaNZ1hwLzj+m7LWg042PSmj0ZxiB8S/llIw7c6Evtb33B6ZU
	=
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800796d6.34.1747604840754;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYpLjwtw/2fMf7VCMh10ctMqY3tfAssm+NBI0lXDVy3BdKLAmoBlS3u2kQoxocRghI7rYOCA==
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800596d6.34.1747604840406;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca1f2sm15970451fa.29.2025.05.18.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:47:19 -0700 (PDT)
Date: Mon, 19 May 2025 00:47:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] clk: qcom: rpmh: make clkaN optional
Message-ID: <x67lmvo3mx66h22vza4tisxtbjlwhtiwkduwasucnrfr3exfdc@xuntucwpxnec>
References: <20250518130403.440971-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518130403.440971-1-mitltlatltl@gmail.com>
X-Proofpoint-GUID: UeYALMJqc260EP1r0SYkP_T_yOh5osBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIxNSBTYWx0ZWRfXyZfxb7qcO1oU
 4kdzh0CpEQFu0vi0XdHbkFzOi1nJNA33tEjZd0Nv8rflf/FMYKDya81QdNagBuVrLikWjWt1gxz
 ExL0xKVXLvc/5Zlu77RzdzpHq8rRImpShUlqHF995Q/jSb7Gb+vANzZBbU5eVRy//kXt2BO649W
 arRlXN0VWFfhiJKR8lWFVemsDmmiOlCAM/vYMlp/fVigsMrcy9IxtevdV8XWifnw4QQlubx/1lS
 Xb3GlE466l4j+XuaGk70s7LWj3ewYkYV3MmrH/60y1XEgCI50NuOZ77eLzDizj0xDkOoFHnaNbz
 yygPRNWyfnj84HPgx/mL0ghYC4oTlfcqr9J3lh8eK4us91/4Ft9mF+Z8OmnZ1ujEoqrwdXwZw/w
 t7k2V0AjqNHGAVruulfiUoOsA8t8vQ6ZpcgoHr/ZVnI16gRne9DuzOOo0wy63SumlQBaCfV4
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682a556a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=AK1EQsT5Zz8P7VizTGkA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: UeYALMJqc260EP1r0SYkP_T_yOh5osBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=686 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180215

On Sun, May 18, 2025 at 09:04:03PM +0800, Pengyu Luo wrote:
> On SM8650, clkaN are missing in cmd-db for some specific devices. This
> caused a boot failure. Printing log during initramfs phase, I found
> 
> [    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1
> 
> Adding the optional property to avoid probing failure which causes
> countless deferred probe. In the downstream tree,similar workarounds
> are introduced for SM7635, SM8550, SM8635, SM8650, SM8750.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Changes in v2:
> - using capital letters, sm[0-9]+ => SM[0-9]+, rpmh => RPMh (Dmitry)
> - correct typo, alform => plaform (Dmitry)
> - remove tested-by tag from myself (Dmitry)
> - line break to keep 80 characters per line (Dmitry)
> - Link to v1: https://lore.kernel.org/all/20250404072003.515796-1-mitltlatltl@gmail.com
> ---
>  drivers/clk/qcom/clk-rpmh.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
