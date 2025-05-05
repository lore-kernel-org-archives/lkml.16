Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC51EB5E1;
	Mon,  5 May 2025 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441382; cv=none; b=bhVJSOloSIIWTu6FkeIeNCciQ3v+fduc9wCOlae4Bdttdmxb4xsllwMOOD5uWN1zPdoEVOe8ySixTEDgp+X+i8IrLslAucImGLPzHKAz1xMWCiNtRvgt8HvXpU/xzL8poZLQFgG8lzTxJ/jQyFaxD7e9TfZJnwMlywHLvBYAA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441382; c=relaxed/simple;
	bh=jmOQaZUqwMGEl1VHKs0Ua2RHT8tAchD7iNiDJkVw8uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEOONHwEiJ6MPJPu4Fp05qZAkCCC/zgFC00lUBYG85GJ9Wsnd+3TbjJ76RJWT8N6sffG9SlLBNK7UcD3jZEk4jPdeM6qebwAzdPzIt4cbRJSSohsXBaSlVIAgh0pEAdkV8+GLSXvNz2A7tcoe7CK9OgpFVwluea9zdq+XBy4xVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXjbp2p3; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXjbp2p3"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5ba363f1aso662784485a.0;
        Mon, 05 May 2025 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746441378; x=1747046178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSz/sPDiC/QZeGr/GNB1mzbdmiKfZk2fho7AI9XSSzk=;
        b=ZXjbp2p3Sn6o/GpBVSrEjj5eNEUPWIyyMyf0rPqu0hYupMfIgXa2+nH/xTZhbfxNUk
         6H18hRqPGqZgiIB6Cc7odxTmdgrRMsi9CpcUUQh/mqAX75G0Am9lveE4uQWlpTfV3UMd
         iy+B3EXCT84TozxBAdq1jvBSS3ObpHeMBpvZ2+PJGQKdURAEkfvmQs/BQnDrCd5+M3Wm
         fAoxxJt4o0Wt1AX1fGGVqbuWxMOxZbgxVNBoqP6u9kKySVSkqVb+GPbetKjbJJGjnIkL
         PXapqCtCFdW46iXvzATZtgcfaKrv//acdaDx3rKC+OAsRMR0aM0d2h7WOIO5cJE/qhws
         Zk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441378; x=1747046178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSz/sPDiC/QZeGr/GNB1mzbdmiKfZk2fho7AI9XSSzk=;
        b=lr9ILT/E2l2YScdjiwwMsmq4VlGVuq0T5pL0dQwow9nIVrYg/e9lfrlIw8SAoqVNut
         AlfnSciVvA7OfF+uvy6mpxBAbOYdlNHOP8IOXLnf4ekfAY+VIdFkyhHO4qvvfdps1BSy
         jCuvfMPvvQlX+8/FcVJUFm6z3Q6FZSeKu9urE6vmAzs44EALBIK7quKnavb/zDlhpcfx
         6c6NIOwRmb+i9u4zblg0zyFPPxh1lwW+4N4FIZfbtvenWP8bV6SB+T1YWFrvVyyaeXuK
         pkPKFOIF9KD1MhGD9BwF4Kp6/sitCP2qbdMK0Id3NfKj205eHFLIW85WIImfs2fLUKUm
         8nPA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ovsw81XVz4RF+DTNul0TNDvJeNz5b3AYLpaY9EVG7kh2ARTcAVPlhWE00ulbWfgIhYn99EnllsqwBJbm@vger.kernel.org, AJvYcCWnq4IzKhpnEfeL+/cY3v7WoNdGyIfzJLQyy4wkpGAYFIDP5n6QKsAzeTLAVIeRGmkOf9/yJq+14j8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXYJejOx19KrDlGs5UEpcu47v/DW8qTKf4qd1e9BDC4dEBBgC
	9DairJEfvZ47CMd23XBTl9BUqWBiukK8kb3dBmQG6JKXr6IbGNJd
