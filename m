Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7523BE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511410; cv=none; b=oMhcGB5lgQ/cMz9VjN7xGk+Oo5w1pwL5J13NVpfuKpw0rPGCp2/XqgDkVrRU5WyIVpWW7XVN8Uh3Gjd4CtLeglUTooXK6clxfW1pYkN8nMSJtjy9GzJK6A4+TvzZKqJZi5wQSOMH0+eowNmIiATLgZtXhf75/+FEUiPYH1Zh/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511410; c=relaxed/simple;
	bh=7t1Juu1/vJhJ8KD6SaaDx4nPrBBxEzIbewlZVZv5gWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHCDzkkSjccCtjg2Ogd+KCV6vzhaMHViOa6c9353mJyEq9cht6RcMrHxAiCcMmJkS+Bw6vC+SIxVFsHrSB4ur4xRL4xRAnq93RVQNManjgK3lVGoteXSZjwA/SBk/Lnn92bMoEUSplQRO7m798CANiPnlD7ZXKy60FeE0uFuraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EyCHZq2d; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EyCHZq2d"
Message-ID: <e680cfd4-8a03-42e9-a2f2-23a7b5d5bc1e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751511405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCxj7y2HUGKnQKz44JSIRWKaeF7tBFzgx7r+HHsY720=;
	b=EyCHZq2dSOuRPM3V0dLjF1IIw8D8uw3SCHrvTZ3YKOr5LIcFVme7Ade6cKjBEArmYpy1DD
	akVSF15mqsugIOcvhJcWMIOovhKSJR7NWnPdCsEz+9Z4X15uYHx+uSySCJCHlUEJwYP40E
	+49WGxnxeYfSyttI3XwqOaX5+So77zk=
Date: Thu, 3 Jul 2025 10:56:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] panic: add 'panic_sys_info' sysctl to take human
 readable string parameter
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
 Jonathan Corbet <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>
References: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
 <20250703021004.42328-4-feng.tang@linux.alibaba.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250703021004.42328-4-feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

[PATCH 3/5] panic: add 'panic_sys_info' sysctl to take human readable 
string parameter

Just a minor nitpick on the subject line: it seems to be missing the
"v3" tag, unlike the other patches in this series.

Thanks,
Lance

