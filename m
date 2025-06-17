Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB23207
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188759; cv=none; b=sVMRyeC8nLyA5gnW1J0mvc8/s5Wz5w295hz66d9nXnPJROL9nOMK7JBwelqIw3giZU00JQuubcskkdUgoIfwV0mI5UFW7bM9TIu8hYHGxg+jwS28SG8G05mmCBMA9wt+UfXPuCThxMANJZvcFceffM33yO15quSewVIX5Nb+eY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188759; c=relaxed/simple;
	bh=maosBMqcEUMS4h2mAKWow8LWfPYq+6TS1PNZ4TsGvMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URUk6haxKUcZPiGTlsm9gWdFCmrWD8DEPmrNBN431Cr9SYNIZ2TL6AllKTWSP7MG10FTgxBAnb+VBmE1UBoV/KcH0oljsSrbSm91NRBcr7b8gjs/HuEKOO4tDksn35Fezz6m3jrManJdH3qnXF3RoH5m21Y/t1SI87sXARsw7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=Wa04klLd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="Wa04klLd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a589d99963so867645f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750188756; x=1750793556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2mnqssJBMGEGZ4yel65uTxyhzurhDZlVcPz9/ChFNk=;
        b=Wa04klLdkmQ/xKvpWT52JECt8nLb8Z2fpNzWpRZQ82JEo/gQS+yLjDcQaZh3JHCkRm
         NjpzUUNP060TMA3a6eXE5nG0ImgrtpJfwEH1RjgETk2pPwwW2TGEf2FPHjecabjxq/Ga
         e1rZwxZP0J+qcsfGN3w8j24ygU9PL9V87Mm5MbQREU7u9BeFGhAWHpKY21HgFNTUMK+o
         CTQ38tubaUTNE7ZxWVGcamDhxu5n5Yb2bfUJ6cwsg3cqlerL3MUTUCTqsBSbR2/I/cXi
         n5FoWoH7SbiP6AOp6zOz84ceDKICzTZDF9DmfHrJp160Or6wgIp3jTJ73tSTku8cnUpj
         f7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188756; x=1750793556;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2mnqssJBMGEGZ4yel65uTxyhzurhDZlVcPz9/ChFNk=;
        b=ZX3UZ4lu1mu4FQZiJlZ8N8Fx7N1xkidknQfU98Bchg/xGeMOCOPty6NVLLIX1QC+6a
         goQOLh0RV/yeIiVg+MflagAtcrFnumPmx8i0gRP+ESDRmLt7IWBpnluOqk9FNa9+LSYH
         9HhJNfXQ2yBcT/APbX6H8h5YnJTIoFyEONm+yjLnQLW66umtLQOJGLPeyF72+TniNv7o
         JCE2eic3M0dXqg0J5HJMhjHWnrrisVGWXuAfxHsJ4HTDmGuqklxTTChAq2yBLsQjBsUX
         6UXD4atJzx14Zmk1EihrR0KfjODWa2Iv9W7AWOz3flbYeww7dmNbdr2RYbLH6JNJWAC/
         YYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUg/9NE+g/G+00SAiE5k77HHvpmUCpEXj6wvQZe9sMLm27vOECFRSWF2Wyqm985K+BYOOmajfyfLxXA4us=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfdlneKBZ6YdFogNcSHAKGyCnTBCb/4o4r8YuanOTfuM8B7U+
	r4m3HxBMwc/zd2ou/5owSfCBFoX5v43bKcYB2LBp7UvtTZF22E+yagNJmlYo8PJ6W7Y=
X-Gm-Gg: ASbGncsi6PyudVnA/z/ztBYoC+VFc18oEoumdKoR7qtHXjEW8EmBTT3VRcb/UjOqO2T
	+DyHjJ9x7CCD1XrQ3DLYykD4zvc7U5cUcSgepX6KdNlFNs5moB239X1BKMWxBsmza4VD9W7WCVT
	W5fkiHv91wXNOO/7AoDo5LnrwKhlgGWD2k+UKQQMhskmWnylrBUWR183JSlrzOVmqq+/T/BmOgG
	Zk7uw/L7JmFJHmyHXYER1pu+FJDupiUT1IJWcXcyd4To/0BmJlbU57ecKG11j7MI4ES3r5WF3Vp
	VoDC/pDYR1T8uH2DlRSeDKFh2EECBay7xum4m5ni79kRypP7J2xWnUj9QkXTIcdlFNk=
X-Google-Smtp-Source: AGHT+IFvX8UDNBBi5DC3/Ybdm1840HegO6/7yt18rWlEL7Zc3/qU8HDPT3MpH4li36+sH1FH3nFgGQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a572367afbmr12226086f8f.4.1750188755945;
        Tue, 17 Jun 2025 12:32:35 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6389esm14585247f8f.27.2025.06.17.12.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:32:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 22:32:32 +0300
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gustavold@gmail.com
Subject: Re: [PATCH net-next v3 2/4] netdevsim: collect statistics at RX side
Message-ID: <aFHC0AFQoJ98Xo2A@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Wei <dw@davidwei.uk>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gustavold@gmail.com
References: <20250617-netdevsim_stat-v3-0-afe4bdcbf237@debian.org>
 <20250617-netdevsim_stat-v3-2-afe4bdcbf237@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-netdevsim_stat-v3-2-afe4bdcbf237@debian.org>

On Tue, Jun 17, 2025 at 01:18:58AM -0700, Breno Leitao wrote:
> When the RX side of netdevsim was added, the RX statistics were missing,
> making the driver unusable for GenerateTraffic() test framework.
> 
> This patch adds proper statistics tracking on RX side, complementing the
> TX path.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netdevsim/netdev.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 

Thanks for moving the RX accounting around.

Reviewed-by: Joe Damato <joe@dama.to>