X-Gm-Gg: ASbGnct5kGG/n/JusDCNCsDNnjTLIvY2JwQd6uWOiaNIRYDKyQfzhcO5EpOWj4TjlDP
	tDa4/6SPZiWzSJp6L/wzQsxV9kSU6MjCrnzKfZZi5CvMYsNad2IXAJ5+WaS4vdyiu4ajf201x5d
	DNmZnPEr9nm0n0+pTD/R90LU10UJX++CeH2TNjJsnuZDcHnnUvh4MRsEizYDJPgR+R3LvvxtBU0
	XzSQjEelL7+yFOxAQMGvpKwstr4x43/KByU/WT4TMTALQMDm0ytoozRdUMyUd9HvZhofwFA84Ig
	5f3kUDulM09OZNo99TH6IAHiDRVqsdaI5TCYw6YX+1TCyqnCEKkDRHRwxvTHgg==
X-Google-Smtp-Source: AGHT+IEGFiuPwtx5+ptQcYP4WqG3qE0Q0U8qKthDrzIQB+NTFScSCy2F+JLC1iCLj7ayC8SQku10Bg==
X-Received: by 2002:a05:620a:8006:b0:7c7:c6e6:bd3d with SMTP id af79cd13be357-7cae3b18d4emr1074489985a.58.1746441378556;
        Mon, 05 May 2025 03:36:18 -0700 (PDT)
Received: from [192.168.21.149] ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242b6dfsm548847085a.68.2025.05.05.03.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:36:18 -0700 (PDT)
Message-ID: <1a403393-e317-4a1b-a151-fa668c6278f9@gmail.com>
Date: Mon, 5 May 2025 06:36:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, detlev.casanova@collabora.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-4-inindev@gmail.com>
 <bb171ae2-c495-49a3-a7eb-a4b865e54199@kwiboo.se>
 <87892840-bdbf-43d4-bd93-cb98f5e1c672@lunn.ch>
 <b603e92f-8c1a-4aea-8bab-82a1f035c7fa@gmail.com>
 <b50c68bd-9b15-412a-ac00-1df25601edd9@lunn.ch>
 <46cbdabd-b0ed-4c9b-9f01-4d2d8eceac24@gmail.com>
 <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Language: en-US
From: John Clark <inindev@gmail.com>
In-Reply-To: <13407dae-4c73-48a9-846e-92f08449bc4d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/25 8:45 PM, Andrew Lunn wrote:
>>> What PHY is it? Are you using the correct PHY driver for it, or
>>> genphy?
>>>
>> MAE0621A-Q3C
>> http://www.maxio-tech.com/product/12928/12929/12930/12931.html
> 
> Mainline does not have a PHY driver for this. So nothing is
> controlling the delays in the PHY. So what you have above works by
> luck, and is likely to break once there is a PHY driver. So i suggest
> you drop the Ethernet nodes for the moment.
> 
> There does appear to be a PHY driver here:
> 
> https://github.com/CoreELEC/linux-amlogic/blob/5.15.153_202501/drivers/net/phy/maxio.c
> 
> but it has a number of things wrong with it. You might want to search
> around and see if there are any cleaner versions around, or if anybody
> is working on upstreaming a driver for this PHY.
> 
> 	Andrew
 >

Hi Andrew,
Thank you for your valuable feedback and for pointing me toward 
investigating the PHY configuration further. After digging deeper into 
the MAE0621A-Q3C PHY (PHY ID 0x7b744412), I now understand why it 
performs reliably: the generic PHY driver relies on the GMAC to set 
RGMII delays (tx_delay=0x20, rx_delay=0x10), enabling a stable 1Gbps 
link for gmac0 in rgmii-rxid mode, while rgmii-id failed in my tests due 
to the driver’s lack of internal delay configuration. Given the critical 
role of networking for development, I’d like to retain the GMAC nodes in 
v3 using this setup, but I’d greatly appreciate your approval on whether 
the generic PHY driver is suitable in rgmii-rxid mode for now. I’m eager 
to explore a Maxio-specific driver for mainline compatibility and would 
be grateful for any guidance on existing upstreaming efforts for this PHY.

Best regards,
John

