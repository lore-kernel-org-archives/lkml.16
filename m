Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0941FE457
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787415; cv=none; b=WqfSaTWz92iRXrEIYu7ID15iUWPl5mAQLzSnFUF0j7svxjDcyMt0xhcb7YSNo/aGfX5wrTdDpJTioX4sIKsQv4cleL2zQaluiWQqYqzWKzQGmlXBCIg55Z/8ANYGmwCLOKJY1iMrIEa7l7o9u671zVWa71yz5VqVwUbQmnolx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787415; c=relaxed/simple;
	bh=NdXByOw++tUj16htVWs5qKL2mD1ia+wtCOD66bxanh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnzRHSVSMqOoeXXx1kCYP4jnS6nLz+LwUBBEwYssZ3BqamCsU4N+n283Sq33O7FGCrZB4rM8yraialo9ky7WsZ2Jaxeuzc9xMNehrlFuBl0pu/1luapXbs1TtLRrfjk8WMjVj7guB7UGYAYoYIQBwIYBMbU/8hea7n0kgYRUAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTG0WPde; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTG0WPde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738787412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdXByOw++tUj16htVWs5qKL2mD1ia+wtCOD66bxanh0=;
	b=LTG0WPde1QdVisky4iyntUPAbL9FNS3Rqgoj5oxGFByLEI2c4zwCJ0h7mJDlXjliehn6Bp
	m6mKbTqzWkNUBTBInv8znLFtSHzPzJwipQThbbscPmL+J//gMz+26R8aLdDlqpHZNFAV26
	G9d84i6BhZhcD6wi+dqaTu8ii4iDG1g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-TN79l0uXOImteeJ1_F9mMg-1; Wed,
 05 Feb 2025 15:30:11 -0500
X-MC-Unique: TN79l0uXOImteeJ1_F9mMg-1
X-Mimecast-MFC-AGG-ID: TN79l0uXOImteeJ1_F9mMg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64D221955F28;
	Wed,  5 Feb 2025 20:30:09 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 682D319560AE;
	Wed,  5 Feb 2025 20:30:06 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 21:29:42 +0100 (CET)
Date: Wed, 5 Feb 2025 21:29:38 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] reduce tasklist_lock hold time on exit and do
 some pid cleanup
Message-ID: <20250205202937.GC8754@redhat.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205200929.406568-1-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02/05, Mateusz Guzik wrote:
>
> Whacking this for both add_device_randomness and pids allocation gives
> me a 15% speed up for thread creation/destruction in a 24-core vm.

Nice. The whole series look good to me.

Oleg.

