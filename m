Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6047F2741DD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832773; cv=none; b=cHQbcK3Pwa0g8t4PlTDrNWY6coH2YZV1GnjpTj9nK+yVIv4b7XKZLfHGAiryDGHLMIVZFiPA3g9kO+kv21c4p4q4llhGWndRVaoxXsySK77L02E8jVQJf409NSxoqphHBNZkssZDp9+oUB8oqvMJMnMydD/xjyf3CL8UJmkkJxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832773; c=relaxed/simple;
	bh=TcrrKXvdlHbcFj0wG6Pj+ExXSmsMKJU7SbgT+Fgap8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lza4Xmd7I8stcMDXAGU745bqKAinMBPQ6n8T9rSuIIhzjDFMP5Lb0LP/vLvSUsQjK3tSJdmK2FFoZwQb7IIuGByV7zPymDgroUlroscWda/wm73q45wg6oja8EU3d9lulJUeOmw5Dyx1DAJfgjcOCeCq5jsFRmVGegHahqSGNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKb29qXE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKb29qXE"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-391492acb59so2153402f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745832770; x=1746437570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7tUPOYn5rXL1MbO4/6NuUjNYVxgkXRDK4yCB+Judvg=;
        b=xKb29qXEdeDhLjw0zRn4aRym+xggEROCVjoH5GbaxSDB/SnfVCtViaZ09XAslCNmmE
         syG/RJF/O894guC7LqoRPutibB+QtfZU33Ia1s1eHvoDnKBRa6vegVoe6ClnBOcfuXw7
         qXFQwHi2id5le8Q50vYDYKYz1IFeiI0t+nQP4fKYDT9raREIg9/bWhxQLMcylXfU+ccz
         eqolOc0Zbrh96qlbZiguD4IEmp/Le9quwVlkiqLchLhqEdpVemQH7uF0T+cN8J9uUwi/
         ljn/3H+DjNgEmkvZnF6Lgrwv27eQ4BmQrMbfZifCzr0o2IR3iEovf5uz4vwqb8Bnw+25
         cmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832770; x=1746437570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7tUPOYn5rXL1MbO4/6NuUjNYVxgkXRDK4yCB+Judvg=;
        b=YI5G41rx/+iNg01s3A1cjqXORULg1gagJ2c3IX8mhecmLdvL3mFCdh/X8xGbDg/uNK
         YQk0v8SyhMZp9WcVe1pmc12428rWshERwgs/41rY46JG7I18x25r8PDSl1rm55BTm4Xu
         EZI/kEETzAq0QcCPaK3dxA3Rvq34EJoayHqiN6FP7YQSdeN4INQ5ecFnJy4casbqz7IA
         J0NJNHm9b58oicKL9R0lTuefxOLIrPoc5qVqLzDy/7bSoSk6oTmqcE2jqMqynXQ3voIf
         AoYw8nTE/bCXyUvcjHowETIzINV4GUrmM3JoEgpUtbJlFj6S6bHCzbK+Z0p73d3cGUwz
         tvFw==
X-Forwarded-Encrypted: i=1; AJvYcCVkibZnMMQ3sx4Bl5I+fYCEEvdefSvcZ5nT7N0eWLnlyZ58W+QaOQa5WXsKDMvCGhnKC9XRnQBSABwYsJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhyUN5voPkQPOBLbPfdNxvIGH2Z9+GZ7EVtl2WwcxYyGa7FwNr
	Naw2bP6xrN98hO2dEz47OJ1KtOd8doDF8R+FQU6E68BLsRHhtxEOFW5DQdKpY8BzjC1UcvklhdK
	4GiaqJVkMUOIGMQ==
X-Google-Smtp-Source: AGHT+IFF0ZD+LHUea5S2Cd2b/RHsnQLCDxje0C7v0IkOsVYFfkn62JAgEj9CAUiZbb36pS/ILRUcimwez8ZOujQ=
X-Received: from wrbez19.prod.google.com ([2002:a05:6000:2513:b0:391:3069:bddd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:f344:0:b0:3a0:7a5d:bbff with SMTP id ffacd0b85a97d-3a07a5dbd42mr5372328f8f.7.1745832769801;
 Mon, 28 Apr 2025 02:32:49 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:32:46 +0000
In-Reply-To: <aAvhxfGvndybqkJm@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com>
 <aAqXw3t9UVU8pF8_@slm.duckdns.org> <aAtXApA8ggJa6sQg@google.com> <aAvhxfGvndybqkJm@slm.duckdns.org>
Message-ID: <aA9LPkxMlXT_Dqg3@google.com>
Subject: Re: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Philipp Stanner <phasta@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 25, 2025 at 09:25:57AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Apr 25, 2025 at 09:33:54AM +0000, Alice Ryhl wrote:
> ...
> > Hmm. I think we would need to add a new field to delayed_work to keep
> > track of which list it has been added to.
> 
> Can't we use the same cpu that's already recorded in delayed_work->cpu?

Isn't that just going to be equal to WORK_CPU_UNBOUND most of the time?

Though I guess we could use the values NR_CPUS .. 2*NR_CPUS-1 to
remember which list is used when it is unbound.

> > Another option could be to add a boolean that disables the list. After
> > all, we never call destroy_workqueue() on system_wq so we don't need the
> > list for that workqueue.
> 
> It's not just system_wq tho. Any busy workqueue can hit scalability problems
> and the result would be usually subtle performance penalties. If we can keep
> it cheap enough, I'd prefer the behavior uniform across all workqueues.

Yeah ... that does make sense.

Alice
