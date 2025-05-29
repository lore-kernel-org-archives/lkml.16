Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2621E0B7
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562861; cv=none; b=I3bvelW+fpxK1R6SLNmFfwEf+WK8s3RvBy/rPSXnF7aiTFYDBEHE8BUf2/GytgdZTMh+si7L7zB5XqUmvwQHQJfErBDcd8g6xKa8xaX7IRowIqep+W6JDg3Kyl7U6f0Jb7oqF6rVB0Vf/X72hgaOUi+n42Yh8Gkesvm/gHeXroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562861; c=relaxed/simple;
	bh=fzBmoU/GBNrBZNry8iZF8TyWz5qhRHlF8PO8t/PwcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWOHzj3zxUhrWEM+jB2G30kLFyMKPPX08NlgD7K6Pf43Am5GG68kzcNwBm6pL9yZoMKRLxZLbG9xuDo5+b/mWXlLGweegZRe3hHR9DdzdIORrK5KXT1aR+0rgUTXSud109l3LHXZ6Ulj+d3J3LhR6cyzc3LHhEBbHq5DitRt1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=sTswQAmL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="sTswQAmL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c27df0daso1198641b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1748562856; x=1749167656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN6gTy630QM8CTJZaRMOSiOMF0uSjwbW1midZ/W3Pq8=;
        b=sTswQAmLopSf6mslRPiyoxyWCsE8Qv7oU7wvQLo6EwSH2q/fUzw8hu9KAv1ePXPR5l
         WhwsUz4k/LpxRhzJR7ATAsoc6uAQAcOcc7MDFOsBczd3c1ysoV3Y4w9+S7vAXL1e1jXG
         AEe1emN/IZLAC4dfAF59QhdpKLvcQYKd5uX0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562856; x=1749167656;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XN6gTy630QM8CTJZaRMOSiOMF0uSjwbW1midZ/W3Pq8=;
        b=SJRQT5OM20P6wV2PtWcBpDY3SmHYDMGTEKSbLEom/Bz/B/DtlhFYkti4ArmGvVRQHO
         QiUj4NLjddZbwWSYIqz+d1+XeMq/7B7yZk4c2Puq4d5rRFYWJZbamlQ2wtXO3RdcEIYw
         2TErYlcier+QhYABEmrPe4va2ZzctzmzEb+j5f/5MCY1M1jOJekItpSs0AFeSp1/0ATl
         FSVuM0PD2g8Vyof27KMWjpy/u6C6lE2EK2Rc7WOJIauoAC7LCNnkRBezWp7HLKl+4pTu
         /z7qlcTqCWLHdy+1vdKJWJJVDm5roEH8UAKkpHrU0KhCNO+Hi24kYrM4FbL/53b5DXN7
         lKJw==
X-Forwarded-Encrypted: i=1; AJvYcCV/B641gqgNyBGAHS0sgBtrRHl7xfdweTib2+JR2/nuaV0eH0+LRiW6N9HuaP2M3KU/JjhQ1TvdmUvo/ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnZv0DLKQ8uh5skNkiAUFSNpw5zO9xYuCZO10hD1uqMr+plM2S
	aE2hfJ+UIx2DmdZtGCqMhT3/x4gCvE2Dpd/vDdJ0zRK4H76e6pARQ/hZRS2JMKIrLiw=
X-Gm-Gg: ASbGncsL0Ykhw+halId0z5Sf1DyT9n9KSVYMbDTF0WtkTDnu5Qm2VDpVWmqtyv3MnPj
	H+PwsspIv5jg6zJ7SQMbSEBsexwp5Qb1mkN8drySQ2jdvx8Da87TT0p7nSlqysuFoam4UpHEMaz
	gSs0rr9rks6O4WOMLunTo2Xc1FzUoomOdOV1mlsWzYMygfZJwjLoY+Q+z9K++EwXX7PYCIlqTRx
	UFOMctYu99/DF3y7F92gE/M47aOZ/XNaoJiB96puGRtzEa9dDWgBgXvwLVHYSIEe8Us78HWHiS5
	VtSblNazdYxm572UtlDc4Bzx90xu/TmokO+OPYNMUir213qIA2uYy/uF8caMmUugptJADyXMJ8l
	Ka9j8envCDTSxGutg6yMn0h37QbTBNvo8fQ==
X-Google-Smtp-Source: AGHT+IHRL6MZaRCV2qyHdIA1Ey0rZLl6zqYTvtI9TzqaPZDL2PqmYa7bTx0E2QQp2U5dgOaO4Eq8Hw==
X-Received: by 2002:a05:6a21:6494:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-21ad9572f95mr2027987637.17.1748562855934;
        Thu, 29 May 2025 16:54:15 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affadf5asm1874242b3a.115.2025.05.29.16.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:54:15 -0700 (PDT)
Date: Thu, 29 May 2025 16:54:12 -0700
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] possible deadlock in rtnl_newlink
Message-ID: <aDjzpDHwcFuGhAqp@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
References: <683837bf.a00a0220.52848.0003.GAE@google.com>
 <aDiEby8WRjJ9Gyfx@mini-arch>
 <20250529091003.3423378b@kernel.org>
 <aDiPFiLrhUI0M2MI@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDiPFiLrhUI0M2MI@mini-arch>

On Thu, May 29, 2025 at 09:45:10AM -0700, Stanislav Fomichev wrote:
> On 05/29, Jakub Kicinski wrote:
> > On Thu, 29 May 2025 08:59:43 -0700 Stanislav Fomichev wrote:
> > > So this is internal WQ entry lock that is being reordered with rtnl
> > > lock. But looking at process_one_work, I don't see actual locks, mostly
> > > lock_map_acquire/lock_map_release calls to enforce some internal WQ
> > > invariants. Not sure what to do with it, will try to read more.
> > 
> > Basically a flush_work() happens while holding rtnl_lock,
> > but the work itself takes that lock. It's a driver bug.
> 
> e400c7444d84 ("e1000: Hold RTNL when e1000_down can be called") ?
> I think similar things (but wrt netdev instance lock) are happening
> with iavf: iavf_remove calls cancel_work_sync while holding the
> instance lock and the work callbacks grab the instance lock as well :-/

I think this is probably the same thread as:

 https://lore.kernel.org/netdev/CAP=Rh=OEsn4y_2LvkO3UtDWurKcGPnZ_NPSXK=FbgygNXL37Sw@mail.gmail.com/

I posted a response there about how to possibly avoid the problem
(based on my rough reading of the driver code), but am still
thinking more on this.
