Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3CDDDC3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744663242; cv=none; b=Buufz4uir2pwG5T/vQrbANckMKonMWd/TfJ8mtq+wLUTD4y4zwl3tIdr6kGp9zE9SAKud/3jvC3dNi2B/lrDoxIaYsOqbNL7Hq63iCcCp7Ow+04qoy5sG9kHgvzHZUXnSNqHQzF0hsp4el6L9PWeEurP2YVE05u+FprLwkIVYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744663242; c=relaxed/simple;
	bh=8monUW/vJ6/0vG0xs8zE7z2VK5nRgnFX8tHR6eBVM4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU2vcdn1rA8dEU9Y2bvteJUdQiPh7pCgjB7wkFf+9ka4cvt2UluD+L1PjvGvXm2OZg4jgxbh96xS7BqhM6SCoANMOitmKcb3FiNvOi7xasxAn/r6zOzD/BRIlwJClu8+2Y+EaniT+vuUjC/Rt9PlwFevNleoQwLtebm9kDoNF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYZYcHMV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYZYcHMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744663239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zYlFFwWJIygfpn5eHvFvQZD02VDNncVIPXeKChWRAmY=;
	b=EYZYcHMViqJNloqMkY9zlVEMSgojL+gJfAKaZVX6xhuLSVgKIIJnR914U3ZX5HViT0t/Xm
	zHKL/cqVi8Xx4eehbc48WM9nHrRFJ5g8vm5jFucEIeozaEkYq4vVcdXt+oQbvNx3NyusPg
	zAP4E8/ddOQVT0PtW26gMv/5XnA1PiM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-To-egiYVPhmpxC19orCRvg-1; Mon,
 14 Apr 2025 16:40:36 -0400
X-MC-Unique: To-egiYVPhmpxC19orCRvg-1
X-Mimecast-MFC-AGG-ID: To-egiYVPhmpxC19orCRvg_1744663235
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EA771801A07;
	Mon, 14 Apr 2025 20:40:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.114])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4231E1955BC1;
	Mon, 14 Apr 2025 20:40:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 14 Apr 2025 22:39:59 +0200 (CEST)
Date: Mon, 14 Apr 2025 22:39:56 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] release_task: kill the no longer needed
 get/put_pid(thread_pid)
Message-ID: <20250414203955.GH28345@redhat.com>
References: <20250411121857.GA10550@redhat.com>
 <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-tintenfleck-planbar-656144f25a3b@brauner>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/14, Christian Brauner wrote:
>
> On Mon, Apr 14, 2025 at 09:39:47PM +0200, Christian Brauner wrote:
> > On Fri, Apr 11, 2025 at 02:18:57PM +0200, Oleg Nesterov wrote:
> > > -	put_pid(thread_pid);
> > > +	/* p->thread_pid can't go away until free_pids() below */
> > > +	proc_flush_pid(p->thread_pid);
> >
> > This cannot work though, right?
> > Because after __unhash_process() p->thread_pid may be NULL:

Oh, indeed! What was I thinking about???

And, as you can guess, I didn't even bother to test this "obvious" cleanup :/

> The task_pid() needs to be moved after the repeat label. I'm appending
> the full patch I applied.

Thanks a lot!

Can you add your Co-developed-by or Fixed-by ?

Oleg.

