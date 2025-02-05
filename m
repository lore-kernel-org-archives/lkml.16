Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA7211A11
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738789054; cv=none; b=Aig/vt/jwEkHMjAXfuNUPYBH1e5LGKI6EKbhzSOnxMsAhcZnTrtoooff/+TCTaeY9ysr2S2ntU+vgXq3t6mwKQdsYfdfuv+ywWH45c6fvHCvPwcnVbMIz4BpEnse2ITr293V+J3Ys4EKd0U3OukGzYXbCOZiVao0/w1qwBTTYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738789054; c=relaxed/simple;
	bh=xrnlSuaMOLmcGjUG19AHlRrrx97ERKbDGBtt6BqsyBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFi1IIZTM+yy4lIpTJzxKTgUEb6Ei1aJ6YGdd1oe+LYgoJuOXAZRcaWOF9OJmrhtJS6X1vYVJotv6A79CXJc91uh21LUaIUx/OHueAbyaQlU7to/crviQjy3qcwq1U6DtpL0ZZNMHC8nrnbc975VBMj6tzfS8G4Vj31GmjyjwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8ykLdnP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8ykLdnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738789049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XtyPT3Ya4wbpniWLKwUkiZca6R2spTBS6GUr4+S9pCM=;
	b=c8ykLdnPtlP1Q647dwNt5R0E/t/zmI1dDRMj43Tv+Dwyr7aq++2HndBl0V3t38YJvbg93R
	3iFALjyDw/vzMACuZVMyrACx5G6U4n8PJ+PbSv1+JdQ+UwMDtw2aDdyDryXsNvxjqQdWk9
	rdXTEjv1dG5JNezfqrzGfUhKCCmRLvU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-rLwk5WnTOWq4dRoYnN1h0Q-1; Wed,
 05 Feb 2025 15:57:28 -0500
X-MC-Unique: rLwk5WnTOWq4dRoYnN1h0Q-1
X-Mimecast-MFC-AGG-ID: rLwk5WnTOWq4dRoYnN1h0Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC0D8195608C;
	Wed,  5 Feb 2025 20:57:26 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id DC4DF1955BCB;
	Wed,  5 Feb 2025 20:57:23 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 21:57:00 +0100 (CET)
Date: Wed, 5 Feb 2025 21:56:56 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] exit: perform add_device_randomness() without
 tasklist_lock
Message-ID: <20250205205655.GD8754@redhat.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
 <20250205200929.406568-2-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205200929.406568-2-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/05, Mateusz Guzik wrote:
>
> Parallel calls to add_device_randomness() contend on their own.
...
> +	add_device_randomness(&p->se.sum_exec_runtime,
> +			      sizeof(p->se.sum_exec_runtime));

OK, but

> +	free_pids(post.pids);

wait... free_pids() comes later in 4/5 ?

Oleg.

