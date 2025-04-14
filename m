Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD82749C0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649250; cv=none; b=SsEenXAv+NcxR3SbdJQJajEX7FdfagAxbgl0wPjxhHIzO+LAnAlN89iSgkZ4dxq40UHN7pKIT64DsGgc31HuvmjvRe4xjJoeCeQxQ/OvypP1cI4lQzFbKbFUCHY5YbxqH0fvcarbmhap3nz8HXn66r7/HSMY4/OHmai0TMJwuV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649250; c=relaxed/simple;
	bh=C378C9Sed227nr/gwJbV0c7C3hVPbUh88wSNKGMT/4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnE3shiURR9wFGOvqXHfJTURy9qHlE+uhsbbQgXw/6NG7gofFBy52wol4fHcbgg5I2kmWrWh+sJniOjg+QGvECKSEhwWRK3e2syCTiooeHKyaKtqakvuSAONtE7QeM/ScIG0tTVK2OxpYl61Wy1G8bwuFvSgtaOp+V/FEUDidvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=BGqM1k8d; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="BGqM1k8d"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6eeb7589db4so53454836d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744649246; x=1745254046; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gvr1Eg7lK7Y8HhVqNwImZJnjSK1mbZPXBkM7KTJCKgE=;
        b=BGqM1k8duufmmTpB9Aay+GnUw9x/XNfdW/P8tWwDwL0kATYCCsUuF+YQ8MuWWFUXdM
         NIlc3Jsd2qBpzgZ8XHmlmoTwJTMcRl7T+bbKuGwLdf2UDKckMd4ANMhCujC8el/5mo5k
         fIBYcvY3gzrpZChPkBC1Qi11giuqovPUIyMyRTiqeWQFtLUdyslOBboWyMB4g/4uOM0t
         Rdg/THMpgSVuz1Ay47uKjFmOjL+lnvfg23Qfq0SFb+84eXOEnlkAiMC6ZDCyMS7WMifD
         JDus9nt2Af64f0OpJyElTCimbFPGAsgyxuUtJ8lMrGlmg8g/yGACMYQ34hifPsjCT5Jw
         EkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649246; x=1745254046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvr1Eg7lK7Y8HhVqNwImZJnjSK1mbZPXBkM7KTJCKgE=;
        b=wpmriAvM3H2wesKJmEivH4HUC65QwipiJXPvPBBLbEKA6PltCEHaprpE4+69pgls9b
         qzgpffPQLylpGfGlq4HIu2DVlw2JBtXPHZx3AbtY9LwtVV+580lcVyPGAXwEvWAmozNd
         JgV8BnZax6DGA6kmHnG9cX7Q4HVQQ/oDfQZAe3+Ms6FXszUtqjLTsOVjbRpnUAwAY/SI
         AQJSmdeDuha2W2tXxah0E/3tuU+XTWUXFCZe63xOn5dQHN1pP3AdpCxNHPg1/mMXuJ5k
         vszl6QQwviaZw84pfR2x8DUGOqrMzm75drk80eNEQO5GBBa7vS5IcBNRkIb1Lwhl5FM7
         Auzg==
X-Forwarded-Encrypted: i=1; AJvYcCX2nNZxp9qPkHpulszNboDqS1f2/C/uPoInH95I6hZPfk1E541vDJL6oFGIxy04hZ6qvubCAL9aySasArw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvX5J//a/8rB9bTfmF72tjKd2EW8TPhPOU67fgucnGGDHCEN2W
	tNtH2+8HkHjd7WrdpL9FHt/eRGnGL/KJX5wHN1VSgzIUjP3TBloXH1TrDGbWFyI=
X-Gm-Gg: ASbGncuY22KYdAPylJiuDTDlc5eHWTC/dg+Npnu1gwbL1Nnt1JXWNFPihCbRIYWDLbk
	B7uMmkUixu/55ErdoN7s/ls/O8g/Nx5Qh6otXe3+a0eMf+PqoxfsMeXCEdPUhE9g1ItJZFYpOdV
	kvybPtn9fC4WzQAUKfHPQSrjMEKycfDnOjf1ZqoWM5jCf+ueTuMXvC2lXxh9gKLO8pE8CEtUMwc
	zelv/oWwDcg8jeXlIZJOqJwHFMRj1m2YUx2oLAt0Q1jOaAcf7jjSWTkhEWF8R8+bur2Pe9PZfQQ
	9jDYRIwVTyI0oa2OEs7E99qohraslz6tM6QXtX7gdk1mhVhbbA==
X-Google-Smtp-Source: AGHT+IGyn19E6PStgkF0prqcjwzNPkKDdnhAlejJTPbm0jkoKGh1Or323otXTafl0CJ+s0xtuj6ZeQ==
X-Received: by 2002:ad4:5e8c:0:b0:6e8:f445:3578 with SMTP id 6a1803df08f44-6f230cc177emr218119656d6.2.1744649246264;
        Mon, 14 Apr 2025 09:47:26 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea106cesm85684596d6.103.2025.04.14.09.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:47:25 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:47:21 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Waiman Long <llong@redhat.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
Message-ID: <20250414164721.GA741145@cmpxchg.org>
References: <20250414021249.3232315-1-longman@redhat.com>
 <20250414021249.3232315-2-longman@redhat.com>
 <kwvo4y6xjojvjf47pzv3uk545c2xewkl36ddpgwznctunoqvkx@lpqzxszmmkmj>
 <6572da04-d6d6-4f5e-9f17-b22d5a94b9fa@redhat.com>
 <uaxa3qttqmaqxsphwukrxdbfrx6px7t4iytjdksuroqiu6w7in@75o4bigysttw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uaxa3qttqmaqxsphwukrxdbfrx6px7t4iytjdksuroqiu6w7in@75o4bigysttw>

On Mon, Apr 14, 2025 at 03:55:39PM +0200, Michal Koutný wrote:
> On Mon, Apr 14, 2025 at 09:15:57AM -0400, Waiman Long <llong@redhat.com> wrote:
> > I did see some low event in the no usage case because of the ">=" comparison
> > used in mem_cgroup_below_min().
> 
> Do you refer to A/B/E or A/B/F from the test?
> It's OK to see some events if there was non-zero usage initially.
> 
> Nevertheless, which situation this patch changes that is not handled by
> mem_cgroup_below_min() already?

It's not a functional change to the protection semantics or the
reclaim behavior.

The problem is if we go into low_reclaim and encounter an empty group,
we'll issue "low-protected group is being reclaimed" events, which is
kind of absurd (nothing will be reclaimed) and thus confusing to users
(I didn't even configure any protection!)

I suggested, instead of redefining the protection definitions for that
special case, to bypass all the checks and the scan count calculations
when we already know the group is empty and none of this applies.

https://lore.kernel.org/linux-mm/20250404181308.GA300138@cmpxchg.org/
