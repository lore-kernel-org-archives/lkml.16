Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F51E0DE4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785394; cv=none; b=i5Vp+cqeo0luRhcP3VTeJDV+OIF9PWYiWwb3IztH4rTCELJjtWYp9zWvx3UFAHxQ0VqLsm6uvf0jtgjAxBO0j7ERGRe6tqadimNkHm7Ey9JCgpFRavw3olDihwVgBIErvOEJIrNoH13/lMHJz6BUO5Vc/fwixLP54TaYO/zyT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785394; c=relaxed/simple;
	bh=qSe70elBh/13kW6hu3QOvB6hNIyzSvJPE2KZykNN5Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBS2IYLaYvUo934pxDyPJEAqQDksdq8jA5xCpPB/7enM4KzAjbtrf7TJkfEJFp7xcIzhKTMOLE8n/VVFFP1xpLpKBgX7pZ6QGjG4WapANbS+QQoOSlW3MB53FwK/DkLRGCqSAy5Ip13enfxzK6s2lX86Iw90NDCXJEykWGMoPOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZFUwd5Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZFUwd5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738785392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSe70elBh/13kW6hu3QOvB6hNIyzSvJPE2KZykNN5Tc=;
	b=fZFUwd5YctIDc3YNlobrn+T4vLdsfFffjTpx8YE+kOF12otvow4cgfMTzk1tlhHEULW3Ut
	kv1iAORNDrjhLygBkP2xmfeSIOjpC93hjmA4xdhNeSXJxJffsNBwEDMw8FLQBA2Z66n/Fv
	H2NbWUKr/rdj/csYFi4rlH7eaPfXRgo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-9O8dmbIyMLmmYY2tg6EsrA-1; Wed,
 05 Feb 2025 14:56:28 -0500
X-MC-Unique: 9O8dmbIyMLmmYY2tg6EsrA-1
X-Mimecast-MFC-AGG-ID: 9O8dmbIyMLmmYY2tg6EsrA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C30BD195608E;
	Wed,  5 Feb 2025 19:56:26 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id DE1841800570;
	Wed,  5 Feb 2025 19:56:23 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 20:56:00 +0100 (CET)
Date: Wed, 5 Feb 2025 20:55:56 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] exit: perform add_device_randomness() without
 tasklist_lock
Message-ID: <20250205195555.GB8754@redhat.com>
References: <20250205193221.402150-1-mjguzik@gmail.com>
 <20250205193221.402150-2-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205193221.402150-2-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/05, Mateusz Guzik wrote:
>
> diff --git a/scripts/selinux/genheaders/genheaders b/scripts/selinux/genheaders/genheaders
> deleted file mode 100755
> index 3fc32a664a7930b12a38d02449aec78d49690dfe..0000000000000000000000000000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 90112
> zcmeI54VYWidFQXqM}!HsAV3BA;1X~VGz`MnRD8IRv5n=#7zLYDVcSUZjK)$tBMC`k
...

Hmm? ;)

Other than that looks great.

And since you removed the tty unref patch, this series no longer conflicts
with "exit: change the release_task() paths to call flush_sigqueue() lockless"
https://lore.kernel.org/all/20250205175159.GA8714@redhat.com/ I've sent for
review.

Hopefully we will add your "unref" patch later.

Oleg.

