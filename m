Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97041D89FA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844291; cv=none; b=iZ6lGoJ8Fq3loAVkjsXiy6fZMdPRJvBXEH1RfxegLo66n4wF71p3MhWbOdeXHRKuyqA1Rr7HhbM/nsSVifXZXoaeVsZc0zKapLz9iDKUlm7GYZ3BqP+b6+FYRQgsjzvFXl5DTcFfbvK1Ubp6L2o7LHjYWpERIeK5VSuXVazB+Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844291; c=relaxed/simple;
	bh=SLwH0eFw3b9k9qJaHyDs8HghjeBOT4plEWyldDnfHAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQEMLd+lEEqb1TwLGa9lFGlKsb9umKcZrJYrGTylFe52sWUxXA7/0oZcdjR7TqT3w5wGctmDnIqonL4UPTH48NqmVSuP2/kem21/nZDRVW5sLyouEO1qd+Hl13urMUmov33WcM4wnwvHupyENpcZQvuAE4EsI0cHekXjLWNy3GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfMRnaWx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfMRnaWx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso17334895e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844288; x=1744449088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jppA3+zjUadzb/dB3vJ3OKtgaoopfwZTi9MWUSVD6mw=;
        b=EfMRnaWxdMrg+lPP39HYygJfKwgVZZJ2DA7SEXaScZfnbVwyIdMzPkiJqeo+ND+Znk
         32NDthZ/fyfTsb1QBY7v7AkfXRsANCcPCiK65CYr1FnD8jKHReraMxZBENdgMgjsmPm3
         wnzg44RQuZkD4p7bvpuEWXqb2g7VX43ssxUBGC0a7f+rsdmsXgbZOw+LGm0lWUmgskeB
         qxXuuFhvanSunPNWL0AOb5/xgQqcuW8C17eu2lT4JlLA4pfp80SKDhc5DC2X+ZO4iVdm
         7m8aZ2Pspq7PVGPCPj7REP542VIggFZC7J2HMGifCwFBHH6X3M6sgJ6BmoeEp3qho2Q3
         +Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844288; x=1744449088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jppA3+zjUadzb/dB3vJ3OKtgaoopfwZTi9MWUSVD6mw=;
        b=qPElo8aa4+f0105/n3iCo2mrTectMtzjzm+qOgZO6PqDRvN4KhXaHi4hdaGgHTJMMf
         JrG5RQjOGkmuabt3k+OiEwdDfkakHNH+9I13H3AwrZKK9+82vXl3dBxYBQJgPA+uVHSP
         1j3lsxt8uO3T13FCWRLKeYUIRZ0HtNFcwXs+0oE5gcskzIVww3rY3+5feXeNW5ljBiAG
         RzBu/zK/CLWW3jCy+92Tomkv2oT0lxFdWY278UNQ7O2hYA+b5yGAxBUu1jipg3/YuxO9
         giPpQjAlYOgL7inp0l40ynbm7lfVziRHOIJrY98XTAGO3m3vqrFUqAkWqooE7o3iYlJd
         DdRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiJj13aC6HP6b1TNwsGJGf0SVhGo+Omjj5Pi4Wc1y5aMWo1NNIp41BtyJtUvYLqsK7BjTLr0o45PdXRws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHiA9RKSPnoMX0LaJTOTHzvG6Z3sOigDKtcU0PRJJRFcXpbtEP
	OZ6QrISfwE9uqvQpUTX28mcZVew7T1rNZJH56TYAiXvhBRBz+CPV
X-Gm-Gg: ASbGncvswE/Z0p5Mqc77XRBFm+H25NFxQK+6wwWzrMbgO6vgtZNP9nS4HuVSk5nVmBF
	/6EZ6s1DHO5mWdieUWayx9JPoyfCyw+Osbrq7HCAOn/2YDWwJD3QD0nwGs8OXfUX9PZD9slq0WB
	MEC6C0WYjCA5ojkZa3tCBIs3t/xmkSSZtq4nULXG2hSYzvJu6C7WBJG9M617+/+EIgDKtI0ZJ7y
	kKLMJRbQAvfOY5r1wjaaKdoGlFsEYSIKiPZafDJbWiSogHB2jFedW18BgojzbxL5nnjEN5IhQJR
	BHWb+1Cj9LfrylTUB9Mv7GMqUFFOa7fpzS9EuS25QoC+S06NNYAckbD2FmzQqMyL/oRD11VzuWz
	NBD352f8Yxaw1ZqH3uQ==
X-Google-Smtp-Source: AGHT+IHU9XxLHRCNlj4Zxv1RQb+K7/LfcwCdYPa0pjMEmX2mnC17XmsfYcuLgQgqGwTFioGIQTPllA==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr60136395e9.31.1743844287884;
        Sat, 05 Apr 2025 02:11:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69a8sm6316776f8f.49.2025.04.05.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:11:27 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:11:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Message-ID: <20250405101126.7a2627a6@pumpkin>
In-Reply-To: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 04 Apr 2025 15:10:01 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi all,
> 
> This is a follow up to the complaint that Linus made at [1] about how
> the #pragma and #ifdef to disable -Wsuggest-attribute=format is
> currently ugly. Convert the #pragma and #ifdef to the existing __diag()
> infrastructure in the kernel to hide some of the ugliness.

It's still horribly ugly.

Perhaps the compilers ought to support __attribute__((format(none)))
to disable the warning.
And then disable it for older compilers.

	David
