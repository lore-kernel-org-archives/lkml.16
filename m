Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A78836
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126726; cv=none; b=uwfjh4D5BETeJxBRRlndQe9gdam8CG4gh9d+3TdvhuTCFZvMQHvvqSud0HkpYQs5eo9EhFL7H1Msj26vcq063kdQhSeQQp+f8ij+e0myN8AcYTNdf6YgbZFQZefYHiZrxoM1aW9fTi+KZmfdQztF0JeDuYnSJzcMANmpANXGOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126726; c=relaxed/simple;
	bh=K+nUlpfXwR5cIEWXrqVroexFbFR95tK5TbTH6vTS2tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiDA5l6+4p+MPunJ/1AkmIdvKZ6Kbpv7fLW42jdw4ccxnjsEtOBLYXlbxfaUJRO8BPqwpgY/OEgOwyQK6fW9IlyGpxeu408DxXR9gZG/VRHwgcvWaIPknxxoIOI/QKTN9A7KZhmM3HTfofrEWze6BCxtBk9rEAXNv1cf7Xen4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=FvRth3X9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="FvRth3X9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f71831abso880856f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1749126722; x=1749731522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dbLVCYoHw89K1sMrvh2/XLW0a7eFbrKEsFO9EoIT/p8=;
        b=FvRth3X9fdO01R7E4w8wiU499nMkrvaHCYRNMA/GdukO9ffXAOdpUbCFEKmyWOUPlE
         2egALm2jXrO6zK56yICXrSXCxmbUC4axjP+hKwtB3SW7TM/E5LSmP9oOFFgsJranX/Ib
         giDTO/21drRfPM/IMcABkuzRpVNarYO4nKGmm6Lto4ERhGtEWgWigQWTz6rZg4YI+JfA
         qrSMlcuAOp1m7vgP1zeWL5LNz0RRJRqOJ6Ct0uQCiHAA73WiqC5fXVPEbUELbbhIhCnt
         TcPmtALy5ZYQvJUPUHfLg2JxO77Q6laoj7Znn6sOETGCavCAW5xdZaVLaHWSTHMozuFN
         4tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126722; x=1749731522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbLVCYoHw89K1sMrvh2/XLW0a7eFbrKEsFO9EoIT/p8=;
        b=cmIb8gh6cc51znjy9AFWRNfyo332hvFshwAkd+MdPAzIcHepInELrB5R2g3HorxlRh
         A9gCJjseDBSbSNeYasHq8YLGwckylMgA6yiB1ozDOHTOqO2Y52eb54X6AH37njZl80KK
         Vt7foy1KciFxpJgaefE4Ugo1E0GdJGwAEaIspdk1YVDscyMIQCW8lPUlqkC9TQNeS4Qb
         u5gwXWt/IyKrH6XCwyCOdKIqY+BPFXdNkVe3t+/T5OThfnpHv4w4Q6aFRbuOzAC3vvnH
         45DPxQupt13H3D0g47Ji2U/mPR9IylmeQIBV+2zSCzAkCf9oxicZn5/yrr28E+sixslY
         xxxg==
X-Forwarded-Encrypted: i=1; AJvYcCU+f+luQVpE/PkiQzcBkFW8b6ikNocd8OgQRqZ8dwVH3t8w9fqSd5iPYcwqCSm6WV3z8rq5/Y3u+uWJBTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAPB7H03pkGaDScc5tUGaH8WF4iiRyo/YiG1FihVpkHfzY/bAQ
	OfElfrCRR+XJLwpH1D2SsBFZBTaW4i8skzhgTROs1E5Q4RbF+Ngh3+274Ris8sqASm0=
X-Gm-Gg: ASbGncvsSu7F2jMS+rkPz7FTddkVjI2EP4FKKK6bPxku55gnQ3xNXd2SrLvK/Yro0Dx
	gSu7Jn4P52UgVIf1B5EotYahXZleS+nA2wRTp75LoPMnb5S3vBTSIbzwkHYuwrIqcaK0y+XI+3a
	z/hwXj8U8Qy1OS2ssj0WhAphdJVPR1FqOgIVkGQPZChTF6wunbm9CV3+EO/8HUjSmObHcJS7R4q
	lW1dgzPCcQGGwRCMaImtO6ulCDDB8gTXpnGvD/WDNAzYXxrzfXyQlyPVithY2/rKgrUhbfMhmRm
	2+AtYLjTkoT7tEKkdxRTf252ccd2TIMoHsfK6zN8qFXxPn5E
