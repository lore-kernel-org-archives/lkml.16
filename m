Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33814B06C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501134; cv=none; b=uVE62FwnLiGTfQQ9AOon00bMqxoPug5Itq12OqzSdLl+cYJp1Aqq/2yV5bV6BFrDMyxZAlTwOHn6lPV2jfaz8d8bqq9mH7254TcK9iRDi+ZyVFa5bMoK3gbcF6H2sRgLhMVdI+JkTnLCRvMsdZF1QICrZ09DSkmay+EBewYoME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501134; c=relaxed/simple;
	bh=QR6Lgp6g8I4WxSKtSuW9v27j0eErgzOd2nwqrk0jWcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Snp/haWsL1j9gsipZeCXgjlmTml2YsdmpxSiUdKWEM24htGI+qV7TlVPKf0CaG76p0VYnU8nUnG3Fgm/3GNK96EhCJPXrEnQshoqpT7CfoJ68ubJaX79wD6nV4aiT62MZ7sNtgaexZbAN+JSP/hHeh7GNmsNhgC4IGz7cf8972o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHHal6/B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHHal6/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745501130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T8CoeYLwXY5xNUurE4zhol3ZeibZlpZ2K7VrxvLFf+I=;
	b=fHHal6/Bp3ry0WedbuY5YTtf+7iqfpHQTcLHmTVpy1AszHZSQz24Od9aSyAPIyKKJ8+FwO
	RoBOjy/HkmGEL6cTDvhVfQ/8/HLdynb2yRaCsaugrPiB0RNOteDaygIUBcmzG4G5X5mGfv
	/QtWRhpDWGQ7shjIQVZ1/4bRHz+Dev4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-_al3xsiHP3ekhfK1BIj1Gw-1; Thu,
 24 Apr 2025 09:25:26 -0400
X-MC-Unique: _al3xsiHP3ekhfK1BIj1Gw-1
X-Mimecast-MFC-AGG-ID: _al3xsiHP3ekhfK1BIj1Gw_1745501124
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FDFD1956094;
	Thu, 24 Apr 2025 13:25:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.93])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 68C7B1956095;
	Thu, 24 Apr 2025 13:25:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu, 24 Apr 2025 15:24:45 +0200 (CEST)
Date: Thu, 24 Apr 2025 15:24:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
	David Rheinsberg <david@readahead.eu>, Jan Kara <jack@suse.cz>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Luca Boccassi <bluca@debian.org>,
	Lennart Poettering <lennart@poettering.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Mike Yuan <me@yhndnzj.com>
Subject: Re: [PATCH RFC 1/4] pidfs: register pid in pidfs
Message-ID: <20250424132437.GA15583@redhat.com>
References: <20250424-work-pidfs-net-v1-0-0dc97227d854@kernel.org>
 <20250424-work-pidfs-net-v1-1-0dc97227d854@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-work-pidfs-net-v1-1-0dc97227d854@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/24, Christian Brauner wrote:
>
> + * pidfs_register_pid - pin a struct pid through pidfs
> + * @pid: pid to pin
> + *
> + * Pin a struct pid through pidfs. Needs to be paired with
> + * pidfds_put_put() to not risk leaking the pidfs dentry and inode.
      ^^^^^^^^^^^^^^

pidfs_put_pid ;)

Can't review 2/4, for other patches in series

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

