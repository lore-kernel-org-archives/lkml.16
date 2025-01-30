Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6F1EEA59
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257896; cv=none; b=EOsAP4B9cBxkbpmVBepDe995RufkAEKEOuW7jewwz30oHTRuHM+53Zu6mnhr3nDZxHYR9cnZp668HGPUYxmilQDiwBI9y+dElVbG4NOR9pMnfdTsuTzBjJXJpsJTOIwBLS3dtlJQshAE6fp2UL5MXQY1xAyZxaBmXpsyaaiLTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257896; c=relaxed/simple;
	bh=6Qv+A4MOLBB/p2x+2LfQiWLMn2cpLrsE9gu4CYycDTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZ0MeeqKX52jKVseBtxXY9zWu9YyzbiB9fKAfuLOiH+cmuOMR15mojgs0CZn0HoHr7ORka7oue9roL6MgHpt2piQqu2yVv6rq6TuXVXQZGwzxFwM7BJO3WG1i1RfXrAL2ie3OztP5gpnmjIkmwFG8dqNUXNHzlJdOofwTckH/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MtG2vsIX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MtG2vsIX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so1630256a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738257892; x=1738862692; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=umZKRxEZDIyFeupwQbUpP1kTluqmkTf2dFfPuk8gQnc=;
        b=MtG2vsIX3sw8qqco0qnSqGewfzt2E+/oKI0NHiT/tdZCeUAZTxB/7yN4/lvQyCefe+
         SAbqtHkjO4hi4jv0esJo3Wypzo7RWR/Ip07UH/kz/dbUcuAZpi/LYBOLSq0b+vr1/ac4
         nmpitxW8UOy6GNZD/eDdjWjhHG5L07dl1Tzl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257892; x=1738862692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umZKRxEZDIyFeupwQbUpP1kTluqmkTf2dFfPuk8gQnc=;
        b=cV2MXItGXry01Nh+ZOFqxyVC0Z0pfnFMuba1aD5oiVsWqA+PJix6g1yTtOVf6ZOCF8
         9Fz++8UGhziM2ouw1KdCjIcq+afPv1qFCQ9jaGVF2suz7a5sCfV3FOhoEXKsAHX4QCw4
         cIy95xp4JTfhsenG2nsnveaj4jHDN3FOenFKemqZpqT1LMIe3S22j04pFeuydJmelV/v
         Cl/OBNgjqP8/Ho47dc8Vex3qlYB4NiMgisXpTy5CKbIfnX72Gu3xWiFo9jPjDLJXaxJs
         heM9rqK14cRq2fE6BL+PH1I9nXo6TlkTvw7BRt9WjKvp9bAS7oCABtmMxX1O8sU0zxuh
         JuRg==
X-Forwarded-Encrypted: i=1; AJvYcCUguAeBlArIWEKKqL6xtWPSCkh5uh2pCSJiDhtVvFmxnkC9/iv6Ks9O3DvB6mMBxaneGTJYLEBBYIyjMQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsB7l8gYKVBng9tWswtSkQ4Gk3Gm2sqc19DlBTAc3Z9a0rZQJ
	PUf0MuYriETpSG93YXMKOwuD4QmgQjiC+i1ZcxLrvviQC5uqJkijRThhL0DbhMhDtoJC9+2tDwH
	Ggbw=
X-Gm-Gg: ASbGncsROB87TrmGPO/5iOcGGCQ7qJNGcQkJoDWdv3fVeyX0PcaKvwcp19pKv0qcQTG
	lCdloBSKiKdGsDQMnRbx/idiPrtvQIbmHxBGaBuxs6gQzkb3Zlzkegt+MNa/nmOATmGAW7XOFrT
	R9s3YRSzT9yzP1SWBVo3Y2B5l+Ljhwhu11xjX1gpyh3/4MWKELb20V5M77cIOCbxRhYPU85N0jq
	6VteXpG+rXLenQQ9tu+sa3ZlARqKm1ARSyDGdS71rTN/loJ5V4GUZNkZ1lQ5AjyV9t42Lqy5CnI
	yg4YXNxipSPTUEsKxsRnvp4r3eIaXEDR7NyW063l8xOwffxpFMv8C9bDbVk2nlkMNQ==
