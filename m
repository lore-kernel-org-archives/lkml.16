Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3218C011
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437112; cv=none; b=usMJIRUTFIpxvaAI9iof5ZGmKsIXiIhuOvUXJc9MkZ/M2NRFId1r/bEDZTnNBA4rUMWgPENaoH5DEoFkNBjeIU8Q3Kb9YfvXy2/kWuqd0bPQt7qmT2JbY9Ouj/IHX04PASto/FyM56KHJb+zgPnQ5mSkguZ6NQ2NZLRDiKZd6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437112; c=relaxed/simple;
	bh=QVITToH5qxhFx1BWQg+IbIBAmvkuTWFfapJECTVyxrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKZcKyvFSVy8OPTA5k4OUlz7bWqLFwJmWfCMJQvul4Ufc+b18ztozmXqZ7WIgg++XJBqas011k6VvYwm6LqEcjzG6+r6LRKZWRlh3RIesexkuAVaHhzF3zlx1mLP6qOL/NVuJSYfy0uvHAjxMhGvW7V8sTBEJQ7QNd2fQShnG90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aHCjCDc/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aHCjCDc/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a064a3e143so1795151f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746437109; x=1747041909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VLHJgN/oyXnrIo0WWcOurE6qrYDtA5nem85zqA8FMgw=;
        b=aHCjCDc/AH30B5seQBy6xySharzdung8XXfuOP4WwHiCaTbmsZp/UOF95o5CK76E5I
         4ghbmFTwZo93dUl5tMhc3KBQkkr3b5dlP6D231BmUjy1OdyaWgZn2rAXlX4VhcFenXzG
         UA+ExOA+39rD3/zgOeONw5bAObv0ZZ2OCR9gZhsPnkre4TtN87dSvZpIDhwKW8ihw49F
         41nsVnk9UJ/rF+iE+40rc8yiD1d5+28grjdGu756qEU3wWYemfM9zsQwpnxhcGHnZKie
         XHeHh1PtSEjhE8hmiG5bL11l5IRpkMqe2S1DZLaI4yNKjEo9wlilXEt8qRZKEgl6jnPy
         e5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437109; x=1747041909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLHJgN/oyXnrIo0WWcOurE6qrYDtA5nem85zqA8FMgw=;
        b=pdzIghmFnd+CQvok1E1WtRaMffg9DkD9W8qaWfc5seGCstd54Es8eWRUExfjxh3IKM
         Hkc69rDtBNVuTM3m2z7oQngOrjP+VwZ2CsxpbTarmvUyFRF2xV/xr4m9nq+nf0XhudE5
         MznWQDwh1rnlVwU7xvKjzaZU4DdElvZw7jU0EBlwAVNHXGZTX8a9TkilZvKje+l0AKfz
         t60C2VTkw3DSTB8vVHv3ojXpu26rEQT6BPVEnlVIrGQor9ke6cwZ01MNQjAFEdDu/MZa
         anFm6iChWYftLecLMBboYE81Y+k6jLfOUT4BjYPfNfkgQx1ruZCuQTQ9nqXBYXY/2m3o
         w0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU9e6uuF3RPadz/Nwu92Es2PHDX1GZ6QJ7+ivsqlIfjZhxktPi5Zu3fPvfHAVqyhkBRFHdjSJg1tUYUjto=@vger.kernel.org
X-Gm-Message-State: AOJu0YweqJdC2uYEuUXA6sNuzoX3hHovcAZqn+Td7/1uVN7yxh9YbF2v
	8dsGAkzLmE9nCQ0e2Lkv7WCVAC2XyJdncjMtS7g7yh7MbkwP78bQLjGyAX8THUU=
X-Gm-Gg: ASbGncumTuNuSaBdrg7k244l32P9rke6hpUPO5elAgW7NIvagmRr78wYoRGxY41Ytg+
	yQIyJbSvlwXa3So1uOXFaZ2z4zHDJ3sU58IprSDtEwAn+k/KEeTgiIFIxCTUHelx1xZgphMPNwz
	CS0iqI45qcXOehMlVeQFazCT/FjhwGLAdSWY860pYX3azfb+xWnVkZFhtFjzdz/AOl3xKy0dN18
	FukZS4GfPaBbrOgdSzQpN60l3G1R/CeH6fonGNs9po8u5h157Ql1fz0dbVcighQwuTKOPYgG9sv
	sFODJI6ifzVGGQ7ixOhIW6heCvlAa6jVks9OoZmaIGAN9aLUupM=
X-Google-Smtp-Source: AGHT+IH5gm4r7UQL7/3DyIsJr+nDH1WHtOXFm5HcZGmyx9BEqYlBQHtFS06BthbZ622QOaFlo1+d1A==
X-Received: by 2002:a05:6000:310f:b0:3a0:90c3:eb0f with SMTP id ffacd0b85a97d-3a09fd6bb68mr4319266f8f.12.1746437109067;
        Mon, 05 May 2025 02:25:09 -0700 (PDT)
Received: from localhost (109-81-80-21.rct.o2.cz. [109.81.80.21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0ca4sm9966523f8f.14.2025.05.05.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:25:08 -0700 (PDT)
Date: Mon, 5 May 2025 11:25:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <aBiD9C727RSyNtme@tiehlicka>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <20250505065121.dlEw6_SC@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505065121.dlEw6_SC@linutronix.de>

On Mon 05-05-25 08:51:21, Sebastian Andrzej Siewior wrote:
> On 2025-05-03 10:28:30 [+0200], Marco Crivellari wrote:
> > Hi!
> Hi,
> 
> > This series is the follow up of the discussion from:
> > 	"workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
> > 	https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> > 
> > 1)  [P 1-2] system workqueue rename:
> >  
> > 	system_wq is a per-CPU workqueue, but his name is not clear.
> > 	system_unbound_wq is to be used when locality is not required.
> > 	
> > 	system_wq renamed in system_percpu_wq, while system_unbound_wq
> > 	became system_dfl_wq.
> > 
> > 2)  [P 3] Introduction of WQ_PERCPU.
> > 
> > 	This patch adds a new WQ_PERCPU flag to explicitly request the legacy
> > 	per-CPU behavior. WQ_UNBOUND will be removed once the migration is
> > 	complete.
> > 
> > 	Every alloc_workqueue() caller should use one among WQ_PERCPU or
> > 	WQ_UNBOUND. This is actually enforced warning if both or none of them
> > 	are present at the same time.
> > 
> > 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.
> > 
> > 	This patch ensures that every caller that needs per-cpu workqueue
> > 	will explicitly require it, using the WQ_PERCPU flag.
> 
> Sounds like a plan.
> I assume the huge patches were made with coccinelle?

Yes, this makes a lot of sense. I think it is worth mentioning why do we
want/need to go through this major refactoring. From my POV this will
help cpu isolation in a long term because it reduces unpredictable
interference from pcp workers. 
-- 
Michal Hocko
SUSE Labs
