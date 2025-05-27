Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE948274FCE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355947; cv=none; b=JYjwO88j6bLenR2aky83bT50pka6PEq5Y1txtuR8knex/4xuF/HePkJAHcdgtuHSeijtrQxDXhlhktyLhtoWjOM3uf0b1i1ay8l+jhlf5z4m7mRA4FqSSn2h2cHOmkqsMl71qYg0fkVUbJWEyma7rjgCgEmUnD2rctDwfg235fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355947; c=relaxed/simple;
	bh=mldJUrKgfFN8zdljUcCIL3/0i4R+2SUupokDF837c4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3QYhB8OuYR/vWGYHm1BA8ckSMBgUkabi83wgtxC0IQCQPBNmnzL9PJQS05IElxyCpIzH0z0zztuZN3y1rbMDYps8FLqDe0e1DQvgpccSPwwP48ioYDnNTDIfHd91brQABEmllpSIuyN+aIbCG/LJr3S24aYvdBmHNXLABq7+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4n14CIS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4n14CIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6m6fUwYqNmUe829wAUeva9RRwS1btD4mQ76FCpQtbQ8=;
	b=d4n14CIST2ddZ2nGIevHHNQQoK1zHA6/j7Cl9OGHYP5+C+luMwVP3d0Rr1Ect0Fl+uJEmo
	TMSsXSl2NPTkkSHbT5ZCG1A3oOXturyW/6njza//+pF5Ga+aFejADF8wxYRQF8n9S5ALNe
	VLlCWFTZKffzmdrtxl29D5AsqgC5kvM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-5B1KHdJfMTOPo6wkkgDXBA-1; Tue,
 27 May 2025 10:25:37 -0400
X-MC-Unique: 5B1KHdJfMTOPo6wkkgDXBA-1
X-Mimecast-MFC-AGG-ID: 5B1KHdJfMTOPo6wkkgDXBA_1748355936
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B425F18004AD;
	Tue, 27 May 2025 14:25:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 91C1F18001D8;
	Tue, 27 May 2025 14:25:30 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 16:24:54 +0200 (CEST)
Date: Tue, 27 May 2025 16:24:48 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 2/2] mm/mremap: Expose abnormal new_pte during
 move_ptes
Message-ID: <20250527142448.GB8333@redhat.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-3-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527132351.2050820-3-pulehui@huaweicloud.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 05/27, Pu Lehui wrote:
>
> @@ -237,6 +237,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>
>  	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
>  				   new_pte++, new_addr += PAGE_SIZE) {
> +		WARN_ON_ONCE(!pte_none(*new_pte))

it seems you forgot to add ";" after WARN_ON_ONCE ;)

Oleg.

