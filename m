Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1E29372D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661390; cv=none; b=qie2+h88q5oAepBW/eqY5MouJPsdznpB2DJ+yJOSz0soXPcJ726kMVhgtqVQY4tGI4emjaY7dtsA7m6YmnoCu3rZxG7mD+sI0tRxit7ARk3irOxbkCB6gowOtqL+/4j6TGnLD3hCrln1sMox+vGri7U/DUFlPgvl5bd2q+GpaVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661390; c=relaxed/simple;
	bh=yLgelrkF1e6C9L0S+6DkcUN6DOlOWMVM8fzVsEGlJ2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XM82MvaoYTfoB7MaosS+Zsb72GspXF4ecaoGTZoInTF7RCKv0NgwzeySZ0mGaG+2pjAec3toC9EsUUEStah2oRGxYw/yQbxKlUrRNXpM4HPvNhdOVUNj+rBbdxW/VzXATOUbKglcbz+KIaHvencwtB0QtmfsYrXgroerThL1AHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P15o4zAU; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P15o4zAU"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47666573242so153261cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746661388; x=1747266188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOVx+mbstwSQjksfievzVLRvxXrcGWGDr3j4n+GjP74=;
        b=P15o4zAUWXgHVdh7fcUPIGYL7i8Cz77IsvM368F+smjehYyXVhve1oEJAL2YOXbxZa
         8u7YbU666yiNHFt74fw955KhkGae/uZxqzR6O7zjnpb0GDz4jA+VmI/DWK5lZN18dtCy
         LompD2NBnioe1DcWa8zcJB/w6ur8fjdTl29nm6CK64TrVAAtwpJPmCOTJIUG3JFhfliX
         9rpYwf5Rf38+y9juqNsOnqOJxtapPZaHLCEcFoumtBCblipSiQQNAhpeZUtLhy9do3nz
         OSRWAnQsixApXgK3x7dCD5F1tRJn1hu3XIR6jWa6QMauo7PHbZ0pySpLFkvNZ8VxARN8
         VTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661388; x=1747266188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOVx+mbstwSQjksfievzVLRvxXrcGWGDr3j4n+GjP74=;
        b=NjPX5CUlbOM6pN9ZhdwuO/fWQG5wyC4yl+mVt8CziMsRVNB4noYuzthAYi2I6RbU3o
         NMGXmwriwvcmoZk+kWXd++FjeLVL5YhuzPhvmamlAl7OlC8Uee+FH06TCE5NVKY2S+Hk
         0iZ8OlzRfnz+9CRwfODZW3TziHbpWXU7XQ4sof7RqO5V+vUlPwUSngDjevD4TyRTqcyK
         hRWHnuq0s/AXdjjF/dINZMRvfCcwD3v3yQWR6aVFQAe0EQYetNZDr0nPvlyXzzwPhA/2
         4t7HQPrHHy1SnJ9+zGtzuY2pLqbjG5v/VCnOrlJVgv3hhmmg2U+2Uf+brV3zeCzmYhKh
         B/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqH4fhq937mcjis0I/38tNOPhgCaEQ0Dor0QcRy7OyI6YTw1ohMxcB6uXTY8QOXaUCMb08VKaIFQ7ku4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxPYXZiRZjXxjHcyl8mIW+aamF2/qfWHbg9YUZJAC+2QamWVf
	xb9OTEqelpcmUNV+h43rxCxx8WJOPqybXjYK8LGlZl9pYfzhUG/IX20FBp2TKjHqlqhiOXMp0+j
	WexLuZx+xRaagIb7NjNpexc2GJOKfTF/sf1wy
X-Gm-Gg: ASbGnctOStl9mDjBh2Mc53g9oz8XeQGjob1rjLS4rUgzsJR0PlnwGMPBLkYZXZxQP2M
	PN2nTbopyhtTYkCuxHLEhCgA7RK++hhUiZWM39NfMbzyBy8oRH1RbgeVJ+hS2w6Sb9ytngxUqmd
	MwtEsb76yo0PeI05MOchZlSCBsmo9ZUq/DMPK2+yDks5hdxzI9dg==
