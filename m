Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBA1E9B20
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132089; cv=none; b=dK8OdECO3BdROMFq6XqqUwnX9Im/pO8TQic6457Jg9mtLLAdQSrzMsZHzA0cGeUrPOB3GSVhwKWE+fjcpBsudUwXPjmCifq8t62O6tXWXr3aoIePJdZ0YRqGW6OlYGDfxyd2pkZcVpj7CZjM46lphx01r+LhAlmhbyCrSb8XGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132089; c=relaxed/simple;
	bh=JsjZMJfYqcTmeLGG65HJW+MIA3UYXoh1TeVbs7C4rVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wr+B2aTSS5GTUfOXK07U7QoWysXCmumrH/xR2RWKNcIEMJXLBYuuhzvQQRJyuN8frRJ7TqQGkpKKwmbqrpQbdKXMNaWiIqY0esue7sRH2pCVKDx2FJU33g9+3bI9RyLFDaAuOnJazSg4Sh9oEgEOa8hesCjG6NW8jFKQD9sMLbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+O7PFL9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+O7PFL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747132087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7eU874MO87ek4WqCyxGFc1W1sDCzA0tMdC6MVvmyNWs=;
	b=G+O7PFL968ZhXPPlgxsde0VO7Q0ILTCHfwMmP160OV8h4pZwxsK7US+68XQZYOqFQfapvK
	1l1F+sKxgOIlcPDGrwpicHqliFuwuEWm6t6JR3ikmwyCvMIpbO4mnIdmlwLYwjTWJAItlX
	PmmRWQpMXMT0dB42H/cxxB3H++riBN8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-cGMmCflWPlqLkSy0HaIy8Q-1; Tue, 13 May 2025 06:28:04 -0400
X-MC-Unique: cGMmCflWPlqLkSy0HaIy8Q-1
X-Mimecast-MFC-AGG-ID: cGMmCflWPlqLkSy0HaIy8Q_1747132083
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so32895235e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132083; x=1747736883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eU874MO87ek4WqCyxGFc1W1sDCzA0tMdC6MVvmyNWs=;
        b=YQ0eAsFQRZj1WKvut0a4mQ6+/UWArT/m6dd77hPSv0k0BbDQFcEHjxbe2gvBUBBYze
         GdujSWMoJ5vEDMy6bKfoOgCw4lpuXzzDzHK9ket5h2onpQjH15AU7Gv2gVEBWnbaLoy0
         mQDvjkZrlLZtODEkF3mkC4RLksMmcq2L0Zl3qxL0eiT+gVZriKPwON01p+s7xliNwRc+
         SkDYaPbtdJZNSiqpWX10p5NQtOA1tvsgqsdzyGjBQ0McLFJ1YzEY7jYAM7iS47uAcQXN
         4n6M7y78VvVJ5EH/51esVUw1oh/uYXvKUYORzJLJu6mYbpeUq2A5YMGAuTHYHQ8LKJA5
         z50Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfJqdTl5ydWyHDo9CfhAracqcWaNvSYSBl/gJmHTx2uwCL4fudIPetdywaxPUq4GPfCwdFDB7B9QGslZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0+VeHqUnwN5GgyhgUP3wpKWuVbl96kDoXw/C98EXHWcCbS54
	+q8p6Sxnyrm1vUWa5cb2/t6EBT1uY0tVDpgTGQIXB1QGd5Ry7hyfdgh+6ZQEYzxjClxVxK864xq
	EUeoQCHCIVAbdDlT+OddgI8DfuOHe6TiJ5kDkqpPtnlMqgxs4OeAlL/qW1znWgw==
X-Gm-Gg: ASbGncsz+ukwSqucX2jWo5E6OFR49GDbdZUMO46bmdWVvQpw/wauJXs6EH0fGkpJDaM
	51xIq1S6pvOw3JkUMiJIfWP6OgZULoT9h7iQVW4r3ALRMC/apG8aJjvjxEsGGoVVWe+CHIgUA69
	gdQmCdv2QvfZQCw/yJ0PsEDVWc+qJ23PfL1Pu3UKQld0RAkGXq9sM/i/Kr2PZ1DKDDfn6Ll/h57
	mJuw0LONsJ7dXJ470piUKMdJXci5KAguqbr0B42Q8BJ9LC0MyZJrasw9UNBShr2c058HFkJE7M8
	WOS2u/BubVl+HazbL6A=
X-Received: by 2002:a05:600c:8589:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-442de4c6fd5mr72297985e9.28.1747132082803;
        Tue, 13 May 2025 03:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhHQ2cPgBoVj48TAENCfdPzKusy4rZ/hGFeFFzSKN+dmp8zg+z0ztV8NE6hckRltPdEYYtyw==
X-Received: by 2002:a05:600c:8589:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-442de4c6fd5mr72297745e9.28.1747132082470;
        Tue, 13 May 2025 03:28:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc59:6510::f39? ([2a0d:3341:cc59:6510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c09sm164248635e9.7.2025.05.13.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:28:02 -0700 (PDT)
Message-ID: <aea8db43-e8d7-4cbf-b445-aa9b8be64708@redhat.com>
Date: Tue, 13 May 2025 12:28:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: b53: prevent standalone from trying to
 forward to other ports
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Vladimir Oltean <olteanv@gmail.com>
References: <20250508091424.26870-1-jonas.gorski@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250508091424.26870-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 11:14 AM, Jonas Gorski wrote:
> When bridged ports and standalone ports share a VLAN, e.g. via VLAN
> uppers, or untagged traffic with a vlan unaware bridge, the ASIC will
> still try to forward traffic to known FDB entries on standalone ports.
> But since the port VLAN masks prevent forwarding to bridged ports, this
> traffic will be dropped.
> 
> This e.g. can be observed in the bridge_vlan_unaware ping tests, where
> this breaks pinging with learning on.
> 
> Work around this by enabling the simplified EAP mode on switches
> supporting it for standalone ports, which causes the ASIC to redirect
> traffic of unknown source MAC addresses to the CPU port.
> 
> Since standalone ports do not learn, there are no known source MAC
> addresses, so effectively this redirects all incoming traffic to the CPU
> port.
> 
> Fixes: ff39c2d68679 ("net: dsa: b53: Add bridge support")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

@Florian, could you please have a look at this one, too?

Thanks,

Paolo

