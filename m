Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBD4202F67
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600954; cv=none; b=N2dTmy+XdL+if8msj2t7ZiaDYt02JAa7p6auNooWQbNlFVqJc+syTGNvTSOf/MhicYiGsbTLvzmENWjCBDwpkB5yr4ynZcTgwA6qEsf5o6ZXA5UymL7f3SkPW9Ehsl1NHKolnt+6JRJ2gsEcRg656gMvPyL/ffL3EWW0fUW4Q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600954; c=relaxed/simple;
	bh=MV0xDuxa36T8vlsgUZsA2Zzf4b9NecWsWrOQG1UPhhs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZIr807E7LHLuOabtTit3HUoKQEelDoJoDkrm113z8f5ugP/mQl4JoeVYeDeupSyxFrbsOuGlkGK40xRcOezmK327guJZEwlz0RnqT4zmViu7wwyEgxhtMg4t5DJ6AZ+9HNkhThh6pZl4/XFHhZjXXaCISJsJnzweJy6lAjdjRIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=FVfu5OkA; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=3quFEydw; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="FVfu5OkA";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="3quFEydw"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id C90F6209655A;
	Fri, 30 May 2025 19:23:55 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1748600636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpFmFQChOnE6nAGClE1PTp1IbANAehjFrMemwvKCnBA=;
	b=FVfu5OkAEeT/aAMY30IXWqHt3wTElMeTRjsNAJ9NxCs/zLvMT6wDIaNcmmczt+DONrbYrR
	AC5pKnvenYUSPkcBWyHT7KHVm6dmqN+PD/GibdD4TJfulfDzekmD5ooQk6Db+hAk3zAJI1
	HJ1tGz0V4c9zLVMC0CmF718gVW7DRA7legWYJXFGdUcQkN2iyuI+h52CFO54o71tBOjwdp
	fJAagzsO2OR885Ckfo6OlzjQjsb66MVo7vSt8teQnFNJbEIonz+dNFbMGPjtyjJzZkqGq4
	BTZlkzUq/lU/a4i7Sh2nZZUTJWD4I1D3qWL0VHpvU/KiUzOYUBvM02jWf1tWuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1748600636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpFmFQChOnE6nAGClE1PTp1IbANAehjFrMemwvKCnBA=;
	b=3quFEydwpkRm1RJf4A43WtUSl1R4jf1sfIYTY5JCN60MUOGycxz9p/JUbNrj+VtIedi+/n
	b2PldOz/Ks2/ZWBg==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 54UANs9t031885
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 19:23:55 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 54UANsW4064889
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 19:23:54 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 54UANswX064888;
	Fri, 30 May 2025 19:23:54 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: correct superblock flags
In-Reply-To: <20250530084648.2434569-1-frank.li@vivo.com>
References: <20250530084648.2434569-1-frank.li@vivo.com>
Date: Fri, 30 May 2025 19:23:54 +0900
Message-ID: <87v7piflc5.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yangtao Li <frank.li@vivo.com> writes:

> SB_NOATIME includes SB_NODIRATIME as a subset. Therefore,
> setting SB_NOATIME is sufficient to disable atime updates
> for all files and directories.

SB_NODIRATIME is set at fat_fill_super(). So always SB_NODIRATIME looks
like it is consistent even if meaningless than removing only if remount.

Thanks.

> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/fat/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/fat/inode.c b/fs/fat/inode.c
> index 3852bb66358c..5da96c37386d 100644
> --- a/fs/fat/inode.c
> +++ b/fs/fat/inode.c
> @@ -807,7 +807,7 @@ int fat_reconfigure(struct fs_context *fc)
>  	bool new_rdonly;
>  	struct super_block *sb = fc->root->d_sb;
>  	struct msdos_sb_info *sbi = MSDOS_SB(sb);
> -	fc->sb_flags |= SB_NODIRATIME | (sbi->options.isvfat ? 0 : SB_NOATIME);
> +	fc->sb_flags |= sbi->options.isvfat ? SB_NODIRATIME : SB_NOATIME;
>  
>  	sync_filesystem(sb);

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
