Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FF1D5161
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744764021; cv=none; b=U+DwLIGNsYweYPUA0WeFeT7PqpqH/E7wTIbI/RIeKE0/0VhW4qg0o6GoVFPz9hE0qolpRY0CHdBHaH0RobnWVunDQFkPNr0D8ZaTGG/mGAc0tfRxLHHKCJtA15WT3sBGtI4yYalywWw/HEnIp/qdn469r7s4pOva+o9Y//GWGIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744764021; c=relaxed/simple;
	bh=Ip8PpmLFaGG8McJks+JKiLaKfdoG08PpXiRXnfhM2tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3tDRtnZNyOBcD/FyxTjctMzzhJF678ymqmIGSCvgSfq+ZFNsPJJ57PPa69/Eonwp0bgtBwjAT2EhccvM5TFBbzRcc5nRSJ/5nIBFyFPMVbdnIQsOFsUhQAOIV0hz2VT8p4EBxuQH/TMuu1H7aNjrR72L8JUf5dewQKVpQcERnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=C01kRX3x; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="C01kRX3x"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736a7e126c7so5372824b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744764018; x=1745368818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mKvupK0kFMuv87h84KnhuI4pxcpKOLxjmuEk9QDadj4=;
        b=C01kRX3xzWPBLq5pcy32qsEICa+37+ubFHgjselU0RcCJTYOARWaoZ9U2+NLQFQdBO
         0lfeC2xdhAsTw8ChkOUr07+L4phHILpTx/2xLrcSmWHm213kIw+m7DRt0rw9geJcvO+g
         wgVl1wHo6PEc/cP3ZwQEbwWVl8IlOjcZYc+I8Ul4bdEbYAJB5kSdpAe1Y04NjDt7eylH
         MHKvLIk9vTqb0ARC49NGcOKOaKJO1FVUprS3Xxl8vyRVuRxav1zEOV7vwhbi0Che134Z
         pjhDe5vpxd5DIyoEWVIuwsMm1kzA9XKVe98Z+c4Vgqk8gPV7Qe45igRh4l92a/L2mfYG
         RN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744764018; x=1745368818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKvupK0kFMuv87h84KnhuI4pxcpKOLxjmuEk9QDadj4=;
        b=Jpyh6myKK7EcsMfoqa3qqMF8OEyhBip+nkudmvXaO4Rb+tYoHPw7o79/9CM1f0Bici
         JaXFJGCoVUaDlNv9jwni1Gzm8daHpyV0c+MOc/JOXwi+rfc6PMhiGsjqL/NCySIlNHBn
         Z5z9hRL8WN9A1zrcmCa/znTEL7KMMMenXI8COKsJsbXqhrDHFumNQsoSKC60kAkgPWFF
         pOdDR8K+cekgUlgAIMpJ/+qrZwn1kQPtQ4utjBRxfhOcwEL/SGeN8hh1a/eXmf/+T3Si
         i5UsS1mAVB+M8/EESR1Ftc3bDTM645KyXej0mL2vXZljxYcPwwehLlGGjhjlJf9Zm7pC
         osyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3pwypKsjuYXVsumhrXPBRIpHscDE9ZkJ3ODUMuvyZ/Rt3xt0AJpP/tdEXkVI04N03hsehkz4iWqvMcCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vNOGqWy69W3nz8uAF5qylIxVkNDCWSFNsTqaNCoLPie/bSSH
	z74dwLMPSXHxZHMIlL629mBjW/UURLFh/aHThBKwQbxoBGHNvit3yskKZ/t6GVE=
X-Gm-Gg: ASbGncvHnDuwvsROMSo7VPlhlm7qSdwEyBlBkhecb3cA0w9a3DCBy+64XPPT1f/Zqhi
	X6jg8mYLR+atHEYeoh15CaSPPMZqV5G4WNLyYKSp0rL1iDiyKcRFomLJJFXOVI4bnd1OgGwgtan
	aLlwTA8nMSKEf3BejvNIOAOc2vX14wQ4/2dKm53UpkrJINOVSyVP5Eew43lfTGqCpczyU92fyZL
	3h4/glbNETt9/x4pLlTXdL5bVyx5zU+iupHbQsS74bjEvzj+bLECvO1SKnEC2A7N0I6VCiKbpxw
	wC5nnZ0Vh/9n8JqSMThao/w9egh+WGYobO0tR8+Vk2kiEM1SRgaScMyw7eBlSg==
