Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C511FBC92
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575414; cv=none; b=F7vCNcNdCl48+nLOhpjj/7H7TM+oScnxoH27jm2XXsUhdGxkSNhy7KWNKeC6RN0IoPEd888p1E7brcazC/2W565UAGCf6mzP8piwIr3INJnPix2+oNKslYtBt23S50VrvtwRmbPogJ7qd1WfudqhDo1RgYAc4DxhZdY+qvACj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575414; c=relaxed/simple;
	bh=W/TFAeZfFS7VZ2Whby13swcOwpYaxUdhL025szOJPWM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=seV8Fx7O3AEA4LO3aXMyTbVpxPo/EtiPrMjdi6t5/h6fSnVGSzTaGCREUMXMaZ5fcvFngDfuIsCGksvb6JcePWx/sAIJNDpmSGKMyxr2cAXzmR/x6hzUbCEX44xc6aFttCknB1rn1DJKAjEvn5j/r61cq3s/FXd5XJ1hnBz/PGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=spaUvWo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="spaUvWo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D2AC4CEE4;
	Tue,  6 May 2025 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746575414;
	bh=W/TFAeZfFS7VZ2Whby13swcOwpYaxUdhL025szOJPWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=spaUvWo4mjg3LS8dif9YOHepQ5BCUFreEbD0UY4TxYAhfHY8laGzPdfBKRZDzaF14
	 M8lnb+Nz9WcDqCmOxDvJ3c3Mx0J+blqlJTKzC3Tz2X0yuM7RSZaFrLxzRbjn89yY7e
	 IjkUu7WS3R1nrd/3p1TLe6ExH2cm4atnBIRDPvOg=
Date: Tue, 6 May 2025 16:50:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Juan Yescas <jyescas@google.com>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, Mike
 Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-Id: <20250506165013.4d48314b6d52d76148cb51f2@linux-foundation.org>
In-Reply-To: <baeb1200-5293-4fe0-aa76-b1d41875af58@suse.cz>
References: <20250506002319.513795-1-jyescas@google.com>
	<20250506000133.ba44539dd517e4f54515751b@linux-foundation.org>
	<baeb1200-5293-4fe0-aa76-b1d41875af58@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 May 2025 14:48:19 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> >> +config PAGE_BLOCK_ORDER
> >> +	int "Page Block Order"
> >> +	range 1 10 if !ARCH_FORCE_MAX_ORDER
> >> +	default 10 if !ARCH_FORCE_MAX_ORDER
> >> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> > 
> > Do we really need to do this arithmetic within Kconfig?  Would it be
> > cleaner to do this at runtime, presumably when calculating
> > pageblock_order?
> 
> AFAIK pageblock_order is compile-time constant.

So it is.  Why the heck did we make it lower case?

And pageblock_nr_pages.
