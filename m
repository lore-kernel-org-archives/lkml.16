Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030B16FF44
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386069; cv=none; b=YfH9vtiLUg4kr6N3UT2EY2Li1L/Btv1oPxVybx2bekErQSpBNzRYeSagQKw4apHdo16pmTUsc3MdPsv2KHv9zhhTbSzEo+sX1DrPzKeSyh//PRFmhU9jIDZFG3gp142FpdlDj0Oswt0EGRHZCzjIQCRdASjY4T6w+ySYG5obecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386069; c=relaxed/simple;
	bh=6xqHOzSEtizESNQeKofm4qGWhQziFiLceka4SYrVITY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjgqYJ/tQHwvZLgGYrZXIu/hnMgNmw27IpXl1B9ld2zW44ogh+/ceOs8z3Et4+9TIpSVKXyK6ZpxvIUfTfQOXIiLBtqXKgfGKneU0Epu0oEHh2tVRMbXcDUEdtiTXFHKEy6QhQld/AM+bCsDvTNR73SwE2MVGUCy6n/bwBZUi8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=Dql7r5rm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="Dql7r5rm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so1891802f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1744386065; x=1744990865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1ER5xB9Jg+xmJZBLV8A7QxFaT92qRl63hkizFpOJiI=;
        b=Dql7r5rmQzMOlU6VW6yqRnZysUz/nR/j+OfMlApbmo1Cmr4MUs/GB9K+FARMSM4590
         VZxxURd09WiXmPp39CBnYKE2cidBT2ib7hbLBnVGj3DbR0HK1V8reI96Oyw1eWB44fzh
         FvrS5mGEJUlee+nqv6TSiMCjXevbjQsGJr1QA+ixLCYSSoEr2wx7+ZGDMrqbHg6hLeXW
         SxsosR1lTQAHh24uswbK6XQkRalKX3EzP0p3xZlshEA4DdwdD2h8U2rDm9K7s+tJpQgR
         9sXG2LZcoUeB7aTjentuirYFgPNKCl8Pwofw97jlKgq4s0ntjyrauBu9SkGcHgwj8nLj
         iOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386065; x=1744990865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1ER5xB9Jg+xmJZBLV8A7QxFaT92qRl63hkizFpOJiI=;
        b=IUjQzvkIQer2lPDnwE3o5cDj5oUtN8q6v4N4EPQMc7K7wLG1Z1G8wsnDWkZj6Dd7VB
         XUfvwRLBDZ342BYXYKoX7m/VfHY+X3WbWIHAmOK+RU2Lt/GY2U7EFPoTqjLpTVptU+sw
         V8MkV1TUxqBquN+EpKg2JZN82uS03u3CghONlYFc4lBZjmchMvAyW7WMt47DwSoNqnaY
         iW9H4o6NHG71oqlMEpOYVYd5u38pUI/GzpanEK5+b/QkXzu9IgWiHMYbrq3EAAu7wOfn
         ShscPHCoXdSItpe1rLiK0nkPKOmWIkmF3taZMZYUQXcjLri3D4NAdNWCLn8gT9RKpxQm
         OROA==
X-Forwarded-Encrypted: i=1; AJvYcCU/fgvVYhFXjU9myXWx/8lVslypWXqyCthuW5CxxlyshkXPPtHrXTDBMo+U0cVrIJEwSPKCLbO86xoXLdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHOlRQsNHRb3NHJ9EQ5B7BpS8QwOOnxHLlQDx/LjH4D53kK/u
	NMYGudDpn0W/fY7Jlyd2zivUHSKo0dJUhURRNZZWe2EUQDHp6HKHRDq8tfbVi18=
X-Gm-Gg: ASbGnct44+JLpE1cvJ9SjRHrq6KBKzjIh5kur7DGy3NfKZ0RBghi1Cz/m/7VK6s2q31
	UbBsUIypg9QIgsD+nKesk7L/IE0heSsayAKZwEPeJBKxWEKpJvsJiE9Z4Yr84W9gkIZGHTYXKkT
	KcBvO9gpJ3Lp7RQpFj5st3p7alLkvYtqnGf48G6XaC1ezZCtceShEUgnRXePVt0f5xjtRuKEtxf
	WkIRWbszOP7L9QoKu0X6q46IN8WHZi9hbXbMBbsdNOzEYZHJ55ZWDmq/g4LoEglpYZ2Yyw9sFKc
	ExjBpwJSTMcQMG5pAjQlGAiO06W5AWKVeDvckoCC+b6bRgXU9Y9C66PeoYl27BU9Cv8VML3atvu
	3/lwiR9E=
X-Google-Smtp-Source: AGHT+IEisQGsleHy4Zv5Gzb/47cBIzfdWyFjOgUR75w0kWOWSpMn5SkcGKo3Imt6toqDOuEhLNofAQ==
X-Received: by 2002:a5d:5f94:0:b0:39c:1f02:44ae with SMTP id ffacd0b85a97d-39ea54fd3d6mr3226660f8f.27.1744386064350;
        Fri, 11 Apr 2025 08:41:04 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235b050fsm90397935e9.40.2025.04.11.08.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:41:03 -0700 (PDT)
Message-ID: <7e7746f3-3113-4f80-b9e1-71d28048c2d3@blackwall.org>
Date: Fri, 11 Apr 2025 18:41:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v5 net-next 1/3] net: bridge: mcast: Add offload failed
 mdb flag
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <joseph.huang.2024@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250411150323.1117797-1-Joseph.Huang@garmin.com>
 <20250411150323.1117797-2-Joseph.Huang@garmin.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250411150323.1117797-2-Joseph.Huang@garmin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 18:03, Joseph Huang wrote:
> Add MDB_FLAGS_OFFLOAD_FAILED and MDB_PG_FLAGS_OFFLOAD_FAILED to indicate
> that an attempt to offload the MDB entry to switchdev has failed.
> 
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  include/uapi/linux/if_bridge.h |  9 +++++----
>  net/bridge/br_mdb.c            |  2 ++
>  net/bridge/br_private.h        | 20 +++++++++++++++-----
>  net/bridge/br_switchdev.c      |  9 +++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

