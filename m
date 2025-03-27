Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CF2628D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082678; cv=none; b=WFCPuB/A/W6SDhyZF9Nw3MP5xoFljVGReZmFlbs8W/RRUS5VZFSeXrtVDyi4/zmangVcF5AEzWl0sC66GA6zS+fcWtws1GXnsQjkLv/QKrXzd5L02gytWJyD5K5XSofIWAOC/ooZfYaFV5kfndiIjia0MHr70YnWqsrOMp20DHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082678; c=relaxed/simple;
	bh=rNpkBOwnMCPWFZfsYTHfrSwgwbesakBRwmXpFNBrqPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFwFXczSvtvN6bpy87bUHVPKwnf0ORZCoXtrFxlhMTKHFeuAFOAKw4K1YmmkNRVjT9cQhGqYuZ6Cv3yZ3ByrFW9vgqoxT7ooRPLWX6sLdhwYMKGmKgsKnQcdha7Dzw7tD3tZ96ky3Hx+6rUJdHCt97AO0IcM2sOaGbbq3mHl8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U+qpCpQl; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U+qpCpQl"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c1425fbfcso549424a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743082675; x=1743687475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3wxyBBTTSrkvsCaZeCA7/ggKBG5c60nfjq62fS6D1b8=;
        b=U+qpCpQlR5YQYn7yo7Zin+8vuGOVW7OKk9V8Ee5NM2/TxdvsgWGEIvjtUYMGpxrazC
         er/PP+44oiQ0QJZMeqV9X/uAERUPusiR11Y9oUdrWXpGrR5sB8f4j/luO9xQKl1fkhSM
         8zBuZzTpS4pgDPOjnOoyDCeGGh+QCP5bCSjTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082675; x=1743687475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wxyBBTTSrkvsCaZeCA7/ggKBG5c60nfjq62fS6D1b8=;
        b=E2kZQffR+3bhw9zcpreL+U1uet6ZdGz8Vc1dRSNiVmFsx4HrF0qzXjd99e7HX+XYQZ
         I+VLq8a9VZmJ5709MJsq95PouyDG30v+L1kSZ4xXCuio/FayjWKtgS4iLoJc1XE5ddqD
         RklG73MnVU3/doAhDd3+P8G8FPO8GhUcsFt3eiOgjAplTrLr15geLV7MUJnSfFdA26C5
         Edvdlbc9ZjtlMpvge/uatzWdK2MC/CZx47aRLX4l+4IRa53imdB7QnWaFrgmoMuNgXku
         f9hrgfi5SxXUXJ6ORp3x5VAHHf7YpBxfQg5fmCrVzewRw7jMYXcZUAa/K4WaoraehIUl
         AKIA==
X-Forwarded-Encrypted: i=1; AJvYcCW+RFA/zqNiBlXeMDuV2pSqircR9a/OPLEmNYYuitU45Q/v3xwMOX6f4NqQZYDsc4OAuP9+YUmaHERO/C4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TZjHf5tldeWAQebrs1d5EhbgqW0T2tUDxl8iW9ROHV4Uguz8
	lOlv5WF7kmLIbEG9kpqDph1MiNu/WYbBBpBQS0NaLlaxMm0xXk7cXPSIV8bbUQ==
X-Gm-Gg: ASbGncvECShx2V6r+1hiy4us0FBtmAC3fTWFUYrn8zFvNlld8XGjRgiFBeUf/7RCeDz
	N+D1iuctcOvKwlxVlFv8W2KX7wmggwXRIJSUXlSNN8Uz4kQiCDr4ALbneXgi1A+EYvH0yLbRtnS
	XWgJunXBRZiqkCxFhmITfT/15HLVzvUKwms9FEAh56XOg1Wf/kX6w2SNqP2X/E7algUcaGtBxXG
	/dLBd7aUYFUsK3yUfU6aXVlEVCelsRUH+NeLRIyYf1RMwd0SOqc3yRwBAXP+Q5X1ow29sQ29LD6
	xfo30YbDTWtv7EHa3SzDjlDCTr09nwC1luNKR31rv4EMhPJSB0Ot1x2care+YPlIWYfozujfBq9
	MleO7nG5tBHf5TtL75wI=
X-Google-Smtp-Source: AGHT+IF4H/7m44xIg91Kx87ImIg9fG9O3Q1piBM60Cx9fFO6GaxY44DBRx234/cHw34SJRHt6L7wMg==
X-Received: by 2002:a05:6808:3010:b0:3fa:cf11:1493 with SMTP id 5614622812f47-3fefa4e04c4mr2018817b6e.1.1743082675422;
        Thu, 27 Mar 2025 06:37:55 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6bd300sm2798281b6e.6.2025.03.27.06.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 06:37:54 -0700 (PDT)
Message-ID: <f3c4e4db-b755-4075-8263-0274f4583863@broadcom.com>
Date: Thu, 27 Mar 2025 06:37:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,net] net: phy: broadcom: Correct BCM5221 PHY model detection
To: Jim Liu <jim.t90615@gmail.com>, JJLIU0@nuvoton.com, andrew@lunn.ch,
 hkallweit1@gmail.com, kuba@kernel.org, linux@armlinux.org.uk,
 edumazet@google.com, pabeni@redhat.com
Cc: netdev@vger.kernel.org, giulio.benetti+tekvox@benettiengineering.com,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
References: <20250327062942.3597402-1-JJLIU0@nuvoton.com>
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
In-Reply-To: <20250327062942.3597402-1-JJLIU0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/26/2025 11:29 PM, Jim Liu wrote:
> Correct detect condition is applied to the entire 5221 family of PHYs.
> 
> Fixes: 3abbd0699b67 ("net: phy: broadcom: add support for BCM5221 phy")
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks!
-- 
Florian

