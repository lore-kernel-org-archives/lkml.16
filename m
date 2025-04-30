Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C58615A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012086; cv=none; b=sRMcSDX9KCuDJkAxFpmPTGj1GwSFqGTmUtE8kl7qwocg02YvHkzt+ZAPwTrCKWfmDUUNuJll4xkDKzqykwX9wFqeCCWISQAjPoP5lUwdrWFoTm5mX6sq8VuoHf4/WIuUdmyVYyKX3j7pdgHD9E2wnhv6xvjtfHmXQr49+N68YVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012086; c=relaxed/simple;
	bh=3fBuGco0DYZEyfOgnRGKqO6qa1jOB0e9yN/ZKPqb3Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLjAk44acO8gOLQ96TKtb3UTwkSK0Rha5TGWDgZ84JcGVsfvgYYXX33zcA8kNxSpAKVduSHlLl0aniMw8vAMprGepzfITRUyNm0xpG16d4FNXzKdFqzwjSKoyMGhMStdfoMTmmmo+AwAlJRAWHXesn5GUeWjFb6jAv8bMDGeNfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRdbT+HS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRdbT+HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746012083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0MWOVlw8yXgGQEAuqAramYrkhiU3w78/ZBvJcmOufOI=;
	b=dRdbT+HS/vmGndo/B3s0CJr615fMzLPeaLVAQITmlcqhFgxpxNKPd9lmXUBOQG1x20KU2K
	kTLy2ma6brEHdOJiFcRYMG6CkN3/wTfLn4kd+HcaK3mBkfOxpeZLkb7J2rNnYJ1hvAUxX5
	SEuvR1RgwER3DLdYIYGAYqfmmHRbG9o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-fJyj-U7nPbGCgPFwYxCocw-1; Wed,
 30 Apr 2025 07:21:17 -0400
X-MC-Unique: fJyj-U7nPbGCgPFwYxCocw-1
X-Mimecast-MFC-AGG-ID: fJyj-U7nPbGCgPFwYxCocw_1746012076
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6257C1800876;
	Wed, 30 Apr 2025 11:21:16 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.23])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3D32A1956094;
	Wed, 30 Apr 2025 11:21:13 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 30 Apr 2025 13:20:36 +0200 (CEST)
Date: Wed, 30 Apr 2025 13:20:33 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: CVE-2025-22029: exec: fix the racy usage of fs_struct->in_exec
Message-ID: <20250430112033.GA9277@redhat.com>
References: <2025041655-CVE-2025-22029-349f@gregkh>
 <aBH93qMAhgMEGDAY@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBH93qMAhgMEGDAY@tiehlicka>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/30, Michal Hocko wrote:
>
> Based on a follow up update from Oleg[1] I would like to dispute this
> CVE.

Agreed. Let me quote my reply to my "fix", see
https://lore.kernel.org/all/20250429154944.GA18907@redhat.com/

	Damn, I am stupid.

	On 03/24, Oleg Nesterov wrote:
	>
	> check_unsafe_exec() sets fs->in_exec under cred_guard_mutex, then execve()
	> paths clear fs->in_exec lockless. This is fine if exec succeeds, but if it
	> fails we have the following race:
	>
	> 	T1 sets fs->in_exec = 1, fails, drops cred_guard_mutex
	>
	> 	T2 sets fs->in_exec = 1
	>
	> 	T1 clears fs->in_exec

	When I look at this code again, I think this race was not possible and thus
	this patch (applied as af7bb0d2ca45) was not needed.

	Yes, begin_new_exec() can drop cred_guard_mutex on failure, but only after
	de_thread() succeeds, when we can't race with another sub-thread.

	I hope this patch didn't make the things worse so we don't need to revert it.
	Plus I think it makes this (confusing) logic a bit more clear. Just, unless
	I am confused again, it wasn't really needed.

Sorry for the confusion caused by my patch :/

Oleg.

