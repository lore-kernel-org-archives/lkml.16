Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC601ACED1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518218; cv=none; b=A/cOHs8IsSwaa/HshgwimVrkfm752XozpPmJ1f3tRC5ZSxvff1eqr6bDNcl+57BQaZnwPiSigdb4xdpueL8+9mGlvOeREJtXqrj2pyCSNPaprh2yJ8yauQnvWHRR/3WqcgWwZRbCuD05WAcYFBoKHDGSzEavXNslb4GkZRZf6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518218; c=relaxed/simple;
	bh=hu3a1NDwSBJV14bzKMWsv59IWewwRS40oOxIx5wjjD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2QUROX7mm6KXiEKDOl9HZIcebK+dGiL8fEElf+wIu4RkBUAr0fxU/Jny3XE1DKYiPm1CnnrEhKHmEY8Ea5XjtguwXO3iAXp+4oOUekyu2p/BNNFvnROR/rMDY98wQSA8kFTFXzOpsihm/1qK+5vsGCEGzfZKTpSuq/JDNcy8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZ0FZ9Dz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZ0FZ9Dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743518215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0nwEbr1i5QCHW7pXFRPuMLsqc1sHlt5ggcgJOehko4=;
	b=NZ0FZ9DzLebolAOynepIxau63BIxf/lwzJEH+EkRdWWrgLKB1JbryCUiXx8VWMJbGVKTrb
	wZu0J9zVmtTJT4aCcXx7Y642Zo8LD2SAfJt8/E2djZcQgDDbwGHnSGaSd2WyEz5nZGNaIG
	l8kisWwhGG1Ax9pmrSYYpTAvSItYARM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-235-sBap7uwiPFaVUbpy8Rd-IA-1; Tue,
 01 Apr 2025 10:36:52 -0400
X-MC-Unique: sBap7uwiPFaVUbpy8Rd-IA-1
X-Mimecast-MFC-AGG-ID: sBap7uwiPFaVUbpy8Rd-IA_1743518211
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 123D71800EC5;
	Tue,  1 Apr 2025 14:36:51 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5A931955BF1;
	Tue,  1 Apr 2025 14:36:49 +0000 (UTC)
Date: Tue, 1 Apr 2025 22:36:44 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
Message-ID: <Z+v5/L+xg8y3cY4K@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-4-bhe@redhat.com>
 <6203a9e6-8dc1-4b36-aa2c-41c29487812c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6203a9e6-8dc1-4b36-aa2c-41c29487812c@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 04/01/25 at 10:14am, David Hildenbrand wrote:
> On 31.03.25 10:13, Baoquan He wrote:
> > Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> > and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> > mmap_lock held anymore. It calls __get_user_pages_locked() which
> > can acquire and drop the mmap_lock internaly.
> 
> s/internaly/internally/
> 
> But your statement is wrong. get_user_pages() must be called with the
> mmap_lock held, because it sets "int locked = 1;" when calling
> __get_user_pages_locked().

You are right. I missed that line. Oscar pointed that out in v1 thread.
I will drop this patch. Thanks.

