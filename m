Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E901F03D4;
	Wed, 21 May 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828159; cv=none; b=CrIRdgFUyF3X/8BoZbypLsDvXbhd8czIGOklOBA9ahxaZNyLs7Nqhb9NkmUCHJV4pHZjTlaIJh1NKZXzB0fgxh/o8ZNqX3J0qLhn4V0OCz2/sj+kSFC7EDUITrFyOs1Fjbgl23NA0SKC7usF3Z+HOB8JsCzZy3A5rAw5h2AJC8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828159; c=relaxed/simple;
	bh=1LwA2GAhwan7Yfks6zNqiyeBdTLhVZ7t69oj5wVv4HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArhzQc8Gf0tWyljr98LVjtD1fdTyP6h0esYlyKro8HUVQQuZGcaKi3lcRCzq5+NsMqCbVBGuEIBKTxCZUxWZKblfsLXCtAyEsdyaOVO0nbv4k/S8Vd8ffOSR/jg1rFr0nDnZEPyOLshSFGqe1B627MYwxAgpUClS53Z7DCJWVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X0QIB/4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X0QIB/4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24052C4CEE4;
	Wed, 21 May 2025 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747828155;
	bh=1LwA2GAhwan7Yfks6zNqiyeBdTLhVZ7t69oj5wVv4HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0QIB/4hs5P5YkJJvjXUrSIDQFDrXs0sZqozxyd7YmwXwn3j8ibUL92MYE0BZM/u6
	 gA+yipPI9cCBOTmkaZTEjt/2RQkJfELxvzRfbx9PHA5qY/hYgkgiPjVl/DMWWxhuHu
	 3+DqCtOZeX3iC/MYvsh2wVmGw6cLcceEbwms6Yc4=
Date: Wed, 21 May 2025 13:49:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milos <milospuric856@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Align next line to open parentheses
 in core/rtw_xmit.c
Message-ID: <2025052156-engorge-boogieman-8434@gregkh>
References: <aCfcAsM5OBo7HcOg@milos-ThinkPad-T14-Gen-3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCfcAsM5OBo7HcOg@milos-ThinkPad-T14-Gen-3>

On Sat, May 17, 2025 at 01:44:50AM +0100, Milos wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parentheses
> 
> Signed-off-by: Milos <milospuric856@gmail.com>

We need a full name here, please resend with that.

thanks,

greg k-h
