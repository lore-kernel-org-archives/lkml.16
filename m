Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4125E44D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277893; cv=none; b=PT2yk7/4UpEjY2phQGFS9txRUExqvE4mSHl7kQwEv/nfoA3mfRr45Rikl6/6J7XUep9V1kK8RNIUPGxMBbkhOSe+qjARIus3tw/ktIodisz1EG2HELS1LkMEP/KsEZV3i1MmnLziGiQyZFyN+ArBJhX47sURKuLAXYxWxRTOy5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277893; c=relaxed/simple;
	bh=beb7Gdeb+F4t4/RuqqgKwqyQ9Ifa9XZQLLDmac2X6pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqCGKv8MeW9mbdH9mhI6yMHf4FW+rElx5lgVnR8sH/HOkbdhfwXZ2vwcQFLYLhCVM281l0hhux3aJCubLg+2uM/d2csQx3AZW6p43wvwq1PW3CJniVNpFVY/w2rsLHoioIiJ0hyIRaChhaQ9kfPpR7Ll+cSdw13bx7ovy248mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jc4yd/3d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jc4yd/3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744277891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nAtlRD1SD1FnueD/4933Lhj4YikOMo+7K9M6mX4gb0=;
	b=Jc4yd/3dKg+vbLap/c1QTUgenZQuEN8St/QY1TF9YDORUrutXkkWyvMjIjdRQe7o6Iv65C
	Yd1rWaUVI8hcELgL52QUPI9t7rUU2B/MroR8K2EiNjMk9SusZBt2I1Z4qBk5G4HIOMJGsh
	yZHrE9hS/vckKaf6a547nF3JTduxYr8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-EfioaXWTOrudR3kOC3rxzw-1; Thu, 10 Apr 2025 05:38:07 -0400
X-MC-Unique: EfioaXWTOrudR3kOC3rxzw-1
X-Mimecast-MFC-AGG-ID: EfioaXWTOrudR3kOC3rxzw_1744277886
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso368028f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277886; x=1744882686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5nAtlRD1SD1FnueD/4933Lhj4YikOMo+7K9M6mX4gb0=;
        b=qfjejTqc0cQJQu4gwhuq+hPl9UP4Z7xNEGPP72k43/C1djf49It1Gmwe5wnsXVp9yX
         LjeHRurUU/SAFQDEoH4n92SVkFDrc2edd06p57Y906XsnOTIqWDnv0ZBE6GSzaC5Lwpo
         f/nPbzVNPwH+WGUb/j/R/igS0R5OwlWyQZ75iHdGVMh1kmvCGBfYKnKnK/qzy71XMTW/
         dJDWmzbb8+g13eWen0hzi+COnZJNoxBlD1wTUA0sRoo5RqaiLlp80mH9dPjiq5OA8SrV
         lBNXG7F7EgZEz3VVtI7fep1RCt1y30NLjB3lf4Dq4HN59zClwOQ/zU6KvVxj0NdYKJ2X
         CtsA==
X-Forwarded-Encrypted: i=1; AJvYcCU/AgWPaGU2W+NQsNSG1SZnljl4BB7PniV5F4WN4bKloG6OYlf4AZGDxLV29Idew6lWI91ZUeXz2XCGN5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKm9FHDZ/r2uUKFQhe0pdWIB3NvuYmQz0EWeuzYNa7zYnHnAl0
	cY/lPtZmW7oYhDwPDWhKWqKb6ZyCJOQ7e0+S8R515c8w1Y7Eam+2rSz8hFZLvqn1E1YUUBD1WIi
	K1QPzQTPV4NjTInobnWKf0utD0BgASYqzXBqXHJiAfC2KoOeKUMv+JkpRaUaXug==
X-Gm-Gg: ASbGnctly3JK77pKC8HfBOg0ONQotE4EKwLmcQa7QOY+21DII6u5gjxI7nbdl7ETfMF
	TuzgdEu8uJR0zJEFrwZajzrheQJiTY5N+npbRIUma/yTnhORb6SdaiD8fA+UsWGb/sQa1m4jXco
	a+Aonfp4RnaMgtOiCESaeA3L+PKfNAvUrE9WtIcbHJ3QUMe8vo5YyEsocjcDpnQVq9cw88q1ox8
	V+wJgm6jAe6ezkrX/SfPbFOhwttbs5yckxdmLCe+NVugEpbUCNNil7js6zysMKL9V80ed71g9/j
	MGmByvqcoYvSnUIkbGwzHVpKqy5EuJH9w9FNLbU=
X-Received: by 2002:a5d:648c:0:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39d8f49708emr1636511f8f.30.1744277886211;
        Thu, 10 Apr 2025 02:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP9qWEYHSTC7t96gFl7jps5HgUrG6cktSPOqd8D6me9EFDIqtGIAeX+QbvTYrXfC4tWv9DXQ==
X-Received: by 2002:a5d:648c:0:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39d8f49708emr1636481f8f.30.1744277885798;
        Thu, 10 Apr 2025 02:38:05 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893775b9sm4322609f8f.35.2025.04.10.02.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:38:05 -0700 (PDT)
