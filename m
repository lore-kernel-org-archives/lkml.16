Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDB4B1E73
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747639985; cv=none; b=S1KO9pCB32ZY1e/HFHqq4DUwrVCAVpIyODPjEHJqC22VdYtdlokhiJbK1m80gl4FmZ09AJuJCx8nVptVO0KwzLz/tHCv3mrMGx5NrUWZBVRCS6niqg20Ivf2o3pdpp4Q6etczV1WofVD6B+U0uAPHoHKfNDsSF4y0MFRA+d2bpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747639985; c=relaxed/simple;
	bh=NIIBGgdcUvKU9PXZWWl8yZ2hQCYtCo95kYBZvG/Mh5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFls/E6Jp+Bma4sMOMVQ/dHZmYJEwrNZ7FJRP9WwlsRJ4XoBikHzrvOY+xNjUsqcwxeV+mjoQJuEViuS3D2G02mbLmy24iYvwhIHnsIzhjplWRiZhNlE3zahEcP9iUGI9njwNo6sZbsynOeoF7+NaIGSCMe7NqNPkvz5v0prDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5W+9Vy9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5W+9Vy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747639982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpbF5ydmLJC97ArKOHWf3B+/uOH4TOjBfUDJxighhMg=;
	b=R5W+9Vy9OH+IxrDgsbbkro8845th7OZMb7588o9soyhrsI2W+W3SiQ5wFspWdmZR72Owqm
	VALkoplbWmyUM/brWiczn90rNy4dvmovGG8cLwyFzqudg2x211CAKTBMw7C3jxND5icBEb
	SplL7aRroFutA3khWafoONEDZzo5OWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Oo2Tp78qPMeOXito1x8y0w-1; Mon, 19 May 2025 03:33:00 -0400
X-MC-Unique: Oo2Tp78qPMeOXito1x8y0w-1
X-Mimecast-MFC-AGG-ID: Oo2Tp78qPMeOXito1x8y0w_1747639979
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so22309945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747639979; x=1748244779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpbF5ydmLJC97ArKOHWf3B+/uOH4TOjBfUDJxighhMg=;
        b=SNKk6XLabpxDojC/eEq5vV8tmziiaF0dsyIY1inDp0jhn8f76Wy/K0irEJxe125V6m
         xoVpmJYh/RO8A8d47Gc9iT7cMXkrhM32vvSbYLDExYD40Ix7xsSRUZ8SZ89j8wh4/Wgx
         3A0T16qiwHzWtFLMEM7oTvULw24LBLkkwRySWXLRGFD65bcc86UK4/p7X6txjAn/K/Ja
         16rATA5jDcFN+Gh52pFNTxcWDeeYJJ+tnHr3eZ9mbs0CTDZaJRjdrmgOmHrTLQ04WzVL
         f24ATTzyYDuOxaHVbqLH9SSNbTdNCgPjw0Cwa1MYajz1tYGisw5nqLSB3bG26mFqXVFN
         sdFA==
X-Forwarded-Encrypted: i=1; AJvYcCU4hKtQLGdJnaNveQ8ErnrTmFmuNVBvT+tivn1fZ6avINy0pCc17ujWDWlg638WEq+03VDleDa5zqYwYgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyXCxlNvDpoM5yyHXWDbccXjrtlb/ntoO0E+Llc6DHJoqF3rn
	Z3U67WYo8B1yzrhXkaQJB7GnpanWUmLc5VranS31dWuQCgRfiN8QAJU7oLvOieDkklaMOav+eDv
	1TW+if250t5Gg09qkYCr8MRGQhlPoOd0kN1v5FMxPQvJGj8bQfTBw/S7KxALTTtcZYQ==
X-Gm-Gg: ASbGnctEPzUWLbomW1WMDaJd12ewCdZoSKyF5/NUI3Y3AD1nxBWFs+0gOEXkz+uvJHF
	TpgdM9MWFfalgKN6Ou664ayj+64rnMbUMIkek1Flog+U9GmdI0TjdRy1x+xgYS4WT46jnBRpRVm
	9R392ZXbROkLC7gsZgZKi19FvUj/0bFHQUfpZbULlFMG7GU38h1STvqhPbofnfNjdYkkZhBLck/
	Y1mc1HQmAcZY0sqQlt9YYdzEsa1Vo/5Qcz1zkVWk3mQE6a9KdU55W38nXJ50ilSadVIuL+K8o96
	SISX6q1yq7OrbSmYeWE=
X-Received: by 2002:a05:600c:3e84:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442ff029b73mr96855765e9.24.1747639979518;
        Mon, 19 May 2025 00:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaCZYbZM8t/6WKW5V6Yyjso0NzAYq5rzjSYKf6LP3dgLjQUUu5ZcEz3TrYG1/+BWgXIUJTqw==
X-Received: by 2002:a05:600c:3e84:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442ff029b73mr96855505e9.24.1747639979159;
        Mon, 19 May 2025 00:32:59 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd516a51sm127705335e9.24.2025.05.19.00.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:32:58 -0700 (PDT)
Message-ID: <6ec93824-1db7-4839-a0ba-845f4e30d883@redhat.com>
Date: Mon, 19 May 2025 09:32:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Ronak Doshi <ronak.doshi@broadcom.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Guolin Yang <guolin.yang@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org>
 <CAP1Q3XQcPnjOYRb+G7hSDE6=GH=Yzat_oLM3PMREp-DWgfmT6w@mail.gmail.com>
 <20250515142551.1fee0440@kernel.org>
 <CAP1Q3XT-2uD87bm-Ch7Oj49=0NBba6vdcwp7dAf51FfmwJhUew@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAP1Q3XT-2uD87bm-Ch7Oj49=0NBba6vdcwp7dAf51FfmwJhUew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/16/25 1:38 AM, Ronak Doshi wrote:
> On Thu, May 15, 2025 at 2:25 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> Not sure if the stack itself cares, but drivers look at those
>> fields for TSO. I see a call to skb_inner_transport_offset()
>> in vmxnet3_parse_hdr(). One thing to try would be to configure
>> the machine for forwarding so that the packet comes via LRO
>> and leaves via TSO.
> 
> I see. Yes, drivers do check for it. Sure, let me update the patch to not set
> encapsulation.

AFAICS, not setting skb->encapsulation, but still building a GSO packet
would still break the s/w segmentation in the scenario described by my
previous email.

/P

