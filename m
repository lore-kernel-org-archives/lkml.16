Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12F17A30B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743975254; cv=none; b=cCkZ1iylfkNgPsD9zedvKflCM6OboPDH4aluhQuD5VknQDvVCUt4G/AbtXX/Fs3UUsJGnevIe7EZM5AyreDOmHDmXABw0jUo5XpablmpDABZb4wKMHntaVVvTPvr6+pEk65EBG2czQocKBP+vLIXtWI9v1Elpga7M6EuJHJWoIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743975254; c=relaxed/simple;
	bh=1thCHGzusRG1ZlrUII7P1iJSUsOlzC1ZFkjlxRYfWZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fb0BpR2OQwiGhW5+proxl4QtgFb1ZML1wMt3j/iIkFkZdDYzJZc5/B0mvsRWpI6xodLesF4KnTX3JUsETor7BNSnCxlJZIm4n9FRrgs18C0IkaLu2kMRv3LCZYO/A8nohaOi8pdMOUAu3d8nXe1VhLrn6FGa2WCfTEPSmg+eYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFNDMnRu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFNDMnRu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2240aad70f2so295335ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743975252; x=1744580052; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPMncQ6TC7hw2oKsOjfoaHvrckjy1WxXt515TcLyfI=;
        b=MFNDMnRuyueVh6iVaVV4O3hMRKCYZWOjD/jUDThbaeOhTcEAK438Zbk/QUhGpFNSnG
         c7fryo3DSaA70vmFJZu+kF6PcwGST6wduQItZdgYqmim4qukZAJmeKXy1AFbuWplBbXS
         fBBONgcbBjq/3i0KMV09uGX2DGnOlkWCMcKQv8w6JYwfIQBGAlyqQURVgjD46Pt4+uL6
         opk1CBxusVxNBRiepx9p/NOXo6wrVoFmR9Ea9OD6/0bkK/JZgl3KoDQfUoZBNAr6gjpA
         Tq958V7a6R6sfbTCN+wTHBHhPegXbeEGcPc4f2r2J1ZE7zrt4mrM6BfHX8bBK38npmks
         atoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743975252; x=1744580052;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPMncQ6TC7hw2oKsOjfoaHvrckjy1WxXt515TcLyfI=;
        b=kr6kZxlUjaTgbcCRtZJDhweaqN9W6jq2l7nkqUfkHyvYBcN2Z2+2e5TIoCEdxGw1LG
         W6ydJpV1HX1FTidHC8GXyv7SJL6Huw9Eh4zWpuhHffBsq3bXpspU3iX1Y8Pkp9+fPT2z
         I6VPIyZYxyPWOJIi06uQZ4u453iIknKVTtcHXZUwuNfF/5vGxlSi4nrqY3oK/Irmu8bR
         3vjsM2A9JQK5UaxMDbz5nr76KOvD1x7otgWM3xVmlKYlGUDQzdJEyxaBKGDp89jqasTq
         gx/KaJ4Om6UT0SmZG3Wf2BzipJLcQ8orOVIy62Rt22XbGkTqd6UUbd7gamteSzY1NF/b
         X04g==
X-Forwarded-Encrypted: i=1; AJvYcCXzp60/HSTJg7+RGpxRuqwqC+P6SZZU3Sdcj/qADzvDmTzN9NFbUQHvZpZPLL+fu3BrtfLJqMz5tE0fBIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOltc73EezNQtCsJTqhJENo+25veQWNsFdPYHHtgUVyKa957J3
	usGn/vyYD34/9U1hZBhxZJgVq+GvkzsCTaNJp9XveJt7kZDprx+4ZDwZBwdqLi5pBXZnR08cMT0
	rmQ==
X-Gm-Gg: ASbGncu4frrSyoqGmdESqCWL17wosCs6i9aw+1EVPmafLSbu0dhK8V6qVsI5zSQFPrB
	qkjmOGp7KLun+XOWwHhx/l01Rk1lEA0zrkYjGvVWVtFChArWxZYFoJ9A3Wf9Y1CkjCjzU/8oUML
	66eH8sHZRwcA/RGRBrWBt5M1ZR84pn7Ifq+t9HAqL4ZHSSWWstkStBX2O5TCNUGDdoSrw2odq0i
	KvdpYM8Ei+wY4qHHJnvYJVmY79iAzfswPyy4S78pUvFFF2SJlZa+CCQxJzauL/C+EcYNlwD7Uyu
	zS0JSD9+tiCszHfrXIuoKWREn0HAXt3AnvssK5XwFJ/UOzI5te8Hvu+uiB8W+FIJ2ZvRtH0jXjH
	kDDhNZmk1VS7//l9O5eoH5vj2GBByMmHsqNRa
X-Google-Smtp-Source: AGHT+IHiRINMzxnjTrrhfoZBhhxSAkmIUO6KvhjzqPNAjX/wOWw4Id8jKa17QVFoK7hXxJREv7ldBA==
X-Received: by 2002:a17:902:d591:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-22a95daaff5mr3142305ad.0.1743975251735;
        Sun, 06 Apr 2025 14:34:11 -0700 (PDT)
Received: from [2a00:79e0:2eb0:8:2005:ca9c:736:e1f6] ([2a00:79e0:2eb0:8:2005:ca9c:736:e1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c27b3sm68020535ad.97.2025.04.06.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:34:10 -0700 (PDT)
Date: Sun, 6 Apr 2025 14:34:09 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Michal Hocko <mhocko@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
    Rik van Riel <riel@surriel.com>, Johannes Weiner <hannes@cmpxchg.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
    cgroups mailinglist <cgroups@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] memcg, oom: do not bypass oom killer for dying tasks
In-Reply-To: <20250402090117.130245-1-mhocko@kernel.org>
Message-ID: <ad2ce9e6-1651-8170-f944-1ba4ce4c14c9@google.com>
References: <20250402090117.130245-1-mhocko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Michal Hocko wrote:

> From: Michal Hocko <mhocko@suse.com>
> 
> 7775face2079 ("memcg: killed threads should not invoke memcg OOM killer") has added
> a bypass of the oom killer path for dying threads because a very
> specific workload (described in the changelog) could hit "no killable
> tasks" path. This itself is not fatal condition but it could be annoying
> if this was a common case.
> 
> On the other hand the bypass has some issues on its own. Without
> triggering oom killer we won't be able to trigger async oom reclaim
> (oom_reaper) which can operate on killed tasks as well as long as they
> still have their mm available. This could be the case during futex
> cleanup when the memory as pointed out by Johannes in [1]. The said case
> is still not fully understood but let's drop this bypass that was mostly
> driven by an artificial workload and allow dying tasks to go into oom
> path. This will make the code easier to reason about and also help
> corner cases where oom_reaper could help to release memory.
> 
> [1] https://lore.kernel.org/all/20241212183012.GB1026@cmpxchg.org/T/#u
> 
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: David Rientjes <rientjes@google.com>
