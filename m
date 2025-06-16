Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974851ABEC5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078216; cv=none; b=tKz8nWnUc//Svbjv45m1jIfsgznkVMCTuYwWEF/cT+u6LLg0fBvhF9RdUFQ6AcosLNoDQ9IJyQ6q4HCowqXgEJ5wY/mu54pfmYqp2D92LfFdHD+VLmWwDzIZW6IE5Ex6qVRTe7YdoZLNAcuPcp28OJVD0AyyruNC4xLimVArUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078216; c=relaxed/simple;
	bh=E+ttJdI5yaCBbGqFHD7OiO1ZHTr8GaYuztd2ZHLkUWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhqcvXGjyxLbJUoMvCv/2wEfdie01ticJk5VSDToSsXfd6XGnW2hBLxEDn5z8t/9Y9C9gLRTJWfutMN/guumfd66pFVWt+oKa8oaZK9LoeuygDWHPUbMK6w1VOKdSygBfEEB1S2JJUqH0jKIg02WfWtRmbKWA5m1SIhJJ95l7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=EiFM4CND; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EiFM4CND"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eIkFfeMbzZxfXsdFYX5mejSvBGxyoEn4a8get3UI44E=; b=EiFM4CND85ctD5Q49w0JEdueIH
	rSSCv+SgAO6+hr/wNTzZIxpcg82zzmqaHJ6kpIVhFQuXiafDzCnXDCjISvhcZtWd0zcN243Udeku3
	KBhBhsfJpCBw9MPKR/r497GPjhfxhcWDUFQ9q9wEq1UfpTV5Gt308wNWTPBbTnzONT6ZPsYby3EG5
	y/C2PUJSRnp+QL9nvjVyacXpluIm16surIfpvUeIAB7k5ccVbPBzwi+o5o2P18mPiW2zfa8o2jwmF
	fzg7ZjBSJ+nuuf9o/r59qvnBqQesfPC842g8wrhzPi8fcr1pFRtJBq82SJ+99zULXtuWPRQYMDsI/
	IzYXpy/w==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uR9Hd-0047Wr-O1; Mon, 16 Jun 2025 14:49:54 +0200
Message-ID: <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
Date: Mon, 16 Jun 2025 09:49:46 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better role
 model
To: Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com> <aE_8lDuMFFhJBeUY@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <aE_8lDuMFFhJBeUY@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Danilo,

On 16/06/25 08:14, Danilo Krummrich wrote:
> On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
>> Code looks fine, but currently nothing is broken and I disagree with the
>> goal that the _mock_^1 components should be role models. The idea is to
>> implement as little in the mock components as it is required to exercise the
>> tested functionality.
> 
> No, please consider the following.
> 
>    1) When we write tests for common infrastructure we should be testing things
>       as close as possible to how we intend real code to use this infrastructure.
>       Relying on internals in creative ways is likely to underrun this testing.

Regarding unit testing (and KUnit is a unit testing framework), the core
principle is that individual components of the code should be tested in
isolation to validate that they perform as expected.

The "units" should be tested independently and we use those mocks to
simulate dependencies, ensuring that the test focuses solely on the unit
under scrutiny.

If we introduce more things into the mock, we end up losing the
isolation. The mock scheduler, from what I understand, is not suppose to
be a reference design or even something close to a driver.  It should
remain just a mock, a minimal interface to test the scheduler's
internals.

Best Regards,
- Maíra

> 
>    2) Being close to a reference design is a good thing, why wouldn't we want
>       that? The reality is that people *will* look at this code for reference.
> 
>> Also, there are various ways drivers use the scheduler API. Trying to make
>> the mock scheduler a reference driver implementation would only be able to
>> make it a reference for one possible use.
> 
> Why? Nothing prevents us from covering all of them eventually.
> 
> If for now, we just implement one of them, that's better than none, so why not?

