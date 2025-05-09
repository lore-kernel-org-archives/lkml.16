Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC74269D09
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746769805; cv=none; b=BuBmDHATqMq0Mwd7y+ql8A3AA2a1721BpHb0ZoBLEYk4VJ63imcaDCWCne+rCAdSDK3JHf51iYFpYfyokIRju4lcdCEtNNKiD4j+1w4qTMq3W5ECm4j8nRnCCoSNa8XOIKNDUhsxztX404XP1fE+5GzoOcVEUscgApM7VMQd8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746769805; c=relaxed/simple;
	bh=ZA0MrnVqPmGqRqvds91nIAY/X0tkAPwaQfeJInh43CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXx4U7mvogCPM9ePRhXYNC1mbL8dhQZKcQrEZBeVKeLqrko6FLFAOeHC6mLcI3OWUY8kXxP251YvzDnkpk+QJRAAxKlYiDemzdfRuarfQHrhvKB/JwFdTQFqcsmB8RLqymxLu9Cyeti9dd+dxTKgRBfzCDzLwL0H8rQgJlqKHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=P8HoKr3T; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="P8HoKr3T"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c54b651310so261466385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 22:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746769802; x=1747374602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cz9N1KWOckoEyD/I2Q+cFcf/PqZ2i2IlArKDvKjy79k=;
        b=P8HoKr3TDkxDKvKFyXTUpyUgQPCyhENcwzxSGt25Oco4ltNmU1cmIJhJDaDhHYkNZI
         VkM8ggnvadlB9dO0lls49cF/t8tAe8mduFziFSx3jrriXSRMJeJYQfC8xdkCebMKq3AE
         cLH9v2GkVRIibhoU5Yc/VsYNOICWQajnbGYCeWm+R1XL2oV2Ud8BSYpL25ILGsZTOvqn
         l2bjMFLLbdMhq23HmpE5sCnjmvn67drs9IsazKa7qry9nNAHjcIJ+5ZD6oE1C/plGgmG
         2lEi75NXeLcVV6NAHphVxgGDjLYrvLFils1N5AsOP4+pY1uo9q0KMygo8YqHt4vTIuhy
         6Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746769802; x=1747374602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cz9N1KWOckoEyD/I2Q+cFcf/PqZ2i2IlArKDvKjy79k=;
        b=amrwFN7q/8QMLcRl6xpKDzADwa5y4tq1lr1R7IsxPdY329EZpp/Ly53vZ8DuVcZwEi
         TH9RgBqPOGOeyoWPMS9JewQd86AdpWTkH0oGbwoasZXgbpKG0t+M7UtCu3q6EATqHSo4
         r51E9OFpljdkfnywrWslXkp6tVxJHrfX286Zrsl2JRSvGh+W6n+c8KFan91GNwejMObh
         Brr1T7UfyI/GdP9SYSovMVCcb1CE4TpThZTiPZhJe0xuZaah2CbIQX3jm0BiilahKzsQ
         PAsKE5+YSbC0CvgbiUsMyRYOT+v5/wpBAEMXCdFsCSTQp9LGA1rvCP7kKYuLdTP5pA6y
         tRXA==
X-Forwarded-Encrypted: i=1; AJvYcCWpvT+Px6N/bLLpJtmL6KxWGmFO+H1vTnynlNP5o4Rg8PK4szphwFnetPpzOYgxhFKWpUZ+Rz3FTFhIbmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrnklP/Ub7VXuzN+WqsZWQMWq1fThn5Km2iGlZoQ2qRqfVmJGc
	3hTNkEZSMmVqlODCOnNUoiyGEyu1VuPCnBnI/isMkf7xE6SqeyswKHeCQH82FyJFhQBjkowSaqv
	w
X-Gm-Gg: ASbGncu84SiLHTRzyRHrSbEXUIWZi1kKpDSupxAJyKCl0F3rsp8ETIb4qfqz2UzxDoC
	FjChFs2BWBwud3WyFuFZA9vRdapMaPS3dQhGzNNG15Mu+FlLE0KQrjsNZN0jUkv28NMDTWg7VfR
	E/qgTp6D59DhrwTyK1+L3vm+dytOJ60cIyFuxNr4A2Aheo1O2VOFcwBBKB8tQV5SvyK4rBwIfU9
	Fb10EMrnUjfrqgUUFRreKPDpKzv5mQFQazXjfS1bMzTW4V9/oE98182FBwcbGx0rRJ51J1xyTHv
	/6/IL8jDqKVZvMfJKmsb8sFBne9Kya7NiletXwPkJoTXi3oJmwRcDIE4rVLbXwd71nR1kvqQDm1
	D+ZNXvDTrJV75iqbR8Swi
