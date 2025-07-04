Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003F2E36E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647423; cv=none; b=FB8GTxh854ySEpeHwoAKEfaGWDSgCBzRBY4ekfhbyT8l/yeDXoOOFfKhDlNqI2m9Tf95vOOr+ftdqPpT4c+k7+IhmxkkpSj8O5OMfoNxe+KpTliaqIB4bwMaN2W0ya/goxFRvcjxMunr8G6IXO5PKrpiwGyj9GLsYcuTM2rmNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647423; c=relaxed/simple;
	bh=ck2xsriSsrklYZzoHY7Zb+J9xczZc3apVan0Zg+t6Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OS3gDQK6ffHT3kOnf/lzsRqWs8OfRAWwuUQtV1qMjbedXDDcl64iUUiyZurSr+jihntFiOcUU9ZHOpkDUw4wX9M4vx2uZf59DiacJ1RR1SIRAUg1EtqKetd8NGrKMtmNIqGK11j4T1NB7NW3KKIDFN3c+4ZFf5yGC7QF7cxJYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loA/tJUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loA/tJUs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564GYa58025201
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fF/OuQJ8xsB/HKG8mieUfGiQ
	XUFgzhYQV4ZPFUXGWjQ=; b=loA/tJUsZQbHc14ZAa44WDNXTjnMbjZl4jDEy+Uq
	bnVEwShlrB1N9uE+pUMz702LNPAA2L4C/R8A5aVrosKR2q03BI7mvNdd3/W7ULyy
	pSFoDpLTqARBo3lZXEa9f20rWkirhS71/ZrbExn0PAFjiwlF4j1JHR+flz2327VW
	GhQ7uNfqWYvFs1DtYUHaua6VrbySQLdQuPtin5Dw/eDlpueiPMDe6tkHkRdnDQNu
	2L57hHyDzVhR/Yn+IRuyzZwBwGBXruk68snCYDj6VEaK69vael8eEUCE7MT44jQ1
	mmGu2T0agZUh6z6RkD6pW0TcHKoN30AOok2nOdL49bWH6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd651jqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:43:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d5077ef51bso137243685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647420; x=1752252220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF/OuQJ8xsB/HKG8mieUfGiQXUFgzhYQV4ZPFUXGWjQ=;
        b=CqLfR+TOrOfB/7wQN3ciKb090/ctjaaAJlNAcc0h6G7Lfhz07iEHin6CHknHe+AZPJ
         fVvAuoT6TXJxIIrLMEzvAWNIRgDThnI/vomlKFO3owcA68mWFbZq9s3WsoB1d4ReCXGi
         8C2h/11zL1H0W4fso0E2DG7erCW6wJFpKVqACwg3iY5FlcMc6CkWUnGviuuxnb0XT8jv
         pbpyTzeM5G+xXkdK1KCW2SwpWjvEaoFvMmwSB1cleULe00cSPDKZxCMPTc9yXEZbNU43
         4VZjaQD9ihqvHrY75erFgQRZio5K+TyTxBsa8pk4uAP1o+BSlLKjhx6/uAS2mNuXSJGn
         ZyOw==
X-Forwarded-Encrypted: i=1; AJvYcCVMlehWcCn5vaswdjgJ1OsrkaWfvCUBF1wKw9G73+b2kGwdlhRljRbTn9GRLWInPFMnzePysgjerNx3RZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8bVUtMlROr1gOeH33BxYE3BjNV81sRlWv6ufAAjjtWD4tSDk
	ITCtGHMVbYkTvVrgYN1vkAi183PZQlCH7OW0HoEvO3V6mRqM3nN+X8uWvUxXnv/5DIdl81ogZev
	kuELBVQOzF19Oys+8kKt/aEgllBDLDq9kNlD19qjvp4wdkq3FavWZszRpXma1X00P88k=
