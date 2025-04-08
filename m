Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77E222589
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101997; cv=none; b=JCnnW9WwJ5XtxvkLqhldoZ1fhNygPdOm4yv7SehmHjxzf/pZrZlHwNCO1YgQKIcIjdPyPnXsTH77afSqzTrNAhQX441anl6jsQJ+gGWKGifMzTm02U6dkrmMarC78E+jeoHcmE6Uj4kaLs8yxX4120QhfNQtxyD3lWX3Bk2R2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101997; c=relaxed/simple;
	bh=JDFi5xFsBz88JfWO31Qy+rdA+ke9e+wOn+4siZWNlEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ4wWrPrTjPzINJrRma6k1EPV1nbIySMRYSc5l0ElgMvmHa85S7JdYhEW9rBKaNxXKCtZfEjAHsfkas8qg/Gkl2xpqhZnOulBrh6l/UyqMSMiPq8S63/i6Veq1+ULRkqFBc64S8LqXyxh+jStI7mb6x7n/ZJUNCECOIKKHk0/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNfDsLg7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNfDsLg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TG5DMStY3ZVURXCJczyNhF/JQw67BLGSt3SBnSQ+h7E=;
	b=WNfDsLg7fK+h+pasbtNgYL61Jyx9iS6Kg6FfhS9F5zfHhc48TgH2568zzTJTuhP6hswN3f
	uMyeQgGIbmoJViKR8m3ZZTuJaUw2wFUrsXmFWfvC+CdRbUQuf6WJ2qQ1z2mOOWCWxSrtu6
	Sm3My+sNFdNfTb6CTsRz89656js2wZI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-o7R7vcNUOIWYCKBAwq3gyA-1; Tue,
 08 Apr 2025 04:46:31 -0400
X-MC-Unique: o7R7vcNUOIWYCKBAwq3gyA-1
X-Mimecast-MFC-AGG-ID: o7R7vcNUOIWYCKBAwq3gyA_1744101989
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E29661955DDE;
	Tue,  8 Apr 2025 08:46:28 +0000 (UTC)
Received: from ws.net.home (unknown [10.45.224.198])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93E3D180B48E;
	Tue,  8 Apr 2025 08:46:25 +0000 (UTC)
Date: Tue, 8 Apr 2025 10:46:22 +0200
From: Karel Zak <kzak@redhat.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, 
	chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com, 
	dhavale@google.com, linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
Subject: Re: [PATCH v3 2/2] erofs: add 'offset' mount option for file-backed
 & bdev-based mounts
Message-ID: <gk7jzl7pktrdpznqp2hiuflx56xyttw4v4z3epia2ziw4oz547@cft7fyeoirfr>
References: <20250407110551.1538457-1-shengyong1@xiaomi.com>
 <20250407110551.1538457-2-shengyong1@xiaomi.com>
 <7nupludayogog6jylmwnxwel4zlvfxeozzcg5qkf5g5a5fpt7g@3bgvpbqfuxxa>
 <d4eae031-8fbb-45e2-bdf4-f3a8a034b8ad@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4eae031-8fbb-45e2-bdf4-f3a8a034b8ad@linux.alibaba.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Mon, Apr 07, 2025 at 11:49:31PM +0800, Gao Xiang wrote:
> On 2025/4/7 19:40, Karel Zak wrote:
> > We can improve it in libmount and add any if-erofs hack there, but my
> > suggestion is to select a better name for the mount option. For
> > example, erofsoff=, erostart=, fsoffset=, start=, or similar.
> 
> Thanks for your suggestion!
> 
> it's somewhat weird to use erofsprefix here, I think fsoffset
> may be fine.

Yes, fsoffset sounds good. I anticipate more filesystems will support
file-backed mounts in the future, making this option reusable.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com

