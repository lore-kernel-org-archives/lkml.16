Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0233D17C98
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715363; cv=none; b=KAbCs5YN073x90AtehHm4GQ/bv8MC8LlBDkEb9/BUK3LfGpgKhqvBq6kewoMWCm35S9cQQ85Q+kMbPNL0Y4KoLNX8gSL8BLfvfHImoUtNDOmXFzp4UX6sGIpfKAkBIX7VM4Wredx2GMFlAsw4Rda0hm1XZ+JqFbuNIOU8TfluFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715363; c=relaxed/simple;
	bh=ynGxVyDinc7WyoZdUXr705wWkKE7PQbhLwK/puARYOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGxbC0EdF85jqnsah5XYlPIU5bEtfybe451+yC6HO8xxXuvSp7pDGyln7xzX2Q8ObdmBpzQxNh2Gj5SXbrmCG15J+XSJUJD8uVRdguKQ2pTEU1NV06Zlm8xs7etSL6SIOpd/55f/5N2eDeXkfXr2aHr+cn5+aFwA4ewMSRrx/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKlP9218; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKlP9218"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGiD019617
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6gv0ECKL9tJUyXSo2/PgT35
	c3CAj0ZmFRJki0PvzWE=; b=kKlP9218v4OW4p++AOwvndUevkiDRsURU6lH6ZGm
	N479caZcmnniCnQR69+F9Im9KfLeSWTIkc1IIu+/7nGE0EmkF0IKSmWzm6rLMyTj
	qn0DjuYTR0tPXNP0fuhBqHnMS4VCUxJEzRhi7uQmDGDMUTBrK65zJXTBSB0lo4cD
	7MplGk8qGN3b+hgMDgsyrbe0xsGAG79OonvdZM83FCoYzhYGD1gqNinJ1Et0RxO4
	i+6isL2wHPWb2CmTmQ/ytcio8kb2ws/GTri57rDa2cdqOAPr0LnMoI/GSVit8Zf7
	aAnAAbKV9n6ea1S5ZMGrcU3wJk27CVuDf/H+OQHVWXhCTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcypqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c791987cf6so1071136885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715359; x=1745320159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6gv0ECKL9tJUyXSo2/PgT35c3CAj0ZmFRJki0PvzWE=;
        b=ngs5UnQGmg2KXaViieKeODm3xbnPBYaM5zY7xYO+so7sZ0+18r6jNNa+a8NMu3YgXG
         xEghq1Oxgtf3cKsbIUAZtEE9jiZjWR1bawl8rW7g+Oxg4wpwF7kN3wXc+0fVlf/1y9++
         fWYxdHTzE51F44V3bizytuIKl0vJo/TzJlHQ1gzeoGhG9oCvbgloA52u0X+Sp38mP0xh
         6CaoeSYEZSUGHP0UyDGAMobBm4dF5KtK2ghI+0gaiDoBfROQDvigZ+RqOdlNIJAuDrNy
         cKINB6Q57GTsv5lc/oGVY4g52nWrDSsVe86XHr9Te60AKyGkpM8gjqx6ybmtfma+3iCw
         7IMw==
X-Forwarded-Encrypted: i=1; AJvYcCUV4oFprkkayzG1KWA2v9fDEyHGyW4hpzRU0ITwcL4olygfHWsd6AjixSMoQXQ7YzNoL6CpdrcFJfdoYKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKqm2h3GlXGNdKJgJH0wZEmsh4G0Jkbwi5lhMEI3oJwKCEq9R
	YXQmu9Zjii3DY9VyPThXcNtc8yF22xItUTM+/KZEhtTzHWZo/Ki0Qycuorj0gkjPig4X0Xb6Ua2
	Z8+fRaLVFgxuj5P6Dx3KC7xnOu/BMKUWq8ja8BwH6hc34e1op3zkC+FcK6twBbl4=
X-Gm-Gg: ASbGncu6jpcv3SMbdnWlh7YLy3DibCCm3oPp2vrqrIA+WUUMqRrUkmi7MjG7yruorso
	O9FzQAV8ao2dns+sYn9Ycxl+gqRq5TgpiHwi89TiDpdLbeBIp8UtSze4RifdG0gRoIt10NZj4AN
	g7BRD5gFBh0Wh9kzAD5CKKv/qUBfneUlaLvLloqC8Kd41whcz+7g6GTbetMMMPUN2a2X2QF12Hb
	uqwhAcMntFldCJwUl8GAsbU32jCcbz0a/SNhG0OPs6DiRSMId6otKHM+7sOqJiCLEWpLT96lN4v
	/6joRTtNtzJkFDkJHScYMScNgXSjtC0p+noGqEqQbA/A5ETsg2REazFSfyrF56ImoztVLWZBdpY
	=
X-Received: by 2002:a05:620a:4307:b0:7c5:3ca5:58fb with SMTP id af79cd13be357-7c7af0f7ecbmr2389151585a.4.1744715358885;
        Tue, 15 Apr 2025 04:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOKV0EZaARbnrysYds/riY2sNERqlVNe1z6l3k4KbexchCh2m1o3RxPJVBQiZUraGYxmH1Hw==
X-Received: by 2002:a05:620a:4307:b0:7c5:3ca5:58fb with SMTP id af79cd13be357-7c7af0f7ecbmr2389148085a.4.1744715358604;
        Tue, 15 Apr 2025 04:09:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b0asm20275941fa.98.2025.04.15.04.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:09:17 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:09:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: qcom: qdsp6: Set error code in
 q6usb_hw_params()
Message-ID: <pcwyzf3yzsi2stdryw4qazp22cs6d5pd4yx5l2r4seycpanam5@jian7eu72vf7>
References: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_442PWaMVoZcbbU@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe3e60 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rCPy67Auyf8QrFhMEPMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dVX_M6nCqW21wCLvvB7ns3IefPPbvmJh
X-Proofpoint-ORIG-GUID: dVX_M6nCqW21wCLvvB7ns3IefPPbvmJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=663 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078

On Tue, Apr 15, 2025 at 01:45:44PM +0300, Dan Carpenter wrote:
> Propagate the error code if q6afe_port_get_from_id() fails.  Don't
> return success.
> 
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
