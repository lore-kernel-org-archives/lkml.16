Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1F215073
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684556; cv=none; b=YGjmz0zw4Kn5ZPka3W5dpEmiF6Uat8gXckBT3qiS+JQstVODoeVnLnCR9Ip0zdsOW1P1uLwNrBS2W+Hn87ccHLzvHN8sNolcfbF8srg9NUj5d252T1E+iMx919XstwqArBB+Rda6cajm79WfZFeb2DVkszcNYxHWNnr4pahqbyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684556; c=relaxed/simple;
	bh=PcHimLdF0m9I1OPXBEq8+f8x1JXxleTVaMhwUes7bgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZkoFpb+U2p7+KzU8Gqfo70l+B/f8xD0wepW0DRhA+EBCMHLPr1g7Qt/PKKNXCoFIx2jus+wn+NMFi5ZXhSLNyd7f2ubRcUXpg0DbBL+5+WfbDcDFPZmHPTOTle5AB9xhWOzyqg+2U6hU3UfAl4WjAZytvfGHDGkqX2hVamCaFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6gdFHNu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X6gdFHNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738684553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcHimLdF0m9I1OPXBEq8+f8x1JXxleTVaMhwUes7bgI=;
	b=X6gdFHNudtGY6g3hyDGpIywhGd1qv/NTxrJYsEmMoBuYu2cWIoszFOGQU3oDUbiCjV36j8
	W8s44acFUDMwlIrbcdg4AqEOtQSj/zpFoQcwTLXpGH6O5npFp8MZjCnyJOY8LGAjINpKGH
	NcTzDsGgaivJYAyYGkxfCKL6wNApv0g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-TJQP98TPO7KVDhLtxX1lGw-1; Tue,
 04 Feb 2025 10:55:50 -0500
X-MC-Unique: TJQP98TPO7KVDhLtxX1lGw-1
X-Mimecast-MFC-AGG-ID: TJQP98TPO7KVDhLtxX1lGw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D3601801F23;
	Tue,  4 Feb 2025 15:55:48 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.214])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E87BA19560AA;
	Tue,  4 Feb 2025 15:55:42 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  4 Feb 2025 16:55:21 +0100 (CET)
Date: Tue, 4 Feb 2025 16:55:15 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Oliver Sang <oliver.sang@intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pipe: don't update {a,c,m}time for anonymous pipes
Message-ID: <20250204155514.GD6031@redhat.com>
References: <20250204132153.GA20921@redhat.com>
 <CAHk-=whwYt=hRk3EG7ASM-=xi3Xp7f82Ltqa=dtbVfZnGhN9ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whwYt=hRk3EG7ASM-=xi3Xp7f82Ltqa=dtbVfZnGhN9ow@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/04, Linus Torvalds wrote:
>
> IOW, we should have "anon_pipe_read()" and "anon_pipe_write()", and
> then the named pipes just do

OK, will do in v2.

Oleg.

