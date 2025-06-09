Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19141E505
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480655; cv=none; b=UxhxwfW+JCD0b9C4KtxoJEyUMnk/EdhMw/7/rFKOVPRGqjUe+/GPUeuzZpONaRS75Li+DFT8dqcoDY6xWrpTiEI18dJYIg/X1juYX7Zyx2LoUWS8Tz8eD22lAIhcW6wftpftWaYTqvdNBW0i405Wu+WDCRshiPCnPIDeRvhCaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480655; c=relaxed/simple;
	bh=MLrUcG7/LwNeQq9R3qc88l6FMX43V32zju+rJyP11do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc1JzLzPLeJwptHsl7BrT7rHDAopTDtWogP3vOPFig3AnNBgSUWHc0bvlO7v1EzXJ8v4CFD63qHtAtGCupeR4+E887l9rdgWlSQCOdutCHmzFmoaMs8f63vPGeqnSKKXKQY/cp9qxiZHRA4PXJFqUBQFpgSZeUnPwBI22mW5n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vn7l4rV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vn7l4rV6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599UKLe006963
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gXXryfwVQKKpIclvmqazUHr2
	/hWdodYHJK2Hup7V7Y8=; b=Vn7l4rV6d1tRwlfrGew+pDVa/lLUy8xn8yP98UxB
	N6/weTZN304kA9Cq60R5UER39thPS+g+IxkYFuZf/80Jg0cfnUF8KRroc1/s4pYq
	WdUIXvU4UdKSzOaRboNGkgTL3B3biFoOSXpq8PZrMhG6jypUOnSYVI+8bLLMMDX5
	7y5qII6TD+Lujd1hv2uINMblOqrUJmsTefvtcx4BJurdxalUeCZq6VqxmdlJM9qM
	o26szVsf5mqyg1U1uWjoNa93Up8onE5xYUWb2fdgkUMvSSOmzUfQdD5trTMFTgwZ
	LdnCkIolm+douUQRGga5ghqNMDPsyUhmM5VjBe7h7xvMXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9ph98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:50:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso817561585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480652; x=1750085452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXXryfwVQKKpIclvmqazUHr2/hWdodYHJK2Hup7V7Y8=;
        b=srV+91YkPCTcDWmIbWSlOmJcsr2fnYiTPtbYiNuvGE2vzgsLHa4nzpJxbX0AiLFzej
         rE62JGTEW8XE9Xi+optl8TQGf1XYjyJ+kQQb6PxaaHpZEY0VIGc4ZxYQ8bpLkfFDR1tt
         kdNGeBMlT0brV37oll4N2UkqTKD/uzk/8cqQq2GxAMJWiOhgIuMhqyedWkDvkcP5UA5U
         6QBB5KZ4n3gktLnHE90/Z5YfV8UiNAAr3v6j1P4BOadI0lza171LKvwvR1YwEg8oNA4L
         YrOnd7W9ksEYu6vA8GaUI73OqP8TAnBy6tyCkbRVw5c07OaYxMQgh73jXrsolfCiI0gx
         XqvA==
X-Forwarded-Encrypted: i=1; AJvYcCUx67UMTK/V15MGPGMqOfwZUQzrkUB3uD9xc5hiH8fUZY0L3cENX9ioZsRmu2XW+T/2yDi1z9RUmDqyuGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWElZjKL/gr/FBE26NxyhbqYA074Ve9pFQ2PZ/Ht7k6zMQDMa
	V/FSeAd8aTKbyASqtz0/MtYGqCXv/jVB+vt6mQLpgM6XK94jw9o0f4Kfz5RAHvjWQ+DJqMPbJ0A
	EUoPxbHymXVjJ99OEaJP0msZHLaEA2KvhBa9SbD0JtJjgyxnHciUiMRfnfbuHvlChVwY=
X-Gm-Gg: ASbGncsS5FpHCbIb8kkBLLEMuP4LomI0BDKeKhRv9BCZd6DvTysr03xlFXJiQE5o7FQ
	3JoJKc6O4b2eirOyG9QIDCQQc+4q0OvoHPbwbuVNaD1NtgN2RFYYt7Qb44giV8MaG/rQbUUjmeW
	kgHBWVQ502LtNzArOccE32gII5D5Twz/Ja394Xf97HtS1WiosLh5h9+cVppnkTTgAV+0C+cyyfh
	u6j1/osfozDRqVPm2hKrrbdqGauaPMrKlaMcAx4a5KgG+4njtxcT/l4YcjA5IyCC95W7PssELyw
	Cud7XIls1deSyKOfMeFsJHXex0doS3o1zcjjbnQrKXoCcqBYlEvpCnnSgtyX2jKRM6Jqf5E9KsA
	=
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2478840785a.36.1749480651695;
        Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9KQZ5csfFeRf19Lg6Rga4uNIbAQ4j9v76mKsnJL2pr8UbN8vt6wkRD/Yt3tovojhBPPxXCA==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2478835785a.36.1749480651310;
        Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7796sm1190964e87.81.2025.06.09.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:50:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:50:49 +0300
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
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: iQhAGM18rOSNbRAaOHtZI4SafZJqsCFr
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846f4cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JLTXKlIeVVy5508LhJsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iQhAGM18rOSNbRAaOHtZI4SafZJqsCFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfX12NLhb6QBeKl
 TRr+ErzEP3h3o7DxqJ7VBtas+4nU8StKmKn0zPj0oseTbtZ5qfnap5omC6laVZ9L8CteXnEMmSy
 UEVZrEwP5neM5x6OHMss8le3OQv1l9Bo2oEfCCUzZCj5IuogpI1y6jrwRzmIqtiGgbHbaf4PyUg
 m3VcZ0cwEGl+vsf9eJHDAhsy7F7ZZ88Sf8XGZoRPQ3SEbi5ngPJmaB4YgSX152zGuZrFwEOEila
 E24DZY3nqTzO+Uw1jDbWSqHGcVQ57pItGQW5Jt/1En1YpesOV50dfL2nSwSAaPz0RopDtkvzTWI
 q9F1IXSWfW6sOQlftIFUQmGy5qLOQOIfAOs0cahqKETaNl0e3OHhMG5pQShAPEf2jZ8/zDYY81l
 OgHL4Btx6/Y8mgCxYpNh78GnXqBR/tasBpr7sU2hkvSkbc9oV94owmiOxJpJOSWOEYOMukap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=792 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090109

On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.

Were non-blocking commits not supported before this patch?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
