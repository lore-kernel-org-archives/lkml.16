Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F7293440
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357904; cv=none; b=YXi8LG2yLNAB7jOPtB7SKzA4r6uSicMVVELtA1jPRzPE85AuiF2KhfqcUVl5ZsCJdmeV/9mMxzdG5iiQCrDQHrGRfFGAnEwhtrcGO6OC9NrxRhSumzQ5wf1Vd+F1XYOpAV+UlrfSnbyJEMulaKVdFVx5jC2n7xpGcuh2Q/1gGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357904; c=relaxed/simple;
	bh=RoaRnEuDGYNZNBysc6IoCuCalvE8roZQ3otz4VDUpFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL+1AsyptTdV+P8xLQI1eRXqV1w3yCIKDlRn5Zs0LjZrRGGXSnSdCSmAKi/HCE0zKNhAAl7f8mRdVh9NiD5NP7V67DQJrjGj4LJDgMgWHob9HcXoD4TXx4xC2Q46XsyoA9GbcD4IWKMODHqmMJAnbL6vXyvNCUpSxBwweMjHhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8vwrX/t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8vwrX/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744357900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/nq9vWKH5vK+LG8V0e3I7yV8cZfspJSlkpTU7meTlsU=;
	b=B8vwrX/t9/cy4yXQE1+4/169Z4QjPCHg/VlgRH49lx1bGyECTkpMWHWzoHdtuKMXV9kpWS
	QGv9YKwYC29VFijypGPUzV6STjaZV0AGL8OV4O9ipYtui/7HaYCWQx6BVDUN5G0yb/Flcl
	LtR8ySDl6K4obaYKFThx5O4aLR79dDU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-4MRAc9WOPCav8HDlsRdL7Q-1; Fri,
 11 Apr 2025 03:51:36 -0400
X-MC-Unique: 4MRAc9WOPCav8HDlsRdL7Q-1
X-Mimecast-MFC-AGG-ID: 4MRAc9WOPCav8HDlsRdL7Q_1744357894
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75B701955BC1;
	Fri, 11 Apr 2025 07:51:34 +0000 (UTC)
Received: from fedora (unknown [10.72.120.6])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49E021828A9E;
	Fri, 11 Apr 2025 07:51:29 +0000 (UTC)
Date: Fri, 11 Apr 2025 15:51:24 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: pass ublksrv_ctrl_cmd * instead of io_uring_cmd *
Message-ID: <Z_jJ_EU28D3C5P6F@fedora>
References: <20250409012928.3527198-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409012928.3527198-1-csander@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Tue, Apr 08, 2025 at 07:29:26PM -0600, Caleb Sander Mateos wrote:
> The ublk_ctrl_*() handlers all take struct io_uring_cmd *cmd but only
> use it to get struct ublksrv_ctrl_cmd *header from the io_uring SQE.
> Since the caller ublk_ctrl_uring_cmd() has already computed header, pass
> it instead of cmd.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

