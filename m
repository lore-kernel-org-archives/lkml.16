Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D131E48A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359093; cv=none; b=FxNHH2IGWkifwwEOOpCHbJgWE7ifSEoR6hppT0NuZ2hUHQB8Ws0Plmyi8iHtx5MWD6nCY4WtsK6N6dGdk2lweKqHU6imtGi2FakiOBPPrMW58r9gNBHvdHT7rBAa9rx0Y4hZXHXD5w5wD83yAP6bdL8W17++Bgtv5+r5eogdmJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359093; c=relaxed/simple;
	bh=zAs1l5N8QR4S+KMnC/1DQqVjrRQ0/Ijhuvh531ty540=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa3CxDcSDH/qJVwkMa8dBVFM8v3gjwhOIWPKkDdNk5JCJY/U4TJvnDRJVxH7PlzSBNOUgiAPVKoxs4yfk13P3PV3aNdujIfoejSApqF1LV68WMiSK4iYda91XIzozkgKbOx2msnolZCi/ivkKtekJiwLCe6KwYI1ph2RehqfKgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0c9aR0K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0c9aR0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748359090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zAs1l5N8QR4S+KMnC/1DQqVjrRQ0/Ijhuvh531ty540=;
	b=c0c9aR0KQoocuUoPiOcc1bPb86tFH5EVZzr9fqTl9S2Ho9wlXfnDk/bMahczgbrG8SV7+O
	e+EuKmf46ARH4EEWQyTno+CMWamhD8SA0bMJgxgb3RRXAMpvx31h7FO5Vw0dT54bos+1Ky
	kx5k72n0W3VO6CQl7rMxaNHCwM+eFNk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-S7n_sbMJP0eY7lrl2XUyJA-1; Tue,
 27 May 2025 11:18:05 -0400
X-MC-Unique: S7n_sbMJP0eY7lrl2XUyJA-1
X-Mimecast-MFC-AGG-ID: S7n_sbMJP0eY7lrl2XUyJA_1748359084
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E9FA19560B0;
	Tue, 27 May 2025 15:18:02 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2637519560A3;
	Tue, 27 May 2025 15:17:56 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 17:17:21 +0200 (CEST)
Date: Tue, 27 May 2025 17:17:15 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <20250527151715.GC8333@redhat.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 05/27, Lorenzo Stoakes wrote:
>
> I am by the way assuming that uprobes work by installing a special PTE at
> page offset 0 and only in the case where there is something installed here
> do we need to worry.

perhaps I misunderstood you but no...

Basically, we have uprobe_register(struct inode *inode, loff_t offset, ...).
If / when a process mmaps this inode/file and the (new) VMA includes this offset,
we need to call uprobe_mmap() to install the breakpoint at the virtual address
which corresponds to this offset.

Oleg.

