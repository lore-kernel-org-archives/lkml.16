Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66928C5B6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144438; cv=none; b=YLnD7FL/gm0eA0kOoN4jof4oK+IwIhEr2BrSX7XuExPeeFv7CyIsY+cn5zIY76srIbJ33xB37zS+12lLnbSZ317NkvSLb/0Q4KTHsfd2Zz1Ha6GsmEhAqTb7XNxaapPiotCp4V2wOAowDqfaOW/FmyQZivUvUiyDLSBdMbZ81XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144438; c=relaxed/simple;
	bh=qJY8bj9CtbYWcniHkdEgxnX7+YzcTn7+I2xj0uZMQIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k/sn0rabq2eVuDnlTaizbe4hQBH9HNb7coIwx6mCYAz9D7iYF3au8LaAHPwpsb9udzgXR228RHZGAr9MXhkPkhmqLWrvRl+GvtdpHtDsektY44FFd+rMqftbS6rRlZwsKnjhysRMY9HV69CudYehKusv8LN0qPHCFz0BBwboTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFDbRdnR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFDbRdnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750144435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OPf5/BotB2xeNpXMqUEi097upqbb8LBKJ2dT9gWuPvU=;
	b=FFDbRdnRu0Y4S0cU8UXP2jn8GXDYo7jsWe5XLd/sYArKqBXG3xIzK3FTE4TYNoVUpOEKFz
	dGAStDZPMFTKwH1O7ao6hI37UHqJpXvPyxysvGAeUoDjAzzlOkuJ44rlE27K8sHtFSQjIT
	Y3RGkWTDfie3NZ1HnNNS3tHHbhuCFaE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-5rCRh91LPYOqx456wpzUNA-1; Tue,
 17 Jun 2025 03:13:51 -0400
X-MC-Unique: 5rCRh91LPYOqx456wpzUNA-1
X-Mimecast-MFC-AGG-ID: 5rCRh91LPYOqx456wpzUNA_1750144430
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 609A71809C80;
	Tue, 17 Jun 2025 07:13:50 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.8])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 604C01956094;
	Tue, 17 Jun 2025 07:13:48 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,  linux-api@vger.kernel.org,
  workflows@vger.kernel.org,  tools@kernel.org
Subject: Re: [RFC 08/19] exec: add API specification for execve
In-Reply-To: <aFDKHhaqB75Qi212@lappy> (Sasha Levin's message of "Mon, 16 Jun
	2025 21:51:26 -0400")
References: <20250614134858.790460-1-sashal@kernel.org>
	<20250614134858.790460-9-sashal@kernel.org>
	<87ikkvv018.fsf@oldenburg.str.redhat.com> <aFDKHhaqB75Qi212@lappy>
Date: Tue, 17 Jun 2025 09:13:44 +0200
Message-ID: <87y0tqu9g7.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

* Sasha Levin:

> On Mon, Jun 16, 2025 at 11:39:31PM +0200, Florian Weimer wrote:
>>* Sasha Levin:
>>
>>> +	KAPI_RETURN("long", "Does not return on success; returns -1 on error")
>>> +		.type = KAPI_TYPE_INT,
>>> +		.check_type = KAPI_RETURN_ERROR_CHECK,
>>> +	KAPI_RETURN_END
>>
>>Is the -1 part correct?
>
> Maybe :) That's one of the things I wasn't sure about: we're documenting
> the execve syscall rather than the function itself. A user calling
> execve() will end up with -1 on failure, and errno set with the error
> code.

Well, it doesn't say execve, it says sys_execve.

> You could argue that it's libc that sets errno and we're trying to spec
> the kernel here, not the userspace interface to it.

And I think this would be appropriate.

Note that in the future, the glibc version of execve will not be a
straightforward system call wrapper because we need to obtain a
consistent snapshot of the environment array.  That is actually pretty
hard because we cannot atomically replace the process image, unblock
signals, and unmap a copy of the environment.

So I think it's best for the kernel to stick with the system call
interface and not try to document what libcs are doing.

An even more thorny example are the setuid family of system calls, where
the kernel is extremely far away from what POSIX requires, and we have
to fix it in userspace.

Thanks,
Florian

