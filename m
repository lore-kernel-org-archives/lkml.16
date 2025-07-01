Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E931F4E59
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357452; cv=none; b=GOWokDWOIqcJOa0qpVSGCFAzkMD9XuvPFtPSfFChmemqGQiih52zFS7F+CVES6/F2hegBYUEvBqNZQsfZqEVpUVSdtC7C89luP00Z8b88e+wkkSWPb6aTcB7zZFze2bx8lDpsH5KuvtjBePJxILbs+nloXzQLo/vV8jZwAOakpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357452; c=relaxed/simple;
	bh=Ai0ZdyCkBW4P/dlKXeTGNa7zBThv3hnYZ4e3mI+ljQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sqn1XbMjXiYQxFxbVkVwAlekimvOBKnis7lE7tgeY12ZcDrHpuHc7WVcY2qMwkR0RtZ3HDXAh6f3kbbm+/F+KKsWsPRBV41arfkuHoEfGEjNKWQHJiUA3xs0i3PYXcr9fVju6AEMvpQ7QbuKXZ3/AtYr2CwG9dFJLDykvFnQwP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXjPbFAp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXjPbFAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAqeVupWS6I/KQNI1FlEHR4MLjl2U9bDCimmR0JRiiA=;
	b=VXjPbFApLlmvOQXYj3NG4QdV1zADwcOiLab8N/4R1tkT2MGGaR0hgmCp19rrjPStd2LB56
	VKHlIp4mn907QiXC3olttrD6ftxdiF6hnFiBBZ32ykbDe06jFaGSQsuTkNS5OQ6kUqXRLF
	RaSp3DHhODyJeiDtLbzj+IFnN2NBs3A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-9eFuWVKUPGSF7fyKiO85Fw-1; Tue, 01 Jul 2025 04:10:48 -0400
X-MC-Unique: 9eFuWVKUPGSF7fyKiO85Fw-1
X-Mimecast-MFC-AGG-ID: 9eFuWVKUPGSF7fyKiO85Fw_1751357447
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so1132940f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357447; x=1751962247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAqeVupWS6I/KQNI1FlEHR4MLjl2U9bDCimmR0JRiiA=;
        b=sr3VPaHFjrgx77oHJ4J/915NkgoILoX91vQdOLUS9+PaQgZ1ibcuqDUepgN9Z5A8at
         fegI32Y2D3SR5jkkfcmauoWO0042LZ9H+c5F5sLTw3uh9hzcmxjJr/RZrIT6I6iQqVSM
         mGvlUw40xmojqM1fVq/oX9xDkceLnhN9mxlsZhCQWvLP2WB3Xh3XdbtA3Nx2SvgUoW9y
         FQq2DnsnLQgV6YCP2u+Pzk9mxqao9W0JSXTmctNQrakRLoAPzZDGmrpflvomry17C4ga
         z+d12WgW/VP1alAIx3mfmd38bRCCe/d1P3Q2XMqfV8FQmA5XpWUbZRKRR2q3d2y0Ng7j
         DHWg==
X-Forwarded-Encrypted: i=1; AJvYcCVhr2T7xgt5Q+xyllNH220ScIqA7MV0ycgDxluHeyDg1W29Y6yaS9ElI6HEJt8crIKRK2ff+PhTI4q7Xtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjqGmRzP0VFcU9Egt1xGrxQkbXD/FXUBp0DTYh21Ts0SuqJNU
	rzoCR8P0uCLBYaWj1rgw6b+qgVF2u4QOjUHm4ITdWL7QAG1tJkqlpfzIEyVnU8rKKkKTmZsjLw8
	PiMHbNXot1AwissgUr7fCclmGi0tbGiPE4zcMW6WWiFz10Hb5vAARQC5bHN8VkVbTEg==
X-Gm-Gg: ASbGnctuI4Ty1dJOLCMnLv3TpMt2Qg2x0rB/nFdG1IX0jzbLs67cRyZFCK5d8CFEQMO
	GzTbkriCduq1EsNkBu18yCrDJ8TlUPexAfn/+4AWPbFlTakR+0GtBj9HPmnpt2mshSL4kHWk3kC
	ZRFjzuaBpaHi1hbTLvn7X7MvIlnWlnBh/DXPkppZhpKy7NWqMnJFFIyYQX6EWJfe27aRkRW1scw
	PyU56yb8VvgzOb4Xaj4U3TWiPm3WdS5XE4nSgv0OgXtBJBwkz0CWE/vif4B58KDtV50NCq+vaA0
	1b7b0+/tTFhEgmWpDWTbJDJXqIOM/qLE/emLriPHYtc6sdhM3b+rQYt0xzj2ejW0qvgqGw==