X-Google-Smtp-Source: AGHT+IElqWip8aE/2idz6dfBS7ZlxOEMPHoBzrDhBd78If8/KiDXUWfsyQmB3CNHzKfet4ro2QMMdA==
X-Received: by 2002:a05:620a:319e:b0:7ca:e971:8335 with SMTP id af79cd13be357-7cd010d51ecmr362007285a.8.1746769802047;
        Thu, 08 May 2025 22:50:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e1a5sm94081385a.13.2025.05.08.22.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 22:50:01 -0700 (PDT)
Date: Fri, 9 May 2025 01:49:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Rakie Kim <rakie.kim@sk.com>
Cc: joshua.hahnjy@gmail.com, akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	dan.j.williams@intel.com, ying.huang@linux.alibaba.com,
	kernel_team@skhynix.com, honggyu.kim@sk.com, yunjeong.mun@sk.com
Subject: Re: [RFC] Add per-socket weight support for multi-socket systems in
 weighted interleave
Message-ID: <aB2Xh4jEqpSTuvsi@gourry-fedora-PF4VCD3F>
References: <aBzJ42b8zIThYo1X@gourry-fedora-PF4VCD3F>
 <20250509023032.235-1-rakie.kim@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509023032.235-1-rakie.kim@sk.com>

On Fri, May 09, 2025 at 11:30:26AM +0900, Rakie Kim wrote:
> 
> Scenario 1: Adapt weighting based on the task's execution node
> A task prefers only the DRAM and locally attached CXL memory of the
> socket on which it is running, in order to avoid cross-socket access and
> optimize bandwidth.
> - A task running on CPU0 (node0) would prefer DRAM0 (w=3) and CXL0 (w=1)
> - A task running on CPU1 (node1) would prefer DRAM1 (w=3) and CXL1 (w=1)
... snip ...
> 
> However, Scenario 1 does not depend on such information. Rather, it is
> a locality-preserving optimization where we isolate memory access to
> each socket's DRAM and CXL nodes. I believe this use case is implementable
> today and worth considering independently from interconnect performance
> awareness.
> 

There's nothing to implement - all the controls exist:

1) --cpunodebind=0
2) --weighted-interleave=0,2
3) cpuset.mems
4) cpuset.cpus

You might consider maybe something like "--local-tier" (akin to
--localalloc) that sets an explicitly fallback set based on the local
node.  You'd end up doing something like

current_nid = memtier_next_local_node(socket_nid, current_nid)

Where this interface returns the preferred fallback ordering but doesn't
allow cross-socket fallback.

That might be useful, i suppose, in letting a user do:

--cpunodebind=0 --weighted-interleave --local-tier

without having to know anything about the local memory tier structure.

> > At the same time we were discussing this, we were also discussing how to
> > do external task-mempolicy modifications - which seemed significantly
> > more useful, but ultimately more complex and without sufficient
> > interested parties / users.
> 
> I'd like to learn more about that thread. If you happen to have a pointer
> to that discussion, it would be really helpful.
> 

https://lore.kernel.org/all/20231122211200.31620-1-gregory.price@memverge.com/
https://lore.kernel.org/all/ZV5zGROLefrsEcHJ@r13-u19.micron.com/
https://lore.kernel.org/linux-mm/ZWYsth2CtC4Ilvoz@memverge.com/
https://lore.kernel.org/linux-mm/20221010094842.4123037-1-hezhongkun.hzk@bytedance.com/
There are locking issues with these that aren't easy to fix.

I think the bytedance method uses a task_work queueing to defer a
mempolicy update to the task itself the next time it makes a kernel/user
transition.  That's probably the best overall approach i've seen.

https://lore.kernel.org/linux-mm/ZWezcQk+BYEq%2FWiI@memverge.com/
More notes gathered prior to implementing weighted interleave.

~Gregory
