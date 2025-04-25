Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F351FBC8D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602263; cv=none; b=c7GnbW8hNtOrb76J3M/zBpBRTjtNDeHHn4H7BvcOCvZf39ekIwF6Su4ciZgkDRaeMaEqEA0X04PPaxtzhQCrx6uBi78uH1jkwosyERX9mwiJ+9ZJwOj7k6eRKWyW4R70cOcmHZMLcdNEv+DmmiVS1WwTTHLnmQTAdYNX6E1seaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602263; c=relaxed/simple;
	bh=2Y7wGlQM2yG/HX9oFJj7fpeCtYJynzOdaQ4/Ghdq82w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHabU0ZhBaob3Tp+0AGutpGy5JysB6TTd9FB3Zt+2rbFWe/inTNjidQF1ihJCbP+t3qyPozUP/nAiEPnDCk/g/1SpkTPbXNQBA1/mjLezUvnD3arSFJl4uWaPLSV0ifhcjihaXf/Ru+/wKpNu7o4ncinR0E+uSjCfV4eTzzR5bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDsUZthZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDsUZthZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqRH031939
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=21WlXd5F9nKR9C8cuYQfBPNB
	+eYIpbIQPgwD66DZLf8=; b=EDsUZthZSQ9irj4dfWoZULdGU+QQhAZ92nfQIApN
	wypswh7cwS0wpr4IaswrhqHxE1P/QLNLuZ5KvvUZd5GQmOj7mPKSUsu/RWHBH3NU
	gZzukiTfeSLXmAk74tOSDRBk+7S+Ku2O1pUB69Zjr6K2lK6RCl2m+uEmO8ebRVNX
	scFfEktwMxly00fV7w/C7LUeEX394zM1PvgRnug1ovi4oPuOb9bat/mESkpU8kWV
	b8fksW9aS8U9fIblvZC5fhH0Q7AcfQsocqu3vhLmiHSacq3SA/ntI6H4oh+JNy7q
	OQpf0kDfXb5tgZ3G7vOx/efIdCqcUbVl4QrPLxwVSRludA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9tkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:31:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e9f6e00so574755785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602254; x=1746207054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21WlXd5F9nKR9C8cuYQfBPNB+eYIpbIQPgwD66DZLf8=;
        b=GKodsEWAAeYNAd4GA7Er1mR9wZP9QbRjzbZm4lbpT5WSdcO02+1rcEIQVoxYzrIwHb
         cjc+2PJ13YFtmG3qy1AYut+Oanh9Uutajr0YKZoBCH+nquLFu4i7plyVqHbqoJt8+FPE
         YU/fSznIx/NedUxRkSPpoq6romY4ZsoQdM9oegg33K76QHJGpkCU/qvhWBLUFukkfMLU
         v7r8V5aVyHrAFgDZrVajf43P0WwhXU53mItZaS7XAx4AM1UCk9+TbS2Gu4LFVAmYs1Q4
         GYVjIYhgeJG1KsPiTFlksDVUbpDyMxuS1MfXX0rFDkcpAicNxzM6lYGkGmbktFITNzNG
         FncQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnN89DaFbh+Moh7d5sGRglugjEwJi+YtD+l2UiuvFa4o5WQx/b8zeU2WVY+wg3//j+DkmYUw0i6tDFnLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Z8dCRr+w5FCXpmLxlIJTufB73bfYhiA7nqgOlIo9LfuNNl0h
	nrITNJMNqvP89z7rVXU1njrL1+Rtt1pPGIm6F+1EMCjd2Jhg+FxoUBYpMC0fGRVX57V0d+tSMCu
	UfDoGsnAHUMQffhAly4kOaeTNhwSVQkyQ9ZdkuLwwSYoyL26QZRAhEGilABzt9lI=
X-Gm-Gg: ASbGncvwEiqQO/fJ2Dfm7d7xp23dxpnAW8q/Ec82/0uCRArYUo2LlLZKii4ooj6T3IO
	DGeDjsKcojI7HXndzOTU73Dpj4d49X5bdimcRowRfaSRqFYUevOGevVTM3V5fUG1CZ5KS95NS9m
	44EhFbnYSmosyApTroUqWZIPosdpRdc2YmHxXCdCSTM9VkDwg5p4JYvjSXuWtMIA3Li3RSiso90
	0TEOzpMHo78QD7LL0gjvFlClwGQ+NxjD1Z46/nDY+WWxYxbrG7EVXzW130k2nSvbr3N7KJNQdvA
	A8Dadb3gzPHGtsNUWczR4QFnsroKM4V/ZdrR7S5tvaz/z3sgmSZLu+/K4GdnAEG/yIovn8SFtoE
	=
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972472685a.20.1745602253967;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENeplBqCuFfk4C2SguqDeztUVPytcVD9nnZXiZ4kjuj5HHA+ECvqnxncLgGy8g+RnWX1Lq1Q==
X-Received: by 2002:a05:620a:4694:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c95863f7b8mr972469785a.20.1745602253649;
        Fri, 25 Apr 2025 10:30:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a426sm8223461fa.109.2025.04.25.10.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:30:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:30:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm
 defines for reg
Message-ID: <vjfkesae2gszpvjvgfgpctqumdxriwha6lolmmke6fzdfweuda@4fsi7i4kmepb>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfX+f1ZcDPbxlcU kxVhcNnms65Oqahu8p2zvTUEfGGEc1KzraYOjUJvm6IwEqXVQavDjuUOo5Fy0cEfA/gvk7d0WAI sfVUUr3tvyYtDgvdnPeaujTpSBXLW7L5JrrHxA6XV7ZdRgYv6yxHW1ZwDjJtmkdATVG7Vfsogy4
 nXyeO9t5CsgwIt6zCl0uXsDbytM5dX4ClfLUdhYNZFBJNHC76YFezueDPkUbspMQIev1UukRVg8 s4/HcNYnxUAPUjLJDra6/nDYedoVkUqvDRPREfZMgrz0knOoExlnVMbd2Vhfl7eyYWZQQEJ/XxI Y038sMq6Sl3D3Ef7o3CdtlE8BKRWk+0OvZPUcPQw8+15GNCh53sM9/YBvs/Lv7pkm6RPWUB3dSK
 uBF2hIdiuplBHGXP1xcCtMnN3o57TQyTrM5WeA0Yql9/GMEUUhpqgWXYqi0eZHVdX/XlXRrk
X-Proofpoint-GUID: INXnja1TupY5a3hhFokKCZdB3R8aYjYG
X-Proofpoint-ORIG-GUID: INXnja1TupY5a3hhFokKCZdB3R8aYjYG
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bc6d4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=590 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:40PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