Message-ID: <0c288b2e-9747-4a50-a16f-bf4238829ffa@redhat.com>
Date: Thu, 10 Apr 2025 11:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] batman-adv: fix duplicate MAC address check
To: Matthias Schiffer <mschiffer@universe-factory.net>,
 Marek Lindner <marek.lindner@mailbox.org>,
 Simon Wunderlich <sw@simonwunderlich.de>,
 Antonio Quartulli <antonio@mandelbit.com>,
 Sven Eckelmann <sven@narfation.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, b.a.t.m.a.n@lists.open-mesh.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c775aab5514f25014f778c334235a21ee39708b4.1744129395.git.mschiffer@universe-factory.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c775aab5514f25014f778c334235a21ee39708b4.1744129395.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/8/25 6:30 PM, Matthias Schiffer wrote:
> batadv_check_known_mac_addr() is both too lenient and too strict:
> 
> - It is called from batadv_hardif_add_interface(), which means that it
>   checked interfaces that are not used for batman-adv at all. Move it
>   to batadv_hardif_enable_interface(). Also, restrict it to hardifs of
>   the same mesh interface; different mesh interfaces should not interact
>   at all. The batadv_check_known_mac_addr() argument is changed from
>   `struct net_device` to `struct batadv_hard_iface` to achieve this.
> - The check only cares about hardifs in BATADV_IF_ACTIVE and
>   BATADV_IF_TO_BE_ACTIVATED states, but interfaces in BATADV_IF_INACTIVE
>   state should be checked as well, or the following steps will not
>   result in a warning then they should:
> 
>   - Add two interfaces on down state with different MAC addresses to
>     a mesh as hardifs
>   - Change the MAC addresses so they confliect
>   - Set interfaces to up state
> 
>   Now there will be two active hardifs with the same MAC address, but no
>   warning. Fix by only ignoring hardifs in BATADV_IF_NOT_IN_USE state.
> 
> The RCU lock can be dropped, as we're holding RTNL anyways when the
> function is called.
> 
> While we're at it, also switch from pr_warn() to netdev_warn().
> 
> Fixes: c6c8fea29769 ("net: Add batman-adv meshing protocol")
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>

Even if marked for net I assume this will eventually go first via the
batman tree.

> ---
> 
> Aside: batadv_hardif_add_interface() being called for all existing
> interfaces and having a global batadv_hardif_list at all is also not
> very nice, but this will be addressed separately, as changing it will
> require more refactoring.
> 
>  net/batman-adv/hard-interface.c | 37 ++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/net/batman-adv/hard-interface.c b/net/batman-adv/hard-interface.c
> index f145f9662653..07b436626afb 100644
> --- a/net/batman-adv/hard-interface.c
> +++ b/net/batman-adv/hard-interface.c
> @@ -506,28 +506,34 @@ batadv_hardif_is_iface_up(const struct batadv_hard_iface *hard_iface)
>  	return false;
>  }
>  
> -static void batadv_check_known_mac_addr(const struct net_device *net_dev)
> +static void batadv_check_known_mac_addr(const struct batadv_hard_iface *hard_iface)
>  {
> -	const struct batadv_hard_iface *hard_iface;
> +	const struct net_device *mesh_iface = hard_iface->mesh_iface;
> +	const struct batadv_hard_iface *tmp_hard_iface;
>  
> -	rcu_read_lock();
> -	list_for_each_entry_rcu(hard_iface, &batadv_hardif_list, list) {
> -		if (hard_iface->if_status != BATADV_IF_ACTIVE &&
> -		    hard_iface->if_status != BATADV_IF_TO_BE_ACTIVATED)
> +	if (!mesh_iface)
> +		return;
> +
> +	list_for_each_entry(tmp_hard_iface, &batadv_hardif_list, list) {
> +		if (tmp_hard_iface == hard_iface)
> +			continue;
> +
> +		if (tmp_hard_iface->mesh_iface != mesh_iface)
>  			continue;
>  
> -		if (hard_iface->net_dev == net_dev)
> +		if (tmp_hard_iface->if_status == BATADV_IF_NOT_IN_USE)
>  			continue;
>  
> -		if (!batadv_compare_eth(hard_iface->net_dev->dev_addr,
> -					net_dev->dev_addr))
> +		if (!batadv_compare_eth(tmp_hard_iface->net_dev->dev_addr,
> +					hard_iface->net_dev->dev_addr))
>  			continue;
>  
> -		pr_warn("The newly added mac address (%pM) already exists on: %s\n",
> -			net_dev->dev_addr, hard_iface->net_dev->name);
> -		pr_warn("It is strongly recommended to keep mac addresses unique to avoid problems!\n");
> +		netdev_warn(hard_iface->net_dev,
> +			    "The newly added mac address (%pM) already exists on: %s\n",
> +			    hard_iface->net_dev->dev_addr, tmp_hard_iface->net_dev->name);
> +		netdev_warn(hard_iface->net_dev,
> +			    "It is strongly recommended to keep mac addresses unique to avoid problems!\n");
>  	}
> -	rcu_read_unlock();
>  }

I feel like the above code mixes unnecessarily fix and refactor
(variable rename, different print helper usage).

I think the fix should be minimal, the refactor should land in a
different patch for next.

/P

