Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2B219A75
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846780; cv=none; b=lKBolVnmoVEvhKLI/9mt+LkukkTzTr15FYIVHYLGh169H4Mb2bRn6Gp1LoHIHv/ta4mTF4+SePvwvopkXVPmt+35FTclilsjjadZrVG9wqkF6Zwu4efnXwnSexpAAKFbVVIXrzOdOvpe3p49ZJGdBsPQOrr0zV+9BoYAcniyPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846780; c=relaxed/simple;
	bh=yY/w2WRw+HnuazreR5toclAjz1DYDrnZZgQOEQvEA3c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=on9GiyxYV7tbvABNYdyH86JmWWm8IRNJKi5kV4wpZCbEJAdAZdWP9Iu9Rwtjw7rQxdXO7Yw3NNuRCeZBUqpaoTpdEix8d057HdXOQg7a9g4LXprCG88sBHUeGDfD+rD6bTnsbnYdjlUgXt1CkwsVNwnSJBOUC4QUE0RYkC/1xpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=exPW6PhT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="exPW6PhT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFF6C4CEE2;
	Wed, 16 Apr 2025 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744846780;
	bh=yY/w2WRw+HnuazreR5toclAjz1DYDrnZZgQOEQvEA3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=exPW6PhT0MtzYqFgcdrAeLJ8iK5Q2MKTncnpTJQOPe1FWQIH8URyngJ1EeapOfqyy
	 SdKWyffe/pK9OdXObV/JaInmqNM17DQorGfTDuYhhygzUysM8P5RKq17d+ivTtX9yE
	 7dJwVBW/7lqMtgrRTJsX7WQ5SKlkMNrYrEfhbhZY=
Date: Wed, 16 Apr 2025 16:39:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: joel.granados@kernel.org, song@kernel.org, dianders@chromium.org,
 tglx@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix watchdog may detect false positive of
 softlockup
Message-Id: <20250416163939.7a3670b83d9f9ba56680516c@linux-foundation.org>
In-Reply-To: <a56803dd-0e38-4edc-b1a1-f850246f210b@huaweicloud.com>
References: <20250416013922.2905051-1-luogengkun@huaweicloud.com>
	<20250415193100.562d55b34851e8c9058c5658@linux-foundation.org>
	<a56803dd-0e38-4edc-b1a1-f850246f210b@huaweicloud.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 14:44:52 +0800 Luo Gengkun <luogengkun@huaweicloud.com> wrote:

> The following testcase may help to understand this problem.

OK.  Please

a) include this info in the v2 changelog

b) consider whether you believe the fix should be backported into
   -stable kernels and if so, add a Cc: <stable@vger.kernel.org> and,
   if appropriate, add a Fixes: target

c) Place a couple of comments in the code to help readers understand
   why we're doing this

d) try to amke the changelog a little less puzzling ;)

e) retest and resend!

Thanks.
