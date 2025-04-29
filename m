Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689A40C03;
	Tue, 29 Apr 2025 00:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884885; cv=none; b=UowKfvHqMmieEg0RZjFDYU9KSiws7y6BYAUrXznrRIKpgNhyv8hbJwtp5BgI6/h4sx/K6whLPnj2DLkIao57XNP0FTS3b6rZBCRGMdDNnWyz4mg5YzJJVdVvaB9giW6EDudmuF3r2suMgRYdjhdetAXdhRBjxSY4kROUGl/nXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884885; c=relaxed/simple;
	bh=BepnSPfSfuz/cLEYPoAwWLK5MG5OmZJwL66gKjE5vak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cQxPbmvCRn0++rj0vNlGzU8QNKUOwJZMAihK9HzTIYKtJU009e9RgNuGwX4NRe1XZ0bhaEXKzUOvh5nx+YmQIGdLqFMtuDfs2BQeDzyo7dk3FZv34VamzaW+e0jJIKPY9so/2H20A5cLzNO7lYrDM7rtTYf13Jrkh+N5pDxhqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GhxThA7G; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GhxThA7G"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B35041060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745884883; bh=Ihgyfc5T+XChHHM6gidAq2OV9/Qn2Nep9YrsCWMtKXc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GhxThA7G0VviyRmVdl5tUVWP0K6h9NAr940HBPyGWY9GUTXU4eINrP2qNkhTxAwLC
	 ytPfU9ChEa3qyMFCnl1IqOSxqliNvfj6nOqUcmM8yj7HqSjCE4PH0CVQz1zgzIicXe
	 dSL/PvXhWr2Q8wXn7tNhcBOx3FmpO4hWnzrYoEUbbhAQJYP1qt/1PQgw9ZRcM2lJZa
	 RzGcrv+63n6pTqZ8nC+XihgQHhVk8nF/oZL8yJxe0OJ3SdBT7GK28euAVkRkPbVGkj
	 7ALDTUd88y1otME7ni6+kFOmslh1dE79czm2gjvNUJ3OGhT4b7xPWg2GB7aZGWtNwM
	 9d3gOGTkVgQPQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7B35041060;
	Tue, 29 Apr 2025 00:01:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: namespace: Tweak and reword resource control doc
In-Reply-To: <20250421161723.1138903-1-jsavitz@redhat.com>
References: <20250421161723.1138903-1-jsavitz@redhat.com>
Date: Mon, 28 Apr 2025 18:01:22 -0600
Message-ID: <87frhrrg31.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Joel Savitz <jsavitz@redhat.com> writes:

> Fix the document title and reword the phrasing to active voice.
>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
> Changes since v2:
> - Fix another typo
> Changes since v1:
> - Fix spelling of resource
>
>  .../namespaces/resource-control.rst           | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)

I've applied this.  As a general rule, though, "switch to active voice"
is the sort of churn that is best avoided unless you're making more
substantive changes.  We have a lot of far more pressing problems in the
docs...

Thanks,

jon
