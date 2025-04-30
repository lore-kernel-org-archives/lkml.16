Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6BA921
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000195; cv=none; b=HgRtC61t20+rAXRuTUIVz+UkAJxFh9F2l0AqsAK+ezhpTzPu6/mUiGkhoEeRxJZ8diiTsvEwNJ6dL6OhyK5LimyKbbAI2WJ5mLf/NwxeFC0BV4coWV8rTbUs3rJ5/kIgGmZa1GgP1IMoVxjXSYNvhUZlHTg+LNrKJVsHQJbOt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000195; c=relaxed/simple;
	bh=CKPd5d7GgODwWG0Zm42EzGpOWxzR3VJEcym0WmahJUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwEhw0MAl5jRYwlLKVwR/ZEJ9bZJLbN+rFO2HIPp9xeYiryeusbHt6oWx9hw1BeP0kNP0DI+wdse5nSt2sD8hLB92Q9C8qZ3vqhYvE7gAVvBQZrpbzQLSQMfwaSSIhLHhYaAXlNQx+uidEO86wbzxnIjmskzZgmV5+s+VjQ0fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fJzlNoPA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fJzlNoPA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a72220edso7049525b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746000193; x=1746604993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qCAitoRkJh4jaqQ8EL2eRWDii2BkMjYoCjPZ+VGr3Lc=;
        b=fJzlNoPA/EfHn4gC1hfhxWJcm/0OlIUIMDvgAr/NLlcIeAkE8La8KmFNdasGlV6quJ
         4FMWhN9ZTm6ilHH9S93Bt3iI4+KWrvU/69yLhnzvEiLRnPvxTz0iMoL5/ggwELcudAmi
         WdLDnKenmePYJQF8VYv31lPZ2yB+8rtgPo2TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000193; x=1746604993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCAitoRkJh4jaqQ8EL2eRWDii2BkMjYoCjPZ+VGr3Lc=;
        b=ME/0CV21PJtu6GZ9buhVb/PHj+XAtRbBlAT7sGFC6Wn7kzfL0wFYcofOfzjh6nOVh8
         2J8Bu7du0Np6fQCLu3DuQkGRwqLQChxaja0DgQOM6laPsF+7j0Adh20ACqxj5byHgNeS
         cMfzC/a7VidD/UlMwl8dlDr2pbbqt3DFyDK0FX88dh2vSF7BQjlVqGqX6L9PEXZlLJhU
         WPBKwj+j54wcp3vj/QseFJtsZqk1zMR3YKIGuaRmTqYKoRXcqrmZP/oO3EVHN7hIywiC
         ayNzEkDkqUJZh07jjDjxRaufPKPhRtgTryqfVT8ggR3f9wBxkPYG9MMlXiMIdkUYjVPU
         26eg==
X-Forwarded-Encrypted: i=1; AJvYcCXT5e2ymeJkRKU5F6NX4LIlQfbT+UWMytisLk1YX3YJyFUbce6ldTDVGL9eRgkYDUQXI3re9xBvAhFof5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+nfUl8BAzRHxHW6OjA4DXUXTzMeWUIOiLHL1L7rp5osuR1uVV
	Xoly7briz7UkioGSXPAtomgY1NhxXo57GcVv4UiOVxvsDf8xbXDUJynT9KF/yg==
X-Gm-Gg: ASbGncu1z7pm6ITXv/Jvpcitw0OyXCYwrVFc84qU2smMcPP1VSqdO44gmNiRa/p0FUB
	NrWJZSXRRud0SKMC2OxM5a9+HJiqpd1PopxnoVdbvOwgPggHfjdtCxxMVdzIFZ4nlWgkagIH6ju
	KeIi/UpiTKz9oUMbTJgA62pLiAb4eMrCf35h6o7hJEinz5Yuy16M9V3iyL8C9RGEy3oHvEPXqSr
	Tll1srl5hy3UDJGpdfuX42RmsQ0FZwyo9exOjTT3/rKJwuUuF2vCSCdctcxzl5XkcBseD9xO05A
	EsAASkX1o7gM3sai/cjSUBFJnynMzfOVGi6u8ahYzRaTvC7NA93qjGRFC+7NntWdftMryNN4zoG
	rzms=
X-Google-Smtp-Source: AGHT+IHkJ0h+qoDFialSR2+zVyxAb0um5MiBW8ZJFF+jqQ44pIx0qJEDXzxACeYYKWZRGIKrusamCw==
X-Received: by 2002:a05:6a00:130e:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74038a85c28mr3180738b3a.19.1746000193185;
        Wed, 30 Apr 2025 01:03:13 -0700 (PDT)
Received: from [192.168.0.24] (home.mimichou.net. [82.67.5.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7403991fb75sm1019255b3a.42.2025.04.30.01.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:03:12 -0700 (PDT)
Message-ID: <33e87dc1-17a4-4938-a099-f277f31898fc@broadcom.com>
Date: Wed, 30 Apr 2025 10:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/11] net: dsa: b53: fix flushing old pvid VLAN on
 pvid change
To: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Kurt Kanzenbach <kurt@linutronix.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429201710.330937-1-jonas.gorski@gmail.com>
 <20250429201710.330937-5-jonas.gorski@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250429201710.330937-5-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/2025 10:17 PM, Jonas Gorski wrote:
> Presumably the intention here was to flush the VLAN of the old pvid, not
> the added VLAN again, which we already flushed before.
> 
> Fixes: a2482d2ce349 ("net: dsa: b53: Plug in VLAN support")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Does not this logically belong to patch #3?
-- 
Florian

