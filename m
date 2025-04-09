Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112DC1AD3E1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 02:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744166417; cv=none; b=d0pLVBy/7F6mv6E5qpYh7LORI13O7OLpFjqstk+ax1UseuHQdcLe3HVIrvNpYZUk0XSd8pX181D/C6ds5mgkif1CfSQi2iS2sN9gNnxhdfVgJsQ5DnsAnH12j0RAra46DpCM+Us9qnD17OPZcu8sGSVC5maXrELJprjkwQgItA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744166417; c=relaxed/simple;
	bh=zXfBuKRiO3GXxS1LkL9ZcUOERrn48C31wKDO5JJtWdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbfIFSkKLpurm6Ty0tTfbZUsEre3TtFaQffVzPmTyXqqv8Sy6j1+3dHRpjZ+QAhNpABHtDi/2aDmUfamvgmppT0UdpPH8zkQcIVJsa1/4/y3sglfRHEydYV8ZgAGhr6x+pJnoDXfhCuxty5na/LECA3p3JZL5i3r3TdHp3vvLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S5cyDA9G; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S5cyDA9G"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac7bd86f637so55027166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744166413; x=1744771213; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IOQlV1YENNqfnMcYfC29B125TJM1XhvCjinQE4wwzk8=;
        b=S5cyDA9GyLbRFFd8k2xzvk64GGLGdbjMCAbhrQQnK+pz8f49NzFlP/+XRydXb9fVRd
         gR2zre8a/L+l835tEBYnDmsBntHIQxkdILjfYjqCyK2GS6Fz8hNkRzlliP4MSHb2D1oz
         SIfq2yO41E8xfCnoXo5AJV8lDj7i/vS12FYAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744166413; x=1744771213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOQlV1YENNqfnMcYfC29B125TJM1XhvCjinQE4wwzk8=;
        b=idpnXKZxxqdOCNKsikVAYIWZFNxceuQOBZCQPUxtOW/Bb05bKInc+hPWfS6p3Z6qSd
         OyEm7TBmZgtOYNNko8Jt52mdSBbDXkyZR592OGYbcR6djoDdU1dpCKurF9x3Zln8iYVB
         pTxxIVABrpzvt963+KmS03kYlOAA9c4ZGamyE6WIt7l5rmFxM1sPaIVaKRLmky6ESb7K
         NQFJu7fPw2cJW8y1EPapVPfuUppWGwq5Y5bA3lwDOPDrbVkLQHTiWXwZdUPSezJLm2+f
         7AP9ucDbboem4osblbh4t/kClPuYf68d5D0SYiYE5C1VNbjRtbnqVb3sg3Gb8WJOe59F
         P8vw==
X-Forwarded-Encrypted: i=1; AJvYcCUT9pUusQOqzCgSAlj+J+nOvpHA6U5noL12dcEcbZKEanX9y5w61LcS3yyWXtB1q5qxwypOsE3VMitZsD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUE1YLA+z+YOaK4SrcxnKCPQjf8yK1jZEzRamD7t82gidIqOe
	r+hVF8FEUnoOxHxQt4pOfo878bPPJpt8XX/vIBXZswD7NYLn223M8wzV+OKRYSy0My00lcvU4v0
	6PdQ=
X-Gm-Gg: ASbGncswnqodjjk0lBiV/3oXpiTI4zBRVVEpiINxrZqjhBjphxpS0VpwnKEYyqoA69D
	KkY7/3BDlpmnIVwerxSjtKA9WzJ/Va9wYfcxlT+N5pkaAbz1pCiaLKs+yw582SB3KMWnB4akKbA
	fyBKeT0gVReD4ujzG7iuVNRkql/n+NI7KdnadFPYMvJXSGVeFeahPC56xxlkCJPK/jA1nWmMVu2
	3H4HZ/N07KmXC12OW+3FaX4hWj5ESWFvf+yURLCVJg3GDnzjDd1QjZRWBsSwT9mMsVHgk4e3G+o
	DHYm8LcP+i/q/jOemcvUHVF3nW2YiX8YW2a6xosyhqWFA9xAZ7gbOi7z4XheUKoyTXjm+6rAQTu
	rBivPN6H3BE/Ru/or+D4=
