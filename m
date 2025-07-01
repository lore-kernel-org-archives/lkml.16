Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE72101EE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348974; cv=none; b=gT4B4PHHf/wieo0VNI+kxY40FgleZAWBqeNvpkiPAf5rXoJiNcQFHpATR6M0FtQcyQ9vrumUrp+uUOw4v4QuV9fg/JmoWjyeaMo5auMgjIXKx+uIYeANpjNoy8RIq9KwdTjNeFgSZBuUD7hQXjKoCjH3xJWyz4+27XoSJI1NASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348974; c=relaxed/simple;
	bh=o1TAbQKDIzVtGAOdvZGxe79ymlyOZGcF+YuPbOBMkd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpE6/WAPVLdPXToBeHlC0lisc9imv9Bs1RsWi+DvWzj29xYEQHWlJjDYLdrfOcimH+HxblmyWFlKjnuzzAbppMUi7EXBWTd3WJ4Fn5/2oiskglxWLLqytroGMJLS7STOXyrEM2yYS4c9+gtPpjog2h9WU9G4eXD8vp5E9y3PcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2ucTxokT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2ucTxokT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E349C4CEEB;
	Tue,  1 Jul 2025 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751348974;
	bh=o1TAbQKDIzVtGAOdvZGxe79ymlyOZGcF+YuPbOBMkd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2ucTxokTJpHuuViqv0FmRfcvgrepyVH9fMOEGXvccb0WNXHMDTMUuY6p//nBCS81l
	 /paIHld743rhqxIzx3/vujbJedFXHCrc9mG4AhSPHwAfOSivkUflFtwLGYSJOl/oJJ
	 tCr6pJHzENMP8BrhE1h1z68jTFI9gFqY+NfGQLrQ=
Date: Tue, 1 Jul 2025 07:49:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, shyam-sundar.s-k@amd.com,
	gautham.shenoy@amd.com, mario.limonciello@amd.com,
	naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 2/2] misc: amd-sbi: Address copy_to/from_user()
 warning reported in smatch
Message-ID: <2025070119-kitchen-drowsily-1f2d@gregkh>
References: <20250701054041.373358-1-akshay.gupta@amd.com>
 <20250701054041.373358-2-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701054041.373358-2-akshay.gupta@amd.com>

On Tue, Jul 01, 2025 at 05:40:41AM +0000, Akshay Gupta wrote:
> Smatch warnings are reported for below commit,
> 
> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
> from Apr 28, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> 
> copy_to/from_user() returns number of bytes, not copied.
> In case data not copied, return "-EFAULT".
> Additionally, fixes the "-EPROTOTYPE" error return as intended.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> ---
> Changes from v2:
>  - Update commit message to add, "fix the -EPROTOTYPE error return".
> 
> Changes from v1:
>  - Split patch as per Greg's suggestion
> 
>  drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
> index 3570f3b269a9..9048517c088c 100644
> --- a/drivers/misc/amd-sbi/rmi-core.c
> +++ b/drivers/misc/amd-sbi/rmi-core.c
> @@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
>  	mutex_unlock(&data->lock);
>  
>  	if (msg.rflag && !ret)
> -		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
> +		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
> +			return -EFAULT;
>  	return ret;

What commit id does this change fix?

thanks,

greg k-h
