Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95249155725
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440777; cv=none; b=X3peVyPUq3Ibwe9x/qwQi/tRGNcqqq+pE1MnhKYgPQbJH/oL6ZlahhMS7tu5gmwRBSTMgk+p/vO2jqSkzz6xraIamPOjc01/tg//EIPoekEWhUpd5BYHVa+xR0YmwP7fj5+bxFhCtXET7daBN/+kyx5JrVtfHh/heAOrneM4vMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440777; c=relaxed/simple;
	bh=ZZkZvH/BUKOCigjn+sSb0nqimgjJvjOnpPOdrMO/Cpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kH8uvyshjcqwNYkztacfovDmLKbeOYDvshLc58M9YhsRXV915PsOrR1ddZqle1B/1ceAUtZh2hwFksNLb/td2g+c71B5F61/crbDA6JdszpVB8/WdC8DxgmaApfba3GJFKCsoKk/cBibg5aqVcSIUuDIr+OXPzKuMdRrTSs5/Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=G0Xdn1iO; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="G0Xdn1iO"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c56321b22cso440393785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743440774; x=1744045574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0LYO4zm8RMlUKfb4Sk4QcbEcVNv6rhkxdm6HCjIzY8Q=;
        b=G0Xdn1iOCytSDd3kTWdakcq5m+yfGW25jcP4M7aQWCm/1YVY1dS/l52MU1cbQyiMAG
         ZMZ5b9IjHIPqzdBLKjviyhYpJ6bqzQka2NJDa4v1qnR6GPF3D7z4ImeqyyQrwVhMFszg
         7SGxdrlKWn1de1j22wniRVIiiUq+svolU42+5PAMbIf165DFZd5EzjkwHzJlddYzoUpc
         EkmS9yRvPH19N8dZdEXQE/lkv6yIqorQ4m5DioyDdgxOHRLONiEPbrH11f5vH6/l7OzP
         I0LwwucQ+CUxzZ+7CqVpLfTFg97TmImOvTWdTtufKgyQiGKKr+pTRnvZd4bHAgQUnQIw
         mMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440774; x=1744045574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LYO4zm8RMlUKfb4Sk4QcbEcVNv6rhkxdm6HCjIzY8Q=;
        b=TfSzd7s7zC09Lxe5rwv/HY9+Kt5peV3GfIv1s0Sd/jXUNeEzy+3YFvaIpx+5p2QHKK
         cnIkZ5BuxYYaqSb6IDtqqVUrQRSxodvBZwElxkdeW5lK3NtWYlxWg3GK2HRjwkeUVM9F
         3en7LEDYEg5h9Lej1yBAy46WXNGlDEvcLqwykigsVLFzXKHrrHhaLf3Vwpf2tHIXMPfy
         QNDd+087+63C4WeB3jyfrmP9ux907LEVcUZBWoDbGFW5/xtSo4KA/YMnQUomVyNu7jSB
         /jDz4sEwpX9xzEZRnwRtgEi5SitNZAOOC5ewPfYTmx3kV2B2WdB1kCeeHwqSDZDfdRgv
         y2og==
X-Forwarded-Encrypted: i=1; AJvYcCXKaqhQxUA66stK8HUcKXY93zZECV/wg/M5RBg6EIOarbJ3TqEuLOMTi0yVKtL7pguil+lbULb3gG041iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBifpc9uHMcYbB7Z6/mn5of4zF4lAnF7i5amVGXQMJAztJlUX+
	hC63tKV79NXjWpVazAvdlAIZE8dc/bpd9/03ka9mE6pHC10HjrjA90t+h6w6k9c=
X-Gm-Gg: ASbGnctTlqA4shKcXj8kJx8SceavNbDgqeoHmAYmQpYDORHxWgGiBpHAlc0N+urLChg
	9rRwRmzlvk9wTYeSp6YPYq8IN6rlnqolMSalYGSTG98Qzd85fryqKbt+xw1MeryeQGvCyWjMnnP
	ICayWmegia0AJwkztNKCv9WChEtyDiba0IhArwpf187jDMN8hbwsTHrN3tIPEJMni0EW+fU2A3X
	QIUJmI9KnQX8PeC/PJQI5U4QExLDzC6v+8WLVHnS29oeqybbE3QxjuPved9EANcNmD5Bl2AX5y+
	B0Tf7OsomOAkr/ThRCqyqQtw9j7GwBNhe7/1XY5/PIH98VLoLld8G52oa9jsJV4u9EzjmC5U0jx
	wPakS7Zu7Ie0+00k3seMgdCw9d2o=
