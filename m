Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656323BCF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598550; cv=none; b=ihzRyRJryYHnkrTg8znjV9NDiXnQ0cU9PM3WvFETY6LjFxNchMZ7+xQYwoPPG37zvXgHeqwjzwmQpwhUQDCyj4L5Y8TBhJmNwSdmjjvrNKhTB+BckyYtv46GAOyUv1RKui4Se0VUx71iJLVYDOYF9fm8AyBkAyY9a1FUq5iCQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598550; c=relaxed/simple;
	bh=fKoqFFmUobB+RoqXGicXqBSc2/VRppGpRM/Dcj2P7zg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WmVY/v7ofYJ1G6fcOC/MwgKEPFFUfgzL2y35abg8wR2GmjoHZtAgvE4M8+t/3B8V4f/JrkyJ3SVDJYVh7Zw/CuwxlbAwKoLokhblLPZzDSgr0SiZbnmOcqLHc9PjfVe5kEm8tjZJTbtDt9NWUpPU74lShRLGuUcNMXjZwQoeE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mqIE34jy; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mqIE34jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oFO+eOzQmZZQk/wT//ioGwcfxy3u55ixA2r4co2L760=;
  b=mqIE34jyFJghB5zwUJfaWefICq1ZSORM71l9bB5c53Q2+3vi4ux5XIzA
   6zO5aZ80fLSkgGdpIqhEW2G06mXFKI9Y9CcmjFdKIMw5iRyToGCTMGoDz
   461AVk5T54/338wh2w7UJvyTmJVxwVFVu/xB85/GSfNJu3Gm9cvfOHqt/
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,182,1739833200"; 
   d="scan'208";a="216010659"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:55:46 +0200
Date: Wed, 2 Apr 2025 14:55:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: Use true/false instead of 1/0
In-Reply-To: <2d7f7db67520fa127b81cb200a67304dfff2eaf7.1743596287.git.karanja99erick@gmail.com>
Message-ID: <e7564fb5-528f-3b7c-5cf-37c544fab3c4@inria.fr>
References: <cover.1743596287.git.karanja99erick@gmail.com> <2d7f7db67520fa127b81cb200a67304dfff2eaf7.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1501888478-1743598546=:3176"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1501888478-1743598546=:3176
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 2 Apr 2025, Erick Karanja wrote:

>     standardize boolean representation by replacing 1/0

Start with a capital letter.  And why is the message indented?

julia

>     with true/false in cases where boolean logic is implied.
>     This improves code clarity and aligns with the kernel’s bool type usage.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index a389ba5ecc6f..fd04dbacb50f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  			u8 *mgmt_DATA;
>  			u32 data_len = 0;
>
> -			pattrib->bdecrypted = 0;
> +			pattrib->bdecrypted = false;
>  			pattrib->encrypt = _AES_;
>  			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
>  			/* set iv and icv length */
> --
> 2.43.0
>
>
>
--8323329-1501888478-1743598546=:3176--
