Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E528F921
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042723; cv=none; b=Heg6AUWf3Q1N7eqXpq2BMx4lJYjDe4REJfBWELwKTBUX69XlDlyrPqrfdE3HIjsYXWtUC6k25UtLJEvbeCWefiUI9J1U6qjwTZhNty3klxvg59nESrY2XRQ5Hc+s77xbyMnx+NtoIF3w/vbuEj9eQMr7+cyeflHz0QWdoSeU2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042723; c=relaxed/simple;
	bh=rvXbnvojrWj0t5qf0N1l2496RCA+PXVu7TBL/yH4dlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL1BCDctOEQr6zV7RobKjFK9VwJsUxOBgINx5XaApKl51iIsaSfpFMMd1zA3JRhmbxY4FzqtGq+9qJrN4LYgwTOfnm0leutCnCLDmr3C31kfnxPF8cos3YiI/bN+KDCDtMTL8Qhb95lsPo1Avw38uK+rfFk03f7O6+N7ejP9bMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YJi3nGfx; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YJi3nGfx"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58ebece05so34162441cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749042719; x=1749647519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvumSSr0kAfpiV1yWSR9m8AJwroDgT3eD8bEjr1/pKM=;
        b=YJi3nGfxu+FBx6F7BlXqjw9wX1Pyn0Fo9wApE4wKt1CODL6N4+YzMsLaoIZ5hoo3m9
         XfyiJpQwf9E9MqNBF+0JA7lXhIP3V3OEKnxrIiRt1MBypqTlHJvtuJ52UBstTb5lBypk
         ndw/PWA+jxPR/sxtxUe7O0Krh5bChvObHYUeDMcnVa5IjSA9N2ZESD9QDOlfYAaCTegw
         /WTPlXdPaY68+FwfZsNW/FPc1CGC+CNb0w4Kz1GVv3haI7l0aGIZZGx/jYLmFT9ztBTT
         E20NyzTtuKyNpyB/ekQ3bAjalqz/rkTEU91TWPfHTgq/yStUGYhsYtB9wJEfs5hOZ/du
         7ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042719; x=1749647519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvumSSr0kAfpiV1yWSR9m8AJwroDgT3eD8bEjr1/pKM=;
        b=QSJHC+QsBczwD20xiaZ4CmEBGa+aJEcrp4JzCXlarvPYgCpRgxLRbvAnx9bLOupyae
         OWyGGgSA/zb3gOaxiMmz7aSrrkEfTcaODqr5qqmuhM0TBLPwhKlHvAyRjgwEWvKqIAFW
         gB4AUDILl4DmrCXAXdIDDtw52fZxlSvJv8Z2ySU8iyOGaf+z1llBEHR7XODPP/9/EZzA
         hgxeFsPs8ld1QZs31o/EDIw8lsccZNFlqYfEWaggNZH8QkvyuBSRIoMS+6SbACjjUAxH
         /L41JMWNBHKY4XB0pOlnrrGqWDvKmACUnGeMZlVSESBbp6q5TfjXQtx4Aa6YsyrS2jNI
         6avg==
X-Forwarded-Encrypted: i=1; AJvYcCUs46+0fJAYNSUco2lCxvWrhEM6vow0HLka+OYGxzY5nXf10taSUeS/UBQ2iD8kOMiwiVaq0w51BHdMYok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAWiXthinhhrwhwC4W9q4+nYObPG3pAEJxmdcJJSDaWLKmFaP
	sL+T7rSFD5D2xo79eB0S8/AqCfQB1Gj/DCD0zMuew2QgVcNWuUcsYgNRmH8kcE4fs9U=
X-Gm-Gg: ASbGncvc60VCjpp3RhAArx6A3HtXC3AQ1Ga8kKbLoEf+1BFnykUKA94OUzswavH50iD
	raboItBdzL6i+vv6imnhwZUS1/ryBwGH2wDjATR/qEW0QYMjekdVFf5OIzZAvQl7D+uSvzMVkhv
	gWOTpVs42MLY1CHgk6tt9CKSpBukB4K3OQ2gwqUEBu3UMV2/BjOSwoBk+1tpJsbFRn6mEMMxYgm
	Pfqy18ZTz81TAXAjLThN9iBioZXi1akmUHYzE1QSgV3ono25IQrpIZsw8dGphO17hJecbaljels
	ypb6nGI4Se5xVAwweSIDOX4WEJtfraM8a7BxaHi5vdw5cOKSmFETX1WF1d3j6mbQQykwGz9XwmA
	tkcXy/nhQ0vCxyGR9ATFM4eyGelLK9RBCc9ga7w==
X-Google-Smtp-Source: AGHT+IFViWiK+H2tOO63v35Ja1Wc40+ZaMY6s15ANlIi+DfPgSPAbvG84jmAiZkDwFO1NGkyEYYXbA==
X-Received: by 2002:a05:620a:4001:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d219862392mr393114685a.11.1749042719387;
        Wed, 04 Jun 2025 06:11:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e2fc3sm1042617785a.19.2025.06.04.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:11:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMnuQ-000000004kJ-0VP6;
	Wed, 04 Jun 2025 10:11:58 -0300
Date: Wed, 4 Jun 2025 10:11:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: Hyesoo Yu <hyesoo.yu@samsung.com>, janghyuck.kim@samsung.com,
	zhaoyang.huang@unisoc.com, jaewon31.kim@gmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: gup: fail migration when no migratable page to
 prevent CMA pinning
Message-ID: <20250604131158.GA17991@ziepe.ca>
References: <CGME20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55@epcas2p1.samsung.com>
 <20250604095049.4052078-1-hyesoo.yu@samsung.com>
 <fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>

On Wed, Jun 04, 2025 at 12:07:21PM +0200, David Hildenbrand wrote:

> > Instead of retrying, this patch explicitly fails the migration attempt
> > (-EBUSY) if no movable pages are found and unpinnable pages remain.
> > This avoids infinite loops and gives user a clear signal to retry,
> > rather then spinning inside kernel.
> 
> Hmmm, that means we will return EBUSY to the caller. Are all users actually
> prepared to deal with that?

I don't think anyone is really prepared to deal with GUP temporarily
failing..

Kernel is expected to sort it out. We tolerated the existing temporary
failure due to its rarity and lack of a solution only.

Either it can be gup'd or not. There should be no retry.

Jason
