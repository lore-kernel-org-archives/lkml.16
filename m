Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0357082D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360319; cv=none; b=VQSJaK566XIGk1QCsmFlg2JYLHBoBJ/br+DWMAb7XDu5d5zMjrefxAYnAzFMblqw5NkRXR+YVAqOJHRnqz5TwL78wdPRxSZ3VjI1QaJFqn18h3GyshQezWty6kErDMG4qf+9ntpTa+dIncBm4VnK4yr72jYeFQ1Tvh3cHV2MJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360319; c=relaxed/simple;
	bh=KsxWd9Q5qS+K9DHEGgbc+lOf/vBC3ZbpV62hio3qrYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZBqtVxU5cN/YnbylHwIZUBuyO3xj0lX0HezUmY9o+iaNfJD6oVNM8cIn0zSKwk6axsutlaNKRCiwnjYZxVk/BG8WFaCqAYqpiQ4Rshq6e+hzsmYy24HFf63bCsJdXbOlRcnJzB2yRo3Wh1rZa1OXzi42McNFX91m/xKomToNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChsTTnog; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChsTTnog"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UE9sZV014266
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kA3fRtGt5PPqHVCStX9+/pCX
	flRsMU5SNq9nmFLbDI4=; b=ChsTTnogQRQejWn/CbuwVzBEPChx70AQE/gxo7dP
	nt54sVfZlT8TRd5iGpXRSydbZiL8PTOsms63+iQEmKMF9y1BUAWuBt1NmSfsz0t8
	CzqkqUJ7dAcqTiruzC7ANcyNLumCnbf8f3qGQ+hCSFyNF+Z2/FGkseUT8kXjBPri
	KaC4zmNNCfeoEwmmJYHwaXaatPM4aX+nVyXNDpg5ueAk9ycW+pTpyQeDMl/eaIpg
	qCew8SvpZFncjhs0tdLs8zvGoFj+DfNhFeN3/YwRhbSGRu2MVFeRcb1/0Bq0oTkv
	zQ2T3sJWqE1CiJf0VfQQrKARXHFd44soWS22G1wCw53YOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tm9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:45:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so631146885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743360316; x=1743965116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kA3fRtGt5PPqHVCStX9+/pCXflRsMU5SNq9nmFLbDI4=;
        b=MSfSr4sYzaS89nP08BAbQmOY28ntENZbfHf1eI/sY6lQwhLzkycME+N2dqfKrRsVMj
         rpV/Ooi2mOILUFJMcpcDhk4z2qxhS6XnyjXbJmop3dsLNsO9ukp0ZMnf9Vse6jBnpaA0
         DUgePt6l+DH9U7zqPzg/FXn8nJfCdQmEK0Xd+jBxl4nQUh8BX2xjztpb/2DfdHmrY/Pb
         fNWhGZ3OYYPKoHFHzG6LKM41hn/Btf9ozBgSbBoga9RiNsetRMIiAprffMTu5s36vbGG
         0OEjMBOGvfMX8utsji7s9o498PptVV9wUAeUfXkvREiUnfHs9Fp7ML2+EexLsZvJT+Bt
         nObg==
X-Forwarded-Encrypted: i=1; AJvYcCUiMn2rvpDSIlOSy3yVpdfoOTNxpGfsJcXRNfwZxbhV9Z0LALTfZRDIzh5caDEwIQZ31l9j3/lMqVhee+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YykQFMJHwD1ipLGdm0SWC5rL8KpjWuEb0ZbF30JHEQDWgZh+QiV
	acDOdWOYnuJMIMHViw8rKIIFxnLr+IygzoUF+WOqS8ad56XR1TgYQh8e8u48grk6UFiAL2yK6n4
	89V06+DFLWMSCp4k1S++C7fvmZpL2psiJE94ANO41UBJOjfd6EVCldFFWI4VKL6A=
X-Gm-Gg: ASbGnctDfuUkWZO5vSbgvDsETIexhMNHsbTpmvJLcmYCtwMp7kDrwyQee8FnAlFt0vA
	DRXK5XkOzIInPgKPXJyI0dF5ebNH3e+sYPJ+hj+uyGhcx1FwSA7QsufLJUTupR1WBwGPHksXElG
	ppEuQoUbi/lWADg17igffijJLt5R9QC3yIC7lEO0IFr7veQSUPBPkj11t1dQAuQfw53rMENITJQ
	5cdUjMZ8uMErp6ydfjskkcLnnB6uMK2jkEZlSPKsXFf8BWvGhTFLNJv3ajVgUThLvzb6VXTfySf
	rQyNRtynw5oLKUAxz2wl9gW4Z/U3FVXI/b5JNJOpTJ//3QN2neWzg24BgR0qibUvyeoMIV855O4
	3h4w=
X-Received: by 2002:a05:620a:31a9:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7c69089247cmr1008620985a.51.1743360316099;
        Sun, 30 Mar 2025 11:45:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsCtO1cvYPGTteGUDG+A9n/YJSr7VDFr/0cxL/97Y6BO6mO67qDhJxto0uZ0GzsNsZ73dipA==
X-Received: by 2002:a05:620a:31a9:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7c69089247cmr1008617585a.51.1743360315788;
        Sun, 30 Mar 2025 11:45:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa8bc1sm11767311fa.2.2025.03.30.11.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:45:13 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:45:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/bridge: it6505: modify DP link training work
Message-ID: <zhk4d26sj6xs6yhlgqpwcxysggk7un2a3ylwedj2ahjdjttoua@4sxrq7jdxfz2>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-4-756c8306f500@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-4-756c8306f500@ite.com.tw>
X-Proofpoint-GUID: ZTLiqQr4z49-n_fumRm7Js-8iWpnxJsX
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e9913d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=37l_GJn86sCRY8oQ1kwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: ZTLiqQr4z49-n_fumRm7Js-8iWpnxJsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=875 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300131

On Wed, Mar 26, 2025 at 01:34:16PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The DP link training work include auto training and after
> auto training failed "AUTO_TRAIN_RETRY" times, it switch to
> step training mode.
> 
> It will more efficiency that finish link auto training,
> include retry, and step training in a work, rather than
> re-schedule train work when each training fail.
> 
> Drop auto_train_retry from it6505 structure,
> and it6505_dump() is remove from link trainig work,
> it takes too much time to read all register area,
> and is not necessary.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 40 ++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
