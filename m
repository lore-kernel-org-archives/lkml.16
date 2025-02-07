Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F6194C8B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958209; cv=none; b=pJrW87hp5rfhjPAyJQyIPJr4NGJjL3rij8tqwO58xffvCMV3kco/208KJCtVfFYsKxNp59kVUxJ5vgtAfoRaAOEFJgIvJb+HY/rrS6ngrMsoM6j3aUYBqt/Sh1zSMxlonUKyi/nzbT4ukYNE8KLc3PD3Ek2qZKX0gbb8xX3IDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958209; c=relaxed/simple;
	bh=hvf8Bs2/54mKsud0F53VBvuIO272se3qdishAUui/iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJgE+Za0qY9LE2tj4VvZmN6HxGx7CDTwZslFBUOsi6xjoiTQapwP8AUPeSaSb9wItoS9BF50KkKRdCMia1N4o+dYvmp26BnXFq7I97lp2PPeH0WRi2NvRZ2lkfQhYyKGryQTjhwe0asnWFn438qcaijl35w+WQEH34Jpi8Xa7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=FG4ITyAt; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="FG4ITyAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1738957622; bh=hvf8Bs2/54mKsud0F53VBvuIO272se3qdishAUui/iU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FG4ITyAtuDc6qwHLQ625TR+T96IXB3S2RK7yfPgEwcF67dJ39MLLJyAzpDVogmWts
	 Y/SdFPbIwbDyvXMY7n8N+L2NHtehycuSh99uSaPCguy/78Pb3ANIf0Loc1+msxBccn
	 1cb3xF4Sw0WS3nG0Uk1vhJamy8K/VmuJ3rueSZ0qTmkJFtRyOvGUaO7PchnTqRBNvz
	 KE+Ad+L1g8dZBHSJ+Zom0IXqaHKvhDZL1rGlFeZ2QmvDrnviEwJpLxLOZnPoi1EzYf
	 CfC4XxGCDp0DWJHwjUehLYkJPEityLWBDfyDebJVZppOFEl05/zgXmL3JHl5zJUnpv
	 At2lD5ssvyKBExClVPu1QHepfRAL6k65uWR7qpkAETjdRZC61HAOCBeedaYGcKFE5l
	 gDmru+kISvDc4ALvPLdwMQDyaDleOBHohWq2vQtyuKo8cWXX5b6dmVb3TakV04ukWa
	 XKkqH324L7Dg7hXPeDTeI2eiPGD6KyC6zheicaCi8dMu2nH2j/idm6t+P5J6jyF/nr
	 OiEvJDDy1FyN/pe30oWR5DixZcoks9tzYikWHSPEdeESXg1bU5HClqjNfqha0vxz6P
	 JCSCher1gdkF9pmgTl5FPQmExHs7kqEEI9hXPCkWI+PuobBm3m9TMiWTsdm1ZbG/Ne
	 I+Ygb3FOhvUfMT7eD1ThDHwU=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id A7EF3160328;
	Fri,  7 Feb 2025 20:46:58 +0100 (CET)
Message-ID: <2a172c30-3df6-4f5b-a63a-04d279738b64@ijzerbout.nl>
Date: Fri, 7 Feb 2025 20:46:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] staging: gpib: ni_usb: remove unused variable
To: Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 dan.carpenter@oracle.com, ajithpv.linux@gmail.com, roheetchavan@gmail.com,
 niharchaithanya@gmail.com, eleanor15x@gmail.com, everestkc@everestkc.com.np,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-7-gascoar@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20250207150427.153982-7-gascoar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'
>
> This change removes the following warning:
>
> warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> ---
>   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> index d0656dc520f5..b7f221def217 100644
> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> @@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
>   	int i = 0;
>   	int j = 0;
>   	int k;
> -	unsigned int adr1_bits;
>   	int num_data_blocks = 0;
>   	struct ni_usb_status_block register_write_status;
>   	int unexpected = 0;
> @@ -460,7 +459,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
>   		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
>   		return -EIO;
>   	}
> -	adr1_bits = raw_data[i++];
Careful. You're removing the i++ as well.
>   	if (num_data_blocks) {
>   		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
>   	} else {

