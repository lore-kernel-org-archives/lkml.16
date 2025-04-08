Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017771B4243
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121584; cv=none; b=svtzYHq/TmhrLc8+6D494P4KBbSttKqjFegMM4FXDt6gNbsry73KWA69bocYPKDiRdVKv5ggf7EM8hTYZTlkwQUlTteC2c6HboBhIrTFklJuTRQ1Pzyc7LIQHswgouf/mHl5dzl2yeoUggAsUerQcle8pLIeMYTyd1UW+bfIrIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121584; c=relaxed/simple;
	bh=vu5ZtAxXaIPJIu6G6Dc4xF0xOZd140ZczFGd5pI6jlM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G8PFyq/no76s/3A3spS4gRqCQCT4MRPRmWeME8YyIKwbM7GKlaurL7v/Z+31bIkFLEHfEsSL4ZYlZEGsyzPu3Xp/fvEGUxAFyKFauwa1WqSNYsJKDjmIQmfhkVHYznRaTzMqJllT4+O99h5SB6KZaOSqumSbpv4xFkPs/bKhyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q5aUNtcP; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q5aUNtcP"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3913b2d355fso2297095f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744121581; x=1744726381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYRdpKVYxG72NqGl3LmzcJbX8dW9gD2B/n7NOHyhSaU=;
        b=q5aUNtcPYUOn3/1cx1a86bCeSJ9y+GCCov86uGnffzi+n0NLYLwovvIcAS/zMEzk0X
         0EFavdqTekmb4lCKn/UaXJXATE5tLCAsZlR0w9lYp39NhCGJZ+eZTfY3kw8PiNFW+6mJ
         N4N7cw/J4X9254cSxRlb9QaZvP5oMGRqcpx3L9fQp2CG4xxh+M29grrcg4mukCFDTQaj
         sPhZJL4IFePGpS0lbOGo7yse+ZIfG1PHrZSaiSo0hup4GPNb1Y5czDsVyW8Ui7e6fzHS
         w2cS1iPXTc0RXhJmegH7OOg6MQvCXsYdcHa1sprsX/9i40lkvElgZT1Ot8hJ4y9owJor
         tAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121581; x=1744726381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYRdpKVYxG72NqGl3LmzcJbX8dW9gD2B/n7NOHyhSaU=;
        b=lDhcADGZ6MfppOSqdci4aNmHMz9iZD0vMltSeSkkHVSVfQzAN71aY0jP41xSDj2tHo
         eXkc0zHnMMDw5Uoe0JTNHZkMN4oiO/Tyw8YCc2Bts7AZ0PHErzkL2X5FE7tKHwWn+ZOC
         TqjWff7LumrA1c/qSTdRZIeitg7VvM64DtcUpEyI1kw1nmIV6ZKeWzs5VfaK8czBR6a6
         Q7m6mbFvHRBFemZXAwwd+4X/UiClOw1857cOsDZ59DnCzlB88EpG463VLmQgHBmhQCFk
         M4IyseEgIqp20dW3TR4ypchHu/x5VkySQzYGONzu68ARW/sqadSnZj9gQY+8++tOgTw2
         nYDw==
X-Forwarded-Encrypted: i=1; AJvYcCUl61VqaMDNtRXIRIaXDCGEVwW+SloXEvgyPBkR1VBcu/lhqnPMEObufp6lPjRn/6+cerMxcuFZYQ4vCKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1jiD00a3StiKEnYW+0CnnTGsyYlP89b5WsHb1I0kWuoSsK3F
	M1HUMLqMR335AwE4LM7rplKM23Ym65oieeoaEmKJ4/fAqxmpq9/asTcslrnuuQUAVQOTzPWtyic
	nttvjZHMm4g==
X-Google-Smtp-Source: AGHT+IFTqGpEmdkt01UFoNX8g7+m5zMPhGy/7or+G43QMZih2nLy9D/JLVI5c5leGTTikGNxHdrtSeXmhOUigg==
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43d:5828:13ee])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584c:0:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-39cba93cf0emr14625227f8f.51.1744121581367;
 Tue, 08 Apr 2025 07:13:01 -0700 (PDT)
Date: Tue, 08 Apr 2025 14:12:59 +0000
In-Reply-To: <20250407200508.121357-4-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407200508.121357-3-vbabka@suse.cz> <20250407200508.121357-4-vbabka@suse.cz>
X-Mailer: aerc 0.20.1-1-g87e37b93d34f
Message-ID: <D91BI0ICWA7L.3P7ILKPYMKGMZ@google.com>
Subject: Re: [RFC PATCH 2/2] MAINTAINERS: add MM subsection for the page allocator
From: Brendan Jackman <jackmanb@google.com>
To: Vlastimil Babka <vbabka@suse.cz>, <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, 
	<patches@lists.linux.dev>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon Apr 7, 2025 at 8:05 PM UTC, Vlastimil Babka wrote:
> Add a subsection for the page allocator, including compaction as it's
> crucial for high-order allocations and works together with the
> anti-fragmentation features. Volunteer myself as a reviewer.

Thanks for volunteering and thanks for proposing this update.

> Extra reviewers would be welcome, including/not limited the people I
> Cc'd based on my recollection and get_maintainers --git
> Also if I missed any related file please lmk. Thanks.

If this is a "more the merrier" situation I'd also be happy to be
an R: here:

+R:	Brendan Jackman <jackmanb@google.com>
