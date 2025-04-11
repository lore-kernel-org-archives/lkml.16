Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC73C27E1CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360705; cv=none; b=io/xAMftKI6xJ5asrbu6OlpHXzYVYgTOr63+JR6sZM65T62s346bHG4q6Fu3cAKMB29UnGa6ZRO3ybpUEEbZWoxWNIYZq1AQSE+iinDj8zdWYYoz+ZUVzHr/3EoNXH5MJ5f7k8yrFKon6acxKG4+oNyMl6xhKN1mFSfqJqdRTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360705; c=relaxed/simple;
	bh=Epr+eQBTBU+1ATMEcOYwgYpBi+5oAELlBmkst6805Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TahLN5iNBRPmJEPRAXCGMr06gHHI1rRrXpyCn79WIxUviEDdVAsARFm++wrydEVoQnjA8y1HNnwERjyqOaRp0E4eg+BX8m4icioHZFZe0/i4ovFTfHK0vcphlNoyc4Wn4xQ3cccYy+865sAmWzQ2iGaBWxjy4Nnwp9BNgJ/PImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=B0yCSpsF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="B0yCSpsF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso12795625e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744360702; x=1744965502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sLffW0MYcqM/kbItIhY6HvWZCj3KnwBnjUOkirxLQ30=;
        b=B0yCSpsFauabFeSmpImWI91WIartpOH5alEONnCw1kOBegi3hhoCX4iuib2tiFKlSP
         BalEWX9Fca/n2N0EWEimJYTzkkAOHI98o8kwImMG9BmPbgCZrrlbBSbQmiIj86ognehR
         Pj453DEfbiOmbqNeD1sRPCHkc+tWpaM3U6dU4jzon+xADOfFZYSb2LLedbPzZGxpsncr
         KNz73O4lK6rGsgOkdKgxZBocN0EtWzKxbrZ23dOqodX6PZxDmuK56P7eN45P0BQWCsRw
         mp4oswBW7RL6JjZ9YWs3FvaIldFA9aUyfeGbvTB/5cFPawKb99CCu/ESbGDVwTS3vW8M
         bzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360702; x=1744965502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLffW0MYcqM/kbItIhY6HvWZCj3KnwBnjUOkirxLQ30=;
        b=qFw9bXu5Z9QV3dwRbauuSH+bMEFfbQ8sUkDaS05aK86OnZcln5Cvb6s5nMC/SuAQQY
         pjtN/wrqfx5RSErxdjlsjFGUyPr30Zt0Rvq1vuK+0dzYSqIDx7MfqgsaQZUz5JDWzlWN
         8QpwswWs8Ax/oNjPx3gt1lqRHSRsA/eicHuVVDywjKggERBX9h2sfJl7/QY1qZ92vFRm
         ROwR0S4NCJN0qs74/rYZub+XXaIZEC21c+fdCvyx+V21pwUUfviIp2W+/4DLtWwthbg3
         CkeQImyNQUYd2BpQHg1VyYElKsgmV5Zax4J2C4bWe521w+bAPF1nfkKYhVkKgbaQ5FKv
         S5yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwKS27plCq4iFv53fjP4eTjNqzV3q+23cE28dzWnOMU80TkDssao+imUlIzBvdWEYXN4XbzjkWszdyLlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqC8fWbMBY9pUb+S5p142MG+mC2ypvtRUf1m4+pfCZBgnuZdRa
	rUAAHlA06CopUUSLwV5PCy6dfUNa4J7P0nX+3+ftFTT61/vD2qkLVNvOLhBFTVq4wqaZ+xvOUHH
	QyN+jyxBgNzzDQJrZdFMs7nqJXsqqdM9V+sIq4UjpZnwnfydeeDj8fiA=
X-Gm-Gg: ASbGncufDWNXPod0DHFBprUHyVE4iK52uzq7rXJGlg8t1R+kg+OoforAszAjsVQVSPB
	IrOPn+oc3GR43W/bYGRGfOFVWzQiYovXeOZtY0fOvbVoNJ0jsfa92R8kDr670O1nX5W2NVlw5c7
	LVXwadQTElMoTD7aGo8MQ3lE0OFnD3ELNl8phV2QWsRMiqZNio8DkBRGgQ3zw0xCP247xIl5Glr
	PUr+hQE0uePoxT0ZWlDLOF1hbDikEfNBOzW4623HdQZQKuASULJYJEA+p14VET5xOzeflhnc49p
	c5aA+Vy5FQ2C9uagD11bwWtXh5MMHcnXA1Q2yIwDidS2JN1v5tbh4V6zLJEB+b5qauFm/ifH8Ot
	QuL9mbyhMmlXqgg==
X-Google-Smtp-Source: AGHT+IF99oxdyDqfyn57Lonv1kNPOlFA9HMh6oBiEUe+C+vJOJbIHsy3y4iVXg2sytLFO2/obYxOuQ==
X-Received: by 2002:a05:600c:a08e:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43f3a9aa66dmr13977265e9.24.1744360702027;
        Fri, 11 Apr 2025 01:38:22 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:e8be:40be:972d:7ee4? ([2001:67c:2fbc:1:e8be:40be:972d:7ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207aed49sm78101205e9.34.2025.04.11.01.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:38:21 -0700 (PDT)
Message-ID: <af1a5da4-12dc-47bd-8836-9b7bda0281fd@openvpn.net>
Date: Fri, 11 Apr 2025 10:38:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v25 04/23] ovpn: keep carrier always on for MP
 interfaces
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Shuah Khan <shuah@kernel.org>, sd@queasysnail.net, ryazanov.s.a@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Xiao Liang <shaw.leon@gmail.com>
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
 <20250407-b4-ovpn-v25-4-a04eae86e016@openvpn.net>
 <20250410200325.5621a4f5@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20250410200325.5621a4f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 05:03, Jakub Kicinski wrote:
> On Mon, 07 Apr 2025 21:46:12 +0200 Antonio Quartulli wrote:
>> +	/* carrier for P2P interfaces is switched on and off when
>> +	 * the peer is added or deleted.
>> +	 *
>> +	 * in case of P2MP interfaces we just keep the carrier always on
>> +	 */
>> +	if (ovpn->mode == OVPN_MODE_MP)
>> +		netif_carrier_on(dev);
> 
> Any reason why you turn it during open rather than leaving it be before
> registration? Now the link is down until first open, then it stays up
> even if user closes?

Mh your concern makes sense.
Originally Andrew suggested adding the carrier_on() to _probe(), which I 
interpreted as _open() (I don't think virtual drivers have any _probe() 
hook).

Being the goal to keep the carrier always on for MP ifaces, I'd say I 
should move the carrier_on() call to newlink().
There I can set the carrier on if MP or off if P2P.

Regards,

-- 
Antonio Quartulli
OpenVPN Inc.