X-Google-Smtp-Source: AGHT+IEsrlIBzKt6yTxcyg6Hws7JrK8IfsbekYUm7Fhq39aPcW8AFdlZ5Qt88SVUn25nWyBkBOgvMA==
X-Received: by 2002:a17:90b:582e:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-3085eea783cmr1842670a91.3.1744764018287;
        Tue, 15 Apr 2025 17:40:18 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-308613b3719sm275979a91.33.2025.04.15.17.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:40:17 -0700 (PDT)
Date: Tue, 15 Apr 2025 17:40:16 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416004016.GC78596-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>

On 2025-04-15 14:17:48 +0200, Daniel Wagner wrote:
> On Thu, Apr 10, 2025 at 01:51:37AM -0700, Mohamed Khalfella wrote:
> > > +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> > > +{
> > > +	unsigned long delay;
> > > +
> > > +	if (ctrl->cqt)
> > > +		delay = msecs_to_jiffies(ctrl->cqt);
> > > +	else
> > > +		delay = ctrl->kato * HZ;
> > 
> > I thought that delay = m * ctrl->kato + ctrl->cqt
> > where m = ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
> > no?
> 
> The failover schedule delay is the additional amount of time we have to
> wait for the target to cleanup (CQT). If the CTQ is not valid I thought
> the spec said to wait for a KATO. Possible I got that wrong.
> 
> The factor 3 or 2 is relavant for the timeout value for the KATO command
> we schedule. The failover schedule timeout is ontop of the command
> timeout value.
> 
> > > --- a/drivers/nvme/host/multipath.c
> > > +++ b/drivers/nvme/host/multipath.c
> > > @@ -86,9 +86,11 @@ void nvme_mpath_start_freeze(struct nvme_subsystem *subsys)
> > >  void nvme_failover_req(struct request *req)
> > >  {
> > >  	struct nvme_ns *ns = req->q->queuedata;
> > > +	struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
> > >  	u16 status = nvme_req(req)->status & NVME_SCT_SC_MASK;
> > >  	unsigned long flags;
> > >  	struct bio *bio;
> > > +	enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
> > >  
> > >  	nvme_mpath_clear_current_path(ns);
> > >  
> > > @@ -121,9 +123,53 @@ void nvme_failover_req(struct request *req)
> > >  	blk_steal_bios(&ns->head->requeue_list, req);
> > >  	spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
> > >  
> > > -	nvme_req(req)->status = 0;
> > > -	nvme_end_req(req);
> > > -	kblockd_schedule_work(&ns->head->requeue_work);
> > > +	spin_lock_irqsave(&ctrl->lock, flags);
> > > +	list_add_tail(&req->queuelist, &ctrl->failover_list);
> > > +	spin_unlock_irqrestore(&ctrl->lock, flags);
> > 
> > I see this is the only place where held requests are added to
> > failover_list.
> > 
> > - Will this hold admin requests in failover_list?
> 
> Yes.
> 
> > - What about requests that do not go through nvme_failover_req(), like
> >   passthrough requests, do we not want to hold these requests until it
> >   is safe for them to be retried?
> 
> Pasthrough commands should fail immediately. Userland is in charge here,
> not the kernel. At least this what should happen here.

I see your point. Unless I am missing something these requests should be
held equally to bio requests from multipath layer. Let us say app
submitted write a request that got canceled immediately, how does the app
know when it is safe to retry the write request?

Holding requests like write until it is safe to be retried is the whole
point of this work, right?

> 
> > - In case of controller reset or delete if nvme_disable_ctrl()
> >   successfully disables the controller, then we do not want to add
> >   canceled requests to failover_list, right? Does this implementation
> >   consider this case?
> 
> Not sure. I've tested a few things but I am pretty sure this RFC is far
> from being complete.
