Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D61A315A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746024559; cv=none; b=ivsF00MDXrBbP5BTzWWx1B6ORO5xxbqKSTOhIclVbftnVH7GrAvlpRWJRN9gc3nYjhSugwF+6NowPUnxH4RDvNx15WoW+Paw8NKzMR8535ksl0oaKUWj9HozLr+Gn1FjMxvFKpW+5zfVUoxDCuz4nF6VYujEfV95tSGaZwxwLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746024559; c=relaxed/simple;
	bh=hqY/EnS0g1ASfdxS5QE/RWWkZtTu8k1TkzIqE50G7No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YimEm/ObkqVQj9joLUK9SymaLrqKx3nvxgbs+pQxGS6vf68WBnHJY8VsmB7azNd9nQVyo2be5U2t8AZMzvIHlEeL33aSUKBkbUa82OkkRDifW6x5qPWQXAD/wOApXj4kU0lBpWWJJZwqhcY8r/M1yfRwqFu/3Mz5OzjmCAsdFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=fYa9NHW/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="fYa9NHW/"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5b2472969so789809885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746024555; x=1746629355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAQavjtHywDtkfWDi7d5KrAtXnOwl53XsLV1VpcfMts=;
        b=fYa9NHW/i1bKF2r9/oGMgPR0Gfz6RLsLLQj5bLqH30XswVAB6XTWX0ZKE1RwuM7SpG
         xcHKMaTyvIxaFqPs8E8AsrTXtU7ybe8XaiOTvj4bkxpxvTojWQ+l2BKbKXTtOkjVQqno
         nZ/ujhSc1GHKjHFogw89scfuvY2xEhroKwbor0VufDFJut8lD7abyXXuNLiKtAb7HBs6
         11ncQAXVpgipapBkTE3KdHbxq82+CVZUN/J9mDC6CcDHM4w30CHpwaR+8424cQlpEbVh
         CkzTd18fDJbNJWQlFD0Plkyn0Ay66ZM1mr+8pUOcp44og0QRzX5TEgytLx0lh0IpX8l5
         7mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746024555; x=1746629355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAQavjtHywDtkfWDi7d5KrAtXnOwl53XsLV1VpcfMts=;
        b=h7ayi9GiAz7QPFOHvBS37Vd4QLesfWEDk9ZL9bbQhgqP5GAepU6P2wPU/JMpGB3YKu
         x/8iybHE5qIHpYqTRoPpiv5QUIkmHtP/0Io0YTdfGGRyEJA5R/q2SfOo8MbKs1j1kkHx
         Z4peTKKQF7IAsOygrv3v+ehvgsBhD3KaN9zPMBmKq8gLDXIFjK2irK6QUsoHXEteplTX
         CBSphXKIQldZdqNoG2wG3sovWedrddV0W3ll5pyz15MkI265MD7KpUqxPHNS0A9HpMMt
         fQ+DSVvpobcej9aSBXmQbZX6zK1Z530JAi+l/uG3Sk2NkxxRHT/9IMcpWMTTwUKytncn
         e3kA==
X-Forwarded-Encrypted: i=1; AJvYcCVUMbQgRX3luBQC1EhtXLc41iimjTS2b61oeyFDkmQtOIvWRcSbhFV5vSzPYA4dSg2SIT5UXza057ku6TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBU868yOiPLG5Z7tak0Emac5ikwg/ZV4r4tR4gq0wIJ7NqbD/
	fkD/ObKVUrD1o5mi3cnr6NDdU16Qr0Kpd7Kunq7IiiLitZ7qN7zyhChxKcxPbZY=
X-Gm-Gg: ASbGncscReInjP6zAFxEaSn0dWaWmWE5AfKqrTwdlynAmmv1cHJrX9I8jSIQFuY0KpI
	GilXmCrNb4okuEJPiuoDKRsYVIL1DoFlofIt/2EdWaTgxGLvO8ejnNl7TSy/50NA+z3Yc0asynm
	ky8aNycsl3Vzc4LRiPyN3tqfohWmiPvOZKAejrl8dnghDEWm70qzmjW287mrLHk46yWfGntCoGd
	3BY2BSwb0mecYLLL2acx23+r4gD1MOIWWv+i85hQbKOvnEZiDpJS07a8jlkG/xjCffK8aeeto5r
	a/DZT1N2HCXhtYjbXXOAcR7u6/C16lMLE1Fg8Ns=
X-Google-Smtp-Source: AGHT+IF/96hom3+JLrgXk+J7xCewYly0PcXOER+WWiY7E5OjDkUIEfEPnoq4AJrHoZ/ktBIx3YvJ0g==
X-Received: by 2002:a05:620a:4056:b0:7c3:c695:156 with SMTP id af79cd13be357-7cac761117dmr431803885a.16.1746024555355;
        Wed, 30 Apr 2025 07:49:15 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c965750a69sm656679585a.1.2025.04.30.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:49:14 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:49:10 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 08/28] mm: vmscan: refactor move_folios_to_lru()
Message-ID: <20250430144910.GB2020@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-9-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-9-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:12AM +0800, Muchun Song wrote:
> In a subsequent patch, we'll reparent the LRU folios. The folios that are
> moved to the appropriate LRU list can undergo reparenting during the
> move_folios_to_lru() process. Hence, it's incorrect for the caller to hold
> a lruvec lock. Instead, we should utilize the more general interface of
> folio_lruvec_relock_irq() to obtain the correct lruvec lock.
> 
> This patch involves only code refactoring and doesn't introduce any
> functional changes.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
