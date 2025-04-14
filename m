Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A70A8BEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744602260; cv=none; b=uwMmiSOzc3pKAZv41pnHlmNvR0V/VIGXSflUUZv2Gd9c6oUx9Rcg2AzxcrmT8qOBFVxQQBHPnwJDJu1zTNzslaGpraVSwbDxr8X1+A0ZvCIfvt0DdgWUs8qo6iH1xqbSsJQGW04GYpskF/5KERiABNqg7Fi2l3+xlCa10rhgXG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744602260; c=relaxed/simple;
	bh=hjHfDvd01Y7NER693jxawxAEd65rKqdpL6ymVXFFQJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+B1TThdfVAh1wcfbNhgFARmZ14YpO1N1s1ljc5WpbpvsbdN6WdBwGuogzGaI1PdIJdjAnSHQZDgpwLKuSB1WAy0AjYn3cPUWEq34ayjXPRUaKuQiKWOvmC2yDsKuPxXdqJEw7JOI3l/N8j1gcjKnqK3lDZU04PdxkDe7+cWZTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AsS6Fqdg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AsS6Fqdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744602257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5uiZWt5jpGYGmxTchGxtObL/N73C3WDD8I4HSPsLcjo=;
	b=AsS6Fqdg5OC+B1CkE6vkaQNHKAv9YfQ/2y8zu9T5Sl7OEi/rvoyTni99VM1TSZps08Q5jU
	nGNBzBlBnNaxyh3SGJ/J7X0NGGDsC3beNABdCBWSUiyyQPJmbw5W625bG1l3V33XaxS3gv
	nTc+6QBSYH13l/e5IJm6k6mvbZm1UVw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-240-XkFGVTbIOqm6wuHYWD-L0g-1; Sun,
 13 Apr 2025 23:44:11 -0400
X-MC-Unique: XkFGVTbIOqm6wuHYWD-L0g-1
X-Mimecast-MFC-AGG-ID: XkFGVTbIOqm6wuHYWD-L0g_1744602250
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37976180AF4E;
	Mon, 14 Apr 2025 03:44:10 +0000 (UTC)
Received: from localhost (unknown [10.72.112.37])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E8ED3001D13;
	Mon, 14 Apr 2025 03:44:08 +0000 (UTC)
Date: Mon, 14 Apr 2025 11:44:04 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, osalvador@suse.de,
	yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] mm/gup: clean up codes in fault_in_xxx() functions
Message-ID: <Z/yEhMF4qDCUjnxg@MiWiFi-R3L-srv>
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com>
 <Z/sbv3EmLXWgEE7+@MiWiFi-R3L-srv>
 <35a93c36-6e97-4b33-aae5-efd1c907518a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a93c36-6e97-4b33-aae5-efd1c907518a@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/13/25 at 10:09pm, David Hildenbrand wrote:
> On 13.04.25 04:04, Baoquan He wrote:
> > The code style in fault_in_readable() and fault_in_writable() is a
> > little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
> > and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
> > in fault_in_safe_writeable(), local variable 'start' is used as loop
> > cursor. This may mislead people when reading code or making change in
> > these codes.
> > 
> > Here define explicit loop cursor and use for loop to simplify codes in
> > these three functions. These cleanup can make them be consistent in
> > code style and improve readability.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> 
> Hopefully we don't introduce anything unexpected ... do we have some unit
> test that could make use feel better, especially regarding end < start?
> 
> If not, could we add one based on some feature that ends up calling at least
> one of these functions?

Seems no existing case. GUP has selftests, no test codes for kunit. I will see
if I can add one, maybe it's not easy.

> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.

