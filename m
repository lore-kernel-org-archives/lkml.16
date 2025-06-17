Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE8134AC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119248; cv=none; b=o3adczP3YsE340CZuCMIGznGQwB3PN230ixRvZ3cWnLCUTlPejJZBqzSnjQsUYYNgPos2x6g5olWbBPJmF1g36JWn+ayKa8olx0311djEaTzTdpdYHoJB+//SyRNcXyqBRfkK9pX3INb765P+W7IOPLRiZqTr492JHYZSjkXvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119248; c=relaxed/simple;
	bh=hdl+VXvxIxA/POUJOuwdN5+rEpmGRe6/7ZU/wHNP0XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWfgfYkaidy4mYgr1srtSM0iGVTuC76TWW6rwylR94aUXVKRdTAiT0qb3LzC+EIHEbPz4Mgba8sLIUFmVVZP5CUus+cql13nPWRLZSJTXFQ7k4SOMzc+oZn4Hxg02sr0H4Gcjl6SBAXRqIdhDM884sxeZIWeppub/EXX6nLEQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kRj/lqyt; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kRj/lqyt"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a44b3526e6so68510601cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750119245; x=1750724045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U/AnWcOKfG1ycMopbV6D0adr1Z0vRTPoHbbjbeOXSQ=;
        b=kRj/lqytiU4IqgEbrEBurWo1VzJmkdRErSqxikbnwHxpgSEMdGW1Ynlx2tlRdrYmdC
         eup2GpbauzjCU5+JhWw+ygAZaRfS5jj0zOZVoB+uAD2GKzlZiSJaEZSWKKU1zx3Azf8O
         STZSCNTzxi/2v3pWbkqPZAA/7HyNZk0+1GGLhOiBC79e32875ODgPn04lLxIfRMEErGk
         uJ4q0XjLbx7qn0trLABbWhws0/2vJtTzYTgJDspUrIhpCFbexOo5WYIFnmLfEX/Z+mr1
         zTvJL5YIPIcz3nhh1AYpQK6LIMqksF1XdhFuA8+x0V3GCZP4K4Df+rI4xFKb6eXuHgNp
         //5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119245; x=1750724045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U/AnWcOKfG1ycMopbV6D0adr1Z0vRTPoHbbjbeOXSQ=;
        b=cpPdLTM0wfoKQ+h5LMi+8rMzJRDoBxbx3v3QKa8zGzmhA2pCLV6Z3mRTYhS5Vvdr0c
         4EcSNUiSNCspCySoHZ6MX434Cpf7mS31XPimSkn9mwXijR6lzSr2i3RwlQlMx51phEI0
         j9RIC2xhuOfsIgd6196n36XHvvO2gIPJYAu2jI8+onI4ZplPklZY+pIr5bqf5MMvRGlC
         +u5T7y5Ii9QgwXhBXwA8teVA9MsFErI5kx3kuYa617nq9T7dOSFeK6gD8K2+HS4ymlGe
         tKS0eUJmo6CAWM/F+1zeb12qUFn2GZhUzjFBqFznho8PLsCTgantaUkWs7posbXaupIa
         cRdg==
X-Forwarded-Encrypted: i=1; AJvYcCXNSVz3eyh9xyPZDIUa7LFbEBN2iygjWzmBgDY7IXqhEORT8I1gUZ55SLmOzuEP/8xPDApXoqKi3JB3NsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr7ywgdrK9PNbrXwBEwCAYqubQmxhQ/eDJjErHt4wAnX2JB5ND
	6sXku9lP1WYwBLn2ebrH6bJjS/M90ucybU63INUJECMZmatNIs8C/bSVwGwlSVD5OHZsLOGylXi
	jGM9m
X-Gm-Gg: ASbGncvmu9S/u5UKYqrre6gdMagrBxesTNHc6++cjFd3eDofA9YeV2CKQWzPSNeP//z
	qg9MUmNybiAtD/Bk8LzKwecVwZhtgG5JFPXcjiUZIa7qk88De1OE0UvgJfa3yVLNLDXH4aInBfD
	RwE+U1G5an1hqeLfxq9VT1IfAbX7FxKs3u/V27iqN99av3BOCx9Fzoo36jdHnqdTS2iCZeHuwtZ
	0GbQJyTrxj6ZME+gXfihJ56MOhBxu/xmsCuNS97RVtJoCiBJPkftd1I3N+tRAaSpWrSR7OOTTc9
	yM4brIr4dulxUlhYPMVkigVX2O62u/ZI2oSClYg2URXIwtscuZZ4fOfskbamFtuoT73v
X-Google-Smtp-Source: AGHT+IEalKkMP/T50KBaNlCB7i1zPUKzoS0uKSNIot1Lcep6TCOR5ZWOP2PQEfub6PPsxHKYUcoSxQ==
X-Received: by 2002:a05:622a:4292:b0:4a7:5c21:d4d with SMTP id d75a77b69052e-4a75c210e6amr6680891cf.3.1750119244968;
        Mon, 16 Jun 2025 17:14:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2bf098sm54602621cf.8.2025.06.16.17.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 17:14:04 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:14:02 -0500
From: Gregory Price <gourry@gourry.net>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/11] mm,mempolicy: Use node-notifier instead of
 memory-notifier
Message-ID: <aFCzSsw9t0NJ_3v_@gourry-fedora-PF4VCD3F>
References: <20250616135158.450136-1-osalvador@suse.de>
 <20250616135158.450136-10-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616135158.450136-10-osalvador@suse.de>

On Mon, Jun 16, 2025 at 03:51:52PM +0200, Oscar Salvador wrote:
> mempolicy is only concerned when a numa node changes its memory state,
> because it needs to take this node into account for the auto-weighted
> memory policy system.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> Acked-by: David Hildenbrand <david@redhat.com>

Sorry for the late chime-in, thank you for doing this clean up, this all
looks awesome.

Reviewed-by: Gregory Price <gourry@gourry.net>

