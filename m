Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256551E5B7D;
	Tue, 27 May 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352413; cv=none; b=rtVV3Z+QzlbceVZna3+EZJ/a09CKnfvj3qgnPQrgK+MglHpR2vblLMPqEKzqtvmu2gy4VVOcQv4ccC0yrHUoDx4DbrUoURr+wfsUpWy6o5ubSDZSIo4CUevT3bNXcpjtaJvPgqBoAW0ACC/QCsNyxZfPH9GxspeDT4zMWP5SaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352413; c=relaxed/simple;
	bh=9Nju7W2tBpY6Umbm+ZlZ2RCV+w3L+6p695flvHencLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw6mJCe5zfyc2fy4dqi1SCz9ua0OU8L3lK3VZV8NvN0KDEvs1FohAVHQkmgLNHQrPHhfQm+Wzgip8/4XbbQYbR6Wqu5XdSleK+uqRKyK52xo9KXBo6+GfbpG+UDdsBGjT+7m0mlpDdIBRfG/4PNSd9zqLPY4Pc9W/yyM6k7Qk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=SIXORjoS; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="SIXORjoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1748352411; x=1779888411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q8veB2wF5n1DVr5z/lMeUWHv1/zn9z4Fuzg/6Q4u8q4=;
  b=SIXORjoSHw7fkasSNlPOJYr+oEEQDOMam9g4mQPZ6uDeWsRJlK30CtFM
   5GI7wOz2Q1rME7F5o3+suaElZoSwcYUropcMg75chkodQoZMj391h2gCV
   6Lx0enmcSV8VnQk8a4F37Mwz67gdn+9rvlC2g5n+vIA7G9+BmygjMtYqb
   A07y1kTzo99t8Ojo+IP1KoW1b3fvxBkD3BrARtO/MpSrOuwuqBwj7F8tG
   DqIt2hBkZ5/N7pAz29xArqoBgI1Nopbpu8KcBeYRz4eVAHcoUqdsUqGgs
   FJlAelxSLKXOuV2g5il9jrst1xcU6UkVNiSUwqKV+lLgwME5Kv60rPg2f
   Q==;
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:26:49 +0900
X-IronPort-AV: E=Sophos;i="6.15,318,1739804400"; 
   d="scan'208";a="534611313"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 22:26:49 +0900
Date: Tue, 27 May 2025 22:26:46 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH] sched_deadline, docs: add affinity setting with cgroup2
 cpuset controller
Message-ID: <aDW9lgkZaP9pI5Jk@JPC00244420>
References: <20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com>
 <aDW6EckuCFTZfPZ8@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDW6EckuCFTZfPZ8@jlelli-thinkpadt14gen4.remote.csb>

Hi Juri,

On Tue, May 27, 2025 at 03:11:45PM +0200, Juri Lelli wrote:
> Hello!
> 
> On 22/05/25 17:06, Shashank Balaji wrote:
> > Setting the cpu affinity mask of a SCHED_DEADLINE process using the cgroup v1
> > cpuset controller is already detailed. Add similar information for cgroup v2's
> > cpuset controller.
> 
> Thanks a lot for working on this. Really appreaciated.

Thank you :)

> > +5.2 Using cgroup v2 cpuset controller
> > +-------------------------------------
> > +
> > + Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``.
> > +
> > +   cd /sys/fs/cgroup
> > +   echo '+cpuset' > cgroup.subtree_control
> > +   mkdir deadline_group
> > +   echo 0 > deadline_group/cpuset.cpus
> > +   echo 'root' > deadline_group/cpuset.cpus.partition
> > +   echo $$ > deadline_group/cgroup.procs
> > +   rt-app -t 100000:10000:d:0 -D5
> 
> Sadly, the example with cgroup v1 was made at a time when rt-app still
> supported command line parameters like the above. I believe nowadays
> that is not the case anymore and one needs to create a json file
> describing the task to run it with rt-app.
> 
> I would say we should update both examples to use something a little
> more generic, e.g.,
> 
> # chrt --deadline --sched-runtime 10000000 --sched-period 100000000 0 yes >/dev/null &
> 
> What do you think?
> 
> Best,
> Juri

Haha, I was just about to send the patch with the chrt example, when I
checked out the rt-app repo and saw that it's much more powerful. I
thought, "they must have had a good reason for using rt-app instead of
chrt for the example", and switched it to rt-app at the last second. I
didn't know that rt-app doesn't support command line parameters anymore.
I'll send out v2 with the chrt example.

Thanks!

Regards,
Shashank
