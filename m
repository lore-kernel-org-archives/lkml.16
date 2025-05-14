Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4B28DB65;
	Wed, 14 May 2025 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250554; cv=none; b=BSXqozBFBejv5WdVb4XwH0+dteJfsmQhdSlXZYDOnuT332wcizllfjHAML0k8VgkLmr1KaG/78S0mGlcuZCtZxMmh0RTEjVhkwoYb8T4dABZagaWomHzgsHvbKCMl1R82va4QallYXsiZH2vkb6/BiuwFy35oOL51SV3UWRfU5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250554; c=relaxed/simple;
	bh=Mxf/fj8HDlShT6XSWRVqUTxyBGXLLH7Y8YOPuunmseg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWG+0dICkx180UF6QJMmTBdFC9cNJYs2jBBnaEwznbT5I3qg02gsDwCqR/ABU42P8xxtyRDd0UCO4A8f4uWhWJthNOAEoxPvtGter1736pzAz+TtggjZsyHRJI3wfHTOJr67wgNYmouBSIs/bq1/6Mf4mbXbFaS7zxAfJeb+txw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9qjztrR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9qjztrR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DACC4CEE3;
	Wed, 14 May 2025 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747250553;
	bh=Mxf/fj8HDlShT6XSWRVqUTxyBGXLLH7Y8YOPuunmseg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9qjztrRO3r2XYkq/Xvb9NBlLlOGyVMXE4Qr86Jpe8L4/6evEqi23JDOWbzWieeEE
	 lusz7mmMfaFl3rmot6MoxQmqGI/um0pJSPHS1v1jsOh6GZ6CeBfA5NGO5BwQtPgtIm
	 cdl70nzrARQIwAixc8/8Xq2CLwD4W5MW/syiBOQSN5txbuhiQ5bdCJLDehC9qtFOmU
	 HJcAhvv9hYscIEHCq7ufbDpFBVD59EoitpEaWQl6o3cvStoep4DAFTGDOMZqWtCwQj
	 W1neA/3DPmvja+/rNv9L+A0OUry0CnwWksD0Fbn1KVLxfDm09PCHbt3nqsh00I19Jb
	 89Y1gP4wEO12g==
Date: Wed, 14 May 2025 12:22:31 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: Song Liu <song@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kdevops <kdevops@lists.linux.dev>,
	Jim Zemlin <jzemlin@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	=?iso-8859-1?Q?=22Javier_Gonz=E1lez=22?= <javier.gonz@samsung.com>,
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kicinski@meta.com>, sashal <sashal@kernel.org>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
Message-ID: <aCTtdxuz2jz0cO-o@bombadil.infradead.org>
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
 <196cb1de31b.ef78ff442883955.7374847682594204868@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196cb1de31b.ef78ff442883955.7374847682594204868@collabora.com>

On Tue, May 13, 2025 at 04:27:35PM -0300, Gustavo Padovan wrote:
> We really need to move towards a more aligned testing story across the board, so all
> systems can expand the value they add

The project has its own repo now:

https://github.com/kernel-patches/kernel-patches-daemon

  Luis
