Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B01C5F0E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124509; cv=none; b=VEFxWylnY6tds/wwrzPUYCFqEU3BXuVglwjmm+jXB5ICiN3bCRb3AVFqZDwFYfJsT1plSu0m4ZGzHcKbh+I0Ch3q0h1LWmoKEFKXHP77Ia28zqaADwe5tYJHZwfktHzQ8UrM8BNq3yfigKSB/v+TJQeUsAR3nQfNxrbSXXykSI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124509; c=relaxed/simple;
	bh=9kRj2spyKPNFwHaCLDgA8I2/TDsPBVMLkpsDtRAXe78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADLfoLhZkBAVC7ujZNYgKIkHuy+lkvi8+r2JyXNfZDQyN/LKzcoTtcpe6kCy/RZkPYTfdz2mkmrVCo8z0+aIYYUd6hHcXAtNGXrhDfgX0wbIcuMQxCf53DWLY8t/cctCKjiGXm6U9mz+bNmO4yZRlNo1YHCkNQbNCG38WDparBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Waw3JEa4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Waw3JEa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744124506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VJhlibnoGKLKtO+j+4h33e2pnR8Ge+2erGKyKrpo/po=;
	b=Waw3JEa4kEiTtqD6NZUX6WSn670StIOtNPW4JnPg9vOLCwGsbak+L1qleQsZmo2ULKThx/
	+vTbkOE5Fm4Gtja113HCQRQK+yqgbXaNenc9uZIJVu8d/d1gx4cmBjsJTX0BtSbqzWB53W
	Cbipt/0RguPqqXpYNHvvb1A6dqAzJvI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-dsSkjsuyNW-JITMTF5MWtA-1; Tue,
 08 Apr 2025 11:01:40 -0400
X-MC-Unique: dsSkjsuyNW-JITMTF5MWtA-1
X-Mimecast-MFC-AGG-ID: dsSkjsuyNW-JITMTF5MWtA_1744124499
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22C2D180035E;
	Tue,  8 Apr 2025 15:01:39 +0000 (UTC)
Received: from localhost (unknown [10.72.112.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C239A1955DCE;
	Tue,  8 Apr 2025 15:01:37 +0000 (UTC)
Date: Tue, 8 Apr 2025 23:01:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@redhat.com,
	mingo@kernel.org, yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z/U6TTyJXjzdiO8d@MiWiFi-R3L-srv>
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-2-bhe@redhat.com>
 <Z_TvDwA6xGfXMiED@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TvDwA6xGfXMiED@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 04/08/25 at 11:40am, Oscar Salvador wrote:
> On Mon, Apr 07, 2025 at 11:03:04AM +0800, Baoquan He wrote:
> > Not like fault_in_readable() or fault_in_writeable(), in
> > fault_in_safe_writeable() local variable 'start' is increased page
> > by page to loop till the whole address range is handled. However,
> > it mistakenly calcalates the size of handled range with 'uaddr - start'.
>                 ^^ calculates

Will fix, thanks.
> > 
> > Here fix the code bug in fault_in_safe_writeable(), and also adjusting
> > the codes in fault_in_readable() and fault_in_writeable() to use local
> > variable 'start' to loop so that codes in these three functions are
> > consistent.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> 
> The fix for the bug in fault_in_safe_writeable() looks good to me.
> But I think that David suggested the other way around wrt. uaddr and
> start variables in those three functions? I think he had in mind that
> fault_in_safe_writeable() follows fault_in_safe_writeable() and
> fault_in_readable() lead.

Right, will follow the way he suggested in another sub-thread, thanks
for careful reviewing.

> 
> Other than that looks good to me.
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

