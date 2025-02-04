Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159B1FAC5C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738708090; cv=none; b=Q2khYdjVMvTg363KJuWTK0j0gLM3oBXIhhrDyUN/5LALl52dPF4CVIJ/Q85BCXvWxIG1iEsHaO2yTqAQsQtEYTcMEUhUqTyAERKBy9rqFoz4TNnX8acwrOE0X6EfnRXSs6HpZr4v8TrtbpOKRo1jB6bToX7BzbLG5v5gtbyLy58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738708090; c=relaxed/simple;
	bh=om9qpio7Wj9gXZYnyd2giY0KTYlyql9+nwcfkw6IsSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bw+9GUZw3gO5i+naySt9/UYCEIgyYEygTh9wageUhUnGeGgq72IuPJYOO3ou+CbJ4yCyd23grYYA4oBe/9KDcMGiIuuOGYIAjfwHXQIi0dRKCdZ8vpcjOszpPOS94dRu2paYhuheD96IO0apaXEa3xDAW85iiY3k+O9BSfmrBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=lankhorst.se; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lankhorst.se
Message-ID: <158e099d-6548-4de8-ba13-7de3277da82e@lankhorst.se>
Date: Tue, 4 Feb 2025 23:28:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-4-dev@lankhorst.se>
 <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,


On 2025-02-04 17:30, Michal Wajdeczko wrote:
> Hi Maarten,
> 
> On 04.02.2025 14:22, Maarten Lankhorst wrote:
>> Instead of finding bugs where we may or may not release force_wake, I've
>> decided to be inspired by the spinlock guards, and use the same ones to
>> do xe_force_wake handling.
> 
> You may want to take a look at [1], which was based on [2], that
> introduce fw guard class (and it was already acked and reviewed).
> Merging was postponed only due to a request to prepare larger series
> that would convert all existing usages to the new model.
> 
> And similar guard approach for our RPM was proposed in [3]
> 
> Michal
> 
> [1] https://patchwork.freedesktop.org/series/141516/
> [2] https://patchwork.freedesktop.org/series/134958/
> [3] https://patchwork.freedesktop.org/series/134955/

Excellent. I'm glad we're in agreement that doing forcewake handling in 
guard handlers is a good thing. :-)

I have taken a look at the patch series. I think the approach I've taken 
is a refinement of your series. Yours is already nearly there, but it 
still keeps the rough edges of the original API.

To smooth them, I have created 2 constructors, xe_force_wake, and 
xe_force_wake_get. The former is used if you want to run code regardless 
whether it succeeds, the latter is when you do.

This allows code like:
scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, 
XE_FORCE_WAKE_ALL) {}
to work flawlessly as intended, without having to check 
xe_force_wake_ref_has_domain(XE_FORCE_WAKE_ALL);

I think this cleanup removes a nasty source of errors.

When you don't care about failure:
scoped_guard(xe_force_wake, fw, XE_FORCE_WAKE_ALL) {
	if (!xe_force_wake_scope_has_domain(XE_FORCE_WAKE_ALL))
		printk("Oh noez, anyway..\n");

	/* Continue and pretend nothing happened */
}

And for optional code, same as scoped_cond_guard, but as scoped_guard:

scoped_guard(xe_force_wake_get, fw, XE_FORCE_WAKE_ALL) {
	/* Only runs this block if acquire completely succeeded, otherwise use 
xe_force_wake */
}

All in all, I'm open for bikesheds, but I think this has the potential 
to improve xe_force_wake handling even further!

I wasn't aware of your previous attempt when I wrote this and fought 
linux/cleanup.h, otherwise I would have taken that as a base and credit 
your work.

Cheers,
~Maarten

