Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980C23506D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374850; cv=none; b=hoxmDa5QYNz3bdJOHTPu+O8FugaBNIaqsjzMaLTBkjQn6ldtaAGpyBpI/LtuPOzmEYgp84VhQoW2xUWwyEjZWeuequsKcMHtIonhnzKAP62+d+OLzKQUYYzedNBb1CYPPeAfkECioDRShwzW3LWbP4XNtySdVrKb5aJQBJMJrpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374850; c=relaxed/simple;
	bh=tojSLkueuMIAYTfIF9ThSCMkKaKojLh5KBr6qdpVW34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6wyr2SyUForUq/61yY0hg0zebd8L3F7RfQoC7V7AwIIzqsjtQekRB3uZJXAyFPvcok64xL4IBhcJLhOIoAj/Ca+EbbALe8xRNen79rn0DhyLt/ei35A6ZRNVhtfMyvlsodN4FLHS/DRcV0rNe0hCm0dOUjiohfvAJ46peuV7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GwwCUyHS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GwwCUyHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751374847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nAKPUbUuhfagKyENWNOC8Nd7Yhg3Q8NRPF8JMa4KCks=;
	b=GwwCUyHSKS63IDlea5tvOwhdJYCK1p+Fw3RyXZ1NmdEOG/KLE5qX8mJ2J2YkIQpV+baZHi
	RfGwD9/ExIqBw/VIFdHNAu7tyGkz7yQBl1weV4bHL8BY2smR2ak2sbAequZVPR7ZUGLyfl
	sfxrRlx0BBqA9yiEEszjmj5kmFzChtw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-qj5edy0eNF2fp65gigjeuA-1; Tue,
 01 Jul 2025 09:00:38 -0400
X-MC-Unique: qj5edy0eNF2fp65gigjeuA-1
X-Mimecast-MFC-AGG-ID: qj5edy0eNF2fp65gigjeuA_1751374833
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEF5B1955EC1;
	Tue,  1 Jul 2025 13:00:32 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.44.33.115])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB0A7180045C;
	Tue,  1 Jul 2025 13:00:28 +0000 (UTC)
Date: Tue, 1 Jul 2025 09:00:22 -0400
From: Phil Auld <pauld@redhat.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/sched_ext: Fix exit selftest hang on UP
Message-ID: <20250701130022.GA26180@pauld.westford.csb>
References: <20250701060845.134026-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701060845.134026-1-arighi@nvidia.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Tue, Jul 01, 2025 at 08:08:45AM +0200 Andrea Righi wrote:
> On single-CPU systems, ops.select_cpu() is never called, causing the
> EXIT_SELECT_CPU test case to wait indefinitely.
> 
> Avoid the stall by skipping this specific sub-test when only one CPU is
> available.
> 
> Reported-by: Phil Auld <pauld@redhat.com>
> Fixes: a5db7817af780 ("sched_ext: Add selftests")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>


Thanks Andrea! You beat me to it. I didn't know that libbpf
call existed :)

Reviewed-by: Phil Auld <pauld@redhat.com>

and

Tested-by: Phil Auld <pauld@redhat.com>


Cheers,
Phil

> ---
>  tools/testing/selftests/sched_ext/exit.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/sched_ext/exit.c b/tools/testing/selftests/sched_ext/exit.c
> index 9451782689de1..ee25824b1cbe6 100644
> --- a/tools/testing/selftests/sched_ext/exit.c
> +++ b/tools/testing/selftests/sched_ext/exit.c
> @@ -22,6 +22,14 @@ static enum scx_test_status run(void *ctx)
>  		struct bpf_link *link;
>  		char buf[16];
>  
> +		/*
> +		 * On single-CPU systems, ops.select_cpu() is never
> +		 * invoked, so skip this test to avoid getting stuck
> +		 * indefinitely.
> +		 */
> +		if (tc == EXIT_SELECT_CPU && libbpf_num_possible_cpus() == 1)
> +			continue;
> +
>  		skel = exit__open();
>  		SCX_ENUM_INIT(skel);
>  		skel->rodata->exit_point = tc;
> -- 
> 2.50.0
> 

-- 

