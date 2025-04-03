Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518D1A23B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666882; cv=none; b=KbZXxDOieWcr5uK2PWmZ+WPP8eN/48GnTFpsnNixts1cWbt+uo5mdA6U2Ihkq+2emCbsKaaRXte5ntaPZaVoUO7t6N9reFwWCk2pHGfY8BYB9OL2QAXMXfNb4ZDUxx91nOheHZ4YlLktFttZKOQJCSFcS+/1aUcdyXA/IdcDAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666882; c=relaxed/simple;
	bh=gf6i0CVAAzE10h7dA00ZSf1pRHDUOoM/SpLiNoBF0BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEFsq1ZaaYWsftOU0DOM21JHx1N067BIWUJGgiH01z6Z9eh9Dk9NHLGhJO4u5yW8V5hD5bYNQCC/bAn65ufzXXxdP2bbBbRxzwszniXAVyHNECVuLT3hCgUTaCuYt+mXBRz4dnqVkhVvBvSfAne+FJDHdfXP653vfAgDimjdZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cfin3Ljy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cfin3Ljy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743666880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz1m2Mglph/2wgaShkIRZ/HYGAaWZeLEqP3Em69Ffko=;
	b=Cfin3LjybE5uhO1oMY+Pfc+zx81yy1fhLPGtF2gkREDQKpWzyKa7Oxz7n9wz+ERGyjqhLd
	7j2ppvABB4BR69/HWOVhgOnx3Gw8hSOrGoPS9hZuo3/jF7EvR8PzGkh7PyUME/yt9MPCGT
	9Q7KUV66RdUQO8oeSRdAoYmZCugfLxY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-MxpuabVANGGL2eGJrFVU1w-1; Thu, 03 Apr 2025 03:54:38 -0400
X-MC-Unique: MxpuabVANGGL2eGJrFVU1w-1
X-Mimecast-MFC-AGG-ID: MxpuabVANGGL2eGJrFVU1w_1743666878
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso342174f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666877; x=1744271677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz1m2Mglph/2wgaShkIRZ/HYGAaWZeLEqP3Em69Ffko=;
        b=AmhzywRzgXab732qVU8KrDrdXT1xxfPC5zZkH+8dfcJ2bSdEyPU7lttWOK32IMFjul
         78BbBqNbKkyq9zSo2aV55iTcocN3S4aNVNxO7fa6S6+KmroD7HiNUKUIpnvl9N25UMJq
         Im8ioU5ObSk8OLb2+reFW7HK3Oy9ktAOclCp0mxFZveaZbyMTC3BMsf52o5jxHgyEw2i
         GbB4HfIg5FlG3UXErnERMYWkjy29O05bZLxegUITCU19XweHGFxkXcNJignzp8jdIWJ5
         Uq4VTaPk4JTKyVMadalPIkRbL0Wvk/yiwH6FiabQvdRb5mD0rflnwRJ0Yg2gAE2s8RIw
         2GIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7lASj2nb0kh9oST5E4S8o0VXe9s7Av10O1eqy1mA4654NxVGfGmBXwKRUg2Rmcff3KVinsljIXC308ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpDQWddh6Q4vvNZIf/Dej56jafIsAf146L0Xb3O08VpivmaaT
	WHAnaxlpl7bHM0oEm0NMlnS0mEPaUPjgYFru1AN1ac3xsKwM/90nAy34RpSp1Qu7O1jFiZQ96qc
	yc+O2V5b0nDxfMfw4iD92QAOu6x6m4DElu4Zui3yjoOyKNL/0iSHrGqOmdGZnaM76Wp2uAw==
X-Gm-Gg: ASbGncvVCdL/yU3MAfcfEgu4fhbn0HKd8vosxqgP6mt3W6l8lz8AO+AwzEQTuVOoPl1
	5HTkKd6edOP3BwMNcW5p+m9omQUT166rnQ+J1avo3TxoNiLkfxYCS0LKwnE+P2CTwqh1oVOxVr+
	LGhqIL7FcF4IxwpQXdMQPcREvKOmOl0WZ2FronNIKMn9kxZsmHHsnXel2t0+BzXD/3uhije4Yo8
	Pv0b/u+MY1E+igWz7yOfHkmfg0UyS6fc4HidQ+0TKubdYeNuSnaUYkegmDtxtUENFUrhVcxFrxv
	Ey9oEwEJbYEnG9kwN5ZfODSKRf6Vz85eCECWxTK5Wsqrog==
X-Received: by 2002:a5d:588a:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-39c120e3519mr15921199f8f.31.1743666877169;
        Thu, 03 Apr 2025 00:54:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1And0QrQEVjir4GMSk2Lsi+httiSOnojJoqQ368wxmdq0Sn4aBnwA8LOogIOGQwQQEQgNOw==
X-Received: by 2002:a5d:588a:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-39c120e3519mr15921182f8f.31.1743666876820;
        Thu, 03 Apr 2025 00:54:36 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096964sm1069807f8f.15.2025.04.03.00.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 00:54:36 -0700 (PDT)
Message-ID: <58ad78a8-f84c-4249-b95c-e74d3edf1149@redhat.com>
Date: Thu, 3 Apr 2025 09:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discuss]ipv6: send ns packet while dad
To: gaoxingwang <gaoxingwang1@huawei.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, kuznet@ms2.inr.ac.ru,
 yoshfuji@linux-ipv6.org, David Ahern <dsahern@kernel.org>
Cc: kuba@kernel.org, yanan@huawei.com
References: <20250402121205.305919-1-gaoxingwang1@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250402121205.305919-1-gaoxingwang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Adding David,

On 4/2/25 2:12 PM, gaoxingwang wrote:
> I have an RFC-related question when using ipv6.
> 
> Configure an IPv6 address on network adapter A. The IP address is being used for DAD and is unavailable.
> In this case, the application sends an NS packet to resolve the tentative IP address. The target address
> in the multicast packet contains the tentative IP address, and the source address is set to the link-local address.
> Is this allowed to be sent? Does it contradict the following description in the RFC 4862?
> (https://datatracker.ietf.org/doc/html/rfc4862#section-5.4)
> 
>> Other packets addressed to the
>> tentative address should be silently discarded.  Note that the "other
>> packets" include Neighbor Solicitation and Advertisement messages
>> that have the tentative (i.e., unicast) address as the IP destination
>> address and contain the tentative address in the Target Address field.
> 
> Or is this description just for receiving packets?

Yes, AFAICT the above paragraph refers to incoming packets targeting the
tentative address. Outgoing NS packet must include the tentative address
in the target field, otherwise DaD can't work.

> The actual problem I encountered was that when proxy ND was enabled
> on the switch, the reply ND packet would cause the dad to fail. 

I think more details on the problematic scenario could help. Who is
sending the ND reply? who is performing DaD? possibly a diagram could help.

thanks,

Paolo

