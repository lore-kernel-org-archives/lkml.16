Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3E3A8F7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889081; cv=none; b=XCLhvfSd4nPmOSUpa01b3Y07jddDDcQpK+EiSLfScoWca3DoxrvNHCnsnxo+WSwi3XgRMfvcO04c0lbZhg1eF8j1+UQZslsEizgykmqiF1CCuNMLC/SfIB3urPOqITPA5qmQpkXiOTpTR+TS/AZBtBaRdca/nCrvRe47RjYMBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889081; c=relaxed/simple;
	bh=zAyh2qq0uxBmwFuyzqMD049uxJkQYcWiqqaLHv5GLyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eASXzesRLUdlwrIUKPtnnnfl2Hz3EzRGF7S1GNiOQD+KEpEE5JMBnGtVtndQdi9RNerLD/Q6Sl0P606qHKpug0F3aKYvOmI7shp1OeyDZCsrLmu1K8Wkir9N/s84LoPF5s4XBeIgD1/4oEq6PjSmLWfwczbdWZYMDhrJqb44bQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGUz2F14; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGUz2F14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745889079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+atCu7iB8J4TiSO6knhqI/0GhpG1KCpn/KK3Mg/GIg=;
	b=UGUz2F146Q1EyespbOLiWXk21EYmsoYIcy5kjJLKCzqPLL38QfsD1zyX94gBR7F6pputCX
	Bh+bdVAzDTd+8XmBn2yestuDcTNJl65sNZzXnYX+YjWwpfgppYmmW89H9KqPb7i+YwBJDq
	HllxI+h2HJQGdHGpWHbU3kn777D7DxY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-STQ1jI0iPKWlWPGJGu08Qg-1; Mon,
 28 Apr 2025 21:11:15 -0400
X-MC-Unique: STQ1jI0iPKWlWPGJGu08Qg-1
X-Mimecast-MFC-AGG-ID: STQ1jI0iPKWlWPGJGu08Qg_1745889074
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CE231800570;
	Tue, 29 Apr 2025 01:11:14 +0000 (UTC)
Received: from fedora (unknown [10.72.116.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E99D1180047F;
	Tue, 29 Apr 2025 01:11:10 +0000 (UTC)
Date: Tue, 29 Apr 2025 09:11:05 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests: ublk: kublk: build with -Werror iff
 CONFIG_WERROR=y
Message-ID: <aBAnKZCUZWyEJhfS@fedora>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <20250428-ublk_selftests-v1-1-5795f7b00cda@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-ublk_selftests-v1-1-5795f7b00cda@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Apr 28, 2025 at 05:10:20PM -0600, Uday Shankar wrote:
> Compiler warnings can catch bugs at compile time. They can also produce
> annoying false positives. Due to this duality, the kernel provides
> CONFIG_WERROR so that the developer can choose whether or not they want
> compiler warnings to fail the build. Use this same config options to
> control whether or not warnings in building kublk fail its build.
> 
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  tools/testing/selftests/ublk/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
> index ec4624a283bce2ebeed80509be6573c1b7a3623d..86474cfe8d03b2df3f8c9bc1a5902701a0f72f58 100644
> --- a/tools/testing/selftests/ublk/Makefile
> +++ b/tools/testing/selftests/ublk/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
> +CONFIG = $(top_srcdir)/include/config/auto.conf
> +WERROR = $(if $(shell grep CONFIG_WERROR=y ${CONFIG}),-Werror,)
> +CFLAGS += -O3 -Wl,-no-as-needed -Wall ${WERROR} -I $(top_srcdir)
>  LDLIBS += -lpthread -lm -luring

I think it isn't good to reuse kernel CONFIG_WERROR for test code.

But it can be done in the following way by passing 'WERROR=1' to make
command line:

+ifneq ($(WERROR),0)
+       CFLAGS += -Werror
+endif



Thanks,
Ming

