Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DAF226CF4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335260; cv=none; b=XgVPHsQ3d6WpNzqappcaAi5HEmtYRsavRhTTA6WRl4KQqUEy2kZaTwG+wRelG8DQ+jSA+T64vBDjWJXaw/mNiflN/YauWHJcDb9zpk0/JvgZKqkpxNS/t9HEAD0DWsG0Z+6PIfAnt8UuFrq7YgtePT5ppLtgy7FIADFPSRd2LBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335260; c=relaxed/simple;
	bh=z1KJJSa1l3moVKzdHD3D1k/OgYn693KW6aD1V306JsI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pG/V6q9S/Z/nDagFC1fzeJzM1wPskfE2neA3nY98HX7VkqH47O5cuLQHp1f8xAvA+frtWStTtYId/k58FS/11u1pPywWU4BCgsyomRKMAhecIomnQOG96hUZb8BdC3Dae+gz39Q7+yeDjjMb7npO2K0XrFCX0lGhKH/NqfSUcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=3FC4VMVT; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=0gYobxAE; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="3FC4VMVT";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="0gYobxAE"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 3534A26F75D7;
	Thu, 19 Jun 2025 21:04:35 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1750334675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BM2yR5qWGRQEnE8Sije5dPIwlklCCQFy2vXK5ZpL7i0=;
	b=3FC4VMVTDDq3Bkz/2yv3dnkZlyzaCmhqyB+9idt0+9dV9cGKpfpnlkcee/i3yHWAVa99vW
	8hyVVA3V69GBt/Qvm/bjipRskjfBlWNQ9+wHmLGogalxNVEcmRhejP1Bbe/YllPEaJEtjF
	vGVc24RhybGNzX8H1NbAzaH2gb2zmiMntH/WTAvS0Hrx7Pg2VGgJQShLtJHdcLRzppEQAK
	fBaIimi37q1HTZRtgX29YOmsJJxgzuraIwhaKYVWWiK50kiM2ejVmQdtFNVo2JUpP/kuAz
	Uc46BaF0ruOJU57qaw7ptMFOMk5ztn0S2QXhkKfoaQKBbVAD+bECasKU5+tyow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1750334675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BM2yR5qWGRQEnE8Sije5dPIwlklCCQFy2vXK5ZpL7i0=;
	b=0gYobxAE3jl/0WhatEPIFOb/CfK/LdgUHdnNtO/E6gMpX8wuKRkbq9fqlQDVC4xs0NcidL
	2pYaIsqh7JeZ4/AA==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 55JC4XSG354955
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 21:04:34 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 55JC4XWO140334
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 21:04:33 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 55JC4Xjq140333;
	Thu, 19 Jun 2025 21:04:33 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Li Chen <me@linux.beauty>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: fat: Prevent fsfuzzer from dominating the console
In-Reply-To: <20250619113809.274808-1-me@linux.beauty>
References: <20250619113809.274808-1-me@linux.beauty>
Date: Thu, 19 Jun 2025 21:04:33 +0900
Message-ID: <87wm98aqem.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Li Chen <me@linux.beauty> writes:

> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Bin Lai <laib2@chinatelecom.cn>
> ---
>  fs/fat/misc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> index c7a2d27120bab..75c2b59fbd532 100644
> --- a/fs/fat/misc.c
> +++ b/fs/fat/misc.c
> @@ -23,8 +23,10 @@ void __fat_fs_error(struct super_block *sb, int report, const char *fmt, ...)
>  	struct fat_mount_options *opts = &MSDOS_SB(sb)->options;
>  	va_list args;
>  	struct va_format vaf;
> +	static DEFINE_RATELIMIT_STATE(fat_err_rs, DEFAULT_RATELIMIT_INTERVAL,
> +								  DEFAULT_RATELIMIT_BURST);
>  
> -	if (report) {
> +	if (report && __ratelimit(&fat_err_rs)) {
>  		va_start(args, fmt);
>  		vaf.fmt = fmt;
>  		vaf.va = &args;

Why didn't use fat_fs_error_ratelimit()?

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
