Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485B1F1311;
	Wed, 18 Jun 2025 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231307; cv=none; b=aWqgUmsoBQsZ/kstIn4RziuwIaajzOa2wIPAOX6fN5zYpnMcmRS+LxuUvB6nVEK8F5MYWDn1YNce6pMWdXH7UMhV5biW8/Hpv2ihRzvF3ASQ7fSA3TlePMXO9NL3JQSG2ztxQwBJST5T+uwrQcGgyiyEz3Ms14dKyTCFPVanIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231307; c=relaxed/simple;
	bh=DMaB0EHiDpQuMdteGAVlGxafPWBqSdMDnpiM9/ZjDhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BkAwRiAHyk21cpkHpc3vnFICcNP7cBWphZBSIAT3NFmS4bPtKdbMKJS2cKkWKg5X852RG8LC9WhNG+z4awv11McCVDck6rAXk5+EimvBkgjQkzALGYcrDQw004oZFb+9CtevtDgKupAh4DT1Sev6/8POKRf2Ha5+gumobpociok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5609963a91.3;
        Wed, 18 Jun 2025 00:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231303; x=1750836103;
        h=content-transfer-encoding:fcc:content-language:user-agent
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7silFJzIQOSJ2p48fGBWjoys8hVPbth2sPLOSzgJX8=;
        b=EYdyieHCpHWkeaFjsRkHL98jYvtw6oumb4I0KxhrGqf3IioxAlytcbHKnW1eZgbMLn
         EiyjV+yFtLERVfx9yzcAxc2v3Ov4xAM/ih8dvlpAnC8E4f8SPRppbteR3qFnXl6SHAel
         4U3Y8MOFBq/W/RXlYhQN4wrnyl/FGgiJen8cgguITQznTUiRS6FYD0s/ZOAu+/xuAAJr
         tgIhHK9UED7yhEfUWbbwsSSMg3en8b3jNpMsbHjDh7NqB8LD5uDdXJEAp7gRBJD7aBsF
         uHhnKr3Qmfx+RU7BEJEcc/jVXrC0UYr8G+N8wXl8rAb3ZQri0S9tGO9jDN1ps80sg32s
         Fg+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtWE313fHsMm6rY6JKlC7s3qj/ca3XU0Ya9qXc3KRbxNH72ZOCZep/Ra1FJNwiQFS2+u0WFR4izj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMCvANOrzJO7paGSpW+bL+UnGjo2JBJaE866gKgxIoYQBIcGr
	zfYfvnNDD4yUo942DJmH5i5l0lOWRxDBWspyjEbAOndZQvctju/TD88HGxlnDfrW
X-Gm-Gg: ASbGncu2rzO85/bPfTwN3tgmjrTW76iog7hy1RwdwneauxPj9ZqnqjVm9QtCys2dTg8
	5yRcDxa5vsl8XLumEMI1zPDsuXQXr50vnbUrPzx4/dJdTmJa+0XkVOd2cKsv6AlbLSpQ64QlLfQ
	DUxmmx0U56ZAwyE5R4vq0NOoKmyDXzZhQ1JjnDrdSX10Ecn1XgyNElryTOMVncrU0ul7ADYQTMF
	JnJ+dRfgyFZFtctMorHQpbNcSkieat8LBFplVoEZGnvrrqlmRqfVqlQ939pndIapJ/BB5ms+z89
	voJcLgFoGoM1oZn1agpQCeEZ0fT+jkjpNlTcsB4hNTfiC+B+WWme48M2XvoABWfNeM6YswNXNeq
	443c=
X-Google-Smtp-Source: AGHT+IH5gzaTw/dLw9epqMSHijmnw8AGlszrvq51ErM/AmUob6WJX2tI5qO299c/fYYL6byJTxV2KQ==
X-Received: by 2002:a17:90b:4cce:b0:312:639:a058 with SMTP id 98e67ed59e1d1-313f1d96ee5mr25133456a91.27.1750231303190;
        Wed, 18 Jun 2025 00:21:43 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bd9a31sm11959305a91.13.2025.06.18.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:21:42 -0700 (PDT)
From: xiehongyu1@kylinos.cn
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	xiehongyu1@kylinos.cn
Subject: Re: [PATCH v1] xhci: Disable stream for xHC controller with
 XHCI_BROKEN_STREAMS
Date: Wed, 18 Jun 2025 15:21:36 +0800
Message-Id: <6708fa25-2cfe-42e7-ae24-2d7e943b093a@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2025061801-gosling-urchin-c2cb@gregkh>
References: <20250618055133.62638-1-xiehongyu1@kylinos.cn>
 <2025061801-gosling-urchin-c2cb@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=1
X-Identity-Key: id1
Fcc: imap://xiehongyu1%40kylinos.cn@imap.kylinos.cn/Sent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

From: Hongyu Xie <xiehongyu1@kylinos.cn>=0D

Hi greg=0D
=0D
=E5=9C=A8 2025/6/18 14:03, Greg KH =E5=86=99=E9=81=93:=0D
> On Wed, Jun 18, 2025 at 01:51:33PM +0800,xiehongyu1@kylinos.cn wrote:=0D
>> From: Hongyu Xie<xiehongyu1@kylinos.cn>=0D
>>=0D
>> Disable stream for platform xHC controller with broken stream.=0D
>>=0D
>> Signed-off-by: Hongyu Xie<xiehongyu1@kylinos.cn>=0D
>> ---=0D
>>   drivers/usb/host/xhci-plat.c | 3 ++-=0D
>>   1 file changed, 2 insertions(+), 1 deletion(-)=0D
>>=0D
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c=
=0D
>> index 6dab142e72789..c79d5ed48a08b 100644=0D
>> --- a/drivers/usb/host/xhci-plat.c=0D
>> +++ b/drivers/usb/host/xhci-plat.c=0D
>> @@ -328,7 +328,8 @@ int xhci_plat_probe(struct platform_device *pdev, st=
ruct device *sysdev, const s=0D
>>   	}=0D
>>   =0D
>>   	usb3_hcd =3D xhci_get_usb3_hcd(xhci);=0D
>> -	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >=3D 4)=0D
>> +	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >=3D 4 &&=0D
>> +	    !(xhci->quirks & XHCI_BROKEN_STREAMS))=0D
>>   		usb3_hcd->can_do_streams =3D 1;=0D
>>   =0D
>>   	if (xhci->shared_hcd) {=0D
>> -- =0D
>> 2.25.1=0D
>>=0D
>>=0D
> Should this be backported to stable kernels?  if so, how far back?=0D
At least 5.4 lts.=0D
> What commit id does this fix?  Or what hardware does this fix?=0D
=0D
I'm not sure. can_do_streams was introduced by 14aec589327a6 ("storage: =0D
accept some UAS devices if streams are unavailable") in Feb 11 20:36:04 =0D
2014 before=0D
=0D
XHCI_BROKEN_STREAMS was introduced by 8f873c1ff4ca0 ("xhci: Blacklist =0D
using streams on the Etron EJ168 controller") in Fri Jul 25 22:01:18 2014.=
=0D
=0D
> thanks,=0D
>=0D
> greg k-h=0D
