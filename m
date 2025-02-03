Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A820459B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606022; cv=none; b=bnmxNtw1/EqomvDoQFL/uRJ1b51oc3OmGvngSMtkiIwqjTmdNdZuZ3D8yOJ1l4Y4bAPMbOcAvoqkCaiSI5/CTp474CH7VnUI7OoNMsbzMbd+aOsr1Y5Y5rc88ZpJMZ3XRPFjB7sQAWoGPm/vY6iw44AWq+dVzYTiTAsKJNCzlRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606022; c=relaxed/simple;
	bh=ni84vdJJa665KA9CYEBgLFfZrmY0aejDbnjg3hVXaRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBYb5raOTSYQdbKemPizwCrSvPVss4v5XkK5z0y/qZ4EAfbrLehepjkiyiKR4G6aJ0RtTM/snlFXSVsQZ2BPLNh63xR90hz2PW/AVawS0u7Z3hXka2b9T3qr3VTTEJvl6ExHla7YdriLAsXeZhBuJ/5NOTjANfzVWcPRk3uY+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PV1r6T4Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PV1r6T4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738606019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoR1erBVMX8VBp6WUmDQP6ZxA7W4c1/eAF6F57NZd2A=;
	b=PV1r6T4Q/IoIKWEyCefIED1N9gjhX4gVn87wfzesIZImj6FNnNxhwc4de8GVn4RZS2dB3v
	/O1GZ4QuQe1AtS3Hw+V27ufd8Q0EMEJA2fGQ/A/LXVAYZG6xFOyh/NLFLkKoroxezLtbjn
	VmyCEorCsvnk982z+k64xwAXDf+gxSQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-287-u33-V2S4Mr6gz2nWm72n5Q-1; Mon,
 03 Feb 2025 13:06:56 -0500
X-MC-Unique: u33-V2S4Mr6gz2nWm72n5Q-1
X-Mimecast-MFC-AGG-ID: u33-V2S4Mr6gz2nWm72n5Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBB0619560B4;
	Mon,  3 Feb 2025 18:06:53 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 328DF19560AD;
	Mon,  3 Feb 2025 18:06:50 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  3 Feb 2025 19:06:27 +0100 (CET)
Date: Mon, 3 Feb 2025 19:06:24 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] exit: postpone tty_kref_put() until after
 tasklist_lock is dropped
Message-ID: <20250203180623.GC1003@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-4-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-4-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 02/01, Mateusz Guzik wrote:
>
> Instead of smuggling the tty pointer directly, use a struct so that more
> things can be added later.

I am not sure this particular change worth the effort, but I won't argue.
I'd like to know what Eric thinks.




OTOH, if we do this, then perhaps we can do more "call tty_kref_put()
lockless" changes later. And perhaps even add the new

	void tty_kref_put_sync(struct tty_struct *tty)
	{
		if (tty)
			kref_put(&tty->kref, release_one_tty);
	}

helper. With this change release_task() doesn't need to abuse
schedule_work(), and this helper can have more users.

Nevermind, this is almost off-topic.

Oleg.

