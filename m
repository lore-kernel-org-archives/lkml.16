Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EEA1411DE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263155; cv=none; b=RiwoRU6f6kNxJ6jqnT46AHqrEM+uqXORlZKtbR2ILALu5GTiFeoAn7h2brzeebaJsE+O18DIm64wusAOW35GUihiu38LE5VofSibXTrjJOhAhJMCArl3ekZuU5T4TarAkM2SM7NkAOUznbIFbBsiWiFpXbQRuQYt8iT/yTyEjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263155; c=relaxed/simple;
	bh=YzyhNX9KUIj9DB4k9cyjB4ql8xv3pIrEL47uAOd+GFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLY2BgfpDimc9VV80B5Xpl3toTKZ5yGw++lcBDcs4bwwM42Z2QQ2vaMYXYq3xRKtlKl1cxUf05FqRCIEL2SceUpTHI5tCOjQ4MisulNgk2D7hxNaWWtk9Tfg78ZZTrYEHBGXkN65YTOgJh9JBbejv1tdKl4D3Eg+iKWsWUCThas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRvigm5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRvigm5f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIg5FP010134
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3HJl5U4M+u/M9qqMj09srNN
	G0MDWTXKKxwIH4K4Y7M=; b=dRvigm5fwWZc1ilMX/w8yI7PuHCy+5FF58b+6HIq
	V0TUg5RHAUvBzFNoCHImgJKL85cyjUqkfeUKCNX+chaSb1lQUHn7QVnGyDvbbrLS
	+X5IMjell2ndEpIRyG3WmzOpMn97E/YTKdJL9ixO6Vzv6QPhauY/kke8trO+jA+a
	TtIWCAKCElJx1BWCeelebVxcZSjlE9lw+v9KhIFCF73UYrpSFZFcaDlOtnecxOnf
	yuCvykTuvLONEEOg6m9j7OH0VFYV2FMgtzSWtVo61GxRM8tCZO3gO8QhWOHndWBL
	+fg/P+ElBdNgaCcKJ4yo/X2PfPBCK23MDxK3p8tLovN0Bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bn0su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:19:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so78548096d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263145; x=1745867945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3HJl5U4M+u/M9qqMj09srNNG0MDWTXKKxwIH4K4Y7M=;
        b=BlEyi2WrfueDl6Z19IZEWu6XBiY6IYmHYdhhS/8y23BZeEILYGjcrkUAs+1lKfEesn
         Yjkpmbq1pDIy+C5q/Nca9xDUvJ71C3kV2xbtapg5Mnu8elfI6/ZOBkVAslLQvuO5cADV
         P6GdXSj3R6r/RYVaICHPXoGkgwQE9k8OpGOOdZk/uLVCp6Ws18PSMVdoiya+WM2ElJlI
         N4rKKh8y1LLFLOY4LcGhAjmE8c2JlKsLQ3Z3WbpAXZcouuiXzPK+f4zsr/IVlOasi/68
         6VEXP5XhpEVUjqTOE40RDkbpxLn2XY89sRrdv+hSRi9a0oCfbg8+Qj4JU81fWE1seXWr
         Zygw==
X-Forwarded-Encrypted: i=1; AJvYcCWsaNi4RLt769s9sgYdjBL3AvtozfW2i2bRA+R7vskjzGmueLxfesAJtccCs2njxSfwEJyqAwaUgEIrFrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKudDJDgABNnINY0m1WIMwcLjVXfS2A+5DuXsYOFVbWfvJs0+C
	sqzmjHZzG/Y+eKdmyR3TZjINT37/RK6TQJiReQ5F86c6SWnrlLOxNiEZ6sAmkvY7y+9NzlibcBu
	BdkzECJRQuhquN83nVO/oJFPYsboBOwkuDyzw7MiC9LS3mXMOhji0Ij9oh8YW6F0=
X-Gm-Gg: ASbGnctpPy7l8kyKdo6WJoA6YQngoW93av9w6rUZVQydP971Z3dHLFC4R+PANdGXJOI
	vuPuQlq2+QhzKAvWhcqnj7vpgrFQtrcIr6QdcqlzSrCOZg3Wyo6ovCy42tYTxUOefNLP14jsA9m
	t0Cwo+OlZ6VH6/W1wA3jDsZvC3Fbmgjd7HCwvj/lGZy/AIxG/G1JEYQIjr/f/wGjFaknbioEVmw
	OHI61bcdPJQxBC1SMWSRU7/+FcoZ5TLrmS0AMNFwGQkO2wFy7Gwhys3fmMp+4zFDHQPZ3iw2Kse
	GkwLu/vJpaQAqK7TOUojaqQ2vtREMdPt8mZ90YgI2x6uVAvV9+hdgaROcObo2Qb/R3G0A914Qu0
	=
X-Received: by 2002:a05:6214:29c1:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f2c4655ae9mr244942996d6.34.1745263145465;
        Mon, 21 Apr 2025 12:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZIiJHpu+XUpxDxWiR87XVzvWdC1v4TRH+LmXdVc2oMPFMOGKvkVumgqYB9XfpZ+V0eYgvyQ==
X-Received: by 2002:a05:6214:29c1:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f2c4655ae9mr244942486d6.34.1745263145127;
        Mon, 21 Apr 2025 12:19:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f6854sm1002109e87.254.2025.04.21.12.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:19:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:19:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, neil.armstrong@linaro.org,
        quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/panel-edp: Add support for several panels
Message-ID: <323jsow4mg4ku7hrcw25qpr26nnzbjbtin367ysevyqg6ax46y@247gfrr3rk64>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=68069a2a cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=waiYy8LU7usWoTZ8VmwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: w1p4do5PRWAbkBMWjyyHeX7_oRAVcLVp
X-Proofpoint-GUID: w1p4do5PRWAbkBMWjyyHeX7_oRAVcLVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=919 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210150

On Mon, Apr 21, 2025 at 07:36:34PM +0800, Zhengqiao Xia wrote:
> AUO B140QAN08.H
> BOE NE140WUM-N6S
> CSW MNE007QS3-8
> 
> Zhengqiao Xia (3):
>   drm/panel-edp: Add support for AUO B140QAN08.H panel
>   drm/panel-edp: Add support for BOE NE140WUM-N6S panel
>   drm/panel-edp: Add support for CSW MNE007QS3-8 panel
> 
>  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

For the series,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'd still like to hear a word from Doug as he usually manages/reviews
panels.

-- 
With best wishes
Dmitry