X-Google-Smtp-Source: AGHT+IF+bBUUF/z4WAINvTMEHGuMif5wEic6RxEk+UKvDoo5T5mh5wZQrz6qGBS+JbGWxPuXbLYPyA==
X-Received: by 2002:a05:620a:3723:b0:7c4:bca3:6372 with SMTP id af79cd13be357-7c612c36e30mr1561550085a.0.1743440774368;
        Mon, 31 Mar 2025 10:06:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76608f3sm524042985a.8.2025.03.31.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 10:06:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:06:11 -0400
From: Gregory Price <gourry@gourry.net>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, hannes@cmpxchg.org,
	chengming.zhou@linux.dev, sj@kernel.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	ying.huang@linux.alibaba.com, jonathan.cameron@huawei.com,
	dan.j.williams@intel.com, linux-cxl@vger.kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Subject: Re: [RFC PATCH 0/2] zswap: fix placement inversion in memory tiering
 systems
Message-ID: <Z-rLg7xSgu62qCfs@gourry-fedora-PF4VCD3F>
References: <20250329110230.2459730-1-nphamcs@gmail.com>
 <2759fa95d0071f3c5e33a9c6369f0d0bcecd76b7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2759fa95d0071f3c5e33a9c6369f0d0bcecd76b7@linux.dev>

On Sat, Mar 29, 2025 at 07:53:23PM +0000, Yosry Ahmed wrote:
> March 29, 2025 at 1:02 PM, "Nhat Pham" <nphamcs@gmail.com> wrote:
> 
> > Currently, systems with CXL-based memory tiering can encounter the
> > following inversion with zswap: the coldest pages demoted to the CXL
> > tier can return to the high tier when they are zswapped out,
> > creating memory pressure on the high tier.
> > This happens because zsmalloc, zswap's backend memory allocator, does
> > not enforce any memory policy. If the task reclaiming memory follows
> > the local-first policy for example, the memory requested for zswap can
> > be served by the upper tier, leading to the aformentioned inversion.
> > This RFC fixes this inversion by adding a new memory allocation mode
> > for zswap (exposed through a zswap sysfs knob), intended for
> > hosts with CXL, where the memory for the compressed object is requested
> > preferentially from the same node that the original page resides on.
> 
> I didn't look too closely, but why not just prefer the same node by default? Why is a knob needed?
> 

Bit of an open question: does this hurt zswap performance?

And of course the begged question: Does that matter?

Probably the answer is not really and no, but nice to have the knob for
testing.  I imagine we'd drop it with the RFC tag.

> Or maybe if there's a way to tell the "tier" of the node we can prefer to allocate from the same "tier"?

In almost every system, tier=node for any sane situation, though nodes
across sockets can end up lumped into the same tier - which maybe
doesn't matter for zswap but isn't useful for almost anything else.

But maybe there's an argument for adding new tier-policies.

:think: 

int memtier_get_node(enum memtier_policy, int nid);

enum memtier_policy {
    MEMTIER_SAME_TIER,     // get a different node from same tier
    MEMTIER_DEMOTE_ONE,    // demote one step
    MEMTIER_DEMOTE_FAR,    // demote one step away from swap
    MEMTIER_PROMOTE_ONE,   // promote one step
    MEMTIER_PROMOTE_LOCAL, // promote to local on topology
};

Might be worth investigating.  Just spitballing here.

The issue is really fallback allocations.  In most cases, we know what
we'd like to do, but when the system is under pressure the question is
what behavior do we want from these components.  I'd hesistate to make a
strong claim about whether zswap should/should not fall back to a
higher-tier node under system pressure without strong data.

~Gregory
