Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280120E6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746419533; cv=none; b=fDcqdQZETDdzRoDyecLkMMkivbx9ncKD3eXHCu+VW2Lo2zQCVMyhz4gAA2LZW2oC37WDctu5DuPb9P8KpTKH2B9Z/hx4PYmvjzYAxYxdqOKjj5xluXHFsSSBOhytKb/rthbkCVxA46PeHYEFAw9aFOj9uaFmHFeAbeNUupOGdOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746419533; c=relaxed/simple;
	bh=qKyLsqHMd82QXxwMoK1lPglXYj5Shh4KEGQoUQrq7MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYVeyH6mMqwOoOrRqe+duRI++7oIAKaAjqxMmXRkWmhyeE6sP88ctO9fiPkaqRDV7Y1qFRsr82QT8J8hxxERJObMx0cfKd+TL6y7mINnfYp0VoGGHN7wvBsmlFaf95Ick1iygfmsJQxfr3s1fD6XkGgS+NVrnH1d6bJm9ZjBy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODSZkumf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODSZkumf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MQNh6030928
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 04:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhhINkAZNQ1HFEf2SMii7PH58AWcv7zkJD04P+FM7j0=; b=ODSZkumf4rSHcDcs
	a2TfSK52m2FufOd88yz8ixkT2qGrDzihZUGbDnkkz1QfCYdHR8Km/sfP0vnaza7P
	V4sMIXoqWKfsRCbsZ3PNmtXtI01NJj4bOc9acA/U5SVVxtoosQfzyOZcLJRCRaEI
	d999j/yScn2fjnefSALFIfLwsHX8B+VMRmdgNVs/Ms3UX0uthKFB/wq+rEwb010n
	HwISdBzJG3H6XpLVRAdLb3TQjQAFqk4AqACDuTZpCleiMMbpvhZO9Mb/M2R4BNXE
	y+WI09hlAdJjyI6URMJBOUOgYQX3xCA6HhEfJ1VmpxdZQkkS7tX2vqsUXMHmrJdo
	eQS+bA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nku1mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:32:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394792f83cso3037585b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 21:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746419529; x=1747024329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhhINkAZNQ1HFEf2SMii7PH58AWcv7zkJD04P+FM7j0=;
        b=P6GyTlev28pQXX/yXgzgHYoiT82uQeVYYO1ugrQmSmDCWknONYe4JKZb22o86015/Z
         Eo2Hj1QvrKUmOm1GXoyXD2dAHklDLqFZNj5I8oImFTGsVGMEULqUdlf6Jt70X3a7oKgC
         kSAtvaCTDCSlF81g5wCJt2KIFbSUTj1NhJGNQ9aKalMIe9ZQCUta5kvDShoXeKfJq7Dc
         1VzaV1qwrqNvKowKZaN/Ja8GPkNs/IFjeSuvi5XeNxPuNeVKEYzN/3kIZR8yVmX9xEqQ
         fwVKKoXxMk5GhYrADJDfhRX20stzLxiva1Ov3GXpYmHVkO/FHFfgweExhIZujaX00eC8
         gPFA==
X-Forwarded-Encrypted: i=1; AJvYcCXLp/fspIGXgCiY8Ob+oEjPwtG3FR8qyt7/WV6cbZqxwrZgzq6GetKNUJ0GnEvG7bxRim/UmL/LBJcceBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfOY6YPy1dU9Z1qliJeL9hYNmfifYvPQxGOua6P9e5nQvVzW/
	Fyf9vzgtgwiG4vDSXGSITf0+RqfDM22UteaBXMra2xytYe0caEMg7J911HTIEX6v7ywZP7Mhyf9
	u8EgQzW5VOE/KYkT1GzWXxcZv2cnV1JQ+jUtNt+Ot89LoBNOM4tAaNYXqzb0gsq77Lax0aBc=
X-Gm-Gg: ASbGncu+imBlZ5z/4vkAooJWrslDIjZOu9pmh+9qKeH8e7QC7bQi7ICnHm4ut0Rx3P6
	iFgN6JD2/qjppjfw2mYMEDx+TTND6RdBzjt5/COpneORhZCiCO4t+j/BpPOvulahZUNnBjcwGXQ
	dFzWfgBJ01dJ08cWAbj6ElS72Pb0EW2tz5ZxwzYt3rW/fyIt2HkIb/g8qkjWza0nAuJJh4eny77
	GOfLg/s+znwaL6H1gEaMWhs8cVayb9QRjBwwQNCUbJowDFT9N72cVR1v2ROKCaES+DI2oNYZ7+v
	NytNr4z3LRYV3lRXvNeyNuyvClp52OEwqSqh
