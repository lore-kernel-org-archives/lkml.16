Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB2111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067499; cv=none; b=dlfMSXWrX6BzqYVquMw70nSoLMMhY6iNltswct2Kud3OStZzkQ81B7ZexDphrLkodW+QBHV+eDsA8McX7pEHWuF/kCxX6jOnZv7DI3Isc0VqHeZVJA/VgtvcQHhQYqyYRNrb0fFMVD3a4XLMVCPg2a9sBFqmJU3j0Prizxh6xfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067499; c=relaxed/simple;
	bh=3WWidUqE/P4OiyoNob2RxHbKDbzelMRJgU6M8hjkfFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZLxcA25mN64jT+6FDe9UVBdgP9OAdxn/NC1sp/qZveEeMkaqjuu2hslH+MopaaGpqZeE3tEiNICHdbZlTUO/5WhaObNid/40uzw4Udr3NacNj/RjunxGHZ1o9vAuLFN2Ru6fq54xJVUo4hQLztudgDwwRqX/+oGwn3ax02kMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6gwSwtx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gwSwtx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554Ailfq023897
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 20:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GETqFDBLOjNwkCUqjvq55LYL
	ugibUI1jy212SxBhuEo=; b=G6gwSwtxq2b8UV8M6h8UBQw8Q9GJs8UGaXL0zRNY
	h0/rNxpbY/Zn3+9uxXeuuhlFg7NfzkTsZFo1ZrtoQ42Cscff6vqVMhTJmyBL7WAJ
	L+Y5oIlY0giBGH47z1CWbjqEiucXZGQehxKnqQiNwMiUrLfSf3VZ61FurFlNETPD
	l2S6oy5H6l9XKkifvltS8/4KnetC9PLzy/Og0zOwY5kZW0MXuRgjOm4MWctM449t
	11vxFanZh3YztqgGsNPcF1FfgE6xTirR0lQ5YzUxEdZsRcUq1p4mCWBgzkDuw/AO
	XK0Vlv+BCEtuf4ZHHpTIz27shkTph7V/exNHLhvxAEFTMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472mn01eth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 20:04:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso23317285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067496; x=1749672296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GETqFDBLOjNwkCUqjvq55LYLugibUI1jy212SxBhuEo=;
        b=Pr/bDyhIbA/XdA3Ne/BwhQq/InwXC2TB9hn7hVD8ubh527HEQIxhZJcy2DHj+xidDa
         EyQ8ZvxQwH6IT4lDCFoZ4spjbdMb875b5uFyGDi1vhTZar42b4sJxrqUQhVzprDWRWAY
         GwNDqQkodBXIL3ztIsHjGNxq52+1RjsOLkKACXGpDJEhE6HY9VPiufFue/aSh+cZX7LW
         XZEAGi/km8QkyabG9KWzhztMirkrdVaYBT8YNBdVLJ5kdPe3SXPCkI+1HPLLoqgjbTL0
         hSikWCsSCuYjQcIYrxW57IVaxAkHcIn0JDfB/yb7Lf8AYDENBxGTByMC/ODFlvkIDZjk
         ABQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLIGquRrSJqaOwk2GIxxhXPLvrs3SC/k55UAPt4nHiJqv3P5IbjOXvO19LKCO5AsD4t8eDQlfWx01QpWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDch+9DsZYGKs18Ue+7jPLut+CTxaODm2bSsOcay4vIj5Tw1wX
	YdVX2no5lMT4Qc7gbR2uMz6Ljv9MBUwxDCg8BwYWhDyhZSrGTIBhOXvLYV6YbJFvdzg1DdZ4tDC
	CEytc/HUVAFlxEF061uVg1tuFfb9N+TM68nOR4ksv9ReAhnPB77ThzKWYrVTA0F+FL6U=
X-Gm-Gg: ASbGncsaa6VUrUMeIcT1ELfJ0MwyC4JybBIIoujzr9ueMaoBl20tJgbtBogqWgiGdRO
	+HxRLs7hIfIjxtX3TindRTjAcWD/FI4BODLjuYjEJHRPnwuBkreDGEjCWdsyYf6LSWBd46Sf00C
	ewDaW9lV8ZAax/5frA7L4O6ifZAV2J8cIul6mBzE8EkwsxeIaDzZAQECd2iol1yhhoGmWyMwZKx
	NXfa7X+ErDkEmyhQYSj6VV78Mg8IipMCaVoa+tEt3t03ONbCFsu3/GkMhxQA/jSAEt7Fs6fZvrL
	O3sPUMgfdIlawARILOE3aiA0ngW3UDJq0glc0dzVJ7UxS7Zw34eONGxDsAmdQQY7DQZei+/8eFc
	4KcvJ90VJeA==
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d21983eeafmr621583785a.13.1749067495802;
        Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjedRKZXk+O2uUWdObWriSOKjKQoYLKQ0YoQHobw0lYOQSTV8DP665A92Oru+2a6e7Y36Hw==
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d21983eeafmr621580885a.13.1749067495467;
        Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1a898sm22612531fa.18.2025.06.04.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:04:54 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <u7oip7hbhwc5ni3nd3aa3zemzz5sgdvfjeyn4ca3gttuee2335@dmqcz2m5iyxx>
References: <20250604175600.89902-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>
X-Proofpoint-ORIG-GUID: PD11BTOvA8mm0nPbCDTELtj3wTh6k14h
X-Proofpoint-GUID: PD11BTOvA8mm0nPbCDTELtj3wTh6k14h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE1OSBTYWx0ZWRfX+UqMQVriD93E
 LmE9MuUYDjNo7Q1WuYsYqjB6SVJESJ08c4H2fjjk+RGjgA1bL/3vR7g/yUWsYqiiQW165McN/An
 lw7WV8JPvImV2kjpaO5pb8LssVK03r9lgaLSP2qpa7ShyrqVlkEV/S/tODqU+GuQ/cPfTjrRMA+
 zQuc0om2k1IvbJt4HX/gwWEiP9+dbvoR38a4FXcxQMEShqnOWJMN8RUWFh8t44zvFcvUezC8Qu9
 tDue6lrTtrDLl+F33sqFMHc4EGyqiQQvOejtXRIwSxOiiXljY1y8t/NiPhclLQk2c+gFBoJ2L8G
 phKRpEvJBQ1vmDIFgmqjc2ytYaC8focQtzoTeIPh2YZusksCtdltv4CInK3shVN6CWZa9Rv95b5
 y6IRtYJmMiMMUjxPLGkJwR7Xi5qqZEAshrcY0XcjTjnK9m4RGONsJI+YcBaFPBpFixegCD2u
X-Authority-Analysis: v=2.4 cv=Y8/4sgeN c=1 sm=1 tr=0 ts=6840a6e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=hXrwuCzdAAAA:8 a=vIxmpEBTAAAA:8 a=cm27Pg_UAAAA:8 a=PqW8XdIGK9T-exQPSg8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AbCNNcS-KtgVtUcPdxgw:22 a=h_NzWJYh3K8fKrkdZWyT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=871 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040159

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Welcome!


-- 
With best wishes
Dmitry
