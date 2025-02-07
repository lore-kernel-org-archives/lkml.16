Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D1C1D7E21
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921379; cv=none; b=HQuiYpWD2ABUWJrEAtmJo5XcLCgEBPVMWpcNcm0XdpYyJid6Q81CWCwC0Mytf62BDYTZhG6hrh+LOsMpmEdfLFz/c821PrG1+X4nzF1qHuIEA+YsCyo6hi+p88gVOQ92X31t860G18AqGblRnXPIiohw4UdKWX+SNsTph8rZkqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921379; c=relaxed/simple;
	bh=6uoHY0ASJcAa+0FoFTs2yHCTNuCmEz+NR6nwsNVVugI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N34BmYd4lYPwktCcKVV1bLbimt3wyD7oUa9Z9aoQO0euPmYHxgZbtrMumFHDvT4Mh1ZLvsb8iUyTsTxvghjz01uBkewErKJpYq523VrBnhJ7M4bTm1jWMyDp6ZmXgqXLsC717WLxwI+kTe9cBupFSi+llis0Wc91CUA/+oJCZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QQn00pZE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QQn00pZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738921376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJMs9eHI1p3jh7oPNQ4LZ+vZadu23Vk4jaAwPoDFICE=;
	b=QQn00pZEySo3YOHjN/6/gpkL0s3HOJd6ROwUyOokG6XB1jCSN7+bV73SrJ6PuFfRIQCQrG
	zXzhbxMJd8IZ5zNZfedQ72F4X9ZICndnhP+B5T3dGT2beg05Z2EzmKakhZabZnSgqRxcuI
	megsxXhrKX1AcXJhfSJ7QXYwkFNNqmQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284--kLIjBwTPnum2nKzrVycrw-1; Fri,
 07 Feb 2025 04:42:54 -0500
X-MC-Unique: -kLIjBwTPnum2nKzrVycrw-1
X-Mimecast-MFC-AGG-ID: -kLIjBwTPnum2nKzrVycrw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03446180036F;
	Fri,  7 Feb 2025 09:42:53 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.136])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 38EF4180056F;
	Fri,  7 Feb 2025 09:42:49 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  7 Feb 2025 10:42:26 +0100 (CET)
Date: Fri, 7 Feb 2025 10:42:22 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, ebiederm@xmission.com
Subject: Re: [PATCH v6 0/5] reduce tasklist_lock hold time on exit and do
 some pid cleanup
Message-ID: <20250207094221.GD5112@redhat.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
 <20250207-wettkampf-binden-648f00063d8f@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-wettkampf-binden-648f00063d8f@brauner>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/07, Christian Brauner wrote:
>
> Applied to the kernel-6.15.tasklist_lock branch of the vfs/vfs.git tree.

Great.

Then perhaps you can also take the related

	[PATCH v2 0/2] exit: change the release_task() paths to call flush_sigqueue() lockless
	https://lore.kernel.org/all/20250206152244.GA14609@redhat.com/

changes?

Oleg.

