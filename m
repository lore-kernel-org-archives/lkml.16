Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A024025CC54
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734665; cv=none; b=qB/dL7RGqo6RXmCnBXUc9KjNZtUG/gUanJUm+p67Op06mFX66xQ3K6uwUbm8j3YkMmSRHl7fRltqQMHPmU+cBJJEcjtpd4hlSwUfZfHjbjiXr93nS9sy9gAIWy/5zbcd6vtdAQnrShlCLestpz3z10FBqgmTrxitZVLsdoxW4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734665; c=relaxed/simple;
	bh=9crTYRF3IPBm/Bgn5R3aDPN5l04CVE1ie1SybRKid2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnBu2c+5ptPCZkMfXrD2GK72j5dWhyzT6nTmeN7mW7OqrofDdAK5X2HLI7oxNIT2TJefFEaeGITmcsWDeHKRS5WhC8SlUXj+u+AQCt15uKH6KKGR1T4MJiwcPjM3/tgW0uj+6LNg7e2vyaBNt2r9ylgXMSrX+i90MSQ8IPvZY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KxvOVO1a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KxvOVO1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747734662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTiw4lyKryoPf9LERb5T4xsi4Hrz2SvWTm/GDO7hgYA=;
	b=KxvOVO1avfrZenr0MY6jx8mw31gPj7OA9QWH/+NZXRB4JEx+tUrDyXjRZblZigcNd/Fx88
	V6pY1qv6g9HgVqM/xv3DHuwoTffahFw0xPaQww1IFYCrCAOHNx7npFCReLFvl09Ec8lgHb
	C8WfyvfOOa20JntZScuZ8pAy2TUmbI4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-gXC9bh72MrqOY4MFHu2k0A-1; Tue, 20 May 2025 05:51:00 -0400
X-MC-Unique: gXC9bh72MrqOY4MFHu2k0A-1
X-Mimecast-MFC-AGG-ID: gXC9bh72MrqOY4MFHu2k0A_1747734659
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-232340ba283so18941545ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734659; x=1748339459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTiw4lyKryoPf9LERb5T4xsi4Hrz2SvWTm/GDO7hgYA=;
        b=Ro0uD9uoXhVY46e9BQYlEK9L9fz5j4b2Pb2IbOIm6ydnHCzhF1ZyWDsuCuDeT2JXhu
         gSNCSRpOYm4Lb4YePM6mD4hAi4+6S4L/TtYFbivX/rES7unLUzYhyLm7qW7ErcOw52iA
         ohX24B0FC+Qnbpn+pDWQrVhWPW0OL/U+ZwjcrxQ5q0vmFgb/mvoWLjDyv9KHOqcwsp3E
         qmU94BqKq42rdj78y2eiU5e6sRSnPU3f5JJD6yPELs3K5bQ5sHSYem0P+IGId6eDrVdj
         XYvGsXG3dwp8D8SvjlsAwMNCvXf57h24Tf2W79x+PNTTCkq5rPcvZkVZdXJAD2HOi0z1
         a2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDTPnmsMGUg7p9cABorIIJI89sQdNQHCLI1sUiqsT6cOW2iJd8pdWv0ZajHzhQA4U8KjtTw0LFLA9syoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlHuMiZUgj2dZIZv2sPS+O1vhB2x+bRJtwEATzR+XedUVU7f2
	ZyxvG0c2ZHv79mmSXWrzkcUX3EMQcw3kv1SQLHKNdg/p+Dzu/nIDHmuTJswu8RnuF+vyUrmhJQy
	afIAIB7L6OMR3CafZfr0HWxyElxYacBnuhwq0w0pJoPxJV24PTQUJSkr23JlwXJQ5RA==
X-Gm-Gg: ASbGncs6H4hnyW9UwSduO4sxclgoRWrL/RHRpQaFuhmi8mlhNWHGhNUKJGpeHfIuMas
	OjC6u99w3O8teFnksUPWEKQWGFOVnaqqEPR9OAMGnYNX1GzRGWefORrsMdChvJn1PiDB6ME92zH
	2GDwE7wBW5FwB8uihgrl/nND1Z/uHNkVyYJkiwoSPDq9us54fMtgczLYaucR+RnZiE53TLPp2fn
	pgOvUBc3bGuThFGLOyl5K79YkqMokFPpm1PlgWKrjliKEPCNe2Q4s3trc+PkvsZBSZegI3V6nDB
	cmM=
