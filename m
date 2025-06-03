Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82F1E519
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955428; cv=none; b=KARyhYIqJy1kq6aMw/5HckFJ2c1rljohNTI5+LN7qHBqKarIeNGvtKjvinnwPhwe5xpn/dZkGI/4FaGRcjfR6NHG8rxHCf6C3vmKAk0WrOSYnIbRcj2yDIMx6Qe19BGR8nPZ+GlyUoKojCH5jIwUwbOLU1JJaSRdMqk6JyFTPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955428; c=relaxed/simple;
	bh=JB5dJY1ZvEfS5wF759w9qPwAnoG1BBGlK7STGS/xjYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCGUvrzJoPn6ey4ioLc2CFxEGIsQBXvrWMf+fjKtMfdpbABTo86diEHAs+R+5R+jDM9HsKd/7jEBG1ZRQX5SmPfb34Y81VztuoCdjRuLHunSuJXj7gJPf1FmyD7Aw8W5RaZbYKOGsPaJFvlGnGmai/OrTTeQ0MsvUbMxt3PFE9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmxuHz5A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmxuHz5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748955426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hXN9nPbX3VjM2OeWHPUoDpb9LpXeCU9nEzDdnFdKokk=;
	b=SmxuHz5A16E0jK8IuYBSGffIFVNpLTZVHYJkw2qwwZ/yzP0KmmSKc8zZVWPj74SVJgQFjb
	2Ri8zfB/vFtM699Kq4Yui0wObMQGzCwCR+7Fon07Qrnoz9bUa31kDded2OJI1dV/QvDcJ2
	xKFdLg/JZ0gwZfHWlvwX4MHrioJFaQU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-YxuB4EGBOPeFqJBeX4rZKg-1; Tue,
 03 Jun 2025 08:57:04 -0400
X-MC-Unique: YxuB4EGBOPeFqJBeX4rZKg-1
X-Mimecast-MFC-AGG-ID: YxuB4EGBOPeFqJBeX4rZKg_1748955423
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56F771808888;
	Tue,  3 Jun 2025 12:56:55 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 304753001FF6;
	Tue,  3 Jun 2025 12:56:47 +0000 (UTC)
Date: Tue, 3 Jun 2025 20:56:43 +0800
From: Baoquan He <bhe@redhat.com>
To: Jiri Bohac <jbohac@suse.cz>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v4 5/5] x86: implement crashkernel cma reservation
Message-ID: <aD7w/YfdKMqa7m89@MiWiFi-R3L-srv>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
 <aDoVhDc11ZcJyHm2@dwarf.suse.cz>
 <aD7WLv86BOVS+GPm@MiWiFi-R3L-srv>
 <aD7mi4j2llS-Kpfv@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7mi4j2llS-Kpfv@dwarf.suse.cz>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 06/03/25 at 02:11pm, Jiri Bohac wrote:
> On Tue, Jun 03, 2025 at 07:02:06PM +0800, Baoquan He wrote:
> > On 05/30/25 at 10:31pm, Jiri Bohac wrote:
> > ......snip.. 
> > > @@ -582,7 +582,7 @@ static void __init arch_reserve_crashkernel(void)
> > >  
> > >  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> > >  				&crash_size, &crash_base,
> > > -				&low_size, NULL, &high);
> > > +				&low_size, &cma_size, &high);
> > >  	if (ret)
> > >  		return;
> > >  
> > > @@ -592,6 +592,7 @@ static void __init arch_reserve_crashkernel(void)
> > >  	}
> > >  
> > >  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
> > > +	reserve_crashkernel_cma(cma_size);
> > 
> > Wondering if ,high|low is still allowed (or needed) when ,cma is specified.
> 
> Probably not needed but it works, totally independent of the
> extra CMA-reserved area.

Allowing it can simplify the current code, while I can't imagine what
cases need people to specify
"crashkernel=xM,high crashkernel=xM,low crashkernel=zM,cma" at one time.

Just personal thought, I haven't think of a strong reason to prevent it
too.

> 
> I saw no reason to artificially prevent it.
> 
> -- 
> Jiri Bohac <jbohac@suse.cz>
> SUSE Labs, Prague, Czechia
> 

