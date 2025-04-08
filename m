Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA325334F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 03:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083227; cv=none; b=ekvalqb1kR9hdKPmnaHIz7712Kx93pfVGrfYX6EmFLyowXwze8pI504p+ZqrAWaZcROVfKm372CEhpwn4npgyXh+dLlXU+LnqqJdHb8yFl9kkLKfe5p4RU29kJX+JBrgLcqaLjgQtP3lSTCgZOtBRG/Wya3nSIKbo47/Yg5BL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083227; c=relaxed/simple;
	bh=Mrmor0+vWYtySWy/kYpoItX0YdBoKMT8UBH61E84ZPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T44DX97Fd4KUwhcHzAdvlA+OC7QIHqR49mJ8OdQMZdcR3aJlQAdHuDcz6PFX5wrR1X/kVlWvpXVHw+uR0uYQ8e2xbpy3wDG6fTs7M/QYfhTl0jp9XBzgZsAWjr44s1R9/z9hqz71kpx5vwLy3vwwUDbmK9MWUqu+fa1Na4EWc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FjbiHxi+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FjbiHxi+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af55e518773so3173397a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 20:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744083225; x=1744688025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCd2bh1YEOmLh/qb59SX/cgaK+uJYxjcabn/QHo1DhE=;
        b=FjbiHxi+XfsxOp1uh/81/qk1FFBg04oH1nP7cO63UecURMP8a+Fs35QXyzhL+M8AIJ
         d1YoQlDRzjwtnl4ui5fQwcahjtS6fOHxb2FVFWCg4NUMfsiBr1TSNK16/yOBGsaC0anH
         RKUd/myuTPxzKddWpnZ/nNUkrsdXY0uzZH8B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744083225; x=1744688025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCd2bh1YEOmLh/qb59SX/cgaK+uJYxjcabn/QHo1DhE=;
        b=mQCu/gWONmTqd9H3snWrgkP17hKBFNLG1ZAGBh3oozbOa9vIuY2DMtRRQUkEWkAF8a
         d5DTm1Q8s5aqlw2WZ4SoJ1/XrKUGkZu2l2Vpl0hPdxoZYb2os2CVMwlnikH7/YDY3Ov7
         LuYb8Qd3hFA8Plmd/cMrtVSp7rdvOFB+GbnxdVK18SJIFzkqmBp+wwhWcmzMeKq8joGn
         ni4QIWtp/pnvDBOVvf1hL+0viGN67I5izDMQGJ9I88FipSMj+BvOlUKCQqLTIC/dqnnw
         MG1rbI2PUsUPmpUN2h3v/vnZQNm4jXdGIe5AWIXl8OdDhCgA6IcVwEUduGUQ9gxlV34v
         dGIw==
X-Forwarded-Encrypted: i=1; AJvYcCWwV6lAK2vN/rqWRSS4jdSTxWo7MXQ/SNRy+SxZSwGE1+IIP8hXqliAD/DdPf6P2c5e9epLeJ6c+NFMMQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQrWOGwMi5T8FTRzkNl2MF2zxN3MAPzB3Noo7UIMnIODp2DmP
	KUqXY/ADsfTd6K96DZcKrc2h1+tofp/AWaimxzy8b+8MGhLEGUERnMbVQ9xMyQ==
X-Gm-Gg: ASbGnctvssiCZYmMN2v8vrHegMOSmenb2lgClsxOR+nOqLYAVU/shOj4DrfUoxU9HPl
	E9gl9MBT5Yy9UBKKNshMf+WsC0r2FwfmdXVoYyWxGiRaj2owkdCXxqnFykt2/AYy1/H+lSBQEtU
	EunQ1qCWanS/dkd5n4LPBD5gp2q8KFoFr2CB7CEZrUXifgpoZzSqkA2Coo/zwb0gC20O0OpVYej
	dkMninjo/5Kjndcs6/YVAptM8Xj5dUiRnAcCurXQW9g8QIJV4a2+jiMjuYFgTKM1RLQjIIDrc77
	G/pjCWr89xulIxxOOXntwwwc4MGNDwIXOcWMomebUQNyGkA=
X-Google-Smtp-Source: AGHT+IGsjihw0vSr30RY1gpqd18IjtRh8jY4OvlAGINJ/64l5H7uM7maXht1zk0/bBCOIGVs716dOA==
X-Received: by 2002:a17:903:1ca:b0:223:635d:3e2a with SMTP id d9443c01a7336-22a8a8745ebmr199837975ad.23.1744083225206;
        Mon, 07 Apr 2025 20:33:45 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a4c:d4ee:9034:7421])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229786608d1sm89620375ad.120.2025.04.07.20.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 20:33:44 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:33:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, 
	hannes@cmpxchg.org, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, rppt@kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, david@ixit.cz, Minchan Kim <minchan@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Message-ID: <jbf64ctbcquh3jvcoioszpiw4ucdxs3olr45fwtfgobifwxw27@mcxxyyji4ltb>
References: <fqj732chhrffec5hrvg5f7i5hqidgpdetldolyubj25jczq7ec@wj4bwu7psbwh>
 <20250404140628.2049848-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404140628.2049848-1-joshua.hahnjy@gmail.com>

Hi,

Sorry for the delay

On (25/04/04 07:06), Joshua Hahn wrote:
> On Fri, 4 Apr 2025 10:46:22 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> 
> > On (25/04/03 13:38), Nhat Pham wrote:
> > > > Ultimately the goal is to prevent an incompressible page from hoarding the
> > > > compression algorithm on multiple reclaim attempts, but if we are spending
> > > > more time by allocating new pages... maybe this isn't the correct approach :(
> > > 
> > > Hmmm, IIUC this problem also exists with zram, since zram allocates a
> > > PAGE_SIZE sized buffer to hold the original page's content. I will
> > > note though that zram seems to favor these kinds of pages for
> > > writeback :) Maybe this is why...?
> > 
> > zram is a generic block device, it must store whatever comes in,
> > compressible or incompressible.  E.g. when we have, say, ext4
> > running atop of the zram device we cannot reject page stores.
> > 
> > And you are right, when we use zram for swap, there is some benefit
> > in storing incompressible pages.  First, those pages are candidates
> > for zram writeback, which achieves the goal of removing the page from
> > RAM after all, we give up on the incompressible page reclamation with
> > "return it back to LRU" approach.  Second, on some zram setups we do
> > re-compression (with a slower and more efficient algorithm) and in
> > certain number of cases what is incompressible with the primary (fast)
> > algorithm is compressible with the secondary algorithm.
> 
> Hello Sergey,
> 
> Thank you for your insight, I did not know this is how zram handled
> incompressible pages.

Well, yes, zram doesn't have a freedom to reject writes, to the
fs/vfs that would look like a block device error.

[..]
> On the note of trying a second compression algorithm -- do you know how much
> of the initially incompressible pages get compressed later?

So I don't recall the exact numbers, but, if I'm not mistaken, in
my tests (on chromeos) I think I saw something like 20+% (a little
higher than just 20%) success rate (successful re-compression with
a secondary algorithm), but like you said this is very data patterns
specific.

> Thank you again for your response! Have a great day : -)

Thanks, you too!
