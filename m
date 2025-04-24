Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCD27F728
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510414; cv=none; b=G85kk6hQGZ86R442V455ouHH0SAn12uRyYYGUNHZLud3mC3omDCwyjJA6wcJ5aM/eQiwcq7nOzD7YiDxfjCFWFDAATDGA+2W1sGltTafroo9WmguA8H3XTyJgWxLE4hlwnGP/+CwS8nFOGySs8Q9qP91MfnhfUpOPQIihumx15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510414; c=relaxed/simple;
	bh=yD7uIFF95ST+JIhn03gdVlJEUkB9/jkQpYVriJhB8aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCLGd5FEwcBwY3ZL/1NkMiE6Aa0/EMREKoPMuhZzFMyZhHoxS47qxjbIgVsR9CENt8MMEiTPdExDZYbhRB41B90cEfyoh6wANiNOhG6a4B0i9PqaD6q1p/HzlsMqjBZJ0qA7UABMHVfdaLXu00HHgBAeRkVokSeW07VvmZ6Za10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ATCUFXeC; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ATCUFXeC"
Date: Thu, 24 Apr 2025 09:00:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745510409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tfFeYhapSdYD47FaFtGx4OWFt+GeEThh16hCxsDhCu4=;
	b=ATCUFXeCXCrRKWTChbKTH6WuHu0R5tnkFKBwadCsGgV77j6ZkKqSDe0jgQ/yQmQ79Ztmla
	MABvQr713842br1Ug5U2vuNJ0tvFs6CXjFiovr6hwukjE9D+WlpnWYGjmuF/KvikZkFzyU
	3U6GPaaYNHbI0GjPY2FGBpfsKUTs2IM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Huan Yang <link@vivo.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Francesco Valla <francesco@valla.it>, 
	Huang Shijie <shijie@os.amperecomputing.com>, KP Singh <kpsingh@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>, Guo Weikang <guoweikang.kernel@gmail.com>, 
	Raul E Rangel <rrangel@chromium.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Paul Moore <paul@paul-moore.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, opensource.kernel@vivo.com
Subject: Re: [PATCH v2 3/3] mm/memcg: introduce mem_cgroup_early_init
Message-ID: <2u4vpqa6do7tgtukqb7orgxmlixguexsxilhnsiwv7atssnht4@o4cwziz26wrs>
References: <20250424120937.96164-1-link@vivo.com>
 <20250424120937.96164-4-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424120937.96164-4-link@vivo.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 24, 2025 at 08:09:29PM +0800, Huan Yang wrote:
> When cgroup_init() creates root_mem_cgroup through css_online callback,
> some critical resources might not be fully initialized, forcing later
> operations to perform conditional checks for resource availability.
> 
> This patch introduces mem_cgroup_early_init() to address the init order,
> it invoke before cgroup_init, so, compare mem_cgroup_init which invoked
> by initcall, mem_cgroup_early_init can use to prepare some key resources
> before root_mem_cgroup alloc.
> 
> Signed-off-by: Huan Yang <link@vivo.com>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>

Please move this patch as the first patch of the series and also remove
the "early" from the function name as it has a different meaning in the
context of cgroup init. Something like either memcg_init() or
memcg_kmem_caches_init().
