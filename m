Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CACF1A3156;
	Wed,  2 Apr 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615902; cv=none; b=UmvunodwwSQqtGxkOuwo5m+lNOz3IUBnANOpKUFXCcTu0aMzzqzstLTh9ORqIB9AeCiwvCXAw+5mCq0Tb/Diq1ypQX3E1mBJS7QrfGkv4OaIHg9rh23D/cvYN2qr4OfaP4WM6vIl76eiTPQMiUsMXw3LsCZWrwDjEFGdJLWBrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615902; c=relaxed/simple;
	bh=srpIceCgkPJ9GUI3k+Z5EprFXkZTsifVhAWS6EXrPxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxsAJ9VbEESZto09lqZqGQhMXKi6U71fVquYHMpn1/HtIkdM8sb3ODDlQpM0M1wbkrd06ZjOsAqJNqVd8/lAJuJpFljjhhVcmvCTtoiO71zDm0xb5DLqeKtCSwWNJUjNYBDdkU/El1Ae1YAUfu1gi5xtk6IJW4iC2YMSlNBPbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Y+GbdSvD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Y+GbdSvD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=R98V4fWIBT97doh+FdllktzDEOGq5n+le8g6zWGxnrE=; b=Y+GbdSvDxDWc8tKE
	0LSFem4xFryQ4aRNR7zIUKKg4hguo4DCcMWJ8XLnTBXIrgZhcZmi3kbLnYy/9Cpq78V7IV87WYU9s
	osVcVRfM4I2sUJ1Hxq/VZ4r+ZbMsQVLPVVXc5ymPx8WW7nDjcgbcplDcc17dhygQecbdJGsmAaDU8
	OaNVXJ9CW4+9xiNNFnguwsXENfvW2Oo/fgNVWb7akUOODjIJZmxvJluAY+2QlztjMxeuwrPlpQDSX
	uNi2qpyodeU59ZY9mZwDNTH2QtV0RYiBcjgMrlfm7Us5QALmD7Veuv+aM7jT7ln7vrPPiqPDV+R2L
	SEt1rQSuKkAfJga60g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u0290-008dFx-3B;
	Wed, 02 Apr 2025 17:44:54 +0000
Date: Wed, 2 Apr 2025 17:44:54 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: srinivas.kandagatla@linaro.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Remove nvmem deadcode
Message-ID: <Z-13lseyUTqtVhyS@gallifrey>
References: <20250221015841.209458-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250221015841.209458-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:44:30 up 329 days,  4:58,  1 user,  load average: 0.09, 0.02,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This series removes some uncalled deadcode in nvmem.
> The third patch probably deserves a bit closer inspection.
> 
> The first one removes nvmem_device_cell_read/write functions
> that haven't been used in ~10 years.
> 
> The second removes nvmem_add/del_cell_table - again this is
> removing uncalled functions; nvmem_add_cell_table is unused
> after the removal of the Davinci machines.
> 
> The third one removes the remaining nvmem_cell_table code - including
> a function that's called ( nvmem_add_cells_from_table ) - but
> my reading is that from the previous patch there's no way for this
> function to do anything active any more since the list it walks is
> empty.
> 
> Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Hi,
  I'd appreciate a review on this series if you get a chance.

Dave (cleaning up his patch queue)
> 
> 
> Dr. David Alan Gilbert (3):
>   nvmem: core: Remove unused nvmem_device_cell_(read|write)
>   nvmem: core: Remove nvmem_(add|del)_cell_table
>   nvmem: core: Remove remains of nvmem_cell_table
> 
>  Documentation/driver-api/nvmem.rst |  23 ------
>  drivers/nvmem/core.c               | 126 -----------------------------
>  include/linux/nvmem-consumer.h     |   4 -
>  include/linux/nvmem-provider.h     |  24 ------
>  4 files changed, 177 deletions(-)
> 
> -- 
> 2.48.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
