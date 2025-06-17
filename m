Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45B2BF3D3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158341; cv=none; b=MMQ9X35kzyQ/p/G0nGjIkHUOxq8YY/0MV0jJJ+UHdljODi95RpphQ/IzJlcKcyuUvxFa952j5crE6q+nFLZ+AjtbPxYaK9rmH7M8169KZW79McGv0zONF4MTFOvKKJhsnEH7ukkQRdcskRuxBhtsT1LbGNhkjM74pqwtQqnpHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158341; c=relaxed/simple;
	bh=0um0R3zeYp1Vpz2CP5NnfVmYK0iAYL/nakFl/p17qOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf+4Qy58qoX9kJV2sVzsaO3jbr7snw4AZCETPKg0GJUApD0td8lwlsvGOOEvs4eRwBGNNOJo5Pe2dKMu71QxMiRq7tXjNzmzZ42p/wV8CYf3PLWUuyPqfXSyAT90LMDtSB4qdO+DnpjEVjl0XyZcDRL4g6GaSrWjeRU8uPQYy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKzNwXJb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKzNwXJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750158339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiYdceZwMX0acoVDusyjf9I10Ybg+SrHFujR2B70YK0=;
	b=JKzNwXJbHC0uYf2iNTLC3x+1AkY9NFre6w/GmnMADzlVgqFYfkSBVp1kkwa3abzu9d6AAC
	jKSilPzbOOIuEAe58yZ0gW6uuEl1O2tGR+rjcq85ErmTUf8YUbOCAx4kt3tZpLE6yr9Bea
	oXOXH8jZ0clyK8yBT0DQV9zpZT7GlYI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664--BLfXEdfNw6yvtH9Eb6OFA-1; Tue,
 17 Jun 2025 07:05:35 -0400
X-MC-Unique: -BLfXEdfNw6yvtH9Eb6OFA-1
X-Mimecast-MFC-AGG-ID: -BLfXEdfNw6yvtH9Eb6OFA_1750158333
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 087B9180028F;
	Tue, 17 Jun 2025 11:05:33 +0000 (UTC)
Received: from fedora (unknown [10.72.116.84])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00C901956094;
	Tue, 17 Jun 2025 11:05:25 +0000 (UTC)
Date: Tue, 17 Jun 2025 19:05:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	kbusch@kernel.org, Anders Roxell <anders.roxell@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: selftests ublk UBLK_IO_F_NEED_REG_BUF undeclared
Message-ID: <aFFL8DQufPXnerlm@fedora>
References: <CA+G9fYsiWN1gWhHBk9uruDBzVHvLYCTL-VcxU2iiPMcS1EXyBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsiWN1gWhHBk9uruDBzVHvLYCTL-VcxU2iiPMcS1EXyBg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Tue, Jun 17, 2025 at 04:27:31PM +0530, Naresh Kamboju wrote:
> The following build warnings / errors noticed while building the selftest/ublk
> with gcc-13 and clang-nightly toolchains on Linux next tree.
> 
> Please suggest if I am missing something in my build setup.
> 
> Regressions found on arm arm64 x86_64
>   -  selftests ublk
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
> 
> Build regression: selftests ublk UBLK_IO_F_NEED_REG_BUF undeclared
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build log
> 
>  CC       kublk

Please run 'make headers_install' before running the test.


Thanks,
Ming

