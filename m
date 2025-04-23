Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E543A28936C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427489; cv=none; b=Z7nKQJNhZu30c35WdrHBWx8iXO26xU0c1io6W8vDF34J1cDiVdIlm9MnO7rXKTjpsUzWyxQWIstu2j5afsmrHyikvCgmogPq9opobREY+w6Q9ZnCzItsIHRnklpika8aqTVlZ1Gv/Zpbqr8MLWmGu6C6Bq7qU13X53OLgfiopBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427489; c=relaxed/simple;
	bh=WcPCU1hSyhgctaeqKm9zoc/Oay4S1DO6JF3Q6paXapA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MieRdR+6yn9Sad/tXq2ZH4HD+vtVBxwENgN5igpGIH/gRvPtRkgqtGzQE3POIehlfVdpXlehwuNOpm5NKWuTBX/OqlHV9JL0lczvxfy5f3HMEQUWzJKzxV34cryRbfDjmeSShZwFNiN3PXOyVHI/4pvQ9uPpq2IRqQyIrQsZiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=H1yjHj59; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="H1yjHj59"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8efefec89so780286d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745427487; x=1746032287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdaxjUBCM/U9au6hWz3Tef+l2xx9Bf4bGZ+yCP5Q9pg=;
        b=H1yjHj59AKngNXBh1rUD7lWAPfD5FNeT/kFM6czTwDSU5Rr2EHzcJ3fg8vUVUDoTDk
         oIAOOfNpnPOXHI/JN1KoQ6SYXFlJVf9KkQ04Ne56HX5SYcBNBHa1w1U6h+dKVBvBMVsi
         IRgw581fZurHX2382eKMZ8ImO2xiBz0T9/Ti/DN9bglnQeBs4Vuy/u3PQUCwzarN01ve
         9ovpwPai02URddtn/20lHY+mv/CODvpa+Zhxj8ti5n2xAPlaqtyez75f77iM5LO28dH8
         l90Ylk86MDP7gCuEme18cUxbWos5xL30Vwm9QSGxIuKmMeo/jgCd29/tEfrwT6ZpKk1u
         Reog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427487; x=1746032287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdaxjUBCM/U9au6hWz3Tef+l2xx9Bf4bGZ+yCP5Q9pg=;
        b=j79LG6KuYvxCTVn3PncAgh08iJ0h2gQ7y3vO0khFWhnwZaVpvQhPwsfsgbbvnyXaGL
         t5AbQT8+SGX4935xwMq6I6+MtAlwL1zVwmoRoZdf2O1s3+jBwT8kQLjSDxvEMIRD+ECT
         5hTEgO0FxOdfKIZxo2OEdSsT7G+k46j3ZDNXvX5CmdFq+qQhh37++VEdNgeVY7s0lWmD
         mZ8HArgbg4YqbS3We16Ap5/BN75s08X6+1FFKZdZBZB10oopbpj4acYLchcK75D47ftC
         W36w8BbB17DCiO+yIvjh78LHoeX0Ne0lrQEreqdG8KkyzgN7KKBrFIfiqOz5Nr8CmA6d
         7ASA==
X-Forwarded-Encrypted: i=1; AJvYcCXN+CAvNWQgJv+Kuv13AaKEfm115C+t6XZMuAx30xEMrL6I5ceGqSLjqJQsWkw5OMx0fMpYG0Cz99qwJpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBKz8qUe3baTSo20XkhMUeJAtikidrigII9YORuJmVPEayT/k4
	ZdgjwQ+cJfKX6o3U+eC0yISesHzCpCTPHOUY9ua3D+EmTeufkMEFVk/4XBO9VQw=
X-Gm-Gg: ASbGnct2jBcothlsfjN6DhdvS5mOEjImzO4Kms3pbKo9m9vFqY7Tr85tI6SjA5Ev6sO
	1ZgXMafBhXEaiSUlJjdPHlcFAAOztZ6VCm8B54ezOqulgnngPXcq0K9KBG+5nl9GX54lYf2ftcL
	zYHaCn7jFVknQCYYSp5+3KiLm6/zlgBI8N5wh2OgzvMgFST3chqpNnooOtnE60AbIKuDpgcCaJg
	eL6EuSd+yRgfm8avuSpPwSOqLRBtl6RefqcCSqSzJuXq0P/upaAQQajc3Mjz5YGB5fkRHTqjee3
	xKMj0RrBe+4NcSK7INmYH3WjNJYJh9ta9+LNaooD7oY3x1zpznzNpU+pxNNUmVkr7d7u/oAYaGf
	2F41JdhvlUc/8yIMbjVc=
X-Google-Smtp-Source: AGHT+IHuXAnn3LD2RsV+POFTEBSnlhfjUnllEISncqMVJ23JzNpd/zkh3NntjclWpZD1eE0LRZpS9Q==
X-Received: by 2002:a0c:ee4b:0:b0:6f4:5dbd:2761 with SMTP id 6a1803df08f44-6f45dbd2822mr85774406d6.32.1745427486686;
        Wed, 23 Apr 2025 09:58:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9f7dsm69980821cf.74.2025.04.23.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:58:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dQD-00000007LGX-1t9j;
	Wed, 23 Apr 2025 13:58:05 -0300
Date: Wed, 23 Apr 2025 13:58:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <jroedel@suse.de>,
	Bjorn Helgaas <bhelgaas@google.com>, iommu@lists.linux.dev,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform: Fix race condition during DMA configure at
 IOMMU probe time
Message-ID: <20250423165805.GH1213339@ziepe.ca>
References: <20250422232650.2737369-1-willmcvicker@google.com>
 <20250423150823.GA422889@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423150823.GA422889@bhelgaas>

On Wed, Apr 23, 2025 at 10:08:23AM -0500, Bjorn Helgaas wrote:
> I think this would all be clearer if we tested for the NULL pointer
> explicitly before applying to_platform_driver().  I don't like setting
> a pointer to an invalid value.  I think it's better if the pointer is
> either valid or uninitialized because the compiler can help find uses
> of uninitialized pointers.

+1

Jason
