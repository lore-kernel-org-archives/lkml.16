Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994DD219313
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607960; cv=none; b=ilaS3MiHJaU4Siv1BUDaecrhETL6ckRkFL/l8PmhPx9QkpeEJjjDCd1pJVxo9DpBvZMCANjzhJ6W3/ewWN6B4TdjisvbkCW0K17LYTlVrMqNUlQy0IOepMQbGxbWQqyPCAJAXt95XoUALSJyEQtMkzlRVA8cuj/K1OGt7i/+CNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607960; c=relaxed/simple;
	bh=k8cBQFBtsUcnKnz0V/Nj0OYz9EHXAT2PzP5BKRD8MVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1hn8X31wd9kvk+7lMCJkoSTeH5icSuamfLe8P4yGm6Ofzs6tHGYKX6l0ol/gRqqr9E/VJfTp5+92cLM43Vz59s7TrsxQRG39qpo5Vbr22aaYQ4saCJVnVF3nsuU+6w9SxNNMJ6aljQH/PLYy7ab9eOe7k//oxFjW7Ip9PEkqWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buHlkdeU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buHlkdeU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuoq024719
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LRv92KOIwcjmIzz9Q5TxqXo1
	6+d8D9ntGnUnJ9cFXrw=; b=buHlkdeUCX2IhNHrdS2sz3oiWrOK1CJJhiiCDn07
	fUt8T4w1jDWuxz5UY4UXBWypUlbeIc/b1tvICgWaYNHZBBXoTQH710SjWvxUHs4e
	eyt2LBwVssiGYbKvZJ48NSSOA5fDrKCDm5cqN3SWS3Mc0CsoYZlotSRNfybmXaMy
	pWQkMWSFdXvEK5e+rhIuXaGiYx+S4GsKDPnDO7dz5PCU/55mflf3vJhAuq9s7jDE
	0t8h24AyKNI7XC+7EN+Sf+tSE39282irX6309eWPCJ0tjkg3Qv1S8USTGFEmOvsO
	VkYdWLrjb3f97pdnBXWdR0rJbux0j/ZP+kVNfCWkvnIJwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0sxb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:05:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ead629f6c6so40042536d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607956; x=1746212756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRv92KOIwcjmIzz9Q5TxqXo16+d8D9ntGnUnJ9cFXrw=;
        b=FFssE8FKWRTS+LrZyrycFnCiEhJY8DR6p/3j9y7d+M+dqdK4RsnnR3fATx3lUaj/lw
         5TQJ2tTNmt+7gBOB3Si3ygBuLk4FBHxIuIMJV4DjikY23S2hMnbf/BLKhz4xCLrKlZEu
         zeaWWLdIWyb9SuLrRSp6qFJs71f2cS1GhFrD/Z0RAaPh73j6SdQsUQwEeM4JwniV05Y6
         l6V5M1Aw+2YBGxmyJ5JlwYfKn3py1kWuC/9qw+gVWc/R76zF7RCrNijLGCG5z4cuhXLx
         tiaqF93rMknBwHrdZxKJgeeZZf3yWmSkIrHfTrB5JnoUP+hrNtTBsXDueklxCy8IzTCj
         yyKg==
X-Forwarded-Encrypted: i=1; AJvYcCW7aG4SramPH82Vnnaflbla3u+6P/8jHiG2hEWSv5dq2d2DeO01BsZ+1OGVPAvTn+FfR+fUcGdGd2q5o3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9uz/CRCHYKbsb+DB2rNI2EbgiMfmN3OTnq5WzB7nGlqcD+T/P
	/4A0OghzMgfMsn1uLBLDtHVliUs1p+kWpwJiYlYNIgrzQiErBA8X47MORWJDl43nlJjDBcQntFZ
	A9xjspOhBftEpHDO3KMvBKEIcduhEHw/5peC2ZaexVLHlbcZyYMdUVoPSdjX3eh4=
X-Gm-Gg: ASbGncuHxA8WG0dNBaY0kLzDZo985bbI9WV7Ju/ycbuDsZ/f8CxIaWria5+8nuPjE7E
	5bsvnhkY9WxblzR80em8P1fs3UdKdx/Fo1AKENSKJlMyk4VHuudpuy/3aXl9Z/QXWfzbTgzy1xl
	GLrXciAAPQ8E4NaGMvLxWXr5FtbI4GTyK7m0bv60PlYLh7giD8dfgoWiaBOT4FO8UXVuwYArOfH
	Q2R9chfUiGGjwFueLTu27hPd39VbHfnjvyQeFeXR1BnBtJLrJUd+zMHRv/8UExaq/bKseAcI7du
	ALjV/URQWWXTvU3SJ0XsiC2bQnhb92FGQy5HZTHuP1uSoDwQxgaQUlF/xtP0O3a3xDA5y4PacJI
	=
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id af79cd13be357-7c9607b23d1mr561079985a.53.1745607956413;
        Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSIuxa3fWgHA8r+nKVNS0fd/thKUyHE882nF18+9xWUpORLb5D/kIP8t14NpMUJ3MCW0p8BA==
X-Received: by 2002:a05:620a:4103:b0:7c8:b141:29a with SMTP id af79cd13be357-7c9607b23d1mr561076585a.53.1745607956073;
        Fri, 25 Apr 2025 12:05:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf7dsm692860e87.100.2025.04.25.12.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:05:53 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:05:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <kawx45acgpl4ywifjnszqhddtq363etjsyo4jomg7mbtqmmtev@nqghr5rtsoen>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: 3CLRc_nfNgWs9AXhfD-ct1SnKxFK2q6v
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bdd15 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-fZx5E-Z4OSi-0Z-ZQ4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 3CLRc_nfNgWs9AXhfD-ct1SnKxFK2q6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNiBTYWx0ZWRfX7qirRitVgnGX W4JqwVyx/R5RPppNdTEfiuGCiVa3RRNLdbxoCOeYOZV2t+V3hEgeKxmKBxeEZDyoObEMPsCe8UI dpVShHTGZ8SYXcX4vSPtA0iJkjTUxqz+d/h/Ls475tIsLm8AUYxglyIwaKxJ9M5J8GyUGxf5ipP
 7gaWiRMzeopEEyntyliZFWzUyTM7M1I3nf5e4A8bRNwUtJ2QOmUU2PfHQyb2l5z+4sPiFEelpKT kFOrxx6+WIkK/Cbz67h5bol8qlF2jiMIrTgUjHguE/Id12F+p8ATs4F771bBztq7rRZ2E9baXNf 8c4CVFu8JXAu80tkEksd2hJIELn5ye2+t65mzJlE1hEsA0ARleCTR2kl4fePMC/8tfjQ7zOSn8+
 16tNswaLkPxP//0OA+Z1lU2H0HZrFH7V+SZVeTsLhiclAVsSUxAz82zO1oIu7ZF6IX6wvxyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=804 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250136

On Thu, Apr 17, 2025 at 04:10:34AM +0200, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  1 +
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
