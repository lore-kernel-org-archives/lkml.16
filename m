Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347523642F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852785; cv=none; b=i7Fl010OcqN99qb8iTw06aJjlSeD3lUSKlDL8L+cHJ+3ADIsZqcmSczpqOHmCTpYSkvlOYZJ6MWVlF0MoS4BTr2Lq8Av9mwM+hdH5J76T6Im2QJMLk9Of+UpFaE7Hvy2NZCSHtnqdt/hUjPr0EN0Z7nM8PQ/fpz8AvIPZAImnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852785; c=relaxed/simple;
	bh=czZSa8RE8rPjUA6bt67Tw98QD1nGxDQA7k8TsCfdCzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtIs+FXpaVfzesCcLSALMua7Q6zCKcoQ3ejIdb2WhvkZnmClWboF8/EruLC+woNKDY0u3YRWXpKGWEKJ6Fz4RblnB5NtHV6OQ0RYIFTlW+HeIgOxi2TOeArcNca/aIpSUYjnBbKb6cjt0aXuHdtvW9ey/QSsPEr40uLpDNN2pDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=JWdmmSnz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="JWdmmSnz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab744d5e567so182864666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852782; x=1739457582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=JWdmmSnzoZq5RGgbQpuszpn6O6rOYZkznr+oAMvxumyfsRzbSEpzqR6aBqRCsbunXa
         FAgAiHFq3lWqSe+H5cw1nOEPAgTYGQMhhgqjNQsyNJrsNT0yAi+h+BhvupGYxOmzvfQ4
         eRXLZIj7fmgKXb22Gno2eEJw9qh0DTnkkUoJCezfRCp7ZXq7ekIf+pJpW10hh+l0qs2i
         69hdisIWk9h27wElBpCz++2PhbJiPLBw9dxwO2KGXL0PZ+D90zQZjQktwxvCZnxq8WsU
         iCcz/1vlzXs2Xku9lK//QhQcVGiqRcmgwQACQbq7GJsHtetRWXVex8KrWo5lt+YqNkaI
         egyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852782; x=1739457582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwM9ak9hrD3h4qVx1yCYkLliO4mOGlB4YCv6ISmSjO4=;
        b=TO5LWhDbtFqxBJVSanTM9MJCJwkSD+fOeI0TLQcusUmK7nVqi9ufZt9LsphIn9Go1z
         Yp1EfRFzCqKHut9+JI+E64EC2u1sG+8Se+sXwCgum1OlJ2vYjy3qoL3hrNCv3rwlPxVY
         VDXfcjnykpISE6OBbjSvMXuL6RUeOwwJyyOf6KjxcutEZjiD6B4F0lDZyNQo+ndtQ2Ep
         qMaAOqLmKbHhC1o6QcxAFB0fLM4Cve2bYqGtneHqXxtOqb0mhzdxqmYc7eopmo5jXcwL
         QhwqCvcV+FRA2a1kJsl3KOCHlv8ntgCkJncaNpM9LJ2aDO5ix7h+XLsKDRcRUdg+xaKl
         TACQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2YcTyRWQIPRXGN64N+4uqBywmxf0ZCz1oLdecEUcFZx3QwJwmnQ3Bj75pRNVQYLF8XdUmTEYXjxDHr1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvGuzX93AZTSKLWJiRNahTuqK2vSqzx+AVOzRwowgKEIZDzZo
	tjwBecxkFny6eaM0vqfcFqeDH6dy8nIC+z+EoG2UUe++Qo9INJQq/yqfh+3HON4=
X-Gm-Gg: ASbGncsf6SrR1CcF6j1Ok7qoG1tGH4ILPLKjchoyy+taGqKdkJB0C2p8TAavp2qy4Dj
	yJgx+6LbuN9+ykhs3IoU+UpN39aL+yYwuvbl0ayLGMFowzDIKzHqhzrcexRXMFHDGTC0v3ao3MT
	7CQmug5jU6pbBkewSH9oi/vqseSKnYS39bfXaMd0o1Rf6XKw5SfFhiGnehKHy8Svb6eSMg41vUD
	dZTqECGxLF66w6ZWmMCo8Sf2p97tgKGxn/mOsG38+hChZGvRxuroTn3NpIZyNBPanrQH2k3oPBR
	64jih0yMRSzre2BFC6eN8ipVX9MI/y/yoEDIUNA2w9WClaE=
X-Google-Smtp-Source: AGHT+IGWp5+1BVne358ySyNOgZ1qVjbCgfUJUnYbiNP8cDVB4maBnu+CTyhvHYo+RSuyGyXRNdH4eA==
X-Received: by 2002:a17:907:9611:b0:ab3:61e2:8aaf with SMTP id a640c23a62f3a-ab76e9dbe8amr395071966b.25.1738852782052;
        Thu, 06 Feb 2025 06:39:42 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70e7sm108777266b.87.2025.02.06.06.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:39:41 -0800 (PST)
Message-ID: <46b7042c-8284-4523-b54f-38f97e70075a@blackwall.org>
Date: Thu, 6 Feb 2025 16:39:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 08/14] netfilter: nf_flow_table_inet: Add
 nf_flowtable_type flowtable_bridge
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-9-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-9-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> This will allow a flowtable to be added to the nft bridge family.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

