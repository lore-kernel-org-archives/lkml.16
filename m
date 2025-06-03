Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC614F5E0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948540; cv=none; b=nATlPkZvT4JyvvetCvxjmPvkEUE2zYjV6h7NEDi6ghO2rileHjY3XMyNA8jBgo6IGqhtcV68+IZ/D78xDUsGBIJVk4po6Gaha3Fmaj2fAkors69TxpuViDs3f7BYJ5Vcs1F175LUHN+oU85ddsRng9IwukShFgedSSkVaH/CWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948540; c=relaxed/simple;
	bh=B+ui5lcCQ78rPpm4cKrkMYRnurKnWhEdaqjnTHyue4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G869cV7zPY+Z6NMptqXEgKlHlUT7Ayrs/2z9+SqquTef4uzXs3p6Jr5VM5icyj91kOJHAdGUqnrk8weeFVbVb5qSJP9MWePQwJf7w31OErHQRsvi9sO8tsf9K+crWFHETPtyrpuXP4yo0/yNI3LQY1+OliTWiXTAIaoZoXQMpto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZRXnBMB7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZRXnBMB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748948535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wQ5BcGXjRwsj6/hcoXpBN/g6LN6iRqFAvntQX5XvCpU=;
	b=ZRXnBMB7GwW2Kdco9itSzIOO6jFxGFvQm6tmOb0QWPfJVnK3iugeIzeMLtismr1IubA/E3
	GnTTKw3VJtM6PrMlCOdbp4Agl6TqMQ7hcoBueLSfJ7z5DJ/kPLnfMFJ7X8DRRGUNmogQY1
	MmNMGL1DGdNmmFIXEq0WmtD5UK7TDIM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-9zuB8_OqPZWhpRAKD_cPpA-1; Tue,
 03 Jun 2025 07:02:14 -0400
X-MC-Unique: 9zuB8_OqPZWhpRAKD_cPpA-1
X-Mimecast-MFC-AGG-ID: 9zuB8_OqPZWhpRAKD_cPpA_1748948533
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 416031800980;
	Tue,  3 Jun 2025 11:02:13 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE32119560AB;
	Tue,  3 Jun 2025 11:02:10 +0000 (UTC)
Date: Tue, 3 Jun 2025 19:02:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Jiri Bohac <jbohac@suse.cz>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, Philipp Rudo <prudo@redhat.com>,
	Donald Dutile <ddutile@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>,
	Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH v4 5/5] x86: implement crashkernel cma reservation
Message-ID: <aD7WLv86BOVS+GPm@MiWiFi-R3L-srv>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz>
 <aDoVhDc11ZcJyHm2@dwarf.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDoVhDc11ZcJyHm2@dwarf.suse.cz>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 05/30/25 at 10:31pm, Jiri Bohac wrote:
......snip.. 
> @@ -582,7 +582,7 @@ static void __init arch_reserve_crashkernel(void)
>  
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>  				&crash_size, &crash_base,
> -				&low_size, NULL, &high);
> +				&low_size, &cma_size, &high);
>  	if (ret)
>  		return;
>  
> @@ -592,6 +592,7 @@ static void __init arch_reserve_crashkernel(void)
>  	}
>  
>  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
> +	reserve_crashkernel_cma(cma_size);

Wondering if ,high|low is still allowed (or needed) when ,cma is specified.

