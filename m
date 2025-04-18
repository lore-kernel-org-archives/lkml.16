Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342D184E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940208; cv=none; b=qhOVshXmwtWI4jKb8EKp8TpsYFeyv0TtQUpG1EDBDehgW1SdvG5MFrkmHGGkPnLFbvdUmpuAGryqtalmcWosgRWy9C8VI5ThSmZvw8a6Frn2ZlPkn5WhYDflNY19I8/8QU136SoEB3SM2wR0LlLjG//d4bcglXZkF75eL4lvJVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940208; c=relaxed/simple;
	bh=SekIIecffDhznCWSL1ttezk93b5xIuQU1BogoGx9lq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaDAo2uSodz2yO0PVsbFCVzwpNnZh9Fs34ODN/gpVzhDb9pCiqDhyx0j6f3+I6zMgOM4uYtQei2XjDvA8AekoRGwKrniu+S2M1BwpMoVQh6cbzrYd9FjUn6KHeZk5t/dFR27GPt5A/ln0qcZa/MnD+v6yTqWaLNm9Tfd8vYyUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1w4HMo+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1w4HMo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744940204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DPRKEE2pPqqXh55VK4O93js2Z6aBFP+KbTUlePrKSuI=;
	b=D1w4HMo+EplVgTkK1Y0yC4OV0GFld/SvqZc1x2a7uq/OdfeirmGR1X33WRUAL4GesdOxSd
	MwV8irj+AAnnSS4Yixodn76v7JWDSx3A14/MJT03tpHLQXAd2YMHksN2v6HsVjibEUV93c
	AwRLxOVO+VS1yOFHh7oJ35Bd3P1oFgY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-TCMRb19APSGqUBiv_ILfpw-1; Thu,
 17 Apr 2025 21:36:42 -0400
X-MC-Unique: TCMRb19APSGqUBiv_ILfpw-1
X-Mimecast-MFC-AGG-ID: TCMRb19APSGqUBiv_ILfpw_1744940201
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ED4E1800879;
	Fri, 18 Apr 2025 01:36:41 +0000 (UTC)
Received: from fedora (unknown [10.72.116.88])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F51719560BA;
	Fri, 18 Apr 2025 01:36:37 +0000 (UTC)
Date: Fri, 18 Apr 2025 09:36:33 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] ublk: mark ublk_queue as const for
 ublk_register_io_buf
Message-ID: <aAGsodNqMvuq5eIs@fedora>
References: <20250416-ublk_task_per_io-v5-0-9261ad7bff20@purestorage.com>
 <20250416-ublk_task_per_io-v5-3-9261ad7bff20@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-ublk_task_per_io-v5-3-9261ad7bff20@purestorage.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Wed, Apr 16, 2025 at 01:46:07PM -0600, Uday Shankar wrote:
> We now allow multiple tasks to operate on I/Os belonging to the same
> queue concurrently. This means that any writes to ublk_queue in the I/O
> path are potential sources of data races. Try to prevent these by
> marking ublk_queue pointers as const in ublk_register_io_buf.
> 
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>


Thanks,
Ming

