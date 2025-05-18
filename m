Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEA1A76BC
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608126; cv=none; b=NpiAO0B4gCvJaUAwBI9yBiMgUnXBWXmCy5AQrSUjTr2C7yA41cA/k/HqE08zjCr2RuvNmMOaiwZ71vOaoD5ov3uhS0Gky0agL7PS7pq7UjizSQqFGBquAEw/1eZ7OcVQQk+Zm8L/YD//IGrXuM0q918wW4SF713G7L1mJj3KvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608126; c=relaxed/simple;
	bh=2WQfpB8+kAsksZzSScMuaHp9RFtdywGK7Cm9Y87Kojo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF//naWesxETbznrWlC/AH6CqOBZnHA2T7KjKwXBpx2DYjTVzU9R6FJs46ZiUXoXoUCwF+w7kOR1ciEHlAEmrC9KVsHZcms1qfeha6webpNtXj32BhZgCGonM98YaedcQYMgcfRRYaj+cZUoyJdG5Fcy6pJCINDvP5dGZTs08Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojyabReD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojyabReD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IKq81F027582
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaaSG9X5R3zIXOMoXuwdOluz
	DMWxOT1zmAnsMUlIPK4=; b=ojyabReDz3msRcARrQsFfnmzGguOU5i+5g43ZX8X
	7PIkyxCmmo4YUgTtsO6tLHRB636hvU2k+gBuuHEwxfH/+o86Wd9IFEk7krOtjhWK
	GklC2yfmz60LYOfstDEkVt/0dowcSP2rgtwbGSRHsPWkXxcxa4/Kqyis6ZYMgYwM
	vN3TNYgoNOuPmTnIzgxS6IlWBi57RMTwsI0bJfNbD1hY744cthmtI78q3HR9EzQh
	1THujfsWDyapZgK+f9mQNZndNOnbOtuh8onZz9MA50ZoOjpiX2UetHybj01/+5mJ
	YhGRMxHPYyhE2LG8GQFNmjQ2FTSZoijD+Jdh5ZFzejJJWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9tfv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ae49fd37so60296776d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608123; x=1748212923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaaSG9X5R3zIXOMoXuwdOluzDMWxOT1zmAnsMUlIPK4=;
        b=E9YLPECeFN5aHR6rolEjBKHtTA5XvtjZoc7TINvkA/DJM3UUwI+xEEpuilTS8MRyTS
         UTYFvLRxcedRsgXQJey0BfvQsf+ZuLx5YGoJitRdg1kULyOm2PEiWWbVDa/W0b/6e0GR
         5sjjuUq+aYcWqvS+YUGyly2EgxrFzglhKF4aRoqJrb7kqHmT28dx+4hP6Rc7f6aec1il
         bFj+cNvRxceijjkGVPHDRPmxI7GNsYDFNmABHMgNVMGb93fyWOTZc+JLM8aixSFigtW/
         VhwgGeukFM1qcOZvbJoP8HYSN3YaeDQSHVwWw7Kh2DBawCtsnEOgij+VMiL0ic5Bm26n
         ePyA==
X-Forwarded-Encrypted: i=1; AJvYcCVqiS2LWJUL3GxReKF95rzfjUFA8wdO8F+4zzmHeWLJJyOQI1/NXL5mV/YIyyEVb/Tonw/YembWtq0HAfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhE+HmlxSdflBTJdlbjtHobTv4HIzmkv1WAbiJWWeHNSxKDfUB
	+H9UaHSswdq22n7ToI1ysfMbx5ccauXhHIZVt/RGigfiY87Qjrr5ej6NqBue8ItD9N96J5Kvlvx
	CLgl02bunqVHtmT01jnf2J5gouNGF0butnOqkFTEazjJE8hR/oVz0Zm+HriLqArYhv2M=
X-Gm-Gg: ASbGncviTBbvnJN/kcu+F5hYwF/dA7cSqPY93tPTW3l1xxWEDO0hxRghaJ3TeO/g+xu
	wrKQCQChQUnop5mCpmurJbDaaZ/o1EWSrAfWaAEz4Is5npXgtLJp2RtGP05ANkvHj3/1qDGJvCq
	QhOv7OMfsXasioy1sv/jgwEqGdv1M3c0hIR8bkHSikaIej3jJ4swStBG1b/wmOH89AZB42mHylj
	8wYRmKhlTS8+zs2evvN3yJPhUw4Fyg7hL+DOt1uSV7/zpGaSedCGZGLDxquMcqT/Gz2eqoPjf3i
	vhD3r1KGdX9zUv8FL9XOPui/53rCXF7N3gg01hbtmxVlcGtXe45pVC9FJKGwnDit4YcuiyySfsE
	=
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487786d6.20.1747608122826;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUjV8M+Fj2g9HbnyHkTiE/hYtX208dk0WrYDuNrnpAxFDjqyRvu9ixEuA8DIi/pbCTpIxB7w==
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487566d6.20.1747608122476;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280ca53e2esm15185761fa.89.2025.05.18.15.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:42:00 -0700 (PDT)
Date: Mon, 19 May 2025 01:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Constify struct spmi_voltage_range
Message-ID: <pxm4kekb573zz2cdjgjn5rxlr2ipneaoxlqzwkcwhctqnqm45h@pdgediy3o7tg>
References: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: O8MFGwls8kS19xxGCDZnLqgTWF8MQIOh
X-Proofpoint-ORIG-GUID: O8MFGwls8kS19xxGCDZnLqgTWF8MQIOh
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682a623c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gpGGzw82cXZ8HdMEZUsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNSBTYWx0ZWRfX3Jr8ifu4ze+c
 h58lSPue22zalxQrmMeknQNPHnl9TBi//wya+YtSI53eYHcGe2FdubkQhOsqrnX7yI4szcBCAYh
 CN5FZwJYZamPJeBDg1lyjajAe6gEgD+oeS+S8VIQLKnUX8Ruy5iXJbvsbko6ivHeSh4P50HZpPj
 Xy4dD9VNZ5AFxGBPpXpqlVAcEk2oQRlba/Ket/I3QQrQw9T8HN8KT9CuehRM6YBseatH5jGwqwy
 7c5hrLvqi1YDtwzGZ2TJWACGMAQgaZ6y8jMoUOzZKNkocFYY7UxMmFb1KeC7YjkTCLgWAQ3cB74
 W9r5HeMttbZCJbz8IABxyHf1ZlNS/cfxZ6ptBnvf83MZBXs8HnxEFfErPXM9NQqFnG4cTzVAyKJ
 M01qX1TgiBXjrHzI87tnuLHM4a0+3JcOZA5Sjvez3zhS/1tTQZgdmQcA5rtpzAeBKGY6zLTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180225

On Sun, May 18, 2025 at 02:16:21PM +0200, Christophe JAILLET wrote:
> 'struct spmi_voltage_range' are only modified at runtime to compile a
> field, n_voltages, that could be computed at compile time.
> 
> So, simplify spmi_calculate_num_voltages() and compute n_voltages at
> compile time within the SPMI_VOLTAGE_RANGE macro.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   85437	  26776	    512	 112725	  1b855	drivers/regulator/qcom_spmi-regulator.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   86857	  24760	    512	 112129	  1b601	drivers/regulator/qcom_spmi-regulator.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I've also checked in the .s file that n_voltages was set initialized with
> the correct value.
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 69 ++++++++++++-------------
>  1 file changed, 32 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
