Received: from mail-il1-f230.google.com (mail-il1-f230.google.com [209.85.166.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A011EE7A5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261406; cv=none; b=bbI3acPLYO800L1UqkHbTYVSJjuhb9RSJuXisKXcAG/Y6J/ziGGdJVwiVOhlFFKsumTvAQm5jxWRHiuxfIy3osTuKhVC72vNcuZIGOoOxNYk3vEd34vYKpbx0BRlaifW7WWsm7QnEajo7qh4n30KBKsGsSoi7b+65pwPLwqKeo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261406; c=relaxed/simple;
	bh=3dRlfMGan+sGfVh6Lt0DKEdfT3ApcFxw4JVYFKt8r2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcHKqhU6Dxi89DQpIUKb80KpxbXg/jjiEJSNcwDCj/5BvGvEpHb0ggsYY5gbdt/91WBvYLHztIFiZft8Y9RtIyfCtvl/yVFmnVVCTSO7cB/nVqlbbNUU57plmlG/w+rlt/qs/l9StCvLObKv2L+1C2brhHX8dZ0RfqOzBXnSKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UIhc03Z4; arc=none smtp.client-ip=209.85.166.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UIhc03Z4"
Received: by mail-il1-f230.google.com with SMTP id e9e14a558f8ab-3cfe17f75dfso49767805ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739261403; x=1739866203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kaDCkKqlT5ei2VTbS0zVOlN4mD2KGs0Tmc410291NFk=;
        b=UIhc03Z4S0HE6y8QVOMg7BhSuf5zzNVGYJavDJLSyjyfhKN/kyG0mqNPbv7V9deKGj
         GI89F5vc7qRTBnLCM5KjchDWTivSmmrcke6gXT4d/jV7uyjQanppeSIrUXj9qUwGu0NF
         IovxdUmIP7L9m+mQTu3gyOaFty7ypYOhNYFFChoSuW1WIbaF38wJ+7pdegRnEltWElDM
         ogE1Ahzt8MeRanjPgjmj/n7HkG49snp3oUJhc3HYrPsOSNkgBdKqgXYf4LjCaYDqJtwg
         IglwyYUQdkx2bVXoFUve7czrv/FSF1XoHBjc0wDLhy6MqVnVU/3iY8fwv4GKsR/NSY4a
         vE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261403; x=1739866203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaDCkKqlT5ei2VTbS0zVOlN4mD2KGs0Tmc410291NFk=;
        b=QuTGjPvWtPQUD+K2JAQ+tS11l2/A1sVuPiWSHVZ/neoD3HF67OZNF4giVjQlBU4lXx
         gBaVSJTO/Md+bngTmhtxXEIxYRudc7bqOoNrTx9hGrkdYsefJ1zQhVWnrEv/554E+/5P
         Vf/mFXjt9sOk9Yd1rcSGpKPk4VDVfnZ3s4SHLQItOIw9PoUJBqzPKCMlfX2uq+7v0pO5
         LoWv1qD2GFwhvvaBa8pIgVJmZRTWC87Ag+vbcKRCnwVcspPQyHbgyqB/bxTJaCuXHGwP
         5MH0Njq9D15XoBmR/9qoOsm9DYG0FmopGBQpi7ajlAoje1uczfBmDWoVIEwMYu+n81/s
         Hq1w==
X-Forwarded-Encrypted: i=1; AJvYcCVVieIHaL0yKfwXIWmAX3r/mAFN/NJRwKJ/gq1kIZDzTzie7hFtuDEsEUj4rXYA3kI4d1vtMyez1BTPxgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtFFraBKOigepSw5T4+/Da/5nXvS9PyZHrvOHHVyS333zXnmt
	j4XYFG01rBJsNoQhcHXK9OVOKSUIH4ANtf2xuCM7FQAu2eL9HIoJjbgY4Ufu0+Ny3SBVQB3SUiD
	dhdtZZCuhdn/6AGs0tcILU654cGckIxFq
X-Gm-Gg: ASbGncutl5pR13P+f/aTtF3v18idn5gapgPFaxOCxQFeWw0joGcFg+7RMZMcttSC6Sx
	mmgx6hSDA5WGehslDEeil+FZZKjXhU2d63sogmHA7lYEN84htdpfsN5bBQG+0hAvBcpSl6fPJ+D
	Wz4WnWJBGB2R5v/0RV5jmPwoZqIOzdYyT7k5rbGY7eioBewB7rBTanY1veFt97HUkiVM0Z/u/Cp
	PW4N+FK67BYZLsToNQgFjPrhTpRN+qZcv7ayEj5fGhg3tvdquMfnx8fPXKPR5XHiIq1+/tSveu4
	qPMya6CwgPGBp02tPvLthNAI1rchaLfLlcWQagg=
X-Google-Smtp-Source: AGHT+IEMwo5VjdKz2jhvwbTMazKMW9LXnW0ar4oDIFk5cA8yF4AeeZYqTwfueN3DZErI+7kGC7U5TQe6tpAs
X-Received: by 2002:a05:6e02:2199:b0:3d0:2548:83c1 with SMTP id e9e14a558f8ab-3d13dd29dd9mr119458835ab.6.1739261403668;
        Tue, 11 Feb 2025 00:10:03 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d161a40055sm2226935ab.4.2025.02.11.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:10:03 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0A6D33407B0;
	Tue, 11 Feb 2025 01:10:02 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id F18B9E40D80; Tue, 11 Feb 2025 01:10:01 -0700 (MST)
Date: Tue, 11 Feb 2025 01:10:01 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, kernel-team@meta.com, kuniyu@amazon.com
Subject: Re: [PATCH net-next v2 2/2] net: Add dev_getbyhwaddr_rtnl() helper
Message-ID: <Z6sF2RZRdqnH6MQR@dev-ushankar.dev.purestorage.com>
References: <20250210-arm_fix_selftest-v2-0-ba84b5bc58c8@debian.org>
 <20250210-arm_fix_selftest-v2-2-ba84b5bc58c8@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-arm_fix_selftest-v2-2-ba84b5bc58c8@debian.org>

On Mon, Feb 10, 2025 at 03:56:14AM -0800, Breno Leitao wrote:
> +/**
> + *	dev_getbyhwaddr - find a device by its hardware address
> + *	@net: the applicable net namespace
> + *	@type: media type of device
> + *	@ha: hardware address
> + *
> + *	Similar to dev_getbyhwaddr_rcu(), but the owner needs to hold
> + *	rtnl_lock.
> + *
> + *	Return: pointer to the net_device, or NULL if not found
> + */
> +struct net_device *dev_getbyhwaddr(struct net *net, unsigned short type,
> +				   const char *ha)
> +{
> +	struct net_device *dev;
> +
> +	ASSERT_RTNL();
> +	for_each_netdev(net, dev)
> +		if (dev_comp_addr(dev, type, ha))
> +			return dev;
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(dev_getbyhwaddr);

Commit title should change to reflect the new function name in v2.

Separately - how should I combine this with
https://lore.kernel.org/netdev/20250205-netconsole-v3-0-132a31f17199@purestorage.com/?
I see three options:
- combine the two series into one
- wait for your series to land before mine
- figure out how to use take and use RCU correctly to avoid the warning,
  then revert those changes and use your new helper in your series
  (would want to avoid this, as it's more work for everyone)

