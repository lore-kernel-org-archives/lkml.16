Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624541519A6
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749412999; cv=pass; b=Qg5DUBAQ+iwX3Y3SWJZSlRqqzUKpFf9nr135BUGu1PtcfftXHo1l00/nQuZ5cwp5ALA6AvUisnw5IjTqXrwY5lf7DzcLJZP4jNdT8bkb6qub+8ENX+MBzoyMF/jBEZx7XRtYlvcJZgcLfuFGSHehR9QRu8UK/1Qz6X45gA/CIwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749412999; c=relaxed/simple;
	bh=+n+o8Qpvh/7RYRgJjII+zOxHxxgs4h1hUT4pvJNG4lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCKfl7IYyXCBZ9UcuCLlYBOgN8iZh3QCAQnVSLlVobUmAB1Rt0RrazSrlD5Du1nTiXhTLhVJrX4pdUkTaVnuGUCrSrw595nJtUcrqmCIPHvt32j0/GwrXlCr8xnrArbhfKkB5HWKxDqixhM2p1LlMmj5Yya/oxUU6pD63Vcl8VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=KZbvDN10; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="KZbvDN10"
ARC-Seal: i=1; a=rsa-sha256; t=1749412991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c5+ujBFocU4bPsvFtO3x1L4N8nmS3Qub86PQInR5FoxrWBc6/xOOxs6rdjyrR1YILRxcp4B3nbNQIQr1oqxdolxhY38I8V45iSO5ZT1TX3ILEs0ge0i1oM7nhlhtRINZuUag94PU2euRS2T1WexqyawrAnmJphhMNr04ySy1nqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749412991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oYD+9wugRPVZ9yTQeDUm3MLVIWdKfIzKBhHgfAs7+Yg=; 
	b=lWVqWviX5JSp69MMr+HL8+6UORtx4fTzr0xYbeUb9ydtX6fhdBSCae+q8KU39I63NR9eDTjVjcDqLX7O6ZCDoqmI7WDmbieTReTjMtPXllz0PztSNrSd7PrUKyRCrTjhZ/Et6HjapyXF9We3MV1KUlHq9yQvPhs1lLsP9DCWI+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749412991;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oYD+9wugRPVZ9yTQeDUm3MLVIWdKfIzKBhHgfAs7+Yg=;
	b=KZbvDN10pSLU06+JYR+OmqRww5sGvio1bLpUH+p1YqfRe5XYKcJ2Hh8OhYOkybkj
	rdBzMNJcMF3HWbTGx+uWGzC/w9JW31C3lR4EFQFe0G8VxfkNFFnPHekkMdV5ytReMY8
	Fc9SpRep8/Cn0VPqihLQVvpPEJA6dAHBP5sbNRD8=
Received: by mx.zohomail.com with SMTPS id 1749412988671446.1912413843944;
	Sun, 8 Jun 2025 13:03:08 -0700 (PDT)
Message-ID: <582f86fb-bcf1-4b58-ad54-acacf4326dd1@collabora.com>
Date: Sun, 8 Jun 2025 23:03:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reboot: Remove unused unregister_platform_power_off
To: linux@treblig.org, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
References: <20250608174235.116424-1-linux@treblig.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250608174235.116424-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 6/8/25 20:42, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> unregister_platform_power_off() was added as part of 2022's
> commit fb61375ecfba ("kernel/reboot: Add register_platform_power_off()")
> but has remained unused.
> 
> Remove it.
> 
> Note it's a pair with register_platform_power_off() so
> seems symmetric; however, I think platforms are chosen
> and then stay that way for the boot - so don't
> get unregistered.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  include/linux/reboot.h |  1 -
>  kernel/reboot.c        | 16 ----------------
>  2 files changed, 17 deletions(-)

The patches converting those platform drivers to use
register[un]_platform_power_off() haven't been sent to ML. This is the
reason this func is unused.

There were apm_32 [1], platform/iris [2], mcu_mpc8349emitx [3],
olpc-xo1-pm [4] and sgy_cts1000 [5] drivers that I had patches prepared
to convert them to new power-off API. They weren't sent out back then in
2022 because of a nontrivial dependencies between drivers. At least some
of those deps has been resolved by now and potentially the API
conversion may continue. Currently other things keep me busy and don't
have immediate plans to continue the conversion work, maybe sometime later.

Leaving it up to Rafael to decide whether to keep this func unused or
re-add later, once it actually will become needed.

[1]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/e42f1264161085f01fed16986a23592519d9f49e
[2]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/24cd048ad801aab6221f2b0bb4576dfc2fe25faa
[3]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/486b69b43c47d85a0f292dca127f0b9063443a54
[4]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/fe5344b3f8a8e1c52e1cd7108aa7e615123be4b2
[5]
https://gitlab.collabora.com/dmitry.osipenko/linux-kernel-rd/-/commit/0d761d6139c9dacbbda9f2e095577b084685603f

-- 
Best regards,
Dmitry
