Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABB91A5BA6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954916; cv=none; b=OLewMcqY1Ji/QWrbWrgQZwWkG24tQ0SxwMUTP9b/hcQXT+dH6YqqXNcirpYmfPaIa5PQFt47QPGuCCZ4/Jg3EqwRmLLZzk/ZWxtb7CM3X6GKnK5PENphDTPSHZ82iVNbetDYvXqRTNWPSyw68Nnpcn5eRxWx8OprefPZUSmIJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954916; c=relaxed/simple;
	bh=YPSaecsiFXwDzTGHAFZ+jSzAX3eweeruBqLKgpgEvCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdoRwWdw3w1473YD9Kj0lJmmeoGShhkhz13yvIrnvi0fpxtlkUoq5RuvLRj4mNEXJxF80o1tdzcnNPbp4yBe/u4eMAwCnxyXryA/wiU+kdEjg5u7vtRG1hqrKR5Cyb0vuj4c0R3pe8Dt8hFOB3QPAZF09f2z6ROvXQ3KmhQ2n/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=W9a48pDC; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W9a48pDC"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b7041273ddso218961185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738954914; x=1739559714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhHb/Iyzu9wCbvQ3EuxPsy9WEDtQ71gsxOEbCbrMAfg=;
        b=W9a48pDCS4gt7FtBNlj7uKmO9Pm2RKBBxA9qICSurXf0AhrGc5f1hhwZGIeuFnT/Eh
         QRcWjyALaxu8QteGT5B6VQVJ8ZXe5fLZMEBVDZk/rkDdtqRlF8HcrJjbCwN0QzQy78Ee
         YLMOnUH7IylejaoHt3HLJRFJIc1zc9DZE8gSUYAnn0Rz7nNhc2JStbwQbbBl2/ZUmuXm
         8CTNOlV1/pkv6WWuCp2aVNHycS9d9j9I0v4T6ZxqBCf4dyQ/QVJNNOkRZNvd5/v+tSMO
         gaMmADwnAcZz7nWJziV7K77t6BnFs6Tap9R1Zwr+7tmnhHKX633UTaMlmk/MhKi/Q/Hi
         ZdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738954914; x=1739559714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhHb/Iyzu9wCbvQ3EuxPsy9WEDtQ71gsxOEbCbrMAfg=;
        b=u8XHmCs8dwm8z0ByKxYvYreA2cp5YcEiDsGSAiRFmmyOUQvD1Kx5Qw5ycvrMSNq/SQ
         R1ysjwzJiNvMoxH22kfgPnaeio/Ij7Ca64AZOiKiB/VM+juB0Z7NorL5odJowHPdmVLf
         Kqzl1dg8nABVH1QMhhtKfOa84BNN1v7eltMI9Bek4Fo5mKq6MKegvQjvqsrcdpzZsYCm
         8HY5WBv7d7FqaN1WsUDl9271yNwHrs53jCKWsHbcdFqxHV95ab9PXcFKKJlht24b8pkE
         mD4dPNmQ8mu1xo614Sku9BhjKmrPI6cnEtAvZ0ctOzky4h6EJoLnnFluLmeEbeqYQbAE
         I6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWOfUfJwUCcnQV2oLB7y6zriFxM1NRnvgSBser6UiUZE+br50wRHE6VNMd26nh3A53lCQPOJhq9HinSxuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30z83RSOhPx/1MAMgar0RVq1EQgBJWmvBeHUNLbouZHkQFUor
	qWwDTmDkmKbzbkmThRDiaYE4GQNgheg2OGEb5vscaOc4kEesFJeFimwC5/AI5b4=
X-Gm-Gg: ASbGncs+mO72OG3De4nVGXd6F/kL6ToKQ0CFA/PMO80/2jllgAe++r8FyyC5sHrpASg
	XTAHFRNfBbm0rmaHGoFD1UGI4HpezS5ethcaBppWYX+QmBmq1fCgtUC5lBvDDKvKalz4r6hPJD1
	+yqzczOiV/9ODuk7Cum8tseh3vFnwtqMu57uB396zqr8RtSJct8MmD2EL4wukUi9BRaQpYwwh5P
	eXwqNg1qa2uXV5o3DnuOZ+BsoX+dwMr3M0y6j4jbRR5Vtz8cwTXfZiY7512EV3ezEVIFusu3E/M
	fXA0VG5d0hFPtJ5C/M9hDbKucqJbcPMH367ChGhBzMTqUm/H16h2f5zXeSrofhJA
X-Google-Smtp-Source: AGHT+IGI7NvAKLU4JsJOvorfEjiFHTyYvApddGJTHotUW76EJE4gTICxKMW+ZU1MxMaOyB1msPjlAw==
X-Received: by 2002:a05:620a:2b99:b0:7b7:106a:1991 with SMTP id af79cd13be357-7c047bba9demr630217685a.16.1738954913493;
        Fri, 07 Feb 2025 11:01:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc75aesm19533301cf.64.2025.02.07.11.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:01:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tgTbs-0000000FUFC-1jHG;
	Fri, 07 Feb 2025 15:01:52 -0400
Date: Fri, 7 Feb 2025 15:01:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mitchell Augustin <mitchell.augustin@canonical.com>
Cc: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
	andrew+netdev@lunn.ch, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, Talat Batheesh <talatb@nvidia.com>,
	Feras Daoud <ferasda@nvidia.com>
Subject: Re: modprobe mlx5_core on OCI bare-metal instance causes
 unrecoverable hang and I/O error
Message-ID: <20250207190152.GA3665794@ziepe.ca>
References: <CAHTA-uaH9w2LqQdxY4b=7q9WQsuA6ntg=QRKrsf=mPfNBmM5pw@mail.gmail.com>
 <20250207155456.GA3665725@ziepe.ca>
 <CAHTA-uasZ+ZkdzaSzz-QH=brD3PDb+wGfvE-k377SW7BCEi6hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHTA-uasZ+ZkdzaSzz-QH=brD3PDb+wGfvE-k377SW7BCEi6hg@mail.gmail.com>

On Fri, Feb 07, 2025 at 10:02:46AM -0600, Mitchell Augustin wrote:
> > Is it using iscsi/srp/nfs/etc for any filesystems?
> 
> Yes, dev sda is using iSCSI:

If you remove the driver that is providing transport for your
filesystem the system will hang like you showed.

It can be done, but the process sequencing the load/unload has to be
entirely contained to a tmpfs so it doesn't become blocked on IO that
cannot complete.

Jason
