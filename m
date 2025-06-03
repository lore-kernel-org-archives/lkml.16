Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C8A78F5D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748916659; cv=none; b=BaUs+cdtvtnRGHc0vkSQdV2VzKjD213tpUiVN2IO/SOsZmb3RB0nty0ZiuJ43JemmAjH/oz2HIPrh63sWzI588icHcIt4qBnu4/kV1nC7HHo1lMb+28cvB1EeYPuz+gVGtaFRpZKetLM7eiNWHzf1K9eIP3SC8/XGxgihYvpheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748916659; c=relaxed/simple;
	bh=BG05zrtL+ag8QGOlP4H11g2uHPEH9YGqUh+sySIAGlM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M0m2IFo33SgyuDxvLdoQklCD1FL28vuWhN8cIYgGGAdlVC29wDPPKIEIuL/SOh2hP3bfmx78xzKNq16uqXNBpJ5qHQ0UjiF+nEsXLTkm9F6+1MsTieYGQKVK5I26d+PGsF7zCKs4kYJPFByEgtjE2ulf32slD6i+XR1IAFW4ZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=s7mvsFMF; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="s7mvsFMF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748916648; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=72XDkbzC/wXQpsbDw74c4MWn/z/F1UtJXOqYZHsNj0A=;
	b=s7mvsFMFGukHoiglDmlnhu7gQ4lmWHFiRDGM90FrWYYhTClA84Oqz1e1t1+USs7yUFiBwi/ilPdKWcD8eoH+qLRQgHGDhguWh9JG+AjGs4lZNAc0A+CgrayvSPxoLCfmgFjKFgTT7wTE5Zno5WXFHDUgFEv9BVmYOM2A5wlTPvc=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WcgVTZP_1748916646 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Jun 2025 10:10:47 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Gregory Price
 <gourry@gourry.net>,  David Hildenbrand <david@redhat.com>,  Zi Yan
 <ziy@nvidia.com>,  Matthew Brost <matthew.brost@intel.com>,  Rakie Kim
 <rakie.kim@sk.com>,  Byungchul Park <byungchul@sk.com>,  Alistair Popple
 <apopple@nvidia.com>,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,
  kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip unnecessary synchronize_rcu()
In-Reply-To: <20250602162345.2595696-2-joshua.hahnjy@gmail.com> (Joshua Hahn's
	message of "Mon, 2 Jun 2025 09:23:40 -0700")
References: <20250602162345.2595696-1-joshua.hahnjy@gmail.com>
	<20250602162345.2595696-2-joshua.hahnjy@gmail.com>
Date: Tue, 03 Jun 2025 10:10:46 +0800
Message-ID: <87h60xtw0p.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> By unconditionally setting wi_state to NULL and conditionally calling
> synchronize_rcu(), we can save an unncessary call when there is no
> old_wi_state.

Per my understanding, in the original code, if !old_wi_state, we will
return immediately instead of calling synchronize_rcu() too.  Or I miss
something?

The patch itself is a nice cleanup with reduced line number.  Feel free
to add my

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future version.

> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/mempolicy.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3b1dfd08338b..b0619d0020c9 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3703,18 +3703,15 @@ static void wi_state_free(void)
>  	struct weighted_interleave_state *old_wi_state;
>  
>  	mutex_lock(&wi_state_lock);
> -
>  	old_wi_state = rcu_dereference_protected(wi_state,
>  			lockdep_is_held(&wi_state_lock));
> -	if (!old_wi_state) {
> -		mutex_unlock(&wi_state_lock);
> -		return;
> -	}
> -
>  	rcu_assign_pointer(wi_state, NULL);
>  	mutex_unlock(&wi_state_lock);
> -	synchronize_rcu();
> -	kfree(old_wi_state);
> +
> +	if (old_wi_state) {
> +		synchronize_rcu();
> +		kfree(old_wi_state);
> +	}
>  }
>  
>  static struct kobj_attribute wi_auto_attr =

---
Best Regards,
Huang, Ying
