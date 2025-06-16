Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46007270EAB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072474; cv=none; b=MLAfxO8KVuaJS78CK9wCZA5Wm7EKI74PIu9GFwZW727JwsgKH3WkyWqxg/aPILN8KB4ivevOKhINkZLUuCqD4p8vur29zon0zB2ga2KLjDSf7fCqM/0H/1G5T5Rs0m7lBjth89A2cqqNOLcRe4fD9u311GXKyIs+TPGc9vk62WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072474; c=relaxed/simple;
	bh=VZZo+aCl6+dXnlCGePMF/rZ1WwtiQvnwXNGuroBTNn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kywbOhnzZcBY/egi7dFHIA5VkQIalk49fCvaUpN80GIsN2rcGTpXWxtH4HYE7+tqkHQ8EzxeJsa/5mw/KStjk/I2GbrXIcYZyDYqnVYv5gYIAvzjMgT1ALSwA5NHTO648KXV/JaTf0iFlIEnl2TVn6GT8XYZ6T/Hc8/bKTqKRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poTc6uX6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poTc6uX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390E3C4CEEA;
	Mon, 16 Jun 2025 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750072473;
	bh=VZZo+aCl6+dXnlCGePMF/rZ1WwtiQvnwXNGuroBTNn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poTc6uX650GKBbu+vV5wJ6gYwde7JHgk1DoVkhso/gL/cM0NqmE/qh/6h/UtFgrC3
	 VAJidaU8D6xDop6SQyCW8PE1qftVPCurOwDPTtHQMqJmVqk33car5keZEwOaOYedBb
	 fsPNE2r6FImhHKV5abzMRzKcpPNfilIFmyn/cZ1IVbINRWUTPMlwqT8on9bjce5jr+
	 7g8q+448nTTZq6hFRSaWEu60s5GGUsKyGTiIyKT1u3y30TJUBPwD206FEbKkzZV2QL
	 qyspu1fXEHR63NFgjhGqcHN5rxsRBcGHgjLcy1cQd9V1L1SwEzTBnYNWnHn+6gy85b
	 9Cynmn5hzzsxw==
Date: Mon, 16 Jun 2025 13:14:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aE_8lDuMFFhJBeUY@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>

On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
> Code looks fine, but currently nothing is broken and I disagree with the
> goal that the _mock_^1 components should be role models. The idea is to
> implement as little in the mock components as it is required to exercise the
> tested functionality.

No, please consider the following.

  1) When we write tests for common infrastructure we should be testing things
     as close as possible to how we intend real code to use this infrastructure.
     Relying on internals in creative ways is likely to underrun this testing.

  2) Being close to a reference design is a good thing, why wouldn't we want
     that? The reality is that people *will* look at this code for reference.

> Also, there are various ways drivers use the scheduler API. Trying to make
> the mock scheduler a reference driver implementation would only be able to
> make it a reference for one possible use.

Why? Nothing prevents us from covering all of them eventually.

If for now, we just implement one of them, that's better than none, so why not?
