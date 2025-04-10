Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAE1E008B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318874; cv=none; b=ZEFh09tL6I7++ETHp9sXzEDFpfdPRCeGAO9aUn+urnfrd7RGbqlZTu7qszJwhW2CZHhBiKbKj4LnSVLmvCTINWKsB2iEBIJjH15Ai+VwPFgTdYByY+FIA3gJ6PvOo/Eo2yFP8fI1HxwRrPTfls1QRP2cTx44GzpD2D2oV7xagxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318874; c=relaxed/simple;
	bh=vT8A4fU1UmOiZ9+DWtANvxU8GSZaCb9rftBdA7ojakM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4g4URgNaG2v4oCEpmYZYBp+mmL/ueeFShwGSUF6Bcf1w0dAT2AGG2rJJD/CoaPaYaCTVBDpW2qalrrdKSOYFCBur3v12wIpL9sJ3rAM8nN9NkLca56W/vmKO//hecR8/ceGQG556w3Z8FDWKvkqVhed0OIV1Qt5ErjtUSH5ac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGXi4zcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGXi4zcq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG69Au000640
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTXBltzFE67Ruh1hsFseJc4C
	3laLglIPKoe35RaWrWQ=; b=NGXi4zcqQGWuVOFse1/QIZsmH6gZGc63XtWuDw3H
	XyDZ2X5RWZM1r5EbosyqWvq+bhMNmcACErkJLkXyJgDVtyvPxtLs11qzdG6BeryO
	zq/dkOHEQj51EN8wu5Ku8bK7tsOVJz2MH/PeY+ZkQNl4wTQWQ4D1OZZKS7f6hmhE
	DieyuUWB8Q8g9BIR+/hshQcYL3fLTl0Ay4IeWPz8C0tbLcJNhArjLVdQFgJLb67R
	u8NxIX/p6qw4sfVTLd3xPS3g0HJhm3A99JseUcqlsE4wSoK7D0boitoxmAuYnl/w
	BeQgC/OyVlGZK4ZuxD6/1S5ts8DaENv6tHC7qQoF+yCdkA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd309jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:11 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so26544235ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318871; x=1744923671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTXBltzFE67Ruh1hsFseJc4C3laLglIPKoe35RaWrWQ=;
        b=ajcPMYazu5f6AmFrHexUtfYl1CF/gGKNmkDko4/hOPznfA74kb6w3hnJY94OwRCT8D
         i1xguX2qITIB0i72OvW5ehx0eTm3Meeb3tJblROXPFnq3b6WxVQt8R38+O4uvwzIy5FB
         lg3uOFZ83rXUD4zD7yQorqQF5z48ioiOxZZYr0H3lKptu6FqSwfPIoRbgn+H2+8qDgx3
         IVS06DFQNmFq1Yvbdyv4rRyZejXb8+7wCCjL8cHfVApoAPw4kSTXLrbNAonvaK8zhpyw
         A9K/4ZC+3Q13DSZK0RPaY1Cv2yPpZ93plUwW78yFt8y1VU99hpQ2inTCO4mJkL+pw6Jw
         woZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xKYk+pZ0cZcJ7TRRR0kom2FGu0AVOWrr3gLvau2qu9Wsk9/tM6s2hR7n7jvEXOtyX4mPQeU2Jzyibco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJCqdwciF6+9gGPsJSLvDYRsFDLEL7otijtuJXBBY/V8nHLAO
	tk1KK1uRRchbbcAPknZuWG6S/rGpK3IP0yxoPWFuOT8XsIVzMTUmbYP4G2sjc+rKxfW+wfzpTGT
	hoVS+tE7J4pfsq/BCHJi5oSEyVImWXmqU5r/NEZzMr3Spao9Ux+oC8pHs1kWLotk=
X-Gm-Gg: ASbGnctyrtWZ+izYCGc3IkdCQMOcH2eQkhOI+7m2dOeT0uJAco/RnNFKTJRGF8welWy
	PonJKUOhOgzXlg54kzZvcwC+/HYqJOLesXxVEKMTIAx6frNQx4vZQ3dwC1YtJiGugxdj5se12ZS
	ldBqInQSgOWnQStZf7NHRcGwRo4Cx60tKLzTCTgCIX8iRbpUdYVoSRRjZGxnKoB7B4f3DPMNW42
	iBI42gXNvGfJa6Q1MfYok7+buq+tP0wojdxuE7EG/sKfFRB3TqTQnL3QmA577pKX0rWsZ7+OafH
	P7F5G5Z+XyfJzJymYHDRAd+48pdyxBOQ5Y/NA+Nc9ZMcfk5ErKdVOLjVywnttlyR1pqKZsOx8Wg
	=
X-Received: by 2002:a05:6e02:1449:b0:3d3:d4f0:271d with SMTP id e9e14a558f8ab-3d7ec21bb5fmr4965225ab.12.1744318870726;
        Thu, 10 Apr 2025 14:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7tnBM663rv7qwbG2Lp2yaNzmsf6T/Qev5qfbwF4jphfaqDwalzWmtac96frqAt/9iKu4ewQ==
X-Received: by 2002:a05:6e02:1449:b0:3d3:d4f0:271d with SMTP id e9e14a558f8ab-3d7ec21bb5fmr4964675ab.12.1744318870275;
        Thu, 10 Apr 2025 14:01:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d69fsm5843981fa.17.2025.04.10.14.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:01:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:01:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 1/5 RESEND] thermal: qcom-spmi-temp-alarm: enable
 stage 2 shutdown when required
Message-ID: <m5vw3et7qquuuwkrscs3e7yvjyx7obuc2legrzbsnd7ahz6vdk@elvuty2lrudc>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-2-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: gFLDFGAvuzKR6G_vVlcx8ODe4fHA5ajY
X-Proofpoint-GUID: gFLDFGAvuzKR6G_vVlcx8ODe4fHA5ajY
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f83197 cx=c_pps a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=meonRkofVk6r_IjrMSUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:04PM -0700, Anjelique Melendez wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> stage 2 automatic PMIC partial shutdown to be enabled in order to
> avoid repeated faults in the event of reaching over-temperature
> stage 3.  Modify the stage 2 shutdown control logic to ensure that
> stage 2 shutdown is enabled on all affected PMICs.  Read the
> digital major and minor revision registers to identify these
> PMICs.

It would be nice to mention affected PMICs (at least thsoe supported
upstream).

> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
