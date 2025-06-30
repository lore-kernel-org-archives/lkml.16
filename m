Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62A28C84D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324512; cv=none; b=ADMJGbYj7+viIO6x5W+v2kgb07jSpJWDka0y9M+c5Z1z0ma3ejTzb3hpDRq1i7enBZDk40sl4/tBYzIIt/m9T1ao8JimZbtvNIH9i+xfdNW5dV3I2a7vZivpV39PjTI/u90plhntaCjDBrGtg8/YWpQiImIjZmO100bTJ7KtP+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324512; c=relaxed/simple;
	bh=Tty0qrvMwYTCfMPtmDhnbSDXZzzQiNA90N1yyqbo/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvth/lWuayj4C7L+JM65O8INcum75KRM/p5s2WoFt1Xd5ob4Qj/WVnH8N7pDX1QHaRRNY+aY2JRlIipb5ovh4IERsiFtmCsaiX3UXrrnmCwrvfwdnYl2P9/WPp3f3xFC/0jB7NH2Ev4TXlcyVCrQh3lT6bj+N80zr7idWHwBKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfimQ5HX; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfimQ5HX"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81f311a86fso3912673276.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324510; x=1751929310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd/NZyP4j5CIAg7Amb14AGL2U5qa5YAKuUp//LRpLKU=;
        b=RfimQ5HXV772HGrw860tc4gkRzxqaFi10Mw6Y6S0au0VjoVQYCpbvYl3MypZ2gp0zZ
         KLJAtVqYuaGu23URjrse15aWLG+WygEZavbHzTqSjfsMTOvWVbrNKmtkufccUkus2sET
         kcao2riUpcV889yLxIZflZEKBWz2OXLB3Y2akaSykWTsLP+smuYq362VdZGsEEbPH/5v
         qS9SMxH8B2USJZ9l2kQV0W9NT5tFKWXeR1DloY0qKRPQo4uR1P6CpkJwJG3CDMCIRH8X
         zF3hMO3XL3HhQpvAWX0KWR+Yofpv9FyiQEjjt7HoQYkDEEqnTjj9gbGjgsl4Clxxoit5
         t++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324510; x=1751929310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd/NZyP4j5CIAg7Amb14AGL2U5qa5YAKuUp//LRpLKU=;
        b=ADycrdHIFGAv3g6uZbVXU1epPacf4qZvtVa+CaQAPrerNOHBjrjGqrzsG2ba4OKv//
         uIL7pu70e4KduHTg1vLrDLABbxRb1yg3PkqaApp8OkIClksonecLocbzbg9LQVuNiSNL
         NxDdN6/5Plj/1mWBySNwywz+MV+7rR6EyDjxY11EYxDj7yWmvHVmEBFkdbsAW0Ii4nOM
         5j+BFtiPNX0+fHrOPrm/PwwuBb4Vb9fmfiFWs3HKrWqx2fvPSC8Nh1yp8dzW/hVabQNf
         j0/cGTOS889eo17GKb4fJzw3apmGnmWb4X1qIiBMtg3D6FYYEQfNmqsVrBynncDFDyke
         U2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUL9KGTQMvNGN5ZAL9yjkuR/MIDra5NaLQcWoPs86cTG2vNwodCxvHWY7lZVHABe6negjaNtUCyWm+H2nI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AzhaKst1JQgFNta+F0t7ZR8T3B29Dfyyl7U7rWPM2Bs4BjvL
	9mEYAUd8niEbnAnxmC61IKcULAUa4xE4gBYhRqsuhrIqIru0PU3+iCHC
X-Gm-Gg: ASbGnculSR4x4frBqwKxR7h/C/9lF8wb5GsakNp7xFBbdk+vPmmRS9+peDi2XwsfCET
	UqGIkVQQqDeJGHR+nuoahsCC3M3fDVMFyf9Hi96T9PhKBi125mnaQVR3Uk7P1wIpzVC3EhCSmcQ
	L/Oo+r/+9n6KU8tADQ/4Jce90MQzimpgjAnUdFE0yVO++G97oi567n3kO+Aiy90P36XqIDbdd/j
	Y4DfsDNlzBfbqoytErEIXPAyavZnzYIYfQotg/74ozq+1/E7qY7rbURpjVQp7EoN2K0gphz35LB
	qDraYMgvshJgLWVbbz9zlBD3dujDsVgb80D83pt702zIVOaeHAddKcd/WclHqg==
X-Google-Smtp-Source: AGHT+IFpfRCMEe7rPVfxOs6jnHFhnNRIF9xkxBkqGqTqtf6voR/zjxDyFUksRp8lfHUxGj97L5OKiA==
X-Received: by 2002:a05:690c:6601:b0:70d:ecdd:9bd1 with SMTP id 00721157ae682-715171abbc5mr204846657b3.24.1751324509568;
        Mon, 30 Jun 2025 16:01:49 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:5f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cc7f10sm17386857b3.114.2025.06.30.16.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:01:49 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Bakker <kees@ijzerbout.nl>,
	Gregory Price <gourry@gourry.net>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk in weighted interleave
Date: Mon, 30 Jun 2025 16:01:47 -0700
Message-ID: <20250630230147.2280374-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250630153501.64160f386faa541c93344e48@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 30 Jun 2025 15:35:01 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 30 Jun 2025 13:21:14 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> 
> > > This is a goto into the middle of a for-loop.
> > > What do you think is going to happen at the end of that loop?
> > > 
> > > I think (only tested with a small C program) it will go to the start of
> > > the loop, do the i++, check i<nnodes, and possibly do the loop again.
> > > Variable i is uninitialized at that point. In the loop it hits several
> > > uninitialized variables.
> > 
> > >From what I can see from my code, I think the only the goto statement leads
> > to a second iteration of the for loop is if allocation fails.
> > But otherwise, it should be ok since we always hit
> > 
> > if (total_allocated == nr_pages)
> > 	break;
> > 
> > within the loop. For the branch that takes the goto, we set
> > node_pages = rem_pages, then jump to the label and allocate.
> > So nr_allocated = node_pages, and total_allocated = 0 + nr_allocated
> > so total_allocated = node_pages
> > 
> > total_allocated == node_pages == rem_pages == nr_pages, so we will break. Phew!
> > 
> > To cover the case where allocation fails, I think we should be breaking
> > anyways, so I can definitely add a new check for this.
> 
> I do agree, that goto is a "goto too far".  That we can do a thing
> doesn't mean we should do it!

Haha : -)

> > > Even if this is legal C code, it is pretty obscure.
> > 
> > I agree that it not very clean. I did this to reduce the amount of repeated
> > code there is. Even if this code works, it could definitely be written
> > better to make it more readable and maintainable. As I noted in my second
> > response to Gregory, I'm not planning on pursuing this version anymore,
> > so if I decide to send a second version, I'll keep this in mind.
> 
> Cool, I'll drop this version from mm-unstable.

Sounds good Andrew, thank you always for all of your help!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
