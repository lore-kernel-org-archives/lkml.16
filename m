Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AB22FAC4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834180; cv=none; b=BEKMXHzesx/N8xOdVDNBQxvKzumbr1mlS8yhmhXEsOTiKboSNaX6lEHGPwwob/cx+8vlz5HCxJwbdr+ArWN4Q1igwM9sY/cGs1P9mFvscS/YL12c3yx0w8nZfhHVDnG5sHF/ckMx7X17Zm4Rd6ZhhaKHvCzPxV4BFPNSMLTm8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834180; c=relaxed/simple;
	bh=EYcX+Tl80Sl7d+CDd9SpGmBn5rsXiLy+uE7dn71Jszk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7pBws8NbWP10Nj8sRFTWDOOBAsfkbk0124sN2Tvt+0h0s4bKjLsvpOC+F6vntiFNHaeQD1PGLtLSbGhCTV+zOl5jxz6RsxANca0iAezMk82N1QvLVnx2ghXn9+wTul9DyPPMlO2JIgjmMfKosHGuoR9r6x+tqylqqdMxYgf1w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHQrJ32W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHQrJ32W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738834177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KOagAZK7fofXxMgw0dAFRrT7sTcHKFQ+LQJsrXs9r54=;
	b=IHQrJ32Wa3Wy9ahAdbzxKsxPZ5sEKscqRjiGZ4z+TeVpIrGqKWkId/K8DVkkTGahUdOMZG
	e47tKBltyBTp32dBIHNCjxonDl3BlvpSme9gBp7ypcU9pg2SVksrb4J5Qc3dJvDThkJ42R
	eSsfhF/zmk/MgypgMG5rM90RQCtHfAc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-J5OxNHLTP6K3T1I0tuSBkw-1; Thu, 06 Feb 2025 04:29:36 -0500
X-MC-Unique: J5OxNHLTP6K3T1I0tuSBkw-1
X-Mimecast-MFC-AGG-ID: J5OxNHLTP6K3T1I0tuSBkw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dabace77aso256920f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834175; x=1739438975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOagAZK7fofXxMgw0dAFRrT7sTcHKFQ+LQJsrXs9r54=;
        b=d1hHGSEvyaM+wtFawknFLcbY7SnIN1avPhJb6L2Kl7cBIq3j73LmpU4fGAwoRN3g/b
         dbPOUJAhLeqobUO7oe3TQGyRsI3v7x8kj72xJeh+eyco6olWE6yzijlLheOHy1SGIIxi
         I6mpA+9qIqEZ+rOHSE24OwTvZFF4mV2w9IXHZYTJO3iA2jLQXLtut1H0kZGL1JgY9BDc
         9XqIJJgDgNM1Ffd7SdvLvNxEJuxHbZnLjhSa4r4kNYqTcQ/WhNgQ0Bs216qm+KeFB845
         V5JGA5V1WME41juhNnY8j4iWP9+c33zHZe7rnbasssdzjnKjhCdOqP92fugCltaHPb1l
         o8qA==
X-Forwarded-Encrypted: i=1; AJvYcCWBT8Qoxv31UNWiy0sSKV2T6irhKg0hzl0Og+RBKi3/S2iysh/5zs8ibRq0IHc2BRPVGhokOhFMzgowr8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YydP6vs4f1ZiLpnyUpYsULLXpD7FDq7Hm2+Rw7TLiO0dS4Avepv
	Vk/666WrY37A5E9nnnspaoYC/QMwP24fcCEgdwpeUZCT4YRjSNiZ3UVrjdFD5nDxEJM8X2wX675
	vApaWv9wlDBaTnXhkkpdjfcxvY+Rfr8NwWav5pzJ/4yw1+WRHwDf9lZL6Re6r2g==
X-Gm-Gg: ASbGncssngsxBhNvu30UXTapaKJjJWiIyu4b2QJffIGd1+mD+g9gcSo42UeAq2vfNg7
	+hVZOm1ewZHDk4zZWiO0igOsWJ+hweKNMGIAnoLY1K6+d129j9AjQz5suFG5Xd/po1OSjEwcVwg
	XpXdQ6h6Z2tXMPH2xeaP9z3Sv2qbH+wowA0uB0NVw+6yVmpCx7sbZ2nR5ILfmidWd0S24aXWUzT
	nABJiJ2tzogzrD3doYVG1pUyOpSahIYgfpn65xSSdP967tkMqYmdeut1onkF9wVxvy2+hmftOwF
	uBHAUS7nSbQYOdoNZJ9y1Qg4P6kBdinf7DUo
X-Received: by 2002:a5d:5988:0:b0:38c:1362:41b5 with SMTP id ffacd0b85a97d-38db486108amr4535903f8f.6.1738834175189;
        Thu, 06 Feb 2025 01:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEACMLPnRenHtTztqiW2IAcbQnqshOGTNeLp4rXCm+kaU1iNlAag5arspiSZQxoQu++qZxvNA==
X-Received: by 2002:a5d:5988:0:b0:38c:1362:41b5 with SMTP id ffacd0b85a97d-38db486108amr4535875f8f.6.1738834174782;
        Thu, 06 Feb 2025 01:29:34 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a66esm53015975e9.0.2025.02.06.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:29:34 -0800 (PST)
Date: Thu, 6 Feb 2025 10:29:31 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
References: <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
 <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
 <Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb>
 <aebb2c29-2224-4d14-94e0-7a495923b401@nvidia.com>
 <Z4kr7xq7tysrKGoR@jlelli-thinkpadt14gen4.remote.csb>
 <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>
 <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
 <Z6M5fQB9P1_bDF7A@jlelli-thinkpadt14gen4.remote.csb>
 <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>

On 05/02/25 16:56, Jon Hunter wrote:

...

> Thanks! That did make it easier :-)
> 
> Here is what I see ...

Thanks!

Still different from what I can repro over here, so, unfortunately, I
had to add additional debug printks. Pushed to the same branch/repo.

Could I ask for another run with it? Please also share the complete
dmesg from boot, as I would need to check debug output when CPUs are
first onlined.

Best,
Juri

