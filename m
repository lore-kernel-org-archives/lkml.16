Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E47113212A
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746840920; cv=none; b=UAOoK6lQDJHwbPOud5v21kb2bo/fGhLZT2dc4cdQVArAmSAVnDw6fu67d/6GPUokLb9DaUn1AIfkJl8MBB5OgW1x4AwChAgMnMZRpMJQIGskL3KHpzFJv69udoAEBogwniHR71eRevrNiTb+gjguE8qgkyv+s01BiIvYh59E3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746840920; c=relaxed/simple;
	bh=RKZARjtItSMo67EEN9USgQO9kVkqBIBwfgHN4qsQIF4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jR6gH3Ukm7q2Wpve2H9CyKUJkFddHWK0Qi2pdVGSq4xMlw1KPM5vVAsgLZlS+xJhieiBd+n70k9NvfC0nEI24eouROVZDYt/iPuQM/BX4VftP2AB3fAuxfrs/xPmQat2mV9bupfmmpS8MnNtYm06WRJk5cXjmMj6X9dw6AHYdpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jn7m1SE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jn7m1SE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF16C4CEE4;
	Sat, 10 May 2025 01:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746840919;
	bh=RKZARjtItSMo67EEN9USgQO9kVkqBIBwfgHN4qsQIF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jn7m1SE4CkXhy8+3E6kC1fI4Jx9ahn2xXUX6E5oZu2JSsg8nbWlZObHnAYokfHd/4
	 Uhaid6Xl/iEVNjIJrMr1FIvOWbjdbqF6l5z1AfW50W7pYPunkgAiAdWaPZjwzqZvVg
	 DowEuEXhgAVxjZQsgst+x2RWJiZD3XqeRioz5PxE=
Date: Fri, 9 May 2025 18:35:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: Coiby Xu <coxu@redhat.com>, fuqiang wang <fuqiang.wang@easystack.cn>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-Id: <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
In-Reply-To: <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
	<ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
	<4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
	<20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
	<2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
	<aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:

> > The bad commit was introduced in 2021 but only recent gcc-15 supports
> > __counted_by. That's why we don't see this UBSAN warning until this
> > year. And although this UBSAN warning is scary enough, fortunately it
> > doesn't cause a real problem.
> > 
> > > 
> > > Baoquan, please re-review this?
> > > 
> > > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > > assume this goes back a long time so it isn't worth spending a lot of
> > > time working out when this was introduced.
> > 
> > So I believe the correct fix should be as follows,
> 
> Thanks for testing and investigation into these. Could you arrange this
> into formal patches based on your testing and analysis? 
> 
> It would be great if you can include Fuqiang's patch since it has
> conflict with your LUKS patch. This can facilitate patch merging for
> Andrew. Thanks in advance.

Yes please, I'm a bit lost here. 
x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
presently in mm.git and I'd appreciate clarity on how to resolve the
conflicts which a new version of
x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.
