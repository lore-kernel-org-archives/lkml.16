Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C8261591
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830473; cv=none; b=f5QJ5ngFjN/KSr3NivnVEz2+TaGm74YCFjsX3l6X1b4784/ul92jZ7HbjI3O7vIdGtI89GAaWvrpAlxTJb39hXPhGT3Lz9yaBHrYaaj5uvkkRTOS0ttBCHpAEPcRjvb1THLAHqP4uTRZbFfo93mYbYhTYwnoC8T0zpLpNoX2FQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830473; c=relaxed/simple;
	bh=Aa5Fc7wrkWt5s+3iq/ymVVI1CWvxgXGsOWd8hvw/Bx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCsEpTJKoiPRfBTcuXeGACyfA32wBZrR+mZDAjQKUR5fzO4/rOEP4GojKZ2xdIM/8+iEBJQvxjbKfwyfRSzOe6Bk9/ulNseaCg+9dmz1AwHA8kvZCRVXC58fQMjcL5FA6NgHudr0/aJyTRvd88xMOWpR5AZprFICzhWzdY08cP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZGv8JEw8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZGv8JEw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A462BC4CEE4;
	Wed, 21 May 2025 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747830472;
	bh=Aa5Fc7wrkWt5s+3iq/ymVVI1CWvxgXGsOWd8hvw/Bx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGv8JEw8B15Pztsi9JDqWRq4Z+gILDowgp+wAGvijjgr2NT8CQeRtDBRli8xREE5j
	 KfnAY/8zYHKyjeHvMOFCVCpbxxZvVikuzHYTBVc9TOCDqHLoF7X4wkqPbw3B3nEKka
	 ZKjjjL422oC1vVopbf/GDknCnqiD5PV3I4nCBAPw=
Date: Wed, 21 May 2025 14:27:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: srini@kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] nvmem: rmem: select CONFIG_CRC32
Message-ID: <2025052140-train-annoying-e62b@gregkh>
References: <20250509122407.11763-1-srini@kernel.org>
 <20250509122407.11763-2-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509122407.11763-2-srini@kernel.org>

On Fri, May 09, 2025 at 01:24:06PM +0100, srini@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added crc checking leads to a link failure if CRC32
> itself is disabled:
> 
> x86_64-linux-ld: vmlinux.o: in function `rmem_eyeq5_checksum':
> rmem.c:(.text+0x52341b): undefined reference to `crc32_le_arch'
> 
> Fixes: 7e606c311f70 ("nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM")

You forgot to cc: stable :(

