Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92570831
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884165; cv=none; b=SCIA36tmpecR5biy4n98W2vDTMR+b2TBVz/tEQffgEndi5xPiU39sOzWeqDz9vzCPEuyIbUSPZrVnCNWMwguAvcf+D4eDp+teczmWNehpYSIjBSvH0hpe+4YGs5pI0r0zhZBad6oTvpnUTj5yUyTe94cCdGGERDxvYCUdWz+Ci0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884165; c=relaxed/simple;
	bh=RPecJtYrTRe3sMGzhINU2fSMF3oytGDr3+63rCcMlYU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=BrmRB3P293wlLgjPgj6qujXGlRDzRZn8enlpCOAhvXCXh0J3ajXwXSBMc1Q5qBnAOsLQZV/pFT6HqkvnYJEzvIYWJfTwAXKQs0+Vsn6pvAnOIPclhLyuUcLA829dISCW2SgZQhoVLUJO/xtB4tR/CqjeKhl/ywHdBXr1lOZYQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAsemGmP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAsemGmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45BDC4CEE4;
	Mon, 28 Apr 2025 23:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745884164;
	bh=RPecJtYrTRe3sMGzhINU2fSMF3oytGDr3+63rCcMlYU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZAsemGmPkNa4upqFCm9RXc0nbaLwySd/YF+c9pdyTX6MBbIvvKZOWM+cIe7Ing6Cn
	 4bmHkIdnRK5ossvGL/g49JttGtATiuBGfh6bMZ1Ch+vUmdv/l7CPXx05Zrgg4zNUw7
	 0wImbPKFICmbAyX/TqcSPR/MdhlZyX9RE4QpJI5Kx2NVnK8+00AeXqth7DFlFA/VAv
	 pM9TYdXY2BYsHOFdCESyTEhPJhnQQTyk31WUTrkE9FdB2CVBaTnMhfcdXhB+I0IH9A
	 jZIQZSiD15BgGDoMPs+GtcIj/UwtRKdWWqesbCm2gWjl2IFnNywfyXkOxEv1PEv8F3
	 WQmai7Iq+oB0g==
Message-ID: <1de0fc4c00120ee6541693d13f7b8f9c@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250319092951.37667-37-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org> <20250319092951.37667-37-jirislaby@kernel.org>
Subject: Re: [PATCH v2 36/57] irqdomain: spmi: Switch to irq_domain_create_tree()
From: Stephen Boyd <sboyd@kernel.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby (SUSE) <jirislaby@kernel.org>
To: Jiri Slaby (SUSE) <jirislaby@kernel.org>, tglx@linutronix.de
Date: Mon, 28 Apr 2025 16:49:22 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Jiri Slaby (SUSE) (2025-03-19 02:29:29)
> irq_domain_add_tree() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_tree(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.
>=20
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to spmi-next
