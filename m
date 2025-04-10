Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D004A284B22
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288683; cv=none; b=DNzTP7Z1SArhgkD1ioab0z50FFkYesp4pKVsMPa9U6gr00yhR4IhOoS93BvkJgbQHHDzaXohel/p3iiylIU1LpdwuYUudKiqbY2zZOOkL+xAP600yHXbqZj3VHkjXr/K+JoiMrxHXyLnuuWGEeLHG5Zq0meBi7Cmmt4X+/j98js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288683; c=relaxed/simple;
	bh=KDR1DTOJoPA5spgrGIsm6Y8dkDP/dvIskw+tyzOF4ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gXht4PTU0SCI7o9GRDe8WpQIP4DAys1Ers6ZCsPS4FRHsd4FPwvaHQK0nj12QcbK5QzCEkajX/vfyg7PZ0jKvVatvkXTHxTTxUBYC/CiPfSt6uR9t6pGnMS7+0k9DFYXGfq5c1dm33QWHjQK587NtzedIP+FWHatMHdXcpJIzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zG0isVEb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zG0isVEb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so4274625e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744288680; x=1744893480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueJ9D/uWYLPcpSQZDS2W9kWTYeSr9KuH7P7A0rcqzzk=;
        b=zG0isVEbQMfueieVCyBu2UOjnF7qhH0HPKoWPpvkggmfKofbgzG0aDWbq4qfikY7PX
         B7RtyrLft+fVcWkJ5B5jgcY0TZ9dPmjYd1dKh1uR1Q1yhJF1uSveWqTlLbd0YDMAMehQ
         fBsZ/9lrXPo9+tUHkwk8HhdtkybZYGz9IiMRNPnREoU7/TiMsH9lNrM8GwWTQrJ4E7C2
         KaOrJAgjOvqasrp4RDgISxCD8uAayd4R1/Cd8xB40n/EBgxv/2fyBzynrCvKKBMz9lLY
         55jAS0g2KqwE+GwNIUxy+KN/UK3BscccbsFRk9jbwposrqNTe/FZAd/Zi27wjNKAmp0+
         JkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288680; x=1744893480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueJ9D/uWYLPcpSQZDS2W9kWTYeSr9KuH7P7A0rcqzzk=;
        b=l7woUZlCGU705OaW1ytjsSCQ5HjTFtPMbsPIqIed5b3uYKEcb5A80g0jmPFtv77PSD
         UB8o7TRpFVEQojCojz+NBP7CtDRU48iaP8tS54p+rgYq5yyGvwd6o0ZBmLr/5hRdtSDv
         5BZPea+Ra6x1Pil3S+18BaHRa0SoqNXEtcv4d87uUZAAOzydOkzsm7H2QmFfaN+QTuFr
         2fJSoeTq6Vx0pwjMRdkWnafsJZ1lQuh+MwWDKDVZ15Zp3EuszVETuEGcSw3AqND4r8od
         KAcRwcctiwmzuC2BLhj4uBmvFmqioPjBz1x9GYXo6LdA30hJKbq7eR5yo5ULjW4wLq6o
         HXug==
X-Forwarded-Encrypted: i=1; AJvYcCWf2njdA3jXZB203CnGsozE87N4L26mV9od3BTk6+hVto0EMiZP6s2IwdMs53X4a18ximdOC3t5lVhO5jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8plH9wMkfSSUSj71DEGRHo9F+G+zsIrluguZoNltH7To0pMB3
	L157d+DJzWqyQ1IRA91OM1JY4QxTGbQDms7eHZyR7nxxQXwy7d4uGjrpHLw7x/3ZhClbmDHkcBK
	FRKbj7QZPpg==
X-Google-Smtp-Source: AGHT+IEg7mcjbdCYRVempPQhQObfFqsfDUHviFlES7EqAPGFgS+OQ2JKD1mbbO6MAY8vl/nP0uVJ3b1LYVUaZg==
X-Received: from wrom6.prod.google.com ([2002:adf:f386:0:b0:391:831:4d82])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2282:b0:39c:30d8:3290 with SMTP id ffacd0b85a97d-39d8f276007mr2441096f8f.7.1744288680297;
 Thu, 10 Apr 2025 05:38:00 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:37:58 +0000
In-Reply-To: <20250410090021.72296-4-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410090021.72296-3-vbabka@suse.cz> <20250410090021.72296-4-vbabka@suse.cz>
X-Mailer: aerc 0.20.0
Message-ID: <D92YQCM785D0.OVHMVHQFWF2L@google.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add MM subsection for the page allocator
From: Brendan Jackman <jackmanb@google.com>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, 
	<patches@lists.linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu Apr 10, 2025 at 9:00 AM UTC, Vlastimil Babka wrote:
> +MEMORY MANAGEMENT - PAGE ALLOCATOR
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Suren Baghdasaryan <surenb@google.com>
> +R:	Michal Hocko <mhocko@suse.com>
> +R:	Brendan Jackman <jackmanb@google.com>

Acked-by: Brendan Jackman <jackmanb@google.com>
