Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570A8633F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488751; cv=none; b=YCs5NznwwKoXbce9fchMnnschBeUonHNSnYuGAiZJqbyms9l13yAmjt34OgVNqwAu7JifgSYJnfG7fJ3sPhdCaSUUer8jA6FSM0oiKzAXL/ZJWD4paz4OaocjOKYR7lDdKSjcdfy4/doYllBBY1WeYui97Cw7OTS7JSRzWrA3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488751; c=relaxed/simple;
	bh=w5LSTWmbCuESmMw2gl/CmZ8iMUuOJEHZPsjs3Dvtvy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0TyvW1lzlQJcUVe+Ojy3kDBjy92t9gzbURJrjpjIoUPZn2gE/gEwyrgy+F1zySkZw2FvKBdUHgbufXDjXYBBaGYnHN62NZgHhBLkhMKYsDN95bwmkEzsyvpzXlfnl5Qi5CyENMRksu4hX2uh1onuVrrNs7EETVAol6LKTnSgcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LPQIcCwm; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LPQIcCwm"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-74849e33349so1175454b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749488748; x=1750093548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bpUhLELyP7p8RhE4vCfB2tyhBHP3IonfUXHeFb/uNaI=;
        b=LPQIcCwmgDt9iVzVHaR+39lO0QWmYrg9VuYjKU/dNb7P3W1XamJip+yfDv2N46Xn3v
         siW6GFa7QqJeaQjMkVq4YIfzYQkWEFj86zMzx0PgCVIyyvKCUBlRstHhG5SOjzN/rctF
         aDoYPVICXeMmcs2AV/ZZzhW6ChTnONF4OPL4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488748; x=1750093548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpUhLELyP7p8RhE4vCfB2tyhBHP3IonfUXHeFb/uNaI=;
        b=GbAOXnvRxQ+m86H2q5DtOPpFwuv+PTKpHMfFF3jGj95o1CCglfjYSdYM+vLfF/yKwP
         PikIkFWFalif5pReGINMWcgIvTK2OfQtcKv+bqZ1IeYNKNY4ThwRLSrNShFnlLywU/m5
         +PNZQu1zmKOua5XCQMgmcpLi6T4M9vokb+6aiQaywjROM4hy15wnZ0AezJlycEUxKcem
         o+D2sYzsy1xNyAfES2T97R9uDhq2JmjtHgvezVyb+xOv4btjwWl7RX12ZLH1WGtBhsMY
         iahhppK1Fv6fhu0ZgqShWZo4014FiTd6Tdqh8iqobU1DjkDm/azaPlaXGNajrpn6E96W
         Io7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjhuq51D4I+QJy1Baj6NHqSDq00o6CYhB2T8NwYF+n5/8qoZvsAc/dFxNr5USds5HsQmS5M29bf+eoSvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/XsnzA0O2G9Ir45qKp5zQD1dG3FAtJHmncMwggHqTrvEMnh0
	5VtvVWOjcy7+H8zKex8CmQcvdcceZpQ4Z83BvQBhrV4YwOK/5ouMx0DgzpoEY9QbMg==
X-Gm-Gg: ASbGncvN+ZJeHUXzTcLy5Peg+oD9cDdQTCOAS/faSBSmku9oi1c8/ZbaXMydqi6iPEZ
	odtqFOhVo25OKkWjDtqUWInl85Np3ZLFKq2JCCWs0NbFHtnko0o35yqzvGEEUpVgNpVkEHu9cB8
	3fP/p8Uoyc8nEnuvp7mOS0aPlDa9y9y2HgCGSMw4IL3Ed/QUo+nnRV4nvWCRTV78ZVz/SGeOeyX
	Wh7eCZL68MDW30WpHUysLi+ofb3ZKpEdD/SnzCK6U4An04uYp5awHs25X5c0sxm8R3ucZNRNkgt
	qMXndF7AOIOAgC8iMG45POirukf2q4x0D57ZWHdJchJJ9QHQZIcGqWh4BvkMDw6umMeKtePxQFL
	Od7wpFV3LSXnm8Nk=
X-Google-Smtp-Source: AGHT+IFg3mi4AXKwWCaQj9OKbnJUga0CFNcbyFNnTtTiLkcVN0H5XUu3mCUv8IWhktn/JA1FpeC/mg==
X-Received: by 2002:a05:6a20:d80a:b0:21a:efe4:5c6f with SMTP id adf61e73a8af0-21ee24e7774mr23117445637.2.1749488748570;
        Mon, 09 Jun 2025 10:05:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7af0csm6187704b3a.62.2025.06.09.10.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:05:47 -0700 (PDT)
Message-ID: <85e921fb-af2a-4ed6-acd8-ad8c88e1d9a2@broadcom.com>
Date: Mon, 9 Jun 2025 10:05:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Srinath Mannam <srinath.mannam@broadcom.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250607212515.741397-1-robh@kernel.org>
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
In-Reply-To: <20250607212515.741397-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/25 14:25, 'Rob Herring (Arm)' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
> a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/phy/brcm,sr-usb-combo-phy.yaml   | 64 +++++++++++++++++++
>   .../bindings/phy/brcm,stingray-usb-phy.txt    | 32 ----------
>   2 files changed, 64 insertions(+), 32 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
>   delete mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
> new file mode 100644
> index 000000000000..b9aeaab02ef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/brcm,sr-usb-combo-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Stingray USB PHY
> +
> +maintainers:
> +  - Srinath Mannam <srinath.mannam@broadcom.com>

Would suggest putting Scott and Ray as maintainers here, Srinath's email 
is bouncing.

-- 
Florian
