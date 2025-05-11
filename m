Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3012B63
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 04:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746938612; cv=none; b=O3EpO7O/b4mw0CvQpZJ9OEIlmNiary+qCLZAFB4RmMX2eT+jWIRIjaw5uDteEZfGihrm5HbbA8fq1QKyV7YHwGhkSHBHywoJbT8aUDqecii+UsJ/oHHWOC7DfDjwSJGZIQL55BL5DTEnaD9MFIEQI1Ho4ktxwCJ0jirtJNrnUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746938612; c=relaxed/simple;
	bh=5H5Npfxa3IjRaPjkEN43cmkdGATtTK8BWuhLXQ1N7uI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ftly/mHo5WnQj5xrsvz6k/Kpdy7ILyvZ2HYn+TqWsAPq9g8MENtXPMjukIVg8N4wEdKVV0AC1aopaVQJUbmQRCGU9mTbBAX1VXEKs5IAb3cN68veBAqftGW9eDRjyx9G32kQCg9Qflddv/JlOJ7qUqidJo/42K4fFi+rAMDH/M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZNfclKX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZNfclKX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6023DC4CEE4;
	Sun, 11 May 2025 04:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746938611;
	bh=5H5Npfxa3IjRaPjkEN43cmkdGATtTK8BWuhLXQ1N7uI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZNfclKX/uPNzidEBKC9DkeKkGETLAOEKmo1VNApjE88A4LOYJ5baAwzyjYTgXJiCJ
	 Xn548iPNHlm6NO7PBivtngaAllxgWD43t0cJssW+z2UMDZ+8mGF+c/5ZEQnHlhfnab
	 e/o4/UWugvCq2mIUAt+O5iNadPDmWoX2iegP9g6g=
Date: Sat, 10 May 2025 21:43:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Mateusz Guzik <mjguzik@gmail.com>,
 brauner@kernel.org, linux-kernel@vger.kernel.org, joel.granados@kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-Id: <20250510214330.2bf5ab489fefd865f996ceb6@linux-foundation.org>
In-Reply-To: <20250404153103.GG3720@redhat.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
	<CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
	<Z+/V5AzsSqY9ALqL@gmail.com>
	<20250404141623.GD3720@redhat.com>
	<Z+/3XO5Dh9mKiaE5@gmail.com>
	<20250404153103.GG3720@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Apr 2025 17:31:04 +0200 Oleg Nesterov <oleg@redhat.com> wrote:

> > > But if the init task exits for any reason it should trigger
> > >
> > > 	if (unlikely(is_global_init(tsk)))
> > > 		panic("Attempted to kill init! exitcode=0x%08x\n"
> >
> > That is showing up later
> 
> OK, and this proves that we have more problems than just this WARN_ON().
> 
> Again, this is not my area, most probably I am wrong, but it seems to me
> that do_exit() simply should not be called.
> 
> > We are discussing it on the other thread.
> ...
> > Let's move this discussion to that thread, please.
> 
> Which thread? I wasn't cc'ed...

Neither was I.

I'll drop this patch from mm.git.  Someone please cc me on any
new developments.
