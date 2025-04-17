Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C28320F;
	Thu, 17 Apr 2025 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880512; cv=none; b=FDDgyqViUT1gIuGRKVKOjknmMwNqT7zjV8+vPk8933i01RcNvwFt6a2rUCqshcTCjxQ++JMpASMDsoH6mPqQ4U/9vcQE2Fr5lC7HTZ3zhdAa/zB9VQiaFJaZIxWD26wfO+p9RX+SVl9KUZzG2Sy44AC7XHEXqUewT/TvHM2UUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880512; c=relaxed/simple;
	bh=YMVK6QkfMVYKQXP67FL+bltlB8S19TdobV1TiSfzy90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPWLPyDGMG851LFwX21UxZY8V9UT1CUnl3ToAgE3A/sO3ysiUxAQPP4jgbv+5NnvlRD52DGEFgOwTQBW0kSQ6AJyKPz9WWmyJMygYzieDIrBXJKk0nMcVI3EHl+L26avkHPhVxRoLb3i4PgxsFwfpSal14LG1151ykXXr6j+isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hhE91sOU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hhE91sOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71D7C4CEE4;
	Thu, 17 Apr 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880511;
	bh=YMVK6QkfMVYKQXP67FL+bltlB8S19TdobV1TiSfzy90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhE91sOU/oOvXJ6ZNHdZtYOO/j1tLh6YvOd17v5rUaisdo5hTpAKCge9JnIi/8jM5
	 2IYXR3UzXaQ5LLBp/I6fhQSITFvf1X7C5zeo9Xtpr0HNVP3KvPtXIoU7YmFNgvR1r0
	 6lZqVcZxk3b/gFpD3P6ZVZZ289Rda8pY9VSefpZk=
Date: Thu, 17 Apr 2025 11:01:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c
 : fixes checks on the file
Message-ID: <2025041717-hastily-pyramid-fa10@gregkh>
References: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-nR5Vt2A5kvbro@brak3rDesk>

On Wed, Apr 16, 2025 at 06:19:11PM +0530, Rujra Bhatt wrote:
> It has recommended to
> Prefer kzalloc(sizeof(*board->private_data)...)
> over kzalloc(sizeof(struct agilent_82350b_priv)...)
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 445b9380ff98..956e21886eb6 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -479,7 +479,7 @@ static void agilent_82350b_return_to_local(struct gpib_board *board)
>  
>  static int agilent_82350b_allocate_private(struct gpib_board *board)
>  {
> -	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
>  	if (!board->private_data)
>  		return -ENOMEM;
>  	return 0;
> -- 
> 2.43.0
> 
> 

Is there a reason you did not even build your patch before submitting
it?

Please take some time to learn the C language first before working on
the kernel.

good luck!

greg k-hh
