Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACB18DF6D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743342640; cv=none; b=YP2FjfjlxvjSa5wvPf9UCYmxloe3cZXQN5h+FGVN3oUvjpJzfGd0FouZQKoXSSosIAHkWXekz9UnJsHE9wnKfpeiSaevGskYRxz6Gejnc/aXyUXivRsgGOJjFQYfEktxf8vntbLpXNattg75+uqYhjJna9Vvw5uSqgHmOJuf3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743342640; c=relaxed/simple;
	bh=I2LUnIFhFwDTt0tT1BBrxnXENjADvUkcm/ZEC3W3Q30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggg92t+V/menIAV6gUAyRpmkJNDheQyucuAQlt5ObvFfMfNmrNfYj9wOjoxejrws0qI7dSR8bseVWbD1xM1zR11FgkgxNYqH8+czpzKexHEztZSWcDiVtVl+8jw2CLGLOsAdEXmtKGDKRy5mKuySMtagSytmbxEbmzXla2fCxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/cLcY8w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/cLcY8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m9aLgGxhSieO6IwQ2Na1IHoktnVcWYl4AIdF+1SV6dE=;
	b=T/cLcY8wrFhUCdUanX3thNzmZDV3eh6gSNDpFJ0CPb5qn0ckdvHjV9B365TEcVcUWFN7Nb
	0nw0KnYjqq3KT6m+5UR8fxOYphdC6mxFDYFi3Ix2y46jUOJD+/Zvw5My4ho2AuxAqK6EED
	uDG9YY1ibPWSF5rZkhUs8Kt5+BnKgMU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-vqmRHT4cOGmf8a3t-eXcAw-1; Sun,
 30 Mar 2025 09:50:34 -0400
X-MC-Unique: vqmRHT4cOGmf8a3t-eXcAw-1
X-Mimecast-MFC-AGG-ID: vqmRHT4cOGmf8a3t-eXcAw_1743342633
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25DA31944F0A;
	Sun, 30 Mar 2025 13:50:33 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.33.25])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 53568192C7C3;
	Sun, 30 Mar 2025 13:50:30 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 30 Mar 2025 15:49:59 +0200 (CEST)
Date: Sun, 30 Mar 2025 15:49:55 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, Phil Auld <pauld@redhat.com>
Subject: [PATCH] sched/isolation: forbid CONFIG_CPU_ISOLATION without
 CONFIG_SMP
Message-ID: <20250330134955.GA7910@redhat.com>
References: <202503260646.lrUqD3j5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503260646.lrUqD3j5-lkp@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

kernel/sched/isolation.c obviously makes no sense without CONFIG_SMP, but

	config CPU_ISOLATION
		bool "CPU isolation"
		depends on SMP || COMPILE_TEST

we currently have allows to create the pointless .config's which cause the
build failures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503260646.lrUqD3j5-lkp@intel.com/
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 681f38ee68db..ab9b0c2c3d52 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -709,7 +709,7 @@ endmenu # "CPU/Task time and stats accounting"
 
 config CPU_ISOLATION
 	bool "CPU isolation"
-	depends on SMP || COMPILE_TEST
+	depends on SMP
 	default y
 	help
 	  Make sure that CPUs running critical tasks are not disturbed by
-- 
2.25.1.362.g51ebf55


