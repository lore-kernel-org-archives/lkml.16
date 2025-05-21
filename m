Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F0D27E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830787; cv=none; b=Nm++zfweanQ8tThjOUx6c/UyMwUHh3W/rbw0PPs57jjwT74315ljMBQqXmbcr6jRtKjLj8Gg04VTTkUiJ4NUSfrL8JGbNweTauh61BG3oiSqITw3lYkUhpJTW9T/j2X2AkXiskigH6tTtvqb9H9xMCF7CvWwDHXJklkP92Xk4n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830787; c=relaxed/simple;
	bh=PSdKIoLDxJFEKOG0Ms2J+9+RYh3NwJ96dxgAicrqC8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITlvM1jwG5ub4Qjmd16KYZ+zyUnigNBXCAoBpB81ik5QaNu3IUgr7bptQ82lta/xPux4bKZS4OFaM3kgU4FZ+T90nTw6wUZUDVHqykQEJtJDm67RLKmq5kpCVu2F9PuVtclEVzxZmg5LOhIkf6aeBypeH43o559DjvM9jZfzG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kUn58I3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kUn58I3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FBDC4CEE4;
	Wed, 21 May 2025 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747830787;
	bh=PSdKIoLDxJFEKOG0Ms2J+9+RYh3NwJ96dxgAicrqC8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUn58I3p9MnW4XfHfUk6JlJHdwn0YI8lM4krQhOP9YWuKQn5A13p1tnPrjkoSJ3dl
	 ZuOIUTu1lKQ0sBM0AdGwA2i+0v4KBTFxVa6g6IOsAwqV5Grwt9jBely641LLwadp4J
	 imLU0u6mM8GYV8EsxAEROCKbFLoSZZudfdmpm0pw=
Date: Wed, 21 May 2025 14:33:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Changhang Luo <luochanghang_nudt@163.com>
Cc: rafael@kernel.org, dakr@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver:fix a bug of function remove_nodes in
 "drivers/base/devres.c"
Message-ID: <2025052143-rubble-scalded-b04e@gregkh>
References: <20250503080454.3667-1-luochanghang_nudt@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503080454.3667-1-luochanghang_nudt@163.com>

On Sat, May 03, 2025 at 04:04:54PM +0800, Changhang Luo wrote:
> The resource management mechanism in Linux divides resources 
> into different groups for easier management. Each closed group
> has a start and an close resource node to represent the scope
> of the resource group. The function "remove_nodes" is try to move
> the nodes in the same group into the todo list. Fisrt the function
> moves the normal nodes into the todo list, then scan the left node
> and color the group value of two if the start and close resource
> nodes contained in [current node, end).
> 
> While, in the second pass section here is:
>   if (list_empty(&grp->node[1].entry))
>      grp->color++;
> which means that the color is set to 2 when the grp_node[1] is not
> in the list.This situation is inconsistent with the original design
> intention that color value is set to 2 if the start and close nodes
>  both contained in [current node, end).
> 
> So it should be
>   if (!list_empty(&grp->node[1].entry))
>     grep->color++;
> that the grep->node[1] is verified to be contained 
> [current node, end) and then color is increased to 2.
> 
> Finally,
>   if(grp->color ==2){
>     list_move_tail(&grp->node[0].entry,tode);
>     list_del_init(&grp->node[1].entry);
>   }
> the closed group can be removed currectly.
> 
> then
>   list_del_init(grep->node[1].entry);
> while
> 
> Signed-off-by: Changhang Luo <luochanghang_nudt@163.com>
> ---
>  drivers/base/devres.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> index d8a733ea5..68f64256a 100644
> --- a/drivers/base/devres.c
> +++ b/drivers/base/devres.c
> @@ -477,7 +477,7 @@ static int remove_nodes(struct device *dev,
>  		BUG_ON(!grp || list_empty(&grp->node[0].entry));
>  
>  		grp->color++;
> -		if (list_empty(&grp->node[1].entry))
> +		if (!list_empty(&grp->node[1].entry))
>  			grp->color++;

Are you sure about this?  How was this tested?  Why hasn't it shown up
before?  And what commit id does this "fix"?

thanks,

greg k-h
