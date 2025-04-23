Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15F1DFF7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401571; cv=none; b=tASYSiagYmUU3AvVg7JctwkankP4AnOuwk136/WA9yES6KRZLfh27vYvRi8BdHXclaSp60+SZD+xf/dAETmAwqb92PduAnnjwM6Y1UvQkm3u715a3MMs9mgfVY3i7eJMS7jCy7DDNyX5HL7D18rUpKixfOIGpwoDnUDR4qVanMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401571; c=relaxed/simple;
	bh=3FVT/vdy5g7Nyaqollk7Y8oVmZH7u6OopWHnx7KD8zQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s3qHlXWFJ3lvyA7F7eSanRbVkFZoh/1QNoIpEhDQ/qdO+aq+iefgMgJqB5uhsHFzYeijRcy+bCjrnSSkaOWPLNjAGEBZ5bxJMhI8AFxiUuikvd1p2sEOaCf3h/aJ/NU5Dj93M1iYmv4OyjNu/+hiZR9IqaPYVK3eOWlOaPosL1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BgzMpl+w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BgzMpl+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745401568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AGjuoh4qYogPJYswaAiEUROsXAnPjVmc98rcaYTzsnM=;
	b=BgzMpl+w66qUfAcC1amqLp0j0r2p/puRgxZOuGu3JDlvtaqYjseFzYq8UoUd2Cga6kuN+/
	4kk3Z226ayDoHcUYagE7WRTRoCC4b7Bdt3NBGABxfFNZyPqns/p90gijMyGG+8A5NRN4vF
	hDS3NTf5FK5CXlo4KGB7mjGCrCPzLT8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-B-36XaJbPS6UJ5Flly-XWA-1; Wed,
 23 Apr 2025 05:46:04 -0400
X-MC-Unique: B-36XaJbPS6UJ5Flly-XWA-1
X-Mimecast-MFC-AGG-ID: B-36XaJbPS6UJ5Flly-XWA_1745401562
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C11E1800ECC;
	Wed, 23 Apr 2025 09:46:01 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.172])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C4191956095;
	Wed, 23 Apr 2025 09:45:56 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org,  linux-debuggers@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-toolchains@vger.kernel.org,  osandov@osandov.com,
  paulmck@kernel.org,  sweettea-kernel@dorminy.me,  liuye@kylinos.cn
Subject: Re: [PATCH v3] tools/mm: Add script to display page state for a
 given PID and VADDR
In-Reply-To: <20250423014850.344501-1-ye.liu@linux.dev> (Ye Liu's message of
	"Wed, 23 Apr 2025 09:48:50 +0800")
References: <20250423014850.344501-1-ye.liu@linux.dev>
Date: Wed, 23 Apr 2025 11:45:53 +0200
Message-ID: <87jz7bky7i.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

* Ye Liu:

> From: Ye Liu <liuye@kylinos.cn>
>
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
>
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
>
> Output example:
> sudo ./show_page_info.py 1 0x7f43df5acf00
> PID: 1 Comm: systemd mm: 0xffff8881273bbc40
> Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
> Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
> User Virtual Address: 0x7f43df5acf00
> Page Address:         0xffffea00049a0b00
> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
> 		      PG_private|PG_reported
> Page Size:            16384
> Page PFN:             0x12682c
> Page Physical:        0x12682c000
> Page Virtual:         0xffff88812682c000
> Page Refcount:        37
> Page Mapcount:        7
> Page Index:           0x0
> Page Memcg Data:      0xffff88812642c000
> Memcg Name:           init.scope
> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> Page Mapping:         0xffff88810f086a70
> Page Anon/File:       File
> Page VMA:             0xffff88810e4af3b8
> VMA Start:            0x7f43df5ac000
> VMA End:              0x7f43df5b0000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:            0xffffea00049a0b00
> Compound Order:       2
> Number of Pages:      4

Does this show the page access flags anywhere in the output?  If not,
would it be possible to include this information?

Thanks,
Florian

