Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899DC2FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191693; cv=none; b=NxSongsF/li29+M3/tNcpuiaC8Hw9Rh6V2/Q5TgMcjx6oRgzIdEnaOAgwtCetgFbD0ZNCaRq7Z0p2UPdKV9lsJuo+uaNVObHR1bbSwhPojTKJvnv6CFSK1MB0AMIjDEMlWpw5dFfCGUUJdKX07D7VVId452ol7xXlZKGDR5IyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191693; c=relaxed/simple;
	bh=9vAp+T7l2ePNG33R2JBJmFLsSEGEM6x+1tAkG32lHv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6jI2f4BvJcSd4ebZQb/pkhMmzpCrLkNsdpZH5qCvHdJdvpGwqGthLQaLKcLG6k86DRQ/riej2u9gcttW+Xjama+OJTbYDIeWfXrPK2Q3RG3BeSMzOFW6FjuLOrP28M4qeCO2IRNxZjLMYWlQPjgdQRlmxq8eg44oudw6OFoSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B28HtoUJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B28HtoUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739191690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9vAp+T7l2ePNG33R2JBJmFLsSEGEM6x+1tAkG32lHv0=;
	b=B28HtoUJFqRBTzrugqdr65+jP6dqV/rojsb7g0Cb5aJ4hXGdgSaXReEI/olIiCXs2YGqxn
	cM1JEdQ2LrrjgVtT5PVfgFLHPStEAwvolo9iqQIzR8rB8Y2LIz+Jbiy5477qRiq2EYeTcN
	gM5Y6V0CxLMmp+5VdH7tzxVvpENNr/8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-njDtSGV6Nv6HdXJSCHzyhw-1; Mon,
 10 Feb 2025 07:48:06 -0500
X-MC-Unique: njDtSGV6Nv6HdXJSCHzyhw-1
X-Mimecast-MFC-AGG-ID: njDtSGV6Nv6HdXJSCHzyhw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A9081955D82;
	Mon, 10 Feb 2025 12:48:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.113])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1B80318004A7;
	Mon, 10 Feb 2025 12:48:00 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 10 Feb 2025 13:47:38 +0100 (CET)
Date: Mon, 10 Feb 2025 13:47:33 +0100
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
Subject: Re: [PATCH 2/6 v2] sched/fair: Use task_work_queued() on numa_work
Message-ID: <20250210124733.GE32480@redhat.com>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250209223005.11519-3-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209223005.11519-3-frederic@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/09, Frederic Weisbecker wrote:
>
> Remove the ad-hoc implementation of task_work_queued().
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

