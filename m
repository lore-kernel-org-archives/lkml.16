Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A3161302;
	Fri,  4 Jul 2025 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639519; cv=none; b=ugfUuRQdjQi3bXrMYujykmbI5j1V/wHikBlc+CK2fQDfmxPhl/g2yFeAfE8nVVggD3zTwnyQsYTp7opEgbIoaxYnXMld8pSmA+m3Tl9JjykR7u/fIbCEeVeEGSqDkDnjnxLey8xj07wdcDJ6Wuo7jYZjbLhjNgBhmBojRoSrzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639519; c=relaxed/simple;
	bh=+5DmzQLPza93gOMD8f0BTpUxdlPMXYwaa3qhIYuLHYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWKXmcKA3zhNqHPzgtLBpgEJ2ipxDgwEBn3G/EXaRPR55V9AcFqpa/wIGG1VObZjnoDqRbjLzkm2EYvlJy7++gAZ5vrM1OnwqWPRLLd/rm17lWUTTukW1R4XfuMpyVg4JebjMwwxwKEmeQNUaq4dWLyysefoNdgnKIAji2f+rxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQz+ZRWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQz+ZRWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3E5C4CEE3;
	Fri,  4 Jul 2025 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751639518;
	bh=+5DmzQLPza93gOMD8f0BTpUxdlPMXYwaa3qhIYuLHYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQz+ZRWI7/hwV16HU05Q6HdQ8/j83VtY5qZBnkCtghe1J/maiZUQ9H71dOGjG0xe7
	 pht4KQHCNQkaLAEsPBCMky3GEwyhDsgR03xBNA+PQkBh5Ab1sSO8RY3FjwJ4P54ntt
	 EjM6TwpcSnIAcsNbflJWuetBqySHQitVEmxAwX7KmmSp4eSNlKuqvkEI1hvX5uCmcJ
	 RM/o6HCY/Ka3c9VbB0EwRjkh58YvlRwUCqdLenzK20Hxkkh3EafFFl6F36/xFTBQUM
	 iMP2Al27Hqy9HX05o/aNxVPFeevsI+2mDMSkjE25mblunx/LHs3pNAfIBc5wYnAWmo
	 ftk49pulHJmGQ==
Date: Fri, 4 Jul 2025 15:31:53 +0100
From: Simon Horman <horms@kernel.org>
To: David Thompson <davthompson@nvidia.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, asmaa@nvidia.com,
	u.kleine-koenig@baylibre.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] mlxbf_gige: emit messages during open and
 probe failures
Message-ID: <20250704143153.GY41770@horms.kernel.org>
References: <20250701180324.29683-1-davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701180324.29683-1-davthompson@nvidia.com>

On Tue, Jul 01, 2025 at 02:03:24PM -0400, David Thompson wrote:
> The open() and probe() functions of the mlxbf_gige driver
> check for errors during initialization, but do not provide
> details regarding the errors. The mlxbf_gige driver should
> provide error details in the kernel log, noting what step
> of initialization failed.
> 
> Signed-off-by: David Thompson <davthompson@nvidia.com>

Thanks for the follow-up on v1.

Reviewed-by: Simon Horman <horms@kernel.org>

