Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424B2DFA41
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735724; cv=none; b=sv7xWURul/Ces4G8GdYBoaQ7DUEydsIywdQdK9/lw/bdGLN3Bj05RqLfuNMrzYyXwOGWwcqLankd6i0dP4x60Im/AkfRii2EX9VOVDAEOF2EHdY1KtFYRhyKLgGOL60ez4PdG3ptFgfqeO4nj/8ry725W/jvllHNdznyPhli9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735724; c=relaxed/simple;
	bh=yTpA7AQ11YcKdtrDsWS2SyrGSRIfwinkS6yOgTtvrpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMtwlwBH+7I/l2nW/lN2WX8eKNiXGdYZgcXbM4kaISRjkqvLOD3ZVp3y7aFqfcQ9pXnrTUi9WKWSgZLpTGS5hr0LbZH27jliB/fX4KVKLOaca1Rvf+dC3HDBmJt6RevF+AFxS2IwsqcniT3gzXWiCe/qZEATIfqqbaiUPMHa8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W/a0slVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W/a0slVs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE73C4CEE9;
	Tue, 15 Apr 2025 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744735724;
	bh=yTpA7AQ11YcKdtrDsWS2SyrGSRIfwinkS6yOgTtvrpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/a0slVs3M/g1BiyeqlK10m3OwJHk8DHeHq9SZy5Af5F4UwbSzzNZF2pa8sLdMfAT
	 B83xuUVeGC9cU6/JgmGIOMmCn/e02QrDW1leMa4SQxiB5cbe2N33QX98fv9k3A5dF8
	 oaH/Ina3ZvFvFVwJmdhhje3VKSwft0KYms9pyisI=
Date: Tue, 15 Apr 2025 18:48:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <2025041523-sculptor-swiftly-52b5@gregkh>
References: <20250313-sysfs-const-bin_attr-final-v2-0-96284e1e88ce@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-sysfs-const-bin_attr-final-v2-0-96284e1e88ce@weissschuh.net>

On Thu, Mar 13, 2025 at 04:57:44PM +0100, Thomas Weißschuh wrote:
> All users have been migrated to the new const types.
> Change the types of the normal fields, switch all users over and then
> get rid of the transition machinery.
> 
> The treewide changes have been done with sed/grep.
> Based on top of driver-core-next.
> 
> I'm only sending this to the sysfs maintainers. The treewide changes are
> purely mechanical.

Let me slowly stage this and see how 0-day and linux-next does...

thanks,

greg k-h
