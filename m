Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079427A91D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755985; cv=none; b=jfHmzjTb/vYpO1XP0ke7icFsh/H39VAQzHxThqcbjdPNz3+acEMAFVoZivO3Wamwj50zpGxXRstecIza2KnPxQ1Unx/c5+gW76wpvWg8QcVdMKuk3RHDRH1na8Fra681GmlWDewvY31nuOdxj3WcMXvIQWmr8sRBs3JLcz4Jgd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755985; c=relaxed/simple;
	bh=P0wcOq5T2VySKyk4u+lZTJSRi6/MfZUum8qEuyEg1Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUDSt2swiIrfzi4KBfQjyHN2tqi2qraAbLrEkh/6HKNoqbjHy1dT6jwX4kZiphv+VS2rBJKHZ00YAFzpe3uY1KJ91ryCGMs1eWE8tYQsxPXLkx70m9B8/FDjs0cuoOCzFDF8dBvACYqB4a/PGEKGp0Ccts0HwsFn3RRGsx0aUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=05n3fpy7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="05n3fpy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07F6C4CEE3;
	Tue, 24 Jun 2025 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750755985;
	bh=P0wcOq5T2VySKyk4u+lZTJSRi6/MfZUum8qEuyEg1Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=05n3fpy7cLtywKT2MrosCUlSLnrH9dIwJZ2zJSfmlmYElqxTOBb9gU/GJoJLE0D/g
	 nhiM279Q4iRDJY6RhH0wAYy2ZrhQlurFqn7vaJHnMzGvbsSDqJy7cG/uDATRh7Nb8W
	 gbStEEIdpON6P0iNrlIHVVm8Lo3chzWes3J543Wg=
Date: Tue, 24 Jun 2025 10:06:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [char-misc-next] mei: bus: fix device leak
Message-ID: <2025062423-flavored-dwelling-070d@gregkh>
References: <20250624071521.1281436-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624071521.1281436-1-alexander.usyskin@intel.com>

On Tue, Jun 24, 2025 at 10:15:21AM +0300, Alexander Usyskin wrote:
> The bus rescan function creates bus devices for all clients.
> The fixup routine is executed on all devices, unneeded
> devices are removed and fully initialized once set
> is_added flag to 1.
> 
> If link to firmware is reset right after all devices are
> initialized, but before fixup is executed, the rescan tries
> to remove devices.
> The is_added flag is not set and the mei_cl_bus_dev_destroy
> returns prematurely.
> Allow to clean up device when is_added flag is unset to
> account for above scenario.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

What commit id does this fix?

thanks,

greg k-h
