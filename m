Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0332D339A1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612992; cv=none; b=RwvWkqxxZnONhlRQB8BZC+h2oprUxB9YjsGfCvwZQ5IzkVydQTyEIxIxyb4cl5YlMIyQ9JNxtjHRWgLuirBAr5LBQQp7Z/V9tEXyJl0q30ZVtBGYjYdaHbcLKPTcNKslHwYNKOqtrUJkzbuuzx6+oH9nIZw1FeSIlFL5e+1bZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612992; c=relaxed/simple;
	bh=CK/MKv7rjvdIWFJRpj1ZzWC/UHYYkT90B5IHPvXpe6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbxfqmvLt1tjUNlWFb0GAPIS2GB4AM1ZFrOYet9qC1zx2BoYyYGPnrBOsIycqi6pVwKPxmJky6Sic5Lhd2DIZu2Hc3QAv9K9ybLdL1SZdmDsBT6+UdMNoTGDdTw8FVJ6SfPtJR1r6U4oHSGO5VP44visYJ9cQ6UbEFrhUUMpy9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bCMeqSRo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bCMeqSRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738612989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYdlEIiMuZGB2s7NaGPidtgM+7FBuJkKnef7C2LdTpU=;
	b=bCMeqSRoZXIsLfuLdJ7ZlJrDaDnhwE1BW5/jXuggFaKXuTdpf+iduZDMA5PhyRpTGhp2Wb
	1kDslKpC3XRJMHvSH32UzVjZlaOZJFd8cz4Aw1G9B7zJGaYzb2UCUIyUAK4ts64r4xBVqv
	wu78XIU+Oe7a8jmNghiI+Wet6wUGE/E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-tsUddE3HMUqiq6MKQfSz1w-1; Mon,
 03 Feb 2025 15:03:06 -0500
X-MC-Unique: tsUddE3HMUqiq6MKQfSz1w-1
X-Mimecast-MFC-AGG-ID: tsUddE3HMUqiq6MKQfSz1w
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 603E0180035F;
	Mon,  3 Feb 2025 20:03:04 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 61AD318008C0;
	Mon,  3 Feb 2025 20:03:01 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  3 Feb 2025 21:02:38 +0100 (CET)
Date: Mon, 3 Feb 2025 21:02:34 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] pid: perform free_pid() calls outside of
 tasklist_lock
Message-ID: <20250203200233.GE1003@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-6-mjguzik@gmail.com>
 <20250203184908.GD1003@redhat.com>
 <CAGudoHF5zTjxsCsbVjAHjhtsyRgNWFfbRA4W7TYQY76dDOWSHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHF5zTjxsCsbVjAHjhtsyRgNWFfbRA4W7TYQY76dDOWSHQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/03, Mateusz Guzik wrote:
>
> On Mon, Feb 3, 2025 at 7:49 PM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > To avoid the confusion, my question and a note are absolutely offtopic.
> >
> > On 02/01, Mateusz Guzik wrote:
> > >
> > > @@ -1085,6 +1085,7 @@ SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
> > >  {
> > >       struct task_struct *p;
> > >       struct task_struct *group_leader = current->group_leader;
> > > +     struct pid *pids[PIDTYPE_MAX] = { 0 };
> >
> > Could you remind me why
> >
> >         struct pid *pids[PIDTYPE_MAX] = {};
> >
> > is not right? I seem to knew it some time before, but can't recall...
> >
> 
> as far as I know this is merely a matter of convention, fwiw a naive grep:
> $ git grep '= { }' | wc -l
> 1273
> $ git grep '= { 0 }' | wc -l
> 2031
> $ git grep '= {}' | wc -l
> 5626

OK... but I still have a vague feeling that it was explained somewhere
that '{ 0 }' should be preferred... Nevermind.

> that said i can change it to whatever you see fit

No, please do whatever looks better to you.

Oleg.

