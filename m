Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B219CD17
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745754374; cv=none; b=FfeEgdzUaBgmiU11hKTqq3XmVnVnqBD9ud2DILS7puy504nt0mxstP6uustXx4JrB6PXXThVWQb9kNkXx6TUDxoG7NLsk7/GjigQJUfA759Oshm6i0/qmLkS/6HkZRhv7Fd2Ts3R+F/yoOgjYSolDMDguFYhrkNYXfiLv6EpCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745754374; c=relaxed/simple;
	bh=GVctOdu9pd1Tstg7D7UihQBXqtIW/DBOfarRRGN6PSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCwstxKjWlv6hafdtgfYqVUIs47vm6M1ChPlhxmjY/2Wwf/9R/GBlBSXONzOny8rIm0emSz+gK9wqKr+f8mzWeLk/k4VZCMc2/2LyVQq67wc+X9m3bO0Zj8YPRHx4uD5UunDkqNTxShwJZi9PFJ/WkoGBe7V0I3tmAJbUf7B31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=RdjKIPch; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="RdjKIPch"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0ad74483fso44403746d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1745754371; x=1746359171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZGJbKlltLESsmy2RtQuwiQRyRDouUOJMZvq+iV0S+c=;
        b=RdjKIPchcnhZ7A7je/Inq2yWc0Ofon2ElA6dvrqZiBNtN1qaqj58MhmEJVlot5qZmu
         Qq/Z7BWBibl32V8eqeq8NEjP3PQtlDEFgA8K3LC1oH5y6uC4BoGQb6NYctRg7ElL5XnP
         lDjT3+/AfIQw1G/lqXMDyj7/1rDcWYlYIkhdrV9SrOSgOOei0rlDxfS349N7SIVS3ZsQ
         l6TkQAdbXelF6sSFEhI+v/q8OkPA3SS3Yj2TROacp+dVY1qK7qupN3LGwhagUuOY45Wr
         Zi5u9HstpSjYroc93T7vJ7FmQg07Aw2ltn3L20vwsVYcZgmOo+3CtdQxKwpnyva5MROz
         G7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745754371; x=1746359171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZGJbKlltLESsmy2RtQuwiQRyRDouUOJMZvq+iV0S+c=;
        b=FKcUVdK+htmuNBtzVYZSH9G+ajY3TpK+E9TokNMkEg9KdTHerFiC914FG54+/Npj7B
         8YJTGxA/4TFjtswdIc4B/8QAl2Ivdpje/3BK/NHwTkyeuNt34BBVOQpcBk/HERgiBQzZ
         h6sIiMsNAyicLfFZKWFSMwdleaeHea1IOXCHUgNf5DVmjEYFeKslC7QitQs1VCpc/AR9
         y6kyj+fS6zlaBkvoT5bPJd26UaONgsKQ8sgoz85hcn/efGcTT9854oM8tRWuBtsWzWc/
         qS1JqOFE5Jv42E6O2r48XN9WaNSItabQzHskYw6fW5jcJvW1TJSORTDROWbLnJmTX+If
         WScA==
X-Forwarded-Encrypted: i=1; AJvYcCXwwaFW4X5KvO3nbFUUEZJPRV+7mBmLaAdTJvbakXsz3KbqJ/lcGpNFMOwtxWl7igBTATAhLPCokTsAO+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQd+3vnzspEF85hlOz9vuxfmpYjvqkIKq0CCLu830PRgr6WRyO
	qW/3C+iTMXN0my6pjJfDoqav8qfmSTPIDJnL1pIcuDZZJYypUR7iYViyW3T60UA=
X-Gm-Gg: ASbGncsj19GpTL0duJJkgEbBIHoyrTe552RuxCfMAecptAbF7J5odxY1vAdJ7sowJh8
	FsYNzHytwoq5gns1WHU7XMhbq/iGPoWUtLQ9vEIGhD7R/8hytkYac2Hzgk9JsNHl3hbQeuiDLZn
	dPDLlTq8B3jDN0L19U4TKkRtVx32DlNU3aMU0ml1lHLpB5GV2be0bN79qA5CDGm9dSoYE/RjVky
	EZh8eNydjsC723ZCexDInlyR8mLGBP4qTthCpcwL4KuiswqgnaxLd2A55XEJ1pldIWTdX9PR0Sp
	t/8NkSCDE0aB9bb4yEstL7VrvNuTmoW32/kGR0Q=
X-Google-Smtp-Source: AGHT+IGYlNv9jjm589wH0WvcGrTx5hwBX5PzvIp+I5YJ3ZPlUly+7OZNNemuhxWqi75Nw+gnuzcHFw==
X-Received: by 2002:a05:6214:2aab:b0:6e4:4331:aae0 with SMTP id 6a1803df08f44-6f4cb9ba3a9mr120420376d6.1.1745754371307;
        Sun, 27 Apr 2025 04:46:11 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4c0aaf98dsm43731706d6.108.2025.04.27.04.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:46:10 -0700 (PDT)
Date: Sun, 27 Apr 2025 07:46:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Huan Yang <link@vivo.com>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Francesco Valla <francesco@valla.it>,
	Raul E Rangel <rrangel@chromium.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	KP Singh <kpsingh@kernel.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Boqun Feng <boqun.feng@gmail.com>, opensource.kernel@vivo.com
Subject: Re: [PATCH v3 1/3] mm/memcg: move mem_cgroup_init() ahead of
 cgroup_init()
Message-ID: <20250427114609.GA116315@cmpxchg.org>
References: <20250425031935.76411-1-link@vivo.com>
 <20250425031935.76411-2-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425031935.76411-2-link@vivo.com>

On Fri, Apr 25, 2025 at 11:19:23AM +0800, Huan Yang wrote:
> When cgroup_init() creates root_mem_cgroup through css_alloc callback,
> some critical resources might not be fully initialized, forcing later
> operations to perform conditional checks for resource availability.
> 
> This patch move mem_cgroup_init() to address the init order, it invoke
> before cgroup_init, so, compare to subsys_initcall, it can use to prepare
> some key resources before root_mem_cgroup alloc.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
