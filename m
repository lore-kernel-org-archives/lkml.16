Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BC204090
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119103; cv=none; b=KtZTkJ83TCOwRC0wqIo4ZXLeWqKPOsRu2ky5vMymUfpLC85dR/MFr/e7hGd5wnW0AN2JpT4ZJB/omwa4p7myOAoodM0YslqP2CECmjslE0gZMzsGwO1fpGBh7bY/ATNIVnbUF8tnhUGn4yxHZKeuXf0jIOQlCMBlV+eMXdFhyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119103; c=relaxed/simple;
	bh=015oBGMB3YXrG897FkQBa+RLeqYZAPDXjdd6A32n7dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJsaHGEZzomAJ6TmuK9blk/Puw+8XigiYTpTsaqHwXzFiClVXiQQcHm3fnmbYoOm9B0CtiYSlKwEf0YJRJEm70ahhPtLOsB/WNMGalVJNOpv+8ryROCzII5Xx3erwC7iEUgkhVFbzCkMBjvb97Nv+0q0rh9NNneg0qsqTUX4Cqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bvg+6+IB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bvg+6+IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/I6BadOUjI/02G0YPnq9xgrPHjXcmZakozl0E4TDSo=;
	b=Bvg+6+IB77bbCXKQ9QKMIe09Cxj2onu9iZOFiZZZ7ob5FmB8kBxSE0QiPwpxQ+dGyw92wR
	J3YHX8gqvOOsE3mINVAzPONp0vMp/J7v+bppMi/r++QLDeZSvjNEY4mes2p74bdBa5i54+
	V77VBvQoWuz1X07F9thNzDaxz1CXlu4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-0csW83k3O7uzCOhzz5hi3A-1; Thu, 05 Jun 2025 06:24:58 -0400
X-MC-Unique: 0csW83k3O7uzCOhzz5hi3A-1
X-Mimecast-MFC-AGG-ID: 0csW83k3O7uzCOhzz5hi3A_1749119097
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso375865f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119097; x=1749723897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/I6BadOUjI/02G0YPnq9xgrPHjXcmZakozl0E4TDSo=;
        b=YFjgBu9iGlbOZit98VX0HZ0u35ZSt8BxPHcZBz8YkuWGFeaZvkRVWgGjQLEqjVVByu
         QaYZU39T+mTxBevd4FlEnkevtD8LRGgEOYhnTuWTc7Q1UZW15wsU+cm2a1T60gt1Y23M
         QJOjwMCrzs32DHPys9rmghHD1YJKsh5BDWZnI8GrxsOE0/58hilopl5xdUiopHQ/+Ye9
         LKmTNkLVFh1RQgltbL5ONoyiW6lvzlrBFkjVCUE1FbLYjAP2teR+JHV1ZpTq8tjuvgWL
         oxmi6JGfUd3cFzjgf2lNEVCXZ2zodbc162Gs8LZJJDI1eHf/jh3AzCfXCjxSdyh9TNTd
         FVnA==
X-Forwarded-Encrypted: i=1; AJvYcCVqlT6t3UVMbkK0FvyrDUHCmT7v8wpZwTw9u6BsNNs2SyS6VkcuS7FPxJjxq7NMIrwQHbeYlsRBtx8XGpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+YecgQbeOzuQkrMfgwytUYn2C2YjAbRIxZet8N3vcWWk+y40
	BShEuNlvwgVoITBDYQqlXGDDXD6KzwoqzZZvQOtac1YyXBA8AVlmJagk19aN8lCLjec8meINocl
	bNdlBaXNmjj/d58oK2dQxGFNx8L6HTL9os2vY0LnECM46iHuprLnq0ocNQb9/wm3oJA==
