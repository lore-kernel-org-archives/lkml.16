Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FE213E7B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279733; cv=none; b=iHhRubZ18P6US0P/XqRJG9NPHfQozwoSXTKsOxLt7m8UWaRBdYY+9cd4VR8X913ZFxkz/QsS1somtNO4qeLSqnPjKE3qa+V2TuV4sz0UEYBejOf0z/FBR/mlxiYbRv5VZE+ZCDqVbZDUhGx7ws1xeygWU5+Ai6fBHts8oOHRX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279733; c=relaxed/simple;
	bh=AJWyW3TravrW0pqwKqrkjFzRRarpVKg6jNeX9krfP7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxu9EjErWOlZlMW9k0eEl1riXbSksU9O4SSXSQ2NnSGHLATro3L+4v+j83yZP4Wd7eptxduZ98efwVVM3EuI5jzXBKd8cdg+O0LLTK0/nGIDuxmYl57oeMBDkHOHsr89xiyKnfroK61fyrNgfnd2IUIvU4DU+0PBZgTfadxWOuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MhHCnbbQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MhHCnbbQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7376e311086so6160459b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745279731; x=1745884531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lIvdhiIp7KfEAT9Ev7PNKTHz6RV3HKg7XqQ+xR01ew=;
        b=MhHCnbbQtu3RnE99VaisY6zdE94TOwwr4cRyjANZEBdqV1cWRWAbF/hUzzw4fTv3fj
         Pj0ktdDS7NKQhXpkswxXCmCC8aFaKnE8PsLHiU0IHPfoKEEs3TE19WWTKMnGf0M87ObW
         AmuW8N3WCXWbb9nx8pgHAEF0fwtkZN4hw+1uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279731; x=1745884531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lIvdhiIp7KfEAT9Ev7PNKTHz6RV3HKg7XqQ+xR01ew=;
        b=Nq4yRM1syJrOfJwcA4XAHL5XOjKF/C3dCe+vqavyo/DSAd2ujwUffI3cxEj0bzY+1g
         513OsgZ43JgTY3uzhZpD81yuBSlAawntcWxCT6lPuVuNndoXI64ziYQ6ivoVZTaYBqNA
         agAwdVr/7SgHCRHb2erHTlg2KQ4HwdbH0g3HZqxGs2SgYzO+YkhTA2g9tkuxTqXX1gpR
         0UnqPtKkn7NKcD9qipQlW2o/lyPy4a9OQnC5y7dBJTyzxmF7ixS8sQevE/BTIyIIPnmu
         AO0j88slHss6+chvBf6A7ouAcS4HhfGgGGuoOQywtQ+tQGemHuXGj41IL74B9Yt28YfD
         wyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbBq343IPyIeqJvWnCtjKozGNlomgcjwYdTEvKn6mQg8or1GHDIawCN6nSyZDNyVKIpNdT6SJ5dytw7MQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyl3Jg6mSMWJ3VDVux7KRLUIWDU7Ci04nuxX5n85dozh+ymQHY
	kr0vtvf9Z+7MzSL/F/p6mDr5HoXlOlxn0NgPyq8a1sDQz1EoHag/SYntZ2Yx98X5jAnTrIh3Rqg
	=
X-Gm-Gg: ASbGncvtV5HbgF/lZxFbkj8ZeKqORIxlQIeNMIiIhMEwj/M8aHSOhPj5Czuu1G9ylPk
	OMj5YV1Poj4eVTR+T4+hvF6gK5wvS9qeFTp7IzHEOxXCFxY3EnJPWE02ciBnvbUxEamoFhvJI0T
	zYGunAtFalxlb8hQb4SfhjFhap8PRuUmwYJKs1SGnRL5OA2TMUQcDlQcHhMjioiyz8c9fVpKF4/
	1r65+klMLLXmrVgPB4v3DeB6uyrPS8jEuvTB0wpPeA26IifuyF4Wd7v3ynYMMgD26Q+yTxi7lZR
	BHhQyoyL1XdBYmfSStDJebBKCo90klTZTQ==
X-Google-Smtp-Source: AGHT+IGJ2eXpK7Tw18O1UcFDo8NrVpdLzOhE0cUZMGnvJYX5+9Xh7zn7vlF1w9hXh4UFv6ZoFQfjxw==
X-Received: by 2002:a05:6a21:9987:b0:1f5:9024:324f with SMTP id adf61e73a8af0-203cbd27ac2mr22588881637.31.1745279731393;
        Mon, 21 Apr 2025 16:55:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a29d:cdf7:a2a6:e200])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b0db13a4084sm6199432a12.32.2025.04.21.16.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 16:55:30 -0700 (PDT)
Date: Mon, 21 Apr 2025 16:55:28 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Re: [PATCH wireless-next] wifi: mwifiex: Don't use %pK through printk
Message-ID: <aAba8H-8KYZJeezS@google.com>
References: <20250417-restricted-pointers-wifi-v1-1-b79cdaae5579@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-restricted-pointers-wifi-v1-1-b79cdaae5579@linutronix.de>

On Thu, Apr 17, 2025 at 03:21:54PM +0200, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping looks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> There are still a few users of %pK left, but these use it through seq_file,
> for which its usage is safe.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

FWIW:

Acked-by: Brian Norris <briannorris@chromium.org>
