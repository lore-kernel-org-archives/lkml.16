Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86DF25E475;
	Wed, 30 Apr 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014798; cv=none; b=bpBR6+nuHBQMVuVneCCywEPe+Zic0UdALLyOzzMZAvAJ+ADjLPuEQs93qM3n82W80tb3X0gbaO5zWwidbRQQHxzOqdWBOPB2Scbj/CpVrD9Oh7UzkYmweqISt5NsabBQMoyjOE1gB2VLJJUED+ra+lwmoLthtM+nJKzBRFu03NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014798; c=relaxed/simple;
	bh=l6yyV7708WESzqH5cph/QyrGZANX05TrIxVflajbigQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjmAD9tZhx7oPxjNEeKT88Bsa6uqA6kuJYpkUyNwslrvX5tX1SH85+142KkCctNR40fIXMoEtuybn5Rj/Ht4sP6ZVRLrzt5lO4M+EmT5HIwc2/S280GsQynki6cLJFNdQGF+/RqHXR4BDO+5ndpmBr8pUJ3LjYRrT0eWaPWpfpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NhVfFUY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NhVfFUY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9E3C4CEE9;
	Wed, 30 Apr 2025 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014798;
	bh=l6yyV7708WESzqH5cph/QyrGZANX05TrIxVflajbigQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhVfFUY849X7mBJQbDGAzkxoLxHd33/qndUVW/vDuOQk7DPyqw/v24lntg3njLhJh
	 3KdYSrdJkbqLX/FOnzEZxIvrXQbqCoxezC4RFBXVjdoUx4zdV6Of+m2BCoJDvsQqTF
	 YpJkYpj+XYJ3FtLpwAYurcyVrU7Ly1fQmJoeearw=
Date: Wed, 30 Apr 2025 12:57:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: Re: CVE-2025-22029: exec: fix the racy usage of fs_struct->in_exec
Message-ID: <2025043019-cash-amicably-b5e1@gregkh>
References: <2025041655-CVE-2025-22029-349f@gregkh>
 <aBH93qMAhgMEGDAY@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBH93qMAhgMEGDAY@tiehlicka>

On Wed, Apr 30, 2025 at 12:39:26PM +0200, Michal Hocko wrote:
> Based on a follow up update from Oleg[1] I would like to dispute this
> CVE.
> 
> TL;DR version
> : with or without this patch the "if (fs->in_exec)" check in copy_fs()
> : can obviously hit the 1 -> 0 transition.
> : 
> : This is harmless, but should be probably fixed just to avoid another report
> : from KCSAN.

What is the link to [1]?

thanks,

greg k-h
