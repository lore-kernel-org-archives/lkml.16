Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E427A107;
	Mon, 28 Apr 2025 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868479; cv=none; b=CRXJpjI4BaqX+Wea7PqzAdCqphQ6vkHa3pAr53CaEnQMOMn7DiqJlyqRzBPKy6jeWP+UsrE7Yq569Mze1/iGIyFC96JIPVkLX+S/sv902rO/1jegaxUciFCK8S0wLxzXUzn9bP2P7/5XrCXCeO263TpB5UVbM0tR5NMyeqFS2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868479; c=relaxed/simple;
	bh=X4YsW+47O/tLhWgNvqnjqL+ONzZdLfEU2yvtRn3gFNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Twpud9C9r9H3jedmTi311pHM1qh9hIrOX76rHGXNtS9g73In36ViWVWrOMKIiPefgIwPpxCHbdFv5QTIYzRz/kra008wTolPNQmQxb1oEuCsVGN9knYk2AZMP3ZvtLqeMWu7cdONj91Db9eIeiC6TATL5xYHRMkaxIY0UxoJPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKUvPVFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKUvPVFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42505C4CEE4;
	Mon, 28 Apr 2025 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745868479;
	bh=X4YsW+47O/tLhWgNvqnjqL+ONzZdLfEU2yvtRn3gFNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKUvPVFfGUnCRUwaQ9I3uSINwRvVcuvaMBax8XGThbRR9elP2zS4dhUrNfLn3Li0w
	 fmjE9Gi80xvAXxHLVceYaZnZ/BL2uvFyU1+1BwFB2qJqAnTEDG025jO5fcHy2L2xkv
	 U4z56lCJhWIPMJheeuG6qbu0VU//gVXzEywQE73a2RLoLOczkH8ttbrq/Te5O47pXR
	 F6a8G1IuUpQk0gXcd7u+Filua/MgxhDv2ohMAz7bhYur6HXzPChgv/JE9E9kf/qNHm
	 znOL+HfNuSrDXD9szMhIeu/cO+hLcDQ9HxPGNKhxATSgMdrIbqp9hHsk1YpzlztQSt
	 9ly8ZG+QlpZoQ==
Date: Mon, 28 Apr 2025 20:27:55 +0100
From: Simon Horman <horms@kernel.org>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: andrew+netdev@lunn.ch, brett.creeley@amd.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] pds_core: smaller adminq poll starting
 interval
Message-ID: <20250428192755.GK3339421@horms.kernel.org>
References: <20250425204618.72783-1-shannon.nelson@amd.com>
 <20250425204618.72783-3-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425204618.72783-3-shannon.nelson@amd.com>

On Fri, Apr 25, 2025 at 01:46:17PM -0700, Shannon Nelson wrote:
> Shorten the adminq poll starting interval in order to notice
> any transaction errors more quickly.

It might be nice to add a bit more colour to what sort of scenarios
this helps. But that isn't a hard requirement from my side.

> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>

Reviewed-by: Simon Horman <horms@kernel.org>
