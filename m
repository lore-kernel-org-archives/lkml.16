Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2E161321
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778930; cv=none; b=DapxpsOlSaWRDGwMGmCHcc4Emii98B8rHVUD19nkvqP23ejCuB2Nosf2Nbp2DM6XR8W8gdWXejDQKc3Rxeoa/MonRyZytUH3gILnYxfF7IIr0Av22cDEQt1nsB5kwsJyPne8VFs4R4q4ok0TJVf1mGaTWnpC40cxd/prjZiWJW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778930; c=relaxed/simple;
	bh=Gk4kP+/tk9hmoI7BF440tWmPAIxTlxWICUP2ahE1gXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aULMqeukbDmwly5ieNYg4YxLTkRZXPWqReszo78SF69Wh5FJna4rQMcD8TjKpVIjwo2S15IWM7ZS/F921heBiQTzrUzquoKFPdtffSNzueiAlIlrVN+FBU83c1nkDxID2TwN4IKsVZ2qUt5hNpp/gWVMI/+gpMLrwbqUXQiReXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=c+k2YR54; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="c+k2YR54"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467b955e288so1135791cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738778928; x=1739383728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/f1eQWxiOupVkuxOIXZpfdNu/PwLIl38Rx/BBVWxMU=;
        b=c+k2YR54Iq6VttY2Mb53YO/quYqOoIecfsT2sZ/EJ6e2cOUh/GP5YK9laIUobsUttc
         nWh2ywVL1ehghvWrCJfPHx5YJVmKtQrO6f/iE8MPn+1ST+I4vmXaSloU4Vr129BPJHeM
         gTRjc/7bLLUmipKOHSwkSNxlgtF3ZjtMM2D3UYnODuGKArPhFnJhfWtIgXUOdI7ZiyV+
         qHQUoNkD8ALpJRJv/3Uw39Xnb5voM8DLw3+JvRP5kHGuXRE4T7X2rY0tPegtZH0n9772
         mY9/QZN0VQguogEpQx/0z3OQbtvwZsEDqI4iLFTLlADYFNVlt54Dr5i+lEFjxZl1MSpL
         0vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778928; x=1739383728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/f1eQWxiOupVkuxOIXZpfdNu/PwLIl38Rx/BBVWxMU=;
        b=anaKIfMQXDMGkLmCbv1W5PXENe05JWEz/79G0cC3t6GdqWzZqdImj4EnCs2Y1azEyf
         kKHe3neQ3EvKGvjFC7dsn/tcKR4PWpq5g+9QrGXzYzYz1fLxaPe2sanjLVf0WUzZFTsQ
         NrkQNwhRsoWgHyAh3n9oDIbiLNOi/tvu4G7f6HklFnmFZtkJk5chvR2Z948dC8TTReG0
         zywEeVYh3KOK7LrrPH1BTbbo8uhS+9jdyeYXfcnbpB6pLdZ8R4SA5qHw/S/sjdQT4lVN
         C661wvRa1+ZX8Wid/z3pS5nI02odXwe2GEZGa64ISRg6fhqmbmLiXxb4jAwqHf9BFnxg
         EQxg==
X-Forwarded-Encrypted: i=1; AJvYcCWGpboyXAsFLAsYv9fnw83CmxlTr3G9KCuzDeS31Gj6cH8zbs3qZspXpLZf1l+l/JmbUTfb3RxEUcNn6v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUhuKXdHY6qrKqSW4zkB4Q/R8bodGtWFq9yr/pUtcf0wy2lS4
	NQvyBJ3YN8UeA4MoKeDxB2fZjBHIPHThb6MK0xhFFY9rtq73+ouPTlhW1FJUgNUUHSF5ddpWodv
	w
X-Gm-Gg: ASbGncsYEyM2EeyO54FzAbW5Gqu0aaIRRMj+HAntrItV93FN5xBcW+K/OFhF2yYmJq8
	JCck0bD8qe7egMIFiGPteQ9rVJoUIfVqxva326T7MFF9fm8MjPL8NbPAndtwhpnuAxQ9AQFbPl9
	mOOWVvCkvJDpgK0LCj76X7aDebYoQNNihhVo+ApvlCOGwqXUzp9fYTNie1MEm8Mx0sg+tzCLUw3
	vq2Eypp+waImRtCYdolZpzOU6Gt8w+AzCefwyOmTXyt1JXrefzbNG0eXYdm09vBb5AnkBU04s7A
	NewlRAD7sQPJKw==
X-Google-Smtp-Source: AGHT+IFekWA2zVQ+supRDao76cDIt6tiMYrqfqMbENai9weygkPVnHjjvPuvbUEUkDVaY7rbuhag5A==
X-Received: by 2002:ac8:7fc4:0:b0:46d:faa2:b6e0 with SMTP id d75a77b69052e-47028168976mr50934431cf.18.1738778927807;
        Wed, 05 Feb 2025 10:08:47 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46fdf0a74a5sm72911691cf.8.2025.02.05.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:08:46 -0800 (PST)
Date: Wed, 5 Feb 2025 13:08:42 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: linux-mm@kvack.org, Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Allen Pais <apais@linux.microsoft.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: A path forward to cleaning up dying cgroups?
Message-ID: <20250205180842.GC1183495@cmpxchg.org>
References: <Z6OkXXYDorPrBvEQ@hm-sls2>
 <ccd67fd2-268a-4e83-9491-e401fa57229c@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccd67fd2-268a-4e83-9491-e401fa57229c@linux.microsoft.com>

On Wed, Feb 05, 2025 at 12:50:19PM -0500, Hamza Mahfooz wrote:
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> 
> On 2/5/25 12:48, Hamza Mahfooz wrote:
> > I was just curious as to what the status of the issue described in [1]
> > is. It appears that the last time someone took a stab at it was in [2].

If memory serves, the sticking point was whether pages should indeed
be reparented on cgroup death, or whether they could be moved
arbitrarily to other cgroups that are still using them.

It's a bit unfortunate, because the reparenting patches were tested
and reviewed, and the arbitrary recharging was just an idea that
ttbomk nobody seriously followed up on afterwards.

We also recently removed the charge moving code from cgroup1, along
with the subtle page access/locking/accounting rules it imposed on the
rest of the MM. I'm doubtful there is much appetite in either camp for
bringing this back.

So I would still love to see Muchun's patches merged. They fix a
seemingly universally experienced operational issue in memcg, and we
shouldn't hold it up unless somebody actually posts alternative code.

Thoughts?