X-Received: by 2002:a05:6a00:aa0b:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74067422defmr11272004b3a.23.1746419529426;
        Sun, 04 May 2025 21:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLuEj73Fhq1qF2MI+zXBDkItR8PmfQtPaO8WMVBj8ULLWXmL1dUCnonNLvpyiqoahF3LBHAA==
X-Received: by 2002:a05:6a00:aa0b:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74067422defmr11271986b3a.23.1746419528961;
        Sun, 04 May 2025 21:32:08 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fca324a9bsm1985171a12.0.2025.05.04.21.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 21:32:08 -0700 (PDT)
Message-ID: <f177cbd3-dbcd-4487-ae9f-25c656dc1572@oss.qualcomm.com>
Date: Mon, 5 May 2025 10:02:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_ether: Continue to send skbs if remote
 wakeup fails
To: Zhilin Yang <zlyang_001@163.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2025050321-apprehend-lavish-ea92@gregkh>
 <20250503141958.584143-1-zlyang_001@163.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250503141958.584143-1-zlyang_001@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA0MCBTYWx0ZWRfXzzY9dAHDE3rw
 7CYkyiwSgwGH5y4iJH1XnCJApC5buen/utFDD4+MuA/HS7yt3IPEKjcf5AwxK9GJPh218rkxo9o
 C5prOYj8Xhhw2wU59F1btA/wWzMicxg8gEwJuDF1R5M7anfEMR8qp3bHacUeWblUouKf5n32WFb
 O5epMMnwt1BZYsIdD4fBvm+OjFiihfWCz3TMILoI1Xcoj0sEKV5fGutH7PApqmXWN5+cVBl5qkf
 rXSWRt/iJksBRY89/GF8jIC8DwevfgXZbC75os1mOb4kP/BgoJd/DSrkWvV83dNvLPT617SNsHa
 7wKkYuRcyX6S6STTuTwkbIsTeAuoZ75nTtqayKLgXKM5z7sP1+IrdrGznHn5gPXGCaJ/c3+CRQK
 W3N9aerGkgAJbf75b2xzsoOv7HxIPN6eSprE8JZdr/fDapoI1eA5bHo6EHcDKP0crkmINrcH
X-Proofpoint-GUID: ak31ldKjs_8csU3qYcJVou_aGlHIk4RC
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68183f4a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Byx-y9mGAAAA:8 a=Ht1ddUJqX6ZoSwiRCh8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ak31ldKjs_8csU3qYcJVou_aGlHIk4RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=564 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050040



On 03-05-25 07:49 pm, Zhilin Yang wrote:
> While UDC suspends, u_ether attempts to remote wakeup the host if there
> are any pending transfers. If there are no pending transfers, the
> is_suspend flag is set. If the is_suspend flag is set, it attempts to
> wakeup the host when start to transmit skbs. However, if wakeup fails,
> for example, wakeup is not supported, skbs will never be sent.
> 
AFAIK, we shouldn't send any data over the bus until host resumes UDC.
So either the remote wakeup has to be successful here, or we need to
remain suspended until resume signal comes.

And the SKB won't be lost here since we return NETDEV_TX_BUSY, and
gether_resume() calls netif_start_queue() which starts tx again.

> To fix this, stop to queue skbs and return NETDEV_TX_BUSY only if remote
> wakeup operation is successful.
> 
> Fixes: 17c2c87c3786 ("usb: gadget: u_ether: Set is_suspend flag if remote wakeup fails")
Is it really "fixing" the above commit?

> Signed-off-by: Zhilin Yang <zlyang_001@163.com>
> ---
>  drivers/usb/gadget/function/u_ether.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index f58590bf5e02..9d746ed3f072 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -473,10 +473,11 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
>  
>  	if (dev->port_usb && dev->port_usb->is_suspend) {
>  		DBG(dev, "Port suspended. Triggering wakeup\n");
> -		netif_stop_queue(net);
> -		spin_unlock_irqrestore(&dev->lock, flags);
> -		ether_wakeup_host(dev->port_usb);
> -		return NETDEV_TX_BUSY;
> +		if (!ether_wakeup_host(dev->port_usb)) {
> +			netif_stop_queue(net);
> +			spin_unlock_irqrestore(&dev->lock, flags);
> +			return NETDEV_TX_BUSY;
> +		}
>  	}
>  
>  	spin_unlock_irqrestore(&dev->lock, flags);
Regards,
Prashanth K
