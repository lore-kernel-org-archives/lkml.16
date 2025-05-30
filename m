Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76622B8A8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615685; cv=none; b=o+Lv+IlGYM19yGQvZRkK1bXenmnyD3qxypBcBW/oIzCCHkh0KQFsJRueg/WG94GPi1z/9VewteqxNxNExXCobB5/z6Lm1PY1wDEzPWxu7hIajJkdU8B84s0CObuS79726dSZBbHTza7z3tJV5lkKRRaRKgv85hrL+tU2r6mYvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615685; c=relaxed/simple;
	bh=1S/VS8/Bcw6UStVGiFNaj5BF65cGwFQfGdO1d8CfHq8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qBERvC8D9IZiObrbFFVtRcX4RO+eqET2KqYGP1qNNhK0J+7DRbWTd24GCHkE4gTeqK4Ex3+lpeB3cELLJSENBtRoR+F3lCwPaj8TNwimvEfJViwHgnjkqKtWjoeIAzHDlhigtkd4dMzgcIfyEqMy1GbJNq4FKz5rJ6nQ0Tve9Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bgm755Vq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgm755Vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3668C4CEE9;
	Fri, 30 May 2025 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615684;
	bh=1S/VS8/Bcw6UStVGiFNaj5BF65cGwFQfGdO1d8CfHq8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Bgm755Vqkarxhu23N9mWuVlU6LqdXrH+xIdKNozIOQ8ypEhOtWtgmGn5CZvD/OsTw
	 FiimlU9VhnV5AsdVibbUggtf7G5qT4mUhx5k8fs6bd+ZjpGYhJMUpUK919uo9FZPDm
	 y1ZruOPNGXj6DuioF7H9HWSjh5iK8JUiLVcibJ1BTwrS3m0okRQGQxfqiNBUQELj0+
	 Au54IRZBbFz9ixufLpqmh5fX6UiGVHz4JA/akrQ25TPfcM2EmtYbsG0rUEjwHOcXp/
	 KsecO9F9gj0l2Q+sgzQJcCgRTKTX4W1UJnO5fvMJJYdzWe6IwD7LWGTkG5SBc9xmnz
	 NJqjNWKToMSsg==
Message-ID: <8f56170c-d63a-41a2-a50a-a70de79965d3@kernel.org>
Date: Fri, 30 May 2025 22:35:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: turn off one_time when forcibly set to
 foreground GC
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250529213750.1068920-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250529213750.1068920-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/30 5:37, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> one_time mode is only for background GC. So, we need to set it back to
> false when foreground GC is enforced.
> 

Need a fixes line?

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/gc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2b8f9239bede..f752dec71e45 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	/* Let's run FG_GC, if we don't have enough space. */
>   	if (has_not_enough_free_secs(sbi, 0, 0)) {
>   		gc_type = FG_GC;
> +		gc_control->one_time = false;
>   
>   		/*
>   		 * For example, if there are many prefree_segments below given

