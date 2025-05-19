Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DB2673A3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639807; cv=none; b=hXn1qoeMAK/5C5rsjUL6P75VQq0VH/PEE56nw6liNLDSmU6BMhnTpipO43Sqj/JHtHiJxqjQ/sUBHyTNnC/SUDGDFo6sff1edB0gl7aHHGTulyCcq8lK/Lgdl9Q/yiHZxqcJtbPBjlt+FXbXFyIJk4hYccWn2UyEuniMNeUuHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639807; c=relaxed/simple;
	bh=8DQrGW3fNond81i8XUM1ng5L2vDaVpermOep4R9MteE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgFZprtGQgcYxI3wCEhjXWpyGiINwvNAG/CURSYldNpXESQ8tmG/b8KIDKuMVBAIbefH6Wwrf1URQ+gOZxkGHhKiOebsSvKV9CP2420kCc5in0X6hko8kR0tVO3YoO0SrAvaadcZiFrBT4dytQ7Dde9BewYyQkUpQk4PTFdwJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOwuvj5c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOwuvj5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747639803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joHJ7VkBkFOgihuRaFy1ry6ubQhRRYbdaHEDufKQwd0=;
	b=XOwuvj5cvxrk7xqsCyQYZYYOE/Fm5CixgSiOfRPrCXA6qFKJ1hfBrFLvq0PLSubjd6FUeG
	heVGkl8eQ6ii2Bky12LmtdzzvkC/kqKBNzRwMDwl2i7mbIn5hoJxGoUicBo/dhsVnmcWQT
	lX2jfhU5sKBL/RTD1T7jzZ+SriOQP/A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-hgsoXBe2MkK8yW3JTd5Dlg-1; Mon, 19 May 2025 03:30:02 -0400
X-MC-Unique: hgsoXBe2MkK8yW3JTd5Dlg-1
X-Mimecast-MFC-AGG-ID: hgsoXBe2MkK8yW3JTd5Dlg_1747639801
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so23587935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747639801; x=1748244601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joHJ7VkBkFOgihuRaFy1ry6ubQhRRYbdaHEDufKQwd0=;
        b=grAl9wmnpSwjvKWIO/66RX9SS+EEy2onpw3dvdPrYsrxmTKNQhzuv9djG7W8J/jijr
         NBEBbKGWfy7s4HQaH3Ze6Y5bhwsbfvzC5jfNsFJ0JT1TBj2VRduSWdoleMUti8LTXPgq
         vx7Gq0m/yZQ+xwwAakfk+nigAA9eR4c0HJztV2afnBoUS+RaORdQduEOLpN/CNlFWR3C
         QG5053A9ZbZMdegruOIWjPscqOccqwzsp5t5QLBCS6BKCE538mfgjMA0RL9glO8wl2qW
         P9OD2usXOtk9CBPZcuCGGyIeZ44BS/js5vE8XTyDgCCCWHTzhHctH22dLnVawmK59dHj
         zKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6dEFBjJ+gYaxsTReU62AC3AH52/s4/09SPZHQq/7D7TUS/I6blZMthD9djeo/s4OhSgeSYqJ8PAc9b70=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYwSp3eO9YXBHFq1+RUPtYNCzipM/xzWsKgt3AEbxPaIdxMCs
	P0xPXM6wk5ohtCYjf8RSVLFeHrQhq+6uNHDfT6G2OfUn++Sj54yWXRg2N+LsdDbJfINaqDa/fwI
	iS56ixMyBpjFp0YGnIk/P7ZO9+53+6Ca5VGZT61U7cKUkdDUOCOAEAbN0bbYKyOsDaA==
X-Gm-Gg: ASbGncubFtAQ9fneZptNiIKGK+BytunDt0tqLezeDt30l1yGHAcOzxXbqCwWqmeTOFJ
	wArduUaChF3MvUgvbPJkKQYYCjDJTcW4su+lO0qrT24ZUY7ui1IdJTUVeD2j+W34o3p6OwaHsMP
	wvhYTpGTL4l0ngKGW6VIKftnUoRdvaIKSWhaxEpY325AFst04LBO3RvE1I2MUA+H+xxxZ56KZxp
	oFLuaxD+hG6OL1uGs1RliwffdNzqM/ZHtG3HMJZhb94DVhdm/s3ROjq0Bad4BwyMbMieTF+INm/
	YyRIxVaxNWY4yvuqGKc=
X-Received: by 2002:a05:600c:468a:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-442fefee29dmr92666385e9.11.1747639801120;
        Mon, 19 May 2025 00:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2Y4WKeNu3TbKYtE/Els3B0YLR831MXjCS7lvm9kYztKB54r+MlAwo8fTOt0TbLPAwQD5Dqg==
X-Received: by 2002:a05:600c:468a:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-442fefee29dmr92666045e9.11.1747639800739;
        Mon, 19 May 2025 00:30:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f9053b4dsm156471475e9.4.2025.05.19.00.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:30:00 -0700 (PDT)
Message-ID: <71d0fbf8-00f7-4e0b-819d-d0b6efb01f03@redhat.com>
Date: Mon, 19 May 2025 09:29:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Jakub Kicinski <kuba@kernel.org>, Ronak Doshi <ronak.doshi@broadcom.com>
Cc: netdev@vger.kernel.org, Guolin Yang <guolin.yang@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250515070250.7c277988@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 4:02 PM, Jakub Kicinski wrote:
> On Tue, 13 May 2025 21:05:02 +0000 Ronak Doshi wrote:
>> +				skb->encapsulation = 1;
>>  			}
>>  			WARN_ON_ONCE(!(gdesc->rcd.tcp || gdesc->rcd.udp) &&
>>  				     !(le32_to_cpu(gdesc->dword[0]) &
>> @@ -1465,6 +1466,7 @@ vmxnet3_rx_csum(struct vmxnet3_adapter *adapter,
>>  			if ((le32_to_cpu(gdesc->dword[0]) &
>>  				     (1UL << VMXNET3_RCD_HDR_INNER_SHIFT))) {
>>  				skb->csum_level = 1;
>> +				skb->encapsulation = 1;
> 
> IIRC ->encapsulation means that ->inner.. fields are valid, no?
> And I don't see you setting any of these.
> 
> Paolo, please keep me honest, IIUC you have very recent and very
> relevant experience with virtio.

Yes. Specifically the GSO code expect the inner headers to be set,
otherwise the segmentation will yield quite wrong results.

Note that reproducing the issue requires a quite specific setup, i.e.
bridging (or tc redirecting) the ingress traffic from an
UDP-tunnel-HW-GRO enabled device into an egress device not supporting
tx-udp_tnl-segmentation.

If otherwise the traffic goes into the UDP tunnel rx path, such
processing will set the needed field correctly and no issue could/should
be observed AFAICS.

@Ronak: I think the problem pre-exists this specific patch, but since
you are fixing the relevant offload, I think it should be better to
address the problem now.

Thanks,

Paolo




