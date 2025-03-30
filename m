Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E13EA83
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357444; cv=none; b=niX9ZUSkwjnBhgMrfWQqDeKdtebdHGN5XEo3pwZKmks5JfRtK97SmNiSjLmVr2o9KTMXEeUB2HZxcJCKN0pP9cV1gZBsMg4DIOQB8lf/xHEH0RgBOrxNFqI9Q5XZx+fZ1L7Fjw5uN1MUfUbx/cRTlr5X40acltrUA2puabJwUDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357444; c=relaxed/simple;
	bh=EtUorDddqFNcBwRwGkKlfqCbzOMDWMWH2CLtn81bciU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIF8pgpx2woYs7LI3R7JPRfeQRuiCsDAdJ867vdjE9Jnm3rNGJSuBT3mUycQcnYcgX/1etBN24cuXWTY1/QRxKhSvp1BP78T987Uq+B2tDVC3JaZNL+l5go5jgRsafi+QXfCg48lGYiENQcRP9af6mfWz2aOKXmSopw1crPs3O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKeMWYdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKeMWYdB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UHgPS3002158
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K48pr407NmdXjNjoX6mg329x
	m7rtHyYJTjFsde4INrw=; b=YKeMWYdB5WiByHomr3HUqLzPb0mauf8fzjxrgIas
	AgZ5rhq+gm0EyGwUlqiFWHV45RKMGb4i3VJsjOon6LzmluL+y9YUGjO0xw7PpjBM
	b81X7FpA2TDHsoQcF9lqx0ZTAX23dprZYYcKs9Lz7GT1JIsk8NsAqrE7lmTd2Ofg
	N5JJ3wgpljpARCwWhPD8BF9Myum1HzZyve3AioF9cDpP9w47hZvJYgwX9SixJRFD
	R9U3MGBwKJm+Lx3/wLbHQRkOMkuOhRN0GaEMkxpYa7ZxbcJs32ZAnM7XDdN0n2mB
	r4Mq9/HwCOlwdewUgLWC6byskwKFFSVmLllxIMRIztaPng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kjnfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:57:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so65473456d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357440; x=1743962240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K48pr407NmdXjNjoX6mg329xm7rtHyYJTjFsde4INrw=;
        b=BNbj0dDqg3FEUcynHWHHFdB4Uj7xE1JSaSRKSD9+tGFYAh2CKFHlmSa3QhL0rkbTQj
         Ym111v0AKzfCXGQ1/vn6/OIwdyOoiWtPqBsN8YYjJOrZX+qCoycqMuAp/eMWHKecJAs2
         v2HNfEbZB+YYTF2qKE++OjCl23A/ibVtjFzZ98c6ayiVatv4oOpWGumZ4G7yYKJHrSpp
         gpvXTcsQR0Baeb4JakVW0LQPQHvglnqMU/HL4zgb94XyGQ+B0/zozuoGOuRlc44CLGiq
         kVe4vmM7MD0L3doAEJ2La0m6NaOVRQtuNU7pEE5nsxR0v4LqqIvDL3QYo4i/b56FaAKd
         3r2A==
X-Forwarded-Encrypted: i=1; AJvYcCX7nbYRQR3w1nF+v2nwp0LjtvhuZu/RZyfQ+/W1jVJQ2TBtbW5pIWHkIqVgz8dgFOcrH3kMF+nrv3gh7XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVqqARx7EfklVGASxCysY+/mIF1dltNqcr5IsN+VOOgMJ2217M
	tX13lge1QTLoAjDJGVP/zzcDGosn+33eAxD4qYryi/YFuhRCLc5sCaHrc3YRE2T7nLaK+VjMm+Q
	fa2ko3n/wL0nmhfjRp56vdfX9Sv+HDym0DvwTeeCiGbMjsNEae7sytJbaeKsNvv8=
X-Gm-Gg: ASbGncuLgbMJ8gLSL1NCD/2yVj0nJgwSQxuvNFzUAvkjOIMdZ530KmE8mJo0uaUTZZs
	sZ5naLyf2++p6MGQ1/l8nymxh8HtfGGSSVN1QaS3tNTjjdzp7T6mPDsCbrkOGOijmjgO+pXbSLS
	L+0iyWw6+x5weaUUCa3UTExdA2/HfI1mBD2RVC4nE9nCfKcYPgAxSAY8UtFVYwIbfNe7RYpaThO
	VS17GUU4g1vCoAU2FHwbsqHdIyz03HToTDsX2gAKwVd9k5H6YS7HjxmB02ogOqPHTjPsrBx9Y9G
	WKSSYui0bw3UVQw2jeayVTN1uRFzqH8MOIziOh5n2HU3IQZjcXqJjm9cFTNiiZshgm5gLTFAqhL
	0Lws=
X-Received: by 2002:a05:6214:d47:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6eed5fd86a1mr108549376d6.13.1743357440626;
        Sun, 30 Mar 2025 10:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVvlmwx6EzG97d8Z/5FF9ujKK/PzZ2pMWAIcuSk6n/X4l9c0W6BiEXwN6oDfaMUgX+SiJCTQ==
X-Received: by 2002:a05:6214:d47:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6eed5fd86a1mr108549096d6.13.1743357440340;
        Sun, 30 Mar 2025 10:57:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4c7a4sm11820341fa.71.2025.03.30.10.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:57:18 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Set bridge type
Message-ID: <aectka7gnuydp6rvr3gz5ivx2bz3dpkuuatzwryewng5b7nflf@cpvtiddfrzz5>
References: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e98601 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=-avToEXnEOD4PdG-UZUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: bX0pdIfUXbrGRC85YPdUNjLJn0Fx_rwm
X-Proofpoint-ORIG-GUID: bX0pdIfUXbrGRC85YPdUNjLJn0Fx_rwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=917 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125

On Wed, Mar 26, 2025 at 11:11:23AM +0100, Alexander Stein wrote:
> This is a RGB to HDMI bridge, so set the bridge type accordingly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
