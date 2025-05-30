Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5A2820D0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634320; cv=none; b=S1rU/8TjN2LwFEPB1Whjtq4Fpt/fV0ZLmfvAeOucJIb12EU3/l9vU+m4qusYHyesgoqHM1aEdo0++0o/RDklfmdoAC/n62cPIq5lDLgW4Krstf4hIH8JHPwCto7sevFp4PURIkyWSGLfdXHKBTbwlaAoWT6Dr8L+e9suuDfT044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634320; c=relaxed/simple;
	bh=EeaHwLJP1b7aP+52eOMG2kzLLIkpJvV79sAdphPmorA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGi8W657QNxyDUnR3s3ODy4LekKgvDMck/rRMWn5zmTdBcm5RL+rQVBjR+n4S41Oy+pcToivsdF93Gta65q/nXAYpFxmwkOQBZAMjApDFnwOIElc8vr3LPXW9sGJolMl9gR5ELl3S+4IaL9aWDkWxh4Xob6sebaoVq2ioqE0B4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=w9k/DXk8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="w9k/DXk8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e331215dbso25199075ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748634317; x=1749239117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Lb9gK19lVJostbWgjUDtmKKqX07Lhy5W7Dpk4jXPzU=;
        b=w9k/DXk8vhEH9jbsDTSchcwbOWLXEUOympSaBegMXXmm2u/pzD8CsXjnwLIKDmiVWH
         aMXTv516zXtDK0mwxU7phZdzIuYJ6K99eTLAVy+xByKQfy/wcDoBnuMaD7Qt+k2WR0RE
         7TkKT1JmiqDGKhIllzYw++xg5NIhjqjJ5zsck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748634317; x=1749239117;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Lb9gK19lVJostbWgjUDtmKKqX07Lhy5W7Dpk4jXPzU=;
        b=Ctl3EFYYqEhOxHDDl2qBHSYzwTttbntUQ9sWkn11ldldmkiFr5zyByU8mjt6HGBLIJ
         in2N3ye3r/9DMJvkXfDvWBVNEGiP8gsMbPy3yce4w5I2r2RV9VJdQTBcM7NDNqZI/Ht5
         84I6Azv+fKCUkevlMk/g8mDdI+pBKxJTrSlcxlTKeOewyjAt5KNfZ2h4OOQAQlfOI2mu
         LmMiOp7/0bpMuqK73G1AUlqQoog2IxGvcPOwh/2l7YhhAYzwkVq2+9iXIoO6OE4qTbS0
         44TEAr5vv6QqPXOOs2XmJRyG6vit/pSG8g4VBmeocae/UnmoGMrRsZKEgPpuR5EBjwuu
         KOnA==
X-Forwarded-Encrypted: i=1; AJvYcCVaFupwqNvy7s4h6WSKpdie5mCmSgm35ZTfcu7fDPQVJu5ukJFTo7pSowkm6QBs4AAXvIeli9oZygEwmk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0ZZd/lNyDaXFH6dC+gC97E/onNd/9w3ruVhD4ON9RwCLzrUd
	FceGh7MS8HZyNchmcP0+UtV1we+Nx3GzVGsChTaULB1BRY3yHRHi33uCT9bmOdLLVtY=
X-Gm-Gg: ASbGncs64zQDiP1gNI1UgMDFE9cdou+bBoPNjRTADgc1spYEuNp/pg5sI2GDGgaOLxQ
	tqY/1PU+7EwAd5MOLg4kDOvg4xbsyhChaqoOWru5kg2QEH3Odbcq91moD+/FjrLFnBLP6l3k1TM
	a62+ESFvw9UWxfiz81L/6ZW1gZuimpo7DvxMGLky4J3hkjbfFZf/U6NE9h2JrjUVYqifhyPnIna
	mv/Y5FYhc8wnSPUnlOWwwevjyJBbZocWvIvUviLoNOLl68h4E6qXHNPsT2+GE/02kxMj4MqpoXL
	ikmiLqOAx8n2mzZQN0UibkU6hnbtWPm2VRzZH+z3y8nUMN9vJcQPSMzBbg9en0G9gtZB8f2hN/Q
	TJcTj9nU2L1NDuYw/ecIXdMK+Ie/y
X-Google-Smtp-Source: AGHT+IHYTayKgzes3pjEfxOEGOjuYQP5EzWW8jYaSd2BCsF4cWtCCGGULvjBHzBwuqDa1X7eSLYeOw==
X-Received: by 2002:a17:903:1a68:b0:234:6b1f:6356 with SMTP id d9443c01a7336-234f6a1eab0mr135626485ad.22.1748634316752;
        Fri, 30 May 2025 12:45:16 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd7602sm32040845ad.109.2025.05.30.12.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 12:45:16 -0700 (PDT)
Date: Fri, 30 May 2025 12:45:13 -0700
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, john.cs.hey@gmail.com,
	jacob.e.keller@intel.com,
	syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH iwl-net] e1000: Move cancel_work_sync to avoid deadlock
Message-ID: <aDoKyVE7_hVENi4O@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	kuba@kernel.org, john.cs.hey@gmail.com, jacob.e.keller@intel.com,
	syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250530014949.215112-1-jdamato@fastly.com>
 <aDnJsSb-DNBJPNUM@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDnJsSb-DNBJPNUM@mini-arch>

On Fri, May 30, 2025 at 08:07:29AM -0700, Stanislav Fomichev wrote:
> On 05/30, Joe Damato wrote:
> > Previously, e1000_down called cancel_work_sync for the e1000 reset task
> > (via e1000_down_and_stop), which takes RTNL.
> > 
> > As reported by users and syzbot, a deadlock is possible due to lock
> > inversion in the following scenario:
> > 
> > CPU 0:
> >   - RTNL is held
> >   - e1000_close
> >   - e1000_down
> >   - cancel_work_sync (takes the work queue mutex)
> >   - e1000_reset_task
> > 
> > CPU 1:
> >   - process_one_work (takes the work queue mutex)
> >   - e1000_reset_task (takes RTNL)
> 
> nit: as Jakub mentioned in another thread, it seems more about the
> flush_work waiting for the reset_task to complete rather than
> wq mutexes (which are fake)?

Hm, I probably misunderstood something. Also, not sure what you
meant by the wq mutexes being fake?

My understanding (which is prob wrong) from the syzbot and user
report was that the order of wq mutex and rtnl are inverted in the
two paths, which can cause a deadlock if both paths run.

In the case you describe below, wouldn't cpu0's __flush_work
eventually finish, releasing RTNL, and allowing CPU 1 to proceed? It
seemed to me that the only way for deadlock to happen was with the
inversion described above -- but I'm probably missing something.
 
> CPU 0:
>   - RTNL is held
>   - e1000_close
>   - e1000_down
>   - cancel_work_sync
>   - __flush_work
>   - <wait here for the reset_task to finish>
> 
> CPU 1:
>   - process_one_work
>   - e1000_reset_task (takes RTNL)
>   - <but cpu 0 already holds rtnl>
> 
> The fix looks good!

Thanks for taking a look.

> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
