Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A626A1BE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422012; cv=none; b=ExglQy111qJTH+P1n6to7FMIpvrx4lCuIo/fZ16eTlq/qweCSgvMzwHzCYtQkxEHqtAS8nHe00anherl6P5h0s51A1vYcIXHlRZVfZJNsjGqR9luHGnpgGa4ZgIUpafdAen0ANn6KmzRi0ts+yJce8p+D4aagvtkHAW4XpvpXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422012; c=relaxed/simple;
	bh=Fi+QiGSJC8uF2K0X5kt8vPGp5bckmVAYGE46xxU1R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZllrtDp/kLV6P7wcW+70kuJJENKyam1cBHwS8JQK7X9iINIp4AkRIbW2sQhbrlk1WaqQEqT4ILk7WTcCozHByEm1eTx3GKBbaC/+Wgz8rgLUsk1pKGelTm68J1FxtvESUrmtclib5MoO5RtFQAh8g6Da+Z1dRyPe9ilXfPxzqdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYX8fy24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYX8fy24"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7nc30027040
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66whv6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faad1f2b69so41041066d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=MH7Rfdrr4fJ4MtnyUa67Kc1LKxvHRg1nkAHu1kojLBAl5F8oA5fTq+rl+nQCOnxb5E
         oGOcZOJoAbR84nOFFQSd4zL78j1nwJ2EScmJOAucD2U733KyNEA+lhhoyhLf+tzobYJo
         B92Aq3Q6bd9tAc4KmzhPF5cGlIgd1LsL9SYQC0TNg401s9IV2+5//PVOq3uTnD9oJIJq
         rSXRqTLNn1urZE7ZkFegoYBXcmPVGbDYcU48XsXOUG4UT2RxNUsi75LhrGi+64gmognd
         ZOP0C/fYDzBT237u3bjDiIKAr/ma8dmKuZ2lwWoGVQkvTFi3Tuh9Ug40qpdw2Nx3LpGM
         IOAw==
X-Forwarded-Encrypted: i=1; AJvYcCWtBfrwbg/XE/foC0qOCuGya9dWvpYiENdl0woeWGP2mjgQ1BluKVihzQMo5lHaJFmmVNiLTNBP5YnwV10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYAmBSs5NJrOO7q5OvdJj/KSfsRtpFFLYPxzcI4V7gnDjie/+S
	YWMVSw4ddKtq7lPR2On4dzB5QqZvGlapq5s2yFc6+F4dWJjEYWyneeasyiDEnPVdlWsIFuoLt50
	IpfjyT/n99axCkgHxxSjFqd3/bOom0LUFONbXhgeEkNiivJGLyXiyiJvsNcF4emqCD9c=
X-Gm-Gg: ASbGncvzhblSqy3O4+Sz72T4DLOXV1j9exID1A10aj1tndsNH72N94BtWcIhg1GUEw1
	RDuqgCcAF2s328ZlFIKMtUwOlsujDNpHQ81KocAg9tkPUQab11IRUxyZ9fMioaO51DS1AcuGiMf
	SjXLXbCUp2+AD2mJB5o4MvRzTrm6u4/WnaZWPXlbjx0wCnC/IKlqvSzx1hm4OE0VaXWdZh/DvF0
	yibOhpm8Zr8xlCqZ+ItxPho6sRjMaRSfmH/vYZfYD7N+yBTIbpA+kWjmQhmhRP9PXUl6BIa4Iiu
	DDJv+TnUiQTijudB4PU9DTR+noK1TXawvDY926x6FIXdmAhDwyMrXpDMbOnyl7IcLjJHNmiRY6E
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008676d6.23.1748422008962;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 7ONW1uhHAdPlWREQCznDEFg3P0uJn4FE
X-Proofpoint-GUID: 7ONW1uhHAdPlWREQCznDEFg3P0uJn4FE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NCBTYWx0ZWRfX080PfmgyWC92
 592IM6ot2V2u/2qZHiHzwaC/kdYOcurwuQE7ZGFFohwRal4VtEBv9Q/seuFyjXiSn2XjT7gFf21
 XjdT3UCFbtv+KIU4uh6eFv21v2zhEuZbAYRlICamh6Vn+RodD1TU+pu2HTH8MYxKLDWXpBXiCa9
 JORdcjbVry/7+epUWKj29K3fTWgVXKWz6X6IemVl5mY5Wgkw6D+xV6wpvBRw9OVnkgd56EmfcE2
 aw+WFVE4Gk5kirAyvOOcXU105LzNOeXnXWRdp7Ld/7oRvDkjIzsN0XRPugsgC7hnKnvi/v1WCHq
 0PQTRwa3Fg+sFu8g6F4AH7sKtnAP29yC/GhZC5LkLUiSUo24/51TCaZX/wEt7ES221HZbYoJCWV
 xY5aigM0v7VfatuCGuFLRjKPNkgT/hgNmYnyNFxJdAWEGXOovSvycO89Qwm++nTeL0t9IuRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=478 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280074

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
