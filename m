Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3A27A10A;
	Fri,  4 Jul 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614773; cv=none; b=nKAdEa2PHx4vNe1Ki3laTq92SLiKuvXy8jj1JfB65DG672LWgRYJRg9Eke00CXtJJCNkMV2jT45gWInYhQXMCjIcyMghOqv10ZrAh44JmRIvsYBfwbVD3D4pd7+HHSipdv5wL360FQMoeHFIePA6aSZpmE9QjGj66Pi2mDsPDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614773; c=relaxed/simple;
	bh=zUyh97JqCK3KdJWYl2/MyQW39mdsTV459TPaykhk8Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1KT/Xd+98vTcTxCi5pgVqFBJsSpQ6C2QJ8yOXBi8NrcKFG9Q9bqeIkdlnBc3VTi0Rf7TB84jT2HaFdoUS6XxWw6DLiTcGH1t8fqWW04JoCR2ldgcoY5b7hh9emiAniTuv47Wivtw5X6HkKTdUTeGFZn1o2be7jHGMkm5XHX3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0002f30658aa11f0b29709d653e92f7d-20250704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0563ff65-4080-4fdd-94b1-5dab8a616b77,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:2e1a03c2da9073700864a3e28dd55ca8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0002f30658aa11f0b29709d653e92f7d-20250704
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1483698095; Fri, 04 Jul 2025 15:39:21 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 701D716001A04;
	Fri,  4 Jul 2025 15:39:21 +0800 (CST)
X-ns-mid: postfix-68678529-2855072498
Received: from [10.42.12.86] (unknown [10.42.12.86])
	by node4.com.cn (NSMail) with ESMTPA id 6E97216001A01;
	Fri,  4 Jul 2025 07:39:20 +0000 (UTC)
Message-ID: <86b6de1e-9e72-448b-89c6-5b69e6c18c90@kylinos.cn>
Date: Fri, 4 Jul 2025 15:39:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: Ignore UAS driver for SanDisk Extreme Pro
 55AF storage device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
References: <20250703092946.939936-1-dengjie03@kylinos.cn>
 <2025070329-rinse-engaged-e7af@gregkh>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <2025070329-rinse-engaged-e7af@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/7/3 18:01, Greg KH =E5=86=99=E9=81=93:
> On Thu, Jul 03, 2025 at 05:29:46PM +0800, Jie Deng wrote:
>> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/u=
nusual_uas.h
>> index 1477e31d7763..9f093a6af7f9 100644
>> --- a/drivers/usb/storage/unusual_uas.h
>> +++ b/drivers/usb/storage/unusual_uas.h
>> @@ -199,3 +199,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>>   		"External HDD",
>>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>>   		US_FL_ALWAYS_SYNC),
>> +
>> +/* Reported-by: Jie Deng <dengjie03@kylinos.cn> */
>> +UNUSUAL_DEV(0x0781, 0x55af, 0x0000, 0x9999,
>> +		"SanDisk",
>> +		"Extreme Pro 55AF",
>> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>> +		US_FL_IGNORE_UAS),
>> --=20
>> 2.25.1
>>
>>
> Please read the comment at the top of this file for where to put the
> entry.
>
> thanks,
>
> greg k-h

I'm very sorry for not reading the file to be modified carefully.

The second version of the patch has been modified as required.

Thanks

jie deng

