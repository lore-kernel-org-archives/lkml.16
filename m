Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC798217F3D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086263; cv=none; b=LvcueA9zcOb4A85uwhIjftzkogCqWe8FTFmXYso65YyBzrFSD3LR6M4s1D1RK08GmWe/2IYPo3KOQq9Sv02x/ZRChglPtxkWk4R9E24LEc1KyYDCynHYthWYX84AUoflbfHG+Cy0L3VhGkyeroDhM9III307vRRowW3y+/QNbDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086263; c=relaxed/simple;
	bh=rh78FnAgDh7+6L3xkcXgv7jI3XE5C8Zy5LssjSEdqwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUjuODF9eNQhJrf5GG1xMtGeDaj5P0ye3g70eE2Ih39Ay8S47SKexlt2Pud4FSwIhplYXloNvcqtaKUpeYq08rhdNDfxLXlkkED5Gh/Q7Jg8BLI8fLaHFnLx/nMeBdxnB1OJ401TFM3ZtEEszxCIbz5Bvnv/OPMwdj7iIUVY8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hLELv1rU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLELv1rU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2279915e06eso23906315ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743086261; x=1743691061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7AEAiIkk5Hu1rE5JHD0eCv30WZS301REfGBN883s9I=;
        b=hLELv1rUaiQSuxDNoMa1ItlPtClBzi3vX4l1No11LLACz221r4uuXEsBqfLOcvsFU4
         F43NAtCJG/PG/2qW/iokf9ZpDXPJrvgTAe8JmD8I6MWCVlRwP3lxG0XjSQMH9EZqhBs+
         dv4/BoAg4F0Xt+5YJ0mooJyQsbzO+1MYCpA6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086261; x=1743691061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7AEAiIkk5Hu1rE5JHD0eCv30WZS301REfGBN883s9I=;
        b=rsg7ytNKJ8mxu9IPShSNR72CT0c69f30Hbf/Vi9KzHWXlXTQcOdO1szPR+eNs3gaSC
         E+lyHE4eVgikynFmrZzCJxUJjElMmqmkETM7pfezXCsJHLPjTyNYuSF7SIozJEH51ftt
         OPbtLkg9rjZgUfb7sPc353bmiNLcRq1dAfjPW8kMMqX7qSRKucHxAlkpiN/H590/W4rL
         ZBzYX9lhEG94f/tFqWBskKk4KVa7cM5VWQgV/O4+yjhs1WuFQAr0rMAcivZOFydJ0BHW
         LR2B4IQ89pmNJgsMHZzMJiIG4CTULxyzxX4IQNKpQkmqgxKGfscjeL0Paf7eynwo7Um2
         RveA==
X-Forwarded-Encrypted: i=1; AJvYcCW9pjmrkeTAsrbwoA6mCSQNEKgnE8OZ12Ar6l3UTduY3kvUyABFkRqHYSQ/YDvQKy1CYCZ85exflWIJbjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMCQnKXQv+O6xTfXdsnGSLFOGlfQ4H0aAj4oWg34m8tTx8URb
	gMSyiJqnxsRwtbBJaCvE4yg37q1ehfm1dFvs+F9ryhcCRZTqQwl0ZG12aDljcP54Dfh91jeo9UW
	rJA==
X-Gm-Gg: ASbGnctEJZ/wYDuPsCwY9FO9HV6lzCt7YM2Cc311xt6jNU7IaJx3X4+hzZRYmQxgXeJ
	Nutu456x4QCwUlD5sDEn4sMHuZ1ENW+chwNzZX1X7S0+5Cg6K2ggZ7vuavXNZ94uNskXovy9XNj
	n5d3neiv+ebqsFw3K4qwIGZjrh0zC0qK6v+IBnxP8kMgJmkqtyQ2QVPWGnpcR9Nw8RVDkVlP4tN
	qiJHusDCjoU5Cl2C7VtmvxRh+c9Xm2iMdFCQgnjcykHv3vqgLxtC6OQLcUX9v9H+0AwxWPtZdsn
	fj/lC5ZPlvlWKX/LeJY6jj4a/ovMzbuYC5s57ttbB43GiKIaVx30+hV4Rg==
X-Google-Smtp-Source: AGHT+IGtYarDh/z7nqrczZg273wliIF7XY0O4ifoMWL9Q6JUrzPUziMeQhewoyICqmDauCRSuYD1vw==
X-Received: by 2002:a17:90a:e7cd:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-303a88aeea5mr4324639a91.23.1743086260775;
        Thu, 27 Mar 2025 07:37:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039e10b783sm2273895a91.22.2025.03.27.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:37:40 -0700 (PDT)
Date: Thu, 27 Mar 2025 23:37:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] thunderbolt: do not double dequeue a request
Message-ID: <jdupmjvntywimlzlhvq3rfsiwmlox6ssdtdncfe3mmo3wonzta@qwlb3wuosv66>
References: <20250327114222.100293-1-senozhatsky@chromium.org>
 <20250327133756.GA3152277@black.fi.intel.com>
 <vxocwwtfwg3tmjm62kcz33ypsg22afccd2ua5jqymbxaxwcigf@nnydc53vu3gv>
 <20250327142038.GB3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327142038.GB3152277@black.fi.intel.com>

On (25/03/27 16:20), Mika Westerberg wrote:
> > On (25/03/27 15:37), Mika Westerberg wrote:
> > > > Another possibility can be tb_cfg_request_sync():
> > > > 
> > > > tb_cfg_request_sync()
> > > >  tb_cfg_request()
> > > >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> > > >  tb_cfg_request_cancel()
> > > >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> > > 
> > > Not sure about this one because &req->work will only be scheduled once the
> > > second schedule_work() should not queue it again (as far as I can tell).
> > 
> > If the second schedule_work() happens after a timeout, that's what
> > !wait_for_completion_timeout() does, then the first schedule_work()
> > can already execute the work by that time, and then we can schedule
> > the work again (but the request is already dequeued).  Am I missing
> > something?
> 
> schedule_work() does not schedule the work again if it is already
> scheduled.

Yes, if it's scheduled.  If it's already executed then we can schedule
again.

	tb_cfg_request_sync() {
	 tb_cfg_request()
	   schedule_work()
	                        executes tb_cfg_request_dequeue
	 wait_for_completion_timeout()
	   schedule_work()
	                        executes tb_cfg_request_dequeue again
	}

I guess there can be enough delay (for whatever reason, not only
wait_for_completion_timeout(), but maybe also preemption) between
two schedule_work calls?

> > The 0xdead000000000122 deference is a LIST_POISON on x86_64, which
> > is set explicitly in list_del(), so I'd say I'm fairly confident
> > that we have a double list_del() in tb_cfg_request_dequeue().
> 
> Yes, I agree but since I have not seen any similar reports (sans what I saw
> ages ago), I would like to be sure the issue you see is actually fixed with
> the patch (and that there are no unexpected side-effects). ;-)

Let me see what I can do (we don't normally apply patches that
were not in the corresponding subsystem tree).

In the meantime, do you have a subsystem/driver tree that is exposed
to linux-next?  If so, would be cool if you can pick up the patch so
that it can get some extra testing via linux-next.
