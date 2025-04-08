Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C628269B0D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109835; cv=none; b=RCvqKAc5DB1q00R8qfQSWRChq9uG+J6nmSCdDv88Nv2IyRMPJHcCAU6f8AG3a9i5tKfGaTaziC5cBOC7701bhLyZMMEcR9+70MPzMCBfFxhxfd7z2A4uUyUig0jjrd3rrvA2rtNMYdLeAKjod9GIVkLeFfPvzGpXxqsKmkvLGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109835; c=relaxed/simple;
	bh=o93kT3HUr6PSKVXUdV14Bgz9/0yB1U6VVEQHCXqgg2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGEOL092ZG+7dFEHm+eL9+4frMepeaHYTA10O4tV3kFY3FgI/jtofBZOy4mSwefPxmVLI1h2XM37yAsDmLeAhIIDnqv5zBFZyhk0b83KsjAH4onJAoZ/pRhqgLfsFvjEZIoxl72jpLOVkngT4b6wxioSjx3lUmuEafTBZS0flrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a9irALKk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9irALKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744109832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiB8QLkLLCMptXLpQ+Fs8eV4CmtpBvO8mQtuoLcCE5Q=;
	b=a9irALKk5D4d9B4HoYQm2K0dw+sWd8gYZUn6rNpP7yQG8Dg1TCjpqW3M22ig3p5/xeJwW9
	4E3JgMeo/y5swYywVMg9vLdcEQsAEi2UEfrUMKId4SP71ovl5zuceTsAProK27tUS5JlZQ
	puFiFt78c7Oq1sNiKBBknw9D0ZPq7co=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226--iSMFF9qPWWbRdux0StUBg-1; Tue, 08 Apr 2025 06:57:10 -0400
X-MC-Unique: -iSMFF9qPWWbRdux0StUBg-1
X-Mimecast-MFC-AGG-ID: -iSMFF9qPWWbRdux0StUBg_1744109830
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so28268205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109829; x=1744714629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiB8QLkLLCMptXLpQ+Fs8eV4CmtpBvO8mQtuoLcCE5Q=;
        b=r9VJOAQ9PYInTpzxWiXP/dZM8N1BXMqcE0Uvlg/bWm2EH/Wie+hoZwvHGw2A+kokj1
         +Hc0oCjI3Zu+NDt27To+nDk/NvYFJunaJtt1qovGCgY1VMKru8+lcXaOkK0IrI5Jy2JI
         JhJOOxjENud+QQ1ep4RkFRhsN8rzRLoGcDCRo72VdUzaSiLH14xMoeSV49NhmNezVIUI
         B2sBDNP4+OlmL7jXGZDdroq+cBrzkc4YEUbbMrhjoDsn3p9T24ofcP8NqxXnnjO/jaYK
         6HpeW7alCDw9+NzYCS1Up9fdc0pA+faGR/uEtnQbzL81k1DOH3A56In3gZBsFlzX8M95
         Ze6g==
X-Forwarded-Encrypted: i=1; AJvYcCUhj479p0f/jqikj9bGS/24jDYWphHLA/MKvtU7Q555ZDi08+qC7vgamfh1txk/0IpD2tCVMEChLxwngWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI2diS3b+y1s1MxVxPLAb8eRfnll0J29lgzRzTSUqDn0PCCafZ
	M8daYYuQQv7OKoDZ4WWrBuqdKzuUHJ9ECRgnhUyARqbTqA6e2mZRL4sK4E3UidHnvN6VAnGkf9x
	uX1F4dMXkcsucRoCE9f0+svGemDFtziNl99iRb2tIW1qzY4cP8kObzbvuGtr2uM04NW+pgw==
