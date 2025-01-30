Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6F20318
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201390; cv=none; b=YsH/zVx6Sj91MAppLic8BfoKLIyP9kSNibOxKSnpIgD0RWWvHajqYGyqHzJE54fQKe9+Pf5Ks0ikXNryWsxZovuO+29f2dfEHSaKPCG2cZvTlDrg0J36cBPhlfCjogxdzu3qOgixvT1WJOvBs0FpdMyDFWfNg1x5M7RuTwi/rBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201390; c=relaxed/simple;
	bh=SBrIDrBBtkF/79w3PecySMmiUHoOKHgSqpgs/0y6hNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkS5Wzq4TgFCVMYyw4ZNW7ufyeicyVovfzNiRutRAhqewG4sL2Xn9xvD5WXQQLaXI1mCYlVMH8MG4gKd0ICfmnLqPBTClDU9Da3VrRhAw4ke9ved31B/rL6rslZT0vxiiDI3dak4bSK4qMaTTXp+8dqZ/f9SGLQ6H0dry2U97aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l4RfYCTM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l4RfYCTM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163affd184so39785ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 17:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738201388; x=1738806188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBrIDrBBtkF/79w3PecySMmiUHoOKHgSqpgs/0y6hNE=;
        b=l4RfYCTMU4Ay5ZjNpBwEmc72auFNJDt9x+iR4WQwpPWMZOFG3yR4gZTP4o90YQKER2
         gi35B94vJhvWO9SepDxmWn5OIaYdFSjBrxtU6zLLV8+XRCqIo1eSaEZwOgWcq4EFmyhh
         aijERGNXKUflhCs/MID00jZrqvBgoeAdUc5RfhHjZxi7YLXGvW9Op6DiRjeHyEcvmxBt
         R5rvYxFdeKKCvweBokpeun4FoDqVcbbyD8o+fWZzYGd1ISC7eM2832PzMJdEhcrQ7/D+
         OFMXXihfmWWkiwLT/iqeShHldbko/eJIAp0My9yweYuluQuF6ljijkBTD40GM5h7MpWk
         irVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201388; x=1738806188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBrIDrBBtkF/79w3PecySMmiUHoOKHgSqpgs/0y6hNE=;
        b=w1LrwbCvyRQqwquwAsvk44lBxkUQe5l1WaLpGqF65fdyBqds/AYJiGpdPL3rN0ywNe
         0I5iLfHojuhOVzyne1XHcTCbF/5GeGqZ8iAsGTcYojdvvD9Et/gFwzHhy7oSj38VHAd1
         ICVgEZYz7l5Pt77eA3x3GoXhqmxwYNelrLmMMUGvqSVzkFSRHnKA2ji3wCg5Y4JdOWEr
         DWsuZDc3ENgPyMUh6Yut8b6A8e959bd3nzVlV9bi2a3k0eucSxdu1qWk9uZuKKFbLeUe
         W2kDToWxKZGSnHrabGhG1dGngR+ZtZFGdp/NnYFDp/qeVorFJDPkvFpyK+jPubtB99nb
         x0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTLR5ZKgcdA2LKZ/A59RPRdE0QSANwMAZeqnbCt2sc9BROp2j2zhISw6C0p3e07bR5Qd9Vf6f7Zwyzdik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDmcsds8DpiBYXqI5bF3FCzMxi75lYijfAcwivbSCoYcJ85WV
	klSfCXujUrAoKoboaW4rV6sqCq2p9x4tifv+n5kUKZGAoe7DxiXDi5JYFrRm3k8qsbSR7L4vPs2
	cQDA26pSuPQPb+kvPsym1CbSCcX86JVgEB6DN
X-Gm-Gg: ASbGncsdlUbP/iUjYkwAaqSoCHe+pQva4WdJBihWHMWde5mB260TVB6bNFbYha1rNoA
	WFG+ONPe9UkF/qULW11gZ7GmjbAl4jfgWhgWW6UgCTvX9sH5fb3YiU9OQnRnaFdxXK4V/5wzxjT
	y6teX+usoAHe6rPZdrlzaQPS7TUQ==
X-Google-Smtp-Source: AGHT+IFF+EXsap9Y27G6hz0CAJByVSDh+P99ewgvmlhQ71vPlZxj38LxmsstN3A/4vUoyv0Jc3jSEymzYndsjg49I9g=
X-Received: by 2002:a17:903:1450:b0:215:79b5:aa7e with SMTP id
 d9443c01a7336-21de3697386mr728395ad.13.1738201386787; Wed, 29 Jan 2025
 17:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJj2-QEtASHEfiYuoKrfx7n1UjDS1e+aF0LdYB5vhBUUS3cq8g@mail.gmail.com>
 <20250109114847.539237-1-tianmuyang@huawei.com>
In-Reply-To: <20250109114847.539237-1-tianmuyang@huawei.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 29 Jan 2025 17:42:50 -0800
X-Gm-Features: AWEUYZkCm7GZHqoTF_LkSbJKMKMuuvsnPLq00Zdm0WDkQiuhx53xxjCw08WuEgU
Message-ID: <CAJj2-QFH=8=ggYuy9Wb29VKbW+39GxvSPfQ89JXs=5eNYLxfjg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: multi-gen LRU: per-process heatmaps
To: Muyang Tian <tianmuyang@huawei.com>
Cc: Michael@michaellarabel.com, akpm@linux-foundation.org, bpf@vger.kernel.org, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	liuxin350@huawei.com, liwei883@huawei.com, wuchangye@huawei.com, 
	xiesongyang@huawei.com, yanan@huawei.com, yuzhao@google.com, 
	zhangmingyi5@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:48=E2=80=AFAM Muyang Tian <tianmuyang@huawei.com> =
wrote:
>
> Hi Yuanchu,
>
> I'm working on observability and the programmable page generation policy =
of MGLRU based on eBPF, using a similar approach to yours.
> I'd like to know if there is any related work, such as the application of=
 eBPF in MGLRU?
Not that I'm aware of. There were some patches fiddling with the
generation placement of pages but I can't seem to find them.

> Also, this RFC provides a user space interface to call run_aging(), which=
 is called periodically in the demo.
> Do you plan to optimize this, perhaps by calling run_aging() based on pag=
e access observation results?
Right now I don't have any plans to optimize this patch series. What
are your use cases? All I cared about was one off observability of
accesses and not much thought went into optimizing the tool.

Thanks,
Yuanchu
