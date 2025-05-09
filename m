Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08FF25DB08;
	Fri,  9 May 2025 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819226; cv=none; b=HmZcWf6UQoepaoM+tkoyVvuKkCMs4KagZ0ahEWhP6K8J2xa8yq3knnjqh2wapuJ5jaKVc/FejTZ1zd4J5w8KjRXGTwCcXRXNydkatJYpmws+TP69wp4Cy8SJxMEXwsmfcsgBxLBS9Hthd9Sppca0fpEQZt6YCoNDcmnO2hzpScg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819226; c=relaxed/simple;
	bh=MLsIik8rSIZqB0sClKtB3h2tq9mX7qpq35P9Iwah4n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8AHyCcKAlmR3m1qENLXnxahfPhBsje+JV5Mcbeb+Jywh5lcd/2UiKioQFIVOWG8jdHY/MZGnhNL0SErRY7qVxCBRR0ZSF7Psehkj7egBUD4DDRbNrQ8X3lLJMlFJ4dpNf0MHDaWPYnhRvlcxHMjqsCqiymdK7oh/vtKVhGGMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu3yVngi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu3yVngi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B82CC4CEE4;
	Fri,  9 May 2025 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746819226;
	bh=MLsIik8rSIZqB0sClKtB3h2tq9mX7qpq35P9Iwah4n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fu3yVngij9sQfCAnFnga1csQXnECURWQdE69+oWrbrS5uVFpX4vS56O9CiS1IZBf4
	 87V1btxDtSuI/IbYz+HtjkrrzHC92RVgdhzSULYYqraVnv8+huEThJ0imYWIt6xwt5
	 wJM2LuJigy6iSJQoeuEGQFUQ/ltk3xxz0lBSM2dMaAgRNAqgIp+/JK1NyI+wqTdfGz
	 Am9/JBVUc0YZ1YV4sxZ1i0tSvPJ8moC4vJo1ywpDIXFJOgyiTe1xgT5kx/FktpCTDk
	 lc5Wpj/80uaNRxIxGD8AOljkfn2R1hq6ZsRWoqguf6F3DZFAlp/sF0lS1+HAjQ45qH
	 SDM32yeAzUboA==
Date: Fri, 9 May 2025 14:33:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] of: unittest: Unlock on error in unittest_data_add()
Message-ID: <174681922265.4075953.2607689432689640869.robh@kernel.org>
References: <aBHZ1DvXiBcZkWmk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHZ1DvXiBcZkWmk@stanley.mountain>


On Wed, 30 Apr 2025 11:05:40 +0300, Dan Carpenter wrote:
> The of_overlay_mutex_unlock() was accidentally deleted if "of_root" is
> NULL.  Change this to a goto unlock.
> 
> Fixes: d1eabd218ede ("of: unittest: treat missing of_root as error instead of fixing up")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/of/unittest.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Applied, thanks!

