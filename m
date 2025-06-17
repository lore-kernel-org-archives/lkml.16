Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70852289824
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148768; cv=none; b=t4K5eevv869xSOtXUFRN9zFqk5QHuL2UwvXDyGnZwxcyXq3Ns6oP7SGHwDFu22SBabS7queklMRfNTzblS5tN+3sSpJEHnf8c8dWgt00nY7KmhngKeTyPol+cJwo3r9pcHRdxXobQpTaRkdYPmDwPbN5pG3/c5/id2rzvMmD5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148768; c=relaxed/simple;
	bh=bHqL4d6hzjGnmPrz4kS7ZtPNmRF8JNeo69rBbGeyYMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqer+a9MIP2+qoeEInOqz7G5ZhhvCfweJnVzZ4kxwmT8ZkC8sRRU0ojdzrc5FCrKgvHx015ioyG4Q7bF3GM++/0N81zGNA1GWppj7u+CnaAjpz/eonOxeCF070DILHjyTvN/VziNIwLSn9lFwjz8xY/XYP2J8B4OGEHvN1yZaRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TnjTnIyu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnjTnIyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750148764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuESWdgQF0sreM50+xMhPqu+zRbHva+ThYdTCQTTky8=;
	b=TnjTnIyuN5ol6Bric5T8IvH6WmHSEuJ5LTbSvHqFUNpbDMwCIp91ZG3MoU4ZWoltLYaT+h
	HtZ4CQIZw016TPM7RUQJkr4bZPw2Axta/7POe/d+mx65MIhk3Wiq835lEcrjpN6zGDB34i
	5hgevjwoAsuMQgN64epWJL17Ws0hEgg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-pQNieNqsM8eGs0Z9CKa3gg-1; Tue,
 17 Jun 2025 04:26:00 -0400
X-MC-Unique: pQNieNqsM8eGs0Z9CKa3gg-1
X-Mimecast-MFC-AGG-ID: pQNieNqsM8eGs0Z9CKa3gg_1750148759
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B6FD91809C8F;
	Tue, 17 Jun 2025 08:25:58 +0000 (UTC)
Received: from localhost (unknown [10.72.112.135])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C95B819560A3;
	Tue, 17 Jun 2025 08:25:56 +0000 (UTC)
Date: Tue, 17 Jun 2025 16:25:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	coxu@redhat.com, piliu@redhat.com, pmenzel@molgen.mpg.de,
	chenste@linux.microsoft.com, kexec@lists.infradead.org
Subject: Re: [PATCH v3] ima: add a knob ima= to allow disabling IMA in kdump
 kernel
Message-ID: <aFEmj7ZuuMgOplZK@MiWiFi-R3L-srv>
References: <20250614022342.5988-1-bhe@redhat.com>
 <ca82fa443365217535aedacbcdf823370f387995.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca82fa443365217535aedacbcdf823370f387995.camel@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 06/16/25 at 10:04am, Mimi Zohar wrote:
> On Sat, 2025-06-14 at 10:23 +0800, Baoquan He wrote:
> > Kdump kernel doesn't need IMA functionality, and enabling IMA will cost
> > extra memory. It would be very helpful to allow IMA to be disabled for
> > kdump kernel.
> > 
> > Hence add a knob ima=on|off here to allow turning IMA off in kdump
> > kernel if needed.
> > 
> > Note that this IMA disabling is limited to kdump kernel, please don't
> > abuse it in other kernel and thus serious consequences are caused.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> > v2->v3:
> > - Remove rdundant word 'only' and rephrase sentences in patch log code
> >   comment, and rephrase patch subject, thanks to Mimi's comments.
> 
> Thanks, Baoquan.  The patch is now queued.

Thanks a lot for your patience, careful reviewing and great suggestions.

