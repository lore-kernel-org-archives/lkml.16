Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545238FB0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441329; cv=none; b=tD9gg6LH/lsCKfrwlamURUKg0CDoPpAXdCxH1q5IjWkmHH76YQtSkGcZBs5fo5fgZown3CBhyUSqA47DRpixrCg/F6KETawgPRYgzucuMBa1cULbyHMhZE1xlNlAD1THHGyDBcp6/1D6L3O34ITrMZ2k0O16AcQwqT/uuvEicuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441329; c=relaxed/simple;
	bh=oje1uT4DfQgi/MzRvPGP49Wn11GSzin9n3V01bfKijw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rqjbFz8QmcNW53YZgTuVan5aZqfovza4H0kAtgLA1KAB1RnLMkfHZ1wFvEgYmBuGrlLCRxZ8O/4yjasQGox2KIc9O+Llfg4TyKurO1Z+fM1etH8F4VW9uEp2WUA1BEDiZGf631g1Jz8Cukn1hrOIKpZBbYwe/AI8o0W4rsfDumA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jje2RgIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jje2RgIY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6OfRI028874
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSFpanlCd3QG3PGIaRTOjidLhr0r0dGvANBn6D3rDi8=; b=jje2RgIY1ZeyWFUa
	feaj7Cca3/ucoKI9zamf1wnCy4L3sVgCYy18VV+z9DCo7Rmfenofk9ChKw5W237r
	B7XCI+I7fFDtQrfxRpvvtxR4tocjl0ZoWqMLBBLU7gLSNR4CROTOyJPfizsUTlB7
	/5pQzVh5zspcCju1K8yS7ypHTQUgdby0p0B+zcWyplnjqEHhto8f1LDaNbPwsMWR
	1fAcU5gxefhJJVnHuAZlNMbftFGBq3vzIn712DltgAwbhxEF1p31hRS99um1vjw9
	vZe0eClZh9dvTMCDOdaPHTR1CFBVRdrdvQIniEhVFokuouwLEH0FJfQpLrpiDQ46
	V5z6bg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf2tpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:08:47 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3dd7e0c7195so25137815ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441314; x=1749046114;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSFpanlCd3QG3PGIaRTOjidLhr0r0dGvANBn6D3rDi8=;
        b=uzij6fx7iuKD3o52jE6qy/vjKUDSLClFBLATid2Fs3ksA0GAlEFAtQaxYruoDzAcVl
         EawDtkZLzPfXPlw52T//0J3raU9v0L1nOzu/fkjuj3N5pHS5p/IlpCZuHt/cT+pxJak7
         5qlpHxjGVlr8JoLzs+IfD3EHRYsDGns/2ze7X3xt5DsXMilqb9huPjmV1Yr3Oga+9HZg
         wuNQWvzQKRr2LE0CxESKpmT6QmGuchM6crnj7yZLrGqP3ax01p4EB9GHeDDQsKStwaxD
         Nd6UBaOWusnJJWhkQ7NTifuCZyNB45OveTWvp3ohj/yhPO/isNrNy0wq8zhmkUe6Eq5h
         ijsw==
X-Forwarded-Encrypted: i=1; AJvYcCULI/mrvAqNMjbM68A8MZabQimWqN+6lDiIUubIcH7Qd5mcozPnub5nylXhOCKsxOabeEemonN5SyZ+1Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQlciUmm5QgloSH+LiIqQ/nxww3+VW34OhdohjxNry2HswBhz
	AVmkTdavfqyklrF00T38wv5ZY2oFqhzuQrafx3cbEQ6RaZcppZh3DrunuI+XKtB1DWk4sBJfa7/
	cOgt3DMdb58Ppwj68as0gZNU6ALysGoKqKrVCuxOKFVmV6kO8LLDQ33/LnwusIQg50/I=
