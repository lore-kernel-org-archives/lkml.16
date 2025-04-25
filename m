Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D17217727;
	Fri, 25 Apr 2025 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611271; cv=none; b=GdXXdWtDRXYFpIBMEuD260a+HoqpJW9vv2DcA5QOraSgj6Anm6loNlSXEZ9QaNcIbjfdd29lxb/wZR3gONq0wbOlS86XBhsrWJsn0N2q8u1rmSBlFrVJqTBis3W1QY3sZGlzxo0Y4pt+DGAgrLO4bcIqDRk9emJomnYtlxsXDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611271; c=relaxed/simple;
	bh=1CH4qHUx8ps7XC125n31Scc8Qf4jhNLdyHVXzV4eXKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUD49qRo6EeuQ9TFAUMwHeOWm/2Yn8wD8lZF2xoe7tM2U1lgdyqT5k++QXvryWn1LL8YrDxbTiNf2q66JFZGP4CbudIE/AqGTFdIjjlfcdYjQ6JQzsjjxcxfnl+qA2Qb8zghHwa+tTx6oV/VEw7KLMn222HAR7HRp++TeSyFzpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vH/gK2H3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vH/gK2H3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC0AC4CEE4;
	Fri, 25 Apr 2025 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745611270;
	bh=1CH4qHUx8ps7XC125n31Scc8Qf4jhNLdyHVXzV4eXKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vH/gK2H3RriPipo/yahSiTEtHYLVi15fZpBMbAQxK9eOUxXRO8xBZFhkmECX/QEX1
	 qnEYyKxrs/QLkotSATIfdCfqfDlVp9vNPbfHInXe09WcvH1T81HEht3w/bILH/jYU1
	 ZmICs64yTAfecEEFuXra268DBwK2VakOuoKl09xg9r7n8qYAPI9j8Q6On3ZFP59cO0
	 GrWNIlYQOVu2pbW6NlE83E7NzPZGSCknhERNmJUzD0VYpy9zzk3SYndrGcS7v5+K+c
	 9+9BmBNaJgW9ErUOvEtZw3OXZWj7e0LA/k1+c7ZYquIJfMfk7iRN3wOSX7Hg7sibkF
	 2WgjlK1iLL8GA==
Date: Fri, 25 Apr 2025 15:01:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahesh Rao <mahesh.rao@altera.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: firmware: Add interrupt specification
 for Intel Stratix 10 Service Layer.
Message-ID: <174561126817.2897706.8258819500630704741.robh@kernel.org>
References: <20250422-sip_svc_upstream-v1-0-088059190f31@altera.com>
 <20250422-sip_svc_upstream-v1-4-088059190f31@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-sip_svc_upstream-v1-4-088059190f31@altera.com>


On Tue, 22 Apr 2025 12:07:11 +0800, Mahesh Rao wrote:
> Add interrupt specification for Intel Stratix10 Service
> layer for asynchronous communication.
> 
> Signed-off-by: Mahesh Rao <mahesh.rao@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  .../devicetree/bindings/firmware/intel,stratix10-svc.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

