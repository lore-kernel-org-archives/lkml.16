Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C3187FEC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121055; cv=none; b=SECPXN07m7nudHFVAt4Xc1LiHqDjiWgWMT7+A8XQz4h9PLEtZ3TjgXP6SYQc4OI1KnTMZhAgdoZBcB213mW+f7cbuh8VNhkNNRlxKEA9EarUFTDoHmmeHmWiXnRc/2vEOSnT4fD2ZWBF99fYCFMDFR5WXvtK79/u6KenkuOvTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121055; c=relaxed/simple;
	bh=QszLQxpdOJMZeh4hhcXWlTx6vi5m5h3fin16cF2jQZw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tkR/k7yJwHUWQU9piJMMaB0doXQOCk1fUYsbi3xCFwOuWEutDgA0mO2BC5ulL7lqNO33nWackcm9MKPJUbDhhacd1iiMirrndy8P8lQKqXjO07tJkwKaTU2vQYvzJNniT9jVxoTC7DrnVpBImGfqijFk4rgQFETsqsux5IKAmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CtVsP47+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CtVsP47+"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so36320355e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744121052; x=1744725852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XuywzePAIgnrVesJkRqbK4EXd6ZTvUCScbqcLqpJI4=;
        b=CtVsP47+sIVDSRP32fVo9Uon3scYz/hGcxXEUHzN5+n8SjlUmD8j4Sg9XpuAs9Yht4
         rwout1qeQfkLdHLZKE1cY8WzvY+88STBYhUPVbh4m2pILEE/VN4eZPG24ObYWWEc/0NM
         iQQM0zWX7mR++KUcPh4udxl60Sq9bVSIDxLZKMeWuzf2N33rb+13JIvJcA4eXD1GW+OV
         b4NZKPQXZSunGRcc8bOQS9b511bUDC1PIbHA5eeJqYU4rdotqq6GDzS/6bkZqDdRiwl7
         Ac9yfGyxx2lf7EBiv1+xwqrU1jr0cvs53JA3EYOvfCHYP7pRGfoiDH9YZI0HCNPjYDXt
         wJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121052; x=1744725852;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9XuywzePAIgnrVesJkRqbK4EXd6ZTvUCScbqcLqpJI4=;
        b=VpMwoSq3wFwl4rIctl80vh7FcKO6VYrdVuyJ+YB64lVgEeNno53yl5wfKewmLv6x6R
         VhWRGEnqZBzpI13EHbgalFBle6aLk+1iHILZlPe4k4dcIGib2NiuwCLlhZhmOyTMHVmJ
         zT81QjD2CERFxAYJRq6UJbzMIogz52rYIi9LPdUkn90dxPFnErRI3K8wd2VVGywGWMir
         MyKCz7baJAcrSA0zZ4AbiD6+7SSU+uswRaTwfnTnEW8v0FLYV5H3dFoNMkBB/SORqEHp
         tTIfvBlBQ/6VOlUTXER6evtVUsjYHPBcInPgLtsBJagATgY9jRfCsfBVmZUTldOQ+18W
         YJDA==
X-Forwarded-Encrypted: i=1; AJvYcCXFv4vWSafooofnsXyAf49oju8rVS11Rj6UYvdcDkrQB+V7GS+loYX8S1IwHb4JU0ysNR2BcpV2nOlCEEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxif+V4eh43fVvwY9NuA87huIIwWO5oDOvgLPyxi5FDzlOO7cJe
	Y5L+77GOMVgHBO6ZyXFUz9V5kZVy0+zEeO4uPiAG3MxtWxqlIf078hDlH+BN/ofsz1pc60O0ETi
	CpNynl/xG4g==
X-Google-Smtp-Source: AGHT+IG6jAdiCw3blTh9N+MXOZQBHsfQ70S/42on8m9V9q2s13qGmJAHFfrODzkQ6jC014vOm7p4ce7FR5W3sA==
X-Received: from wmcx8-n2.prod.google.com ([2002:a05:600c:c1c8:20b0:43d:9f1:31a9])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd6:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43ee0616f6fmr131307195e9.2.1744121051903;
 Tue, 08 Apr 2025 07:04:11 -0700 (PDT)
Date: Tue, 08 Apr 2025 14:04:09 +0000
In-Reply-To: <CAOzc2pyKFJKxkTs989rMzRaMSwR+EBXDiCB-2xBRTiu=Y8FLvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250131001806.92349-1-vishal.moola@gmail.com>
 <20250130164836.1163f66bede77ec4bcc9d4b9@linux-foundation.org> <CAOzc2pyKFJKxkTs989rMzRaMSwR+EBXDiCB-2xBRTiu=Y8FLvw@mail.gmail.com>
X-Mailer: aerc 0.20.1-1-g87e37b93d34f
Message-ID: <D91BB945EKGW.UZSCJRUM034H@google.com>
Subject: Re: [PATCH 0/2] vmalloc: Introduce vmap_file()
From: Brendan Jackman <jackmanb@google.com>
To: Vishal Moola <vishal.moola@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <hch@infradead.org>, 
	<urezki@gmail.com>, <intel-gfx@lists.freedesktop.org>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon Feb 3, 2025 at 6:53 PM UTC, Vishal Moola wrote:
> On Thu, Jan 30, 2025 at 4:48=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
>>
>> On Thu, 30 Jan 2025 16:18:04 -0800 "Vishal Moola (Oracle)" <vishal.moola=
@gmail.com> wrote:
>>
>> > Currently, users have to call vmap() or vmap_pfn() to map pages to
>> > kernel virtual space. vmap() requires the page references, and
>> > vmap_pfn() requires page pfns. If we have a file but no page reference=
s,
>> > we have to do extra work to map them.
>> >
>> > Create a function, vmap_file(), to map a specified range of a given
>> > file to kernel virtual space. Also convert a user that benefits from
>> > vmap_file().
>> >
>>
>> Seems like a pretty specialized thing.  Have you identified any other
>> potential users of vmap_file()?  I couldn't see any.
>>
>> If drm is likely to remain the only user of this, perhaps we should
>> leave the code down in drivers/gpu/drm for now?
>
> This function is generally useful for file-systems that use the pagecache=
.
> I simply chose to highlight the most obvious user that benefits from it (=
and
> so that the function is introduced with a user).
>
> I haven't identified any other specific users of vmap_file() myself. I kn=
ow
> Matthew has some other ideas for it; I've cc-ed him so he can chime in.

Not much to add but just to confirm - yep, this seems like it might be
useful as a part of the solution to the page cache perf issue[1] with
ASI that I spoke about (briefly and chaotically) at the end of the
LSF/MM/BPF session[0] on ASI this year.

[0] https://lwn.net/Articles/1016013/
[1] https://lore.kernel.org/linux-mm/20250129144320.2675822-1-jackmanb@goog=
le.com/

But, for the moment this is all still pretty vague stuff, not at all
clear yet that this idea makes total sense. Hopefully I'll be able to
follow up in a few weeks after I've made some time to stare at/prototype
things.
