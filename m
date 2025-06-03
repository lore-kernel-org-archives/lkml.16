Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE9268696
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933892; cv=none; b=XEwLPqCLOfEHdxQu6r4Fz1ZBDCwV36IH4WCQH/LMwc2B9Q2VYfelgSW3Q+3iKBqGc9MK3P93JrK/mognWJjMJbFfRL1AlddbzHQgPgHCOoLZQ9ma8ibL0Bf4Kgi7XGR6z5e27VIZezvm1dYQeFOI4R07CpkP5DRL4n8w8ZaKPgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933892; c=relaxed/simple;
	bh=EhXzen7gV3hUWh7pSnmCfc7yCVQh8WtqFqB2lUlXPZg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CAKpOgNYSOEhjPpgLwfNXRjrjMpOjRgMlyHYGL642wgiNl730v1jZlTsi21O2ydEumfMfA/1J+qhhB7d6GmdUEGQakFnB0bfy7UyOl60JE4XOxqhZNuNzQRJx3GdYXGwMMfHigSbxIGeu+aqn3DbPl4yIg8XmgMKgOawJFnR23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1AV42oK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1AV42oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738DDC4CEED;
	Tue,  3 Jun 2025 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748933891;
	bh=EhXzen7gV3hUWh7pSnmCfc7yCVQh8WtqFqB2lUlXPZg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=e1AV42oKNVrAL1QDD9G7cYMRRHNLgJkIK13uwugGpv6JWWOdhDPpZ+FWb86V5AOp7
	 5k8hMPEKLNqcyrh6c7r1BM7AhUf7ulGWNeHY0CKIefj910ibEwqHLsV7U4KdF4JWkB
	 e/FL9RTYcj87Qb5jcnS9GqbvxsakMeQXe9ssHWU2c6ulud35jML3wrHrmRm8Ua6+W5
	 5PkbEY7AuqcJSrTQHvzNQy+pL2KiJG5V6Z4P7RC4Xyq7ijkWAIXaF8+4UfATND/eYE
	 7CDJHqPAm9Rnuf8mezKlIqRPZiIe8RDRbCsODxq6VybefAFAqCQMvLMI6R08+qX2cy
	 +SFcgvWB4p/mA==
Message-ID: <1691f701-0d52-4dae-b709-02ce7182a920@kernel.org>
Date: Tue, 3 Jun 2025 14:58:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: make sure zoned device GC to use FG_GC
 in shortage of free section
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250529222532.1088106-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250529222532.1088106-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/30 6:25, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We already use FG_GC when we have free sections under
> gc_boost_zoned_gc_percent. So, let's make it consistent.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
