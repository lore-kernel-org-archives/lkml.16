Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1621FBE8A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130503; cv=none; b=HrdIMlYGfi7+apW4IICi7DFCE3ffLr0Vy4hsJoCg2YVjuYb+7746+RwWmLuQVXfi+7RE4bt/ANWdDO1uDBKplipZLHfMw0o0Naola6h3vDuJ6/8S4AegkFrqWuXxqsYQ9T+SnDATlXOu2Yn8+mJ0WoL8cOwd/XNXIlkqPVXFR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130503; c=relaxed/simple;
	bh=ojzM8tJewcR1FRiny3lz5cqL42aN+J/8Fi6qYxt58YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEy1R94ruz0FmSbRx2eZRCc7S00sMQBipfUFG8XkrVBBUxuDff7J77bnuQXl0+LY4cWLifi6PnlIKsZ9pigaKyTHkOrza56XPGUO57CFrb+qIXR0FdK+TL+KcNSmffjtVPslJtseGUCFCFPSSoABdTfMNvSIPlu1ltdG8baMths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZyGq40R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZyGq40R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4nnc8010467
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmUsQShKav07IpbuEzrm2WqB
	NCF27pNKrvaOiyVpJf4=; b=LZyGq40RdUpBNMyGZA6lU2ylG2ydrM70qHxP83d6
	q2XPlhEC+2FGMHgq7fVSn2Ajk5lDRkVs+galwJ0Gsa4yPys6drJuqN04LNHfwjXI
	j3uZ3twcVBjFcncug1E8A0+7GMsrcbyiOXt6d9PDw1tIUpHQNjwS4TsPPxEV1gs0
	In/yscNcuf5uzie47iAt+bfULQopnq9/mzgdDf8XFM4ZO/VHsrO45RndAtPe5Zns
	OECi85TZFvq9dSIrBCN0vUOWY/TsFnHUOGmlMCOciJLo0l0aWd2Kna8d6tvtTvh/
	J5FmAxalC6GD2/2T6wKlp5KzPdht7CZf5f/P0w0hme+MvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801ry5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:08:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d446ce0548so153803785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130500; x=1751735300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmUsQShKav07IpbuEzrm2WqBNCF27pNKrvaOiyVpJf4=;
        b=P+drzhSbwsx07ws1m9Sd7IlWq+mnrxN4bO8gPLZIVQx9N/9091yVgpj4BjGAyYzxET
         LUYVIpADyWsG/5AJtt3YU18KRnG0FSeCY7w9yxfNJGE6Hm2LkxamIJ8MG3u8GiJyJ9+V
         YVnb9xb/A8MCEXh4Jm9QYqHJnF4T3WGtoK9ILJFwJNp9+ha88weGTLdyiXy8PA2QKepH
         ZO445IM8EOY7nSX9LI482heKQBLAKYBgfz741F5fALrM04x46SkxlXvpzWtX+0irZ1aF
         bctxySHbtHRQTTGTW5aGS+65s4iI7Oe+5GLVI0iiJIt+BwzkJP9Ro1KOTfYtkpsoyoHF
         j+rw==
X-Forwarded-Encrypted: i=1; AJvYcCVD6eH97+vsDqttrDOACbToyyZ2VGPTx/zQdnKCmmELfGszt9j1OfpQVPW2sE68IBh7uEDbCcZYUzGdr/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNd5skv2Bl+fBuMGiCkocJyZS4tp/rZOZVbgXTnCixfKW/KiWh
	Ue7VMzNDpCdloEa2ya+/FTrMVGPqgrYRO9PjKhIfnK6fGCiN5d77VNJ28sW7ZGoM65lxTb3/OEO
	Y0W9keFa4ne3A68jnvSxVtY2H2LNDhoftkcZ7YfO4yTNndJ0nXvSbiEWuMQERdQ8hxOU=
