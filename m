Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF061494C2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435123; cv=none; b=WmOXsFPkZi6fqBI5YorGWgQoF/Q5hNFaeyZ9WzVbJ4acOW9zi/iFT6zBnu2/UxLw2/rxUqzLduNIrGSiKlug/Y6acuEoJoE2CL99d7CAknDtxt71/3LKJ8Jk67mXJ+b+PTWoSxeVQNK++Eot8CpMc0hjs6lWgI08cBYMv2Zi82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435123; c=relaxed/simple;
	bh=HqH7e82HFOn8c9Wpi45EOHV+4J6RuYz9jpwePPr1yqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aojlnQUCNVQ8xNgc2BqbD9khvE3fizh+sYWnD8s1kpf/SMdLAtwi/UtZBoUq32pyJd9MVcK45ja2qWbYFyuwt/xB0uea/9oLZtZLp4OST9fq4zDwlK/lBKVGIVg5gZ2k9DoHNhf+YvJCeD6NEwEL8GScHZ5MNBS/Ue9h2BduceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7YqBlgK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7YqBlgK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4492378f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748435120; x=1749039920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gx27Ka76ChtB2rd8/90IbtQhwxpnww4n1RM1ipSXbgM=;
        b=L7YqBlgKg7ey+FdDeI7UcAJ/3MSqcByBBRl9oVSJLxL4mchl0B2Lg6HOD26U8aFUez
         dLbhDQp+5Yi4V2iDlAZ2hVlRnrvh7nVkYqNvLZeOtmFRcv86O8+M9MVBQxmojt/isGxt
         Gq+nAybFiuzev91mGy/ELDL87jmlyl6vWNOEwrriMa7k8/lAbqUsCOLQzB8aizFiDE/G
         NAuTtMP8Tv0AJrlOEEaaj6LSXmEDsJpxZ+OwHwml6s9vJvgPkKF3P/cpdOygnojrob7D
         VAcXFx5epcZ9S/IWx5h2Q/4TEcpwtTLzkZ/6gn6KJaDerILJil8LHGe2mScgQKzzv2IS
         QB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435120; x=1749039920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx27Ka76ChtB2rd8/90IbtQhwxpnww4n1RM1ipSXbgM=;
        b=UNs//YeTnbGnHHM3CaYYcXuELXWzkHWbySIV5tj1VHSxyIISB56t5G9R+1cVJgkzwE
         8Qj9PSfHazKierKr3y48dyjvpNcjrUbZwcQO0BnmfzhhNT1nUhShzOhOFZFo7ZnEgsJQ
         NdqhJlv7Z2kph3Ey26ySdv2xKG6C6QU6ub1F1jfWjHpohETDQKCwc+xRmoYdlM8ngHvd
         p7m9g4FAFdpvm3wwjzui4IFZQDXsmv1fvlU99ZqY9BR1XLwvAvDkGk1Ce7e8YxdT+kbo
         SR30XxHLmEqfOQrQ2CsZhjVprvvcYgPDNT1XHZxfLN7iwb6yKxf0TrHLIr5Ac5zxrXyN
         PGLg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Y52ykKkzzB3pEbNVWpPtZponLYu7b0Hr06sRezYgPzJALL9TQL5bF6fiwpI9xwDV6GNYcLfe+S5lXtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIdngjrHQxHx3oDNMpBY+0W3QeEJFMyAOmdxSAc5VEbVfZqYz
	Nbx/es69UZqBJ/okB1rrxf2Vkh4l3xPtnQqIcALwmYgzDcF7vMyxkFED
X-Gm-Gg: ASbGncsC/tPE6YMj+GJ2bEwf2MYt2ok0r2jnxWn7M9pmfWSpV+iFBPHPqq+jS1mZYqP
	C/YMMmlnnypnP1Zc5a7smxvDnmYccg/g81PBBOa9zj1HQtqmaUvpnrP/p5OKw6OKRCwHR2ajPR6
	FeQpGpmDuZk3+361EaUj6Uwk5zERUZ0fZxe16T2Pnh+U2kyYvvoKtsWdlZXtLpRCFl4tIB5OOI9
	tgfMGuI/DsK+3bKUBXYPApfMnVbhoG06KOcd42SQoQdBBnIZ531jJKzDSeR069OSCWAkLntcx70
	BNPCLnMrInfSp4ztzMjOv4yN4tmC+cuVgB46A8vODmlqxfpv2Ms=
X-Google-Smtp-Source: AGHT+IECMjwbFuOI/6hxsWepZz+pzUbSZ+x3gZlMFBHR5U0NEq3cHEZ9XAI8fsatRidm2mFZVAYgbg==
X-Received: by 2002:a05:6000:26d0:b0:3a4:e502:81b8 with SMTP id ffacd0b85a97d-3a4e5028508mr3838397f8f.43.1748435119720;
        Wed, 28 May 2025 05:25:19 -0700 (PDT)
Received: from ed.ac.uk ([2001:630:3c1:90:97e6:f326:b9e:1a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac8f128sm1368680f8f.60.2025.05.28.05.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:25:19 -0700 (PDT)
Date: Wed, 28 May 2025 13:25:13 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
	mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
	riel@surriel.com, rientjes@google.com, sj@kernel.org,
	weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Message-ID: <20250528122513.4rxzkia7lge7du5p@ed.ac.uk>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
 <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
 <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
 <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
 <dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
 <94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com>

On Mon, May 26, 2025 at 10:20:39AM -0400, Zi Yan wrote:
> On 26 May 2025, at 5:29, David Hildenbrand wrote:
> > PFN scanning can be faster than walking lists, but I suspect it depends on how many pages there really are to be migrated ... and some other factors :)
> 
> Yes. LRU list is good since it restricts the scanning range, but PFN scanning
> itself does not have it. PFN scanning with some filter mechanism might work
> and that filter mechanism is a way of marking to-be-migrated pages. Of course,
> a quick re-evaluation of the to-be-migrated pages right before a migration
> would avoid unnecessary work like we discussed above.

PFN scanning could be faster because of prefetching, but it pollutes the
caches, which may not be nice to the application running on that cpu
core before we transitioned to kernel space.

-- 
~karim