X-Google-Smtp-Source: AGHT+IEnxv7pwvatRQSs8Dxg5JQ2zMgAZEyFH5tmwq3M93x2nXKq48Crs0+g1Bps3Sn4Yd7zXe9Xs3PEmxp6zldctLY=
X-Received: by 2002:a05:622a:44:b0:48a:ba32:370 with SMTP id
 d75a77b69052e-4944998bbe6mr1780981cf.10.1746661387700; Wed, 07 May 2025
 16:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
In-Reply-To: <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 7 May 2025 23:42:56 +0000
X-Gm-Features: ATxdqUFoIFtfWlpUAbTer2b5WtCX9D4SM56f9Q1caVD8GzpXX_rm8TYOzuLRYsI
Message-ID: <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading allocinfo
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 6:19=E2=80=AFPM David Wang <00107082@163.com> wrote:
>
> Hi,
> Just want to share how I notice those memory allocation behaivors: the cu=
mulative counters~!
>
> With cumulative counters, I can identify which module keeps alloc/free me=
mory, by the ratio between
>  cumulative calls and remaining calls, and maybe an optimization could be=
 applied.
> Following is top16 I got on my system:
>
> +-----------------------------------------+-------+------------------+---=
-----------------+
> |                  alloc                  | calls | cumulative calls |   =
    ratio        |
> +-----------------------------------------+-------+------------------+---=
-----------------+
> |            fs/seq_file.c:584            |   2   |     18064825     |   =
  9032412.5      |
> |             fs/seq_file.c:38            |   5   |     18148288     |   =
  3629657.6      |
> |             fs/seq_file.c:63            |   15  |     18153271     | 12=
10218.0666666667 |
> |          net/core/skbuff.c:577          |   9   |     10679975     | 11=
86663.888888889  |
> |          net/core/skbuff.c:658          |   21  |     11013437     |  5=
24449.380952381  |
> |             fs/select.c:168             |   7   |     2831226      | 40=
4460.85714285716 |
> |            lib/alloc_tag.c:51           |   1   |      340649      |   =
   340649.0      |  <--- Here I started
> |           kernel/signal.c:455           |   1   |      300730      |   =
   300730.0      |
> | fs/notify/inotify/inotify_fsnotify.c:96 |   1   |      249831      |   =
   249831.0      |
> |            fs/ext4/dir.c:675            |   3   |      519734      | 17=
3244.66666666666 |
> |       drivers/usb/host/xhci.c:1555      |   4   |      126402      |   =
   31600.5       |
> |              fs/locks.c:275             |   36  |      986957      | 27=
415.472222222223 |
> |           fs/proc/inode.c:502           |   3   |      63753       |   =
   21251.0       |
> |              fs/pipe.c:125              |  123  |     2143378      | 17=
425.837398373984 |
> |            net/core/scm.c:84            |   3   |      43267       | 14=
422.333333333334 |
> |         fs/kernel_read_file.c:80        |   2   |      26910       |   =
   13455.0       |
> +-----------------------------------------+-------+------------------+---=
-----------------+
>
> I think this is another "good" usage for cumulative counters: if a module=
 just keeps alloc/free memory,
> maybe it is good to move the memory alloc/free to somewhere less frequent=
.
>
> In the case of this patch, a memory allocation for each read-calls, can b=
e moved to opan-calls.
>
> If interested, I can re-send the patch for cumulative counters for furthe=
r discussions.

Yeah, my issue with cumulative counters is that while they might be
useful for some analyses, most usecases would probably not benefit
from them while sharing the performance overhead. OTOH making it
optional with a separate CONFIG that affects the content of the
/proc/allocinfo seems like a bad idea to me. Userspace parsers now
would have to check not only the file version but also whether this
kernel config is enabled, or handle a possibility of an additional
column in the output. Does not seem like a good solution to me.

All that said, I'm open to suggestions if there is a way to
incorporate cumulative counters that would not tax all other usecases
that do not need them.

>
>
> FYI
> David
