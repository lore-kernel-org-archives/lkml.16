Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19B25F78F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212619; cv=none; b=HkdRLHmulBe2sUHAPSEXjOvsuOktBuOV+gtFEaCit5SrJMJi1UrRuWVJyp3+zLNnii7p90u+KsqcQPXmjx9/k+ZV5CZrb7/6wWFUYsG6miV6Pku/F4ASy4EhlmbpXGkn2bbAFIb8JICKxKNKmT6owDzgcHcZckOPzORUYJgatQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212619; c=relaxed/simple;
	bh=cSb7Z4Wciv1Wkwau8LKbnH/lEO+Br0IiyaGQ53DULh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDpsD/ne0N89+25RNWTusspa5wIxcFiy4NGpD7V0RpVacmkXTatUio99Pg2HkgLg6bPqBa95j2YbLdviWrlYfI1Y5OaDlm6GRwhOAKqKrLcuFFMZpdjD32v7bj4LGcU95iyUfJ42bZzVrf9JsiF0HBCNclnPuI5z3NzmDiEOlFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LATRf7Yg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LATRf7Yg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6511915e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744212616; x=1744817416; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
        b=LATRf7YgIdU7Ij3Z1tcNFBbqHpiiYtDbVrPQ1n9CxweRrLccxcKjZLTCH62zmCZBAw
         nxdkLX5hr8XCJD9SzS4P3hxQNYRTtSTKhWJi0tUDQEdBz6Kmfbef35WQkOQHm8mKhem3
         JtnHNBetEq9UfUru6fVQShSA4609iFWhw+GOwS1HX3fyf/bt6gY3X0sIt7dt3f7XKUQc
         wIf1ouuGpI4rL1FZZ0mH9NB8DOW4ZRpRakuWt76WsH+EzIzJ8mQ0GeD6Emd6KHxL9M5N
         LgcMhBHJPk/21qkBtt0UN/3fvkrPnk4OwRpD0e4FS0dHv2pYYpU9c1HXWlvKTXGwHKvn
         Sieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212616; x=1744817416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYoWpZxajoIHIaYiHf4bHzvKRXNdl/YUkiNhw0QxN6A=;
        b=O6GpvKw+adK3CoOmJDPEnkVuc0cnxj9ALVs8fzvYGz33jgm1rBtjGQMMEIRoG8djAJ
         64xalXJGDPuusiAr2V1KL6ULCS1bRtfSkA7b9D8S1dFtl+WWh52mWnFZ32R1bM/9bKe+
         3OhDKxhKkCN0wXcfYu79BLS5eNEoYT2qsm2r4wT7W7kA47oybfnV+aUwUYYokxvq6z/L
         eDWBVO686kg5oofworqsSJmnyISPxU3pHl8RuHlp2U9uKqUJwmVnVl6i0r8Zi5ASwrWu
         ijrIexiSHG1Dq25RZF3kB0W0ZljUN4zitzAvIpNkHt+1MaS67yaeryckgCw5oEhgqrAS
         ffCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+QbyYE1eneJlHQyjmNjdO7QoEax1brwYpaPsDJs3g9SuKjIjyu8iiZW8EaUXRQ/WdoRaEA4/iVXD0i48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PX/QAMouXBziHhDrHNYFDdWn4U++JqZgNiqaWpqgeK/f58Ji
	0EV1s2QBxyibu0Lvi61f/pz7il9tB8XzOXct2rfSIrZJbaah+CtvE5QwZ4xUJkw=
X-Gm-Gg: ASbGnctNs6tnIYnkoy3fMwut5Ht7sMquHi8RNQ6wqDt8B1ln5X3gYY84hq3WOeJUpbf
	hRLjhEnjGkPp7boXneEkeXoHCRw3KYpuqT0Yfo3FHPWM7W2Pwug/aLynmamAw/4eK69AMOg0LDw
	Bu7JqgjR8cAnHqOBqxx/YP2l3xzMzz5t4unVkfjg8O76Puw8qCSYUo1zyex7Xfx+KPk3H9uwZJB
	QgtQEQpRyytrj7WsspUAP3EuK/TwyGGwjZiB+GGqFz7Q8wepygRdZ0RPaZyC+YwWaKX0IF5BtYW
	BN4pgnqG4s6yLvwemQLBYFwklba+qqlrB8TqNHmmuhQ=
X-Google-Smtp-Source: AGHT+IEPdF7TEMEPsBlbKy0LICAaKI5tSy/hvaMwPsy/0iACmx4P26wxRXBvDW6KHmSYeJXA9kBcqA==
X-Received: by 2002:a05:600c:1c0b:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43f1ef33982mr29289245e9.6.1744212616063;
        Wed, 09 Apr 2025 08:30:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm19339265e9.23.2025.04.09.08.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:30:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:30:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>,
	"airlied@redhat.com" <airlied@redhat.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_aSbrS1hk8nltqc@pathway.suse.cz>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
 <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_TuqoRpTrjN07zo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_TuqoRpTrjN07zo@smile.fi.intel.com>

On Tue 2025-04-08 12:38:50, Andy Shevchenko wrote:
> On Tue, Apr 08, 2025 at 08:52:10AM +0000, Aditya Garg wrote:
> > > On 8 Apr 2025, at 2:11 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Apr 08, 2025 at 12:17:13PM +0530, Aditya Garg wrote:
> > >> The vsprint patch was originally being sent as a seperate patch [1], and
> > >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> > >> them via DRM.
> > > 
> > > You need to do something about your tools, really.
> > 
> > Uhh, I'll just revert to the tried and tested macOS mail.
> > 
> > Although I don't think a resend is necessary here now.
> 
> I dunno. If people are using `b4`, it might mess up the patch ordering,
> I haven't checked this myself (it depends if it takes [PATCH x/y] or message
> threading into account first).

JFYI, it seems that b4 handles this correctly. AFAIK, it checks the
[PATCH x/y] in subjects.

But I am not sure what DRM guys are using. I guess that they are using
patchwork. I am not sure how it handles this...

Best Regards,
Petr
