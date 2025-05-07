Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163671CAA65
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660172; cv=none; b=bNHp0NU9Aw0e829vYlIl8A4h+IYHK7wJmfMyZVZN0DWnrbR6UsDJfnPA/QuJIlLhup1u8OkTh3xhBgix7YylUuXmWmn29jq2NYJ9FtjC/iJNgX/taBLB0ieqXC04oA42LGqN+Pw8BFtBXxQxBUzzPIne6wrxXdLQQmxnkE2+EQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660172; c=relaxed/simple;
	bh=PViTldcFrQPvzqvX8GMah1i0OURxukTx46twGfFelq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGWgSjpVlhmqa9kF8yBdEqdIa0fqwxu1aBhrAPbzUHfnLPVEuFchuxBwi4bNZFViZ6DyEdRfhZT+Pukww0GkEEr9x3yZ/X/y9jWYNcsBQHeYOW15zePLqrlV2pnOT7Y9Jq/IKpWQDcmY6ef16nPew9LfLGvHaWyCh835GHt/aBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iXZOoOSI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iXZOoOSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746660168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jphCO6r1E5U6Br7XyDOSL+TUPQ0NZVTExvK29jnm/mg=;
	b=iXZOoOSIVhHg36JvYsLb2SNUr+b1F/N8vsw5CtsG+BJFrErMnqMbDM53eIQmIYjK2dMuCy
	MQnXE+RSFpFtmSn4/EPJ8EgmYPEi6dOgZLPI6RAZDP6THssoi/kFZ5Prd8er30sCvl8Juk
	uXGEF9HADT7hpyEgTjek3k9xS2oTCsc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-UzLQAsZ0O4SbayZTvPfJdg-1; Wed,
 07 May 2025 19:22:47 -0400
X-MC-Unique: UzLQAsZ0O4SbayZTvPfJdg-1
X-Mimecast-MFC-AGG-ID: UzLQAsZ0O4SbayZTvPfJdg_1746660166
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D00AF1800446;
	Wed,  7 May 2025 23:22:45 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09DC1180049D;
	Wed,  7 May 2025 23:22:43 +0000 (UTC)
Date: Thu, 8 May 2025 07:22:38 +0800
From: Baoquan He <bhe@redhat.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Message-ID: <aBvrPpKNz+EJZG6i@MiWiFi-R3L-srv>
References: <20250507150257.61485-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507150257.61485-1-urezki@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 05/07/25 at 05:02pm, Uladzislau Rezki (Sony) wrote:
> I have been working on the vmalloc code for several years,
> contributing to improvements and fixes. Add myself as
> co-maintainer ("M") alongside Andrew Morton.
> 
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for great help on reviewing and giving great suggestions when
I submit patches to vmalloc code.

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2c3be5f61314..0aa8db9d0fb52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25983,7 +25983,7 @@ F:	tools/testing/vsock/
>  
>  VMALLOC
>  M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Uladzislau Rezki <urezki@gmail.com>
> +M:	Uladzislau Rezki <urezki@gmail.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> -- 
> 2.39.5
> 

