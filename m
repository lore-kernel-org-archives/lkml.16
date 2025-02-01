Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974F1CAA84
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738431982; cv=none; b=E3X9gJf9To2WjdsB1l499Fsrpoyw1Dc3m5SIWXwZ5v5ol+QHbgbTag9Ty8cwkGbI2yAxYERlzt/tBKBfxbAI5XbWGxFTi+OmKWRGhdHvJsXwAOu8xGCk/3FHPMbxezK2CguKCp61SSnhVDGtZ6fCYrftbqtLb245ZBV8PGeNWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738431982; c=relaxed/simple;
	bh=60VPXtyvSWcUIwdHYTaGCZ8APquOEp+cO+t3vu/RDjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSQosQZw20SPBCEh63pgrd4eK26Of3oOGz/C8Epylz7wemPa9t9Re4JAhmXcWlxV7cWsO+I7z1AU/CAFzIoX4Xkr4gurBcOy4KwxSdmZe7RqxV8B0Zk5c92MBxbieu1qTfOrqgLO8iJ9+zEYKGfmCDgoD6RfXlghNnvdgNUtw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqBSkujf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqBSkujf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738431979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pjei15Oz8AaRbxwfkWGA5XxN54EwCFxMTNKwBCROQYo=;
	b=OqBSkujfhOpdLjTZcYIwE0HBU/x1FctjeRhTMzrBtvDKfxR+ni7rVC1M3hf4G7s0NBk/3L
	VbSfkZNHymq6QeUOGjJxY3kQVjkeXAW6EZMbgi4gZ616dfEMG7STgMN4H6FGPZq6RuhcHg
	SfFyT4FrpZYzs9LCdv2AR2qDgI55BBI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-wWCgrnzsMkKb4kY7vnFXRA-1; Sat,
 01 Feb 2025 12:46:15 -0500
X-MC-Unique: wWCgrnzsMkKb4kY7vnFXRA-1
X-Mimecast-MFC-AGG-ID: wWCgrnzsMkKb4kY7vnFXRA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A592518004A9;
	Sat,  1 Feb 2025 17:46:14 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.16])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1A148180035E;
	Sat,  1 Feb 2025 17:46:11 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  1 Feb 2025 18:45:48 +0100 (CET)
Date: Sat, 1 Feb 2025 18:45:44 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Message-ID: <20250201174544.GB26042@redhat.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
 <20250201163106.28912-7-mjguzik@gmail.com>
 <20250201174203.GA26042@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201174203.GA26042@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/01, Oleg Nesterov wrote:
>
> However, shouldn't this patch also remove the comment which explains
> the possible lock inversion? Above put_pid(),
>
> 	/*
> 	 * Note: disable interrupts while the pidmap_lock is held as an
> 	 * interrupt might come in and do read_lock(&tasklist_lock).
> 	 *
> 	 * If we don't disable interrupts there is a nasty deadlock between
> 	 * detach_pid()->free_pid() and another cpu that does
> 	 * spin_lock(&pidmap_lock) followed by an interrupt routine that does
> 	 * read_lock(&tasklist_lock);
> 	 *
> 	 * After we clean up the tasklist_lock and know there are no
> 	 * irq handlers that take it we can leave the interrupts enabled.
> 	 * For now it is easier to be safe than to prove it can't happen.
> 	 */

Ah, sorry, please forget, you did it in the previous patch. which probably
needs some more discussion...

Oleg.