X-Gm-Gg: ASbGncuHk6UGoiMDahHHY380cba75rJA/hl6Tb61VB5I07sQ5kbJHc+/ynKhtD41sy/
	xFvyZtbeIHKsOtOk182KM5dUlbJzCCQKleXPQOJiNTZmHCW7A+DzLNe6kAKMJlTpntBJietRHok
	QYZZOvWxMHcHgpjJbgnf8A09ZvKHJkTC+QrR09qpzUvMX1MK6QSo+c5Pw6jFxIH4ko2ZhaHcl9d
	rTNq5EQNy3dzStcdhgcxQk2PyPHp85Hf2yJjcZDC9hgeEs/SPzr9aDDJD4jLIAp9WEA6IqXKTjZ
	FTlJid+q1gSUUw1dpheSXEVso1lnz/WCz48oXJ8MVPTpMAKlROZgNbFskglNkJR8bsaV7oDLlJ1
	VYM6RYhtipNTIywZN2d74IUqDXD47MIyrniU=
X-Received: by 2002:a05:620a:c92:b0:7d4:4b09:e326 with SMTP id af79cd13be357-7d44b09e491mr498357185a.30.1751130499640;
        Sat, 28 Jun 2025 10:08:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG32SmCiU2DxD+I2ui+UyKd0ZrfAGlnYEyPPkg8jIAJgdMtGWswgxyTItcl+rq6FIMhUqwcYQ==
X-Received: by 2002:a05:620a:c92:b0:7d4:4b09:e326 with SMTP id af79cd13be357-7d44b09e491mr498354385a.30.1751130499142;
        Sat, 28 Jun 2025 10:08:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d7c4dsm852389e87.207.2025.06.28.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:08:18 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:08:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 08/10] drm/hisilicon/hibmc: fix no showing when
 no connectors connected
Message-ID: <d3d23wf72e66e2lyj3jqsmajuskx5zbqok33o2sx3wrd3nipje@wavrn6adtbtx>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-9-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-9-shiyongbang@huawei.com>
X-Proofpoint-GUID: t3X2JJ3lemStyNw1Xfbv5RLKMHstcWYj
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68602184 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=L7FkTbdyDGPqRg8DWXAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: t3X2JJ3lemStyNw1Xfbv5RLKMHstcWYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfX5GVs7/u9rcdL
 F8Vhh2VN8vHRX1XX6WVw8Z+WyhnaryWZM/wXFah+wbscLw29fVzg0yRcQ5wW9QU7TRnI2rce2AZ
 6sXY03fVG/x5Xf7YwcsKHbFA6BvNuz8REHS89YLn9MG8bpcK1neX1QXRmQ+NyciESuTR2xV2UE3
 Dz+TyvAIhUHdnVRkJCokAP6SWInwya1i8vR8wGl9jwH750UefUFFHz2sRPd+EEglOL/TlHzJ47l
 4BhNzafyTOsAYvMLR2OQq4QzXtTmha8pOMfmeBdA92Otq+r1fv+A43m13FZFD9OKdAKnem+Iihl
 Bvu8QRwkEDgudfq9RXksvDEl1xnTmyLzg8BNBf59kbEZwOAWrpgIGHvkYAeTC5LkO9ectWllI1T
 L+H4kT2jiOg1xc8TBLkjGdMYmM9T9Jqb3D3XNmwo+YdaEvjjmPtn/3CnfjeuyXRWaohnYGpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280143

On Fri, Jun 20, 2025 at 05:31:02PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Our chip support KVM over IP feature, so hibmc driver need to support
> displaying without any connectors plugged in. Deleting the detect_ctx()
> of VGA to make it connected when no connector is detected.

I think, there is more than that. Please see how AST driver handles the
same issue. I think you need something similar.

> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 841e81f47b68..953474d04b5c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -60,7 +60,6 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
>  static const struct drm_connector_helper_funcs
>  	hibmc_connector_helper_funcs = {
>  	.get_modes = hibmc_connector_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
>  };
>  
>  static const struct drm_connector_funcs hibmc_connector_funcs = {
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
