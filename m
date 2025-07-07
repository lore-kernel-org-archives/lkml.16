Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025D1F790F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888827; cv=none; b=IxY+ckajWGhDhWr8kcZse9JJ3ALmvIQ2LgqBpPO18ab3dRQ44HDd0V3asaV0B0A9FXUVwfHXYWtC6yDSbogg0ODUNA6mlLZTJtZ0vDTQjx2540s6fGvGN4MBEnopEx1hXM45BnX4gLwiYaNGRh+/XX23oZM7U/wGMfGVnXukRSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888827; c=relaxed/simple;
	bh=2g+r/iZea6dqyi56TcKsbVpmDlJWyfNAJ3yWxeoWwUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKE6l+pJi+bP8MqaOlDoKHWCy30uLG5Olk9AVk5VRE7ghmjwKh36lESFFCKfitZohXWosqxeEk+/lLdTyyF8uPJJs/j2vtL1yH7uhrKwd5ssledhpm412Kq64Q8d+FDYoASefb/MXePMYBcKdbrDYfmWbJEe3mkjRRYrO3Jm6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=MPdILvZ1; arc=none smtp.client-ip=62.149.158.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="MPdILvZ1"
Received: from [172.18.100.99] ([109.238.20.116])
	by Aruba SMTP with ESMTPSA
	id YkGGu1kxSmHkSYkGHuIiVJ; Mon, 07 Jul 2025 13:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1751888633; bh=2g+r/iZea6dqyi56TcKsbVpmDlJWyfNAJ3yWxeoWwUw=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=MPdILvZ1hMpgM22Kb6/ULv+Oi1yZFPkuPJ89iqqIpaycpg/EPBruD2LZMqtNZSOat
	 fErlR7vOqsvaluYhklr/Sx7XeyIx4QX4s6u2KNdHr9jFLtc19LFuHPfxcN9uMVOcmF
	 G/nX71EKVYVHI6BIbbkK1K+e9IIH07sw32EOvmMnLqS3cpze3DwAWMlSxHTDpzaizK
	 +5M1CLeEBWp2unq1EZMSCohwXq1uXMdZKju0qbWG9VHLktkZ9B40bSFoR0Zj9XcrN4
	 g1KKh7gG+agIsWAkaBr/P/TSja/Sq8Ouwr4JMHEzob26nmjRsKVCOri57Lhrh7KATu
	 R9EL8krXJXwGg==
Message-ID: <5fd4250d-4864-4e42-a75d-366619236808@enneenne.com>
Date: Mon, 7 Jul 2025 13:43:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: iscsi: Fix IDR memory leak in transport exit
Content-Language: en-US
To: Anders Roxell <anders.roxell@linaro.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de
References: <20250704124934.1071745-1-anders.roxell@linaro.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20250704124934.1071745-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHxdalgAxNrKqEDsyGhS0J09wZTb34GL51s5V1bCE2MPGLKHRELQpTjKf8RsmMgEjkLa4We7gc3xxULGZiDETE2OfvREAlE42CjIUxCXxez6NMnVQpEB
 a/IIynT00/l1981Ptis6cHK6wd7eWx3A8InR2T78HGPxEs5KPDQCQwzkOlyiOgx+87acVDq38XG5eNDeIPSNRlA+0kcjaXQEzcZ6r+Iom9Y/n+tlajGC7XyK
 lhuhm/QosXHsOqi5LsIWttNTHtKwpDeqdVKqJI4FBR0=

On 04/07/25 14:49, Anders Roxell wrote:
> Add missing idr_destroy() call in iscsi_transport_exit() to properly free
> the iscsi_ep_idr radix tree nodes. Without this, module load/unload cycles
> leak 576-byte radix tree node allocations, detectable by kmemleak as:
> 
> unreferenced object (size 576):
>    backtrace:
>      [<ffffffff81234567>] radix_tree_node_alloc+0xa0/0xf0
>      [<ffffffff81234568>] idr_get_free+0x128/0x280
> 
> The iscsi_ep_idr is initialized via DEFINE_IDR() at line 89 and used
> throughout the iSCSI transport layer for endpoint ID management with
> proper mutex protection via iscsi_ep_idr_mutex. The fix follows the
> documented pattern in lib/idr.c and matches the cleanup approach used
> by other drivers.
> 
> This leak was discovered through comprehensive module testing with cumulative
> kmemleak detection across 10 load/unload iterations per module.

This test has been done on PPS sources too?

> Fixes: 3c6ae371b8a1 ("scsi: iscsi: Release endpoint ID when its freed")

I think that the patch description should be linked to the code it applies to.

Maybe the patch is needed, but if you only modify the PPS code you should also 
provide a description of the problem within the PPS subsystem.

Ciao,

Rodolfo

> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>   drivers/pps/pps.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
> index 6a02245ea35f..25ed0d44b121 100644
> --- a/drivers/pps/pps.c
> +++ b/drivers/pps/pps.c
> @@ -456,6 +456,7 @@ static void __exit pps_exit(void)
>   {
>   	class_destroy(pps_class);
>   	__unregister_chrdev(pps_major, 0, PPS_MAX_SOURCES, "pps");
> +	idr_destroy(&pps_idr);
>   }
>   
>   static int __init pps_init(void)

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

