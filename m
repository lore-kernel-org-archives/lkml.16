Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9141DA21;
	Fri, 18 Apr 2025 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744951912; cv=none; b=Npj7Ml2KIbYEWb0U4c/CrkHRcCrJN37MzYuhyk+E2OR49aub2ok4RD05ewvqyd6clo+6p3arFlrWLSBVirBuGTHaIKMC7NyYmlkm5py/a+js5hEl/dbEUUPbqUUdXqPERisHQwCHagHJUJseKpo05RXXGIML5BYG4Yw9LLb4gaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744951912; c=relaxed/simple;
	bh=jFIKQ9+KNiMcHYPkLli2j7YAuS94viby6REo7p3dVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu2lY3Z1bq1Be9O/p/3HolCwXABd8UCkbGbePdvMtNZBNRT0RRsL+eSX52y73U3D/tJg//EbZ9KbC2WtCoazNQobbvnJ9PmoQVE0kVWNKirZIC5GIIugimglzJ+ui9/oWHYm0340sSP7yGSiTruifVwm9xcP7oETF5bVNjyQIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jI712KEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jI712KEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A45C4CEE2;
	Fri, 18 Apr 2025 04:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744951911;
	bh=jFIKQ9+KNiMcHYPkLli2j7YAuS94viby6REo7p3dVGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jI712KEqX7VHagPSJSEjU6gsULJZnI08kNF2QFTz+86dz/V1XYE6Wwl0DrZ1GVLou
	 I/yDH9OTJLLBkKw8smg8WbDBVLjiWr4UBLwkFm3LhchmKIpXOY05JO4Eavr2iGLaf6
	 VTVJWHyyfauRbxxYnpvlhZ0dHvzrvfpGceMvoZnI=
Date: Fri, 18 Apr 2025 06:50:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial device ids for 6.15-rc3
Message-ID: <2025041800-ecosystem-chunk-1220@gregkh>
References: <aAEmtBNxgCFqA5op@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAEmtBNxgCFqA5op@hovoldconsulting.com>

On Thu, Apr 17, 2025 at 06:05:08PM +0200, Johan Hovold wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.15-rc3

Pulled and pushed out, thanks.

greg k-h
