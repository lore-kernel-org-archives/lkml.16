Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E32BEC41
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153803; cv=none; b=Cn+b7/gHIJweFQ3al/8Cfg2/5rfGTvJ7aWCEsJw965DtC4JwOUOdOyqALibPLm8NkjXDbrG08u8zbs58RFWCCnRiG2XMBwQlQRwn1BVrK3JotQoaatf78zyROjA4s7GYJR5FlgmxofMM1slyTHAzmbgpgmTygs0lR5Lo9YdR48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153803; c=relaxed/simple;
	bh=Jy2ZClgn9VEZaW82iC3qPWb7i5tVsDKsNOqhIwl2Ywk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNVi6g7LQzZdewEFyt2tYyR0ooJAJnr/yWmZuZ1oqRtgz9mg2WOjaEYUphdoULy4T4XBA6t2ykBcY04nQDeK80oV/+wDUBbd3rt3O2iOdu6qnzkqQw/3kotTOUuqsH6TZpi+3CV+Ue0eNSZNbf+9W0HutrlpYcRtMB5grDz+1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJ//vUwr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJ//vUwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747153800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hcoqX5R2MqgY9J6AEcj0986EY9xMkUtFOKieofckVl0=;
	b=VJ//vUwruMuAi6iPhNqABCBrIOMt8DNmZxeAo+sponcy9bs5C867v6jmA4MqZ3SQX4HZes
	GdKWXAQVAN5zc6J0ypLLdBM6JCGPYgAaoLwkf40JsKLOMkLuv79LNdN2dslmJnSutcufQA
	M/XQxN8Text34gLvdxF/SFa6WfJxB5U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-laBsb9sjMnaB-jyEDSvZkA-1; Tue,
 13 May 2025 12:29:57 -0400
X-MC-Unique: laBsb9sjMnaB-jyEDSvZkA-1
X-Mimecast-MFC-AGG-ID: laBsb9sjMnaB-jyEDSvZkA_1747153795
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77F7D1956087;
	Tue, 13 May 2025 16:29:55 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (unknown [10.6.23.247])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBBAA19560A3;
	Tue, 13 May 2025 16:29:54 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 54DGTrpd3643051
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 12:29:53 -0400
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 54DGTpwa3643050;
	Tue, 13 May 2025 12:29:51 -0400
Date: Tue, 13 May 2025 12:29:51 -0400
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
        Martin Wilck <mwilck@suse.com>, dm-devel@lists.linux.dev,
        hreitz@redhat.com, mpatocka@redhat.com, snitzer@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dm mpath: Interface for explicit probing of active
 paths
Message-ID: <aCNzf7MJa-hLQpmv@redhat.com>
References: <20250429165018.112999-1-kwolf@redhat.com>
 <47dd225b433b0df585a25084a2e793344eeda239.camel@suse.com>
 <aCIRUwt5BueQmlMZ@redhat.com>
 <aCLe5UT2kfzI96TQ@infradead.org>
 <0340c51e-6f89-4799-b2f1-19c785a19ff2@suse.de>
 <aCLjPLCztuXhgpnA@infradead.org>
 <d2a7fa68-1890-4367-a2ac-59ec220779bd@suse.de>
 <aCLrbz3bRLwUbA8p@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCLrbz3bRLwUbA8p@infradead.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Mon, May 12, 2025 at 11:49:19PM -0700, Christoph Hellwig wrote:
> On Tue, May 13, 2025 at 08:32:12AM +0200, Hannes Reinecke wrote:
> > Reservations and stuff.
> 
> They should use the kernel persistent reservation API.

Currently QEMU isn't sending Persistent Reservation requests to
multipath devices at all. It's sending those directly to the underlying
scsi devices. The issue here is with all the other SCSI commands that
users want to send to their SCSI passthrough device that is actually a
multipath device on top of a number of SCSI paths. They expect to
get back the actual sense and status information, so QEMU needs to
send them via SG_IOs.

Without reading that sense and status information in kernel, the
multipath target can't know if it needs to fail a path and retry the
ioctl down a different path. QEMU can read this information, but it
doesn't know what path the multipath device send the ioctl down. This
patch just gives users a way to check the paths in the active pathgroup
(which all should be able to handle IO) and fail those that can't.
While QEMU is the driver of this, it's completely general functionality.

-Ben

> 
> > There are customer who use GPFS ...
> 
> Supporting illegal binary only modules that is already enough of a
> reason to NAK this.

