Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FF672617
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748896354; cv=none; b=i5f6PTOdv2gSJhlIuUd8zzIHACMXKrOkZJOdks96zl/VBcEDXNOPVnmnXLgoc2reYyQHYsewfaMPP4Gi2EUYH9XuuKRtJNRgpOAAfb47x/i/XR22vAcugX1IG5AZP7QmpixceC1fJl4lhKkTlwXes4Gm6Zh5poyMD6HZAKMCgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748896354; c=relaxed/simple;
	bh=8YiIX5ztUCFTVRGP5ikeIXl0ygdPG4cKdB4yaiFbsu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cR2AFOHfM61ppkgh81mFFfP9YmhuB1StTcah9b8pCXm0FYPWSq9rRCbE/aFlMo4wD18L1RVJMnyl/4NM2MvwJLiihg9bUDb52Y/JHuXana+nFyoPQtx0Vl2WkFsDzCbWe6LN7qcuPKdeaZCZY9jED0Mkb26+ITWbKmzWjapLAKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=DkXBYGaF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="DkXBYGaF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso5596467b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748896351; x=1749501151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKY0xpRlWescwikOdDS95zv4h4U6S+cJGZjjK2bypvc=;
        b=DkXBYGaFgDWDDERQCtv9kg0VfeZoKjiSTnGW0XZOJdOcfz4vo+nuVujZmgMlgF06k/
         3N86PcioIC3bH+rQYW4eWMTpQNzdIkeBk8Txu1U7DJurEp4jBT0E+8NCspW+TbFEh356
         Ssdu740CiS9gK8Ieuw0Z7weKwoQXVMoIJPDfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748896351; x=1749501151;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKY0xpRlWescwikOdDS95zv4h4U6S+cJGZjjK2bypvc=;
        b=Y72YVpayvpbSgosezQOiYhbNGAxO8aYFLLChJoBpmP495ChFYhl/Set3LIstT4pxWu
         Sf93XMnRB0X7JwfAWUYvrbm1BwaFbSqb6aN8lT2WYk85Zths9c0R48Zs+7RZXih2XYBD
         O1s3744idBZl9BwkF4oNl7xk/EX1T8xL1GU+J/MAWxGTzGOTzuoyGvvtVnlekLncK96Z
         9ZDvoQ39aQyFJlVu3L98OykNL2Mb9xleGa0xd+gI/DiZ5rCAHk/MdW6d7H1c6vAlA+vt
         XfgvESnIQLqGlfhWSNCFcLgBTkpqUFVP+1E6NFqlZ3+XC9puiT38ltbROraNwbPTZACv
         niLA==
X-Forwarded-Encrypted: i=1; AJvYcCU1p3UppIFCKzXIcTsoorqD0oMwigau7m63GSYzcUu9vANYpReLjLkn0BWN6ul6e5uHQ1x+58LyY7Je1r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgezubD4CtOYciaSyMr1J0AJm2tnupRSu9GwCxS//MOD+opw8m
	gseVpp76/qLrW7JBrt2QiqN8O3xVY6ma8HlApmnskAjBcRE6eFq8eu9LK6OYWReyQZk=
X-Gm-Gg: ASbGncuhTSk7Z50KywkV+qIZXl+nD2x4nNWRVJIdSjv5RMB3078jJ17ReDfpcJAxwlD
	86186fcoBRXt0g8ghnhiyhoLNG5cWjGMUyblnO5vi9OKInG4a+z2wgbUIk2WYLNKLCv4ttdKFYF
	agL+gEudSqN0nQ7/rZwgk0aleLU9H0gVrfx9gV66YdYR0s2BvzAVUyoiUMbfvtgOyPdG6/O2WuN
	j9XjqzypaYgKIQxH/oOjErJZUDTBj9hD+UGXnrJi8VHB69rrn+iIZOThYxU7mx7VI8MV76yi8Fk
	HTpc+baZ9/I2z3it1nMDWaB0+7tB4Ui3Z0v12Tpj4pR6AJOAC8Sk3MzZn+HcKSlg5Z8PSnWc6/Z
	PmHzm4oxndjLdq3QGqw==
X-Google-Smtp-Source: AGHT+IGneH3ZjE1X55YkvRRC0w/esHFCwi1QDRyB+2Z4QhUh5mHCAaiOucMZE/mRoa8hbPYbxu9YFw==
X-Received: by 2002:a05:6a00:847:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-747bd969f9cmr16919224b3a.6.1748896351553;
        Mon, 02 Jun 2025 13:32:31 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa0csm8279352b3a.131.2025.06.02.13.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:32:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:32:28 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	john.cs.hey@gmail.com, jacob.e.keller@intel.com,
	syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH iwl-net] e1000: Move cancel_work_sync to avoid deadlock
Message-ID: <aD4KXAj0ZlZ5b42f@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	john.cs.hey@gmail.com, jacob.e.keller@intel.com,
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
 <aDoKyVE7_hVENi4O@LQ3V64L9R2>
 <20250530183140.6cfad3ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530183140.6cfad3ae@kernel.org>

On Fri, May 30, 2025 at 06:31:40PM -0700, Jakub Kicinski wrote:
> On Fri, 30 May 2025 12:45:13 -0700 Joe Damato wrote:
> > > nit: as Jakub mentioned in another thread, it seems more about the
> > > flush_work waiting for the reset_task to complete rather than
> > > wq mutexes (which are fake)?  
> > 
> > Hm, I probably misunderstood something. Also, not sure what you
> > meant by the wq mutexes being fake?
> > 
> > My understanding (which is prob wrong) from the syzbot and user
> > report was that the order of wq mutex and rtnl are inverted in the
> > two paths, which can cause a deadlock if both paths run.
> 
> Take a look at touch_work_lockdep_map(), theres nosaj thing as wq mutex.
> It's just a lockdep "annotation" that helps lockdep connect the dots
> between waiting thread and the work item, not a real mutex. So the
> commit msg may be better phrased like this (modulo the lines in front):
> 
>    CPU 0:
>   , - RTNL is held
>  /  - e1000_close
>  |  - e1000_down
>  +- - cancel_work_sync (cancel / wait for e1000_reset_task())
>  |
>  | CPU 1:
>  |  - process_one_work
>   \ - e1000_reset_task
>    `- take RTNL 

OK, I'll resubmit shortly with the following commit message:

    e1000: Move cancel_work_sync to avoid deadlock

    Previously, e1000_down called cancel_work_sync for the e1000 reset task
    (via e1000_down_and_stop), which takes RTNL.

    As reported by users and syzbot, a deadlock is possible in the following
    scenario:

    CPU 0:
      - RTNL is held
      - e1000_close
      - e1000_down
      - cancel_work_sync (cancel / wait for e1000_reset_task())

    CPU 1:
      - process_one_work
      - e1000_reset_task
      - take RTNL

    To remedy this, avoid calling cancel_work_sync from e1000_down
    (e1000_reset_task does nothing if the device is down anyway). Instead,
    call cancel_work_sync for e1000_reset_task when the device is being
    removed.
