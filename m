Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7243625B687
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288243; cv=none; b=lXKndPA+YvxAMw6Q07yfBjp6Di0Vj42gsOOAcfMUcqXZToUOzSKi/mOiI+K1Fwj0ZvBxuyTtIXhjk8Q8PSLUC5lbkZAk7q2hSXbNUQ1hBJRRdS2qR6r+bKgT5ODvZ5I4nRo3crMl7JFTNtB3yKc/7s7sYskvsb2RuFNov63zEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288243; c=relaxed/simple;
	bh=ZZHqkKq+49cIqgAl6qN3d5wawWQS8Uabq7s40p983kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1iY2/Eqhvs+45OLfFYJuD+4bpoRiQhg/TGX9+rZvTbg9RXcBfie9BAaxjCFOFtrNO9dCkkSfIN/raJmVxiKZs4uv80Cda1rZ7gJ/EC2PWLSrIpcfsNHoxfsW6w8BHInmXz3khWkk/wOTACqhUwYvoBJbfW+VqkpK6uxXog45OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TazcazY3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TazcazY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745288239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vPTnMwL4/AxLUZBgsDv5fiQPI73zQZ0VZKJSDjiN8Nk=;
	b=TazcazY3LPDUoo4BuTnJGUYbbWZsVz6+1H1+/kVDbcZKKAlnsUplB5AW1Z+Bt2cJxA5ZZ8
	3owG+7f92o7AFawtdKn+vleK438Ma0L2uFTPpFTmVkvV8OsOZQhoF6+rF+YSvcivr30cRt
	J+7G9sfntWw4hezFOCcZ6hiaPuCsYqM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-XTG-6jzWMSWJA0fWr1fcAA-1; Mon,
 21 Apr 2025 22:17:15 -0400
X-MC-Unique: XTG-6jzWMSWJA0fWr1fcAA-1
X-Mimecast-MFC-AGG-ID: XTG-6jzWMSWJA0fWr1fcAA_1745288234
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A3A43180087F;
	Tue, 22 Apr 2025 02:17:14 +0000 (UTC)
Received: from fedora (unknown [10.72.116.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D1A5180045C;
	Tue, 22 Apr 2025 02:17:10 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:17:06 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: Re: [PATCH 3/4] ublk: factor out ublk_get_data
Message-ID: <aAb8IgxW85Ncxv74@fedora>
References: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
 <20250421-ublk_constify-v1-3-3371f9e9f73c@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-ublk_constify-v1-3-3371f9e9f73c@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Mon, Apr 21, 2025 at 05:46:42PM -0600, Uday Shankar wrote:
> Move all the logic for the UBLK_IO_NEED_GET_DATA opcode into its own
> function. This also allows us to mark ublk_queue pointers as const for
> that operation, which can help prevent data races since we may allow
> concurrent operation on one ublk_queue in the future.
> 
> Suggested-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

thanks,
Ming

