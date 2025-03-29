Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CCC1AE005
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743247925; cv=none; b=WId85AhJHKNXXyGmbJaMX7u+WUERdbDyBeEATqf1bVZENwORSAWBd3NqeeK9jb7mgHiT+e2E1eInZSHWbAxIkOtUQCfO5p4ZBaa1gRPl63kf8t/OmvsefYgEpDEA+Cbvi3zRNIZ07IuDmHqmLJGLmZUaFP+xwYIlcVqLopoyFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743247925; c=relaxed/simple;
	bh=w45sQVO3wcz9FfdhCxSoC5xfvJ7eyCpZafzKlN/yBhI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NeCSV7K4XciXu86W8S5nIfiKgYzzhE2rxE9gPyTDLGO2K7oyoUJjR7JyiD2S1CRlqXOn8OWDG1fzPzLw1R56pQPCcQA7z1ibwGpNw+oASxshZH3N1dHUVtc1zMLs/f5ii4cdGGwruJjTSzPcYxIYWgCHstzhSSSiwD4FO9uZm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5dUCBuP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5dUCBuP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-399744f74e9so2045650f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743247922; x=1743852722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMPvjYoWU/cL+PeqbCkVVNZmivn+eqx6nuVz1ICDE30=;
        b=I5dUCBuPVxTL5k+wTeMybIymzTGCakuXUyvJTZOMB2p/zrwcS2NRj6OfbKL2thixG/
         2hx1nD7VRrtsCqaLhNnVLU5n7n81KaP37MH+CTCydMEcCL5Im5TzKNXIyBeA1bVhbgGw
         T74L0yC87zc+pYTk/6alajvig6o4wDoNIbpAFrsN2FnhtLaudrHRn2vhsJ9BcYA+YHz7
         xzU8qFxjldVXiNH/8DDHl9DiGQD/4KzFZh837/ktDaZ/yU1ddIe/4lPRkXtOtfSmXtWz
         sxwa6PpoVriWr9GtmV6W91gV501zJQDaPQtYJVVzKOL3TTA+/6zk6nxRKxUGGDZsas2s
         VUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743247922; x=1743852722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMPvjYoWU/cL+PeqbCkVVNZmivn+eqx6nuVz1ICDE30=;
        b=RDbUR53oKdlknz38zHorb35ybOXpZn9CaUzBw8xg5Q8PbWU9OHlri1aJ549mnSXXJd
         ZBziIAc7l/BgSMfcuTvTTswSsB58kjmMgRX7mGJC0soislRti16Kf/yU+x1DPlQPB7TC
         bmFyoM4ls+O/kW5EZuOhT5SEi6EVBQjFXeCCQZ7ZcYfcz4N0G0udm/hne8C7Z+UxwVxv
         zKT+ENm3tQUIcq0KEETTNZXJaJQU2yo99XwLRsUgnMSlg+dYOSImTQziUTr5llYHVWVn
         QBbdYA21Njy87kYpMFYxieuj6kzD1GQkrz8KpWs32rsZ7j7yt2+wX8gi3monlJ0Uz0Pc
         k0tg==
X-Gm-Message-State: AOJu0YxE0+UjhZ8Kz9Fdi9RmDhR/hmEeRyCj/j4Tj5TkjQBKikcJyL8J
	/Xvi/PgyN1y1YpIvaarZGVrk2Ca4NiLMzloTkgkI+OXNxatxKLN0
X-Gm-Gg: ASbGncvWZMLpLkxA+9XETwUgi36ozd/u99H8urqNyyZzD0Ij56jgPoBoFC+9tWz8wpJ
	F2yimQFoS/lxUyCGgdl7tM7uCml/tnGH5ByVWHP3cJq5Zddmooi1P3/8AohRbZ6VCS/YDjar6Pp
	A98SYux8yp0GT4zOKycSdbNrtrjQhouVDm21mbmb7JBRPh0f0bHFme6kjthRCYg2GLcQ+pI+mHY
	C0qRvQky+KCMXLQ1dM3196nCmRPuVkte8ZEO8PDY7LHsNpgW6K5TaXt6/z7zw7bQWuDhkJm9rIR
	cdtJyDA+wcqDcEVcrzMEFzI1ftrCXy+dNoWGZZ9ZRk7oup74J4KNm1ytw8/XMrtM9ghyWIS7KSE
	qe037Fsw=
