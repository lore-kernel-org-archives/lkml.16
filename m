Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D81F3BA2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385363; cv=none; b=sSyPUal3OKcMOGFBTpn/kgn6BJO89N1YKT/paWT+DGEtnFFrtKECKVqg20/cnZmlwp9l5fiq16LIk27c73IO0DLaNqv2yfnDZJIstdGzAReTow9lXblxjHO7u19vVXGndohZcoOpAYF/MDVFES6CCkHJS/Cx+y9jKeSSOSh4M04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385363; c=relaxed/simple;
	bh=NWh+5kFMwIQhs4haSoY9IHySqsyuRvNEbunlh2Uijz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6ddXkSjJSf3zZXul91Y5kinqgQ+Rt3vCfoCWvPJnBHoe+nKdVbw4mKx5eZdP4ieBDNsw1CDFrNBm3PX6JZDkCghe6prym+ZRZLQUymEDQ5rUQEkgvH7HYvP2jd7i5Fe8fAE/dFd1U564EPJElpGjovD+08Juc3lallBQkTiWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RHY6+QEn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RHY6+QEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744385361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7OYBZ/8Fkv5a3piJDs/OfzkdA9Ewm+WAOBd9/8eYM8k=;
	b=RHY6+QEn4JZm9FBoJAPiALGcaQoUAYw98w2/+uMn5snVObNQOvipbIQbqbL5CkV5Eb+Lh5
	czRKHgPHiUveEMot7MpZ0A+BDt988CkGMekRnC5OkOjLlp/WsmHZj+geuUwi84KfQrhxF6
	XLa1/QhOuPAM5LwCQIVeDKclGDVZfI8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-27kGs9ojPB6lXtK3F3ooaw-1; Fri,
 11 Apr 2025 11:29:14 -0400
X-MC-Unique: 27kGs9ojPB6lXtK3F3ooaw-1
X-Mimecast-MFC-AGG-ID: 27kGs9ojPB6lXtK3F3ooaw_1744385353
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ED76180AF66;
	Fri, 11 Apr 2025 15:29:12 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.222])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2AA751956094;
	Fri, 11 Apr 2025 15:29:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Apr 2025 17:28:36 +0200 (CEST)
Date: Fri, 11 Apr 2025 17:28:32 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Lennart Poettering <lennart@poettering.net>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Mike Yuan <me@yhndnzj.com>, linux-kernel@vger.kernel.org,
	Peter Ziljstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/2] pidfs: ensure consistent ENOENT/ESRCH reporting
Message-ID: <20250411152831.GH5322@redhat.com>
References: <20250411-work-pidfs-enoent-v2-0-60b2d3bb545f@kernel.org>
 <20250411-work-pidfs-enoent-v2-2-60b2d3bb545f@kernel.org>
 <20250411135445.GF5322@redhat.com>
 <20250411-abbitten-caravan-ec53428b33e0@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-abbitten-caravan-ec53428b33e0@brauner>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/11, Christian Brauner wrote:
>
> I'm verbose. I hope you can live with it:
>
>         /*
>          * While holding the pidfd waitqueue lock removing the task
>          * linkage for the thread-group leader pid (PIDTYPE_TGID) isn't
>          * possible. Thus, if there's still task linkage for PIDTYPE_PID
>          * not having thread-group leader linkage for the pid means it
>          * wasn't a thread-group leader in the first place.
>          */
>
> :)

LGTM ;)

Oleg.

