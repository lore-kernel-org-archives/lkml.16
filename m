Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93E3A8CB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604868; cv=none; b=spVdRA5Hh+ai2zpQx6aCfwjDRnSEf95s1OeUi2hSSB/7JjJqPhLkLhCWzwhJGTcsa9W4rW1fhInC0bQxZqFuDVGELYhUmvyvNjTKX73ge6TkhGFNBlorP7uSNWWW3kmKVZHpyZJoGIAI9sWAUBgP/eUZU2PFTQdM7W1fVDUAR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604868; c=relaxed/simple;
	bh=zsOgjL9b01WTJgbOU01dqs5VBy3DnMGRjpcuxmk5XYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnenSIwQkzlgs3ZQ0N8an7T5sUscwGU/OcijOiaCpZEEuuV4xHSKHmnErBHlwjF7GeafxugzqPOfX9mSOnCuSFjin+5YeS5uapESty/RIVQoCKCICHUAk9nBotQBqgk+zW811fIvDtBhAPkiwmBk9xNNPZC+7s3sCtpftZf7ygo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cRiq8hIy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cRiq8hIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738604865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wf8DeKimNBu7vRPukjIt1145Uefa5PAmCrQ1aqwjiXI=;
	b=cRiq8hIyy8hbUezhURWAIF7ylhgKu9l5ACF/TwwlViZve2HGfqd6ORxyTxJEqqvSrKdZfk
	G+kQ9X0l3jaUTkf7S1TmDkunuX4dvZj4aefgyTObUeyft+xKmPqLMwbG9b9jB45qugm7aw
	9Ru31bNY+fDkivda0jlmUcQAosfSHtI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-MaAXbB8UP0Gc73UcxpJgWg-1; Mon,
 03 Feb 2025 12:47:40 -0500
X-MC-Unique: MaAXbB8UP0Gc73UcxpJgWg-1
X-Mimecast-MFC-AGG-ID: MaAXbB8UP0Gc73UcxpJgWg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E282B19560B4;
	Mon,  3 Feb 2025 17:47:38 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.72])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 42BF61800268;
	Mon,  3 Feb 2025 17:47:36 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon,  3 Feb 2025 18:47:12 +0100 (CET)
Date: Mon, 3 Feb 2025 18:47:09 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] reduce tasklist_lock hold time on exit and do some
Message-ID: <20250203174708.GA1003@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201163106.28912-1-mjguzik@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/01, Mateusz Guzik wrote:
>
> Mateusz Guzik (6):
>   exit: perform add_device_randomness() without tasklist_lock
>   exit: hoist get_pid() in release_task() outside of tasklist_lock
>   exit: postpone tty_kref_put() until after tasklist_lock is dropped
>   pid: sprinkle tasklist_lock asserts
>   pid: perform free_pid() calls outside of tasklist_lock
>   pid: drop irq disablement around pidmap_lock
>
>  include/linux/pid.h |  7 ++--
>  kernel/exit.c       | 45 +++++++++++++++----------
>  kernel/pid.c        | 82 +++++++++++++++++++++++++--------------------
>  kernel/sys.c        | 14 +++++---
>  4 files changed, 86 insertions(+), 62 deletions(-)

I see nothing wrong in this series, feel free to add

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

I have a couple of very minor nits, will send in a minute...

Oleg.

