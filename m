Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3171B4F2F;
	Thu, 30 Jan 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230726; cv=none; b=WwvhipD3CFJvrrM3ua23XDwudMvdsommHnRgXlLV17rtLLRVkMHudkwAytak2ao3I8sLTFu4iw7+jvCI+syuhI+DLAxcAT2kZ4viT0koQfrhL7mdV1amXicfkG4mmfndWddGsz4cg5kfyJBz5EAOJH102VYlHheNqJhtkTZdS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230726; c=relaxed/simple;
	bh=DPOtlBYuKLVhFH8zQfgO1h3WnM0IbC317HvsulF4QlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGaA4cV/xQ3n1Mc+xdaEXtJW8C5xff5vnoGlkHsz9mktc4WeKh2+z+lF8UM62FZsW5xQmqBhRRKd1EVh0aWzq18j+ni/6REJ5iC+D2SkMyznGqTCG0PtA9h5IWmUqzUIqyGAOftFHf0pZNMrm4thSMHshpCPshx5RMFv2hBlTns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nX24lo7C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nX24lo7C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF506C4CED2;
	Thu, 30 Jan 2025 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738230725;
	bh=DPOtlBYuKLVhFH8zQfgO1h3WnM0IbC317HvsulF4QlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nX24lo7CXJh7aJ6fwHUQkbr6448zEdwqqj8gygftpmerJI4KjM6mEZF1j757L4Z+i
	 /HVpF5hHJB/W7k3omf9DscYGaLWjDzNovPbuoFZheqZakfO0c5+6XAAfkYqu2D7HRF
	 HuzevcqXsvMTZATsQ8qtBfxK+8CyUxCMcYvTWIko=
Date: Thu, 30 Jan 2025 10:52:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nir Lichtman <nir@lichtman.org>
Cc: corbet@lwn.net, paulmck@kernel.org, akpm@linux-foundation.org,
	rostedt@goodmis.org, Neeraj.Upadhyay@amd.com, mcanal@igalia.com,
	thuth@redhat.com, ardb@kernel.org, bp@alien8.de,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rob@landley.net
Subject: Re: [PATCH] docs: clarify rdinit precedence and correct ramdisk to
 initramfs
Message-ID: <2025013037-feel-strategic-4a25@gregkh>
References: <000201db72f5$49b11e60$dd135b20$@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000201db72f5$49b11e60$dd135b20$@lichtman.org>

On Thu, Jan 30, 2025 at 10:59:33AM +0200, Nir Lichtman wrote:
> Problem: Current documentation regarding the init and rdinit params is
> confusing,
> The description of rdinit claims that it is related to ramdisks, even though
> in practice
> It only controls the init executable of the initramfs
> (the deprecated ramdisk mechanism is initialized only after attempting to
> load rdinit
> or its default "/init")
> Rob Landley's document from 2005 "Ramfs, rootfs and initramfs"
> clarifies the distinction between initramfs and ramdisk.
> Another confusing point is that the init param is ignored, in case rdinit or
> "/init"
> exist and are executable in the initramfs; the source code gives priority to
> rdinit.
> 

Odd line-wrapping, please fix :(

> Solution: Add more clarification to the kernel params documentation, and fix
> >From ramdisk to initramfs in the rdinit doc.
> 
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt
> b/Documentation/admin-guide/kernel-parameters.txt
> index fb8752b42ec8..246cb73f71a8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2182,6 +2182,8 @@
>  			Format: <full_path>
>  			Run specified binary instead of /sbin/init as init
>  			process.
> +			Note that rdinit= or /init if rdinit= is not set
> will take
> +			precedence in case they are found in the initramfs.

Your patch is also line-wrapped and will not apply at all :(

thanks,

greg k-h
