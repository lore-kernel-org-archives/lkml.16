Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144ED1D7995
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745343667; cv=none; b=m+xSs0hPZNzaupEkMismUU1GeggN/s5Dw24aR4TBslY5ZJoXthrqJ8/JWERsEzWyNCa04TBKlFghGndxp9VgvTQcb1480mfAobiRGeKrQK2YpOdmXfnymbtEnPg0MIzjxHwkeKsFFF/MlHRfeM4azDSpWg3cp1WvGZj9yCI4Yf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745343667; c=relaxed/simple;
	bh=sx+1yReHO+W8k5rUqkhkwfBciKZlCEEc04tBXhlIWQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHcUPiA7+Egt3hg3e8Vr/KCLry9dmq/uDuEXttmTLwXl75+QhQwT/mjcC4eP7AJ7hLpSeXrfVa1mR7bVh7VpwylCSgJpIp6ZvhnCCgGEhST9PAT6/LlKeg7IqX7tn+lLtssvxG1q4ss5RBREQ8vvTzHdfIIOFbXscCNfX719pxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=gGi1je5z; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="gGi1je5z"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c54f67db99so12406585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1745343664; x=1745948464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y86Jn/i/gOfC+tYxi13fILx4oUL1euxGqHwTbq1fZ+s=;
        b=gGi1je5zuwUFkZ2oBYqu8RQpeXIYC3bs0CQsKHxgLv2ajeITLh3wuyS1t7HH5xdMbp
         FZ8/QBgDrBuP3R8WnuXR6+4wNoHji9jZwQxZcKihCoFnkBwAlWHpQLnAAAVYhI4e7Ut3
         h+qZZlkdNOViLbbevv9uYeusVydabeIO5jw/4LBgxd43FRt4Wt6fOLWRoy++MsK/AnTv
         peiueoSFHw5plJvZgn7mfaqZ7ASCncdtldB5fZSt9I1DITDIHR24aSi0xZ0KvkhLTjIp
         1Bm/DCVs6QtnFko9jdARufuSGtw/ZpzwZPCtWw7aR/6LTbE7yHYXVVMYrkUfnXsh2TaN
         9vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745343664; x=1745948464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y86Jn/i/gOfC+tYxi13fILx4oUL1euxGqHwTbq1fZ+s=;
        b=wuaNDKDeBwaH4dUPl1r8+hxz/VPmmwCxlCHQQN2aHwldZxNhWfY9n6cHHAbDQyckeI
         58yVnhriMCovzxu9HL2BAaB7xdJvNbbBThreEqjQReQPkhB5KX+OVZfh1rg6BI7cUlnV
         LrNyi3vrylaslauUmq60wyi2oKhU804NjiBdlon7jStvWV6b19h2LDus2Xymnlfp/Ybx
         5afuOnB/SVYVnJ6Q5+6x+n3XXZLFY5MRZErysLWyW2U4GZJU0lOf4XXpFaGQJb5TmZF6
         0JaT4KgcQzgIQbTLtmLABSXjID0s8N5g5wRovhyaGuCGMV4Tf3RMY2xFoAMwQBlHiUjB
         dRiw==
X-Forwarded-Encrypted: i=1; AJvYcCWiKNqkfn4/nCSc5aXHe95sMfl78ZtYm7za7+LfdslhxXeBA5POUAy+0vAG/Q1S58GefdPoAnTXaJurYmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNdPO57YCHJkbKmE64+0vaZOeN9lr4dkUzw46CnS/9DGUiKBRR
	8ll7UitZPBXm8+W95HwVlc82ho9mwKnysIy2swbrW2232EgKROt+k6yBehhmCTc=
X-Gm-Gg: ASbGncuLQN5XONNLYrgfjpYQxksmD3RPpMudniMvobTuHRt6bsY5nYKNAQZU4rL2I2y
	NzTD8QikOle947bm20dg0nLL4Wq0UvsZm8RixFjtCdJMwvs1WwAtFca8iD4r19RdS7TufQ8SUlm
	x9hO5BxjWmmDVcQAm4REKEOuUyD/wLipzfsEOfeXaNJclu1Q4HymXy9xIx2rPrTk9WTfwYDe1fq
	Glapj6WUfCdHggb5V2TgxMIPZZObvEGjJkKUKovlxaLH44pZzhjwh0PzQrjsuF411YFWKr5T28K
	NQEAXrDtU5cpZRXa+56K3b13WcMfxJ9ys37hOHI=
X-Google-Smtp-Source: AGHT+IEN8+MrZpC1+kXZmyR3wN+NOc72lunYbPsIFQ9LMphGMyp510ZIpiR9wy3Isrz4BHUP8lx02w==
X-Received: by 2002:a05:620a:4256:b0:7c4:c38a:ca24 with SMTP id af79cd13be357-7c92827487emr2492780485a.1.1745343663928;
        Tue, 22 Apr 2025 10:41:03 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c925a8d484sm580566085a.31.2025.04.22.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:41:03 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:41:02 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	longman@redhat.com, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v4 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <20250422174102.GC1853@cmpxchg.org>
References: <20250422012616.1883287-1-gourry@gourry.net>
 <20250422012616.1883287-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422012616.1883287-3-gourry@gourry.net>

On Mon, Apr 21, 2025 at 09:26:15PM -0400, Gregory Price wrote:
> It is possible for a reclaimer to cause demotions of an lruvec belonging
> to a cgroup with cpuset.mems set to exclude some nodes. Attempt to apply
> this limitation based on the lruvec's memcg and prevent demotion.
> 
> Notably, this may still allow demotion of shared libraries or any memory
> first instantiated in another cgroup. This means cpusets still cannot
> cannot guarantee complete isolation when demotion is enabled, and the
> docs have been updated to reflect this.
> 
> This is useful for isolating workloads on a multi-tenant system from
> certain classes of memory more consistently - with the noted exceptions.
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Gregory Price <gourry@gourry.net>

With the rcu lock removal from the follow-up fixlet,

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
