Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4027FB19;
	Mon, 16 Jun 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083636; cv=none; b=PkxvIK8pK6VWnA22FuvsLShqT89VaQa9+huzavKjF/C05Mo6yHheH3Hpp7MlOm50pRFrH1bVJ89LN5THC1d/AYpAZGTfMZfURBNQCbpF6JjmJT+sUW+OX4jlKLpNKDjh7OaTTpYBSg+FPnHEKy1y833Q/cunbUfeUAH7Xno/IpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083636; c=relaxed/simple;
	bh=grkJcWzmICLPJj+VGty8J6WYVLf/IosoippPMU193fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+EMXhV4GfbEPzpeu+zRSyk6JbSFB/6g1BHh+lJMVB3V05pkIiE+t7UqGDvShYdet8W9Yoqz+9POq81bM/Ds4HwEODwcySXNlU3/aCUbWDl3Hhh9KZS5OWcY3m4AqSh4YrpALopUfYdPyMagjl1YRHxr/FNW/FbWoY0Ng7zKWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hdG0mtKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hdG0mtKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F19C4CEEA;
	Mon, 16 Jun 2025 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750083636;
	bh=grkJcWzmICLPJj+VGty8J6WYVLf/IosoippPMU193fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdG0mtKnxzj7gMAd4LMXdh/pJ0akPHFhnhKuqta+YT+XB1T0W5vWITGrLtRUBhNXY
	 sVTnmkvxGGOojdXJzYflkG9rSr1rx6/zst5geTHANEN1bOXuwG1/csDBB8zUEb9stH
	 4UQY30ZdsjOLXAR7ve+h0QPr6N+z+STNlxiAV/pA=
Date: Mon, 16 Jun 2025 16:20:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: agruenba@redhat.com, skhan@linuxfoundation.org, gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] fs/gfs2: use scnprintf() in show functions
Message-ID: <2025061623-hazelnut-blandness-9b03@gregkh>
References: <20250616105626.372040-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616105626.372040-1-pranav.tyagi03@gmail.com>

On Mon, Jun 16, 2025 at 04:26:26PM +0530, Pranav Tyagi wrote:
> Replace all snprintf() instances with scnprintf(). snprintf() returns
> the number of bytes that would have been written had there been enough
> space. For sysfs attributes, snprintf() should not be used with the
> show() method. Instead use scnprintf() which returns the number of bytes
> actually written.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  fs/gfs2/sys.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

sysfs_emit() or no change at all please.
