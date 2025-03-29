Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F2C8F77
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207839; cv=none; b=pG7mr5E9YahVxGpBtTfBCVsr3Qg+eKep6RHmeguesw7Hkj00mUpcXmljEelBZM13w/eQHfRsxw9puWDolRBM/OQinZRd2/rJWwwdYw+PXaaW/hx/6/nZwMh18L8PV85TRn2khSRdaLBfDl9lIqbic0pq4hTiFpqAUDTAgAlSuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207839; c=relaxed/simple;
	bh=UECu//+VWUMmnCEwZzJx0TsopvVjdWztDlYD+5lA2rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdD1NCKlkBK1HhyLilKZ/nMPFG3Ks7kBR1ACzSGLnz5n03CeRdYylnoGFwdWpVYW1vAuD5xH6djVckdwO8llU98BHKC7WSDL+DZuUoNuPjGJ+mH6H0GRe5dbT6NYCUYy46G0lh1pe4/eTwyskMcO04zvF4L/7+J32D76hhe86DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YfXJvhz8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YfXJvhz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743207836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqbPkqJGsIrPBZSKSZi8UNCkEieD/Jb18r2Jr9S5aHk=;
	b=YfXJvhz8rzpjMengi5oPCV6M+qak8vnkDDqsmhuY7vQp205iTNo+lNEJiJI56gCDycJeoT
	jmnnnb5/aXqU7DVolCP3I3EzGsdFa7pK0oX2I3pioXNyioc21mFrVByu5SAw1Et47ziWMD
	fOcL3kv0XJGsqE/0NSx/vZUAuQpju1w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-HW55q4EfP6mm7O773Ew4UA-1; Fri,
 28 Mar 2025 20:23:55 -0400
X-MC-Unique: HW55q4EfP6mm7O773Ew4UA-1
X-Mimecast-MFC-AGG-ID: HW55q4EfP6mm7O773Ew4UA_1743207834
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1453196D2CF;
	Sat, 29 Mar 2025 00:23:53 +0000 (UTC)
Received: from fedora (unknown [10.72.120.3])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79DD71801766;
	Sat, 29 Mar 2025 00:23:49 +0000 (UTC)
Date: Sat, 29 Mar 2025 08:23:43 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Minor ublk optimizations
Message-ID: <Z-c9j7fAJ5Driunn@fedora>
References: <20250328180411.2696494-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328180411.2696494-1-csander@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Fri, Mar 28, 2025 at 12:04:06PM -0600, Caleb Sander Mateos wrote:
> A few cleanups on top of Ming's recent patch set that implemented
> ->queue_rqs() for ublk:
> https://lore.kernel.org/linux-block/20250327095123.179113-1-ming.lei@redhat.com/T/#u
> 
> Caleb Sander Mateos (5):
>   ublk: remove unused cmd argument to ublk_dispatch_req()
>   ublk: skip 1 NULL check in ublk_cmd_list_tw_cb() loop
>   ublk: get ubq from pdu in ublk_cmd_list_tw_cb()
>   ublk: avoid redundant io->cmd in ublk_queue_cmd_list()
>   ublk: store req in ublk_uring_cmd_pdu for ublk_cmd_tw_cb()
> 
>  drivers/block/ublk_drv.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)

All are nice cleanup, and pass builtin ublk selftest.

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

