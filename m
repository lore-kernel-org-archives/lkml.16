Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A605610C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851739; cv=none; b=gx/JsT69rVVdvPaqnoewy+PFBE6jMh00XFadnJaIthDY7kf8OTPGca/7erR9LEYnEqXzXOtIOBSGXMTmyQ0GhplT4H4NMfHuWbBNytHlf5C633tadIeTySH6fmccLxw06wWQ9ZrY9n4uT/zLfuW5XKryORMr2FoZKS28qOLBHks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851739; c=relaxed/simple;
	bh=bi07utj+cl2ojuyIDCD/sVJyWBo4xWIZEqhSrnnju3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuZ/qiU+9h71tsK9YwVtaE515jy2SZzxhNI9gOwI69qdOatLi6xT0ptd4z43BRV3VZkZKYtK1S6SkgIsUpoaUQlKZQLcaogjFhNagpwZlNRPwRSSh1qBwPGz3oDBwDTMo1jw80xsOOzHizhE2vTqx2M5Nd1oJGmZY7N2K4Rq1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=uZ+qeQm9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="uZ+qeQm9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa67ac42819so159107666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851736; x=1739456536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy52E7wooPVVAtEuLO+Qhyc2iLHEhNjVLiIzlhHyrWs=;
        b=uZ+qeQm9brCkwUX2IlQbdo6PogOK5wqma0tQpCl5QXM9OTv3+zPygQModsM9Og6xS+
         ZQAgt/ONb1PL5Niqi+awOJgIuFcYBl4yEj4lzr1IqS55psmhB3Fp8tR0s7ANVy77EQoQ
         FAgZ0oiOZQNCLctnAuqOra4sJGN5VwxnbtMKkUDHnVgj/hVJLa6Y3wEGZnEEKJvuWWAG
         E4RgLV9A83clu45ydks0UgZXY1XRJoL5z3ycfydyC0FasUdOCFtYwKcO3PFHPug/xTOV
         NiBHrFZPuB+wAyJ4n9YXBE6CqZW7DD6LcXGYZrtwAI3VR226ooJn9+FjOFTjg4hTlX3G
         /yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851736; x=1739456536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy52E7wooPVVAtEuLO+Qhyc2iLHEhNjVLiIzlhHyrWs=;
        b=IIvybKV6AJgHiDU6uR2lAgKLCUe+gMVhg4r/Jtz9G0OiPdtJodIC2GsxQqGuPjj2oW
         dH3E4ohdHIVPWuPGr15AFPGpoKIpcU0LYJWqzN+guFVkUt/Ce3zP6Wn/RDA7C6bHC2u2
         QmDsRNam6BreeW4HSWHqBs1BhIeysnctjeo2urD3VlOyeSgMpCJUMd+o7qKnUwmL+KJv
         le67aNbgSa9+yrY/VhtVTFG0l8bawYS9HAbcYOjktsyOr7PcPCHJ+PdIaK+FwT8Bx5MF
         GvL162ywEg2+6odGUxrPrRoItKn+Yx+DSg2BjNWBie0EvGjRTN1XNd1uNJzmdMo2lMIE
         +O+w==
X-Forwarded-Encrypted: i=1; AJvYcCVWhphrQYAYArmyKdBbI9T9KkPSzblwRfxcVWWed5knwgifPEP1NKsIph9aQAvweSBKp5n13vA0vV5A3M8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qysIYGf0I/OEVdQbJRUC+2SkNQOogKaauABCJKLhLMieEmVt
	sWwXkxh+GPHOMv3pil4yGB/X0uguAUsU/ogAxXv7XD8ZPjO1gEIDd+bca3jvkOw=
X-Gm-Gg: ASbGnculHLGkSTLWqyGaBud6j929MWySW41jw2kjzDDdnYV/ZuuZnjR5KCaPoPsxxNL
	XUXbAM/QUDr54AMZuqt2JatUjUhkcctf7JI/DN8VXn+HjNW1zv0JloQEy2ovbh0uMy2dOxtGBLT
	pXE4tXGpUk9xSTDQiK0ADmMuVS2rQ67AU8/IyI+AbXNwXB4kJchGgOCW2XXEq8Zbup5+upmMqq8
	kHfMXCo5vWCSKF+YTcuws20UZvMVMu40RFS4nWPCEQI3kkM4RtKF6/SKSAxP5tDf9AQdU7ZpWPg
	rc/bLOL3vXw/3lGTUwwYOlWRI6FqvRFZwbQ47Fibc9oeAPo=
X-Google-Smtp-Source: AGHT+IG6aiDjgy1nFvIKHnHHwV2g9kBo0v+xziTDZFU9m8b3NS4nlzYz1Qp3ZZ0dcQwrhEvWNvqV8Q==
X-Received: by 2002:a17:907:7249:b0:ab6:36fd:1c8f with SMTP id a640c23a62f3a-ab75e2f655emr719799466b.39.1738851735691;
        Thu, 06 Feb 2025 06:22:15 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77f5f5a0esm40785966b.155.2025.02.06.06.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:22:15 -0800 (PST)
Message-ID: <cc8b741a-72a4-4059-bbcd-3f32c7ef56d0@blackwall.org>
Date: Thu, 6 Feb 2025 16:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 13/14] bridge: Introduce
 DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
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
 <20250204194921.46692-14-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-14-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
> bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.
> 
> It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
> ingress_vlans set.
> 
> In the forward fastpath it is not needed.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/linux/netdevice.h        |  1 +
>  net/bridge/br_device.c           |  4 ++++
>  net/bridge/br_vlan.c             | 18 +++++++++++-------
>  net/netfilter/nft_flow_offload.c |  3 +++
>  4 files changed, 19 insertions(+), 7 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

