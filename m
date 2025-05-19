Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7526B0B2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649349; cv=none; b=roAvlDLmP/sNTEtFkJOid55wd94lm0GUWJLevj+8mStN6ZICY1chDDJv6cRPSzfe8cl2w8xqHPplp81uIARisx0ivNweh5hMFANVNrGO4MwatgnMuatI7RYog7BLxPWxgqZs6Q7VNGAobsN85Ejn8TnjqNuO+zosNFeDQO1HMDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649349; c=relaxed/simple;
	bh=VK4Lg5CbF2+Chn1V73kW7YtLGVhH0SqCynv0S9wx5qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGi9aMu390AOT2nwIn2ztHyCECRTI+M8xeVi+8/xiNRUU1ihoU37uE9WGgsEp8jylxY6y6OkCFbXzhcWPMiz1UTgTMcl5V5Wp2V4dQnpqRT4sM08cePk8pqvKjSYoweau+hk5XJbzW9qUqBwFHPhcrBDflbaeBJ46GfBUnVRAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCUAB4sl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCUAB4sl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ioKf022751
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gExLf4nwbbzsn1CvTmMpFR5H
	ZTE/Vz8CwqmXdpCSURw=; b=KCUAB4sl60Ppt3YijVlmoVsb8Unpd8+mrp6udLpJ
	qZKpXt6MXcXL3kQ6ucflGNWwi85JWfEAwJYzEDhrntAgbGzeJF25h0mXln4oCekw
	Lm1cZt83ndl9Q9KQvMlxqK1tICEZEe1GgL/fUtb8f/PwHrVGQfw1Wr+Z8/+5Cj7W
	TQv/PFR/kf5Qk85UzOjqh7CiPhGLX2eXGIOoWZ3HnKv1aq5aRW+x3MzJ/vpjCY00
	b2PjK/qN2BJEw4HWdVFx97YEgwgedsm7lw5Xd5rQe18dVhXW860AxNFPsQFOsQmY
	A4SozEEBn2pIiSSj4418jCKGa36pMqaUILVjuA16AOfDBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d02n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:09:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e114ef64so2567556d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649344; x=1748254144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gExLf4nwbbzsn1CvTmMpFR5HZTE/Vz8CwqmXdpCSURw=;
        b=lw+dBO+N3F5xw2BOaEeLXuop+afYkImaglE8j5LegSuU8UykxEa5jkooqDAf5VkCXj
         4TI1l6z6kvLW5GaHSrPw38lK90RdMyFDRdVG6QQrLCODorIGGJC0eRQAxwx1nPJ7iaA1
         UH3IBlogIut98dXhPLfRrfmRJ6nBluEOsfz5eUlMVBM6nBhXdmGb0gsgJubZ3yySUhN/
         M+gKT7IFeJ/IXVGqbHHdQvNcde5dxtGD7WGGTc86LaM9GTQXe2WH35xANmOiwzJ3HkpC
         LQ1S2LXhN7LiTZELFtE+EKCckBay/hvwdImsXr2mn/mbeni2YGcMf3ceE9mwyYnmOefR
         WnFg==
X-Forwarded-Encrypted: i=1; AJvYcCUe9Ycrs65Ztx1UQtrk4UKefCqcs74kTH1TlRJBEEd2ojTmKh1AHeth5hWmj5c2zOuT7SDAHAwWf0AbMCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbIlSv62MzuYksHwOnjt9V4vpGjoQ/wx+xXLNMVSSpZ3dS5B0
	kuVzn+GNaonNOPlHAHZrLFHUghHmyRCS9OAUBpd/8l85+YHGM45ptR9Nc+QTENHDaT5DfrkV4t4
	ZXXBeI65dRiPSTfsEKD7lSXOJE76XidLS45/cqb4j6Vtm1M1f0dNd+NO6o0DMofD4AYo=
