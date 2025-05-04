Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4322FB6
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746327816; cv=none; b=Kg+lyVFnqxMdel+XONF3hDCJ8BGlx7EVfNvuAvF4P+1ORTVrGEGuFwbHKe3lBDms5+Sf2X6jTwVilwrDXCyG6G9Sj5pqXK/OPtci3m3QMuAplZlpkgA8N2+ZOSj5WMbrjn8I0s6SxulY4Ww3Gin/fTSXeD02oN4RG97gXjIUfug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746327816; c=relaxed/simple;
	bh=osY7ZE+fWnahBAFnTA6dw+ECOJbwn2DS8Ko1o49S1Kg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=n3vlnvKf+vOAHDVH7vxAbuMPCLYTllX+km9ZGPL3/vl02Th0YJxjXVWjF98zAUdUpuj1seDXuTZmM+R3WvavkgJcPV88FygrViNHbPTkq62Wifm9hcQ28sv3Nw9E8G0O1pD3ypSLrA3CwCDtFNEuJqIWlmTcts78f+7M/3J9uDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0OwOF5GR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0OwOF5GR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906FCC4CEEB;
	Sun,  4 May 2025 03:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746327814;
	bh=osY7ZE+fWnahBAFnTA6dw+ECOJbwn2DS8Ko1o49S1Kg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0OwOF5GRKu1XM8PCJmtJm7JwwRhQ+5OfsLLDyZ/GlFRiyRAV8do+q5Vwxrmz3T/xa
	 5ZYDxWowFGupNj8IxGUa0dbSBDxGjyOcbb013O6cd79XD5RrhMX2CdtrnNTCN2fr3e
	 VpiC1xdVqc5nG9LPkG+e6QIebyn0iikxJ2xUoxWA=
Date: Sat, 3 May 2025 20:03:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, Hyeonggon
 Yoo <42.hyeyoo@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH v3 0/3] Implement numa node notifier
Message-Id: <20250503200334.3f912eeb7ca484bca4eec7fd@linux-foundation.org>
In-Reply-To: <20250502083624.49849-1-osalvador@suse.de>
References: <20250502083624.49849-1-osalvador@suse.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 May 2025 10:36:21 +0200 Oscar Salvador <osalvador@suse.de> wrote:

> Memory notifier is a tool that allow consumers to get notified whenever
> memory gets onlined or offlined in the system.
> Currently, there are 10 consumers of that, but 5 out of those 10 consumers
> are only interested in getting notifications when a numa node changes its
> memory state.
> That means going from memoryless to memory-aware of vice versa.
> 
> Which means that for every {online,offline}_pages operation they get
> notified even though the numa node might not have changed its state.

Why is this a problem?  Is there some bug?  Are these notifications so
frequent that there are significant inefficiencies here?

Further down-thread, Gregory tells us that Dan's patch "seems to fix
the underlying problem", but nobody (including Dan) told us about any
"problem" at all.

