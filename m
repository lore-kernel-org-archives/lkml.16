Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40B17583
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640140; cv=none; b=kicskZnIBaamPmbePTOGN2NEujS371Cz5HsSrj5VvAkt73sVzikApVq/JjV9tgCAkxlKXpSFelDi4Kl761j8yqGJ3pwMuxz/4Dymjmktni5uKMrNHMO2Lfw44YvoVTcv3qWmrEpzTy5TzRgmQGpjupmBfMb2y1ltkKLFAP6e4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640140; c=relaxed/simple;
	bh=11tee5UsvnEd55TCLb/uQyNrUWOp6I96sGheUZV8tNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfJWjdoH3mlwaFOLWJj/GVs6iFXg5fV7uTnIDkvhGremAYzKW2aHnhCbXCzM/KC24meZzNCWk6R2tds49E4wvMdFVHKZrgr53QcjgWJryVjjH629lJvn5NwfHMs5kXxUrunuLPlqXDBi/+/Kuz0+z97riu568JpCfC2rliXO0oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHXl1087; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHXl1087"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744640137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u84Ty7HMMCeXsOUPP5hTPV4+DYYz+9u3WtfeTfyLclw=;
	b=JHXl10871aUTceE+6DVCVHp5grnqvJe6lEV8XRBViXu4CVZ6GUPSrLHn+59LrcoBtjxBSr
	zrKQoFFMeaBbja0/4dmaZPJ80m5QoF9Xf5Dy0Gj057jn99YEIwosK9XlB3JdOAwQc3Z/pE
	5iZ6MMJuMwwKtdNgnMlt9D9A29fG0KY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-sBZ09lvgNSq6lij3xWa0FQ-1; Mon,
 14 Apr 2025 10:15:32 -0400
X-MC-Unique: sBZ09lvgNSq6lij3xWa0FQ-1
X-Mimecast-MFC-AGG-ID: sBZ09lvgNSq6lij3xWa0FQ_1744640131
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE1D419560BD;
	Mon, 14 Apr 2025 14:15:30 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7E4D83001D13;
	Mon, 14 Apr 2025 14:15:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 14 Apr 2025 16:14:54 +0200 (CEST)
Date: Mon, 14 Apr 2025 16:14:50 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Luca Boccassi <luca.boccassi@gmail.com>,
	Lennart Poettering <lennart@poettering.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Mike Yuan <me@yhndnzj.com>,
	Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] coredump: hand a pidfd to the usermode coredump
 helper
Message-ID: <20250414141450.GE28345@redhat.com>
References: <20250414-work-coredump-v2-0-685bf231f828@kernel.org>
 <20250414-work-coredump-v2-3-685bf231f828@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-work-coredump-v2-3-685bf231f828@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/14, Christian Brauner wrote:
>
> -static int umh_pipe_setup(struct subprocess_info *info, struct cred *new)
> +static int umh_coredump_setup(struct subprocess_info *info, struct cred *new)
>  {
>  	struct file *files[2];
>  	struct coredump_params *cp = (struct coredump_params *)info->data;
>  	int err;
>
> +	if (cp->pid) {
> +		struct file *pidfs_file __free(fput) = NULL;
> +
> +		pidfs_file = pidfs_alloc_file(cp->pid, 0);
> +		if (IS_ERR(pidfs_file))
> +			return PTR_ERR(pidfs_file);
> +
> +		/*
> +		 * Usermode helpers are childen of either
> +		 * system_unbound_wq or of kthreadd. So we know that
> +		 * we're starting off with a clean file descriptor
> +		 * table. So we should always be able to use
> +		 * COREDUMP_PIDFD_NUMBER as our file descriptor value.
> +		 */
> +		VFS_WARN_ON_ONCE((pidfs_file = fget_raw(COREDUMP_PIDFD_NUMBER)) != NULL);
> +
> +		err = replace_fd(COREDUMP_PIDFD_NUMBER, pidfs_file, 0);
> +		if (err < 0)
> +			return err;

Yes, but if replace_fd() succeeds we need to nullify pidfs_file
to avoid fput from __free(fput) ?

And I think in this case __free(fput) doesn't buy too much, but
up to you.

Oleg.