X-Gm-Gg: ASbGncs3DyRfLnjo8DrEpxj4WGTCijxueZEVwU8FVvJ1SX7uHvXYkHo9H4pPw9rsNvS
	+X7sFU5IEJw/1JuRK0xps6fAFwU3O4EAmAJbEiSs4QHkYT4DKGjMMC7A4Rp2XEmjNhcgmTYuaRg
	21WIkbpJgwfElh3p0YCHhGhCEg/fkIky8lPL944K/+JEpCJK774jeJktEBn2oyxJgV7pKUwDA7E
	k/1kZ+TB8/EpTy7wnVlf81ydSxaqKMTtF/lT8XllOUiCyZ7HNhs5CvjF0SazReTDDtCKbRBsKLE
	1xFm91B06PxYb7U3nK+ZKWh1yNGjamoi3WNQVKul5gE=
X-Received: by 2002:a05:600c:3b94:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f0ab8c6d2mr41519685e9.13.1744109829420;
        Tue, 08 Apr 2025 03:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHucF/g2LzNPlKjjAwHyVa6MKKp0vRxRscl5LXt0EXHIloC4uTn5GNaY61HCGJgRWXZ/jCvhA==
X-Received: by 2002:a05:600c:3b94:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43f0ab8c6d2mr41519505e9.13.1744109829064;
        Tue, 08 Apr 2025 03:57:09 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6321sm14290396f8f.44.2025.04.08.03.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:57:08 -0700 (PDT)
Message-ID: <c4b1219d-a42d-4339-93aa-89987cc6ad2f@redhat.com>
Date: Tue, 8 Apr 2025 12:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: mptcp: add comment for getaddrinfo
To: zhenwei pi <pizhenwei@bytedance.com>, Geliang Tang <geliang@kernel.org>,
 linux-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Cc: matttbe@kernel.org, martineau@kernel.org, viktor.soderqvist@est.tech,
 zhenwei pi <zhenwei.pi@linux.dev>
References: <20250407085122.1203489-1-pizhenwei@bytedance.com>
 <ae367fb7158e2f1c284a4acaea86f96a7a95b0c4.camel@kernel.org>
 <0de20ab7-9f1c-4a13-a8d2-295f94161c4e@bytedance.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0de20ab7-9f1c-4a13-a8d2-295f94161c4e@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/8/25 5:09 AM, zhenwei pi wrote:
> On 4/8/25 09:43, Geliang Tang wrote:
>> On Mon, 2025-04-07 at 16:51 +0800, zhenwei pi wrote:
>>> mptcp_connect.c is a startup tutorial of MPTCP programming, however
>>> there is a lack of ai_protocol(IPPROTO_MPTCP) usage. Add comment for
>>> getaddrinfo MPTCP support.
>>>
>>> Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> ---
>>>   tools/testing/selftests/net/mptcp/mptcp_connect.c | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.c
>>> b/tools/testing/selftests/net/mptcp/mptcp_connect.c
>>> index c83a8b47bbdf..6b9031273964 100644
>>> --- a/tools/testing/selftests/net/mptcp/mptcp_connect.c
>>> +++ b/tools/testing/selftests/net/mptcp/mptcp_connect.c
>>> @@ -179,6 +179,18 @@ static void xgetnameinfo(const struct sockaddr
>>> *addr, socklen_t addrlen,
>>>   	}
>>>   }
>>>   
>>> +/* There is a lack of MPTCP support from glibc, these code leads
>>> error:
>>> + *	struct addrinfo hints = {
>>> + *		.ai_protocol = IPPROTO_MPTCP,
>>> + *		...
>>> + *	};
>>> + *	err = getaddrinfo(node, service, &hints, res);
>>> + *	...
>>> + * So using IPPROTO_TCP to resolve, and use TCP/MPTCP to create
>>> socket.
>>> + *
>>> + * glibc starts to support MPTCP since v2.42.
>>> + * Link:
>>> https://sourceware.org/git/?p=glibc.git;a=commit;h=a8e9022e0f82
>>
>> Thanks for adding getaddrinfo mptcp support to glibc. I think we should
>> not only add a comment for getaddrinfo mptcp here, but also add an
>> example of using it in mptcp_connect.c. I will work with you to
>> implement this example in v2.

While at that, please also clean-up the tag area: only a single SoB is
required. If you submit using a different mail address WRT the SoB tag,
you should add a 'From: ' header. See
Documentation/process/submitting-patches.rst for the details.

Thanks,

Paolo

