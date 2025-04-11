Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD215290BDE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358214; cv=none; b=HF+5MtdDXMeXX0Jz9P3rwnzlR+1VIOmgxKLu4kT0IcB8+uxLmuojFHdGVUiL9cpQlbRFMGTmSN+JWSv7+SabrmUxg1B5yLPjTnTlhBwcplvl/vjSdDpVTDF5Lzz70VefKofy8CZrGjPfduAKv1TLLJRooW/os6nrKtxCHiGXEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358214; c=relaxed/simple;
	bh=6uaWW0RaxojMlRB5Y0zUXcKAWLlpIcACNTPnX9kl/Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYw0cK00JQBA0tzhpAmWhxC39uHSCdpoalSJKHL7zX28b7CET1rHDcBwrCz7+6etxR5rL+ASWS40X7UP8wLlhrUWf+uQDzAYxpj7m/Tnm2aTJZQ1W1B/UjBKD0VUneVjAEz8dy32Yt9S8vak8l1dHkpce0NMEbft2CgwS7eW4Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RNucVBnv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RNucVBnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744358211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jk/xXbgSfIo3w5XOnaXVWQMQjFq+vwdxT/bYPGVBprc=;
	b=RNucVBnv4g/GyEgGsDK24tFfTqzvdboW9IzBRqtoYSQnsVNjXULBZeCkQylEPzTsfX5ABM
	WOK0LPmmFJWvoDV3D5t2dGDEMfgF+wqLtYAK4bjwBL3IzzM8l++CF/mxH9P3f+I6R6TpnR
	rsElbd3A3/0C9BgPJ1YaWPCK9+qfJY0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-ls9bcY5tMP6s_nzZLFqxqg-1; Fri,
 11 Apr 2025 03:56:48 -0400
X-MC-Unique: ls9bcY5tMP6s_nzZLFqxqg-1
X-Mimecast-MFC-AGG-ID: ls9bcY5tMP6s_nzZLFqxqg_1744358207
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDB47180025E;
	Fri, 11 Apr 2025 07:56:46 +0000 (UTC)
Received: from fedora (unknown [10.72.120.6])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CDE0180B493;
	Fri, 11 Apr 2025 07:56:42 +0000 (UTC)
Date: Fri, 11 Apr 2025 15:56:36 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: skip blk_mq_tag_to_rq() bounds check
Message-ID: <Z_jLNGzRJAQBN8Nx@fedora>
References: <20250409024955.3626275-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409024955.3626275-1-csander@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Tue, Apr 08, 2025 at 08:49:54PM -0600, Caleb Sander Mateos wrote:
> The ublk driver calls blk_mq_tag_to_rq() in several places.
> blk_mq_tag_to_rq() tolerates an invalid tag for the tagset, checking it
> against the number of tags and returning NULL if it is out of bounds.
> But all the calls from the ublk driver have already verified the tag
> against the ublk queue's queue depth. In ublk_commit_completion(),
> ublk_handle_need_get_data(), and case UBLK_IO_COMMIT_AND_FETCH_REQ, the
> tag has already been checked in __ublk_ch_uring_cmd(). In
> ublk_abort_queue(), the loop bounds the tag by the queue depth. In
> __ublk_check_and_get_req(), the tag has already been checked in
> __ublk_ch_uring_cmd(), in the case of ublk_register_io_buf(), or in
> ublk_check_and_get_req().
> 
> So just index the tagset's rqs array directly in the ublk driver.
> Convert the tags to unsigned, as blk_mq_tag_to_rq() does.

If blk_mq_tag_to_rq() turns out to be not efficient enough, we can kill it
in fast path by storing it in ublk_io and sharing space with 'struct io_uring_cmd *',
since the two's lifetime isn't overlapped basically.



Thanks,
Ming

