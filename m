Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E9A14830A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748281188; cv=none; b=CBy2Q1gPEjKekvm+H06QX7lXmNKc/Av/LPQG5Nrjww1qgFcI+mh5s5KQLaeK1xBTM3DmECKaxNNadkqGlvOE0MC6diPh9nFFfBEI4tx2blt3f08bziPh3eDTZiyYohhimUQpfYLNGE03lrPH+NoUijFQSmqABPSN9xSEIiE6904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748281188; c=relaxed/simple;
	bh=7POWGV++9EvQDYKwRA1Pn/xogWRtxu53Mc+LarYBpB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk/OVH2LLXwT0Q/sJD5lRnDoX87jFl9ioUvoGJzmAuaK+bbrjT2qd1QYUvV7AD89nVZA258WeCv7O+WFnZTwj2/jgWSzB7m7m+IEuAeHJvE8jqIr1I3dgzvH5RDIy6WAVGV6xT7lk1etw38T9nrvtu2osWbXMYe1tTq3F1B6rd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G2Lukzd8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G2Lukzd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748281185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FMgqe2XovQKgQ8qxgf6Yojc0GW4kdSAJmFAdT4pMliU=;
	b=G2Lukzd8f5z3e7uYkPP1sYIrVc6I08/LeYvq3xABLy95642+pclXyXH6TIxZWwZwDdyAN2
	scj28oW2nCeEUeGFUJfCnEYOFE1110ItqAJ597Be0RVwerTapxFwXNkAApD29lKmgkVadE
	4/uqi3aUVzx7Rr1lsjins0V98Pb5rJA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-LFLqTxjvMDm3jWJ0F0FKEQ-1; Mon,
 26 May 2025 13:39:41 -0400
X-MC-Unique: LFLqTxjvMDm3jWJ0F0FKEQ-1
X-Mimecast-MFC-AGG-ID: LFLqTxjvMDm3jWJ0F0FKEQ_1748281179
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5F9C195608E;
	Mon, 26 May 2025 17:39:38 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6469A195608D;
	Mon, 26 May 2025 17:39:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 26 May 2025 19:38:58 +0200 (CEST)
Date: Mon, 26 May 2025 19:38:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, mhiramat@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com, Andrii Nakryiko <andrii@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <20250526173845.GC4156@redhat.com>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <20250524164516.GA11642@redhat.com>
 <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
 <20250525095926.GA5391@redhat.com>
 <e6b657c6-98b9-4690-9a26-27db0fa7c794@redhat.com>
 <20250526162940.GB4156@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526162940.GB4156@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 05/26, Oleg Nesterov wrote:
>
> On 05/25, David Hildenbrand wrote:
> >
> > On 25.05.25 11:59, Oleg Nesterov wrote:
> > >
> > >OK. But do you see any reason why uprobe_mmap() should be ever called during
> > >mremap() ?
> >
> > Only when growing a VMA: we might now cover a part with a uprobe, which we
> > have take care of.
>
> Ah, indeed, thank you...
>
> But. What if mremap() expands and moves a VMA? it seems to me that in
> this case uprobe_mmap() won't be called? I'll try to make the test-case
> to check...

It seems that I was right...

	#define _GNU_SOURCE
	#include <sys/mman.h>
	#include <linux/perf_event.h>
	#include <fcntl.h>
	#include <syscall.h>
	#include <unistd.h>
	#include <assert.h>

	#define FNAME	"FILE"
	#define ADDR (4096*16)

	int main(int argc, char *argv[])
	{
		int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
		ftruncate(fd, 2*4096);

		struct perf_event_attr attr = {
			.type = 9,
			.size = 72,		// PERF_ATTR_SIZE_VER1 to include config2
			.config1 = (long)FNAME,	// uprobe_path
			.config2 = 4096,	// probe_offset
		};

		assert(syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0) >= 0);

		assert(mmap((void*)ADDR, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, fd,0) == (void*)ADDR);

		int flags = 0;
		flags = MREMAP_MAYMOVE|MREMAP_FIXED;

		assert(mremap((void*)ADDR, 4096, 2*4096, flags, 2*ADDR) == (void*)(2*ADDR));

		pause();
		return 0;
	}

and
	/tmp/D# ./test &
	[1] 102
	/tmp/D# grep FILE /proc/$!/maps
	00020000-00022000 r-xp 00000000 00:15 2060                               /tmp/D/FILE

this test-case doesn't call uprobe_mmap/install_breakpoint during mremap().
I added a couple of printk's to ensure.

If I remove the

	flags = MREMAP_MAYMOVE|MREMAP_FIXED;

line above, everything works "as expected".

Oleg.