X-Gm-Gg: ASbGnct0KLjrTsvrOoYi9hxmWCKevcwDJUHYEuV7TPK5lv0AdLbMsdQWD8BOiWv6xgf
	7IHjrpkbVGRIdriVzS4SocOJXj7DuBNC5G31YrHvL9kpyhq07hc9oxIyZtCfePjukET3/IMu7cg
	JhE7iG+g30ClFuQkt0F8h9mUpgEDERjm1feyYGmy0IHL4VvSRo6XQpJ/hbzQbjQKijVH7plwFsF
	E42zeXfClMTVgCcENkgbUwgC/uOQWPaJXb9I/YxPot6Tp1gBB9V77VTbcY191WW3h+sNnaJPT9F
	XMa7kZ4Z4eEPYKdTbnA9j2fggtlqrw==
X-Received: by 2002:a05:6000:1a85:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a51d923b56mr5438388f8f.22.1749119097314;
        Thu, 05 Jun 2025 03:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9rhdrXoBB2l0aQ9oW8se1WPPDQ7OCJdLmo7Mz8TqllVZz9mFe8kK46lg4hrRM9Z/HNjs9tg==
X-Received: by 2002:a05:6000:1a85:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3a51d923b56mr5438361f8f.22.1749119096926;
        Thu, 05 Jun 2025 03:24:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cced:ed10::f39? ([2a0d:3341:cced:ed10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5253a7aeesm2687387f8f.1.2025.06.05.03.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 03:24:56 -0700 (PDT)
Message-ID: <ef3efb3c-3b5a-4176-a512-011e80c52a06@redhat.com>
Date: Thu, 5 Jun 2025 12:24:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: phy: phy_caps: Don't skip better duplex macth on
 non-exact match
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Jijie Shao <shaojijie@huawei.com>
References: <20250603083541.248315-1-maxime.chevallier@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250603083541.248315-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 10:35 AM, Maxime Chevallier wrote:
> When performing a non-exact phy_caps lookup, we are looking for a
> supported mode that matches as closely as possible the passed speed/duplex.
> 
> Blamed patch broke that logic by returning a match too early in case
> the caller asks for half-duplex, as a full-duplex linkmode may match
> first, and returned as a non-exact match without even trying to mach on
> half-duplex modes.
> 
> Reported-by: Jijie Shao <shaojijie@huawei.com>
> Closes: https://lore.kernel.org/netdev/20250603102500.4ec743cf@fedora/T/#m22ed60ca635c67dc7d9cbb47e8995b2beb5c1576
> Fixes: fc81e257d19f ("net: phy: phy_caps: Allow looking-up link caps based on speed and duplex")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/phy_caps.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
> index 703321689726..d80f6a37edf1 100644
> --- a/drivers/net/phy/phy_caps.c
> +++ b/drivers/net/phy/phy_caps.c
> @@ -195,7 +195,7 @@ const struct link_capabilities *
>  phy_caps_lookup(int speed, unsigned int duplex, const unsigned long *supported,
>  		bool exact)
>  {
	> -	const struct link_capabilities *lcap, *last = NULL;
> +	const struct link_capabilities *lcap, *match = NULL, *last = NULL;
>  
>  	for_each_link_caps_desc_speed(lcap) {
>  		if (linkmode_intersects(lcap->linkmodes, supported)) {
> @@ -204,16 +204,19 @@ phy_caps_lookup(int speed, unsigned int duplex, const unsigned long *supported,
>  			if (lcap->speed == speed && lcap->duplex == duplex) {
>  				return lcap;
>  			} else if (!exact) {
> -				if (lcap->speed <= speed)
> -					return lcap;
> +				if (!match && lcap->speed <= speed)
> +					match = lcap;
> +
> +				if (lcap->speed < speed)
> +					break;
>  			}
>  		}
>  	}
>  
> -	if (!exact)
> -		return last;
> +	if (!match && !exact)
> +		match = last;

If I read correctly, when user asks for half-duplex, this can still
return a non exact matching full duplex cap, even when there is non
exact matching half-duplex cap available.

I'm wondering if the latter would be preferable, or at least if the
current behaviour should be explicitly called out in the function
documentation.

/P

