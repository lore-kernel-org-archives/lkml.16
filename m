Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63735149C4A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738897289; cv=none; b=uz4A1866s6hTu4JBWwFqHEtB4HSSNjsIpczlldm0NHPbYxASQ+vh7VQFo/fkqXy1PUl4lMf13fX31Q6hHZ/0GSRB+ULqrwOy923ZqVc2yqz5IAHXLtCR52IhCb8Pgi4vHkQj4R0OtyOAbGd8uIGFhrADU+LrGijcJzw8c257bWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738897289; c=relaxed/simple;
	bh=P8YV9TWj0gv0Tib8gKdyU/4QfP2apU0uWIEntYw5YS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjl3kypXPoLIv8woMJ/9iG/TlXbgwv1me3jos2Pc5UZjQ7DjBY/C5Vok31TWU5yWHh3J/SDppQtEcDo3YDJWrYieayTLqsuti+bb40pfUi/k4khqD7KrlMluLvLeuOU1ZWP1IvHOYni6/pP0bDDwYiv/RBS42vuM0iOXhRZEtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PR5SiEif; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PR5SiEif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738897286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bovCnASvGHhB/zWZqXML/1CrlUVnFOGyxkprm/QLHBA=;
	b=PR5SiEif0FRfnnSVsARnesPQRc2soN2Aq0PcnFGPw9ZBXqS1htpKzDpLnrQTWGEm0ZKGe8
	VAiYtOvyvlOLd41HxRkMppW/J6Ps9WZL06xVjMsXf4W6NJeby7sgRZCRioGoGPm/Rmx2O+
	PQ7vFWrSvBQgHILvrlCF5+QEI1EczRo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-EAWj6CjfObSvsuBwm3Abqg-1; Thu,
 06 Feb 2025 22:01:24 -0500
X-MC-Unique: EAWj6CjfObSvsuBwm3Abqg-1
X-Mimecast-MFC-AGG-ID: EAWj6CjfObSvsuBwm3Abqg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02B451956086;
	Fri,  7 Feb 2025 03:01:23 +0000 (UTC)
Received: from localhost (unknown [10.72.112.206])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C51F71800570;
	Fri,  7 Feb 2025 03:01:19 +0000 (UTC)
Date: Fri, 7 Feb 2025 11:01:15 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Jan Pazdziora <jpazdziora@redhat.com>,
	Pingfan Liu <kernelfans@gmail.com>, Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 0/7] Support kdump with LUKS encryption by reusing
 LUKS volume keys
Message-ID: <Z6V3e3yPQyhaRBCN@fedora>
References: <20250116065825.1041558-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116065825.1041558-1-coxu@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Coiby,

On 01/16/25 at 02:58pm, Coiby Xu wrote:
> LUKS is the standard for Linux disk encryption, widely adopted by users,
> and in some cases, such as Confidential VMs, it is a requirement. With 
> kdump enabled, when the first kernel crashes, the system can boot into
> the kdump/crash kernel to dump the memory image (i.e., /proc/vmcore) 
> to a specified target. However, there are two challenges when dumping
> vmcore to a LUKS-encrypted device:

This v7 series looks good to me, other than Randy's concern. Do you plan
to repost to update the document?

Thanks
Baoquan

