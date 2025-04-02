Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C192F4E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 03:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743565202; cv=none; b=Z9oWZZEAfLIZgR97hEj73GEVGDW+/DuOXAyx5S5UZegAo9tjKqY66i9/gKNyX0Ig08ASiznDpYXyf869UJOHO5bFH8dXcyXR0WLK8l9WyHujmodKRkQumpkHiXfjLYyn+U4R3Wt0rQLI1W4KlsGm0IQr61rWmODv+Ecl0o2i/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743565202; c=relaxed/simple;
	bh=IgDWAylhfDvlyWR28lPw8OiYNG7mWWj6BNsjZyM0AqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otttPZUkGo7fy1jic4x2zS1n6RvD4PNsXcKP9cNGhUBYZBqJf74xNrQw/7GfZfHaV29DRs5fGUME+TXBqvC1Wnswkre+zyJkCJamAvo5ZrBpg2oj8lxPa1mpzRyEBu+S9Jw3XlZL1m0ivjmNn1E66ECOqDKG5Uq4pd39sSfzyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GkcV5rDD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GkcV5rDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743565198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+J+xEtJMcJlG1ldYz5T0Nt1741RSZ9+l6RJzgdpSXmw=;
	b=GkcV5rDDKJeItI94qhlaQvHpbYoNfi0hvLkdhQvtuHg6Ql9j1GdzwSrbi7TWcjlTmM/WVK
	zoBfFD2AJ6iQbmnNNyd6Oi+hATewNgJjMBO3s5t6agdKLkhx931dpcrscTV9WSIRqXABky
	I2clJ7gycPeGZj63RFT9VW9fGGqWCzY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-r3AzAC98MI-jAJuxIry70w-1; Tue,
 01 Apr 2025 23:39:57 -0400
X-MC-Unique: r3AzAC98MI-jAJuxIry70w-1
X-Mimecast-MFC-AGG-ID: r3AzAC98MI-jAJuxIry70w_1743565196
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33A541800349;
	Wed,  2 Apr 2025 03:39:56 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4CFD1956094;
	Wed,  2 Apr 2025 03:39:54 +0000 (UTC)
Date: Wed, 2 Apr 2025 11:39:49 +0800
From: Baoquan He <bhe@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 5/7] x86/mm: remove pgd_leaf definition in arch
Message-ID: <Z+yxhf07eaqYsaIl@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-6-bhe@redhat.com>
 <Z-vyGtcrU9Y3n9it@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vyGtcrU9Y3n9it@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/01/25 at 04:03pm, Oscar Salvador wrote:
> On Mon, Mar 31, 2025 at 04:13:25PM +0800, Baoquan He wrote:
> > pgd huge page is not supported yet, let's use the generic definition
> > in linux/pgtable.h.
> > 
> > And also update the BUILD_BUG_ON() checking for pgd_leaf() in
> > pti_user_pagetable_walk_p4d() because pgd_leaf() returns boolean value.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > Cc: x86@kernel.org
> 
> I have been carrying a sort of this patch in my tree as well for quite
> some time now, and I think that Christophe also sent it some time ago,
> so glad someone finally pushed it
> 
> https://patchwork.kernel.org/project/linux-mm/patch/20240704043132.28501-2-osalvador@suse.de/

Oops, I even commented in Christophe's patch thread to ask why the
patchset hasn't been merged yet. Later when I focused on mm/gup.c code
reading, I forgot that posting completely. Hope you don't mind I grab
you and Christophe's credit since Ingo has picked it into x86/tip tree.

[PATCH v3 1/5] arch/x86: Drop own definition of pgd,p4d_leaf

> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

