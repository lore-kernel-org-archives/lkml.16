Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D228D854
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935667; cv=none; b=iDnAW9MvxRzEL3zkmbHGmknGK0vHJBHiREMjFpYXbV8SB+zovX1Ag8gcTI2GkxeopWUo4b5Pe3G1qH0oEdrsf4YqT3FYT7Y2zYr1KTwmI84j+QLeFyVlXyGi9Ln7wUoG93rkdroje9RqOZjTYE0tRxavbYfpakHQqrt0ESOO+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935667; c=relaxed/simple;
	bh=Sj853nWirJZ6QksDX60oAkFJsOu2lKgUIMCdKND2jLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEQtbKfmKWROjUVlrJLhZ8i4AUT8IEbAA9GGxszrcCqTeBH9DC4B3xbX4r0haVbYVTc7ojWfmbjv7djERQGBoc1734sgzsWJ32PDHfKdBG/5Rc4PQF7BZ5ZH52nE3S00L97c9h2To7dxepBUpkl8fh+06jHAq9wjIHtLFrYb9JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pL0UsExS; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pL0UsExS"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0ad74483fso88022596d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747935661; x=1748540461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMhkBzyGTXMRs1OF9XX7AjgWmru1ajwfU7z5aXIlDss=;
        b=pL0UsExSp4eh/fFepZLUTLujyVU0626liwAKsS+pn6wDXNdemz0Qga7MtzDDogcVdG
         VQ1ZPokZkFm2hwUSnNwfX/BpMmAZQ/tJFiGfJ3JOawMtRGEqBpPVBUsfjJJiaE7Fm2Lu
         LDZAjqCTUDCX/XgxfudqWT1+aFxQAy0VXskgdbu1po92vAtp9KEKN4nt9y02T/fl5cTH
         Bn5ZunLXpDWLg1sToNKBnnwRCQNvCHB3j8wdbP2buCQ7iKuFUe2/SfLk2gleUOxKQAKJ
         m0+5nu34gUkDR5ROUo+Am1PCmYdDdMcfBBJY6obsP3WAhjf0PjzzoEudQfvjW4zx+lRS
         pwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935661; x=1748540461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMhkBzyGTXMRs1OF9XX7AjgWmru1ajwfU7z5aXIlDss=;
        b=anVw4emriqJUa3fBIhn6QEFGf/6zEBB2upCsbDId/ezYe2XK+5BJSqKqnjQ1KcvrhL
         z0xqeg/5yE1OcEQ0s1HQGFMr8xHhheEl1xg5T/tsm/0sZI/YqtP6ZK4cQ3/a8C+tJ/cj
         pFJsE6Op1moiKEUGUuGwkokfnZX8469aWsbnQ6QAb2mJlmkkh117HwHwsWi7Sf1riYju
         W5paKbA+qlOdVhl2e5/6d2w61zguVKVhUryEMa6FqWr9fPHhpjqtgh5VXRG87ZuVvh8O
         1JKRKFXTRvDYmYLfya0BVgsCkxOHnhwghGVe+MtoR3lUPDs40UGvWQ8HzVpVkOFbE/sb
         ZX7g==
X-Forwarded-Encrypted: i=1; AJvYcCUupmoYPw5S5oCbthN/Buxd+WD0Kbwk7+ZxeKnvbtWkuctseHtcjyH6aXzLP7jxNzk2/APY0xkbCuFUXY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylRNO/33r0TMfHGBye27WVH437w6LCq6OCXXGCJ1cz7MaXapv7
	oCd4h64grwO9GWKnZjOpmsnOUnsF3hTQfWa989xGf0cYAfTwevrCIPMRBdUbB7bjOPQ=
X-Gm-Gg: ASbGnctTAk1NISJy+WMR718H+e+xFFdbPVbfgN63TtSk3RfKXaPXtiJn18fFga1GSzf
	Re9g6RQg2/kfbjwTyIVhUG0PayHD4gLaTwIWQCQ5a3MBhSTiKATIBkacq85JO9SWKaGTwwhsDG8
	+IsGLqQDM9aaCJZbdBHnSrll7c3udWHwpOF2zR8/E4SrMXbeJGzThZjLgONmnE5ysZemaZTg+09
	mAa4E574rQOW7C6fQ89LhewhnxwW9GJy2t4SEyMzxUI+BYiUN4ywlh6yJDISKq+iHevBlf6iWr3
	1tWZsgfjPJCKBjm0Q6aDVm/9R7tSI9nYerKE1XcYUUsbpBiumTcwOosNrTl8IQo3tYwmp6EQF05
	oWs+Cdb4lTR9B4g0EAi8ejie9ifUl0xI=
X-Google-Smtp-Source: AGHT+IGOPh8mYT+pu5QrJ65CJWX1L4aK/pTlGD+97CE773zsGlMIhAiXIygW0qdlDm7sog2z09vBFg==
X-Received: by 2002:a05:6214:e85:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f8b082e9a0mr449807006d6.27.1747935661275;
        Thu, 22 May 2025 10:41:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b3f29120sm97782246d6.89.2025.05.22.10.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:00 -0700 (PDT)
Date: Thu, 22 May 2025 13:40:59 -0400
From: Gregory Price <gourry@gourry.net>
To: SeongJae Park <sj@kernel.org>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com, hannes@cmpxchg.org,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
Message-ID: <aC9hqyuqeGB457Cq@gourry-fedora-PF4VCD3F>
References: <aC6VIG7GPnqr3ug-@gourry-fedora-PF4VCD3F>
 <20250522163024.56592-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522163024.56592-1-sj@kernel.org>

On Thu, May 22, 2025 at 09:30:23AM -0700, SeongJae Park wrote:
> On Wed, 21 May 2025 23:08:16 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > 
> > It seems to me that DAMON might make use of the batch migration
> > interface, so if you need any changes or extensions, it might be good
> > for you (SJ) to take a look at that for us.
> 
> For batch migration interface, though, to be honest I don't find very clear
> DAMON's usage of it, since DAMON does region-based sort of batched migration.
> Again, I took only a glance on migration batching part and gonna take more time
> to the details.
> 

DAMON would identify a set of PFNs or Folios to migrate, at some point,
wouldn't it be beneficial to DAMON to simply re-use:

int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)

If not, then why?

That's why I mean by what would DAMON want out of such an interface.
Not the async part, but the underlying migration functions.

~Gregory