X-Google-Smtp-Source: AGHT+IHGKbgYCg66HEHHnuucS1XM2Afz6ko1vJjfeTRSzkkD1Uz5HgW7LYqmKluspAH3Dk2z179Bww==
X-Received: by 2002:a17:907:1c93:b0:ac3:ed4d:c9a1 with SMTP id a640c23a62f3a-aca9c056215mr97162066b.17.1744166413053;
        Tue, 08 Apr 2025 19:40:13 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3da7sm12326366b.112.2025.04.08.19.40.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 19:40:12 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso521991a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 19:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJk88IfCb6cYGBhjVlLemRRl8brJ+/pwXTMU7ExYUc63UHagdpVxsC4smcfppeTHj/+vlzqyxl46sI09I=@vger.kernel.org
X-Received: by 2002:a17:907:86ac:b0:ac7:334d:3217 with SMTP id
 a640c23a62f3a-ac81a611619mr581097266b.12.1744166411592; Tue, 08 Apr 2025
 19:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408091755.10074-1-arefev@swemel.ru> <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com> <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com> <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
In-Reply-To: <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 19:39:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
X-Gm-Features: ATxdqUFiHF52bUvLryR7rfFOaLA0UC5CBMTbxxULmYgSReDeZj_UCJwCfpJ84AQ
Message-ID: <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>, 
	Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 09:07, Fedor Pchelkin <pchelkin@ispras.ru> wrote:
>
> > Linus comment is about kvmalloc(), but the code here is using
> > kvmalloc_array() which as far as I know is explicitly made to safely
> > allocate arrays with parameters provided by userspace.

No.

ABSOLUTELY NOTHING CAN ALLOCATE ARRAYS WITH PARAMETERS PROVIDED BY USER SPACE.

All kvmalloc_array() does is to check for overflow on the multiplication.

That does *not* mean that you can then just blindly take user space
input and pass it to kvmalloc_array().

That could easily cause the machine to run out of memory immediately,
for example. Or just cause huge latency issues. Or any number of other
things.

> [27651.163361] WARNING: CPU: 3 PID: 183060 at mm/util.c:657 __kvmalloc_node_noprof+0xc1/0xd0
> [27651.163411] CPU: 3 UID: 0 PID: 183060 Comm: a.out Not tainted 6.13.9-200.fc41.x86_64 #1
> [27651.163412] Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
> [27651.163413] RIP: 0010:__kvmalloc_node_noprof+0xc1/0xd0
> [27651.163424] Call Trace:
> That's just
>
>     union drm_amdgpu_bo_list bo_list;
>     int fd, ret;
>
>     memset(&bo_list, 0, sizeof(bo_list));
>
>     fd = open(DEVICE_PATH, O_RDWR);
>
>     bo_list.in.bo_number = 1 << 31;
>     ret = ioctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &bo_list);

Yes, exactly, and that's bogus code in the DRM layer to just blindly
trust user space.

User space input absolutely has to be validated for sanity.

There's a very real reason why we have things like PATH_MAX.

Could we allocate any amount of memory for user paths, with the
argument that path length shouldn't be limited to some (pretty small)
number?

Sure. We *could* do that.

And that would be a huge mistake. Limiting and sanity-checking user
space arguments isn't just a good idea - it's an absolute requirement.

So that kvmalloc warning exists *exactly* so that you will get a
warning if you do something stupid like just blindly trust user space.

Because no, "doesn't overflow" isn't even remotely a valid limit. A
real limit on memory allocations - and most other things, for that
matter - needs to be about practical real issues, not about something
like  "this doesn't overflow".

            Linus
