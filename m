Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A3228E7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191789; cv=none; b=rk63QXQON0+gRBsGkzbrVtD/znPZD2UiUraVgvNr4mE6/y4fT2QV9BhYUCAN1pWiv4VwKCEUGoeOUIxSOcrI92e854c6PfN1A/w3f2vdNqsimQH21unX0t7pSSqFig4xqS9aQuot5Ku8LHyOPcrFVgq3POZZe2E7Co0zhNiMIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191789; c=relaxed/simple;
	bh=mm3obWyuDCB+wssGd+qRZLJJrZmGd/8NDdcvFNEwVv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utHgHYltGIXB3VFNNEEQgPpRZ9QSNLHDa015IpIASbnxw4SsOirEsIwBpT3kh2ysslKv17OalpPD58ANsd/p7fQP0qsBkLCkTpYRO6ZjLi5lKZ5k/bbPXN//vfuMf/qXK7H1SMoXoV45RqBOP5Me17BuxrDQhk3UV2285Ti9Nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnVaQMcq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnVaQMcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739191786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mm3obWyuDCB+wssGd+qRZLJJrZmGd/8NDdcvFNEwVv0=;
	b=cnVaQMcqnYIbZY6r17sCSU2S6fhCXsy6iKQv53l7JHFYzhcjW4lKdBfvW88Ip9rXv996lm
	C0lRy5J6ayV5KMFk7EON9oK+fcbt5ASj+7zg26EPi5VS+Ifiz12op+mrasGBTzNKdc+HMI
	9qoM92uRArTn1AhYgWgF+FkjIDecVnA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-0I_K_MCSMtWPRk9BEmtXtg-1; Mon,
 10 Feb 2025 07:49:43 -0500
X-MC-Unique: 0I_K_MCSMtWPRk9BEmtXtg-1
X-Mimecast-MFC-AGG-ID: 0I_K_MCSMtWPRk9BEmtXtg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F3AB71956086;
	Mon, 10 Feb 2025 12:49:41 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.113])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AD2491956094;
	Mon, 10 Feb 2025 12:49:37 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 10 Feb 2025 13:49:15 +0100 (CET)
Date: Mon, 10 Feb 2025 13:49:10 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org
Subject: Re: [PATCH 3/6 v2] sched: Use task_work_queued() on cid_work
Message-ID: <20250210124909.GF32480@redhat.com>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250209223005.11519-4-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209223005.11519-4-frederic@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02/09, Frederic Weisbecker wrote:
>
> Remove the ad-hoc implementation of task_work_queued()
>
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

