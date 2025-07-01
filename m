Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C1D13B280;
	Tue,  1 Jul 2025 14:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379434; cv=none; b=YARllr8AbdMgoMPbBqMs8C/S9ziKUgigdVBFlbIdUTltO7k/MKWbmEp/4fInCgRP7n86Wgc70TCJ/o0o6sgF1B6+GmkG2oBrgPXJ/3Rz5P4zHelL0kO3Hmxd524ntqU9c4qMkMHx0BPYtPiVhhooi1XXYslXFQ4coDqhi73IWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379434; c=relaxed/simple;
	bh=1otYC1ZCfdmHtAOH3WGENWmj+rk1qmoS+dGMk+VPLHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xsg+e9wUFqBTZaj7T4pdPzboul4E4xjZGYbxGeZz3ExarwTX8iVOzGBe7GIxdMIqgShn2ws/NEphPOQA5Rrll2wzgLPJKnKDpRYc+/vHa23cXv6L6Gi5ckzDJ27f5dzWQVw28ff1rkbC84s7kk3Wqiffy/lgEWmy9LP1bZfRlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCPKeQPV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCPKeQPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE79C4CEEB;
	Tue,  1 Jul 2025 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751379434;
	bh=1otYC1ZCfdmHtAOH3WGENWmj+rk1qmoS+dGMk+VPLHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCPKeQPVzQXHSKajcWatVu2utRzYHoOeu8riJ1Y1usxn60dDIKqOv+tCIjR+FbqVf
	 O9Vz+2INfRFm7mzDEFWjql8cMqtJXAzDf5Vk29jOEx9alMB0eDPghtghs/RyffigNJ
	 dWdOB1nIV2DWtvzamH8gFZYjXNc555AGG8evDIEbqsLL3sI/VEYxae7b/E0GG4L6kf
	 bTIk0UFVgbdpstaowqgZsZMjfrpWifFrNtprOfAIKnOZ05fLrcWdC8L2rE1lvJ3tzw
	 JlYK9XT9J8ZFmIdJ8DVf5AjjGSaX5xshPZrsfOvvrULFIfspHvFg1c6SHoHLhsEEi6
	 CI/D/2Ve9A7UA==
Date: Tue, 1 Jul 2025 15:17:10 +0100
From: Simon Horman <horms@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: Re: [PATCH net-next 4/5] net: ip-sysctl: Format SCTP-related memory
 parameters description as bullet list
Message-ID: <20250701141710.GW41770@horms.kernel.org>
References: <20250701031300.19088-1-bagasdotme@gmail.com>
 <20250701031300.19088-5-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701031300.19088-5-bagasdotme@gmail.com>

On Tue, Jul 01, 2025 at 10:12:59AM +0700, Bagas Sanjaya wrote:
> The description for vector elements of SCTP-related memory usage
> parameters (sctp{r,w,}mem) is formatted as normal paragraphs rather than
> bullet list. Convert the description to the latter.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Reviewed-by: Simon Horman <horms@kernel.org>

