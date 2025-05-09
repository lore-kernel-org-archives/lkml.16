Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF15288D2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 01:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755421; cv=none; b=BWh7ormnZfToc+tFzGx1dC9sBfHw2XqPr61uYuGrx8L+YAXB5rq1hWwyW5NPghRspdWdFWSnE0TH5mQB1mz3MGtNyYdGAOIkP6QxZa7xrfMwAe581xYux/7Gb/myEsYJ8gA21/fIMlKXoWtiJqGsYHlS8Gjd34yUyUSRyrkhyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755421; c=relaxed/simple;
	bh=5/G7IdWifR0vRqgnN7Mc1cbSgmIZTm6VSJ6HaqLd1PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AstnOVmcEeSCX8T5VVNQuCEO+BFVzb+o5gNqyMrVqMp16hB0gQrBVMyLyvNOLtdqffi26wLArCrHOCfUhkrMxEYX5gyy9lAPWJC4SDo9OjFjXek60uJvSdhR76/5dl5ce0OWQNcuQ32SDaWFq8XmmT7iMLEgFMvLalPbQEqhTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1Z7x2My; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1Z7x2My"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746755419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iyHYYqFLt4BDQ21nbDC7DuYcsAS65G7vhmyYZcxpcRs=;
	b=d1Z7x2MyWtTlZhIbV3k9rRfYBIiLN8hSBDZ39Z2getIeFehsbu4SJJ0qn1/tPP39KyRxLM
	+XO7dFtgZQK3st5VV2EduJuvXv3w+HJnkduPWjZgAz8CWR3H5Gc0JtNbSDnWeL2p+/kpLN
	oP5BqQ8BpKeVMjVsFAQ4QloKaP8NAxY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-307-haDHg9-3N-Cj6Qx2WUt9tg-1; Thu,
 08 May 2025 21:50:15 -0400
X-MC-Unique: haDHg9-3N-Cj6Qx2WUt9tg-1
X-Mimecast-MFC-AGG-ID: haDHg9-3N-Cj6Qx2WUt9tg_1746755406
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59069195608F;
	Fri,  9 May 2025 01:50:06 +0000 (UTC)
Received: from fedora (unknown [10.72.116.120])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CB0E1955BC0;
	Fri,  9 May 2025 01:49:52 +0000 (UTC)
Date: Fri, 9 May 2025 09:49:47 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Daniel Wagner <wagi@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mel Gorman <mgorman@suse.de>, Hannes Reinecke <hare@suse.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, megaraidlinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org, storagedev@microchip.com,
	virtualization@lists.linux.dev,
	GR-QLogic-Storage-Upstream@marvell.com
Subject: Re: [PATCH v6 4/9] scsi: use block layer helpers to calculate num of
 queues
Message-ID: <aB1fO4AV73VXocMP@fedora>
References: <20250424-isolcpus-io-queues-v6-0-9a53a870ca1f@kernel.org>
 <20250424-isolcpus-io-queues-v6-4-9a53a870ca1f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-isolcpus-io-queues-v6-4-9a53a870ca1f@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Thu, Apr 24, 2025 at 08:19:43PM +0200, Daniel Wagner wrote:
> Multiqueue devices should only allocate queues for the housekeeping CPUs
> when isolcpus=managed_irq is set.

> This avoids that the isolated CPUs get disturbed with OS workload.

The above words should be removed, since that isn't what the patch is
doing.

Otherwise, looks fine to me:

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks, 
Ming

