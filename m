Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B350291C25
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525090; cv=none; b=NRKwjhS2wIQP/MF7E7OGiHjHA6hgT3Ng+i6YITEihI/FtzIZmdJ22mDjPxovWrf7z3kQs0profJPoN60vT6bVfdQDC95wfB1Po6iSqBJCMuXA++6kKyXUHA2uEh1oB1peTURdC/g6kvziUokNf9b9tVfJpTiX4gLUqQYiYTGAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525090; c=relaxed/simple;
	bh=hpFYLV8ogJfKB0nmps6HY6WbbsMeyCGnB9/GFoUFXHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBPou2gTkVEW2hP0u+t3gzhxDlSi6oIN2YvnYn2OFprvBTqnhXpBIchwlMbqb2DHnl7OmWEkTEW26k45K1mumUWr8BXc5Zzk9r7td0LsV+V3JvgAxhYmlymdu/0hDlW18wbJkc4cDtm+Q//QiZZz/d7uW2f3x6XOEPQ3bNf7Rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cyRWxjD2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cyRWxjD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751525087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJ7q0V9kF6LpjhO3dWBRMm1GDYk0h/5qsRyzs/9AW0o=;
	b=cyRWxjD2oBOOqhYcAZtII8w0E/ZziC6H7C7J02xItyEJCRvA4iQHYl9SkKAuM9uJo9/X71
	ignpAFdid/S/uXGgn+RD8EYol/kIv5nmsBiRrfT5cowqNilJ+VmxaGqgTXUdWN0MmjB3PZ
	oCzq5B5dgpap/D0oD3tXBXozN9b7qmk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-yQrqLG9AO-ujHHCjFsafNg-1; Thu,
 03 Jul 2025 02:44:44 -0400
X-MC-Unique: yQrqLG9AO-ujHHCjFsafNg-1
X-Mimecast-MFC-AGG-ID: yQrqLG9AO-ujHHCjFsafNg_1751525082
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 584E919560A6;
	Thu,  3 Jul 2025 06:44:42 +0000 (UTC)
Received: from localhost (unknown [10.72.112.67])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA45419560AB;
	Thu,  3 Jul 2025 06:44:40 +0000 (UTC)
Date: Thu, 3 Jul 2025 14:44:36 +0800
From: Baoquan He <bhe@redhat.com>
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>
Cc: khan@linuxfoundation.org, kexec@lists.infradead.org, dwmw@amazon.co.uk,
	mingo@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] selftests/kexec: fix test_kexec_jump build
Message-ID: <aGYm1BARlztCoCLT@MiWiFi-R3L-srv>
References: <20250702171704.22559-2-moonhee.lee.ca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702171704.22559-2-moonhee.lee.ca@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 07/02/25 at 10:17am, Moon Hee Lee wrote:
> The test_kexec_jump program builds correctly when invoked from the top-level
> selftests/Makefile, which explicitly sets the OUTPUT variable. However,
> building directly in tools/testing/selftests/kexec fails with:
> 
>   make: *** No rule to make target '/test_kexec_jump', needed by 'test_kexec_jump.sh'.  Stop.

I can reproduce this, and this patch fixes it. Thanks.

Acked-by: Baoquan He <bhe@redhat.com>

> 
> This failure occurs because the Makefile rule relies on $(OUTPUT), which is
> undefined in direct builds.
> 
> Fix this by listing test_kexec_jump in TEST_GEN_PROGS, the standard way to
> declare generated test binaries in the kselftest framework. This ensures the
> binary is built regardless of invocation context and properly removed by
> make clean.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
> Changes in v2:
> - Dropped the .gitignore addition, as it is already handled in [1]
> 
> [1] https://lore.kernel.org/r/20250623232549.3263273-1-dyudaken@gmail.com
> 
> 
>  tools/testing/selftests/kexec/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
> index e3000ccb9a5d..874cfdd3b75b 100644
> --- a/tools/testing/selftests/kexec/Makefile
> +++ b/tools/testing/selftests/kexec/Makefile
> @@ -12,7 +12,7 @@ include ../../../scripts/Makefile.arch
>  
>  ifeq ($(IS_64_BIT)$(ARCH_PROCESSED),1x86)
>  TEST_PROGS += test_kexec_jump.sh
> -test_kexec_jump.sh: $(OUTPUT)/test_kexec_jump
> +TEST_GEN_PROGS := test_kexec_jump
>  endif
>  
>  include ../lib.mk
> -- 
> 2.43.0
> 
> 

