Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02491F4C99
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726429; cv=none; b=MURccBuMOrnprzO00BCLq2j91TI8OJEMNnfByfz/egkjEDcGR8/Sz2TdYilbYYr+TuAsJLoSOzmfBVqPrO5EgMxk4Q/sTMjKyxkLzXDpP+9JzNfhDftBLaDK8N+cA9/oNZ9gUUzHrcgC4uRjEAhXWYRRJLptzgjQMIAvTrbGAwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726429; c=relaxed/simple;
	bh=lbAtIdT+lueWboEJevmJdvJSMP47DO68E8COrfNi+uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqPv3vzTLW4qStLGObxi9N1q1mcE+E7EgCUpVjA60OcbUtS0POy48/Sg4acPKn69urF31QZTUdaOvSr07lCaqW2vuA9eL1+P0UiVWDiGkpGPFRaQVCDp026OLfslDHNVgwxZxY7jCv/NL4oxjcZmwlLxRQ3wTWsv8clDf6DdXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=unOkTJm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="unOkTJm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B591AC4CEDD;
	Tue, 15 Apr 2025 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744726429;
	bh=lbAtIdT+lueWboEJevmJdvJSMP47DO68E8COrfNi+uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unOkTJm+vRdTSyB83bYznbqg2XTT0xGI16ELr+Ej3Vb1xKXXxddDai11sMr+AaETL
	 S4em4fZzbnZAGZpX8xJX7nxX5v/X2YnzK0kpLwAgFdmRCySwSPGeZQQD2vNCCkDPtv
	 CAfJ/8rYxOnK/9jnAq1yWscTO7NgM6bBhz1Dqj2M=
Date: Tue, 15 Apr 2025 16:13:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] misc: tps6594-pfsm: Add NULL check in
 tps6594_pfsm_probe()
Message-ID: <2025041530-clinic-genre-35f9@gregkh>
References: <20250401133404.27793-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401133404.27793-1-bsdhenrymartin@gmail.com>

On Tue, Apr 01, 2025 at 09:34:04PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> tps6594_pfsm_probe() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/misc/tps6594-pfsm.c | 2 ++
>  1 file changed, 2 insertions(+)

Someone else sent this before you did, sorry:
	https://lore.kernel.org/r/20250311010511.1028269-1-chenyuan0y@gmail.com

