Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB972135D1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679984; cv=none; b=gPNFR/eAFIRS8fkHeGKfbyjFANlFqXgs9oWzyhkcYJFNJwN4mPrj2xSUVOk2ytQh7fE8Qv3ae8WNmoz8MlxpUJw2V8z0ppaGHUb+iYbD8TDKWxdNgsAWH5of+/7gNJ+Tv0NioRT3xez+7KxX8DptEH3s75u/8hn9nz8CTN00M38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679984; c=relaxed/simple;
	bh=NK6U2eAdcsCFFLkWKaca2nbec36RdO4wjEij8v3CPvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3HQ0ImhfGFIryt6+ZgkKYWD+8vceCJQg3lysp9QJX/fheGupGKByanaGHP/I7WvA1wBzbEj8wP6Tedb+mM0ssGRiWt7rokLCbVYPrCxKbRY7shhBynjOqKPp8F7q/Le13AiNkdGQGGYZpnyRdaYFA3IVU6rU2c31rL0bTuqDlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXPxSULO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXPxSULO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738679980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQWJz8pfF5VlA3eUj44/2CtOhMxwtbJLSsIHRwy6GfU=;
	b=NXPxSULOv4Y/zF4JqKRUHPDxk1rwXa9MwUE40RqTa2287bVX0/94ZnOzhOSSDH9V7RnFk0
	w110N3CvYF758puXuHud4sbBl3MeehNSuxVJ/J0y0jgBgwa7h00sdYOW6AI7JLymYPCq4T
	KRsn6q5hcvShYUCiqLLSgl7G9oCi8Oo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-iVU-Q94ANmmGe9zTuvdGkQ-1; Tue,
 04 Feb 2025 09:39:39 -0500
X-MC-Unique: iVU-Q94ANmmGe9zTuvdGkQ-1
X-Mimecast-MFC-AGG-ID: iVU-Q94ANmmGe9zTuvdGkQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46A971955DD0;
	Tue,  4 Feb 2025 14:39:37 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.214])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A02CF1800358;
	Tue,  4 Feb 2025 14:39:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  4 Feb 2025 15:39:10 +0100 (CET)
Date: Tue, 4 Feb 2025 15:39:05 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pipe: don't update {a,c,m}time for anonymous pipes
Message-ID: <20250204143904.GC6031@redhat.com>
References: <20250204132153.GA20921@redhat.com>
 <CAGudoHGptAB1C+vKpfoYo+S9tU2Ow2LWbQeyHKwBpzy9Xh_b=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGudoHGptAB1C+vKpfoYo+S9tU2Ow2LWbQeyHKwBpzy9Xh_b=w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/04, Mateusz Guzik wrote:
>
> > +       if (ret > 0 && !is_pipe_inode(file_inode(filp))) {
>
> Total nit in case there is a v2:
>
> ret is typically > 0 and most of the time this is going to be an
> anonymous pipe, so I would swap these conditions around.
>
> A not nit is that "is_pipe_inode" is imo misleading -- a named pipe
> inode is also a pipe inode. How about "is_anon_pipe"?

OK, I'll wait for other reviews and send v2 with the changes you suggest.

Oleg.

