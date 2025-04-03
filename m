Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5D1E87B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687878; cv=none; b=kwjJP6JwizJtKr5gp3QyX+sJP5wBb+etcnaa3fHtUaeSAHXbjWhtKs5i3hfXFVCazCb2Z6tGyQeF4bsBr54j3Dot0q9/LA233gtIp5XC4mIlY7U5UOa0bSX7HYDjTHNqzi+8i8adRBhI9T/FqPCKenDgnBZGuYVXSgj+uRsuCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687878; c=relaxed/simple;
	bh=LS/43K4/0QXKyYxp6vOBZbh0jHJy+VYGT+vTGVQ0fD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6nklH4fMqjrdVNyWX/3KMIAimEhqwhoN/SqoY3NEOStIvD7MCRq0zMLgBzugTMfOcgJy2v76tNC1v9vzwx4GbeAZVlqL0yUoXAZMY5qy56xhvOk9bXeY8odxUBhmrs2RYlKHL6Gcb+Fnz3o2MQLQf47SsR6+8+aXlgdzwpmBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5batscL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5batscL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743687876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LjbMkCEdEbY22aSaqoXmBQBSbJCe1HnTps11CLThsMY=;
	b=C5batscLQaor8hWoyDiV5KMyIo8blF9lUtjoIu7/k0KC0oWX0deXi+R8YGpiLKLGBon6Oc
	YbxMqc1pSANTgVeS8/ca92yovJYiXEhN6u8Vp+NEShByxEwe7XqqNh1w+peT3LlSj7517X
	C9WAGINWH1UOYjSjKrBGa8ZrSYZ0WkA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-JIRrw_pwMbizmmVqlqLmrQ-1; Thu,
 03 Apr 2025 09:44:32 -0400
X-MC-Unique: JIRrw_pwMbizmmVqlqLmrQ-1
X-Mimecast-MFC-AGG-ID: JIRrw_pwMbizmmVqlqLmrQ_1743687871
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F6F71954B36;
	Thu,  3 Apr 2025 13:44:31 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6CE8192C7C3;
	Thu,  3 Apr 2025 13:44:29 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:44:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Message-ID: <Z+6QrsAhA4nBz0sj@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-7-bhe@redhat.com>
 <Z-pnCLaAp43kJVCM@gmail.com>
 <Z+qkrZcYbhdAVL3r@MiWiFi-R3L-srv>
 <Z-uTzP2CpG9ntXY8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-uTzP2CpG9ntXY8@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 04/01/25 at 09:20am, Ingo Molnar wrote:
> 
> * Baoquan He <bhe@redhat.com> wrote:
> 
> > > So the above comment should have said '256 TB' pages, unless 
> > > there's some naming weirdness I missed.
> > 
> > Hmm, there could be misunderstanding here. In 5-level paging, PGD is 
> > the highest level, P4D is the next level of PGD. You may have 
> > reversed their order.
> 
> Erm, yes indeed I flipped those two, so the correct table should be:
> 
>   - level 0:                 4K pages
>   - level 1: 512x    4K =   2MB 'large' pages
>   - level 2: 512x   2MB =   1GB 'huge' pages
>   - level 3: 512x   1GB = 512GB 'P4D' pages
>   - level 4: 512x 512GB = 256TB 'PGD' pages
> 
> I'm wondering whether 512GB pages will be called 'terapages'. ;-)

Forgot replying to this one.

With my understanding, MM usually don't name large page of different
size a specific name, just call them hugepage + size, e.g 2M huge page,
or 1G huge page. Sometime when we build mapping for them, we will call
them PMD hugepage or PUD hugepage.

I remember in x86 ARCH direct mapping is built with invocation of
init_mem_mapping(), and the mapping to 2M or 1G directly is called
large page mapping or PMD/PUD huge page mapping. They are similar.

Hope other MM people can correct me if I am wrong.

