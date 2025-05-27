Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7F1278153
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355849; cv=none; b=nYAhFazaG+/dqj5CylNGOm8Y6QktbVyspUA9kl2XqOlN2XYxGMly2rcDRtNrHCbv3r8aae63hrKWE5Y+9QW9KICcTAS/eCJBw/mNPPtQp50vgrGpo8Qg2Iy3geYkH/TGvaOSoWJrjPJh4feaAXhz98KZum7XwDLO8uyxad+YD0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355849; c=relaxed/simple;
	bh=igjUzzNJelnc5sFix9OSPpxKOxliykWoyTRNX1UpaKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/DaKu5HGexaSwek2lXyYvCbBl+eYGqMoVrHbGmHJxq7JykhW9OPGmCI1xLnhQHIPJFvPpA9uUeDLTfrUZDmJI0AHCp3V6lqACS0LDvxjT2d1dHuwvTMJA90Bcm6sXBHDW331erOc+8obXS3ZqaHHxengBAYIrou5b3rWcn66eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYbjOTat; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYbjOTat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igjUzzNJelnc5sFix9OSPpxKOxliykWoyTRNX1UpaKk=;
	b=hYbjOTat9wew+Fht5QmUugG+0IEBI8Lp9+Qpg9fpx3LQf3nxJ96QLe0SFjlNv1HhWMVyYX
	J794oWnkoZFsXC/ZobWML9ZjKZUC9x22weu7KRyi/pkK2pGDeocm8e+krhK6gDtupVvH3k
	Oy/j+h1eWFOayDdztFX4aBaiTkV4nnw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-5vYREFoXNGa8e79FO1c2UA-1; Tue,
 27 May 2025 10:24:04 -0400
X-MC-Unique: 5vYREFoXNGa8e79FO1c2UA-1
X-Mimecast-MFC-AGG-ID: 5vYREFoXNGa8e79FO1c2UA_1748355843
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B5221800ECC;
	Tue, 27 May 2025 14:24:02 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 196F818003FD;
	Tue, 27 May 2025 14:23:56 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 16:23:21 +0200 (CEST)
Date: Tue, 27 May 2025 16:23:15 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <20250527142314.GA8333@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Well, I leave this to you / Lorenzo / David, but...

On 05/27, Pu Lehui wrote:
>
> Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")

I don't think that commit could cause this problem.

Oleg.

