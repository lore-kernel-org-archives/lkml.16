Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7F278140
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224792; cv=none; b=SIKCYg4CItL91UHrexwjC2tmf4Lvmr7YZSZaAMx1kXXpFhDZScb04RGM2AicA2MfXoYlxi43X4PlwzYoDlq/lBEvp2htgTj9mU076HyL7aipR9kY3HxSDReK+/7dzS/So3j/Lan1TMbdZHDOWS1e6vOyQEuYhpRjXEwLa8JK+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224792; c=relaxed/simple;
	bh=USRS4wXWLcDKkhK4mkjsSrXPe6B7j5v1nJuLH4cX3kU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DlZJy85EAMGaiEimzQGE0O2z6gWfjYAw0wA0uyryICAmbMsBnYjqGFZJL+dssQoZhmkRwTidA7YxFLG1Br4WhaUyCpQhw3V7fmgLuFJGo6GSS2ADZB9qeJi20YUu9DYtqx8jAAX4FBKb3BQfRLKDWckofbf+iAr+MFoaqwsGBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=L/bDD6OG; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=/1sOTn8c; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="L/bDD6OG";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="/1sOTn8c"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 6AB2C209655C;
	Thu, 10 Apr 2025 03:53:00 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1744224780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4rcO17bW8NJaT2k8cKsyyvRm19hYN8aGVm03wy1oM8E=;
	b=L/bDD6OGhi8vW3zWIe+z+lJQ345pThHVOaBDkkVY9kmCky7QDRRqXDwURrU4dbisB5Nm4f
	acuHY2VZGSL4TeC+Rys0FBxVNeS/41bEjFWPH0Ym1dtqZwmr9xHRCImpWpq+hPSOv6pfuS
	RGeWiTSmfWhR56YtKg0YiCfu8s1N+kODiG0L/PeReGX7G3w4rliFYeUoB4oyPjoNiLZNaL
	oBdacH2xPo7cwKWDgrH9TKirHd6TFlaQvgxTbZ84K7ihMl3drkBkS/V66gDLRbCrKF5VRK
	X2j8bIrSg/C0kAfLTetifJImit4G4s47XZFDubZfQ4lHgjtZHZeSBmB8CqUxNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1744224780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4rcO17bW8NJaT2k8cKsyyvRm19hYN8aGVm03wy1oM8E=;
	b=/1sOTn8cSHRjmzP80+IDm9FW9oxBTQUB80fF+kWdgElNmUeAHzQQwdjhr7g7uXXR4N0l4d
	/r6Zuehr0GA7GaBw==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 539Iqwrm533622
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 03:52:59 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 539IqwhK1425205
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 03:52:58 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 539IqwOB1425204;
	Thu, 10 Apr 2025 03:52:58 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: zhoumin <teczm@foxmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: Optimized FAT bad char check
In-Reply-To: <tencent_A8520B8C5C017A6C86DAD38B120D1B4D2905@qq.com>
References: <tencent_A8520B8C5C017A6C86DAD38B120D1B4D2905@qq.com>
Date: Thu, 10 Apr 2025 03:52:58 +0900
Message-ID: <87ecy16ub9.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

zhoumin <teczm@foxmail.com> writes:

> 1. Add first-Character Validation based on FAT Spec 6.1 ->
> Note the following -> 2
> 2. Add check for 0x7F (DEL character) even though the specification
> does not explicitly mention it

Why do you need this change?

Thanks.

> Signed-off-by: zhoumin <teczm@foxmail.com>
> ---
>  fs/fat/namei_vfat.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
> index dd910edd2404..d264057f32aa 100644
> --- a/fs/fat/namei_vfat.c
> +++ b/fs/fat/namei_vfat.c
> @@ -195,16 +195,6 @@ static const struct dentry_operations vfat_dentry_ops = {
>  	.d_compare	= vfat_cmp,
>  };
>  
> -/* Characters that are undesirable in an MS-DOS file name */
> -
> -static inline bool vfat_bad_char(wchar_t w)
> -{
> -	return (w < 0x0020)
> -	    || (w == '*') || (w == '?') || (w == '<') || (w == '>')
> -	    || (w == '|') || (w == '"') || (w == ':') || (w == '/')
> -	    || (w == '\\');
> -}
> -
>  static inline bool vfat_replace_char(wchar_t w)
>  {
>  	return (w == '[') || (w == ']') || (w == ';') || (w == ',')
> @@ -220,10 +210,17 @@ static inline int vfat_is_used_badchars(const wchar_t *s, int len)
>  {
>  	int i;
>  
> -	for (i = 0; i < len; i++)
> -		if (vfat_bad_char(s[i]))
> -			return -EINVAL;
> +	for (i = 0; i < len; i++) {
> +		if (i == 0 && s[0] == 0x05)
> +			continue;
>  
> +		/* Characters that are undesirable in an MS-DOS file name */
> +		if ((s[i] < 0x0020) || (s[i] == '*') || (s[i] == '?') ||
> +			(s[i] == '<') || (s[i] == '>') || (s[i] == '|')
> +			|| (s[i] == '"') || (s[i] == ':') || (s[i] == '/')
> +			|| (s[i] == '\\') || (s[i] == 0x7f))
> +			return -EINVAL;
> +	}
>  	if (s[i - 1] == ' ') /* last character cannot be space */
>  		return -EINVAL;

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
