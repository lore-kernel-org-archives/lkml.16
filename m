Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178C72676CF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114701; cv=none; b=W0Bi5iQECUfVKvYR/39iutycZUGXll7sOHozsZ1DWencIAJUR8UimUbF9qhpPgKzuut1N7c+uF/4LzRWYVBDmgUBHYqrBsXJuOzXOkOS75u3LqOdp9ciOft8fA0f1mh04UV/EXBkb2/p5ahpsp8QFdYkx8sSnvipsFttzf0Qqws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114701; c=relaxed/simple;
	bh=ojpl3R7qQEv816bYbLyXuNTJWAZHR4sSDd3c8WkLDOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ0LhtzhRkErqGiSFGNtQFwjWxaj6Xuv/LRNNQaPx+VP9Wj/aMeEaVeBCcUptHQkZcqSq88bCtr7pBW0w/ToMBXXOJ4qY3ghH/e/nSHTlMQ2ZGcY6mvQxRj6ONfNeNTlxZgSfjPelwZF5fR2w2VASYKSakYCFrItZC1jPqQLOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLwBGt9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLwBGt9R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B6Cut020155
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 12:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTasaWk4O1x7oCPw4TPr50jW
	GCj6aihBh3sw6SWrF74=; b=FLwBGt9RpdSk3oPdhWTCafzOct+Ppd1yHQgQJbVB
	muNOXwKXW3ZuhGBJ2sGDrwWQrQxwd08KnewvA5KgP17cn2nbOrN+KAlEoPLQ+M6T
	aTKGYpI0mDpKzIuD+ikkT6tJoSZ8Cp9jYdA+YeHGj6iA2oeeWJjzdlScmV+zKxpz
	c9Y4cYzA980S3JvVcSmbbNMIcJCpA7shvv63uHifg+KMi0zOCItCmUkKjomeiRUA
	jELfp7ua+PSwqhgXho+GM1+95kaMOOOPHhWGSwMusnNjSxsrp81NbUDIcZT6KMUh
	Si93NtH8dPoVYF1/toLJn4OyOpVav0xjQgD0RCiOSh8kUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qpnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:18:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so1645371685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114698; x=1744719498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTasaWk4O1x7oCPw4TPr50jWGCj6aihBh3sw6SWrF74=;
        b=g9v4CyJElRKvqtlvp5PA7n8atG96vyCmSP5U9x4ha9ykwYyjImcoH1IcDqrY9KvCDV
         7l5kaEoLoS6SaAf6rrBQqzA3IWmxplQacLaKuMvEb1K4aYTGr3KCDTd8Sw1bLhWnu3ZK
         jNkS0OwTXx97d349e31dYEcz/JeJ8/PLNk+XsPpi0QhzVyd/1LXz8byZlB67ciUn5khu
         hkQuAnoelZ5X5XRZO0nx0XigdcfjH8cDwFUYz5xAcS+iVy/TitvemA8q3Er20Zp5OMxS
         VDMF2XuCTXFLSCK4LdoZw4VIDVO1EFq7aps/83Rv10AzRxSXJCVH1E+jmGPiYU4T9BIX
         3YLw==
X-Forwarded-Encrypted: i=1; AJvYcCXbJ1TnKVfGLaf+sThr1RuH5aExJgJSMW6CEK+aPiw8oo0NItJYQ0hSId0xLNgd1sWKR+/t+B8ZgpNAGhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhUHlXzXorC0yzYRGTQE2ufMYl01+u3RibpV/jMQCfhlIwapd
	7HDkjESQYUvq/4zaaBoE8Wh6/JdMtCZn/zVpa2LCddGGGtd26vygtdYDOIQpzw9biel1wDq0CBW
	VxyW0bnVoG6Ct2+vGTd+mW2Me1Kfh9gPEDcav/iEIvldXyn0AmJnhaHSihwm/z90=
X-Gm-Gg: ASbGncuM78ma0TQw2OVdp+1ZTVt4vdk7bkWjOjlbc3YvR9rO5INfYvBBzKVBa8NdAIg
	4+RHmw36R6sYl9J+MafkzVQKI8B2NM33sZWTFNmzsL2h+4japBl5Ee1RdNP6LZNNXM1Mar1OKZN
	vFOuAZ4Xat7MHx6jwYO2cPWewb1ZK07ahj2N00qPLHUhcck9p7b1paU7DGLPyHns4/DUuTO8P+k
	4FH13bSdd+VTOgaxBbbkS7vxEcFq/AQl93MLHXKW7P2dxWhSRK0moMsdnDNGOJb2d2p1BX0d+Cu
	/ft4Yx+xOV2nhLAc7/hDSi6S6gReelK3+1haybD4dv3pmmID2JPkh3SfAA68YtbsTMab+Oezyiw
	mg9g=
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2574816485a.30.1744114697757;
        Tue, 08 Apr 2025 05:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVylSPbz1EzTWNpvd0YBoOebl9ZLithNRq+pXikvQ6TodEPt4B0zQUUbZc1nQkbbwDP1bt4w==
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2574813885a.30.1744114697454;
        Tue, 08 Apr 2025 05:18:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370a5sm1510596e87.131.2025.04.08.05.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:18:16 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:18:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: mux: fsa4480: add regulator support
Message-ID: <aiechdq62mjgta5p5g3s33okgnp56fe5ing2va7vaaf74nerug@nvrwrgnoyp7g>
References: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-ml-topic-typec-mux-fs4480-v1-1-475377ef22a3@pengutronix.de>
X-Proofpoint-ORIG-GUID: mutZZF65VUNBU78hABJoMLeui7NlgtxV
X-Proofpoint-GUID: mutZZF65VUNBU78hABJoMLeui7NlgtxV
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f5140b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=V9AqYnqgT5IT5PsU-dwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=802 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080087

On Fri, Apr 04, 2025 at 01:02:20AM +0200, Michael Grzeschik wrote:
> The fsa4480 vcc lane could be driven by some external regulator.
> This patch is adding support to enable the regulator before probing.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/typec/mux/fsa4480.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index f71dba8bf07c9..c54e42c7e6a16 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -12,6 +12,7 @@
>  #include <linux/regmap.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define FSA4480_DEVICE_ID	0x00
>   #define FSA4480_DEVICE_ID_VENDOR_ID	GENMASK(7, 6)
> @@ -273,6 +274,10 @@ static int fsa4480_probe(struct i2c_client *client)
>  	if (IS_ERR(fsa->regmap))
>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "vcc");

Missing DT bindings update that describes this supply.

> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "Failed to get regulator\n");
> +
>  	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
>  	if (ret)
>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
> 
> ---
> base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
> change-id: 20250404-ml-topic-typec-mux-fs4480-392407f94f84
> 
> Best regards,
> -- 
> Michael Grzeschik <m.grzeschik@pengutronix.de>
> 

-- 
With best wishes
Dmitry
