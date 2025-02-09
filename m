Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFF1DEFEA
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124175; cv=none; b=c6bF9IeTNU009mjfy0AfYErdcUNYQa4mVgGWzBbUh4nB5g7iUtpTaLxPmdZQ978ttuQC4LKxw2s1vSmUV224h65UAAmPvRLNtGPQkLkNbHTbGZBWemCxSXQZ64X2DaRF4L5jfYixt4PNyJn6UG+EqWZSbTIEVgu7XkHBr2vQoa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124175; c=relaxed/simple;
	bh=k4dSF+1/8S8QyL/aW0J/1GcegQPTYVVhk6RVsCaWtzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghCVZ88wEQ6w6pJWLgfQAP+4MFrigQ4Ce08sw+ly8UwpJC66qo214Hqahho2uvN74M/khFOauW3bkbGQK7DTt7G+YmYaDLU2/AHRhJfNGWTJO4bHokFg0eexPj2yHDN/cF68pSmptLxj39lVOndffv2lCZLnQjBYbxnIzhXzqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MP7FjHv0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MP7FjHv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739124172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cfvTC66qId/c8WXiJdvmvVhhEh0Ssvdm8E/DMI9uyak=;
	b=MP7FjHv0XIuoM0ZVrRW7U1UMxL1wF2jL+rtbQ/rVDIBzj/y9xGMgayLE82EYdpXVxRG8v1
	aNbLIT9X1eMpdiuTNJz+poHfUJ56vATDqUbw4qVNjinP3gpCh1KzYKqMcvFsB/ZGW4Eyqd
	Z/E9Ml6PYiWt54RKgcUTL2z8cU9yc6Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-CKAa2_oTOd6AMhSjr1fDNA-1; Sun,
 09 Feb 2025 13:02:50 -0500
X-MC-Unique: CKAa2_oTOd6AMhSjr1fDNA-1
X-Mimecast-MFC-AGG-ID: CKAa2_oTOd6AMhSjr1fDNA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B844A1800875;
	Sun,  9 Feb 2025 18:02:47 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.8])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 15B0B180035E;
	Sun,  9 Feb 2025 18:02:42 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun,  9 Feb 2025 19:02:20 +0100 (CET)
Date: Sun, 9 Feb 2025 19:02:14 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized
 buffer
Message-ID: <20250209180214.GA23386@redhat.com>
References: <20250209150718.GA17013@redhat.com>
 <20250209150749.GA16999@redhat.com>
 <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/09, Linus Torvalds wrote:
>
> This patch seems to be the right thing to do and removes the vestiges
> of the old model.

OK, thanks.

> But I don't think you need that pipe_buf_assert_len() thing.

Well, I'd prefer to keep this WARN_ON_ONCE() for some time... If
nobody hits this warning we can kill eat_empty_buffer() and more
hopefully dead checks, for example

	/* zero-length bvecs are not supported, skip them */
	if (!this_len)
		continue;

in iter_file_splice_write().

> And if
> you do, please don't make it a pointless inline helper that only hides
> what it does.

Could you explain what do you think should I do if I keep this check?
make pipe_buf_assert_len() return void? or just replace it with
WARN_ON_ONCE(!buf->len) in its callers?

Oleg.

