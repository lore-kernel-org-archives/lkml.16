Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9D22CBFE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844135; cv=none; b=hwT3ls92TyfhQpXpSaiUSs9Pmk5Sx2YPc3M+YCVUQVWMPmSS7p2ADDCpEm1GLb8BVf74vOD6PgNSre/Oug4av9NTAU3hFYmZo5C/Frtsh66GeouSZFDPNf5NHoDveFvftS2M8CA+AqhuNHKpwyNr/sKGmhDjohKwsKjWnY8IgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844135; c=relaxed/simple;
	bh=V8M5eY61GCMMz3rkfHxM0Lk1h4svb/yBZN9UaaHwtVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZ0Z1pdAJLDsd7VfLM4UKcPdAD0NhnEkOlynlVrwYXnofvnnqrR9kek9Golt5ETzLdnNg80jPLH/+93QuPiyzNni27X+vF7GSZ68v4YofB9td3jNQoEP0JhzNqsJA1ldVgUNejZvBdOWrl2cs4f/44sDIvr7WgTBxUoOe+kDYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5DgDi9Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5DgDi9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738844132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V8M5eY61GCMMz3rkfHxM0Lk1h4svb/yBZN9UaaHwtVs=;
	b=F5DgDi9Q6O1uPeAqLysNC3Rq0vqyh87cap0mm00nlJZL6RwG5cEJoFUIz58A7/tc6OaFYY
	vGs2LR/J8S+/FBQ+PWzREhy2lxgsTUx/rnFBx6l82AREuOv9VsaqULR+HsSynfTCx6rLgj
	eIw+XvOyQ+6v5qxqmv6+SU+7rP/bvc4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-zAkiP20rO6GTfp9wqVNRrw-1; Thu,
 06 Feb 2025 07:15:25 -0500
X-MC-Unique: zAkiP20rO6GTfp9wqVNRrw-1
X-Mimecast-MFC-AGG-ID: zAkiP20rO6GTfp9wqVNRrw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9967D1800373;
	Thu,  6 Feb 2025 12:15:24 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 93B151800570;
	Thu,  6 Feb 2025 12:15:21 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 13:14:58 +0100 (CET)
Date: Thu, 6 Feb 2025 13:14:54 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250206121453.GA5209@redhat.com>
References: <20250205175136.GA8702@redhat.com>
 <20250205175159.GA8714@redhat.com>
 <Z6PjzA61v6s732JF@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6PjzA61v6s732JF@pavilion.home>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/05, Frederic Weisbecker wrote:
>
> Looks good to me, except for this TIF_SIGPENDING removal which I'm less
> sure about, I see a lot of places where it is added/removed. Well it's
> probably only checked locally on entry code. Would it make sense to move
> this chunk to a separate preceding patch?

OK, will do.

Thanks!

Oleg.

