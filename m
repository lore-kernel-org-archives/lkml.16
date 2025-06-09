Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348912E5B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480350; cv=none; b=lDCAkVmRgmbmAV1vYL00dsPOMVYCekenYWNGG6y8WNp+A0SMz87fBq4H4O9bFWAwzd8zyU72oLgFBoTNV7WY8jeYTLxfozLlOiMgGX2avAdCZYub4D8W1HFSdjy22nx0kz/RSxM1YX3KbP6vPSU1EW1Bghg/9LWxuc88WvSKID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480350; c=relaxed/simple;
	bh=i1NyMD39k9DlJtgfivY6zSvL9uXLZMIxx+VNY1NgDEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS1BCm4zH8Qy+6EVqpXkLaWtpb3xwtPJX4lIbmKhkj6Fsv7M/ddFLVrlZ6vT1WgR5DF87W+ufOi2Uy7H9+taYkc6JjLn+1cmhXbOyQ/OBSsDhRQQ2n7VnRpjg62yejCEr9i+4fngI9KD5F8JcaZ8zrpjT6exAziGe2iLkTR4JUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diua22Nr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diua22Nr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Oguh002424
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NBT6vmPj+KP/UP2fTnvuSaVe
	UdJIIkjYpa/Jy0VgFCY=; b=diua22Nrrjz2KtZChNi3CJHaoZfxHmKMpnF2/8ac
	6Rw6LhOiZVXiF/TSccUgnd+psfzrBGQbNoNcgoHQRClthbOfTZxU6uvHmZz8rSJ9
	S/37AYyD+P5ek5YVCw6K2UlOVIOS1UXWFYpnqFI4JKa+3Ntoiv9NS4wmW7g1N1kC
	wcQ1ZQFv7ShlfzRhhAL3ycdOJSZfYrkCcvLEOR6liAoNl2c8+DOtkOTs1+rJWTXb
	gNVyWXs2WRvYEekh+J9DDYAvsD1E7JGAo8kVJw81IdTdOuBR8P7xhmqXNM96hMID
	ufegKKs28t7faSitGANf6SQy9Fb8+vSM1Mpk6LonITL1Hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y13wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:45:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e6f5so1124076685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480345; x=1750085145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBT6vmPj+KP/UP2fTnvuSaVeUdJIIkjYpa/Jy0VgFCY=;
        b=ZSCo/CIxJjIloba/Wyvl0Hc8JhgkwhKEuqwI47Azn3QCgAgDBVBmuzPpgZ9G0ZfgEn
         2jWpm6Uzwf48U6+UBeuGmHZDB3wpPCLZLWBuWWxletL6znAWJae+HOohmQM3lQdDLQlk
         EV44KmnBh2BOGVr3VjTJWq3ImiQbyLVUJ7fKzc+vPRvRJhpd1sZK6qArNws7uGhUY6EO
         05N0JE/rXA0/pV5FbjuTN3SgQqs57O8kwAs3O5AEPdcTSLsX8ZeJQ7wGNhHtwNETKC1+
         iTAowjHx2az+20cPP4gJM+yGa0kiI8DfRh5hK/q4IQY83dvVWdF+VWtGohgU7uSkcVxM
         M5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUEoLqr7tINzIf5NTErBCc8z4DKYNw0gvVLYhFDWce/hkCzCJlhG3HqGk+3Orxk0WKKTMAxQmW/uTV4EsU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/td8ERncvdtX2ooVMDBHqEUP0CmeH381JeJx9sxVstrNGnteW
	Ti7knX2zX/zNYKFhw8+RiT2wbeK7ErjMT5Pk/76mw4b20F+LokoMyUiRsqALLJOmAMDXp3ktQPQ
	j/YyUndlC+7OSITsxMBc7cJfMa69cNiffkW42Lev8FYDNAVvDRn9xAP5O3e8v8ey0lN4=
X-Gm-Gg: ASbGncvtN/mISYaYCGb9Q3vb84MbgfgV7hHh6d9xpUqmOPwi/I4u61TEVZuq+p50wkh
	FA5gnPZ7sKOrKbeLU4aLcmaNliJttY1+K8c1B/96bf3+vhahp5+Y2xYjC+IF7ZONAMRpt9QT7VS
	/NKpsnUmnhq99x9wmUgO9AoMBXCN7kIjRENlc1C2m+dtLPPf+N345qRiAnutPHeHajBGQhL3g3m
	g/7H1uSvSIkLvh5BF7dFqg614FlsAVX9+W/OjGARwS8j4lfqRJ/PKJ1L1pdvR+wZHCF1LpmjJl4
	g8q5s//rKPZxPOwWnNsFFE+7aWGIVKtnYb6RS8Qkp+fqnarsQ4yNFTK0g5rrGSq4b5Pxf1dTQBB
	AYO8+7ZM2Kg==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d22987fa6emr1692498085a.17.1749480345318;
        Mon, 09 Jun 2025 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGd4u+n8gacssqQ0c7Zyx/dCkKu8dSHgSYT8DFdFzuA7K5Hkq7N50B9znPiIOhz5RFhpAO/w==
X-Received: by 2002:a05:620a:1921:b0:7d0:98a1:7aba with SMTP id af79cd13be357-7d22987fa6emr1692494085a.17.1749480344848;
        Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7796sm1188959e87.81.2025.06.09.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:45:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:45:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <kbpq6edonoorgukf5mybnvz4sm7aiefqhogp7k5cmyhy454wii@bk3nw7ivssjx>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX4DmKaye1qb8+
 Mi7R5W7En1mwYfjQNOmWSCcMu/1mmzhT0RTIWG99IFbWHlCDFYkGetAB/HS9BnOJcI6QVZ3SmCf
 bfLxFNq/xZX2Lf31VzUrGudUzD1uX2VvFLTcKrmlECtDAu66q22HWGd3XbkKPhzbdsnkktOxmV7
 6FzrfA5ECc5py/uSd7kpoWoQySS0NEFMNmZEQvIBEK0v7Rh15DeWk51w7dZ0kiwTMchemdQzEp8
 +Sd88S0H6gM9sif5PTdfd6ctLJbY41aIpge7RVn8mu4mzunF5o1pWLywlFZfr1tqaX+bPG5Hslf
 bagHp0D3jau6rncL+6n9fMkBwtB4WPmhkpHYsTUbstdKlK3TKqBHa984nsyn8+fipuUYvET0Pt/
 r+2BbZ6Y1Ha4whpOgNfs+9uz5nmErN/aU8VGxOsl4iTKYcHyzHZWEVlndwNlmDXX/WMdZcyc
X-Proofpoint-GUID: zgED1cR2D9OWufohx9AZzzLaN_Yo-SnA
X-Proofpoint-ORIG-GUID: zgED1cR2D9OWufohx9AZzzLaN_Yo-SnA
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f39a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=mIDvE2fUgOR8az-e3JcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=795 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:56PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE.
> Fix this to INTF_DP.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Please fix through the whole catalog rather than just touching one
machine.

Also, wrong subject. This is not a DP patch. Please fix subjects for all
your patches.

-- 
With best wishes
Dmitry
