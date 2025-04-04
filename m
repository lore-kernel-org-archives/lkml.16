Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A64B67A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731192; cv=none; b=Xhao0FHdnP3pJRAFHhX1yow0muVAdNfY5W5ATVqYT/ZEr3KOEqHtHlrHR6EyfHNB5ffqKx4d9uMshH54DfnBn0Woj2FQSh4BThS8siAmePx66GK1FNadVpNrzVGg90PoLF1udc7+upWSDZsdoIsQh7WrbIABuOiyxW8kxqcMRio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731192; c=relaxed/simple;
	bh=UxMtqyCHNIAJZcjeYSkkhyfY9lfBcLHZCTGQmz16iws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhiEVhl170CQEJCG8twUBt18pj8AYzWCrBJ1vQmfnBb73a3DvU+wZjzbENCUWmYs1SdNU7ccY8h6lo7CHp3XTpmTN+gg9cHViRG9y6Qx/oHMRiEKFPqUF4KkNJryUkU+CrxS1mQ3FeoGvR64P7nHZRBwdqWX1IvDHMFBphyb7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hnaEbfoU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnaEbfoU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso1675771b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743731190; x=1744335990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BH2aHcExBTMRqIth3acThTGZnzhH8VgR2gO8iFkm1uA=;
        b=hnaEbfoU1Xi1hd8ASxXoCJ4De2CLzUWZf24iJyZWCvwv+V6hc4A1ih+7IIFif6L2lf
         anJcjpvrFHqJOyqsnFtvYNC3NAFkcjc+My7uOFDLUaThCvh+/bfCt6Hgh7ZhacroyyoM
         chNqc8ESEkHqTWsy8Uof8RnhXv+HXhmqGOMh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731190; x=1744335990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH2aHcExBTMRqIth3acThTGZnzhH8VgR2gO8iFkm1uA=;
        b=GMZQsV3x+8sadkmmnNVkRvjJ0I7swG9Svi7vavkXB2Sq5c0hgKEQP1Fxl1AY8UUVPV
         oFrpT2aWGihF8NcMvKQ0DWZ2lz+VyNYi2mIxejlSNNwwnkezkAclR8j60jIMZP+Zm0So
         P0SqkhoMpYZP682CMx1QPyqKkikXmUHP4qoDPZ5cKp74VHfM2LvT4zgxmwxvSxp4J2F3
         YrVmtLN1aer1D1gixuyoQrSaCG1GA1X0lWU2Drkv/uNmpKBWIPaXJXDI3d8qnprJI/9b
         mSqU07lyKunvaVuK6GHPjrwKACg1BHZIvb+rc1jRBDBwvEW/dSuRAIK34iKi0GC7qC18
         9VCA==
X-Forwarded-Encrypted: i=1; AJvYcCWDA5HVINU8E1CY1kM+qL8Cf0UEzT5TNphuiqzdkxyijBTZ5hDGKdsDjOJOarMql7Bs5kuar/K8gcj8J7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKORxzfFsmYfIGFKps09t5/R97PSw/9E8GoQ7na7KcESJWXQD
	tss2/YONeG8WaE3ILbtK+2P0nqSUKjhIDBUnYO6O6gNZreJ9vG51MS93x0OIdMvapx0B7rGu+8w
	=
X-Gm-Gg: ASbGncsv3OGUReh5YeuQxy4LV0f1lesefXzjnAIWgcReFufS9IaFZQssV1RO3KeZybF
	j8yNsRpXKLiyXUwmgJyFkBPucKSyQMy6oHcUmFPggnGgXs//etQQj/+ljqtnTNxTtRd5lO0gKxs
	vsiTmOkX58K2VYdRis3vNdu1znjQFC+Iu1/g816DVEcTuGjvZKPTlSX9yy3pgd2Gh22vOyyZkUp
	4Qeq4FwIRmM0HDVgu14HNp2R/WocnPP9zQlnjZ8T8cF+glwLPvFX/Kjg8SN6+rNQL/o/nStY1Cw
	/376ImxgWCyvCnjxb8XRt93pKHLAmzn690s486Am5rbfYWsZ
X-Google-Smtp-Source: AGHT+IE5o5PMSuPfCnveajftPVKH7mApiMqge4MN32MhokwYc3lZTgKDDqHpRmd43thjUiZuif3aDg==
X-Received: by 2002:a05:6a00:398d:b0:736:34ca:deee with SMTP id d2e1a72fcca58-739e492f5b6mr2432968b3a.7.1743731190509;
        Thu, 03 Apr 2025 18:46:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:addc:e770:41f7:fb85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97f3719sm2199429b3a.71.2025.04.03.18.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:46:30 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:46:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, senozhatsky@chromium.org, 
	rppt@kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, david@ixit.cz, Minchan Kim <minchan@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Message-ID: <fqj732chhrffec5hrvg5f7i5hqidgpdetldolyubj25jczq7ec@wj4bwu7psbwh>
References: <CAJD7tka6XRyzYndRNEFZmi0Zj4DD2KnVzt=vMGhfF4iN2B4VKw@mail.gmail.com>
 <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
 <CAKEwX=Na6kgGLsnknkfsc75hk-Q690z0J9rh=S=BmK2qjVU3rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=Na6kgGLsnknkfsc75hk-Q690z0J9rh=S=BmK2qjVU3rw@mail.gmail.com>

On (25/04/03 13:38), Nhat Pham wrote:
> > Ultimately the goal is to prevent an incompressible page from hoarding the
> > compression algorithm on multiple reclaim attempts, but if we are spending
> > more time by allocating new pages... maybe this isn't the correct approach :(
> 
> Hmmm, IIUC this problem also exists with zram, since zram allocates a
> PAGE_SIZE sized buffer to hold the original page's content. I will
> note though that zram seems to favor these kinds of pages for
> writeback :) Maybe this is why...?

zram is a generic block device, it must store whatever comes in,
compressible or incompressible.  E.g. when we have, say, ext4
running atop of the zram device we cannot reject page stores.

And you are right, when we use zram for swap, there is some benefit
in storing incompressible pages.  First, those pages are candidates
for zram writeback, which achieves the goal of removing the page from
RAM after all, we give up on the incompressible page reclamation with
"return it back to LRU" approach.  Second, on some zram setups we do
re-compression (with a slower and more efficient algorithm) and in
certain number of cases what is incompressible with the primary (fast)
algorithm is compressible with the secondary algorithm.
