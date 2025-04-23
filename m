Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DC1A3BC0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416323; cv=none; b=N+BobWCpSvCGS0X53vlAFAS75TT5Nbney2r8rCHnpa+9AGRngTYbrQ/fNPeioUlaH4ftKhp594/BlOOddTtuhZ8o8hAN3yI9t7oq5Ps0LbW5JFhU+2Jj9BOkYx66yA49UV4LOttBqabZVvqNsA4aVhZZQsy0tcE3LQkU36Pi4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416323; c=relaxed/simple;
	bh=boejw82YmVPmF4mgle0bH0wKQDPl4g64+MKKm8rGiQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPIug87dvBaumEx3I/B7pe7I8NWQIiCCAx/HcdNT1kKgH9cy094h6/NdNmDjwMY28QwZ+zp+AKsXy3TWQDBOsS/02gmVh2yZf0j9zR5Fpo3Umf2o+5zkrUHvwtDozsnHykz0Crr0V4PAUxIlFwslaG6SjZFflXpfwM/UYYcoB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y900fPxM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y900fPxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745416320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JcyI5UKjzArJKSlp5THkkUg4bu6nY4lIrKxS+KDjnZA=;
	b=Y900fPxMR4m/Kf6iaEk8g4vWq9ZIIR+0PEuMBXZvkuucw2zIjGjF6MuTKHIyu02tVCUKf9
	7fkT457WBCS2Rj6wwpNdpR1k6G4kj8j1+xwYPGDY4PMD003vR3g70UEc7PwABGijFDGs+5
	UYDcDQshbK11p8IdOhe+8qkfoJtBsSo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-W1-RTodeM1KkDSb2LmzVww-1; Wed,
 23 Apr 2025 09:51:55 -0400
X-MC-Unique: W1-RTodeM1KkDSb2LmzVww-1
X-Mimecast-MFC-AGG-ID: W1-RTodeM1KkDSb2LmzVww_1745416310
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BADAE1801A18;
	Wed, 23 Apr 2025 13:51:49 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.39])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 26B5B19560A3;
	Wed, 23 Apr 2025 13:51:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 23 Apr 2025 15:51:11 +0200 (CEST)
Date: Wed, 23 Apr 2025 15:51:02 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
	syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Joel Granados <joel.granados@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <20250423135101.GA28646@redhat.com>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423115542.7081-1-jiayuan.chen@linux.dev>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 04/23, Jiayuan Chen wrote:
>
> Suppress syzbot reports by annotating these accesses using
> READ_ONCE() / WRITE_ONCE().
...
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
>  	for (i = 0; i <= pid->level; i++) {
>  		struct upid *upid = pid->numbers + i;
>  		struct pid_namespace *ns = upid->ns;
> -		switch (--ns->pid_allocated) {
> +		WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) - 1);
> +		switch (READ_ONCE(ns->pid_allocated)) {

I keep forgetting how kcsan works, but we don't need
READ_ONCE(ns->pid_allocated) under pidmap_lock?

Same for other functions which read/modify ->pid_allocated with
this lock held.

Oleg.

