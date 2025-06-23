Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE024DD1F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696879; cv=none; b=QkFr4gfctbQwpx8RRNw9e3nUzVv1Yim9wIpbQ37orMqknWCIXRRMFMzlWJMp9SRgCdeqWo4vdEhejXVFX7DSl3T+iE86JvS0cPeMZ0NhDQOke/Duy/ju+7M1naQBSLDTwcLAysPO9udXHdcjx1ZTsJ7a1L/1mFwxaf6MGDwGpFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696879; c=relaxed/simple;
	bh=MeY+p5EHSLIM3+WGu7Au0QM+q42sMGpXnuvYcdzfkoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwfHHAHKlnh1uJDtY6WRBzFy3ZaTSXlgWheJu74wM9A8/858RoXW26k/X4JBCpEEjSt4h63SXc79Tgb1iXG5tw7gcEY6j8PUXZWysM1Kq1iqluLlCWLiEDryZcOl2UcONc2Pnb/anJbGo367OKo68S8NMd9xPiO8d/HfHhffxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eTrdU5k/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eTrdU5k/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3462587b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750696875; x=1751301675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8p4RGQZ4Lk/dM+aXk3LZljw8M3HQzF2vZ+tXAPsA88s=;
        b=eTrdU5k/wuIa05r5ydkha6h0trd/4qp/YkhKYlnLnyflKs+Sf2LV/Ap5JcMiSNgoH1
         DQqo9hJZ0sp8KP7zBeJZujy5ucRHBDMg0pqrIqJ/bFAVt6yEyFG9do+1KWKWLU0eggCJ
         yMUbYlSnSeZyHKeo9mP9MHRz0cewIDN8DyAFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696875; x=1751301675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p4RGQZ4Lk/dM+aXk3LZljw8M3HQzF2vZ+tXAPsA88s=;
        b=YnjWU2SvSek2lOmep9bqpeoTIwFzN6zV4dmU8Rp/NZnFXkA1pOQwd7CHjXrIxsP3QH
         qsRY1nyfW0lwAiUR2W1SytCB/qQ2cs+ctZ7lRfiilIYL8zbboLzncLu18IL0IJjxRfRF
         8bXkypJZQAGVqL6zQqviOxi3Vu4WJEkDQarCeJy1aW8gxLlQE9ijwqCItPH9N+sHgBF6
         +gQmTYaK1j7qUbvCKa234xN5Hay7dvPTaSa2gT1T3XRcr+jY9cUGOSK7zvc1/cuixL0P
         XWyyMAUIEfIuILy71tnu0jUar3w3IfPwLC4VMJ+nDGqdM5R7D6YUeg8vcF6vMX6uTzDH
         3QpA==
X-Gm-Message-State: AOJu0Yz/tCT0Kw9jus2T+Z8Uy96+EnF2q+mAWlLlpye+1E7zL+t7YfZs
	BIydmZnONnxXcxzscxairo5q3NzCGCZeWO4m+ngRQ16WzZWiWB4PfT+ewC6eySoHGh6zH1gkPy0
	2cBJvb6bdkzOVG1lXqz48seIN1cx/HYlsD1KWNNZPRQVwYNgxYKUldcZbFaq5aUmTMyzRl4yEJi
	+EYKYejSmNig+Kj6fnCyW0qAVZUp9AOi2a3vVYqC+iVyTAg9S1GAgEqUyVAKk2
X-Gm-Gg: ASbGncsmguGx8QHLcOmAaKGMYczBMsmOR6XUKYLzGjL6SfqRMalidyL7DVJB9Dq4dLJ
	oUBfwPGbpK1Lwwcnew7vMZj08o49kdEuEbS6sXQGtFaX2Efa6oXD/ZMCMilKksI1p6r4aJVozMt
	OtPMwpz2e/lT9O0PgdpqDtDSnsiCgIeVp2qj5QosGVZrif9cFZoYTNeTpKi4FQjWohCYYj7oweI
	fpR240hOkKN7jsBrhPAveHQ+DhuEsNjyWcMWOG95NBNqiufLLnX92zbrX49tpnpXm8dk1XIw+SV
	1OJaLCEfbGZ2yYWImYzr/+9Lzsn7zs04t+rqsXB8+6nHMk0WBYkNxgGhBw0WkqaD0PtLXLjhQ0a
	K34/1CZbnxCk13EqmyEdcX94P08NVqkuO4KoC
X-Google-Smtp-Source: AGHT+IHH9lz7F56fFqamH/YZrNoZlnDxKD4U9eJXwDxo1ipzlo3Hsx4EkJZv18+RTdsPCkYiYgk4Ag==
X-Received: by 2002:a05:6a21:e598:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2206a08ca10mr255030637.11.1750696874739;
        Mon, 23 Jun 2025 09:41:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a488b04sm8889480b3a.49.2025.06.23.09.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:41:13 -0700 (PDT)
Message-ID: <a1533aab-58a0-451d-9b8c-47217fbaa61d@broadcom.com>
Date: Mon, 23 Jun 2025 09:41:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/gdb: Fix interrupts display after MCP on x86
To: linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20250623163836.745702-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20250623163836.745702-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 09:38, Florian Fainelli wrote:
> The text line would not be appended to as it should have, it should have
> been a '+=' but ended up being a '==', fix that.
> 
> Fixes: b0969d7687a7 ("scripts/gdb: print interrupts")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Sorry this contained a lot more than what was necessary here, let me 
post a v2.
-- 
Florian
