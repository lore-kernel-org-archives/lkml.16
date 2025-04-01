Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40251CA84
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471901; cv=none; b=j5YFDmhs9kxuOg8q56KFzmg8LxBSs8xvsu41A9FCxzQ92iL3eAKHk13k3aJaXEc7B9tHrQ6lKoncXyBQm804+MZkTh3xEutUnl6xUvbqJ0xqVJ76C9rhvVQiA5QwX24m53p2nA9qATdKqYChd7hFPnA2gKRHQyJyGz1uzi9fA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471901; c=relaxed/simple;
	bh=rn9IIVgH6dOcVB1hi9HKWEctsQtCMvhHl7Q7sdyUXRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXaUZMHDXnj715ch4adDrHbJPPATi95gTDO2HuC/C2YxFWj73O0Lu5qMuRcQ2wK2sYY7uErP1P7WsvW7dE/lnnmTW7SuLTXBVjz27iEtBD2DaiOTGHQYAm6IhDQrTyFOAynfVovTVnf0to5vPqE9FUOaJPgbsK2jeigbkUpd/xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GHbll4y9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GHbll4y9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbb12bea54so1030467266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743471898; x=1744076698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIYG5OfWPexo+K985CDcAL4PXpvK2Cy/CrlETrEV2S8=;
        b=GHbll4y9QnouFoSHatRrJAs6MvAS+RpC34theo6Hozv2+CHGSfKZ5/zmO2X3VGJsyb
         twY4kdzR/E+MdNpmW9y8S9Fp8m40x6GKVHSoq+FihYUHFXvr+tjJ9O9RBwIKb60UkX31
         U59gw8cGfM1QNjsIosUHiok9mDn9Q5svn0cdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743471898; x=1744076698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIYG5OfWPexo+K985CDcAL4PXpvK2Cy/CrlETrEV2S8=;
        b=VM4Ja17xLL9y2l1zAZQKDEWLXcNl1BaslztUlTH5Pn8D0nEckpRAf53Hz+X6feZF6i
         duHV48i2LWNlLuRYVRofojoOKbMsDsAOx7eVme8QLUjl7EYSacD12W2Dsa4PvxTAgtU4
         7Uq0OmLcI0quQVFJIUY88bGjyFjYQgTu5NSJ4opOPxavPPsd2B8kXjiZNh8QKKnRFgDZ
         VvWST27Tsb7UTLtEXI5V3I4hEtmDgrLQqSHK/I9p0EXuXeHwUbKjkHmU1C6AxM/0fwTc
         UzrDyrrQWrO6FGudA2Xj8ARjvBiFcm033GJXm7cZTe59StOERxBFFnlymR7p/boJMKBy
         Zefg==
X-Gm-Message-State: AOJu0Yzd3MyXQZhKd+1Mtg8m1t9Vzc9xKq1SV90Ad8vPWtOcw5+0pwZI
	HQqchGUt5PRTrSFQN+QgyFgR1tLLUGA9daVioPRaZPDktBoQVWVNgSuyl7O+aVxq1Y3nCr97nt8
	IsTc=
X-Gm-Gg: ASbGncsPS8cCZK5zNGTfBvdUpvfjCYVJEk8sdFsGBmhSASRsNS6s26ggtHHYzWpBC6X
	AyUH7a0oHDKzIq1/XJDgaSKxJ9e70WGNzIKIQQDf0JQyg7mocbPT4OQRwOwQ9XurWfPtD9qmn+N
	PehrpNIn2kU2jeZEydoqqeNC5dulIFc19puytiZ0C75G6n2+5Gz4BGNgozUPiVLJOgra5nz7LBp
	WLU/4o07098OPlPfF95GaayqSyvRh52f4fvxjQqnT421VJcFg3A0UXsfKXI1+NwXSbtMz+RAgNa
	t120UWanqlem/CVI4UuqXJuE7yqfVw8r6wKyPdDQ6HgkTHipYxM8RrnnnFJ4qrOc2wcoE8ny038
	P0Nr8DWAbCO4U8CdE4aM=
X-Google-Smtp-Source: AGHT+IFSNXbwOYo3yTb1teKLkvmrFwAzal9hJm6qh4mQnvllR3wI3Vik5X0AHcxYEjtxYW0aEpyjEA==
X-Received: by 2002:a17:906:2a07:b0:ac7:7e2c:68eb with SMTP id a640c23a62f3a-ac77e2c72e1mr166783766b.57.1743471897564;
        Mon, 31 Mar 2025 18:44:57 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba88sm711886266b.16.2025.03.31.18.44.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 18:44:57 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so2132903a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:44:57 -0700 (PDT)
X-Received: by 2002:a17:906:6a0b:b0:ac6:da00:83f4 with SMTP id
 a640c23a62f3a-ac738c6f29emr856911466b.53.1743471896732; Mon, 31 Mar 2025
 18:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
 <20250331133906.48e115f5@gandalf.local.home> <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
 <20250331165801.715aba48@gandalf.local.home> <CAHk-=whRNxdkLC6Z91g-_RbrRsUo6K6+nvRWqccjsOycwUe_JQ@mail.gmail.com>
 <20250331194251.02a4c238@gandalf.local.home> <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
 <20250331203014.5108200c@gandalf.local.home> <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
 <CAHk-=wh4b8hNT5XRDj9M4damUmij2bJGaRamqQ_icEkVUv8svg@mail.gmail.com> <20250331213616.18ccfa37@gandalf.local.home>
In-Reply-To: <20250331213616.18ccfa37@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 18:44:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKgKBeNBVFin4XYXLNSNDPnL1kdidigV6qfQ+6tY8cHA@mail.gmail.com>
X-Gm-Features: AQ5f1JrFwQtqaUhBPYTqFQvZ7sPYYUNGY-kB3mWrogAzqyhted5P9oPz7tJDnec
Message-ID: <CAHk-=wiKgKBeNBVFin4XYXLNSNDPnL1kdidigV6qfQ+6tY8cHA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 18:35, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Just so I'm clear. Are you suggesting to add flush_dcache_range() to
> cacheflush.h and using that?

No, let's wait for it to be actually considered a problem.

And I think Jann is right that for kernel ranges you should use
flush_kernel_vmap_range() anyway.

Oh how I hate incoherent data caches.

           Linus
