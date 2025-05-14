Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B8224236
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262209; cv=none; b=R7Jf4gkL6R9LlQQIeh5ngvXrky0SqFSSXFWbGjx65aixLrbRjXnqrrD/RZ4+UoEfHFnrthM5G+JRXxrpfnhPzqhpsWR9t1M+1ql4bK8CmPrMGE+XCMC5ZyhuiiSUTbANS3+xZIgqD6tA6rV+EM/Y8g8wRHKqyNJjc8BcqvxX8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262209; c=relaxed/simple;
	bh=vXSl1bs64zVyfrEvR+wpBlXx2d2mWt9pKA/B0vOVxMs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lu1NKdKYPIGyyJjTQo+vafCsYyOChkr6pyEiAlMYrp7GS/Rt3DIVwfm3qNhaG3jlKC4C/uePAMx7MKlkFMhy7Ic9YoayXDHfO9EK9eYwOftZA/q0cm9kIgar0jxNvj52jxwg/dbSJic1ZCVlyR0BP6OBclI8ycvByvRReIDpRIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yVu60wOU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yVu60wOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9278C4CEF1;
	Wed, 14 May 2025 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747262208;
	bh=vXSl1bs64zVyfrEvR+wpBlXx2d2mWt9pKA/B0vOVxMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yVu60wOUsWmfTtD3eJG1JQLGkyZq5AaT/EsA5x2IcpdC3w6rNlnD8wj0LednTVo/7
	 Df+SJRcEyrqkI8qgwOSGYxiJ9yc7+FkF9mB+BcTzrgLjwZHDrFYIk/+x5VbPhjPI9R
	 k0B+G9AeusUHUxWMivoo63ECBsfCkBpaUDyGKnCs=
Date: Wed, 14 May 2025 15:36:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, yang@os.amperecomputing.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-Id: <20250514153648.598bb031a2e498b1ac505b60@linux-foundation.org>
In-Reply-To: <b12548c7-9f1c-48bc-a728-d169fcd5e16f@kuka.com>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
	<3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
	<106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
	<42872c96-e9c5-4c3c-9095-3f12202dd803@lucifer.local>
	<b12548c7-9f1c-48bc-a728-d169fcd5e16f@kuka.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 May 2025 17:59:23 +0200 Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com> wrote:

> > Did you want to Iganacio?
> > 
> > I would suggest chasing up with them to see if they plan to do it or you ought
> > to do so.
> > 
> > I can also do it if you need it quick, but I don't want to deprive you of the
> > opportunity to patch that :)
> 
> For me it's fine if you create the patch. That will probably be faster ;)

The original patch adds the only direct inclusion of uapi/asm/mman.h
under include/, which is a big red flag.

I'll drop this version of the patch, thanks.
