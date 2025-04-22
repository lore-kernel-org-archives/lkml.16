Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656CF14A4DB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318720; cv=none; b=EYV+pDFlUaX9R/P2mutKbydlAndCoAEqAzK40P1Qq6qRs94LbmbH9X9VC2gCPZOLfwdNENzyctafPOjt58zYFcHCrEZpQB48zrmrZiUgsbxo0bGrUi/bnpl7gpj8nnLY9WX/fxBon0tT+LcY6eyjKMKmgdUaw1BOXCrIeTh+DrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318720; c=relaxed/simple;
	bh=m2RHOwNehHpqHHo8iTUQFAX2G1uH1oLG9AUA3ukXizo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lL2a0AMYM4+WVy+1Pfzqg44peuy9ySx2LsDVoIiLGIRlGo1Fv1Z9P+p9eTrNuD4R3FhmC/PCZcAmSf6Dlhp10I5FRTHcR/vfFJ4fIdMFLhPQjNu4dqFiwWV4vf2Ri8V9lx+3MG8g29fWvKUapQekNzGbqDADXurOXOWcUHSn9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=FlwJgQ+0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="FlwJgQ+0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so672615366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1745318716; x=1745923516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2RHOwNehHpqHHo8iTUQFAX2G1uH1oLG9AUA3ukXizo=;
        b=FlwJgQ+0d/7BWCpfHKy7fLb0o1MzFwHJoEWXh75Llt05G3TuYuwBqX7fPEXuW1Qq3U
         o2+LTyZ+MoXlXX+gsdLtraRKo3YOd7q/c4MmZ9QAsTE8Cafs7aj+B7jhZPDZZ98Jk2bO
         DJtamS589LLghamNAtzB3I0mg0+SLFdP0C/1kR6idJaU9I4ryI4870Xj7q8BEmcNvlRh
         kdcZgP+p68rnbeo1w4dRN27BvMFKufQpNnYTPIM46f7lFOZA6NVXDGWqS/uidotmkgDa
         ozq755AnwZeUBOuLwXG/zwT0J6C1/sHsr9PxSQmFvL3VUvlaYrexXX6pQ7DsV4SEm8kk
         CAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318716; x=1745923516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2RHOwNehHpqHHo8iTUQFAX2G1uH1oLG9AUA3ukXizo=;
        b=IwSx3wjPRhD04kjADMJBamhgSUkFarpvXwWsn8fEozpk+RSzBt/1UbNWbymsyJALtu
         l3Es/1UPTo6hQfG06Z0K7ggABWSV9hRiXML2UD3dVgBukl1SaHWPMCNO2kY4VQUaC1/5
         4rpdYzDjmjMxEqk7+MxkBLE5Yp7Mp/ON6MzKrFdqFYS2EOWRiiBrVq3U0O7f5xiGS4A2
         VAhlXxCsT1XmybLpu/KzKYPd1KzBM2oI29332DWbk5zFkicclVEQpO3U8DgP1DB1eiNK
         oYk5pifsVa9YwlTChRNCMt4VTVGeJKDswFqHZMV3jVeZUC8UHwo/J6bD3t63/OILQZz+
         DxUg==
X-Forwarded-Encrypted: i=1; AJvYcCUPbqTcW1ITl4eMcgIBcucYDIUfgbelQp2NjGdYa02A3zVnCcBMQPZ3t8Xtms00FN9WmTMaPhXQX/8J6SQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgcrxrd0r/dDre0aiV47eyxN+hRmFHIrzOKOqWiTCjpNxQ9Nl
	bYdSl4FaBnvkDhwwA537jJtmRy18FpPUxKaCBxbot8uwTPWXYzKWUDrRK6dcjyO8AxgSJH/1qmG
	FJwFy2PQZQzq5ROadXJFmXFjQX2uMG06k/4o49w==
X-Gm-Gg: ASbGnct9yO8lzgSR+ZapXPrFtOwtcwB9ucZ9pygB9f0EF6S3mGG9OnVdVPGfN0OhNRy
	O2IJJFNkY6W8ziandhEOksA/zPNEGViVz/TSkLRJydI3f9YiI+RK838exlq5lsMblci2CQfncuI
	Pv24JDuN8Y3hlExkCUroeuWw52F8s77RJvQKRuLA==
X-Google-Smtp-Source: AGHT+IHx+3eNU+W1xgJPDHKdP9KuoPOiU85NmVMn/OQC3c3TyiEnbo5rA2WMCiD1pOnvJZdMuo/65psXoAv60jJaYi4=
X-Received: by 2002:a17:907:9450:b0:ac2:9c7d:e144 with SMTP id
 a640c23a62f3a-acb74dd546dmr1353350066b.40.1745318715647; Tue, 22 Apr 2025
 03:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
 <aAZiwGy1A7J4spDk@kbusch-mbp.dhcp.thefacebook.com> <ad67b397-9483-d3c3-203e-687cefb9e481@huaweicloud.com>
 <aAbzW1POQP9z5BWS@kbusch-mbp.dhcp.thefacebook.com> <98915ccf-4fe8-5d96-0b59-b3f3d5a66f81@huaweicloud.com>
In-Reply-To: <98915ccf-4fe8-5d96-0b59-b3f3d5a66f81@huaweicloud.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Tue, 22 Apr 2025 11:45:04 +0100
X-Gm-Features: ATxdqUEU6a1Z9Pu86iXO3XxDIu9CG7yYHsljL0Nlj0AZhY84eugrTgGJsExwkc0
Message-ID: <CAGis_TV7gq1fHM0YFz798G91poeKQWYo2cZq0eEo7ydT1Qen+A@mail.gmail.com>
Subject: Re: 10x I/O await times in 6.12
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 04:03, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> So, either preempt takes a long time, or generate lots of bio to plug
> takes a long time can both results in larger iostat IO latency. I still
> think delay setting request start_time to blk_mq_flush_plug_list() might
> be a reasonable fix.

I'll try out your proposed fix also. Is it not possible for a task to
be preempted during a blk_mq_flush_plug_list() call, e.g. in the
driver layer?

I understand that you might not want to issue I/O on preempt, but
that's a distinct problem from clearing the cached ktime no? There is
no upper bound on the amount of time a task might be scheduled out due
to preempt which means there is no limit to the staleness of that
value. I would assume the only safe thing to do (like is done for
various other timestamps) is reset it when the task gets scheduled
out.
