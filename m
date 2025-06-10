Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAC246BA3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560737; cv=none; b=oVddsC7z8uRkUdXINlKbm5o5AXshzIubxa4yJUo39IbSpLhoqGJbDp5Xo2GlAGkPpYMcZiFDc+LWaAAYEYPe6Wud0mNVt+y5v4KZ32Dl22by/eWtquEwvXQ0RYrwsF18h9df849O2fuCRFFNgPK6ce0k5pNoSFoQ9DQVGqMvf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560737; c=relaxed/simple;
	bh=lefJthe9PtsxJvUeOlm7LLLyUttB9eQ4us0CrZAafB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FE8cH9ydSqTZEf50EHGSaT4zSrIDXYEP6y93MxOhUb5YYXB4pIHeqCvD/6x6PZHFkK5A7nVZXuyKWAY8hwJ4PJUIo3PVAK37K5wvdIC5H2+qgtQ0OpSy2gZ1vh28TVmrwZhDyDr5gJMbFZgEsq7/PJq0WZvWVC7x4sFR9Qus1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CSlzBbxn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CSlzBbxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749560731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mFqyvQEwa97JFt+J+pEOPIDcP9PmBHBqevnVJtEDyJA=;
	b=CSlzBbxnPuPmUNwqmCnnZYNl582C1YMpQdABxzFFPbpAUHu1+dyc1/nb0i9g8WN/bNIR4h
	XgoUIPGzKaPuj3MvGZzRwUVubhSRt5FIbaCx6PIyjZncQV05sbVgYqGEZboWXvNAZBgHgt
	KPjJ7LUDGwcwaZpbUCGR79/qBbSESQA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-dPtf_XGoOoOxz_P9ag0qlg-1; Tue,
 10 Jun 2025 09:05:30 -0400
X-MC-Unique: dPtf_XGoOoOxz_P9ag0qlg-1
X-Mimecast-MFC-AGG-ID: dPtf_XGoOoOxz_P9ag0qlg_1749560728
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1149B195606F;
	Tue, 10 Jun 2025 13:05:28 +0000 (UTC)
Received: from [192.168.37.1] (unknown [10.22.58.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAAB9180045B;
	Tue, 10 Jun 2025 13:05:26 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] nfs: client-side tracepoints for delegations and
 cache coherency
Date: Tue, 10 Jun 2025 09:05:24 -0400
Message-ID: <6575EBD6-AD8E-40DE-8778-E2D38963B9D5@redhat.com>
In-Reply-To: <20250603-nfs-tracepoints-v1-0-d2615f3bbe6c@kernel.org>
References: <20250603-nfs-tracepoints-v1-0-d2615f3bbe6c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 3 Jun 2025, at 7:42, Jeff Layton wrote:

> These are some tracepoints that I rolled a while back when working on
> the client-side pieces of the directory delegation patchset. I think
> that these are useful in their own right, even without dir delegations.
>
> Please consider these for v6.17.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> Jeff Layton (4):
>       nfs: add cache_validity to the nfs_inode_event tracepoints
>       nfs: add a tracepoint to nfs_inode_detach_delegation_locked
>       nfs: new tracepoint in nfs_delegation_need_return
>       nfs: new tracepoint in match_stateid operation

For the series:

Reviewed-by: Benjamin Coddington <bcodding@redhat.com>

Ben