X-Google-Smtp-Source: AGHT+IFx23gCJtX5TOoYBgfx5wKv1wnj62i/R9yQyxgpMcV8gAj+2L1aa3pRK8HCwhnAPuBZux2+zg==
X-Received: by 2002:a05:6000:40e1:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-39c12119dd8mr1813854f8f.52.1743247921577;
        Sat, 29 Mar 2025 04:32:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b662c05sm5386186f8f.23.2025.03.29.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 04:32:01 -0700 (PDT)
Date: Sat, 29 Mar 2025 11:31:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, David
 Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>, Andrew
 Morton <akpm@linux-foundation.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH next 0/3] iov: Optimise user copies
Message-ID: <20250329113159.29126c46@pumpkin>
In-Reply-To: <CAHk-=whs5oVkHMrNP=xkJP4Z4fObn=6Mz3fYp4wWMNQWtyjo9w@mail.gmail.com>
References: <20250321224557.3847-1-david.laight.linux@gmail.com>
	<CAHk-=whs5oVkHMrNP=xkJP4Z4fObn=6Mz3fYp4wWMNQWtyjo9w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Mar 2025 16:35:52 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 21 Mar 2025 at 15:46, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > The speculation barrier in access_ok() is expensive.
> >
> > The first patch removes the initial checks when reading the iovec[].
> > The checks are repeated before the actual copy.
> >
> > The second patch uses 'user address masking' if supported.
> >
> > The third removes a lot of code for single entry iovec[].  
> 
> Ack, except I'd really like to see numbers for things that claim to
> remove expensive stuff.

I've finally managed to take some measurements that make sense.
(measurements on a zen5).
Values are from:
	mfence; start = rdpmc; mfence;
	// A bit of setup code and an indirect function call
	syscall(SYS_gettid/pwritev/preadv, ...)
	mfence; end = rdpmc; mfence;
	cycles = end - start;
The prints are done after all the tests.
The preadv/pwritev are for 8 buffers of 1 byte at offset 0 to /dev/zero.
gettid() is used as a base, a completely empty test is ~180 clocks.
(I've deleted the other 30 results for gettid - they are very consistent.)

I think they show an improvement, but it is similar to the change in gettid.

original
              bac  3790   396   397   397   397   397   397   397   397   397  gettid
                8  8792  1088   739   678   674   674   669   669   669   669  pwrite
                8   717   676   669   669   669   669   669   669   669   669  pwrite
                8   692   669   669   669   669   669   671   669   669   669  pwrite
                8   692   669   669   669   669   669   669   669   669   669  pwrite
                8 16744  1221   805   827   824   847   823   819   846   838  pread
                8   865   857   827   828   808   820   845   828   821   824  pread
                8   823   804   802   813   811   845   836   839   815   813  pread
                8   862   813   853   846   847   828   821   820   806   846  pread

address masking
              bdc  3218   592   391   391   391   391   391   391   391   391  gettid
                8  7701  1091  1913   676   672   665   665   665   665   665  pwrite
                8   722   669   665   665   665   665   665   665   665   665  pwrite
                8   690   665   665   665   665   665   665   665   665   665  pwrite
                8   690   666   665   665   665   665   665   665   665   665  pwrite
                8 13532  1114   802   812   798   810   824   806   825   829  pread
                8   808   805   806   838   799   829   839   831   843   796  pread
                8   812   825   835   802   803   806   809   829   827   806  pread
                8   807   801   842   804   806   828   811   824   810   808  pread

I ran an extra test with a barrier_nospec() following the access_ok() in the
'copy from user' path.
I'm not sure if its absence is an oversight or a valid decision on the assumption
that the data being read is just 'data' and not used for any control decisions.
Oddly this makes pread more expensive even though the change in is the write path.
I suspect the cache alignment of all the code changed.

fenced
              bc5  4681   394   395   395   395   395   395   395   395   395  gettid
                8  8988  1005  1114   772   688   684   684   684   684   684  pwrite
                8   742   688   684   684   684   684   684   684   684   684  pwrite
                8   709   681   684   684   684   684   684   684   684   685  pwrite
                8   690   684   684   684   684   684   684   681   684   684  pwrite
                8 13259  1025   813   834   825   833   833   833   830   815  pread
                8   821   819   837   827   837   837   837   837   837   837  pread
                8   819   834   819   833   837   834   809   833   837   837  pread
                8   816   819   833   837   837   837   837   837   834   809  pread

	David

~                                                                                                                      
> 
> But yeah, the patches look sane.
> 
>           Linus

