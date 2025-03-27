Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6ED1FF613
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084132; cv=none; b=TCgqjMCgfKzsERRpdbp6WcN8VPmIKTSEbQURs1rADvuhfrNdF8+dc/Mf1xRvwayJP1803UAsOn/TIEpwgwYDO4qXYpS1xNmHj+t++ehq2BkkpJs0bu7I3UNqQJMkt3e20hJIcqXDhaWIUYDhHJDwmEqvnN0pHxZ0YuqbHn3idBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084132; c=relaxed/simple;
	bh=cqf11Pz9JhbgAIl3asxDpX0Pyj8CKqlu4uBXva96xuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/ZJTq67mAPdCtBZeUZ4UXXhQm9Y1fCKU/GHNeUh9wNjl4GTpTXdRmH9QQvSmNx9Pv4kMcw/o3KigPIMVuT9ngt6qHmeTdMcOXyWq+/SpWyqFKmXEX9Izgfo6gzKsK2VCVoDVck4kwY3EYFSCLCUbFJ2G8QDNP59rVFSkC9Ynz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gkcBeA5e; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gkcBeA5e"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227b650504fso22180885ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743084130; x=1743688930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I6+lzTRwJoxGLhsBP/jpjF8an5v1mXJJ/EYMWzXoLZE=;
        b=gkcBeA5eyYOFPJgpU8WsgV5Ks9coIAQgltTVZ4dpBrzPoIcWvEcxgK8eWkcyxIZK7k
         y4B4zaHuz+1SjPFAfHRznLIlicOQdXYN/z5JuKRdEa/Cuw7z0gsY4OA/qkEm49EmZTRP
         jDtRSv2ENZ4m9FqQp/zF2l5Uhf4Mu/xZWrTDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084130; x=1743688930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6+lzTRwJoxGLhsBP/jpjF8an5v1mXJJ/EYMWzXoLZE=;
        b=IE0eYaBWfgK8ZLEx15Z9leeANhg46PDnVj8C5Zg1IAI+erxRr5gTzgOzaiKp4McD3h
         XWeYFhEVp6WfHNPBuSZv0gmvNPZnQ0bv9v6QUx2FOudVM8OCr7f9qK5c7XRc4+YU1Qfu
         sRVL2zShbvcAlXFjCeuTe+GCgQn8XjK+lUBtosOy43AWuyz5DSlTMc+n3SN//K5aV7pW
         sjj1t5OiwkL3v8yHdtFmhpP1rIC85nnr8UVP3ZuVeEOasa+Cc4iS++j76Bsyt1RcDExA
         m7kaBGmwpX2bYneSl2i13nPmo4uHae4/7m3CeLmly+f9l1ArtZ1GKuA3ZaXKyAl0VLhG
         Bfvw==
X-Forwarded-Encrypted: i=1; AJvYcCXB98UktnaodqxAc8jZVthpHeXtiCjmQ2E/dObUH8PLjZA2S838fjNiOkgn/8Eurh3Y2vXQQAOMqOV2hwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAmS4ve3cxkQ3eeV/DSLaLIxSQVc4ruUC+mmZ4/uJpEUKPoLz
	EIc/ZwDibsPGMxJalrvVb9y7yVN2ff7tTx60CefXHCuimLkBumTI7Bvu/cNY4w==
X-Gm-Gg: ASbGncvFtAEZmq6lnoDErA6+V+P0S2tba2+dTIOUR/uZWzGMqQlci22AlASiUJC/q4k
	ioRdV5g0CfTbOf4DQpcp58S38XYRc5T0PqiuBnQHa7F/c7ORleV4WKv8ujqExokytuYtdCfV61X
	doB7iYRyF3dvRukFRrd1k0ublXCI3eHvqJ+v5UUFOwGnMl3lSSMObzmPijwv0nF+9eHfAa3KFCN
	U8tBej2IW20c/orVM3FyjSK6VLId19Wo+l0cXHHUMT3T0+HMJMk9AspXWklFE9uxnI70wNkInPt
	1bhYrGhCthXOjV2OxN3Q9ytV3lqwS1Gp09Hg58sQgLTIhQ8=
X-Google-Smtp-Source: AGHT+IG5RDX9ELKWhy7U+xRS3VIKhi043iiEwxA4WvUdw/Q6+t/DjvYPY7UK3SxprNLahK6GIimuUg==
X-Received: by 2002:a17:903:41d2:b0:224:912:153 with SMTP id d9443c01a7336-2280481cebamr53711055ad.5.1743084130287;
        Thu, 27 Mar 2025 07:02:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f651asm128518625ad.209.2025.03.27.07.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:02:09 -0700 (PDT)
Date: Thu, 27 Mar 2025 23:02:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] thunderbolt: do not double dequeue a request
Message-ID: <vxocwwtfwg3tmjm62kcz33ypsg22afccd2ua5jqymbxaxwcigf@nnydc53vu3gv>
References: <20250327114222.100293-1-senozhatsky@chromium.org>
 <20250327133756.GA3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327133756.GA3152277@black.fi.intel.com>

Hi,

On (25/03/27 15:37), Mika Westerberg wrote:
> > Another possibility can be tb_cfg_request_sync():
> > 
> > tb_cfg_request_sync()
> >  tb_cfg_request()
> >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> >  tb_cfg_request_cancel()
> >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> 
> Not sure about this one because &req->work will only be scheduled once the
> second schedule_work() should not queue it again (as far as I can tell).

If the second schedule_work() happens after a timeout, that's what
!wait_for_completion_timeout() does, then the first schedule_work()
can already execute the work by that time, and then we can schedule
the work again (but the request is already dequeued).  Am I missing
something?

> > To address the issue, do not dequeue requests that don't
> > have TB_CFG_REQUEST_ACTIVE bit set.
> 
> Just to be sure. After this change you have not seen the issue anymore
> with your testing?

Haven't tried it yet.

We just found it today, it usually takes several weeks before
we can roll out the fix to our fleet and we prefer patches from
upstream/subsystem git, so that's why we reach out to the upstream.

The 0xdead000000000122 deference is a LIST_POISON on x86_64, which
is set explicitly in list_del(), so I'd say I'm fairly confident
that we have a double list_del() in tb_cfg_request_dequeue().