X-Received: by 2002:a05:6000:652:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a8fdb2a48amr11268674f8f.19.1751357446968;
        Tue, 01 Jul 2025 01:10:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx6UqjSEdXQoTmkruINaxIN0faimhQXh3dmFyrDiVEZmXp+ezv4u3owvO0Rm2F0PetPqhFPw==
X-Received: by 2002:a05:6000:652:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a8fdb2a48amr11268643f8f.19.1751357446457;
        Tue, 01 Jul 2025 01:10:46 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm12744073f8f.16.2025.07.01.01.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:10:45 -0700 (PDT)
Message-ID: <ee862e2c-d268-4530-b3a1-a565640638ff@redhat.com>
Date: Tue, 1 Jul 2025 10:10:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bonding: don't force LACPDU tx to ~333 ms boundaries
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>,
 Jay Vosburgh <jv@jvosburgh.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Tonghao Zhang <tonghao@bamaicloud.com>
References: <20250625-fix-lacpdu-jitter-v1-1-4d0ee627e1ba@kernel.org>
 <2545704.1750869056@famine> <aFwrOs73E03Ifr-i@do-x1carbon>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aFwrOs73E03Ifr-i@do-x1carbon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 7:00 PM, Seth Forshee (DigitalOcean) wrote:
> On Wed, Jun 25, 2025 at 09:30:56AM -0700, Jay Vosburgh wrote:
>> Seth Forshee (DigitalOcean) <sforshee@kernel.org> wrote:
>>
>>> The timer which ensures that no more than 3 LACPDUs are transmitted in
>>> a second rearms itself every 333ms regardless of whether an LACPDU is
>>> transmitted when the timer expires. This causes LACPDU tx to be delayed
>>> until the next expiration of the timer, which effectively aligns LACPDUs
>>> to ~333ms boundaries. This results in a variable amount of jitter in the
>>> timing of periodic LACPDUs.
>>
>> 	To be clear, the "3 per second" limitation that all of this
>> should to conform to is from IEEE 802.1AX-2014, 6.4.16 Transmit machine:
>>
>> 	"When the LACP_Enabled variable is TRUE and the NTT (6.4.7)
>> 	variable is TRUE, the Transmit machine shall ensure that a
>> 	properly formatted LACPDU (6.4.2) is transmitted [i.e., issue a
>> 	CtrlMuxN:M_UNITDATA.Request(LACPDU) service primitive], subject
>> 	to the restriction that no more than three LACPDUs may be
>> 	transmitted in any Fast_Periodic_Time interval. If NTT is set to
>> 	TRUE when this limit is in force, the transmission shall be
>> 	delayed until such a time as the restriction is no longer in
>> 	force. The NTT variable shall be set to FALSE when the Transmit
>> 	machine has transmitted a LACPDU."
>>
>> 	The current implementation conforms to this as you describe: by
>> aligning transmission to 1/3 second boundaries, no more than 3 can ever
>> be sent in one second.
>>
>> 	If, hypothetically, the state machine were to transition, or a
>> user updates port settings (either of which would set NTT each time)
>> more than 3 times in a second, would your patched code obey this
>> restriction?
> 
> As long as the transition doesn't reset sm_tx_timer_counter to something
> smaller than ad_ticks_per_sec/AD_MAX_TX_IN_SECOND, which nothing does
> currently (and if it did it would be at risk of sending more than 3 in a
> second already). The timer is reset on each tx, so no two consecutive
> LACPDUs can be sent less than 300ms apart, therefore no more than 3 can
> be per second. If a state machine transition sets NTT within 300ms of
> the previous tx, it will not send another until the timer expires.

@Jay, I believe the above statement is correct. What I'm missing?

Side note: I'm wondering if this should be considered a fix, and thus
requiring targeting the 'net' tree and a 'fixes' tag.

/P

