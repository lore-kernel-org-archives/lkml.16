Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23BA28BA95
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715390; cv=none; b=BCej6U85LB9IBVHCeRbLUqLiVQKKWuSPfXEd1dG8IAQ9I3Z4oAS2vzmWingJpbCaTlcWIAp4qxn5lFZ5VuuKG0lq/LVc2qkYVD2AzD4TzVQdwGgsN849B7P2zTmF1HRomBUUTv5IXw1Q3JdYrVw7j304LXNyWXOp+vIG8F/EiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715390; c=relaxed/simple;
	bh=pO/orhA4CZkpIQOEAHrMBfFRKYVsaK4BFhuTXpXsFyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiIy0pHxehwCFRL2VxjX1OaBbxW4YKXtZPkiFjWAOWMob9LPnIvQ+41ODZRy2wQg3YKYoKdDlFdjdJNBztKbdjmud4gzkw6YZJGJevxmrHJdvnXUNQ7sIeYcXYq36HT9DbqAmVBGsORWklczeKqo7Cqeik+RP2mxQDXzFp1H9sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TtsodRGN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TtsodRGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744715386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfg6hG/K/bUlTifslFe0q0e0tS/Hfe18LY4wSrh6Bck=;
	b=TtsodRGNZ9ue2rsXY3vY+GH8J6ZaRx/KQBrOGfN6vh1d1sECINHNOMAsSPwEjDvnhrb/zN
	fBUiglxjBJVZ0i3NnWymOpE/R0clBl1e8hnCazMbUSOZtvhqZO6MZemPTvC3yBZC1GXuSx
	F0IAIBLWi2mc5e0B0rEtvjLR9YwHs5w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-uCkpwbZAP6WPCscpvZwkAw-1; Tue, 15 Apr 2025 07:09:45 -0400
X-MC-Unique: uCkpwbZAP6WPCscpvZwkAw-1
X-Mimecast-MFC-AGG-ID: uCkpwbZAP6WPCscpvZwkAw_1744715384
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39131851046so1971338f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715384; x=1745320184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfg6hG/K/bUlTifslFe0q0e0tS/Hfe18LY4wSrh6Bck=;
        b=sROKca2oeQYjY4BhT8HvWS1qZ1G+/AzxIpud9Ww1lzJVaFzeXvf6I+1mZMRg+Y46hT
         FADzPZhwnz66+s2/C+2f8yRLOl1VsfRKDKJ4OOY6myD3xdVCtQaoNwllNTWc7zT0PMQA
         9Q5cr7Q/URhXtc8/xjp8A8tgWdL21jTIReG/ktUMpgnQVr5IlcboAP6vSnjdWoDgDpUo
         44F5sU9WZFC+mU1LJH3OIflu6lV+OPzIbyfhlowNoJqiEfxX9PLdinVCK7EKnVUzACWM
         15CA7QBqfJxu9vDCzzW2lBJtaaYjyLEH8mkhXNBmlXJTBXJj6luCbA5VUDMVdw2mvpJx
         QQQw==
X-Forwarded-Encrypted: i=1; AJvYcCUrER0vtq4ukXxScDaEHzXyxNtaobIANR6jw0ZmvbdAaihRhzDt97JaFF66GH4hKza6XFZKQpAy0uhy2no=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYXaj7f7yZkux92KzmTt4M2qf/qohifq5MPoaOToMZ3djwC4Tt
	nCAJrHrmwGw3p+p1pTIRauOoPrFDK4k9eiUascNXRlNjjVpTUZqsw63PCjlQDIL2dWfDC5n1CvW
	or9uuNLVZJb/azMrjNbGXFu/lt2k49yidWgT+0b/+9ettQmMpeGnbB+jzvNOI5g==
X-Gm-Gg: ASbGncv5v9zHiYOvuin4tSoHJ70G63WF63FUvW7Qus3791Js6ATcRY+1tTs5/5IUvAY
	QZ2ykdKow/QL1NEVt8Qk8ihbOC3qPyQE7NKEJRSpp/c9QHv+MzyYfytCNP8gVNITmRF9cBPA92U
	uq7CeDtnQxdllS3yrOZ5MvD99YipP1Yt29tb+JiZrbx1awyigvsulcYn0U17C1ZJ0LRYbRJ3qsi
	5A5T/Ycs9GteHNwyWLFArJ/6fwiRWxrZWthlzzI/LcNKkF3oq3OY/0ZhQfBhMlRtM+I2kA3JWKZ
	/tQw+42FNCL1GmSzOjeuLiY0f2QeXJkLv1hJg+M=
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr11800060f8f.2.1744715383965;
        Tue, 15 Apr 2025 04:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanO8hlN3E2sYMOBJM/QMDt/pr4AiCH7Bh4HhFQVy1kY1F4hzOAbHErMxD96ZS7aMhWnOulw==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr11800043f8f.2.1744715383632;
        Tue, 15 Apr 2025 04:09:43 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce3bsm14172785f8f.66.2025.04.15.04.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:09:43 -0700 (PDT)
Message-ID: <ed49eed8-3e0f-4bda-aa30-f581005c4865@redhat.com>
Date: Tue, 15 Apr 2025 13:09:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: ncsi: Fix GCPS 64-bit member variables
To: Paul Fertser <fercerpav@gmail.com>, kalavakunta.hari.prasad@gmail.com
Cc: sam@mendozajonas.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, npeacock@meta.com, akozlov@meta.com,
 hkalavakunta@meta.com
References: <20250410172247.1932-1-kalavakunta.hari.prasad@gmail.com>
 <Z/j7kdhvMTIt2jgt@home.paul.comp>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z/j7kdhvMTIt2jgt@home.paul.comp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 1:22 PM, Paul Fertser wrote:
> On Thu, Apr 10, 2025 at 10:22:47AM -0700, kalavakunta.hari.prasad@gmail.com wrote:
>> From: Hari Kalavakunta <kalavakunta.hari.prasad@gmail.com>
>>
>> Correct Get Controller Packet Statistics (GCPS) 64-bit wide member
>> variables, as per DSP0222 v1.0.0 and forward specs. The Driver currently
>> collects these stats, but they are yet to be exposed to the user.
>> Therefore, no user impact.
>>
>> Statistics fixes:
>> Total Bytes Received (byte range 28..35)
>> Total Bytes Transmitted (byte range 36..43)
>> Total Unicast Packets Received (byte range 44..51)
>> Total Multicast Packets Received (byte range 52..59)
>> Total Broadcast Packets Received (byte range 60..67)
>> Total Unicast Packets Transmitted (byte range 68..75)
>> Total Multicast Packets Transmitted (byte range 76..83)
>> Total Broadcast Packets Transmitted (byte range 84..91)
>> Valid Bytes Received (byte range 204..11)
>>
>> v2:
>> - __be64 for all 64 bit GCPS counters
>>
>> v3:
>> - be64_to_cpup() instead of be64_to_cpu()
> 
> Usually the changelog should go after --- so it's not included in the
> final commit message when merged. I hope in this case the maintainers
> will take care of this manually so no need to resend unless they ask
> to.
> 
> Other than that,
> 
> Reviewed-by: Paul Fertser <fercerpav@gmail.com>

@Paul: it's not clear to me if as a consequence of the discussion
running on v2 of this patch you prefer reverting back to be64_to_cpu().

The packet alignement should yield to the correct code in both cases.

/P

