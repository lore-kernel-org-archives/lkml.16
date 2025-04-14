Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272413B5AE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663583; cv=none; b=oqW4WrzhZEMhxu5rpnv3iVdCSPNkYa7au7r/SwSccq8QqRzKBUYFYvLZMBdLBQjA6zRfF/BTDikCQYrH/Gmr/qcpVXoKLTHTm7FdlhAx2bQwZWAS7GHfv9CR20H1DTzFaBtF2fOTE5/JDtGe535frf8zAkPfHSHNQ+CFG+Y4reA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663583; c=relaxed/simple;
	bh=skz1nDNh8L+t+ufUudJz290pg0jqP+iCIKp1OeWwGzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOL3Ao4orqAxFKUOk0wZV7eqVftbh1vDbBg8FTMyXuYLP21VrTLO/X/S6QDRRWqxbvItwSne2eX6g83uSsD1RxYRnuIYgqUpmhIvIHuSPbi2eEtYxCmBjtGSD+pua2Tg9APEoT8TjTYhQYHIF5BgkLmIucVNjMbZpPK084vdCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZWOvMzMz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZWOvMzMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744663579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=skz1nDNh8L+t+ufUudJz290pg0jqP+iCIKp1OeWwGzU=;
	b=ZWOvMzMz65sk7eWj2wvGSXoKCRl/S65bDHnw4lSkjZ6AeW+swv/BblFkPmYvW3DiBbEXvm
	j09z55wg50F9A2h2UfEWl017GV3ynkXN+mBcb3mCfVq+ygFqbPowt4LXq21EXnRoz6OBfC
	PNwFJz/jUMqKpi0DU6LrqAV1mqbMxjo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-356-riRSBcVnOoqV8Lbv7lqtMg-1; Mon,
 14 Apr 2025 16:46:15 -0400
X-MC-Unique: riRSBcVnOoqV8Lbv7lqtMg-1
X-Mimecast-MFC-AGG-ID: riRSBcVnOoqV8Lbv7lqtMg_1744663574
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81273180899B;
	Mon, 14 Apr 2025 20:46:14 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A05EB180B486;
	Mon, 14 Apr 2025 20:46:12 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 14 Apr 2025 22:45:38 +0200 (CEST)
Date: Mon, 14 Apr 2025 22:45:36 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250414204535.GI28345@redhat.com>
References: <20250411121857.GA10550@redhat.com>
 <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner>
 <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/14, Mateusz Guzik wrote:
>
> > The task_pid() needs to be moved after the repeat label. I'm appending
> > the full patch I applied.
>
> oh heh, ack on that

Thanks...

> but while here perhaps a small stylistic cleanup: move
> add_device_randomness before or after proc_flush_pid + free_pids,
> instead of if being in-between

Agreed, I thought about this too from the very beginning.

I'd prefer to move add_device_randomness() after release_thread(),
but perhaps this needs another minor cleanup?

Oleg.

