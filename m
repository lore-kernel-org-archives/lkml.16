Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C119C540
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805705; cv=none; b=BZWwf+N1sbFMwF1GLWD5AWrWxegYeph0H0kHQmRbwhsQUQ9ICXdeBzpvXHMIkyviPWogqmi1CE3ETvuQx+5iNP2pRiH4wiLSBbtkCGGxU9H8T4OM/J58eApatviW+ZltT2B7YZ754B3mQRXUFisEoLLrSsDhYwParXJRhhI8bEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805705; c=relaxed/simple;
	bh=rD4zM5OiuvvW6gCsQJsuSIomZr662KVSXdfF0TeywME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axlLDx2mBTQSVsXE9PfGjuS5OAWaX4ot+CfS0mpPtCa1C2dMNeaijCzunqShkFOK7TOS/GRX4ynk+gcncw9CG62hL9IiYt3XAWXRETFOR1BdH/VqJa5n7FX/t41kPH97q7ZzmsHNAim+wpM1hOFtVpKcS9Kgn479HTuCd+bzs2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IRYqz6/L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IRYqz6/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743805702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Befyf2MillwSBKMFj/rTqdswT5mC0g4BS1/gE352LrA=;
	b=IRYqz6/LrkyPrNOQ7s6ZpGkQWb9pNyXSZrnhlkAh2UW6d9xs079EpOmgVyFFfp47rc9a5Y
	vMcRzsLCBypO0AGdFf7zTSjDctTddC7jvtmWCdgYUpQhZN/8+4zyVaQHwqDI2NeABUGWvQ
	TXujHUQvUZM/rSjEVtXnxBaP/Hi74ho=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-t-oQUblOMoGHXvd33mwDWw-1; Fri,
 04 Apr 2025 18:28:16 -0400
X-MC-Unique: t-oQUblOMoGHXvd33mwDWw-1
X-Mimecast-MFC-AGG-ID: t-oQUblOMoGHXvd33mwDWw_1743805694
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 280231801A06;
	Fri,  4 Apr 2025 22:28:13 +0000 (UTC)
Received: from [10.22.81.88] (unknown [10.22.81.88])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4257C1801752;
	Fri,  4 Apr 2025 22:28:10 +0000 (UTC)
Message-ID: <f949d227-b3ba-48dc-8dab-d527b82e1246@redhat.com>
Date: Fri, 4 Apr 2025 18:28:10 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvme-multipath: add the NVME_MULTIPATH_PARAM
 config option
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, sagi@grimberg.me, loberman@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 emilne@redhat.com, bgurney@redhat.com, jmeneghi@redhat.com
References: <20250322232848.225140-1-jmeneghi@redhat.com>
 <20250322232848.225140-3-jmeneghi@redhat.com> <20250403043526.GC22526@lst.de>
Content-Language: en-US
From: John Meneghini <jmeneghi@redhat.com>
Organization: RHEL Core Storge Team
In-Reply-To: <20250403043526.GC22526@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


On 4/3/25 12:35 AM, Christoph Hellwig wrote:
> On Sat, Mar 22, 2025 at 07:28:47PM -0400, John Meneghini wrote:

>> +config NVME_MULTIPATH_PARAM
>> +	bool "NVMe multipath param"
> 
> This isn't really a good config options description.
> 
>> +	depends on NVME_CORE && NVME_MULTIPATH
>> +	default y
>> +	help
>> +	  This option controls the inclusion of the NVMe core module
>> +	  "multipath" parameter. If this option is disabled the
>> +	  nvme_core.multipath parameter is excluded from the kernel.
>> +	  If this option is enabled the nvme_core.multipath parameter
>> +	  is included in the kernel.
> 
> So maybe invert the option to
> 
> config NVME_MULTIPATH_DISABLE
> 	bool "Allow overriding the default nvme-multipath parameter"

So the question is: do you want the core_nvme.multipath parameter
to be excluded by default, or included by default?

Keith and I agreed to call this CONFIG_NVME_DISBALE_MULTIPATH_PARAM.
However during testing I realized that many of the default make 'config'
rules would end up with CONFIG_NVME_DISBALE_MULTIPATH_PARAM=y,
even if I set the config rule to "default n".

For example:

  make localmodconfig
  make allmodconfig

would end up with compiling out the core_nvme.multipath parameter and I
don't think this is what we want.

If we want this new config option to provide no net change in the
default behavior, we need this to be the logic to be positive.

> 	help
> 	  This option controls the inclusion of the NVMe core module
> 	  "multipath" parameter. If this option is enabled the
> 	  nvme_core.multipath parameter is excluded from the kernel.
> 	  If this option is enabled the nvme_core.multipath parameter

How about something simple like this:

+config NVME_ENABLE_MULTIPATH_PARAM
+       bool "NVMe enable core_nvme.multipath param"
+       depends on NVME_CORE && NVME_MULTIPATH
+       default y
+       help
+         If this option is N the core_nvme.multipath parameter
+         is excluded from the kernel. If this option is Y the
+         core_nvme.multipath parameter is included in the kernel.
+
+         If unsure, say Y.
+

> 	  See the nvme_core.multipath documentation why disabling
> 	  multipathing is generally harmful but there might be
> 	  exception reasons to do so anyway.
> 
> (assuming we already have the documentation mentioned, if not we
> need to add it)

Yes, I will add some documentation about this.  It looks like we currently
don't have any.

/John