X-Received: by 2002:a17:903:8c4:b0:232:1d89:722f with SMTP id d9443c01a7336-2321d8974ecmr137737475ad.15.1747734659358;
        Tue, 20 May 2025 02:50:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEno06e7jSgKAhzMm60z1T/aLIr0ix0aDT7+vIpT5BSIJlcRDdsZIfL1WhZTx/cthL8P9yHmg==
X-Received: by 2002:a17:903:8c4:b0:232:1d89:722f with SMTP id d9443c01a7336-2321d8974ecmr137737245ad.15.1747734658974;
        Tue, 20 May 2025 02:50:58 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb121sm73239025ad.202.2025.05.20.02.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:50:58 -0700 (PDT)
Date: Tue, 20 May 2025 17:50:42 +0800
From: Coiby Xu <coxu@redhat.com>
To: Kees Cook <kees@kernel.org>, Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	fuqiang wang <fuqiang.wang@easystack.cn>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <g3zehuem3e4qqh3g7qfiquv2iwe52xo5z2pwrq3vaip2cpjche@nyjw4xbsf6vc>
References: <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
 <202505161616.F4C1BCCF6A@keescook>
 <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>

On Mon, May 19, 2025 at 09:22:30AM +0800, Baoquan He wrote:
>On 05/16/25 at 04:20pm, Kees Cook wrote:
[...]
>> > > I'll resolve any conflict between these patches. Before that, I'm not sure
>> > > if a separate patch to fix the UBSAN warnings alone is needed to Cc
>> > > stable@vger.kernel.org because 1) the UBSAN warnings don't mean there is a
>> > > real problem;
>> > > 2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
>> > > warnings as a by-product.
>> > >
>> > > It seems the answer largely depends on if the stable tree or longterm
>> > > trees need it. Currently, only longterm tree 6.12.28 and the stable tree
>> > > 6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
>> > > clang-18. Any advice will be appreciated! Thanks!
>> >
>> > I personally think UBSAN warning fix is not necessary for stable kernel.
>> >
>> > Hi Kees, Andrew,
>> >
>> > Could you help answer Coiby's question about whether we need post a
>> > standalone patch to fix the UBSAN warning fix so that it can be back
>> > ported to stable kernel?
>>
>> I went back through the thread and the referenced threads and I can't
>> find any details on the USBAN splat. Can that please get reproduced in a
>> commit log? That would help understand if it's a false positive or not.
>
>
>The original patch is trying to fix a potential issue in which a memory
>range is split, while the sub-range split out is always on top of the
>entire memory range, hence no risk.
>
>Later, we encountered a UBSAN warning around the above memory range
>splitting code several times. We found this patch can mute the warning.
>
>Please see below UBSAN splat trace report from Coiby:
>https://lore.kernel.org/all/4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at/T/#u
>
>Later, Coiby got the root cause from investigation, please see:
>https://lore.kernel.org/all/2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei/T/#u
>
>>
>> Also, referencing the commit would be good. I assume this is discussing
>> commit 15fcedd43a08 ("kexec: Annotate struct crash_mem with __counted_by")?
>
>Right.
>
>>
>> > In the case exposed during reviewing this patch, the code UBSAN warned
>> > is not risky.
>>
>> Given that this makes things work correctly with newer compilers, I
>> would say it should be backported to whatever -stable kernels have the
>> "counted_by" annotation. (Hence the request to add a "Fixes" line so
>> that it will happen automatically.)
>
>Got it, then Coiby can post a standalone patch to fix commit 15fcedd43a08
>("kexec: Annotate struct crash_mem with __counted_by") and CC stable, then
>post a new version of this patch on top.
>
>Thanks a lot for confirming.

Yes, thank Kees for the confirmation and thank Baoquan for providing the
context and links! I'll send a standalone patch referencing
15fcedd43a08. But I don't think commit 15fcedd43a08 itself introduced
any bug so I shouldn't assign a Fixes tag to it. It's commit
5849cdf8c120 ("x86/crash: Fix crash_setup_memmap_entries() out-of-bounds
access") which forgot to set crash_mem->max_nr_ranges.
crash_mem->max_nr_ranges should always be set to make sure
crash_exclude_mem_range will work as expected. If
crash_mem->max_nr_ranges=0, crash_exclude_mem_range will return -ENOMEM
if there a range split. So if there is no objection, I will include 
   Fixes: 5849cdf8c120 ("x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access")

A preview of to-be-sent patch is available via 
https://github.com/torvalds/linux/commit/43c5a68f3d01b2e065cbb8686279224710cba682

-- 
Best regards,
Coiby

