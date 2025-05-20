Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF825393B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783602; cv=none; b=Nl+0xbespG83ZhyGyKDADrH5iLtoSq3ZgnPovcziLq8t6b6uT0/MJ+cgBJre3SX9LSlHfCUiUKr5yP4vwZvaJUdP6w4il6o05EOBnDeksyHpEkFQHSu1rCVAKC2geTdJVEzkeNCYErFAzJw10cXOIX35r/s96wSG8oJxx8Lh8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783602; c=relaxed/simple;
	bh=4HHtawmhPaENN0DEAVnLAXYRZmmNd4h+JyE33PQj454=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuUqI4AxoMQhXa7Usf19is9vqsdHVNFdoYuMA4KlzBkWC9M8PxMLZPjksdC54Duo9YI9r1L9Uyz/dUiOVKKlKMe3HgXzWe5K9CPOJ1lSJ65lAyhe5zobuleU4GCMGjpVeNo87I78VhxROUlLp7iblSOGMxVao4gUgkpjp0T30kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JwTLGPkP; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JwTLGPkP"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4774611d40bso991061cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747783600; x=1748388400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HHtawmhPaENN0DEAVnLAXYRZmmNd4h+JyE33PQj454=;
        b=JwTLGPkPpvkNFf0zWjGWQNs5V9jf7sA1HpRwcjk7vliEe1ML49n/kAAZX/q0OvyhXc
         0GCcMIDcK2f9+1UTYCiQxOuqfvU4eqdR3RhV6mqr7bmPBjoBU0TsT/XVM/bB9oQKzLmX
         r8q+AiPyeyauBTwz4eV6pdqwcggLI5UDndeE3a7mj6aCkO+EdSjAhvGRnaxK/JfHg9SF
         iUmPDDfy3+fy7cv5vuf4tSJgxeZ4wxLUj96v4MfWqwtnNNn9PoN4HE4NP2UQbiIZoH8p
         vz25OIU2vSYR+Li+ZTdJYVgxyzs855bg7cViR6TLmkUP/du+U9xmhid8/VVrXdgTIJc8
         xZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747783600; x=1748388400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HHtawmhPaENN0DEAVnLAXYRZmmNd4h+JyE33PQj454=;
        b=oTbJ0TGlAfNBLmqtDyEDyC7vLsfe+NRYPTfnwaWodHvvqVM/fHdiEcgkYGWl/veSMp
         GS7yj+cl+zk6Kmb1yiEOXLCq8/LExKPplINR0Rwf9YxYEM+/vOF+XfrDd6sdj30U0MT5
         NgYKClCc0exbj2WrM0RYn9oQHAWKUHbt6rGJAkvjHJPPPUHZO8fgrqvqnPR5p0bAvFrg
         2t9Pn0d4A26qJsgAT3YHMHZzJU9iV9bHX+VPmtYL9WCLGcePiDGMUKfVe6w9UZ/9TK6i
         ywBVTHeQbKgsuNmykYT4GXtCGfSe9hrVFSYzvL08F732SMimajon/bm8RiAHAQP9rK1M
         iZDA==
X-Forwarded-Encrypted: i=1; AJvYcCWlfBySQbEpaCleiOmHX4ti6AYRFh1MAGHj3OLHvKG6lj1fAbj5sEbU2KQEI1QW9VNiPJlusLVvhRl3YZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP4Q73YBcHZEvCfJOo8K+fzOfErFGP32R6rNKuqlb39Y9cXuC0
	Or+YzP5AbX7IULVTzgKFiLGa51hVhXVfYFglOEa+B9SfMT0zRaIECMfLkHuGx0U2oDsUxrGAEuO
	F16IPqmqY82oUjST4u4yj6sZ0V2MyM3CsiXrP3SHo
X-Gm-Gg: ASbGncuwS5YWpI73yOl9PxoaPvRVvhAzJP9L8qbPzVQN0lXJt/h4fs8WmYxvyE3gmZc
	66j5OBlM3CSj/8U3igKpxa7eEEfeOp3J/UvEfjZJ0jmSXohp65osvv1l/z7KA9LNUyPILr8crwq
	/TkDaQralybpedJAz1rPB2suxl+KJKnNk3hp+cK9pLo979bJK3FgKY
X-Google-Smtp-Source: AGHT+IG6f/1+5EDykJHVQFWvj7ab2qAzshRhYmuFVlegdyB2FPxNKVWoB/pR1RBhAppiBlV1eNq+vPG3iRDtLh+90po=
X-Received: by 2002:a05:622a:3c7:b0:47d:c9f0:da47 with SMTP id
 d75a77b69052e-49601173654mr12820621cf.19.1747783599516; Tue, 20 May 2025
 16:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250520231620.15259-1-cachen@purestorage.com>
In-Reply-To: <20250520231620.15259-1-cachen@purestorage.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 May 2025 16:26:28 -0700
X-Gm-Features: AX0GCFs5vr76oHaRPnZcZCmedwZcMQVKloWyYdWtBs1obCTSjTQJMrTZ0D0EEjg
Message-ID: <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com>
Subject: Re: comments on patch "alloc_tag: allocate percpu counters for module
 tags dynamically"
To: Casey Chen <cachen@purestorage.com>
Cc: 00107082@163.com, akpm@linux-foundation.org, cl@gentwo.org, 
	dennis@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, tj@kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:16=E2=80=AFPM Casey Chen <cachen@purestorage.com>=
 wrote:
>
> Hi Suren,

Hi Casey,

>
> I have two questions on this patch.
> 1. If load_module() fails to allocate memory for percpu counters, should =
we call codetag_free_module_sections() to clean up module tags memory ?

Does this address your question:
https://lore.kernel.org/all/20250518101212.19930-1-00107082@163.com/

> 2. How about moving percpu counters allocation to move_module() where cod=
etag_alloc_module_section() is called ? So they can be cleaned up together.

That would not work because tag->counters are initialized with NULL
after move_module() executes, so if we allocate there our allocations
will be overridden. We have to do that at the end of load_module()
where codetag_load_module() is.
Thanks,
Suren.

>
> Thanks,
> Casey
