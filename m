Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE351917ED
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763969; cv=none; b=CRMFhqbQWMONPTioITgQAKzLmTwSvTwI3fVgMWxLmeub2EedCXQDGo2WAMZWzad9pWK4S1tSbEJPzu1qzO4Vf3vyyNuG+JoEJEULuf9kbg8THT3Tc4ifmNoTUg2IhkeM2DcNhnZR95sPK0fL1SAlZfIqHv8Xq3Za6R1GD8YvpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763969; c=relaxed/simple;
	bh=ANcChlJr9eoaI0yTEGrqLm3beJYnUN4pKAwlg9p5Su0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwpHNh0POHPS9NDZjRG99muS0hYJ37CM8an3Fzj/roHTVNsRf6uU5rHNk5Oz74QjkeZzZD4sq4FOf8de0FOj164dTEo0DSFXI+mM8f8lJ66PgTrxUO2FQjP+noCuh+4gMX6mzuUJXbHhivuoP8AzsBv9un+zmayZWjoddjfmjD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fra72wAX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fra72wAX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5516qpUP026223
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1AmXT5tapy+pVsFQFAdwuik
	ifdIdVK917nZ3Tym9yA=; b=Fra72wAXW72RhPq7x4RoSVc+83r3vxbY2pZR8Ipi
	m7XecjhnWUyo0qzEujb/TPpacESAjHSkzMc9kE9Bfnys4zPIvicTPX0i1UWTVuqt
	wjAnZ6ciZFXvJjbWebVo0lKcVHcU8iqb6Jk8glAdBrOm64tulaWKP+AuFKvlHZEd
	SHnQgFqLYCIeOyVM3AK4maEzuORAK1jvPV2xuPc7ocXsIpRmEqoJERBAJC0ECVdl
	u2GYDzjzGszeedCA1mIiztL7E/aGbifxdhqKBOCyu7ODO2LCSCY226iOSvtKX1lv
	ObujSHpN/Vg5UzLKEd/0gMp20YJQ2ZNCe8GwshVppuSqOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkr222e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:46:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so588677985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763966; x=1749368766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1AmXT5tapy+pVsFQFAdwuikifdIdVK917nZ3Tym9yA=;
        b=o+04rjfdLDA0O0PlQdbCJd2G0XSt13hmhAv1PT7rqEorrTsfI96jhlRCYLJnOTvfvL
         wUWQkVQOaR67gjV2TCINIoP0lB0B54wUk1Br+PNNqggJBvkLg3pgBrEm6cs0PqquKJoA
         5oZciatscVNLJKkVF6/LvDY16SsOsMBzksy9at8yG9kb+d93vVRMzZhnagp0tHW6aIn1
         VG89FdDD9W575KUcvCSc1NE6g9ycmolXf/Fx/3vB8JfnfEjeWjQ94ACDDPsKA/15GuMp
         /2W1g5dk/KusYDCVr6qjlf1MlutmB2s2sAWrjCEKXsFIcU4CPYrC6rw2ivJjjukHb2sh
         Sh/A==
X-Forwarded-Encrypted: i=1; AJvYcCWyDfoCovMqf8d/E+CMEoU0WRGzbTipYGeav4kSDk7YmAEBP0qCXrUINk2XLsTfeGvfKmpIpMzSc/WXz2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBurxdYUnEnlZBJSza+NonitcoJJyv+plXnkwDV9wC1RMIDr2r
	27SIDt0D3ZcRDCbFJPwLH3NhtQBnkpOKYR6BQI2Lg/mJgKadjnpTJujO2/zU7MoEAI6a9kGCBWE
	482M5MEbaGOjXszzkcsCfuJBYVC7tq3i1XB8FnQ/LZ3a9jJM2bWIkBpfgQymNN4/X/r8=
X-Gm-Gg: ASbGnct/UwjdOTXPA1XJ2cR1/u8CquDr7YTbrndidFI3sJwNU1VxINSq7hextKj5urR
	d+gP0V2i98zJLZO++2FVSKy2OyPgfQjPALPNzcA4fiFgHMacdcVnHduqHyL3oODg01aRj0TFbGz
	dtahhvNu60Yf23VlRhq/aIxJTwRcosuLPlNkel7yaGyiFTBYYYxZFvXROyp7W5dieAFMLnDfZl3
	LwpeHSHPhKQ5W02hLcZLE814buBRHjjQsCPiCz+nYS2e3qHIXL7iuxqisJh2mX774AY8dePciXd
	z9IrGKJrmGinXGe2OgITGJgReLmz1XbMa/MDJ6SL8qUKS1a37B5qtaxiyf0+6+MfZcPKZAkjN7o
	=
X-Received: by 2002:a05:620a:4554:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d0eac47803mr602358585a.18.1748763965845;
        Sun, 01 Jun 2025 00:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrA56s48pi50lZEFzKlxMpRpFDDPAnSmnts7OMgR3IXd5D7gPYqiUMgfLK1attjQg4WbU/4Q==
X-Received: by 2002:a05:620a:4554:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d0eac47803mr602356685a.18.1748763965503;
        Sun, 01 Jun 2025 00:46:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm1221377e87.244.2025.06.01.00.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:46:04 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:46:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
Message-ID: <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: diZt0yFKZgleSknboeniN-yFp0QYh7UQ
X-Authority-Analysis: v=2.4 cv=OMMn3TaB c=1 sm=1 tr=0 ts=683c053f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=q0N60QXNJ1_sxjtBk_cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: diZt0yFKZgleSknboeniN-yFp0QYh7UQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MiBTYWx0ZWRfX6tb0kEnyxr4M
 fM++U+QrUT2TACcqZ/b+CHz2dn3ewh2FTU8mwWgNJfmpVlXchzV/oLw/2e1KvSmy8jbItfJGBWr
 soi6UbESq86PZgCv3yyJeQ/HrEHtYS5IOadMkIi5kI3FRoE17CXDDvhsQhRFpdWOo0wKr3eJUHo
 JxVFwD4ybfTnddNYG6Pk7r3wOsZLVIv9OQYf5fPEZFi/W7qwq1Ow9KGM1lYkGZuSB+Ah5X7BnSC
 Os81SfQYa30+WHCjqyra4BOARH7uvu4cZ6+rEdvCqr9QU6k+FpDEvMyZinTZjQn3Xt492lumqzo
 aXbQKzq7o3POp4IuUn1mh8Y74VlwRhQLYcTWPDrFKEj4J7Cor4XDd9VsCkRCv9ZpFiLharu4JKP
 lkjf5SqkSCxriq/EUG2NS/JmANqRL0xWHBKaotIJ3Rc4JG+pIC0Y4tjnSE8/Ad50BW9IH/ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=986
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010062

On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill in the correct data for the production SKU.
> 
> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Verified against msm-4.4

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
