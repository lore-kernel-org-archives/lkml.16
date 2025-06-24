Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D63074BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779695; cv=none; b=bRYbhzXkhHyLxUcKCTaxlgL+5v69nWZkxd2+PXWA4aNEBh1oM/Mm4UFIro3xzjoDPVcmWLbv61wfTgBlAA1VUhSJueh78Z4eTGNH2Cq+nQSsG/JgCsF4mC4D9d/fIxJIK7BgA38aHOb71dHE2pfd3zzr2RsIUvsxvrG7HIBfGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779695; c=relaxed/simple;
	bh=WT4CnKoOoY20N0gNaZZca1PUBZ/SZ0+G6uRWbplt4oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcMu71LpFZJtosDpJ3MyZ5eeARHp1HVMi302tXSISxe2EfOFO1/oASWDWpGAiQPwsrdCzHkrr7QxErJhzG9qodTJsrnYApVnO1EIKZL+gbixYHXEjGuAk8HeLKVCNVxVlqkzh8XxHicjea5oLJ4ytS2VizE0My2jhUZzUhMbt34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EODrfUkF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EODrfUkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57435C4CEE3;
	Tue, 24 Jun 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750779693;
	bh=WT4CnKoOoY20N0gNaZZca1PUBZ/SZ0+G6uRWbplt4oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EODrfUkFsPeaWBpALHDgmVSj13ZKHDjIwd2gw2bI5kP2oeudSD0F4ZGDglIP8okGS
	 CfY93ijVNOO2KhSc8InbQ4pi8mESVan3mF1B2PyBbTCI4zDud3xOsfLwvWEkUQwiKk
	 rP0CKl7HY2hJFgsXFdDloz1W54/5c7uL4Y0HT15I=
Date: Tue, 24 Jun 2025 16:41:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, Anand.Umarji@amd.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] misc: amd-sbi: Address issues reported in smatch
Message-ID: <2025062404-overcook-drank-a3ed@gregkh>
References: <20250530081158.121137-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530081158.121137-1-akshay.gupta@amd.com>

On Fri, May 30, 2025 at 01:41:58PM +0530, Akshay Gupta wrote:
> Smatch warnings are reported for below commit,
> 
> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
> from Apr 28, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
> drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
> drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'
> drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
> 
> copy_to/from_user() returns number of bytes, not copied.
> In case data not copied, return "-EFAULT".
> 
> CPUID thread data from input is available at byte 4 & 5, this
> patch fixes to copy the user data correctly in the argument.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> ---
> This patch is created on top of linux-next

You are doing multiple things here in the same patch, please break this
up into a patch series.

thanks,

greg k-h
