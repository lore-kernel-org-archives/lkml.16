Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32583595B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749515215; cv=none; b=ZcHWuYMhCS697h/G+Y8xnQOun3QoJ8ktugPvYrqIOvvTvln9Q4uWptPO/51cag1l654DUvvfl6OW9Yq+6gTYvfQxaSi20cfn38lNbc6PNyimHaDU6aKaGcCTC1VTF4N8LfKszIHmElfd49jsQKFz9lKgjYNCwWzSboMYXc1rm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749515215; c=relaxed/simple;
	bh=WKM7bYJF3RZYxDsLq3hlMwqpkAJAEZ2LKxzqn4OlM1M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JJOIXSXo7OLRzZpN80qNz87F7kOFsypIYcqvcPEiX/nlVDOosAz8t8ySe5pDKl5wadiz5ikhY5RkScGs2NmflsdNXpHLSSWwzlgeznc58jTK+OZ27yEUqQm/2E14SqrE/AHv5/EPaQv+A3A9EzZ1z2AixVdmZoXoIIi8gc342r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I45u+Thx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I45u+Thx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D002C4CEEB;
	Tue, 10 Jun 2025 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749515215;
	bh=WKM7bYJF3RZYxDsLq3hlMwqpkAJAEZ2LKxzqn4OlM1M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I45u+ThxW9/rG8sBGVzUpobXxqTPY0Dzhd1l64TQqS0LvYX2cOHgM7tJwbLpDjLVG
	 aLyF1V/oHQathy1OE55iO6aTAWjgV21EeiXGy9RmFAT4W8ce/tBb5wggkDOrSgtkQk
	 JKZdHHdbcKLlxW4DktzMO28sQ4gt2sJ+U7vY35R0=
Date: Mon, 9 Jun 2025 17:26:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Ye Liu
 <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/memfd: Rename error labels for clarity
Message-Id: <20250609172654.a99c06d8ad90a6a994545e5f@linux-foundation.org>
In-Reply-To: <20250609031858.73415-1-ye.liu@linux.dev>
References: <20250609031858.73415-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Jun 2025 11:18:58 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> err_name --> err_fd (fd failure case)
> err_fd --> err_file (file failure case)
> 
> ...
>
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -475,22 +475,22 @@ SYSCALL_DEFINE2(memfd_create,
>  	fd = get_unused_fd_flags((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
>  	if (fd < 0) {
>  		error = fd;
> -		goto err_name;
> +		goto err_fd;
>  	}
>  
>  	file = alloc_file(name, flags);
>  	if (IS_ERR(file)) {
>  		error = PTR_ERR(file);
> -		goto err_fd;
> +		goto err_file;
>  	}
>  
>  	fd_install(fd, file);
>  	kfree(name);
>  	return fd;
>  
> -err_fd:
> +err_file:
>  	put_unused_fd(fd);
> -err_name:
> +err_fd:
>  	kfree(name);
>  	return error;
>  }

Not really, but I see what you mean.

"err_name" means "there was an error, so free the name". 

"err_fd" means "there was a problem with the fd".


We tend to use the former convention.  See

	grep err_free mm/*.c

The memfd_create() code would be better if it used "err_free_name" and
"err_free_fd" to remove this ambiguity.

Someone who was feeling bored could go through

	grep "goto err_" mm/*.c

and check that we use this convention uniformly ;)

