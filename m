Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6534236444
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852913; cv=none; b=hHYFs0xXi8kkA1RvxbRRWpowHF8kYgYtcQZah6Kbq2TgY6F8xpaR016tuhT/kCQWMVl1mrF9R26xBYF4ilz69TCfEDMjj6+mSu/2HGpOTDzvvXzJ9BJ1J0j6bzWtdk3UAfTb3/R5N0EgRrtXyYFk9hmG5EMn5T2VP5+KqzJKBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852913; c=relaxed/simple;
	bh=S9K6uTA8VvFJVDz2rVYNypE/HkViC5gyXPCZe+4fWCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9IEO8H019fTr8fpQ3eb37WsoIbM6p4mPp/djrj36FPKRt4gsU8ARFNutTkQqlMiht72XzLI1CE7aZS9F0Ph29oYTwdv9B1QLiJn0URb+KkZMn+t92ShgWfThF77eMgKTANJ6OUS468RpoCAxZhd47tnO0Xz5/0ZhpNA5H1/mBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=JOBP/0KZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="JOBP/0KZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so165308466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738852909; x=1739457709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=JOBP/0KZwJTL4OAEzcMMzeYVdD9Fn7PboeocOe7uLQvvolYpUOsop6tmOXVHcYY7Kl
         O8Ti8vXT/WDgfevii2bBizGUNgwvrxHpck4HewmDIaTsofCK+tjL/PW+bAtDJQJNLkY8
         qlydJ8Qf0eMU5OIMwKhFogbQLAPaQ8124us+XO6kE1J1MnchsoEJa9Dy4rB+xCPxh/NP
         SIGrBp0ZvQ3PCQeZWuEzsOLpcBLN797PM4dfId/yxqSPKwdkuR8Yk7+AEQqurXWmM3Yc
         U8K0bJolFHaP9vWzcbJWOBaqjoiipFW8jZOavQHJl4xGAOTl30jEAw28hGbitcQ4Gzc+
         P6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852909; x=1739457709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rlKArYVbbfkMOQLEil2R2SAvQ0afSCP1rUmme1+B8A=;
        b=O/USgdXEyHrUP4l1QpHwUBSgr6u3KRoi5P1WEeoLuh7iWP18QbY2mQCpiKFAgb9r8g
         FPuX30cMYdX7HdfZ6Gd58Wl9cZ+uG5+8R6V0Udo2RG8L2FVgUMKvtv7RsrdoPeM8P8Nm
         cgPR/JJtKwDstH6H3dJy1xQn1stXcOLaz8gBk0gu9YXTZTU9W2S/nfnZYQLxVXlKoucn
         bjIr57irYxCFMErQhhlOJ0GF23ZFVlJMiXTnzxqXs/1ESQj6Jj0+TfE59bxFQuSAKkNS
         LQcONAdrA+3ZHTTP9rqlyN/6K8Bsldls6cs6vI6Ocl71Fdl8PSMWC6cxJVYWrwAomhIX
         faGg==
X-Forwarded-Encrypted: i=1; AJvYcCUtj8hnuHESaoscXc3RjvzTO4tLC0vZLYKJwgqCItR3KncCQqV44BCyk5Jpe+bvVBc7fDZRn9QuMr4Lins=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMwRKN2DcKhZMheBb4F4/DUryXTZra1MdmCH2HXyGFKXy0Ohl
	4bbyydv8uXnFh9kYOyjnYqtCUWDPP6fs6ZyT3UYOliky7bqqRp/PK8rQUiK1UAQ=
X-Gm-Gg: ASbGncu9sh9t2DlbUUblV9/VF8fGUMk+GhpHodqcjeDtPdkcnz61E7WiJ4A7eO9xx4Q
	E/uhEvCdfFQFrhZX/NNQIRmvn8jW3wYi9DyFjg9eJms+zPynpwmyck5FoWNJQMqlokFTDzxX+OZ
	kiM6jTxOsebozkLuncs28I005DTCs8x849GVaEHh6yjHIN8I7TJDGQ2XP+B9IPhSShbWwhi9Ipp
	vlMnhEnBiraq9AA/8doNV1KcYsC/ctg9sCVlrhH3sLcDYK46w4OwE31vVujR2fD+qVTjnXlwHyX
	GP5szln17dncDjUn30kCYiZvGkcHVyQZ8RT/e3JRu7BJVYw=
X-Google-Smtp-Source: AGHT+IGYS6d4HsD5MEqTfuQgUgTGOYMkujVYUnjTnyeKJRhPZPj1m191dnJjgGKyqlpsKlnGfxYIDA==
X-Received: by 2002:a17:907:c23:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab75e233e41mr751067866b.11.1738852909025;
        Thu, 06 Feb 2025 06:41:49 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f484acsm109660266b.11.2025.02.06.06.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:41:48 -0800 (PST)
Message-ID: <ffcafced-51a2-4a09-ba45-1aafc8f39081@blackwall.org>
Date: Thu, 6 Feb 2025 16:41:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 11/14] netfilter: nft_flow_offload: No
 ingress_vlan forward info for dsa user port
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
 <20250204194921.46692-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> The bitfield info->ingress_vlans and correcponding vlan encap are used for
> a switchdev user port. However, they should not be set for a dsa user port.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


