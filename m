Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA21F4C85
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889917; cv=none; b=Mnuelz3pA3xticN3P8fxL5A1SFSH8d0U25g5XJ7ntX05t+mZHCxThI2IWlnBNjj+lQp1gwX9RYpa6g0HdU6wlCEbvoMOgPh1XaEcXoTIpFZ9m4JzNth2vokiNq7Tq3pnaubFzqf0dZRY0bpiVBUi/IFlKX+XHKHUwGqGp/Ud8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889917; c=relaxed/simple;
	bh=yShfZ6ILsOBhd6koGDWWiQzQZWiggGZJjghyucsosDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur6SkQeK1rVDCUJtQ9sOPLaWDPX4aie7wP6Zv7abYSwn5lTpsrFCSeKvxZWycwHZFiJHrYJaTt4N99ZNYx4vw/0sm7klddwzHfJO0+NpXqNm+EUz2KfDklwBVAdoVeXminLH4b1X3mo1u982lKtrppbC2TvZHtgmHljPm78s3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gF6T6iJT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gF6T6iJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751889915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2coxbyxFXdSQKENSeYoc+GW9sQUhtsiwwJEzAsI5vW4=;
	b=gF6T6iJTM3Y2G6nGOR65p9FA32iuiKvoskPTKHttgqmeN/vRtaUUd/iKWz2dFV2trIBgcO
	6c3qEHPLPVnQBS7fuCQXcR2WB6qK7ZVTRiR5vmF1a8+0tn/aEzlBzr932JKynfpieHD/7g
	Oxns2pHsvcdsi7OuNKdO+CThgRbGUHU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-J-8k8FNmM9-TZWIjv2YmUg-1; Mon, 07 Jul 2025 08:05:14 -0400
X-MC-Unique: J-8k8FNmM9-TZWIjv2YmUg-1
X-Mimecast-MFC-AGG-ID: J-8k8FNmM9-TZWIjv2YmUg_1751889913
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so1103746f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889913; x=1752494713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2coxbyxFXdSQKENSeYoc+GW9sQUhtsiwwJEzAsI5vW4=;
        b=Wz7mMYGVGk1s0qf5TXB8h+Wwy1ZOLK7ciLLh1px7ARkxVQ0054e/ghRZI2/RJHji6w
         gMLGmiUkslXNSRyUlyxTLDOJMKsoPg2kL3uA2RH6QoWIV534CF4dzec9duAhvT+oQN1Q
         vjG+M+0W+XGcn3AKlkDpDN4aZuKlanVeZrDnsh9HLWSOt9SrHdMuWdtZK2Fl2xPuRlTK
         aFv9vMaiIXg6yfRpG1F7CrBGDIXp0Nz411shMdnXs5YZgFkjWayLiscspaScTCcuIngN
         OEK+esSF0qeAfD9WUSZS79+6RwVERu5v4QFoOETCo8g3l3XFCfqPOGI7sxqq/YhLo5El
         ycnw==
X-Forwarded-Encrypted: i=1; AJvYcCUnS3NnYhC/jnmIpIuW5HvsT/Lc7zlOW7myMEermPBUKLcg9r1eyvIur1I70zTv3JiZ56c7XfP+ZYs4bZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6h8txUManW3VV2wo/SJP0JxhkCqes6Ce6P1Shm/bCOES++r9
	l2zAE/Ue1/z3SoR1N9Ti/5hwvVjUpwY+4mEjOIE4TmSdBtgCgSugqAobQ2sGRmmiIHx92R9hS7h
	Opt0KkTPz1EzMKbbJkO66F+d9UduchIuANGMqXrHsWrdMsZaHug83Ua/tvjvzJNUg
X-Gm-Gg: ASbGnctkQhtd5/45OEhMO2aRyRzN93Q6UthMp9d2BKxR1N+ZPM6zqDYwOUZPAzdRuLU
	OsX5tEgA+A5uMxa18n9x0/RYrrGT5r05QxxxSDI/+Mg2DnIkO4sJmrn2Zs5W5BANHY4kUmQOjYb
	0HJjaWi4dvR6vsEHzBVSrpaeLWFJIGFh5yOqyt/GCw8rMHU9MVCynrWGQ6UlJ1PeFH3ja7I3jrc
	Dhh+zeVHJl9/b6rvu2Q9DK6T0MsMHrNn2aYCQV4qcACWi3QDKlxunrXzrW/qp7nYE39lWLhQf7g
	gfF4HIQRM9g03WOkLZ7Zld7BDDMVSQcOEYrHO2YoJg==
X-Received: by 2002:adf:e18c:0:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3b49aa306c7mr7357359f8f.25.1751889912204;
        Mon, 07 Jul 2025 05:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEi5xHzfaruNNWM5Xa5nbbHvwTT5Ypm3IkOF4wO8OCiHtSnJRFyxUTJ6ZrNFQU7wWPBnE0rg==
X-Received: by 2002:adf:e18c:0:b0:3a4:d274:1d9b with SMTP id ffacd0b85a97d-3b49aa306c7mr7357295f8f.25.1751889911645;
        Mon, 07 Jul 2025 05:05:11 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm9902891f8f.27.2025.07.07.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:05:11 -0700 (PDT)
Date: Mon, 7 Jul 2025 14:05:10 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Casey Schaufler <casey@schaufler-ca.com>, Jan Kara <jack@suse.cz>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v6 0/6] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <uzx3pdg2hz44n7qej5rlxejdmb25jny6tbv43as7dos4dit5nv@fyyvminolae6>
References: <20250630-xattrat-syscall-v6-0-c4e3bc35227b@kernel.org>
 <20250701-quittung-garnieren-ceaf58dcb762@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-quittung-garnieren-ceaf58dcb762@brauner>

On 2025-07-01 14:29:42, Christian Brauner wrote:
> On Mon, Jun 30, 2025 at 06:20:10PM +0200, Andrey Albershteyn wrote:
> > This patchset introduced two new syscalls file_getattr() and
> > file_setattr(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> > except they use *at() semantics. Therefore, there's no need to open the
> > file to get a fd.
> > 
> > These syscalls allow userspace to set filesystem inode attributes on
> > special files. One of the usage examples is XFS quota projects.
> > 
> > XFS has project quotas which could be attached to a directory. All
> > new inodes in these directories inherit project ID set on parent
> > directory.
> > 
> > The project is created from userspace by opening and calling
> > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > with empty project ID. Those inodes then are not shown in the quota
> > accounting but still exist in the directory. This is not critical but in
> > the case when special files are created in the directory with already
> > existing project quota, these new inodes inherit extended attributes.
> > This creates a mix of special files with and without attributes.
> > Moreover, special files with attributes don't have a possibility to
> > become clear or change the attributes. This, in turn, prevents userspace
> > from re-creating quota project on these existing files.
> 
> Only small nits I'm going to comment on that I can fix myself.
> Otherwise looks great.
> 

Hi Christian,

Let me know if you would like a new revision with all the comments
included (and your patch on file_kattr rename) or you good with
applying them while commit

-- 
- Andrey