X-Google-Smtp-Source: AGHT+IEFeZaKkETTYplPPvn3tGiGayqxyKG3YyfUL8hOTYgMtweeV+Tm0jN15v+AmFUUbLmZsbCtRg==
X-Received: by 2002:a05:6402:518f:b0:5dc:32eb:f289 with SMTP id 4fb4d7f45d1cf-5dc5f01e810mr6653543a12.22.1738257892132;
        Thu, 30 Jan 2025 09:24:52 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724ca086sm1359970a12.72.2025.01.30.09.24.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:24:51 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso182612166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:24:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6Izew6MJ+3dYqaFtgJKfHD/WT22M+FDR55EnUQgiNGiyDClhsFktBEfYnXPYauR7Cwi4ZgPUFCMoT1a0=@vger.kernel.org
X-Received: by 2002:a17:906:da85:b0:aab:d8de:217e with SMTP id
 a640c23a62f3a-ab6cfd0db3emr759038866b.26.1738257890447; Thu, 30 Jan 2025
 09:24:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127044721.GD1977892@ZenIV> <Z5fAOpnFoXMgpCWb@lappy>
 <20250127173634.GF1977892@ZenIV> <Z5fyAPnvtNPPF5L3@lappy> <20250127213456.GH1977892@ZenIV>
 <20250127224059.GI1977892@ZenIV> <Z5gWQnUDMyE5sniC@lappy> <20250128002659.GJ1977892@ZenIV>
 <20250128003155.GK1977892@ZenIV> <20250130043707.GT1977892@ZenIV>
In-Reply-To: <20250130043707.GT1977892@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Jan 2025 09:24:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjKkZBM6w+Kc+nufJVdnBzzXwPiNdzWieN3c7dEq9bMaQ@mail.gmail.com>
X-Gm-Features: AWEUYZmTt2mTlIxYn9aBQ5TkH5IgcjClwxwxOG9VfCpa_i04bqh6yE87LV0ZQs4
Message-ID: <CAHk-=wjKkZBM6w+Kc+nufJVdnBzzXwPiNdzWieN3c7dEq9bMaQ@mail.gmail.com>
Subject: Re: [git pull] d_revalidate pile (v2)
To: Al Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <mszeredi@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Jan 2025 at 20:37, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> ->d_revalidate() series, along with ->d_iname preliminary work.
> One trivial conflict in fs/afs/dir.c - afs_do_lookup_one() has lost
> one argument in mainline and switched another from dentry to qstr
> in this series.

Actually, I had a conflict in fs/fuse/dir.c, and it was less trivial.

The d_revalidate() change means that the stable name passed in might
come from the path lookup, which means that it isn't NUL-terminated.

So the code that did

        args->in_numargs = 1;
        args->in_args[0].size = name->len + 1;
        args->in_args[0].value = name->name;

in fuse_lookup_init() is no longer valid for revalidate, and  instead
you made it do the NUL termination as the next arg:

        args->in_numargs = 2;
        args->in_args[0].size = name->len;
        args->in_args[0].value = name->name;
        args->in_args[1].size = 1;
        args->in_args[1].value = "";

Fine, no problem. Except it clashes with commit 7ccd86ba3a48 ("fuse:
make args->in_args[0] to be always the header"), which made in_args[0]
be that empty case, and moved in_args[0] up to be arg[1].

So my resolution continues on that, and ends up with three in_args, like this:

        args->in_numargs = 3;
        fuse_set_zero_arg0(args);
        args->in_args[1].size = name->len;
        args->in_args[1].value = name->name;
        args->in_args[2].size = 1;
        args->in_args[2].value = "";

which looks straightforward enough, but I have not tested this AT ALL.

Miklos, can you please check and confirm that my resolution is ok? It
*looks* trivial, but there may be some reason why it causes issues. I
don't know the fuse code enough to really be able to tell what
implications this has (if there are people adding other args
afterwards, maybe we now have too many? Things like that)

               Linus
