Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD101D618E;
	Thu,  8 May 2025 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728828; cv=none; b=C2htkNlOp74ogFp+lAGsdZEvxyX610B+pzfaPl5JPnrXDU/PKCQh+YLbT0nwK8ed91a/VfqA2cB+kSbHfSZIBmZLz/QXzm+YlqIQ/7Y7mW0tQGTcpv1xjpEZpgQw71XsbJWUNto729MDgccvg50YrRyAD7mBKcjmULvrW55V5jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728828; c=relaxed/simple;
	bh=Ruj0u8rskGKdo7w3BekulUpkYg71z28HR9DrbXnxtOk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=N/+Bu+bgEelkAJVxSBG4f9TRynEYEKkDOXusU2otF90Wx3mLUmzIpMMToDCVoLOYKv4maJpk5PfQm4yiZ8RuWqYZKy7lyE+IWplltioVE42jet6rjICpahPjq620omSi+4ypVM/CJbtKkRYigkTvpDQPRAq7Sutm25kJzG6ehVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlCGJeaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlCGJeaX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D35C4CEF0;
	Thu,  8 May 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728826;
	bh=Ruj0u8rskGKdo7w3BekulUpkYg71z28HR9DrbXnxtOk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XlCGJeaXIyCF67cYot0aGES11MhDa2HVYGyGEncQrpiMYtOmQBKqaFSLDlM5bOxrt
	 2L3ONDp4ruVRR33DM6csVTzZjKqp9svGze9PyXaUWh8fWnRqojFbcq7nvsl0Ynsmg/
	 tTVsZ92H2py4KiaFMRnoTFi5IPvcIoZhqgJSaFhSEzf1Z9cK5UHuLC00vpQPOo1jO4
	 W2VyD4RqP2fe9RiODRZ0YwqiJIO+obOyGTD7D1MwzvD20rme/3hM09XXbMuDnxXiz/
	 /tJ7uCYgKnYG+iS2kicl6bRiXHjgSarOpLkx+3JRwrtNvQ9pjffM0pccrCTX/rOlMj
	 nFnVRcSXESK+Q==
Message-ID: <1f51e79bd585701e5bea713b280414ee@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aBHZ1DvXiBcZkWmk@stanley.mountain>
References: <aBHZ1DvXiBcZkWmk@stanley.mountain>
Subject: Re: [PATCH] of: unittest: Unlock on error in unittest_data_add()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@linaro.org>, Frank Rowand <frowand.list@gmail.com>
Date: Thu, 08 May 2025 11:27:04 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Dan Carpenter (2025-04-30 01:05:40)
> The of_overlay_mutex_unlock() was accidentally deleted if "of_root" is
> NULL.  Change this to a goto unlock.
>=20
> Fixes: d1eabd218ede ("of: unittest: treat missing of_root as error instea=
d of fixing up")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
