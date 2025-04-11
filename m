Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741431DDC04
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358782; cv=none; b=KoGnqQ8b7DT2Pm4OiUilR8jQNwaeEyQSzbxOm7RjZ5wZzJImBFI7MKpIy6ujOzO9ZIyRImzm5NGqUWp3A+W09VyhaRRyAUKD0WBOk+6+2bH/u0Uscjb8kkmq8mUUy82si2+CPstT65MhEQfAZERGJ/Igfdx0xJtRhnDWOyZ4+aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358782; c=relaxed/simple;
	bh=25gpjSM2pwypS0nnqcZaK6eDCYbGmXx+lmeJ0pd9c70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMy+C/OmWavAISm6Ok/war/uNaRoJ7w/yOYOo9TEfGpieiI9mNvrfBdkuaPLYs7QluLmz+UDbaxNsE67VMwFWRuG/18Q5cvNPEaxz+INkjzZa51esqOlpYMbJNTj+zQSCpi3SBvBWQmFJVMm+CQEJ2PqsSwIGu8siWojLdFvzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=B+vFVWi1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="B+vFVWi1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so13157055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744358777; x=1744963577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=isqlcTTyZ7Sm6lBmUjMYNncUIpye7YFqhmstYJsaMMY=;
        b=B+vFVWi1z8O3qyNMUa0rhbuCdIiHug8G/6ggkTGAqrR96eavAETjBJDfw0VxlW8sNa
         PeUbZEj+5P7U9xlY5SlJej7+fAbADHDgFEuI+UERNCP40NyKvUmIdkiH9/hxqxEWTdCD
         KFFDCaupS/wYrNA0QTYFaCQSYZxN6gPA51fWN8jXOZhAjePPmrtDh35bvMANsjzvrZ2r
         v8aAseGP3MDrYu3ihodIrTKT0ZwmMy22y2dEIfz2QEn93pJPd9ilZG82SrzvDZpm00uC
         lM3ISGHTAwwbICIU5MxmvvWvTk42AfY1GAFSb0Jcyi8SlHbvH+4amDFqOrHAEb3rNGSO
         rMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358777; x=1744963577;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isqlcTTyZ7Sm6lBmUjMYNncUIpye7YFqhmstYJsaMMY=;
        b=asNYjQ90CroatXISdyrV49fk8qKfk8o2DYBgodGpDOOPgR255fCZfS94OhieRTv356
         Ak56tinhaSyGDZwxZM8qb3uL/2eSC0ia6X8t2ofHm5MF6Ut+4bWE+I2lnezaHXf3A3A0
         Ffcd1vit6iG871gLvsFw+IuFT0t4NMf6czgHsexWbLxdzvMBObyqzvsc8zs0jcGZ+NCv
         4d3YGkMum2bZklcdRnq0SepxWT34YfqZKoOiVNE2EtVe/QoiwSVfyNx0H6cIO+kXWY1x
         +td7sxkSfk+jhAaUVzy3fIIna21ZpslAt8/aBT2MarJwIu8p7IuQm3zFlgoOxHbES3q+
         4zWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcyX3KlyR/mzlAGuM4kulryCfSoWFZEyJuhgyr7Hd6ENIHvzbGF0mFwFQ2qqLGRlyOdqhlL3/yvvsQNqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoehj29NppS8HfoZw5Sh8OAnGzdS/WD8Us6HrBbEnl5Og+QWk
	bmTRQj8j0RuCy9YAKy1UgTgvFY7eAduUxMrxKVNb+48Lv4w56O3SzAmSYi5XJw2sV8dZ526H8B8
	gWZTDH+MjlGwAI0k/rGnc540qzru64L9go/B72ScN9IFdsqcT9P5slxo=
X-Gm-Gg: ASbGncunkt+MXdRRgsQ1l5mnNdXSwZ/uZuzfGPzc3oIEMEjMtDaTJxn6BosKeOWhZHQ
	3v92F9m9aeWKX1jOG0aezfWd+ZDZosb2flaXCC7EA99wNPo3il9o8zLTwZ3+GOX3+U1ML//sPqb
	m6knag+TiR3iOzeDNuelVTZb1SoBfU1Om0+Pfwe41qVAlYRiaEPw5zueXLH50ADl5VP756fpJ6h
	gKK2X8fj96q36IHC1xlIPVqqFfE7GPUfXykyNLjlm33K7f0fN+XV5rD+yH+pjm+akOWCekuzexS
	Ed4/p2KB6TJ1GBFFATkPRi8qfrzEkVjN7/yElKPw3eYHRqrrThBadQ8YDYUjDqXu4zoS3KW3yc/
	EAcg=
X-Google-Smtp-Source: AGHT+IGSDtegkKJY64mlTCzxcAmGSdXhvH2SNshDQWGQBnzWzeEgK+uqlJuIomQMWE1qtExRuuPWJQ==
X-Received: by 2002:a05:6000:4205:b0:391:4684:dbef with SMTP id ffacd0b85a97d-39ea51f5804mr1148582f8f.17.1744358776666;
        Fri, 11 Apr 2025 01:06:16 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:e8be:40be:972d:7ee4? ([2001:67c:2fbc:1:e8be:40be:972d:7ee4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm74655795e9.9.2025.04.11.01.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:06:16 -0700 (PDT)
Message-ID: <b3980874-ef04-4688-ac98-1f35bb1e677e@openvpn.net>
Date: Fri, 11 Apr 2025 10:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v25 02/23] ovpn: add basic netlink support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Shuah Khan <shuah@kernel.org>, sd@queasysnail.net, ryazanov.s.a@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Xiao Liang <shaw.leon@gmail.com>
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
 <20250407-b4-ovpn-v25-2-a04eae86e016@openvpn.net>
 <20250410195822.41a77f1c@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20250410195822.41a77f1c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 04:58, Jakub Kicinski wrote:
> On Mon, 07 Apr 2025 21:46:10 +0200 Antonio Quartulli wrote:
>> +        checks:
>> +         exact-len: nonce-tail-size
> 
> some of the checks look slightly mis-indented (needs one more space)

ACK. Will fix those.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

