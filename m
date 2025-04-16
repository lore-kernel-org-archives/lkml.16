Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD563214
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762664; cv=none; b=QO1c5tm1n0tws1fkhrPKG09C/fnl5jK0outWpYVUeIanM131+hOvMVIPVcJ2NbOaOLTbtly/LVciryFEp9QBO+Mgu4ScBTu9PJdHeUoDYitrCr97gvV55GK8u05CijNtNqCHIyZxPXMwmu+8FApSYF/r6lsOY3zxIBq2wc/UiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762664; c=relaxed/simple;
	bh=5o2L+bdgN/r1ItsOwGbpMkCoTal+8psM6n2r7JXhR4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjRSZniw8tzXZqGkNQT7H+1DwrQ/+jYF6NMHS+dcwmuKYkNcVKocLvM3tthOKM4VEfI3LR5qJEzZ61tfZI+goOC/0u9dX6Oo6OjMrlKwA2fPDnK8hXrKAAzNXY61VgYw7H068Xqge/ap0y8+ii8WtlefPzMtYgpIdNd9URWWjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=E2lFXarN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="E2lFXarN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b350a22cso5305931b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744762661; x=1745367461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfGcDf/DpbkHEBsh/Vn4tDO8cN+GHpaQalPKB5/PXdU=;
        b=E2lFXarN+ncXstqq/acyu4qTqnm/PZYsTMHbsqxKofiJwPKD5kK+XvQWU5BjyJEqKT
         eKA05oQ5iXUGLy2Cu/jjnX+GoyRxgxvDefjkEKThuOfPokNiEBhW2/8gIvCqA1Two0Gk
         63ZeVdXHtRCZZbP1XjZVBpRPBv648DJ1E9KeizC7bD2OAyViWYkUmRl9BunCUPsILr9a
         oWvOoHz2/DfgQnIkugYQcP63JHlx4KTY06RMP8C9FvI4NLmEMvqxlQgu7fgPtfAUbcHM
         aMhpm3YF8FQbm0zUUJ88LBGDRNKECPMqDl70NL9cs+VWyfbnYH+ul7ob2aNlwc+7X5dr
         J3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762661; x=1745367461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfGcDf/DpbkHEBsh/Vn4tDO8cN+GHpaQalPKB5/PXdU=;
        b=HavtW4aXjKVfTlWiPRgKXDP/lVm21NFOPV7a+wqLDtgXiNVd92Lg6mbiO1VqB2ljeH
         lUJk4BkLGpH7l4LN9VRDtcYTj7Ykoc7RL2V7b8IGAWn98B7PFcd8SYOMyGbRywfkv5aw
         yM7fP4E3awhAF5aoSu8zto/XWHzAVc+XVcoM+NRKmnwR+GwpDU7fnU/MKz/k4UIcSdQJ
         zLdX2U+cG8kvIAKuOxOV0wX2wuM5eZ84SohnGJEsobdSrkoS4A9TyfWkaDRWCGoMqbL6
         j2wLYCAHLI/7vAXAhXAA1pKHzh8IqUwscfOcKijU8zvPlouGV3v/3+zh7m6iMfOjPMNT
         3i9A==
X-Forwarded-Encrypted: i=1; AJvYcCXhbc1tw5Wek9XGo5SMZzYaGBXS9fNPNO/dKwZEAa91GlcujXIYc3LZG8edS4E1dR2VlTli1OUCe5+5Y+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YylK4no3MHz7vHO2FVuAnZf50OlJBSzSAOQbkaey9MW9qCBX3mD
	7TdykJLewNYHWzLQfoK2y+PkMSMncsJdkSuuH1JL4uGX2UydCJ6DYOIjszn4FG4=
X-Gm-Gg: ASbGncvgm/EdR9qor8SYSSsGw+mRMEMeMOPu9tOSy1qvyPHm9nQfv8tL+t07B2oMsXk
	5VjCfDFS8BKnE9BppjUIT4bwDEp16ultTZ9Gdhaz5KIK32Jmx376ZyszQdBSbAPtEl46bOywC/l
	dQy7jc8HSLPbaQoAM/anXSJ/v6dZQ+NdwaUmnGFbiAHYYHuhwM3puiJ6dZ1LFhYhGbjfWhl3wmi
	H/kZFmQ5YcBnZtMfdI8T001kWipl6kFYyqYEXWO6Q9mCJ4WWaDaOcSjnp+fn7ABUzub9ZD4zmTE
	OyZHTM8DTkDUOt9VoB8SfSame+ULahqG1XeFn21gdtbwjTDPcdbhFH2r3yl4iBYktuW64gKz
X-Google-Smtp-Source: AGHT+IEsZXbFUEWjm9tj/ceIf10A86DIbq4BRB2RJvH84hKcWqXJ5FZPGOYNVb6N98kev1z48eVeoQ==
X-Received: by 2002:a05:6a00:1311:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73c1fb3c5b0mr1924502b3a.20.1744762660755;
        Tue, 15 Apr 2025 17:17:40 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd21e14e9sm9157334b3a.77.2025.04.15.17.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 17:17:40 -0700 (PDT)
Date: Tue, 15 Apr 2025 17:17:38 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416001738.GA78596-mkhalfella@purestorage.com>
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

Help me see this:

- nvme_failover_req() is the only place reqs are added to failover_list.
- nvme_decide_disposition() returns FAILOVER only if req has REQ_NVME_MPATH set.

How/where do admin requests get REQ_NVME_MPATH set?

> 
> > - What about requests that do not go through nvme_failover_req(), like
> >   passthrough requests, do we not want to hold these requests until it
> >   is safe for them to be retried?
> 
> Pasthrough commands should fail immediately. Userland is in charge here,
> not the kernel. At least this what should happen here.
> 
> > - In case of controller reset or delete if nvme_disable_ctrl()
> >   successfully disables the controller, then we do not want to add
> >   canceled requests to failover_list, right? Does this implementation
> >   consider this case?
> 
> Not sure. I've tested a few things but I am pretty sure this RFC is far
> from being complete.

I think it does not, and maybe it should honor this. Otherwise every
controller reset/delete will end up holding requests unnecessarily.