X-Google-Smtp-Source: AGHT+IFXHPkHPf2uCdDe9+EQcmvwifuUNGAljP9j70NUml2wxh1XWMThBMmV1XTwFDvkJEfjag4DDQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3a51d8f5959mr6009327f8f.5.1749126722211;
        Thu, 05 Jun 2025 05:32:02 -0700 (PDT)
Received: from localhost ([2a02:8071:6401:180:da11:6260:39d6:12c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f00a0a96sm24730734f8f.96.2025.06.05.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:32:01 -0700 (PDT)
Date: Thu, 5 Jun 2025 08:31:56 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	SeongJae Park <sj@kernel.org>, Usama Arif <usamaarif642@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, Barry Song <21cnbao@gmail.com>,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	Pedro Falcato <pfalcato@suse.de>, Tejun Heo <tj@kernel.org>
Subject: Re: [DISCUSSION] proposed mctl() API
Message-ID: <20250605123156.GA2812@cmpxchg.org>
References: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
 <aDh9LtSLCiTLjg2X@casper.infradead.org>
 <20250529211423.GA1271329@cmpxchg.org>
 <0aeb6d8b-2abb-43a7-b47d-448f37f8a3bf@suse.cz>
 <20250604121923.GB1431@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604121923.GB1431@cmpxchg.org>

CCing Tejun - with the right mutt alias this time.

On Wed, Jun 04, 2025 at 08:19:28AM -0400, Johannes Weiner wrote:
> On Fri, May 30, 2025 at 12:31:35PM +0200, Vlastimil Babka wrote:
> > On 5/29/25 23:14, Johannes Weiner wrote:
> > > On Thu, May 29, 2025 at 04:28:46PM +0100, Matthew Wilcox wrote:
> > >> Barry's problem is that we're all nervous about possibly regressing
> > >> performance on some unknown workloads.  Just try Barry's proposal, see
> > >> if anyone actually compains or if we're just afraid of our own shadows.
> > > 
> > > I actually explained why I think this is a terrible idea. But okay, I
> > > tried the patch anyway.
> > > 
> > > This is 'git log' on a hot kernel repo after a large IO stream:
> > > 
> > >                                      VANILLA                      BARRY
> > > Real time                 49.93 (    +0.00%)         60.36 (   +20.48%)
> > > User time                 32.10 (    +0.00%)         32.09 (    -0.04%)
> > > System time               14.41 (    +0.00%)         14.64 (    +1.50%)
> > > pgmajfault              9227.00 (    +0.00%)      18390.00 (   +99.30%)
> > > workingset_refault_file  184.00 (    +0.00%)    236899.00 (+127954.05%)
> > > 
> > > Clearly we can't generally ignore page cache hits just because the
> > > mmaps() are intermittent.
> > > 
> > > The whole point is to cache across processes and their various
> > > apertures into a common, long-lived filesystem space.
> > > 
> > > Barry knows something about the relationship between certain processes
> > > and certain files that he could exploit with MADV_COLD-on-exit
> > > semantics. But that's not something the kernel can safely assume. Not
> > > without defeating the page cache for an entire class of file accesses.
> > 
> > I've just read the previous threads about Barry's proposal and if doing this
> > always isn't feasible, I'm wondering if memcg would be a better interface to
> > opt-in for this kind of behavior than both prctl or mctl. I think at least
> > conceptually it fits what memcg is doing? The question is if the
> > implementation would be feasible, and if android puts apps in separate memcgs...
> 
> CCing Tejun.
> 
> Cgroups has been trying to resist flag settings like these. The cgroup
> tree is a nested hierarchical structure designed for dividing up
> system resources. But flag properties don't have natural inheritance
> rules. What does it mean if the parent group says one thing and the
> child says another? Which one has precedence?
> 
> Hence the proposal to make it a per-process property that propagates
> through fork() and exec(). This also enables the container usecase (by
> setting the flag in the container launching process), without there
> being any confusion what the *effective* setting for any given process
> in the system is.
