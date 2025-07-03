Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442FD1DDA0C;
	Thu,  3 Jul 2025 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511144; cv=none; b=miz76xo7u1TcrGrVweAFkH9ADUM/eN1a67BDegf7XAVAGciBZz6uJ5inWUClZ3Xr5+Rw5Bvhl0FwHUz4tNw5zi58NQLZK7Yyl4LhM4jKHUJYA+n62+yun3u4dPcYkNCZJdxCW5tF8F520CwgKeh/r+JZvMA8jqXd/ZCJqG2EsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511144; c=relaxed/simple;
	bh=gIlQKOltehJA0GXqqvkfztLCqX6xE9KSNSiZvJWLXvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hQMu18Va9pGxqHmCJWMLD7o+fqJ5jTSjUP7HPl7O5KO8IiBnBWiE3OvIeS+CwL6PO2R1WTBDVXxiVTLzcUWQQ7J7VrDnUhKScbv/xsPI3cds7VGkoFrQWGwbPt0RnSiigb9mDSJXEAqf/nFUj1uDrwLEn5QrzOapX9ONQwcGrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HJ5e5xJC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HJ5e5xJC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4496740AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751511142; bh=7Z8hbP3ydaGHaESwOxjWIsYHBU/zxWCa6Efnvt1GFu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HJ5e5xJCo0TUpCQSg6J/rl3b5YAp2tm+HJMM0EoymPyNypb2VRoZKS51+n/KKyrVs
	 eEozvricqtt9p9EwRDTZUvm/40Hfvo8o7tjwlNxulxgiGvf9QY/m+EVEzyOdRhURJ+
	 vNNBCLUXxD76QqE63p4VZtnJ0p9z6cSAQBeGFwS59YXxhyIf66rDln6VUZJbgEw/2n
	 NZqIfhPLjEPNXAH8UrHv4I/OuE7F46EO/Ylc2aWc7e1pYFsQnaHObptn9yulm/xHcD
	 Nq8+InIepNrG/EhIBaB0Z0Pb+wquQ1L02XBY1tGGdgwLEn112h3cnE5GGM6wSUR1qt
	 98C/HgE8RF6dA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4496740AAB;
	Thu,  3 Jul 2025 02:52:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: document linked lists
In-Reply-To: <aGXeyqygzKi2P-kP@archie.me>
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGXeyqygzKi2P-kP@archie.me>
Date: Wed, 02 Jul 2025 20:52:21 -0600
Message-ID: <87h5zum1ei.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
>> +In State 2, we've added Grock after the list head::
>> +
>> +         .--------------------.
>> +         v                    |
>> +    .--------.     .-------.  |
>> +    | clowns |---->| Grock |--'
>> +    '--------'     '-------'
>
> Looks like the corners are a bit imbalanced (single quotes are taller than
> dots). What about using plus instead? Like:
>
> ---- >8 ----
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> index b0586056abb04d..bf92f44d7b2d06 100644
> --- a/Documentation/core-api/list.rst
> +++ b/Documentation/core-api/list.rst
> @@ -148,11 +148,11 @@ clarity.
>  
>  In State 2, we've added Grock after the list head::
>  
> -         .--------------------.
> +         +--------------------+
>           v                    |

One might argue that it looks like a nice curve and should stay as-is.

This work is welcome and deserves a serious review, this wasn't it.

jon
