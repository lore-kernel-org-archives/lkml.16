Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C9E2DCF79
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496366; cv=none; b=PYTe6WjskP6+9O0cavNuI7QdavxX0wClNlddNFWN6IT9CDZ++mQwy2Rgu1D1jnRdI8h2ENNCNFEsNY8wibPcdYomCuqLl0sZxw4mnIpoVeYwRgh/sYHwPSepn1OCYlQS6VVjZPbb+abC5fv7hw1JAsdkPA85DMI2YASduVsAws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496366; c=relaxed/simple;
	bh=1yUDGo1zRlZ0feBKNAKXG6uhzKxCc7vwlwrd7niyOvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPCi5DHkk+2kQGSKykqH2PZAwqCqMP+JC4VgwIc9is8I5cxakyk+rwsbWp7E/Qwl3PpGd6GFU5lerjY2Ys0Y3WjAzO8k631YKnJEYscnsY7N0rok2P9FBhIFUajKEpWoL5L8RB6tPHN/OXsjL8VIcsPnSqefAdzs+7Y/MogQ3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mm6wrDXh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mm6wrDXh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EqISb024889
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nGM9DZwF/Fd/OQyKb81XdMAc
	CKZwqXE+v9fpqIkuHk8=; b=mm6wrDXhutFr3uHC6qXUeeftTGzqIOoRT77c+zOW
	KhrL5iogdPPtxctY+wOJyx/UCrc2keVFfwbWeRsMeMlVGpgsHLtg+cway7Y+7/mX
	1Fn33tizx/wqTgjlkVDDnwTdmVEJFgI9auaXt7NBQvF0YSHAq7Qp+yqrtparSEJW
	fpkAuV87++k+c8bWywdmd0yy/lkbLtvw6obky8xTn/GsvjIkMzs0CdI2BnEKfnZ9
	kypp792UseyoI7eeNSxLzZOBd2W1Kz1p/GkaKTMys6rWd38STbIMs+xarMeXk93J
	1iYsOlH4donFFrvzpib73KIdBqDScU5nBpzLrcBtTrrIHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j80261x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:46:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso752927285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751496362; x=1752101162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGM9DZwF/Fd/OQyKb81XdMAcCKZwqXE+v9fpqIkuHk8=;
        b=VemUiNd7ohdI7gOP9meTkTU3Srbc5cjPKPtZUydCBEaXzhGO85QWkAl5wg5sV5Bkgk
         BzFc5aQFXTDWKnjpCw41ECGiXC3MScpHcniWswkEkQBNtOX9fczkLgfCIaXMg/a9zl4Y
         WdTmSH9eL/ENta0dr5+rOtCgkYl/aicHz9gHqQiWHbLlXg+PZ6sMqJLrG2tNVj6ukkbZ
         XCgU+2iOXyKl//g4HZFeHxF2szLkUWoK0/GyooowH9zt2DcmT+GxgwBpCvUEp6TKUVvi
         7JWcsh74SNMAcprYTxyIuM3xjchl8aEzwPK//IAcPykWi3je8ddVu66vkefWl8jMNMwN
         NBqw==
X-Forwarded-Encrypted: i=1; AJvYcCWnkex5eo94k0lqYXWBQOhsN8ylyhr/1VJ6vO5LuTV6L34SVvzKo+L+ic2CVClcRm2KGpabZ7NmR72M5Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYNZg+u2hj4X8zTsl+mVXZqyfvdq7TqzSRyfQEjW2NN0geSBEV
	3l/YR7/5QzKQTkfrTARybITU8m4BCH9jylT50HSJ9M7nvwpw+7PMdekOsDzmSfJSyCZJ9xaP/Yd
	GO9D/Z7Dhwdv5liTFZd3T2hh4qfsKsyiQdIUqIspySpR5hnREVNoqfIXoOXU5zQWZGtI=
X-Gm-Gg: ASbGncuxNycz8KQhll7kGIlKqbHejHtjZFu5RRkXDBoMrEjua/Ql2sXCa+hzZO2Zr1F
	wayv+XBs/MLjAKGaxERIzrxzTLPqPB5EXAAQhUOwWDiv85lz5OivXS1CcAoYE3o02oUAW6R5QND
	rphwDFlHdIGdU2b22lym+ZQrDr5aXH+tPqZyUN0ThpTD48vwMR6Q52/5tjq4M3nh22KhCWZ8dcT
	6X7E9fur4tZAqe9WrTdSg+jAQ8Mkze+nXwJTJ/COTQr3fyMNQifCSO/b9nq54AhQMFqrlnYabR7
	0CjljxPQ0hQm3hhtlTQ1TGvBhUXNuEX+EPx2f25llIuDzW703wdq3T1bce/cLJxyCvV/pSt4e6X
	e0LCufzzA1qJNJue4k+7DQfc9iX1lymtNsBk=
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195296285a.41.1751496361805;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZ1KfGDoGnAnKKb48QCXInkKCn1fPiOPT/0wf5tLma0vYWc3UfPox1mlLLdjDhi6HGr8ihw==
X-Received: by 2002:a05:620a:468e:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d5d1478c26mr195292485a.41.1751496361431;
        Wed, 02 Jul 2025 15:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2eed872sm20589301fa.86.2025.07.02.15.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:46:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Make dp/hdmi_audio_* callback keep
 the same paramter order with get_modes
Message-ID: <roqsr25rk6psidxikgj6gejil2n6yne5gsbuvbnanhtpuqivj6@fqxazmw26hru>
References: <20250702111453.102539-1-andyshrk@163.com>
 <20250702111453.102539-2-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702111453.102539-2-andyshrk@163.com>
X-Proofpoint-GUID: SXXq6Vzfbz3rp5vK2rZ2AQkQLqJBSrwD
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6865b6aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=ywvnwGVb1iWAczny1xEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: SXXq6Vzfbz3rp5vK2rZ2AQkQLqJBSrwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4OSBTYWx0ZWRfX8py1a8HVQmMk
 ijJVLNLrhgsvXwgqGI3V/XBYu9WrIbWy9njEbueJAkFHMCOWBrzN8ydvdU0aRoIcObbabm8sKv7
 84+otSmu8Ghjl0SOdtlbVYZzmDSRzKtSl15fTdEnoHeO6l+QnIdKgn7f4v43TPCfcCTQ0nDX0n/
 xGLHxDkZKhculYc9Kwa/OHpUlXSpQbikxTW8zmJMWQF1Z4CuFYSGyaZMts12IvSw63gfNXJbcWc
 9/jlcb7qHpGGnl57yiTk9dcnAH6Lstw8mu2ODhKCjSvF3xrYByf6utHh4qjoaAiomt5HLlBgEJg
 Eifvu542HE9iI3WTGmjvutfQSbMDRWUUxfua5ca4Vxtvhv0GvDwqV6LJPGTUhkByG2EyoXv+LWM
 /eY9gYH8XK2L7hjkYVrzJ7hdiFuUBonhdeYQR8NOcTLjrQJhWYNBbrLTN8YcQiI5Afeep21/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=767 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020189

On Wed, Jul 02, 2025 at 07:14:43PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Make the dp/hdmi_audio_* callback maintain the same parameter order as
> get_modes and edid_read: first the bridge, then the connector.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> Signed-off-by: Andy Yan <andyshrk@163.com>

No extra empty line between tags.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry
