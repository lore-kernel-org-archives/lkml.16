Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1E42236FC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979718; cv=none; b=NDkhB+RBuBG4FMuEMq4dA9GDnhG0uTE746gXc9s/pUK1xSkGNhTuS3sw82bfsZfiwDRtT4iyU2jYSfTJ9Z6j4CDZTElCbHjNXne/DQj692XC8ouWA6j4lEfr95QK0CHNFC72HwawhrS+gu2KryQutB/Lz0CSyfuEPyWLceVIH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979718; c=relaxed/simple;
	bh=k5K0OHaAReQDoeWKEKaljz1uxPTCHcqHA7iRro70KgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g4JaPHFCMd5ifz0dSrU65xGkpMtQGK3ffRRktY3AT0h+HTQ00ydJf0woeYv9jma2jYG3+0LspcKneHkaordYNZ9ZLPxP4DMfyg/b6Csh1dBSyY46i57kwA6h85VsE1UEmfVTw/fffEyDOXNXbOAz0gi+LbvgrC57jjWPCgU+J5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDs/csn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDs/csn3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJCwDX015063
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=; b=lDs/csn37OXesSg1
	qhfHsdcd5nbgCJF68KCe+38WJTCDJGc4Eh5+NoRNxHK6myX4NyjPIHwx1eCwr7a6
	UKo4xFk8XLd/jeu8jIv1Rn9xaaIQ/rTUZ4CdVapfQAsUdxnfVc2oNJ8iq5RkW6sK
	fX6YZUhGDd9KCTgt1NcscjTwsFaPdoWLhGxTg5D8rYMxi2zII8nQIpi7YWq2MO9d
	d/2p/YaNMnKfGtaeVvoQyeO6C/Nn1MSl9hT5KY6kglrnlNVkeN/uytEBkSDZtpt7
	85NEsyirFOGP5VENZyugZl/7A5QTbRTqcpdudm0B8gg/kIjGGw1x14awKil2Wd4p
	U5TCXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm23ddt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23632fd6248so13879865ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979714; x=1751584514;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=;
        b=ug32lxdb398Z1GcZucYD/969KN0XE/6nlBoMeB/0ugo9zsf9DeqNa64Nm5I11ky65E
         RxXPS+p+0XgI6s5h/tdd73eL1yo5FVOYVmOcuEIAftDIaTBNNEbI1ELmwlBIWZIYC+HE
         A18QOd5xZPkhi80vd/my2VeSY1SIeoWD2ZO5Huk07gMAw10V6BQN3ES+oNfqNqYsZNyD
         n9WYLbbbUQz0ut/jAxaACjK7gi30IGGmc2U3L2GLvrmV6a/QoOJdu+Ty1EePUXAGrEp8
         ZC7E/yz2d/y0V4BKnugsKZlcq0GT1n/dn6m970Q2pwBQfVca2MmNMEba3k16o1zsDjkN
         uo/A==
X-Forwarded-Encrypted: i=1; AJvYcCXHS3Ii95Gxkf0Qk0Tp0USBYFkRM/7stoU1gQS+8n+g2b3/n/h9le48d/1Nk7uyTXrAcrto1N+IyQIoWCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQBrq+BEk+ZAowyZmwu10pqXEietoJJqSz7r5etJMNUfnwO9e
	uTMcvFSfqd0z9jeMM8RdlwGO5VmbKtWLw5fE4KKh5/mYKoY4vqtctKpHeup22DEuRQ9Ec6mWrbe
	cD7F/AwxyOgrB4R0lR7tpWBNhDMs/X81AzcYFB27r7NjtWf6/kFGUCSDTNuGW5mWoa2o=
X-Gm-Gg: ASbGncv6juuYkRp00RKwJla3BOe9eL1d1b0C52PF4LA8VvF4OhjV7IZ8sCUWcw52RoS
	m/FjhaRdyH1lUjbNpcT8R50XRQkifk8u615hOrPDPp/6VrgR0F3prXWXgKm84yioA/QGrTeO/1W
	t8vsG0m5imv1WnYC73YHBHq6clUoICp4gcC2U7CWDZUhT+cn3hEs2IEgisO9C1ogiJAxtI5Rruf
	Tfb/DtBM9dfkeP7CULf2m2kTDH9aLnW9Vk8uzy4wTaY1DUoV51W7mSFtxqpswK8hMK8jVuopcXx
	9Klc30+AqTZcCPBqqpbMFzcG11v9dMuygMV/aaN4Tk44NlB7YMcHa0NNdhs=
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15454175ad.27.1750979714458;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatQQA1mUCt08p8uWEuxkLDupGYZtc8mgpT1E0dO05P3u6qH6lqBdVuZv79lzu/hrCr1rIEA==
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15453875ad.27.1750979714115;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Message-Id: <175097971319.153431.8225006080279921985.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685dd483 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=TBCri2Webv1PiB2955kA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uWpRaEmQj2N7RAWaiWw_5QmXMdONpkrb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX3VXD4YoGygSw
 oEjO/9IwC08eOUmOnQ/dDJZ9UJQT6IsUCVn4gktz5FeyolrSNzwbZNIMIaDrDUiV71WM3E/6WhI
 ZbvJ+IOwXms8iLUFHaUeeOIaQZHQauqnHGYLKNja/PwgHm+RGzUWFyq+7kB3ncjK5AEc6ZRt6D2
 tiUJ0AqdyNKfq6FxDwbr2lwCGLyU7SYIVs6SbMjcH+U87C4EvBua/Izem0n499V0TBLUHiBilRp
 SX+F+mp7GfKlst69w6PCEJ2Tct8iIehZDscG5GTujD+F3woAYb3P2Df7balgELYUx8hmCvPAeYi
 bfFi05bn6u09LZypT0iHmXIZPF8jRIC9yy6WLMtYiZukSyzU/PSAX/vwyBRy3Dq7s1cHRabPDNQ
 fVisUhj/fgLblr4zPVDqR97a8krlRQgTdA2/2GdzcuSbEgy1Z7eKPiMnX2xeNIQxceo8IqgZ
X-Proofpoint-ORIG-GUID: uWpRaEmQj2N7RAWaiWw_5QmXMdONpkrb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=912
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260199


On Thu, 19 Jun 2025 09:20:10 +0100, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Make read-only const array svc_id static const
      commit: d8f07889e920493845fd628407ff0debbe96fa09

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

