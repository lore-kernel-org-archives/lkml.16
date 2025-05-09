Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51332900AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798605; cv=none; b=Q048Rhq6AzoDy9pFH69Ivo1GgPkFLXsWGtLdEyG5khvqaS4dAORYnb4ZpAASLMOsfsiA62mvxLqCotHFaG6eaVT7O4qZOH2ZNo31i6M0AlAq+7nRgQgwUPtexwrJ05vrN0V3QlnKBoc3asWUEKIL5VZKk7/k0e1/k+6aJZplMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798605; c=relaxed/simple;
	bh=aESLthb8Z+2pWZxn+QFXNcYBqV9e9s72Xbp8BF3F5X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgyjTU21GVglumX/PwSM59N+meIKDn9LFWS1sEJWYeNbgLQd4iD+jDufvVC07fvMS+8E3nhoA7fJ++DHsR62Ffvmm4resW4XKc+yDquw/c6SQl6vZPwftwRn+totUXRL+4Vzpl+nG96uMcPXVMJMdl8CPdzFg+TXcgeCKMCtGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ovK10yk+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ovK10yk+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e42641d7cso230095ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746798603; x=1747403403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aESLthb8Z+2pWZxn+QFXNcYBqV9e9s72Xbp8BF3F5X4=;
        b=ovK10yk+YW29WDmxhpGY0GgIfXCqBFgSxfTtlo64xQFzD5xpw+vnKvIHMylTPJyeDb
         eEZPsfXl6/FEJ74yFwacwiHocnZU+0fT8ZvrAix634HQ1Zj4yNfvcMB0N9JxlspXv4AQ
         pcaSJKXcBRDEtXIIuJL0g83fmnp6PFR/+d+HErq55gLNvSPVXmjz+LayDpIEGC2sHfsC
         oerfsPIMUuQgrAmupLj+O70tmqTgU557bemKhWSsxzZY29mjKjco7FKCWUHibsatg/5F
         jD2fT8cYjg0w8SpldAvlFcZTMO6cw14S3xPDqv6fp1vgLC6XfBrE4hUOyLSmDWel9hHr
         OkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798603; x=1747403403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aESLthb8Z+2pWZxn+QFXNcYBqV9e9s72Xbp8BF3F5X4=;
        b=Zkj7og0OfHGXsEey68Suyp9yzrSQ4nYrNwWskTMA21gUgdXWig+PKDcLRZy0R069He
         npmCjpJYbC15mbAN8RDyLWLne4o8hsSZEZw3SHfx76yHI6W+22uD0lqq35mLO3j1kYwc
         6d5OVzz+FxlfH9AHqu6S6jxphpQYKyiIZh08TpJSLP02KzoItYuDmY2kPPRgmNMkX4js
         hbcjmeXrrIQyxs4PhvheRVEm5WwAe7AlE0M/ZuCVUg1fuZ1KUD/Y6tzOM1cvnX39d/4j
         rXi7tGF46uopjXLi71nhl1yfG9uQ/Qe101ZR+QYae55yJkUZK1xge+QEUGn/rTJOOXFi
         HoaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO48aOfZy2hbq+/ThDe4viFCCPFTW9CqYV4DfdUPZny1IAbB5eLfATQ6QWweWq/RxyIeixj/PPrZo8/tU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXOIkm1qr/ShB3rxf1fu2vC6+mj19WurCHbOmptvqQ7SqnXlNL
	qGTQs/0BXqlUTH4l91YzinCRpZaJ4QxZiDnkrXWrUmlZxiuIdQG9ltG/QQBGy8RpieWbHE7/Puj
	5LNfnR7mcP7dnNlWCsJe0PRI7cEwWTPfWkZ4R
X-Gm-Gg: ASbGncsFKhPBB8qNVeEs4Nmtj3S63N0FC3KqVc53hrdkLbGBNWg8urDk8t0u3hqnDrh
	j9ITZJ4CWw/H8Y/tQMjdAga2MhqPgwQfy4CkNTGEeeaGOka6xTQz/iyJbdOtdPhw2jRY4Jl+9Z/
	OO+pGQRxeN/l4nDOg7v4RUz32wLAyS188yVw==
X-Google-Smtp-Source: AGHT+IEfTvbeddSsGXQw0Adqt7tCr2STU9I+nNXp33bwH0L+hwSuMu3Ap+LkCEkaM7YVgRnUCqsQFmKiEpSpdE4GbZU=
X-Received: by 2002:a17:903:3bc6:b0:216:4d90:47af with SMTP id
 d9443c01a7336-22fcfa7aba6mr2053135ad.29.1746798602848; Fri, 09 May 2025
 06:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com> <20250509115126.63190-19-byungchul@sk.com>
In-Reply-To: <20250509115126.63190-19-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 May 2025 06:49:49 -0700
X-Gm-Features: ATxdqUHck40zobds03ZWqEtBJr9EV4DbGl61dJI1iqWRJx4DXr7sKcZTfrJfI7E
Message-ID: <CAHS8izO_xRpQ5=t4XRO9BvzkwQBhavL02t9+YHXAxxery8_sKQ@mail.gmail.com>
Subject: Re: [RFC 18/19] page_pool: make page_pool_get_dma_addr() just wrap page_pool_get_dma_addr_netmem()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:51=E2=80=AFAM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> The page pool members in struct page cannot be removed unless it's not
> allowed to access any of them via struct page.
>
> Do not access 'page->dma_addr' directly in page_pool_get_dma_addr() but
> just wrap page_pool_get_dma_addr_netmem() safely.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
