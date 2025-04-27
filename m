Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D6153BD9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745759470; cv=none; b=k0KBBZJwjJiZRImAy1oS4dorLGjmnThX3G/XZEQbE6fddLuqBDcmmgBc7DbJfWynN1eQ9etMATUYHl6e1WtO6OUEUlCU13YBmiGzqglfHpj5UeMmfuKDkgchSWqzRJnQLfreZ2STt+8JN1lkDLa+Gd0x7ttIC5GFDSm9ObaMnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745759470; c=relaxed/simple;
	bh=n54z8/gbOHTbIhxN6IcQdmaoK8J0pUe3+uouTiiskFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8goSJaf3YFtcjp2MQrXBc3CjpFzhxQntG7HPKVAV3VVaHkR0LHB5X+cCPGmDXrlT7Dq4r2MyBLLSpQB0Wm2P7of1zZHLwRAeLiErPIBQ4RdjE7ChKkKPf8uv6DJdJqUDISrKZgx1evXqw1nnTEfBUCrD806dFF7dbBYMdN0olo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXmhquF2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXmhquF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745759466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I36IHZnzbIf2QzgKgqZEVytr+hYJ+izCX8AFLvetzio=;
	b=JXmhquF2mv6ClEx9fELFYVncbxsL1V72vLT7VdR8Y8k9cLYDosuLk8CfZzDGVn89cqfBi2
	MJGHjT/jxaPrUu1lXGLS0VkjGN6s5+litiDqgG7QCgtULC3DpbzldqE8SnMz30nY/vtpHH
	1/cMrJfgRCdUL7C07kq6Slo0uJahGaQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-fBxP6uepPa65yjrjSKbhXA-1; Sun,
 27 Apr 2025 09:10:56 -0400
X-MC-Unique: fBxP6uepPa65yjrjSKbhXA-1
X-Mimecast-MFC-AGG-ID: fBxP6uepPa65yjrjSKbhXA_1745759453
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C44A11800261;
	Sun, 27 Apr 2025 13:10:53 +0000 (UTC)
Received: from fedora (unknown [10.72.116.119])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D3C51800367;
	Sun, 27 Apr 2025 13:10:49 +0000 (UTC)
Date: Sun, 27 Apr 2025 21:10:45 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] ublk: don't call ublk_dispatch_req() for
 NEED_GET_DATA
Message-ID: <aA4s1eF0EqZRoNoj@fedora>
References: <20250427045803.772972-1-csander@purestorage.com>
 <20250427045803.772972-7-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427045803.772972-7-csander@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Sat, Apr 26, 2025 at 10:58:01PM -0600, Caleb Sander Mateos wrote:
> ublk_dispatch_req() currently handles 3 different cases: incoming ublk
> requests that don't need to wait for a data buffer, incoming requests
> that do need to wait for a buffer, and resuming those requests once the
> buffer is provided. But the call site that provides a data buffer
> (UBLK_IO_NEED_GET_DATA) is separate from those for incoming requests.
> 
> So simplify the function by splitting the UBLK_IO_NEED_GET_DATA case
> into its own function ublk_get_data(). This avoids several redundant
> checks in the UBLK_IO_NEED_GET_DATA case, and streamlines the incoming
> request cases.
> 
> Don't call ublk_fill_io_cmd() for UBLK_IO_NEED_GET_DATA, as it's no
> longer necessary to set io->cmd or the UBLK_IO_FLAG_ACTIVE flag for
> ublk_dispatch_req().
> 
> Since UBLK_IO_NEED_GET_DATA no longer relies on ublk_dispatch_req()
> calling io_uring_cmd_done(), return the UBLK_IO_RES_OK status directly
> from the ->uring_cmd() handler.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

thanks,
Ming

