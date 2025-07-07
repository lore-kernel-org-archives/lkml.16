Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022D27B4E5;
	Mon,  7 Jul 2025 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882001; cv=none; b=upsIznX73q2GwHFdEZKMemWcHVLhPUvxEIqfadST8p5rltHs36SunisN+q/HYtw4RDZdEdxC3EY8qYZmYGhl7wb2Dx9Fl3rgRblK24G762w4z2/bkg1EmBbiR+x99gH3j2jwMjHnWZcppBC76Snzfig9DiGrax6ieNWBKnAGzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882001; c=relaxed/simple;
	bh=8ikOpE89nvt2c13af32uAx4FAwR6RstV2FdUjQu/CSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSZeF61X6JtXNazCwpPqbh5G8qPxuss78XlRFzZYrlekWpNvquk7/7YEPBGCLgRN91nYtKejF72OS2+CxRIKi9g9kYuWvejMm/8tmsTBeniiRIM2heaVRdHOvoparu8B1NwsEsnDyW2zy6HSBD8lq1DLY6aMn2eymmtuqAY+jQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2e93fc545b1811f0b29709d653e92f7d-20250707
X-CID-CACHE: Type:Local,Time:202507071739+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2ab2d498-7f91-40bb-bdd8-b619344a3bb3,IP:0,U
	RL:0,TC:10,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:6493067,CLOUDID:0e0ec62399c8d822338bf1a4d728e3dd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:4,Content:0|52,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2e93fc545b1811f0b29709d653e92f7d-20250707
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.86] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 428882174; Mon, 07 Jul 2025 17:53:06 +0800
Message-ID: <2c4af4f8-5763-4ebf-8070-c7eabf43fe5e@kylinos.cn>
Date: Mon, 7 Jul 2025 17:52:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: storage: Ignore UAS driver for SanDisk Extreme
 Pro 55AF storage device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <2025070422-punctured-opal-f51e@gregkh>
 <20250707062507.39531-1-dengjie03@kylinos.cn>
 <2025070725-circle-recite-bc04@gregkh>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <2025070725-circle-recite-bc04@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/7/7 16:47, Greg KH 写道:
>   　> So ignore UAS driver for this device.
> > 
> > Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> > ---
> > v2:
> > 	* According to the file modification rules (sort by VendorID 
> > 	  first, then by ProductID.) Add the newly added "UNUSUAL_DEV" 
> > 	  in the correct position.
> > v1:
> > 	* The newly added "UNUSUAL_DEV" was directly added to the end 
> > 	  without modifying the format according to the file.
> > 
> > ---
> >  drivers/usb/storage/unusual_uas.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> > index 1477e31d7763..6b1a08e2e724 100644
> > --- a/drivers/usb/storage/unusual_uas.h
> > +++ b/drivers/usb/storage/unusual_uas.h
> > @@ -52,6 +52,13 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
> >  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> >  		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
> >  
> > +/* Reported-by: Jie Deng <dengjie03@kylinos.cn> */
> > +UNUSUAL_DEV(0x0781, 0x55af, 0x0000, 0x9999,
> > +		"SanDisk",
> > +		"Extreme Pro 55AF",
> > +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > +		US_FL_IGNORE_UAS),
> > +
> >  /* Reported-by: Zhihong Zhou <zhouzhihong@greatwall.com.cn> */
> >  UNUSUAL_DEV(0x0781, 0x55e8, 0x0000, 0x9999,
> >  		"SanDisk",
> > -- 
> > 2.25.1
>
> Why is there two "v2" patches sent here?  Shouldn't this be "v3"?
>
> confused,
>
> greg k-h 　 　 　 　 　 　 　 　 　 　　
>
The first sent V2 patch was missing the description of the
differences between V1 and V2 patches. The V2 patch sent for
the second time only adds a description of the differences
from the V1 patch compared to the V2 patch sent for the first time.
There is no modification to the code. So it is rashly believed
that it does not need to be defined as a V3 patch.
