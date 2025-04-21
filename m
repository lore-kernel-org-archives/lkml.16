Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFB7CA5E;
	Mon, 21 Apr 2025 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245995; cv=none; b=fNnzPPXK8PuI52x8Tcq+SLAzqWxieHZuc/5CFFl+UJYYisnJzDtxRAoSb3+dV4bR599uIHqHtjMcNiuIrOHZ9wd2eNt5VbsmeHj0GuS61lequijbRNDJoqrQ+iFEYbp0txXh16lgM/klUhGpMJD362gdIFcPXf6s1gRNckqibL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245995; c=relaxed/simple;
	bh=fND1uY2gjpfQQRDogT/7oqZRixVbHaLhRDvGnUn6o+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1iena2n/HcfNwwjdXLe1gArcP7cdpILxRvMjQ79zw0nwo1JH3Oo7ZZuI4WQQC9tr1VZ05Mg/+v2YcYij9swkx9+Iq1pOt0skkRCCQvTLNWNj534DFTaL0AJV+oB9pglvfoRFbR0c4dXZDEONEhA1COpUl67sOo5RkGdiBkL+2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABzmBIOH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABzmBIOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD7AC4CEE4;
	Mon, 21 Apr 2025 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745245994;
	bh=fND1uY2gjpfQQRDogT/7oqZRixVbHaLhRDvGnUn6o+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABzmBIOHS0VRdm1zfg+zGCByqfrZgdRDkhemOvZM2qgxeC1FmUgbqWxAxrxOMPRfr
	 k+wDA8mOHI2IO+EpFygHKzTdCJGYZGwJnd4D8yeJSDA7n1WWbsxyMD/o3HI/ghgdfb
	 y0azqi++B653q06tLEfcf3Rmmc5xJbcafVavjdzG/dE8kpOshZQVV7GJCp3MCKYGl4
	 w5PRYnELPIJFpCiaUMOGh0ZRHJzuWW8VPzYf/Aq2ksN6tU4RtED0ALIoaN6A2BPDpJ
	 nwc0Sc4QCIdRdoAl2fsrpermYjB5GRR9LWF3J0whiDpk9YRAHcTAg/sCKvmpMnN52G
	 aa/EaGkXdVi8g==
Date: Mon, 21 Apr 2025 15:33:10 +0100
From: Simon Horman <horms@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v1 4/4] net: selftest: add PHY loopback tests
 with HW checksum offload
Message-ID: <20250421143310.GL2789685@horms.kernel.org>
References: <20250416161439.2922994-1-o.rempel@pengutronix.de>
 <20250416161439.2922994-5-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416161439.2922994-5-o.rempel@pengutronix.de>

On Wed, Apr 16, 2025 at 06:14:39PM +0200, Oleksij Rempel wrote:
> Introduce two new PHY loopback tests that validate hardware checksum
> offload functionality using UDP and TCP packets. These tests set
> csum_mode = CHECKSUM_PARTIAL, allowing the NIC to compute transport
> checksums.
> 
> Tests are only executed if the device advertises NETIF_F_HW_CSUM
> support. If not, they are skipped with -EOPNOTSUPP.
> 
> Also register the tests under descriptive names in the test list.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Simon Horman <horms@kernel.org>

