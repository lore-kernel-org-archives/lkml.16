Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54281DD0C7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715402; cv=none; b=I0Waj0hm083CAxH0ceUzFbqi5GnZc1gbQg8sLCbE3zaIrUFWxweIp2obfDSfE9aR6FYK/zARZVRnju6p3csUby+mIpSnsPUlL9/sAotkavewUfks2Yow5+LJ2XuYPMNCVXnZquIDn7llWHVCSXQQpR75pB3K0aTCtw6/h4J9qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715402; c=relaxed/simple;
	bh=ILNp4uZRQl4aeRib5VALDB4qNJmsOxkScALC+XJX3fg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Gm2Bf3f7V+fclBuduazz9tRUis5aeiYAgjBtEGm9xBhqolLCV++S6Lz8D24VMG4W+pIu4tJMeSZMCCUlfGQwr7MSYIAdEyl7e0OVGtgIvo08wVPQ+5M16yiYMI8P1Pf9PczEyPq/PqsKyqknXJ4A9DU8Yv4QxhCXkv5Q2nmh8U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FTRxpJcc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FTRxpJcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0327EC4CEEA;
	Mon, 23 Jun 2025 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750715402;
	bh=ILNp4uZRQl4aeRib5VALDB4qNJmsOxkScALC+XJX3fg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FTRxpJccxKqRcSnc5Dto4DAaoL6+rmWIu+7ZkSIHFJGkyI5MtDs9doJ1qrEsZIG42
	 u7+H+v2DV2zdMl9EpB3OtFjWQgnMX+SMm5d8S8oXVo4oxY28/AmEnZhEGyuI924zXJ
	 +9ge/c62wMdPsJFcdudxdkRho2p3pe+zitmE1400=
Date: Mon, 23 Jun 2025 14:50:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: mhocko@kernel.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, yosryahmed@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2 0/4] mm: per-node proactive reclaim
Message-Id: <20250623145001.6fe935e9e91a6ed90aeede0d@linux-foundation.org>
In-Reply-To: <20250623185851.830632-1-dave@stgolabs.net>
References: <20250623185851.830632-1-dave@stgolabs.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 11:58:47 -0700 Davidlohr Bueso <dave@stgolabs.net> wrote:

> This is a tardy follow up to v1:
> https://lore.kernel.org/linux-mm/20240904162740.1043168-1-dave@stgolabs.net/

Cool, I'll add it to mm-new for testing.

The v2 series didn't have a [0/N] so I scraped the words from the v1
series.  These were almost a copy of the [4/4] patch changelog but
there seem to have been some changes.  Please do maintain and resend the
cover letter verbiage.
