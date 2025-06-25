Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9706D20E031
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883950; cv=none; b=S8BWLyJxxCUG/UByEiHq5YtbmmQGTU6+6MQfA9Ap+E+JmUzUoZpP55iTJ+MsnkWeqT2b0x2YYMiEDX1I2OodU9oNn8GnUYoyjnoDrRavhnr6csd8ntaxmhgx1QPYgKG34Ivg1xbgWSvfOehzymQhR4a5iaUO56WVlZKOiOEtjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883950; c=relaxed/simple;
	bh=NGxusxoysHnRfWM1zM86gSR/hFPe5qbP5BMbjgwq7GA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YTOeRurA3HBTIGNS/HrIsqfsT00GYIlXRFZU3uRGSirgnaL9H57wDEmMFIUt+pR/geVSaDGVXENwIpGc/rsMhSWp0bv2SqRhfgSu/8eEAYOsQp6dyRYxMSZWOfWlHecApvEYQkN9jQ6Sgb7SraFg3ZCe2ahDR/TGk6ORCAHB0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sPPAq2nj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sPPAq2nj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD481C4CEEA;
	Wed, 25 Jun 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750883950;
	bh=NGxusxoysHnRfWM1zM86gSR/hFPe5qbP5BMbjgwq7GA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sPPAq2nj0OIdsu/eS2Y8cv3QrxWI6TQ5LTiJeoWbef6L4ZQmJsJy1F0NFLNilExvl
	 iFBm5W1QH0y39aky3kzNNEWCtIvALlFfPbQZttspvt5E927EX1RnJEqgTtdQqPoBML
	 JWe//VpIvf8gGMCJjLc65FDukcJDgUfnRlRzwP8s=
Date: Wed, 25 Jun 2025 13:39:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Berg <myon@debian.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Matthew
 Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory
 Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
Message-Id: <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
In-Reply-To: <aFwUnu7ObizycCZ8@msg.df7cb.de>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
	<d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
	<aFwUnu7ObizycCZ8@msg.df7cb.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 17:24:14 +0200 Christoph Berg <myon@debian.org> wrote:

> For arrays with more than 16 entries, the old code would incorrectly
> advance the pages pointer by 16 words instead of 16 compat_uptr_t.
> 
> ...
>
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2444,7 +2444,13 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
>  		if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
>  			break;
>  
> -		pages += chunk_nr;
> +		if (in_compat_syscall()) {
> +			compat_uptr_t __user *pages32 = (compat_uptr_t __user *)pages;
> +
> +			pages32 += chunk_nr;
> +			pages = (const void __user * __user *) pages32;
> +		} else
> +			pages += chunk_nr;
>  		status += chunk_nr;
>  		nr_pages -= chunk_nr;
>  	}

Seems this has been present since 2010.

I'll update the Subject: as David suggests and I'll add a cc:stable,
thanks.  I'll also add a note that David suggested an alternative, so
please let's advance that option.

Also, a coding-style tweak:

--- a/mm/migrate.c~fix-do_pages_stat-to-use-compat_uptr_t-fix
+++ a/mm/migrate.c
@@ -2449,8 +2449,9 @@ static int do_pages_stat(struct mm_struc
 
 			pages32 += chunk_nr;
 			pages = (const void __user * __user *) pages32;
-		} else
+		} else {
 			pages += chunk_nr;
+		}
 		status += chunk_nr;
 		nr_pages -= chunk_nr;
 	}
_

