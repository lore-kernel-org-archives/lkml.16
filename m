Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3910F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699280; cv=none; b=PPodxPFp4auFsy11acG2iEuPH7v+ozgsf1jMKJRwGLUrLJl3zwWuDxP5wUP0MZMf3nkF8BUaQ0swQSw3qRdEeDIZyFslxTS1Psfq+fcoiz5Ljuq3NF+1YEtug1Gf38rus0xzqLOuOMYyYxB6FAh3IM1zj63SN+r3rXPaF/eSXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699280; c=relaxed/simple;
	bh=kyx9ZTv5QhPux6wHjdjpZpiuUg8YVuJrGIbwp9i+DBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUVSxiG4InQyXyIkhA+v86TxLX1+CjZdCjS9RgnkCLtGK+M/OQDWBD0+UEPQlF6rdn3eWfOB+2i0LBRzcxfnRZzutdTTfoMcpbEwbbtjf8hxtZvvVZZ0AzKJyAY3r28TMhvVQyk+Pg6s7pqnyIlxn4uU+2bNuwJlMcLxPEYmDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEObrn/i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEObrn/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AA8C4CEDD;
	Tue, 15 Apr 2025 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744699277;
	bh=kyx9ZTv5QhPux6wHjdjpZpiuUg8YVuJrGIbwp9i+DBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEObrn/iMiTZ+OvgyVt4UBL8z5ifHgl4HcvGlbII2FLEG+Sxk56DXZbmAn+9+dzVY
	 JKdUS4MMsHsS0pMyUcoP3y3I3auc2JnXNaaUknbAhGUc7AcWeLGduUKVia4KrrpRbV
	 Eq1TTooU+Z9QPFLsZy7uo+kLTCmnIKobGmUJ/ot5c/f1U8mTWmQhSnXiSYiEJgmcZk
	 EcLgjEmexx6wbEVgoku+V0VeD/2MONZE5RDPTg+3uzWgRzVqaFIXC9bHc9bvs0cRcY
	 HQ3QSCYU/c3Z689jZyITPmX6DcomXtPFD8huesBY78uwDb+wxLyF8FtVpJEJvPaEUW
	 tFhC7Du6IwL3w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4Zyr-000000005Am-48vN;
	Tue, 15 Apr 2025 08:41:14 +0200
Date: Tue, 15 Apr 2025 08:41:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Adam Xue <zxue@semtech.com>
Cc: dnlplm@gmail.com, fabio.porcedda@gmail.com, chester.a.unal@arinc9.com,
	larsm17@gmail.com, vanillanwang@163.com, mank.wang@netprisma.com,
	michal.hrusecky@turris.com, linux-kernel@vger.kernel.org,
	imocanu@semtech.com
Subject: Re: [PATCH v2] USB: serial: option: Add Sierra Wireless EM9291
Message-ID: <Z_3_iVfb16NqGGyb@hovoldconsulting.com>
References: <20250414211437.1905816-1-zxue@semtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414211437.1905816-1-zxue@semtech.com>

On Mon, Apr 14, 2025 at 02:14:37PM -0700, Adam Xue wrote:
> Add Sierra Wireless EM9291.
> 
> Interface 0: MBIM control
>           1: MBIM data
>           3: AT port
>           4: Diagnostic port
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1199 ProdID=90e3 Rev=00.06
> S:  Manufacturer=Sierra Wireless, Incorporated
> S:  Product=Sierra Wireless EM9291

> Signed-off-by: Adam Xue <zxue@semtech.com>
> ---
> v2: remove unused device interface entry

Thanks for the update, now applied.

Johan
