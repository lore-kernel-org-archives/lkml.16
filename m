Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FC25634
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359864; cv=none; b=MpxnZv8ETk5vZVArkUF7a7C8sIhXtiRfYzE5oZLDkeo4aHN5AaTAFAEkla2QdZy1mCW+B+3As8HFIU19R+HrgOepXvjoh41DznVBAIAROuU9fFmk2iKHss818rwZeqqjwUbkmgA/eHkIsJk6k8yDBJUbUv6vNwAQ5ADZy5Z+1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359864; c=relaxed/simple;
	bh=2erwN6Y7H2+Ivj/8faORZ/7jI/V9kK53sZr1lymHRL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv9wqRXi4o14tpwv6HlxndApFGVf3qYr3kBXUnro6Ea3C8htAdQXazSDjwUQW5Nfyt0zR2NkjuKJdn2P432N3rTqEHsUz1pDnlsva3P3vhyUTDoeFu8JvA3p+sik/VT+1IISGWtWYnhGlp/ZabHmH/asVi7k7PegDITEczX7tY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPWnp4re; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPWnp4re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748359861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k3Iaq3MntvjDln6IzJbTGvcMOmcLmVF70dqmVM6voj4=;
	b=cPWnp4re9Wd28CIKcoBlAJ4qP7fnhWFJo+kxuqPhz+mta/HHYV1Bm4344qO1mH5LI1aSMe
	fHJZizK2kJxYbDT3wvPpCtD6tKgz++eC9QU8tfzbDeEmhCVZbFmFqN3t60EDUnsKomMYgi
	XwKsO2AAQAVupYuRe3CPjd1+UtsuerI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-327-UvECuc6FMziKTV6uLV0KJg-1; Tue,
 27 May 2025 11:30:57 -0400
X-MC-Unique: UvECuc6FMziKTV6uLV0KJg-1
X-Mimecast-MFC-AGG-ID: UvECuc6FMziKTV6uLV0KJg_1748359855
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03A201945109;
	Tue, 27 May 2025 15:30:55 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 25C7519560A3;
	Tue, 27 May 2025 15:30:49 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 17:30:14 +0200 (CEST)
Date: Tue, 27 May 2025 17:30:08 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <20250527153007.GD8333@redhat.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527132351.2050820-2-pulehui@huaweicloud.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Not that this is really important, but the test-case looks broken,

On 05/27, Pu Lehui wrote:
>
> #define _GNU_SOURCE
> #include <fcntl.h>
> #include <unistd.h>
> #include <syscall.h>
> #include <sys/mman.h>
> #include <linux/perf_event.h>
> 
> int main(int argc, char *argv[])
> {
>     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);

FNAME is not defined

>     struct perf_event_attr attr = {
>         .type = 9,

Cough ;) Yes I too used perf_event_attr.type == 9 when I wrote another
test-case. Because I am lazy and this is what I see in
/sys/bus/event_source/devices/uprobe/type on my machine.

But me should not assume that perf_pmu_register(&perf_uprobe) -> idr_alloc()
will return 9.

>     write(fd, "x", 1);

looks unnecessary.

Oleg.

