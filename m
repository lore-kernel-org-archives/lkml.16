Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E5F21D5B6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738747; cv=none; b=sorP/vPAy3R0SIm63R2oNfH1N1YBH6TPWaIIm+sTbY5x0d84hvgCvwyH+Bmv/248IzIKFhxSeXliIJKOwiYIs8rxc3N8qn17/OY8+Lk+Ft5qQeFaUowVo38EFAlF4c95DOBKmLUgI99nyzh9hNEansoneAUf5hPd368j8n4hnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738747; c=relaxed/simple;
	bh=YhS+6KPuWVwLxVM7mzJLiWMqALq/dLhNIGvxHoCT1ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBlgop7d4JhV8Jv3fFabpOviIc2c/cIbOg0hJ7X5t5V9DQtQ+HiWDt1pPiOwGo7opURhDeivLfpfh/nFtGHZfhg7scoqPOG4MI25MlbZ8U6P3UiDSWayNorUWkMprCcDP3/AXTpUwN2kRwfCaUqTiDBLnSNA3FzFwEHo0HnD4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=C5eC9u/O; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="C5eC9u/O"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf99dd567so19440616d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746738744; x=1747343544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tU29vel0KvZfnj889e6ZUT0X+Nl6gYD+WNWpN7CwtWw=;
        b=C5eC9u/OiZ/Q52OQZODGsYjLDZsMri6vfxJC56kVzttxJuQzGr/cKvwVWM6WhW8O2V
         BC9uniRBzPMrp0WU+DqwVMqJSBKnrg8R7zhqrOP4fpJeGO1sCu6CsVGSzR8miA1HGM72
         KnSwlkMIy3ymaNdlanGynYalVqpqvKmQH8CRYnCqhC1DSk7Juzx5bJyOrEzq3Z2cfqpk
         ZTS0CJ0DEQ5qWwoBOvbV7L6vvfYlWHzWlkPwSYOacw9Z0SDSDv9yOYo0JKUzqvSwc+Gt
         OMHbzETQJF/s57qFlpG9Y0LPCLUR9JxKpbQ1Ow36VoaJ6Np7PLb3nqpdw3VgOaw/yY1P
         fzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738744; x=1747343544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU29vel0KvZfnj889e6ZUT0X+Nl6gYD+WNWpN7CwtWw=;
        b=d8fBE4Kvmf1gLQvC+LN+rslcWRN1cGXKFxD6PVNqGqH/0dm99MZzY2+bNMClFaZpBq
         KL3+s9Az33bQ9BAH1tHNQivE64bIC1Onr2XHiUhkxOewVPFX7s1dVifqV5trlUwFZngj
         qjv6Sz/1pI+AMSTCeqlbU6QQHE90ST202pxFOJIOQtBuzKNIWTbpEHGE6g+L0erbNL3p
         duf5tKGh68zLp1J5EOOfoNFpzOBy/of4VgIHgFt6tpI5ugORK9gILm0b2FEsFTsHAg7p
         b0o13rTiqhniHSC8N4+cAul4Ky5Rl3fLqFOIFK348nLJpCse64ywk0ru5LgYbjeasXdc
         mVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSNLWJT55r1F7hVCAj8RKQg6DUlnHNtCwncaf0+bU+mX1kVD/mqnxRuE/3NTDliLE/Tnme3CsCYio1CVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSLP8Kl629hFsFCPQ6UriHse+ZgCWOpxoZ4WCM+2tfJj5BjRm
	6aF/EPQmIx2OUw7ZX+WctSTVaNQ59Q5UFDVbmhFyYD1vqhM2Cxz1HX6+z9l69kg=
X-Gm-Gg: ASbGnctehkOJONlluZLeqL1PG2ZYf+6Bqsfn9jBWikRDK9+uVt61oCP7MoIM51xHg+r
	K4lpx7kscypr+KsXYD1DYaeC5ko/COewMXtWdDT7PgIgSEfgEataQCnejNE0Hca1bKenx2NT++9
	aNJTbxzCQzbZDo8pAQttlw0pOVaGyumNmcsIraDHFPL8xmngSKVtFbakEN8dPKuCnc/cHj7Og0H
	QixOTWp5DFO0ztb/bhaIpIUEcZj2Heajy/AELALvpGLe9/5VPFbmeON8YMrKtcFgKQYWgQZ5u2u
	EFnvVgFHz/UDHwScjAUOzkYISDNws+stV0DOw2M=
X-Google-Smtp-Source: AGHT+IGF7xbJ1qfim1/hVx542EP6l4+04BZ69FZBusfv5EEKbuSVBLbfUnAInKDdaqIaR5h5ugkrDw==
X-Received: by 2002:a05:6214:2588:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6f6e47f260fmr11641336d6.15.1746738744634;
        Thu, 08 May 2025 14:12:24 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39f4795sm4453586d6.30.2025.05.08.14.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:12:23 -0700 (PDT)
Date: Thu, 8 May 2025 17:12:23 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mm/page_isolation: remove migratetype from
 undo_isolate_page_range()
Message-ID: <20250508211223.GD323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-4-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211059.2211628-4-ziy@nvidia.com>

On Wed, May 07, 2025 at 05:10:58PM -0400, Zi Yan wrote:
> Since migratetype is no longer overwritten during pageblock isolation,
> undoing pageblock isolation no longer needs which migratetype to restore.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

The whole series is a great improvement.