X-Gm-Gg: ASbGncvsTmM4eMmexv8y92zF0fhA8199dsQsYjIdfg9Y4NSbYnWjhz5w0OEMxX7ii8X
	XAI2y0wVtphWRv22a4xPUm+sG3B15YdqS9SOAG7DZO0sPiz583tOiUae2rxA9VX6y9QRMQAyGHr
	zNw4DVjLVohtJxw/Mc6unhfQhDpNWLSqWSBDT9ROCzkRBl4Fk4hTEcXEEnKOub56zcDu2aSO8+J
	e28e+u/J/fdQ3E5EITQPuIOhPZA/8B9YYne2TgXdR19zh20k5AXa/pWCetxyZ9BbrBv2nucEtN0
	eosa7rkzYL/x0lOT06NSWgRjHtbeaxjxnvrmRQx28aLCZnyexbVaXZNCBJOEpxuh0PmANvR+eG0
	=
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr198284866d6.20.1747649344540;
        Mon, 19 May 2025 03:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ZPmRny6EDXEzeqxSWhOYSC9IVMwUrrHfsOKmrKjR0CQOZFAukV48bhjo8vjKXeN14CN4ew==
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr198284446d6.20.1747649344157;
        Mon, 19 May 2025 03:09:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b4becsm18483831fa.12.2025.05.19.03.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:09:03 -0700 (PDT)
Date: Mon, 19 May 2025 13:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NiBTYWx0ZWRfX9VNkTMaspyfo
 j1ROVqRZK7zBzALxYINgx0WrtOxwmAxgI8ELVC0eZJMMpkxRehS2NzWgSbCMWkydwZCoYOTnsti
 nI3Nujv+QwBiztHfpHEVmtqj3FtfuI5c90ektx0abUji/vvbxF6heIw9waIW+qcwMJmk3ouJilF
 o0/n9ZRsZtCkhR7l6o7Lt5PZcjMlHQYSwqmlO4oiAjHvExkgCYITebIAvI2ZHqZodHWq4E8FZGz
 //KQqp0t+jryM1yDLya1pcz8lY/8g+obZJ/e0K+cnbAHWcE6EldZ0EjMVFv2VP1Iczhv4fPzZeI
 FO1GYJ7e3KjF1enwWSjUYU26MfohWZKfrv1lHkG2fW9yrmn1qu1p3XZk7sU2izVsjIO4+LxzlnU
 hRVnQiSZ+q156ZKMuMgxyJlc0TYB+oyAlxAunT2ydS0RdiY79wZzPFHoMJZzCuAd13DeONel
X-Proofpoint-GUID: G33cZ7jVVk0RRpR2rNes-OyJ59wp-_g3
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0341 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bUqMqVa3r73BJlF5iGkA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: G33cZ7jVVk0RRpR2rNes-OyJ59wp-_g3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190096

On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
> > The fastrpc_buf_free function currently does not handle the case where
> > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > dereference, causing a crash or undefined behavior when the function
> > attempts to access members of the buf structure. Add a NULL check to
> > ensure safe handling of NULL pointers and prevent potential crashes.
> > 
> You are mostly defining the code here, but not the root cause of it,
> What exactly is the call trace for this crash?
> 
> > Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> > Cc: stable@kernel.org
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  drivers/misc/fastrpc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..ca3721365ddc 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
> >  
> >  static void fastrpc_buf_free(struct fastrpc_buf *buf)
> >  {
> > +	if (!buf)
> > +		return;
> > +
> Most of the users of the fastrpc_buf_free() already have the null
> checks, It will be Interesting to know.
> 
> If we decide to make this function to do null null check, then the
> existing checks in the caller are redundant.

I think it was a primary reason for a change: to eliminate NULL checks
on the caller side, as we do in a lot of other kernel API.

> 
> --srini
> >  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> >  			  FASTRPC_PHYS(buf->phys));
> >  	kfree(buf);
> 

-- 
With best wishes
Dmitry
