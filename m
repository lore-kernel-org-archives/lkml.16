Received: from hr2.samba.org (hr2.samba.org [144.76.82.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D722DE6F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.82.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557293; cv=none; b=MPNyEdDuxcDiWCeDQ9EtA+hlckdHvti7CRiwE58y6tpvifaij7p+eVx1FHFdgkHspCb7Ye8I6rm3EH2RNVgKz9rW5LVjMinJJHiDBJOQXuIlajLYUKOrG6uBzgu/nX7TSwysvDlnWh7+p9gaqI5vcUee9E46kNKYvCX+yG62meE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557293; c=relaxed/simple;
	bh=avKNQlEwag9ANl/TUQTXF+fV4m5lNCNOG560eEoeItI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDP6Jtoq//A7766hnbbGAMQ9D94P2oRLG5i1VwL2YE3jNMrPuFPK8mE+OPAFTtEu90yK97EeWcZup9A8jfbX1FzXGdSEr76my9KApmGoY+jkUhOWJksl2Mso+dFxDGRjAArp6T07Tb1ve4rhCxnAtoM/omRWExo8U6mXBPScd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org; spf=pass smtp.mailfrom=samba.org; dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b=NZ0/NoFB; arc=none smtp.client-ip=144.76.82.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samba.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samba.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=samba.org header.i=@samba.org header.b="NZ0/NoFB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
	s=42; h=Message-ID:Cc:To:From:Date;
	bh=0K14Nftf7MCxiLuTCgqd/9TubX2MuFP2HFIC0ZIZGVQ=; b=NZ0/NoFBt3VqRhzaZ/IhvzX0eX
	SQiTYR9TpEkaVnFuTiE8Z1P/gbc/4/A3oLYy6pFn8rq4YNVI7ldx6wdaixmbGnQT31SDDlNENY+Jt
	TW9y/S24YnEy+1JomhMbPY7YpZLSjs0XQxrXN6RAu3xP9EFKPuXBLwOMqTrD1ifv1W629Ki/FuJ+I
	6b//5jlYKiq4uI3gV0b62t7Nx55uhoOI5I4mm6a8jZ4nFd3n/I/ChhvNOaAOzaZOWYTq4cxLgnLsX
	T4os+ny8DZ8I7cvt1w/xXN7WI6zv0+axF4D82sh11PznVm5Jew66fvk/3Vr/5rNkT8NRY4AZPPSXP
	nOtj7uo6iN4w71LOCfA/weAmYh9ekJek/3/Zz1/o2n8H7kQ1d5Bmm3/q8bZrxcGO7EWBo5JM6bTAC
	Fjddj18gBGHGoWw7/i/5yvmdmSWmF19VsWRKnDRWtCWyyDuvbBFJoqrxLQYbvIksQO1SUvoLB0ggY
	AcN7p04GfYaD3UblQ39n4zwt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
	by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
	(Exim)
	id 1uXM3n-00DoHg-0I;
	Thu, 03 Jul 2025 15:41:16 +0000
Date: Thu, 3 Jul 2025 08:41:08 -0700
From: Jeremy Allison <jra@samba.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>, sultan@kerneltoast.com,
	jra@samba.org
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
Message-ID: <aGaklKejxefXTQB4@jeremy-HP-Z840-Workstation>
Reply-To: Jeremy Allison <jra@samba.org>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703114656.GE17686@lst.de>

On Thu, Jul 03, 2025 at 01:46:56PM +0200, Christoph Hellwig wrote:
>On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
>> Address resource and timing issues when spawning a unique async thread
>> for every device during shutdown:
>>   * Make the asynchronous threads able to shut down multiple devices,
>>     instead of spawning a unique thread for every device.
>>   * Modify core kernel async code with a custom wake function so it
>>     doesn't wake up threads waiting to synchronize every time the cookie
>>     changes
>
>Given all these thread spawning issues, why can't we just go back
>to the approach that kicks off shutdown asynchronously and then waits
>for it without spawning all these threads?

It isn't just an nvme issue. Red Hat found the same issue
with SCSI devices.

My colleague Sultan Alsawaf posted a simpler fix for the
earlier patch here:

https://lists.infradead.org/pipermail/linux-nvme/2025-January/053666.html

Maybe this could be explored.
