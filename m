Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740C3B1AB
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381815; cv=none; b=VC/KtDBQ5PeZUX8qReDBrkTsfonbdW/UgjSQgqVR6RMKQot6+hTV+fHOeMXuOeE2pUguH4vzNUciYCD8DPIqyubYGtx10Ar+37yDjCVaorOtwDUohcfnbhaJApGWnMOked3DaTdXDdFfXtc8lOgoxl6mSB0q558c8TopTH2J57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381815; c=relaxed/simple;
	bh=TbkLxED9de9s20tfReZehx2MnLKC3u9HoeM0l9Vp8Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt4fEH/mkQNACqXI8DjIipK460Og9oteMzIuPzUFSA8Wj4G1qFGdyYBkPY//qdXrgxbksKBCI9P+1nfAt1kwoBc5XbjLwdlKIePgwO4NCAfPB8wsTBEmZ07ckRxHVXfVihvD5Jhlf0VkVQPEQ/t3tCmXdHmAFcd0fP4WXAydKzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXDeS7+i; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXDeS7+i"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso38413976d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746381813; x=1746986613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/AXZlqs3cM/1OFJ7n6WiOymAxfPD1Bhf7EchirdoY=;
        b=bXDeS7+iwancvH0X7Vebqfmd2IZ+AyFiSrzl0+3CJj/iKEjyq2ifjpqzgoith+Wtrn
         f9J/yGqkI9KG+ls78HQUQ9xT8AE9ADBHPcw+NhW9+kp3LkJYDUD0sXX9A9sTMmaava/0
         9kp3jyf+g4q4tPJt7jUOJGsQy1aDSs7of/VtL0JNa9g+qGyILov7/FRgLRMm0cYRy8hJ
         JWaABcPycJP25OdjFLEUikyc367AmZ4MSfFpLRbnexuijiEiVDS4TA6k1CS00euagwl3
         CV1MV9c6AsUBW1HiyNs+mgaDkDwoVu9i2njqxnS4ZAL232Rvum0TmuI8aCN8VeU/Es1F
         8MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746381813; x=1746986613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa/AXZlqs3cM/1OFJ7n6WiOymAxfPD1Bhf7EchirdoY=;
        b=N2h9ijAxfmYZ6uxtjMLZFKR4ly60k17z3kZMQNkXM2+lTnA+NxMxN4xurqwKyNnLg1
         sJN1QqQToB3pETydxZiuKCRA8/B4vtvvi+C4zu6svLKoX4R446yW177/8jheqTAz75zB
         K2JX52egWbiXGxFWnRrf7lOdYDNipvVx7zFBKCzCr2I96vdqY36w5EudafGYAej+Xrv3
         6tuv3iIB3ugKLSUTOaxGqf7flUr+K375+O6xO/oQWUYpV+BuIPBsR1dGxKfWwCaRFfPV
         mP4L1R/lqDzsMKGtcGkd8W4+xOENw2Q+1nPOgRo6qhxfe6LrjSW22PY5dTu0oPATbyIu
         5N8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkQY1Vhdug1i5kBiHNShnEGM3v9iwSJCtpTYR4bf5D2gfsNrSZsUnIWjAXNEPHh6/NQNKvNGg3GEVLHPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7Jn7hJH9OftauyT1r1rMcAu5tLeiMyTtCFJ2UMaR6MJQIV9m
	t59EpswsTC9yaDVbto7Y2e1X80v34WJSmaWPaEqMd5XSGEFsWsIR
X-Gm-Gg: ASbGncvLfI+YBjPAteVPvp378PY3qAStv6MfleaIbHkMxM9gBZTB44BSXihuGwn63pH
	BpFPNjn5LsovF8sAuZzmkrLhkk9Rs2t33Gc3am3N10utUgoQusBI5APHkJrI/yeX7w7hzK95W02
	KD28HqGkGdUMfrdtfqkFmBdZsLOneKSK6w/+V7nfpC+P4ynr/bzSc/n+hTdrZXl+cWhsBtClEbe
	XE77LfhgJEHkQfFyExngAJmqY7XuYlnusQ5fSkJRZeW+/8zqWcchtgeN2Jb6IoHsrT5JRzY716d
	UyjydK70xUkl9z8RfElPR9Emqa0yenJ1GqUe6DykgokDDszj5qlYWx42TD6MJdONnKFI9tEuC8B
	Bg4gtrtgxWk1CJ39l8wgahd+JJ9e9r9Q=
X-Google-Smtp-Source: AGHT+IFbAGtZ8KWkSe8DyZBIym6wQ4435AyPHDl1cN2hKFG8lBM+203U3xLFukU6vHPXovrvgpRqEQ==
X-Received: by 2002:ad4:5de8:0:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6f528d18851mr79281796d6.42.1746381813091;
        Sun, 04 May 2025 11:03:33 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c32b5sm44759346d6.30.2025.05.04.11.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:03:32 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1D6501200043;
	Sun,  4 May 2025 14:03:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 04 May 2025 14:03:32 -0400
X-ME-Sender: <xms:9KsXaKWuoX95F7FG7MMAvB1jvpT2H8JP3leQSdGSNmpb6N4uZo0oRA>
    <xme:9KsXaGm20fhzsaaL9JdgiR7Xq9LiXNA9Jc0vMpuNxDzGJB8UxUzAoCiMW7kef9dg8
    vD312Z4OKDnbZKy8Q>
X-ME-Received: <xmr:9KsXaOZYWYkkRAI80O63EvPXogboW496HuQBrpbu5vO8auL_mylmND2d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeekkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlrdguvggrtg
    honhesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:9KsXaBXq1G0HITW0SfQ61WDMXjJJRdi-W7dXHHyeTEWKz-qOEU9VZg>
    <xmx:9KsXaElNlkvVsVuFt5bNE0UnMMvQ7jxwuRUJCF1MTURvNied5kpcVQ>
    <xmx:9KsXaGcaoUbAiVTUI_D_32tKlinDFeA843KlwSeh6cpIuOXhQcTwvw>
    <xmx:9KsXaGFZ4usLVeR_Ht3K3lzUIFvdtox9D46ANNgnoucEgrzLuD_rKA>
    <xmx:9KsXaCkBylfFosfDhOTcKc-ESogOYVoU-3e-oSvN-PfWj3nr8ZIWoA7c>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 May 2025 14:03:31 -0400 (EDT)
Date: Sun, 4 May 2025 11:03:30 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] locking/lockdep: Prevent abuse of lockdep subclass
Message-ID: <aBer8jsN9T9r_bI0@Mac.home>
References: <20250409143751.2010391-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409143751.2010391-1-longman@redhat.com>

On Wed, Apr 09, 2025 at 10:37:51AM -0400, Waiman Long wrote:
> As I have seen code trying to use a subclass value >=
> MAX_LOCKDEP_SUBCLASSES (8), add a DEBUG_LOCKS_WARN_ON() statement to
> notify the users that such a large value is not allowed.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Queued for 6.16, thanks!

Regards,
Boqun

> ---
>  kernel/locking/lockdep.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 58d78a33ac65..3fb79d8fecdf 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -5101,6 +5101,9 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
>  		lockevent_inc(lockdep_nocheck);
>  	}
>  
> +	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
> +		return 0;
> +
>  	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
>  		class = lock->class_cache[subclass];
>  	/*
> -- 
> 2.48.1
> 
