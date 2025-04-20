Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98B1DF982
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745193552; cv=none; b=mRjt57DG7uhvr2PCHAFmVE9JUKmgFX4L9WiV6hHSD60937MiQnxRcxWcMzCewzNF6gk8Dd8/vubgin8ENntpBV3BDWCR45qMfnEVt1WkCHR04siR0hjrRXiAr2C0/S14AP+AwwAGUeZ2ioTNAa2eNhLjoviQcWaB5NGs9FLnBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745193552; c=relaxed/simple;
	bh=uvrU5+6s0N5cLHmxcMFQr453iUMpwlwi2e09+0hsKu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtNgeODEmv7fAXFjA3XyPqiHaPFQ66Zs4cI+Hq8GC0byfbNgR41FrKQBKZjmDhTGn4F/H/C+XU6f2ki9H9+KRyPzfZpGHt6qJQvZxeWucECi2U/GATgM3fkqbqvTSenkPuVsk5985namP3V9b70O3/H7/je9RlZHcCEpmWr4yaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bxS2JGdk; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bxS2JGdk"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so32819486d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 16:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745193548; x=1745798348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mQesHxfKtuc73XSj9cqVrV4U7M1K9OzNneDiyDjZ40=;
        b=bxS2JGdkJ9fxp1wsP8YncJl4qTwrJ4IoD0W4tDPCgXswbjoXgyw+iW6+fX1E6E//yu
         fzLra0/qSF63cvXCg4JrhxW5s1JtpV4IJ6kyud0x8JN9qgOYAORVjiWtMwIQHKYY57/3
         jih7sZYpniZnFwzJE0mIANXDc+jJYAD54MWUw4zx4D6wLkXBtcyE/IYKCk/vHb25yNwG
         CTLGxdHJtTCqGXEonjRBq8eonUC2Stxd9+pqvQKAfOycvA+19rorS2+/vTq2xWwTSrja
         gw5Uw+zxGMSj/emtoCPLVtWj4ItNbdYa31HfHhKQ6bOo7qjIDc+bq/6aWRk/w1YmaY10
         Cq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745193548; x=1745798348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mQesHxfKtuc73XSj9cqVrV4U7M1K9OzNneDiyDjZ40=;
        b=fhYkdHsMZnfjwhSO6pGXl+mYoPLGTAylNHDnsLodCqNrxFlJkQx4A8CTvQzuUB9IhE
         cr/ax0Y8RXYtAG/OA3PB+OZ1z9tTddhW4wTHsmqfq0U0VT8zE2kp2TTyJ575nOdIz2q1
         2fU4iuzssW1STRxMdmwZiL9YQQUem7b/q550IdYsA9Z7vJ0VesBKiRLNP6umdpnaM3x/
         RSy8q975nOGxc1jvztgVVNGoMitAqYq+14EGXMy/HUXs19kzGmh8rqhNbujAs25XKIqv
         rgg7So+H4QszcoOjx6X5M9gg+nK5MlGLODuWy5XZ+V5nRd3RUPWvtq52CG+Mjpmzptxx
         WgjA==
X-Forwarded-Encrypted: i=1; AJvYcCUwhqeBWSY9Bq76PeHRo2ol2xaSI5z2LcOxG05xxRbt1QNmtopa0RJ5HwPizaPP/BW4yc+yNIPfYSv7E50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7HQhvznRJ8cuzwJ8shP8HSc/d1qOjR1tOHNxcUeyPvS6EjRX
	rY2dNPp5X3LPI7W54WOLS1GzXr0r1X9T5izaedaNwkJE7IOd+2qKhWnKumUUA+g=
X-Gm-Gg: ASbGncsICCKcnQVBNnnWtgWlUmrYGnTHKdq6P3n5CSJJSxjNFjoNvdAVVMYpoOHyL42
	H5SPW+GoIkY0uk0Lo2w/WN/oUNB4rQJ8XGCDGsadSQos6ZmApPX9+4bYR1UZZ6ynwgNOBBWqBqc
	VnkrlEsU6ZyRUupIwotDQGOADVnYZlFXiihcU2oeMKL+H+nxjimcJKjFsGY8TcAJmzQY7UIhVTF
	Ok9439xptbwlcS25TmEBY9FqzZoZXJUBlpIZ1iwx73f0jhCRUqvfeVYhYOrWRlAwf5TyRlbN6PJ
	9UKWOIkPsnl57sN0Fg+XCeysoHvUGBa54NerL+Cj9Zy4eKwWQut9lTDE0C9iXMBHuIcIMYePO86
	T+twDP6Ns8WVfnIFKROeSTlNLfNmVNCCXpA==
X-Google-Smtp-Source: AGHT+IFhH1nWHcHOiEwOCjwti40tQB4MIiy3rrP4y16J3QXDbzb5k/8Z8Mai0D7KL4gpGcXFnHhTVw==
X-Received: by 2002:a05:6214:2483:b0:6e6:65a6:79a4 with SMTP id 6a1803df08f44-6f2c468812dmr184751696d6.44.1745193547812;
        Sun, 20 Apr 2025 16:59:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b3274csm37135666d6.58.2025.04.20.16.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 16:59:07 -0700 (PDT)
Date: Sun, 20 Apr 2025 19:59:04 -0400
From: Gregory Price <gourry@gourry.net>
To: Waiman Long <llong@redhat.com>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAWKSGsWHipFfi1l@gourry-fedora-PF4VCD3F>
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
 <532fe761-4907-4f4b-b98d-566453301399@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532fe761-4907-4f4b-b98d-566453301399@redhat.com>

On Sat, Apr 19, 2025 at 08:31:41PM -0400, Waiman Long wrote:
> On 4/19/25 1:38 AM, Gregory Price wrote:
> > diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> > index 893a4c340d48..c64b4a174456 100644
> > --- a/include/linux/cpuset.h
> > +++ b/include/linux/cpuset.h
> > @@ -171,6 +171,7 @@ static inline void set_mems_allowed(nodemask_t nodemask)
> >   	task_unlock(current);
> >   }
> > +extern bool cpuset_node_allowed(struct cgroup *cgroup, int nid);
> >   #else /* !CONFIG_CPUSETS */
> >   static inline bool cpusets_enabled(void) { return false; }
> > @@ -282,6 +283,10 @@ static inline bool read_mems_allowed_retry(unsigned int seq)
> >   	return false;
> >   }
> > +static inline bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > +{
> > +	return false;
> > +}
> >   #endif /* !CONFIG_CPUSETS */
> 
> I suppose we should return true in the !CONFIG_CPUSETS case.
> 
> Other than that, the patch looks good to me.
> 

Woop, quite right, thanks.

I'll v4 and hopefully get some -mm feedback

~Gregory