X-Gm-Gg: ASbGncthuVNMkTcfe9xukBRzB8nwavD0FG5+RZOcg/nBDUcUMGkhSx+m4i5mFvMKtUA
	G1n/WhXi16bfRq+QHDyrpHo6pYwsnula84uwXHl3w1jDiQ1jz+GzUR9k2i1qtUv/lEmEw1YLry+
	rgdpd7cTLAsp+DyMN9IBaOUOuuw4RwwyFonhybiVrtlUakexhNzD/Y/UuYK8Shan2SFE1IO29qg
	kqW2GeArbZBZN1SsIH/CyLuwnC8zN5/7wshZbbLwYNjfI57a7e1qnmFdz/16FKbICebJ8wG8bi6
	3dkoi/ng/aIjRzD0TZzs5s33V0FuhYzMEkZXs/R7wOl/H+rVhWecLMHz7Z1Z0SdpsUM5LoJ2gF9
	iI4mNi89MRSnx5/2WQW1WmDfjksJRVMwxhcM=
X-Received: by 2002:a05:620a:4412:b0:7d4:ca4:addd with SMTP id af79cd13be357-7d5ddb727c7mr373956385a.19.1751647420434;
        Fri, 04 Jul 2025 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHn1PXyp0jkn2V0mI4Lk6POEXOcB3kI33BgARnqMb46tOWnip7KD7hHFCPDubKk5Pz6nWtPQ==
X-Received: by 2002:a05:620a:4412:b0:7d4:ca4:addd with SMTP id af79cd13be357-7d5ddb727c7mr373952085a.19.1751647419945;
        Fri, 04 Jul 2025 09:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383badaasm294708e87.1.2025.07.04.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:43:39 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:43:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add a sub-entry for the Qualcomm bluetooth
 driver
Message-ID: <ubypcytljeytit6pkis6ailue2wje6cth6yd5zjuo7h2h4e5r3@lq3hr6a2b5rv>
References: <20250704144724.63449-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704144724.63449-1-brgl@bgdev.pl>
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=686804bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=rHvIfiyz_3d-7KI9RAUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNiBTYWx0ZWRfX9gFNfArJYlCH
 z59B87/6rnobd4F7zqLmEwb+qK8fujK2zKCXESLJf/kdHwkayacMxUo2X0P7JAtMGynuIZZyNQ2
 WdEWtBAvHWvSTrGRRgcGLxtfZlwUmf6km9CTDQhAr1p1aMFG/jr2jVUn0yB9m9DuYC3IWOWhrHG
 SKMrPoBpHyNvTYupKf88c6INvXtK3RwO+Q/S680lP0a/GHsco73EPajQhyYRiTRMM9LaIt2RYRY
 raxZWT36qUNml50w8wlFRJ68rJSH7O1My4Erd8vl2Jv7xex2GVHhZAiBWcuL0lU8e8dpFtq3nIF
 ySKX9phOmhvVVbi2PJE/ZMaMrylrBQTybQ4b+mm9d/qOdJysGmMRTgd17Y5hBWSqlrp25s1Am3C
 VDKNj/bhXFpEOnCIPYDd3/55SY1EqTcuVVL39xsrh+vzf+frJ9REKjWrVbVWYUZ9S5JRMBSx
X-Proofpoint-GUID: -4AwBuiilMcZGinHlHKzXaHWm9aCsWVn
X-Proofpoint-ORIG-GUID: -4AwBuiilMcZGinHlHKzXaHWm9aCsWVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040126

On Fri, Jul 04, 2025 at 04:47:24PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Patches modifying drivers/bluetooth/hci_qca.c should be Cc'ed to the
> linux-arm-msm mailing list so that Qualcomm maintainers and reviewers
> can get notified about proposed changes to it. Add a sub-entry that adds
> the mailing list to the list of addresses returned by get_maintainer.pl.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fcc77c93f8db..7fee3d38baf8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20441,6 +20441,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
>  F:	drivers/net/wwan/qcom_bam_dmux.c
>  
> +QUALCOMM BLUETOOTH DRIVER
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/bluetooth/hci_qca.c

If you are adding an entry, then please also include:
- drivers/bluetooth/btqca.[ch]
- drivers/bluetooth/btqcomsmd.c

> +
>  QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:	Robert Foss <rfoss@kernel.org>
>  M:	Todor Tomov <todor.too@gmail.com>
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
