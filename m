Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4C2376E1;
	Tue, 24 Jun 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754841; cv=none; b=QJp37Jl+B8MCGuOTwQBLqmNZbcdWinpyH0Hcu8bsPXSK3/TrivDa1rCxxubIkLjg4ZmO58cfFW7ibistEFy+68FcPjKRAZ9xuqpNiuGG8qVtCk9fBYXY9kOPitBTcdiGZ4m+K6KJWRyLTWx7q/8uUKxaNGzQXimlqGpKPDYHdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754841; c=relaxed/simple;
	bh=bScyVOHb0BVyHX8S+iERUocAUydzqBlTmi/mEsaMen4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqmitsw+r1YTfP+ebVSXNs3X8RM0DuV1HEFdwPBu6s62BaBsrXzyhKRpGNeX/C7fHTJs6dYOkT7lz2o8mzrVpa5UftEu08hEtUG0ULS2i3DMCEG5gRHe50UVJCpl6LAB1by5E1Tnm4GTl4y5qzThppVCFW1/l3vgptc1fHnguck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQCxN10U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQCxN10U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8268C4CEE3;
	Tue, 24 Jun 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750754840;
	bh=bScyVOHb0BVyHX8S+iERUocAUydzqBlTmi/mEsaMen4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQCxN10Use2yAkGa3Kjq1SwcWBhyK6DXQf/2aOQVeAlpSlNRKKbGoTHgf/reXSBDl
	 peAmuwedcWBdLj/+qryp6fXzpgqGXmbUSaTflHhuUlhxEqx/50q2BZ6lWt9ySbtMPK
	 j6qvlTjmEMb+hYa6zyAfGWhpeqn2WUsFJfC9J9l57J68oNeBKj8TIKOCJaxk9rLFIB
	 2hN+HJheFpsDjYT9PuU3uCNJ+/NiOQMAy2Q94dDPlQiS4CQHER9Og7BzU+NMr8dxnT
	 cHg+ZmwtdTq27unPGg9kUILBr1WI01PdSYJZoqFlzYlOUrmWpt9CggJO1hZ7eFLJxy
	 DbZJmoOEl4vCA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTzJG-000000006Pd-2XwX;
	Tue, 24 Jun 2025 10:47:18 +0200
Date: Tue, 24 Jun 2025 10:47:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Foxconn T99W640
Message-ID: <aFpmFk-t5430Tkg4@hovoldconsulting.com>
References: <20250620035721.6450-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620035721.6450-1-slark_xiao@163.com>

On Fri, Jun 20, 2025 at 11:57:21AM +0800, Slark Xiao wrote:
> T99W640 is designed based on Qualconn SDX72 chip. There are 3
> serial ports to be enumerated: Diag, NMEA and AT.

> 0&1: MBIM, 2:Modem, 3:GNSS(non-serial port), 4: NMEA, 5:Diag
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied, thanks.

Johan
