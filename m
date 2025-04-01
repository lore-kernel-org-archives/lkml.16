Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA88DC2C6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743535218; cv=none; b=SOrNi6Qy49rbCiCYtySCzc2K3xVNn3XvzeS65gCvIK5GHMuP0MM0YVqsCBEsEZJGBw/s8qaV/t+fz6FcH2uwPc5aG8AxxCJMyiJaNw36znSDCpeProXYZgIVk+PBFlxf+wMwy48QoUVbQQjYKtuWRByAd9fhPTWe2hhfaHE0B90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743535218; c=relaxed/simple;
	bh=FPOAAUlBVdDxl+WPENcvKb+OkBDXZ7CkcE3nwQYV6CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvVDcdxgApKCcWJnr6tBWLnesfdhmHwnGpiMhIfT6hQfh9M1z+Zwb2RoITMkwBjvdK0n0WAHFAq1ZJmksqpTMy4k8cNxiQrImTTN7DGTmasJ8nks8fofS+7Z+uYObxhDGaFPh7ToueaeB+ve3b/BGq65wh63oo9p4xcQILeDnI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oukB7iBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oukB7iBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E463FC4CEE4;
	Tue,  1 Apr 2025 19:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743535218;
	bh=FPOAAUlBVdDxl+WPENcvKb+OkBDXZ7CkcE3nwQYV6CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oukB7iBAfJkn3rl5txAzRgFkmR346616Gvvuk8nrZpeQ7JHPS+T7uH5871S/r+OBa
	 F1+ta4tQxsNgI6Sg2DQIeMKwty88lMnvguCJsYMH6P9uV12VOyuH8QtqgY1AaN9V1x
	 J1fY9EcBML3RPmRid3fL3gVvuD7vTEFA4aljuSeg=
Date: Tue, 1 Apr 2025 20:18:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: srinivas.kandagatla@linaro.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <2025040143-espionage-poison-2345@gregkh>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>

On Sun, Mar 09, 2025 at 02:56:50PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Hi Greg,
> 
> Here are few nvmem patches for 6.15, Could you queue
> these for 6.15.
> 
> patche include
> 	- updates to bindings to include MSM8960, X1E80100, MS8937,
> 	  IPQ5018
> 	- add support to bit offsets for register strides exceeding
> 	  single byte
> 	- add rockchip-otp variants.
> 	- Few enhancements in qfprom and rochchip nvmem providers.

Ok, I wanted to apply these, and tried to, but they fail horribly
because:

Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
	Has these problem(s):
		- Target SHA1 does not exist
Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit reading is required")
	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
	Has these problem(s):
		- Target SHA1 does not exist
Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than one byte")
	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
	Has these problem(s):
		- Target SHA1 does not exist

Why do we have 3 patches all fixing the original one here?  Why isn't
the original patch just "correct"?

And you can't send patches with git ids in them, that just doesn't work.

So please, go rework these to not introduce a bug and then fix it up,
that's just not ok when dealing with a patch series.

thanks,

greg k-h
