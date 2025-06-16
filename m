Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D422C22AE45
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109983; cv=none; b=fR8BGD+wLiFHmqGspnNNiOI9WddGF0Lb5NeiZWCRCAEbQC/FNCvM9Q4ecboxEbXrtSsoYpL8Ft3c66ca/bakQGR7CpDNWqYB+MLtbJGcmOo12lf3I62CMUig6iUzUQ85/2PPpzUh1x58gGY5ETDHDWl80j3nGeKdfO7rjMqzilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109983; c=relaxed/simple;
	bh=QzEAQtt+aGVKhfuj29JZWjtEC6tULjxy17FvlP6qNUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ft0bZxEQq3g2GmtkwCtJLkxnGoRciU/o5bkAocxaQFGTOuHsXOqzSnz7evsnAfY5ABjs8ScVWxnOFTn/Yvj+IwW4B+4Ik7/bpzEJ70/eZLwpv1SIwXtbVVxZpXOVlXOWbgJ45jtaGZyPAo4N2pdGeDbF8O+UP5/TR+zMypePUao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZCBSAHU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZCBSAHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750109980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=85/1d0wMBmqSkLyQ+YALVO6DwSoPhRMSYMFI4xK3lME=;
	b=ZZCBSAHUPzUUlfDHiu3J6xclHtrNwoLbq4eMdQhqLhSLD/H+5peyD2CWiqNa8SUtC2TS10
	Cw0OSmLJB/a+a1GQCNQYrWGgHKpOJQAFaZ9UMcKYcSJyRBt/TD6w2be7WtjYaq2ZjtfyvI
	toxjw5PKBivpQrq8W2OidB/1dOZpAHc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-pNs-wQ-kNM-C4ozlsqgRlA-1; Mon,
 16 Jun 2025 17:39:37 -0400
X-MC-Unique: pNs-wQ-kNM-C4ozlsqgRlA-1
X-Mimecast-MFC-AGG-ID: pNs-wQ-kNM-C4ozlsqgRlA_1750109976
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B9E51956089;
	Mon, 16 Jun 2025 21:39:36 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24E5C30001B1;
	Mon, 16 Jun 2025 21:39:33 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,  linux-api@vger.kernel.org,
  workflows@vger.kernel.org,  tools@kernel.org
Subject: Re: [RFC 08/19] exec: add API specification for execve
In-Reply-To: <20250614134858.790460-9-sashal@kernel.org> (Sasha Levin's
	message of "Sat, 14 Jun 2025 09:48:47 -0400")
References: <20250614134858.790460-1-sashal@kernel.org>
	<20250614134858.790460-9-sashal@kernel.org>
Date: Mon, 16 Jun 2025 23:39:31 +0200
Message-ID: <87ikkvv018.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

* Sasha Levin:

> +	KAPI_RETURN("long", "Does not return on success; returns -1 on error")
> +		.type = KAPI_TYPE_INT,
> +		.check_type = KAPI_RETURN_ERROR_CHECK,
> +	KAPI_RETURN_END

Is the -1 part correct?

Many later errors during execve are not recoverable and result in execve
succeeding (nominally) and a fatal signal being delivered to the process
instead.  Not sure if the description covers that.

What about the effect of unblocking a parent thread that has vfork'ed?

Thanks,
Florian

