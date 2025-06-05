Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39EB4AEE0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160248; cv=none; b=IOsS+H+fv2+xYwhd2DyNyp5hlyQvWO9YXfFcCoT9iOy4k8faLFIIqtoi3i7+p58q7Faj8dz19TBqVydtDjxSfbLP92s24lSHDVPvYyV0S4CCj+B3kYY5sPHpbdIuHigR0+5+XPIHyF6RqCAFvEocs0z/PFIpJxZmvp7Gr1MPgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160248; c=relaxed/simple;
	bh=O2TlHDafY3Hdx94VEJOxDAY1FvVnsudEvyXIgZm3Ewo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qKR445uqFNFDn8rnF+ItkNFlbK1CqZtcpeFifQeGw/ifF/qIjZBOQ1h5aFn7t9cYeFlBrKQM0V1q9q8pXHbuqJ87KqxhIgIHYWik1xFyriW7mtRed65mle3hKJ87Nujhvdzp87Q+qqLzKYZajUeY4qep4C3an3ZIo8KcocQRtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kVJP2OkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kVJP2OkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C3CC4CEE7;
	Thu,  5 Jun 2025 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749160248;
	bh=O2TlHDafY3Hdx94VEJOxDAY1FvVnsudEvyXIgZm3Ewo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kVJP2OkVKpSuIcWAuzYHIHFXBLnQzE19qpIC74Yg094JZyVNQ/h2RI5gxQpnFU9q6
	 A/E/gGF++Bg81IUFReS8vRwxKy37x9PMi/rDBXGE8NmirmQIncIzJjToDGxHaWXnfO
	 j0BN4jmgmvsDH5uDqnw8jL5qLzeizIIpv9xFm4d8=
Date: Thu, 5 Jun 2025 14:50:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, muchun.song@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>
Subject: Re: [PATCH] mm/vmstat: Fix build with MEMCG=y and
 VM_EVENT_COUNTERS=n
Message-Id: <20250605145047.80cdd84bc3dd321d535d4895@linux-foundation.org>
In-Reply-To: <7lakc6hxbimvkgakpocj3aa65sdhmskm5p6hlurbwzyps33gfb@2z2eoz253hs4>
References: <20250604095111.533783-1-kirill.shutemov@linux.intel.com>
	<6fffd2fe-0cee-405f-af78-b57b5e5d02e8@suse.cz>
	<20250604142043.bdfdf4f9a6a6cbb57946f1a5@linux-foundation.org>
	<03c2b01b-18f5-4015-a19b-79b8af656697@suse.cz>
	<7lakc6hxbimvkgakpocj3aa65sdhmskm5p6hlurbwzyps33gfb@2z2eoz253hs4>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Jun 2025 14:53:59 +0300 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:

> > The changelogs of these two don't reflect the new ordering though, maybe
> > Kirill can provide updated ones?
> 
> Maybe something like this, for the first patch?
> 
> 
> mm/vmstat: Make MEMCG select VM_EVENT_COUNTERS
> 
> The vmstat_text array contains labels for counters displayed in /proc/vmstat.
> It is important to keep the labels in sync with the counters.
>
> ...
>

Updated, thanks.
