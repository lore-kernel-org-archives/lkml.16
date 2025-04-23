Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCF25CC61
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401003; cv=none; b=NxCFxpoqFwIVrIVikw8FqB3m+XLhmE+0hm2aUsLDunt9X5YiFH3PiwPZl2sXgj774aMFBD4jE5A6FUSLueIQLdmAI7BAL8dENPwgTkn7LQegZZNez2SQyv6JMBtkfbeT1EokbV1JEkK8s5Qf4Ba3EKu3oUGW7wodoZay5OfZvJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401003; c=relaxed/simple;
	bh=60aDTvJF1JosQdcSVUF5k3dxhX55UjypgtOonn4c00c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnekqeYlWkBD0HNvltdlgCHCnUTQyOU92lpNY6lWjdbR6pYnquVm/g2EJ7FmkNZz4wiHoFnRkTFXtR08R/i33OgsnKle8pfR+peIuYtsXk/acyPgRBJ21wWsMjoI48hxMu5w+6emJEywY785/L0gMeQG1H+zmXs5C9/LjVGN5Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f91lpwhb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f91lpwhb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso39013255e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745400999; x=1746005799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ouR64oY1x23iTsZv4GzJVP/K6R9UR9f9EFFISrwlR1k=;
        b=f91lpwhbLegV/ylkTK9qf4bTBwXAClVWz3CMkqOK2qvM1KtVRJW8vxS6CihpDCAv3Q
         BZA3RXxksEDR2s0gFwLmE8usoiNhJzOjNhe6Us4n5m5ujqX8nOvc/V9Sc+EM7aB76Xzj
         k9D9k7m8MpYUgT3vA15RFEFNKR8hfHcvRou1xVIcdX03phuIZ6vBOnDeaW/FVlOtm/lk
         rdoyZb/2RbqIZK3/cIy6d5VAospoIy2i4TXNXX8N6xp8bTJ6AMe3NlGuEpFIC/htb0kp
         gr/be/C/LVFqZmpztwa42dchIW5uuPaN2dvvueR9k0xxN7KTWHh9Rz55x8URC+ctTlHM
         Cirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400999; x=1746005799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouR64oY1x23iTsZv4GzJVP/K6R9UR9f9EFFISrwlR1k=;
        b=ir7NkWHUF+swPdF5fEzXGw2zVoGaio5q7MkTnQmkHnddiheCxeKGzGX9gJ7D/llG6u
         3MTz3ejABaXvutzcV+UGHmpYhNgs6Dl0e1XkpN0aah2bUwO7uAAj/zDIzrcGs7ANrKMH
         DxiC8ebkKFqFg3Ld5uIAB8NUb6SMqYyPDza+aU5GjtbfYNFQc64OdCEnegQojtt/k4n0
         5UTdLJoBME7PDEayVLjRie0OMg7nBMr52IdG4n00DqX5nMTYzE/vQKBvOaaYh/v7QZQG
         UxPLXIH9MhxOWDF8GT+oJf6B3n/XtYBa8G8X9+Tr8GnJxNsoCpSLBcz+Xt8NNW9GEOqu
         28sg==
X-Gm-Message-State: AOJu0YyfBjRlnznZq9sSN5AWrYM1QahSWlQqEWJnI233qjg1M87pDg/r
	0zZihoE7x2dEBfan0vZ4ue+cSRYdU0NDkLQiZ9f2g0LE6jj1GqGasNnf+1wYjkE=
X-Gm-Gg: ASbGncuyThiOHlKwCM5eG1vtThiCgC962L/bnCrhh/idC0WhjAxxDlsQ2Xf9un7jvBy
	2DPnVVE4AITq87W7cwyuGNagnE98B9FCTPOxr7TUFBEU3ciZ25vjYXEaLMosHjOaQE23xJ3pNRm
	RApsxbV0De9NyUph6LUEqj4SyB8ejwnYhnezQkX0qCT7sDV/9lm30tvzrcbHQ5jO5r0rVMmf3uf
	eiba/KW4ksKyIMGiP2q8bDFC2OMIramAwAnIdBu8Gg/TK/p02pCgRo33YFlW303O/84u0C37Qan
	L2nfQbFl30tLF2yJoW0SMQe5+vNGjUdDcI6a2ALs7ao=
X-Google-Smtp-Source: AGHT+IHdw4betJQaw6q/cp7XaGcy/D+ZaLt9syR+Sw2ULXUFuSU7VPvNe0EksczSRRlX9LNiTRZ01A==
X-Received: by 2002:a05:600c:3acf:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4406ac2040dmr177944085e9.30.1745400999023;
        Wed, 23 Apr 2025 02:36:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092db2ba6sm18915845e9.31.2025.04.23.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:36:38 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:36:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v2 ratelimit 01/14] lib: Add trivial kunit test for
 ratelimit
Message-ID: <aAi0pD9Qt2w5vLpE@pathway.suse.cz>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <20250418171359.1187719-1-paulmck@kernel.org>
 <aAerQXIz8Aebqm8c@pathway.suse.cz>
 <4b6df025-bb53-4537-b5ed-7191b20370f5@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b6df025-bb53-4537-b5ed-7191b20370f5@paulmck-laptop>

On Tue 2025-04-22 15:56:11, Paul E. McKenney wrote:
> On Tue, Apr 22, 2025 at 04:44:17PM +0200, Petr Mladek wrote:
> > Hi,
> > 
> > I have been recently involved in a conversion of printf/scanf
> > selftests to KUnit. And I seem that there are some naming
> > conventions. Adding Kees into Cc.
> 
> Thank you for the review and feedback!  Updated patch is
> at the end of this email.
> 
> ------------------------------------------------------------------------
> 
> lib: Add trivial kunit test for ratelimit
> 
> Add a simple single-threaded smoke test for lib/ratelimit.c
> 
> To run on x86:
> 
>         make ARCH=x86_64 mrproper
>         ./tools/testing/kunit/kunit.py run --arch x86_64 --kconfig_add CONFIG_RATELIMIT_KUNIT_TEST=y --kconfig_add CONFIG_SMP=y lib_ratelimit
> 
> This will fail on old ___ratelimit(), and subsequent patches provide
> the fixes that are required.
> 
> [ paulmck:  Apply timeout and kunit feedback from Petr Mladek. ]
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Jon Pan-Doh <pandoh@google.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Karolina Stolarek <karolina.stolarek@oracle.com>

JFYI, I have checked this updated version and looks good to me.

Best Regards,
Petr
