Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C8198E63
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680595; cv=none; b=VoNflPvXc6gv9BgglD5T/nV/IisT9jX9aZ8kFxicHL8ABlgNJJlFumx0lLxtXhwOtCaPw0bhF2b4SHJy+GggfOeMnorYTPv5YYotlCOQebQFdnEGW/JCvd4FaaiNxvf9BS+OvN5lWsalTfFZyF6BtPPmLad3xDUxwA5TJq4Ke+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680595; c=relaxed/simple;
	bh=OaRYLoGbspc7WOjs3T9v8K61cby/l9jbHSqqS1sIo0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5EOyIKGhyIg3ScBpaXpri8O6kqtTBV4dlKfrT+WzUQ+W07KSme4rO4jLB2wDXDe1UuBS1psXaxlMXABWIJuDklbsk+F724yHTGBG3AjFyojm4cxmCyjt8elwMynx+D4Y7zUWKEBnOGPBGRBUImZgtPkdWBecep1HlZAtkbDFuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmJYnbfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmJYnbfr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s9c5025755
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 11:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7WGKj7Yoq31u55DWzIbKxu8Q
	6fmP+pT+b4/6SXNmUWw=; b=GmJYnbfrXd3A6dEOZ/lbTVl+7iYv7OwCzF4ms7JJ
	9+z0q10DFpx2k9BhyepKAFQUfAjUUYdt17q3vgPqbJk75qXXtX0fMQZjLn3uAO0s
	3AvX+0dc/7IXMBGYTO3Vdr+3yZI7g6+RCCnLOEN2aoQDfdHcjkQlXetAiT778xv6
	Hd+B4n5bm/1/wn/siJmemEN80QEAWPDxskHShBttpts6oCaZ+gD6J/pC0cLcwvB+
	7NIo8zAT7b5G4ekLZuHsy/xKHGqR+D2tT5RzASWTtHEBebJhcsEs5NeUKm+uSNET
	Yd6fbkEwqLvrHPDTkQZlTIVaT47IXvAY2+GlISI3zScgBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadvwej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:43:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so126180085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680591; x=1744285391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WGKj7Yoq31u55DWzIbKxu8Q6fmP+pT+b4/6SXNmUWw=;
        b=M5MMo7XO+5bKLyXC6gIliaM5sgourprXGDYxgUuNlk63DBP9U22T0nC8rkl3fX88ig
         OeAjlwI1G4yu3jqwxGtQEv+SMrcvQ+eSDF0OPvlg9D/mCpxJ2Um3mcDBr9vNHQ5GWKah
         n6EKKByZWVf2XLDSpbZFfFXAjS3N98mr060MnOrpT0Arh6dVeXe110bBHKiBlTiowi9I
         OSz6VaKBWn7JWYH5RBNZTD/o+Y4RGXGgprbIxN8R7kapclhgNZ9Xhl+DXm1u2h9N51BO
         IykttLyygszC8NLH43MYLAgFTIuFtoXYVcKhWYZBQDQ7p8F3qD7tuX09WJjzA82mNwgu
         wg6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXJXWnuUfBkN3RPgNQ3m4MOd5UTNtN3+0WZzZ/oS6Jg1TS6fzdN2WJp1iMPdZvxMuNN2/IDu3U/r/TvEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1gNgcjOXrgbln7B9C8uVELHVKOEYEOcS964uZJm8rQvTpEj0x
	0n/cfVq1kPdZ7Z4GMsACkecu2mzzAMlxrjhhfKf3/b0n+huBELV+f0JZO9dTp7bGp89N8vLc1wH
	MY81l0PlYfb61qEMHuS75iPbY9MXp686eViXM6gV4jDoZiZ+oT7+QvVZlDT24sM4=
X-Gm-Gg: ASbGncszbEzOVb+d88Hh+oh+VJgnhHqBEfJguTQUdV4rFV9mKV0WBUj5aCA/iEmjAFX
	keazq30GI5ALuiu4RQ6ef9AB8cghonh0Ow3JbohGFBeWGF3EcJhmdi4/VzKN1w7pCzZUEw7ewTO
	EtHWG+ayE/Za1hlxZsNqf/H9oNAfXp36XDlOdY07bHp0mCqVh/TwDkpQuuzL5jbeKe2iYaQ7pj7
	Ad0Gje1KggVonBa9/02wpiljHHsqZQad5LYZpfCc6T7tzfvXgFdpdU5AkBz7qo5Wgyd41B1lM7I
	zxsx4oBFFe+v7215Oxhk05eJf76pZGk8Bo99kFxMibsoabzfZWMC0SX7azDt/n9WOFIeCSkpZe/
	NCm4=
X-Received: by 2002:a05:620a:4493:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7664568ccmr793960485a.29.1743680590982;
        Thu, 03 Apr 2025 04:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnABgBLu5cIel/f+cDOkFKr4+tzdS0iNDcsblXJI3isL+5tNaEMK0TgffH7YsY/qcTFanSSg==
X-Received: by 2002:a05:620a:4493:b0:7c5:4001:3e9f with SMTP id af79cd13be357-7c7664568ccmr793957385a.29.1743680590628;
        Thu, 03 Apr 2025 04:43:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ceebbsm1839481fa.95.2025.04.03.04.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:43:09 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:43:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: shao.mingyin@zte.com.cn
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn,
        xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, xie.ludan@zte.com.cn
Subject: Re: [PATCH] pinctrl: qcom: Use devm_platform_ioremap_resource_byname
Message-ID: <ucxebkad5fov7vejtenikor4zfujuggqwbzzmnvm7yj6rw4hfn@ibpcbnf5oscj>
References: <202504031550143925VMOuiV6Gs3QgxNjRIOyf@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504031550143925VMOuiV6Gs3QgxNjRIOyf@zte.com.cn>
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ee7450 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1RTuLK3dAAAA:8 a=xdMfvF8H04qyE73r5JkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: C6oWcVjnzVjoXJ2D7X3ZKh8Ad0Spw8sB
X-Proofpoint-GUID: C6oWcVjnzVjoXJ2D7X3ZKh8Ad0Spw8sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=976 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030047

On Thu, Apr 03, 2025 at 03:50:14PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Xie Ludan <xie.ludan@zte.com.cn>
> 
> Introduce devm_platform_ioremap_resource_byname() to simplify
> resource retrieval and mapping.This new function consolidates
> platform_get_resource_byname() and devm_ioremap_resource() into a single
> call, improving code readability and reducing API call overhead.

Commit message is incorrect. You are not introducing anything, you are
removing a whitespace.

> 
> Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 13cdd6c0fbd7..264ac0e7152d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1548,7 +1548,7 @@ int msm_pinctrl_probe(struct platform_device *pdev,
> 
>  	if (soc_data->tiles) {
>  		for (i = 0; i < soc_data->ntiles; i++) {
> -			pctrl->regs[i] = devm_platform_ioremap_resource_byname(pdev, 
> +			pctrl->regs[i] = devm_platform_ioremap_resource_byname(pdev,
>  																   soc_data->tiles[i]);
>  			if (IS_ERR(pctrl->regs[i]))
>  				return PTR_ERR(pctrl->regs[i]);
> -- 
> 2.25.1

-- 
With best wishes
Dmitry
