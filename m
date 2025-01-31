Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28F182
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738284517; cv=none; b=k1V/GWmL4+kMLTTgP/xGRgB5Cm/Z0yP489sOWEOcS/xJ9p4sPF205iqr3w7qNZH+x3wqIHEs57Afmw/lfzGvxEU7EP4/9cN2VEXk98xHC9TEtYEDQsnEhxUiIydk90kmyyElgSPies71/avYyLEcNoTdrLmFCM2ku+0cE5pyW3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738284517; c=relaxed/simple;
	bh=s/w0Uw8FyTmiMwtsU0yNyaCLd4868zM5jg3k1K4mjLE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Lul5LWc5IPqBwC3ehWppS3pogMb1AH3KKEL7vm7LGWGNHxRSlnvyOZpnGxN9/S+8WswArr659TxRNAOB+rnMIrot9009m6V87FC+FlBMiEt45xvH9N8AgP4CMsf1Ati7EKrtKh67GL5VN3wNqM/5ipsoYi+A0V7OdsCU1s30QVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=k1tnMc2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="k1tnMc2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1B4C4CED2;
	Fri, 31 Jan 2025 00:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738284517;
	bh=s/w0Uw8FyTmiMwtsU0yNyaCLd4868zM5jg3k1K4mjLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k1tnMc2XXtH9vo2gbMgXHk0eQhPJH9hzgaQdexs32uWCR3oU//rRWFsCABuTSYLgY
	 Xka0nBQ9Z91S+NUovmSfzm0LJA5pHWSlhg/jadgQNutqZ6H1m1GZ50h+YW2pLH4v3O
	 M4seZeYHnlT3bl4NxTa0YyPwYPlb7NCrah5531f0=
Date: Thu, 30 Jan 2025 16:48:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, hch@infradead.org,
 urezki@gmail.com, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 0/2] vmalloc: Introduce vmap_file()
Message-Id: <20250130164836.1163f66bede77ec4bcc9d4b9@linux-foundation.org>
In-Reply-To: <20250131001806.92349-1-vishal.moola@gmail.com>
References: <20250131001806.92349-1-vishal.moola@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 16:18:04 -0800 "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:

> Currently, users have to call vmap() or vmap_pfn() to map pages to
> kernel virtual space. vmap() requires the page references, and
> vmap_pfn() requires page pfns. If we have a file but no page references,
> we have to do extra work to map them.
> 
> Create a function, vmap_file(), to map a specified range of a given
> file to kernel virtual space. Also convert a user that benefits from
> vmap_file().
> 

Seems like a pretty specialized thing.  Have you identified any other
potential users of vmap_file()?  I couldn't see any.

If drm is likely to remain the only user of this, perhaps we should
leave the code down in drivers/gpu/drm for now?


Also, the amount of copy-n-pasting from vmap() into vmap_file() is
undesirable - code size, maintenance overhead, etc.