X-Gm-Gg: ASbGnctvdPKm+xdBj2LZ9tSmwFaa9k7LYmJxFyCA6cogrGSiPc5erq1CFYF8aHZkkSk
	4ic8LrlriSm9adYdAKYFssXRMJ0IW4ltg1xHVCNjGyZD4GTzLSHOKNzQBk4rBIWCnAshABdz0IV
	kaCWuRrfCUVu3hsQx8Mc3bWqlwP0D1PHmzzv87neDdYWB87yEFRT7DAVGaP4hB5QJVxp35ftt1x
	7OwhNgGbuPJEtnqB+BF7jt1rvRDNJjar501txvhutFMBEQIfnkcVicQjmZ7SDdyi52dx/4zYVzG
	jfvyV9OlB9fMr1+v8lphkYtgaXPffJEQjllYynJKVfIEIoE6lNTzKBSmV+mLo4MTK60GAn6Swti
	i8O6tBhqsq4qAyvsrVDX199Iz
X-Received: by 2002:a05:6e02:17c6:b0:3dc:8b57:b770 with SMTP id e9e14a558f8ab-3dc9b697450mr155527745ab.11.1748441314245;
        Wed, 28 May 2025 07:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3/IrURGfZHuF1uVWj+6vn3B5a1R5Lj0MNa3HPhG6oLZTFAIcn0Koqx6e0QULRt+G7HCLk4g==
X-Received: by 2002:a05:6e02:17c6:b0:3dc:8b57:b770 with SMTP id e9e14a558f8ab-3dc9b697450mr155527385ab.11.1748441313824;
        Wed, 28 May 2025 07:08:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79ee1ab5sm2604621fa.62.2025.05.28.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:08:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Heiko Stuebner <heiko@sntech.de>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250527225120.3361663-1-heiko@sntech.de>
References: <20250527225120.3361663-1-heiko@sntech.de>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix clk-disable removal
Message-Id: <174844131284.307638.13863376143596559629.b4-ty@oss.qualcomm.com>
Date: Wed, 28 May 2025 17:08:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683718ef cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XtzDPwPC1q_kEnb0TJMA:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: 5Zl5e0tVhDby3Z0Bdf7eyMDQ8ojBWdmU
X-Proofpoint-GUID: 5Zl5e0tVhDby3Z0Bdf7eyMDQ8ojBWdmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNCBTYWx0ZWRfXyGLOBbrlWaNV
 GNXd0WqFqYY6PLQYBWJb4uETNzxwTCmbsVAVMIGUaFHMDhxsu1GqLa0P1JlwJ29XlBFwp7c1y8V
 jH3aD9MwgzAmF8ySdJaa6ocr12y4F3CuNWbtHC3+qPx30NDVIu+Kxwk6f/USJ16szZsxgu/Djvj
 iqTnsigUUL7dZ+sk/Wfc64IImw3FO+L2dXeMBRmV3HJ5/z6LeLo8jVrJcd61MdNPWTeHb9Ncqhz
 CckqpEHkEUpiCJpcBMNUN71BnTlvGkzhR56Ogo7cCsiCRkDxBzeDwNwpUN1UcJKDUT62vlsJUVV
 LUds8+JWtZiyh95arVqGMH6RwMgkf2Gg9GUGDLWRZlBiltgHkNFwOMwfOoIQuUhnLpoTsSj93cf
 2yWO7lwxl8PwLhCCLskxmXSKseyZJmdfT23AnGVGrOv1cE1uso7RgMViHfNW5m3uXHNKgJzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=790 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280124

On Wed, 28 May 2025 00:51:19 +0200, Heiko Stuebner wrote:
> Commit 6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary
> calls to clk_disable_unprepare() during probing") removed the mismatched
> clock_disable calls from analogix_dp_probe.
> 
> But that patch was created and sent before
> commit e5e9fa9f7aad ("drm/bridge: analogix_dp: Add support to get panel
> from the DP AUX bus") was merged, so couldn't know about this change.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: analogix_dp: Fix clk-disable removal
      commit: fd03f82a026cc03cb8051a8c6487c99f96c9029f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

