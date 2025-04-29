Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D753259C9B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968969; cv=none; b=TsEbq7KacvsxlylcHLB8UK6b0tceJmp0c6MeRPxo3WMpRF/M5/keBUOWM5y9vUSZYvg+mICX1QsynOhCc7i73fdVfB7dIVBqAl6JkzRkl4VF6nUoipqIUI2Qo9iYQtYcS843ho8FGpFpZ7vpmJhmpdCp2fV2l4yP6hcKrBA27iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968969; c=relaxed/simple;
	bh=aQbB1Z96AXc3OR1lYM8d5LueOp+q4mAg76B0s25oJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMB7DHbeR4LNyM2v33rYcHBVlCbxrl9BzykaIaXmxPp+ipHo/9rae+UgLxj3OfZS20CBwqUgSrRFEDo1mj0POE+7997J1UyTP+iSkkZzxql4nYKPlUbsWikB3E9s8R18UfSOUxEvqHQXHxVqphOC8Ve9aV0lJdcw32xNm1xjHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWJbDB2G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NWJbDB2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745968966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kwb9rMjhhR05tXgbyU06kvQsgWUDgylOH5JOrli2iI=;
	b=NWJbDB2GKYWaXPaE0SksuD2YabCQdO3P3L69ocNMR7pJJS/erzZ4Sx8JS80mk65uj7trUA
	95WV2gQs/sWlxoItzfULjpxaYBhH3XCYXtWbVtYLLXfYN7XWK05R2fRIFBPcdrDw0AhC9D
	ErLMkwbhh+N4TzLS565wAMo04zbW1Bo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-13I32tYROqmJ8jYTT8QIGg-1; Tue,
 29 Apr 2025 19:22:42 -0400
X-MC-Unique: 13I32tYROqmJ8jYTT8QIGg-1
X-Mimecast-MFC-AGG-ID: 13I32tYROqmJ8jYTT8QIGg_1745968961
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 886E719560AB;
	Tue, 29 Apr 2025 23:22:41 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (unknown [10.6.23.247])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D841195608D;
	Tue, 29 Apr 2025 23:22:41 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 53TNMdid1956533
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 19:22:40 -0400
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 53TNMdel1956532;
	Tue, 29 Apr 2025 19:22:39 -0400
Date: Tue, 29 Apr 2025 19:22:39 -0400
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: dm-devel@lists.linux.dev, hreitz@redhat.com, mpatocka@redhat.com,
        snitzer@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dm mpath: Interface for explicit probing of active
 paths
Message-ID: <aBFfP-XaHHAs4vE_@redhat.com>
References: <20250429165018.112999-1-kwolf@redhat.com>
 <20250429165018.112999-3-kwolf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429165018.112999-3-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Tue, Apr 29, 2025 at 06:50:18PM +0200, Kevin Wolf wrote:
> Multipath cannot directly provide failover for ioctls in the kernel
> because it doesn't know what each ioctl means and which result could
> indicate a path error. Userspace generally knows what the ioctl it
> issued means and if it might be a path error, but neither does it know
> which path the ioctl took nor does it necessarily have the privileges to
> fail a path using the control device.
> 
> In order to allow userspace to address this situation, implement a
> DM_MPATH_PROBE_PATHS ioctl that prompts the dm-mpath driver to probe all
> active paths in the current path group to see whether they still work,
> and fail them if not. If this returns success, userspace can retry the
> ioctl and expect that the previously hit bad path is now failed (or
> working again).
> 
> The immediate motivation for this is the use of SG_IO in QEMU for SCSI
> passthrough. Following a failed SG_IO ioctl, QEMU will trigger probing
> to ensure that all active paths are actually alive, so that retrying
> SG_IO at least has a lower chance of failing due to a path error.
> However, the problem is broader than just SG_IO (it affects any ioctl),
> and if applications need failover support for other ioctls, the same
> probing can be used.
> 
> This is not implemented on the DM control device, but on the DM mpath
> block devices, to allow all users who have access to such a block device
> to make use of this interface, specifically to implement failover for
> ioctls. For the same reason, it is also unprivileged. Its implementation
> is effectively just a bunch of reads, which could already be issued by
> userspace, just without any guarantee that all the rights paths are
> selected.
> 
> The probing implemented here is done fully synchronously path by path;
> probing all paths concurrently is left as an improvement for the future.
> 
> Co-developed-by: Hanna Czenczek <hreitz@redhat.com>
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

