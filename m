Received: from mail-lj1-f229.google.com (mail-lj1-f229.google.com [209.85.208.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039EF204092
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788385; cv=none; b=AYpwvSPwm35AlK+CVEKrsrbB5n79HiIYmkYc/6EEa85foyZT55lE6vnWKHHH5MmyF6FYUwuxWALfdwT0ufuTAtO8KhkuajWKqMgDqmAr9tve+dyqqaS5zLzMQLKZn0+z2JwMPN/XpplA9ePscwn3xMHj0gGKAx3m81JNiyeF5Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788385; c=relaxed/simple;
	bh=eJJq5QNRi14jFadz/bxG36Zo3CHW1uI2JqLwh8zP4ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtjPkh/LiM3vlzWrcmKxCSwFyyICFHUNiFILIqvoVUYB49aUCJN1goNMIFTt2LLl7zKVT1KO0s24tT3QCkXHiImGbKn0f81IM12eUnBOT1ERkx5usbXEeOidiyGHtJttskuSiFcJVQtsh6VYUOw1J/in1snKIOBzJmTHGvQIt0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PdM4Sv9M; arc=none smtp.client-ip=209.85.208.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PdM4Sv9M"
Received: by mail-lj1-f229.google.com with SMTP id 38308e7fff4ca-307c13298eeso2178431fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738788381; x=1739393181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZgLBFelzHCvaOXDScSFVXg2HFnlFG4aCVoHAFEQ/jY=;
        b=PdM4Sv9M6stuMyPtdaLpFpp472IHI9AgjtrIzt0TeOU9NSHNmKpXWoULvACCm2bcj5
         GDef7Po0mJ6DkQCgZJ+eaEoJImfknWK42DVBoo5CEVpyOG7LanGFVBhtlnv0IUUg04Zn
         v/kBlHTOA6kRDqfkNN7nwaxbG2tDUj3AGwT9AQgmv56rmWp9fe57fCL1/5uCwg+sGsbt
         IP8wHXkkvGGiOuszZuR2Cshp8f5EMmmED+awWIdHWByhCME/xTEZIO9TNs6jXoH95/zS
         ZQJgPlojwFNo3ZBtVyibERgLNsPsJ+FxxH6GuhzlCLt62bw+Cr/h9aSUPFAIZW+MbUIF
         ilug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788381; x=1739393181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZgLBFelzHCvaOXDScSFVXg2HFnlFG4aCVoHAFEQ/jY=;
        b=hkvMUfrctCaO2V5P382dWvdiIReRFqzZeJm4Kecyl77j8q3zMmnnPmQOckcXuGJPm7
         7Ncf1moT7MrJ/vgwKO0nwp8qZtUEJsVt5UWuor75OXS0lkpTxFH83BVoDAUA/7UdwCbu
         pcCnjha7p8iOvuKHHrwmB4LlLq9UUVra60ShIaJv/7QRaA3LohUlqslNrXknSJnrLpj0
         wqKIJQKi8dRU96fSH+mCANorQrwigRts2IJRB67yXsZIJKJ3DnZYySVdZMD5mYX/5er4
         dmco9z5wgRe7d+eERevjyF5uhDGSCoHh0azMeyZXCPw/xHBiFk1xu2iL9ULgkgxUQh0m
         zkEw==
X-Forwarded-Encrypted: i=1; AJvYcCUmDzk2S95URQv9jeo4jNf+4+zaHpP1j1FlKz2HNFZaGHtImNsNfG0yd6UEzs/X/p1fuJXvV1tCk0Jy3wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2s5N0SYALHkhLQtkJxJJhoUzKujPhC6cju9TrRSf5nRLKRqTi
	RJDVgq9M4G/5s2dk4SjEZvNT1VG04/bu9qKAyTMmT09NlXMf0WNNyL+tUYLACi1AQUd4Ji51k8x
	fpVgncuFpfRf+xURspBmw6TEqiuArEvSfKIzekUAusemu6vV0
X-Gm-Gg: ASbGnctoYEnWpprKTcuqeFxjrHKFaWuG/DYsHpi15HLU5uXsPV4svOYfpF3TDc0LmJT
	PuglcXUy1GnT+tFBquQykK+xmzwH81rYBONtTnaHESumqXZgqfcuXkAdmpMjLst6PzggvWAvFiH
	LSDzcm8rhPJX2ulNB8Biyv5Euk/cmhICA1ujBnuhcFrlezcWStMANYzWE6KKNRKUsD1FIFh5TC4
	0M08fMmk7BK8s0nT6fBM4TuLStVTFi07mtERt0EfXmgA0WDQKCEdjEaktLh/RZKYDdbZQsZlC+z
	B0NtzXvO89ZZok5oTfukNwbe
X-Google-Smtp-Source: AGHT+IHGwIKRNNFxj2aI2pB1MRsUTu9sF3y4BpuFpcUwXFlSdrpcxN6BtNkK74LQkEMWM1Ky2ABB1PoPqWjB
X-Received: by 2002:a2e:874d:0:b0:2ff:c167:a965 with SMTP id 38308e7fff4ca-307da514932mr2475291fa.8.1738788380245;
        Wed, 05 Feb 2025 12:46:20 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-307a3069cc3sm4133931fa.4.2025.02.05.12.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:46:20 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 6981F3401BB;
	Wed,  5 Feb 2025 13:46:18 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 5B895E41340; Wed,  5 Feb 2025 13:46:18 -0700 (MST)
Date: Wed, 5 Feb 2025 13:46:18 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] netconsole: allow selection of egress interface
 via MAC address
Message-ID: <Z6POGmAEEixKV5/O@dev-ushankar.dev.purestorage.com>
References: <20250204-netconsole-v2-0-5ef5eb5f6056@purestorage.com>
 <20250204-netconsole-v2-2-5ef5eb5f6056@purestorage.com>
 <20250205-flying-coucal-of-influence-0dcbc3@leitao>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-flying-coucal-of-influence-0dcbc3@leitao>

On Wed, Feb 05, 2025 at 11:07:45AM -0800, Breno Leitao wrote:
> > +	else if (is_valid_ether_addr(np->dev_mac))
> > +		ndev = dev_getbyhwaddr_rcu(net, ARPHRD_ETHER, np->dev_mac);
> 
> You do not have the RCU read lock here. You have the rtnl(), which is
> sufficient, but, CONFIG_PROVE_RCU_LIST will show something as:
> 
> 	WARNING: suspicious RCU usage
> 	6.13.0-09701-g6610c7be45bb-dirty #18 Not tainted
> 	-----------------------------
> 	net/core/dev.c:1143 RCU-list traversed in non-reader section!!
> 	other info that might help us debug this:
> 	rcu_scheduler_active = 2, debug_locks = 1
> 	1 lock held by swapper/0/1:
> 	 #0: ffffffff832795b8 (rtnl_mutex){+.+.}-{4:4}, at: netpoll_setup+0x48/0x540
> 	stack backtrace:
> 	CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-virtme-09701-g6610c7be45bb-dirty #18
> 	Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
> 	Call Trace:
> 	 <TASK>
> 	 dump_stack_lvl+0x9f/0xf0
> 	 lockdep_rcu_suspicious+0x11a/0x150
> 	 dev_getbyhwaddr_rcu+0xb6/0xc0
> 	 netpoll_setup+0x8a/0x540
> 	 ? netpoll_parse_options+0x2bd/0x310
> 
> This is not a problem per-se, since you have RTNL. We probably need to
> tell for_each_netdev_rcu() to not comply about "RCU-list traversed in
> non-reader section" if RTNL is held. Not sure why we didn't hit in the
> test infrastructure, tho:
> 
> 	https://patchwork.kernel.org/project/netdevbpf/patch/20250204-netconsole-v2-2-5ef5eb5f6056@purestorage.com/

I don't think there is an automated test that will hit this path yet. I
guess you got this trace from your manual testing?

> 
> Anyway, no action item for you here. I am talking to Jakub on a way to
> solve it, and I should send a fix soon.

/**
 * list_for_each_entry_rcu	-	iterate over rcu list of given type
 * @pos:	the type * to use as a loop cursor.
 * @head:	the head for your list.
 * @member:	the name of the list_head within the struct.
 * @cond:	optional lockdep expression if called from non-RCU protection.
 *
 * This list-traversal primitive may safely run concurrently with
 * the _rcu list-mutation primitives such as list_add_rcu()
 * as long as the traversal is guarded by rcu_read_lock().
 */
#define list_for_each_entry_rcu(pos, head, member, cond...)		\
	for (__list_check_rcu(dummy, ## cond, 0),			\
	     pos = list_entry_rcu((head)->next, typeof(*pos), member);	\
		&pos->member != (head);					\
		pos = list_entry_rcu(pos->member.next, typeof(*pos), member))

If we do something like

list_for_each_entry_rcu(..., lockdep_rtnl_is_held())
	...

I think that code will be okay with being called with either rcu or rtnl
held. Of course, we need to plumb it through the net-specific helpers.

