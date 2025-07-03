Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3B1F5437
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512729; cv=none; b=m/Ay9Qmnw4naskyr+nhQo8tTtBjjDFB2I7lmLxN0JQ/pVPvpFcI4/Z7t+apSDCbJKOUzF6/+PphFaiYgXeXTwnmKEjz64eeEFCrK6sEGFev+m8ybWBdHRhN9tg2MDWtNuH1vfHJxp9UT0qdyk3rzGz5BNW9fy6a8Xf7c9QfIUJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512729; c=relaxed/simple;
	bh=G7kxMXF8+gOSltasWaMGBDCv23j/wmJQpb6Qf+cH6Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiZPk4ql6bkP16nn76MTWH0pOara8v/ocMwI83/kte6jTHhKPXm798YPrAPsVxjufSxqp2ieyNWECw5hc0nDA30huG/C80GtNY9juawV2iNIdLsVMBYJMrycDwb6Nb5TfB/fAtmbFDkajDWkk2jHJctjUaBAEV4IVi1S7SpZALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QBI06lyC; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QBI06lyC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751512718; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=PyOlNvFw0EYbt/uBIVYYEgYG5BaBRek4QWjFJLOs6r8=;
	b=QBI06lyCcV1MEui1c8oQUfad2oy7rYINdy2OU/c1elYigGWVCvxXDHP5wVDdFcfJAba869Oip3f/ajeu3bucX4sjnyuClXQCQDeJOk7bHPFko3WakfL3JeztYPk1sDf4CgTgfxyhQezA5egQtu/t1E59OwbzXVRfmXxDkm5u5Wc=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wgr3GjR_1751512717 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 11:18:37 +0800
Date: Thu, 3 Jul 2025 11:18:36 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 3/5] panic: add 'panic_sys_info' sysctl to take human
 readable string parameter
Message-ID: <aGX2jGNOYAbS34qo@U-2FWC9VHC-2323.local>
References: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
 <20250703021004.42328-4-feng.tang@linux.alibaba.com>
 <e680cfd4-8a03-42e9-a2f2-23a7b5d5bc1e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e680cfd4-8a03-42e9-a2f2-23a7b5d5bc1e@linux.dev>

On Thu, Jul 03, 2025 at 10:56:36AM +0800, Lance Yang wrote:
> [PATCH 3/5] panic: add 'panic_sys_info' sysctl to take human readable string
> parameter
> 
> Just a minor nitpick on the subject line: it seems to be missing the
> "v3" tag, unlike the other patches in this series.

Thanks for the note!

Yes, I did some last minutes change and forgot adding the 'v3' :)


> Thanks,
> Lance
