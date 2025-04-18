Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDCF2749DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981692; cv=none; b=I7Bo3gLlGw1SpxOJgPhJiIRewFlwWGdG6R9xSlk2QVUDZq//JE146RFKHsFyJGkBCPFayCDM6Z9J5nWb3R4YEabpjIoJvAztyilbhbpnxKYUwuDK4w8dOAnpMPmk3ZV++IEAGqonUy0PWjtKsw4NUFN1EYFD4W63qddyYyE/WwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981692; c=relaxed/simple;
	bh=FPdWUg1fPQV/6dEpNOCETZgdT1z+UP3Z1xA0imj7J/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf6L3eGEeaugq69cYh9Ijtouqp4TOxvz3MvVUvf35YQCjgrkgxrDUQ6K1wZNzFUYabSuvph8Xvq0QbKDfCI7qwPmTiKk9qDMNSJCPr2gLAw/IfZ8zIcFXH5JqDt9axtWEv1vpahxvu6tyYHEPwx3K7YQtW7jZiYPsOgEHPB71n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFwVzxo3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFwVzxo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744981690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b+QNRWScy7VlNTBvv/Zh4APnzyG6J24ppGEfEXO4A/A=;
	b=EFwVzxo3f4bIJFmacwYhT3lQls2eXasmViHLWUwFFz2o2jNMx1iyyKyVAy3N4cyjjEmiXK
	mXSyKmuvi1koNdciOpRpeltgx+knojS+Gsh/GHmlJ+BlJnbwvvD9cBPK4kXwe1/AeHLAZ2
	wPVO8O37/mReL5BTktBpfluUUDpG5bc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-oW3H6YwOPgmS32yPjuGLTQ-1; Fri,
 18 Apr 2025 09:08:06 -0400
X-MC-Unique: oW3H6YwOPgmS32yPjuGLTQ-1
X-Mimecast-MFC-AGG-ID: oW3H6YwOPgmS32yPjuGLTQ_1744981685
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 667DB19560B0;
	Fri, 18 Apr 2025 13:08:05 +0000 (UTC)
Received: from localhost (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FA121800965;
	Fri, 18 Apr 2025 13:08:02 +0000 (UTC)
Date: Fri, 18 Apr 2025 21:07:58 +0800
From: Baoquan He <bhe@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crash: Fix spelling mistake "crahskernel" ->
 "crashkernel"
Message-ID: <aAJOrrRMe7ohIaqj@MiWiFi-R3L-srv>
References: <20250418120331.535086-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418120331.535086-1-colin.i.king@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/18/25 at 01:03pm, Colin Ian King wrote:
> There is a spelling mistake in a pr_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  kernel/crash_reserve.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> index aff7c0fdbefa..acb6bf42e30d 100644
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -131,7 +131,7 @@ static int __init parse_crashkernel_mem(char *cmdline,
>  			cur++;
>  			*crash_base = memparse(cur, &tmp);
>  			if (cur == tmp) {
> -				pr_warn("crahskernel: Memory value expected after '@'\n");
> +				pr_warn("crashkernel: Memory value expected after '@'\n");
>  				return -EINVAL;

Acked-by: Baoquan He <bhe@redhat.com>

>  			}
>  		}
> -- 
> 2.49.0
> 

