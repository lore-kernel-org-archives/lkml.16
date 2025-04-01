Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C520766A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521367; cv=none; b=gWu0sWgMbDVdRddzpM/sPX05lOp6ZhYPP1Xqw7hNyTNK+zvv5HPqfkTAVJX+XzM/8vdceVR/UyPAXqISD/d/SmXU3XPU13JH2abysNR8ynZCbalnSfrCLopv8gmRux5PyAKyUtrlrFJxgkNgrScyak2ih3UCoQMlsmRktxyW3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521367; c=relaxed/simple;
	bh=WgqyTXMgG35Tp92YYyVym1soWk0qUGWN1xnQufhY4XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRa071h0utqIVjUHDxhSjjnvltLnAWBNLn0vO79lrayqHXqkCPfpeXYqKK4whC3xM6tmdHA/StSayIpNESa4Deyp/dc+y5Zcpola/IJGkxynI6R7snGJRx0Mf7HSozPHrGAHWzqVqNWMfTr4vIUiKIIkkQEynDKtAI/ZKMqDdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSqm/GGJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dSqm/GGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743521365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HH/4JQ4r4zo0wso3wm4glOAGXjIB2EKvoza2FcZ9PAI=;
	b=dSqm/GGJS6J+6SDvdvh4GykxYLEtx1GNwuuAWY+xaPCfdQfFqgG0qaOp0cOg7rZKiVkda+
	3C97EY60dRCEZzencZiWCHSfCcoU4Dd64y/LJWc7yy62vL8FaY8VBQpaPZlyUTbeY+/np0
	zA8Ad8SDYXaNpmAgnTpKdHJePt3PYTE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-UhwevaWENMCms20j00qm_w-1; Tue,
 01 Apr 2025 11:29:22 -0400
X-MC-Unique: UhwevaWENMCms20j00qm_w-1
X-Mimecast-MFC-AGG-ID: UhwevaWENMCms20j00qm_w_1743521361
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4C471956080;
	Tue,  1 Apr 2025 15:29:20 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D4DF1956094;
	Tue,  1 Apr 2025 15:29:18 +0000 (UTC)
Date: Tue, 1 Apr 2025 23:29:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
Message-ID: <Z+wGSs6xo5Q3CnLF@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-4-bhe@redhat.com>
 <Z-vvdrpr-MnkpH7d@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vvdrpr-MnkpH7d@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/01/25 at 03:51pm, Oscar Salvador wrote:
> On Mon, Mar 31, 2025 at 04:13:23PM +0800, Baoquan He wrote:
> > Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> > and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> > mmap_lock held anymore. It calls __get_user_pages_locked() which
> > can acquire and drop the mmap_lock internaly.
> > 
> > Hence remove the incorrect code comments now.
> 
> Uhm, I think this one should be dropped according to 

Yeah, this v2 series was sent earlier than your comment in v1. Sorry
about the mess.

> 
> https://lore.kernel.org/linux-mm/20250330121718.175815-4-bhe@redhat.com/T/#m1aa161016ab98a6d85bcb657a729e01cb98763ec
> 
> ?
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

