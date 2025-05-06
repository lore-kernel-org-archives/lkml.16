Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDCB21C184
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746573675; cv=none; b=YihLpxpiofg4I5S9b0P7b1FLzYv/C+Rqqeb4Ewdb0qMP2PzFSpikNpp2uHprSreAzMvekjHIcuDF2gqIx0CKWl54ndK/0hWAd3luCAyVqzZW+8+EkDPwcVR3EQB+qiLE/G+GBHCSwQrxZJAweT0fzMkfmEdNpMtroPoD4H17Z8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746573675; c=relaxed/simple;
	bh=l3XgxCs+s8au1lzposI/T+kU1FVmSyNIo4zZ3hOpeZo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KUBoF5493SoD8PNlnO/ss0pDaIK5FoZaFckv8V7n2JFowSAOZf3oWKcFwCDGPWhIiZdg2bLTQDM3SJKCj4482SAgJGAuGEr9MURzmgu/RROpCfcNhiJdxIkiX8QZ2MlfXkjDmdw541FdI9xkcNrxGbxKNf4CNSQNkBu2vKrjoXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=j/iqon6N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="j/iqon6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E122C4CEE4;
	Tue,  6 May 2025 23:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746573674;
	bh=l3XgxCs+s8au1lzposI/T+kU1FVmSyNIo4zZ3hOpeZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j/iqon6NCnpaTF8ODwev5GC6AwqTsPaNEeUC7bRxB2hCfpbvFxQ0zp/B4RIUGa8xv
	 wz5ES23lzStiBYkuJHBYib5vFV2ZVLLhbY2OceWtHjCZBKy/C4maCpFzSi2AK6L+69
	 M3kT60Jn5li7OIHOmlSozfPWSWPxJQtoRahypyQM=
Date: Tue, 6 May 2025 16:21:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-Id: <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
In-Reply-To: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 May 2025 18:36:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for GUP (Get User
> Pages) support and add appropriate maintainers and reviewers.
> 

Thanks, I was wondering about that.

(looks at vmscan.c)
