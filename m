Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADDADF5C;
	Fri,  4 Apr 2025 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780739; cv=none; b=pg5w5KFPluu8JvtnYTQ3T37TDO7GQzUnX+hR2S866J1S+tsDgzmWyzhzGffoQgrHXvwDeyn8m8DF9vqO0CLaspFbL/vnUXs2GwFJYu4lakmY14mvIdKlP7wiCqGxRXEqNZaKHM/jam7e2T3i1irTefYTQEvN+pzgRI1qu6MvYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780739; c=relaxed/simple;
	bh=lspfCdwfiLKH5TIIU8Fn/Y5QaTGyaJPs6cQSG79n2MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZD02fiXA1RL2b++LVC82uQvoL24gh4Ivu2Cg9pkiQYaIBiNOv9sv0OHUasIQ652+m8UZeyZ6x3IGvr1VbbYBPyPYp/ciaWVWOTtSfhqdTKtAxCh/wqhAaDg0jr8quULE35uS7aD1c1h4OgqGQ6kAQzHUY+63OlbK0KUP7AXsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZmZ27RA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZmZ27RA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB55C4CEDD;
	Fri,  4 Apr 2025 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743780737;
	bh=lspfCdwfiLKH5TIIU8Fn/Y5QaTGyaJPs6cQSG79n2MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZmZ27RA5lC9X6XJJzg/KfOWu0VZfFLZF5u/Nsl5jOZfRIcWapweLHSf2FL6qvYXS
	 ydM0F+0P1lwusCrQi2y3Vk9NQh9IGC9/UyLvNR5XY3pmTtI5EmiFo2HeYuDBKaqYBU
	 EMpd1Qvv1LzOupjw8GWg7k65zyZ5/8S+XOkhkATNqu8RWSjh0eAq9N7pMAznuYv7vj
	 R31eH0C80Ezf2bCy8g/A+ToiYaRtyKjiHieoUYMA/p/lMnJcu9SLPU34jFBrwGT90D
	 HtUVOLzY0wGkvoXJX5+hc4K2nQLUH/zodT7STlfquE26oNtGu2EdEKwWNXTLvE5C/U
	 YkvCyFIMUINpw==
Date: Fri, 4 Apr 2025 08:32:15 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	willy@infradead.org, linux-mm@kvack.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org,
	gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404140657.29285-1-kernel@pankajraghav.com>

On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> THP support for non-tmpfs filesystem has been around for some time now.
> Update the admin guide to reflect it.
> 
> While we are at it, move FilePmdMapped to previous paragraph for clarity,
> and clarify ShmemPmdMapped & ShmemHugePage.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Changes since v2:
> - Address comment from Bagas Sanjaya
> - Squash commits and Ack from David
> 
>  Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index dff8d5985f0f..f8aae64e38d0 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
>  that supports the automatic promotion and demotion of page sizes and
>  without the shortcomings of hugetlbfs.
>  
> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> -But in the future it can expand to other filesystems.
> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> +filesystems that support large folios.

That seems to allude that THP can be supported on filesystems
that suppor large folios. I don't think we want to call that THP
and that can confuse folks. Leaving "currently" also seems to
indicate that there is more work to be done for THP for filesystems
but that's not true as well. So how about something like:

THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
filesystem to support it. The alternative to THP for other filesystems is to
support large folios and with it you can end up using huge pages
opportunistically.

  Luis
