Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773F92AEFE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247019; cv=none; b=KvdAG7QKhf0iyJ5PuQySHtsarfGbFDSZbW3/zcZ61mYvR21DuYWVtfgrIFQOLF4qbazM9lDQIQXbVJif1WWNgt88f3c3MQsVmqpUcXs7P+sTjy8w6MsLXJWLtFpJtplQyf6nrvcQF/BjUdmV4w9sp/Kh7msfEmRGpKQbgOM2ISo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247019; c=relaxed/simple;
	bh=MVy8cVlE3Okuj4xzQPhUZu7DrTOM2aYv6fkY2X2kgMw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HPRd9dEpfryRscgTlwwatizY8kF7EOeiN6YkBIyCMel1f+Nm3dbzKpBmMI+fL+UeBit/f4dY52PiKgTYz+RLSOfWbdeDKYc7gln7gWGU8U+H7eWJP4cwIuE2sTUeJOklfjC9cbK0n6IbCJByxCUcpzsZQI6Dk7XvN2NQQ9POezA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wGpAtDuS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wGpAtDuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322A9C4CEE2;
	Thu, 10 Apr 2025 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744247018;
	bh=MVy8cVlE3Okuj4xzQPhUZu7DrTOM2aYv6fkY2X2kgMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wGpAtDuSarFINLfgLbxak0ba77fh/xz/MlTbTSPd1abOWXzIJm5layy1VsZGnPu9J
	 5ySirkWmcCCWtDD9PfNV9hq00aEIWL/iICJNe/YXH26uTPfLDQJkd4t7Hfq3/dDIc/
	 F9E2Fj9GeURUKeImurwNyypqfvS1rTQ/OI77jkb8=
Date: Wed, 9 Apr 2025 18:03:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, kernel test robot <lkp@intel.com>, Dan
 Carpenter <error27@gmail.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
Message-Id: <20250409180337.4fbd2daa3880bc0e1a37b073@linux-foundation.org>
In-Reply-To: <acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>
References: <20250408085950.976103-1-david@redhat.com>
	<Z_ZMqPvQTxsyhCa9@gmail.com>
	<acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 12:34:47 +0200 David Hildenbrand <david@redhat.com> wrote:

> > Note that the title isn't accurate anymore, it's not an 'x86/mm/pat'
> > patch, but an 'mm' patch.
> 
> Agreed. Who will take this patch? If it's Andrew, can you fixup the 
> subject please?

I edited the mm.git copy.
