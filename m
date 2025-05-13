Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34E3596B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172554; cv=none; b=g3TOYk/s8VI6LDEv7MOAmfHPdTYsEoaKr4Zevut6L/0ySQzWwGH/Anf97W/nlMMbF0kMPMx/tMDyreSTwIVl3PSTqo5O6TTYPdM25I9qA04VSsmBpGjiVtIFKhDAsYzoFjCOE2LzvML5KTkym079B1JJ6fdMMCJqGALOJ6IuqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172554; c=relaxed/simple;
	bh=D+FUHPq95XYZ7ByOiEt6JP7QBayD0vTaMdXCGblW4+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KopPany1V/pqkdN6dtsLHk4FLkofwltIsg/f84vHYWxwDfPmG8wmJfhZWPxTj5G5rDJVHKdB/IIJ9bizK+JgwQg1lyCdfnlKQLv7nmKIgF0iIFGFO1nyBVd7mVLZShm9OE03z7GTjfv9Pe2DkjqhcvM3TxTvhbjRRT46ZxLXfkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0899teC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0899teC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so1926205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747172551; x=1747777351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+N61rGf9CB/QkV09HXKZVFY/M1y24R3AutNXkzZ6PU=;
        b=E0899teCG9Sx79dtuK3Bzr2scNagvpJrzKe6kTZTxsLzN+/acmSkDKQn3qB9of2Fnl
         Aeaes9+K6de8ib8h9785wOwC29YknqSveNpDN6U/qUiKx1rAdgFRw6V5H2my9ldtek7u
         9KuK9CQ0ZmJKMk5vpSrrBoJmetLwJosmvlh0lg5r4f5oX92GwOq5tpRaTgnmasx46WiR
         13iJlBRAOdnzAw8i43FeA/mUFQA8VWs2I6omiHLskTQ3l+TcEyqNKkj2mPHA4l7WLAZA
         qlPGjMNhLxK/NXB7CDBsdQtsTMrc7EuZ4pNnkQxHM5cJlmsKqXYRF8Ld1NSGFhUmb/XA
         Er2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747172551; x=1747777351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+N61rGf9CB/QkV09HXKZVFY/M1y24R3AutNXkzZ6PU=;
        b=INpbJ61LfHy8tcVMEF9wqceA0L8WENFZtXeI+GvyGZ58VBIyD2RqRbSUtQWrftHZ/0
         cG+VC5tgSOqlzpvuPBv19JelZ8NmEdeuPXE1TIYD2pn95q4hsmRjQivui+pIR0Fx8YCH
         B0/KaZ+x9ejETUJ2kO2p/gS0OhTxgV40MD4px0qWp6BAzJKpLO3vFYAwmX/+YlgEAgwU
         QUkL+JKOrbxvmuix9m00H76Vo1JGYvPRpcQWqI0Ea3YxlbEKkbpXPq6R+8gmEgK6y4ds
         KBhW0aFsgGW5anxFEAJCBxiJ3oUql96XdS3eQZHpSgGQXmsoXiHec2rBHuKQFY8Iln4B
         Nn2w==
X-Forwarded-Encrypted: i=1; AJvYcCWqhtt4OkxCyBy2kikHNzJMhpUoSE5C/Hx0Eu4QoxAC9Uyb6cANWlxi4Y8HSau6jheeMcNU73VXMDzPvbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw36jWUAPMPfRN64afb4g5FpOGKcjQieNrvKcZHTYlKntLzF2dP
	6o68sIFqbD/5/1h4OUbyS0yXiOX9GVQZJR2FjCquSLXw7CZDs6dyKWk5Pw==
X-Gm-Gg: ASbGncvL+n6v4AXglBzSjo+X8LZVBuBfHn+VurLAX5ChoRruiGxWimX9629JLS3tSnS
	RR2uWJGBGDPcGdcqnOPSQuZIWTBz348P6YrpC5YjjBeEIgx+AjLoqDHOnOaDmKKHqGc6Ei2AUE3
	EU0fFQQrJVdSSMWievB8jD54eXRXNSkskLLBtpC4QYCeQQnswENUHvDMxMqCkIZIJTzcrTVPnTV
	aD6khzJKAHFMjSNu7yySJY6eUrSyZlia2ELfmAzl7Fj7lGxG5YRPbf5xk5U7BoCPifauPVX+Dev
	855KBEibSz/M1LPC6P0xOWTX0/QuuBlu+IM4+x6fTxH39SD/T6iOfqcleo0yHz5ltlKa0J6ErMc
	WBvEss+6T+Les1g==
X-Google-Smtp-Source: AGHT+IGR5IEOcRPLuun+HdB/gQoiP5xrCVdYLdhkr0b2766VlotAWrecrqizCTKyBwllkwLV6P0GJw==
X-Received: by 2002:a05:600c:1c10:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-442f1a22f93mr8281325e9.4.1747172550921;
        Tue, 13 May 2025 14:42:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddff6sm17758927f8f.12.2025.05.13.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:42:30 -0700 (PDT)
Date: Tue, 13 May 2025 22:42:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Documentation of locking needs when working with lists?
Message-ID: <20250513224229.78c95926@pumpkin>
In-Reply-To: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>
References: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 May 2025 10:46:32 +0200
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Even though lists are used everywhere, I was surprised not being able to find
> documentation about which operations need locking, and which ones are safe
> lock-less.
> 
> My case:
> I have a list where the only operation is adding entries.
> It's clear that adding entries has to be serialized.
> Question is whether a list_for_each_entry is safe lock-less.
> 
> Looking at the code I *think* it's safe, under the precondition that
> reading/writing pointers is atomic.
> 
> Any hint or documentation link would be appreciated. Thanks!
> 

Well, somewhere you must have code that destroys the list.
That must be locked against anything that traverses it ...

But if you have a singly linked list and keep a pointer to the last
entry in order to append entries then the list traversal code wont
explode.

However, on many architectures, you need memory sequencing instructions
to guarantee the list traversal code reads the expected contents of
newly added (or any other recently changed) items.
Read up on the semantics acquire and release operations.
Locks will give the required guarantee.

Most lockless lists in the kernel use 'rcu'.

	David
