Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05302F4317
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737576; cv=none; b=i6shXdepk8H2drzMW1vf/TFZF6qcyiwtS+Ol3F44dNAc//w5qeTawIS83KSioe101vxvbs3WJe/i3y3Hpcrhw+ronZZVjZ+Bk+kACO6rcs1q+UqrIuvSvJByFegsg0v/orhnqtHB+nos3VCpGWi7o8Dg+ShZVYvXHp99L+NgeQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737576; c=relaxed/simple;
	bh=LZbMld6BzHGILlIgf66HaC3NP9UK6TgOAVrYfhtRoh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lrc7ItGDD/wcO/le6Bn7PU7Plw9Mw6OQCaF1phmKHbTMb80LcK79vMrIBy6w1ISP3cZVTJpGZ5F0BUCCC5QJPxS7lENLqorlRa4yBzElPF/zOT31QZet3ufUexRPqxCGDMarSNpDa7mOnkHOLDRc7Kob7lmvGhM1MxvnVwUXZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=r08Pb8at; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="r08Pb8at"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1456744f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749737572; x=1750342372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+m7vYBsU85tLjESg73MFdmLBCg20+wdtbP1Z8Mu9gw=;
        b=r08Pb8at6TMubRhspo20s87DkBBMJqfSpJQ7KF8oaYst2wmc//XZzWWbc+cq9AUPC1
         7XczUL9FMl+XytepYgwSJWBlZ6Kxzmsf+gYLXldQJX54BmULpuzTcdXBlgoH0JXwpKzy
         MXtPYg+x1aG2l+G6wkQpvboIMRK+pvP5prusYp+XiLhEsVKeljFIgnTUdlB2E+pzwAh7
         WnMl8VGtJP31K518n6Pxo2DxVxZPFvGZHFeD2JHY+3sU9ptVNDxDOF+5+Gg1vO+3Ei3A
         uWrWuthUdOEqAvKx8iEciBbaCfxN2H/YNlZ2pR21csKDxJTgwXMGHkvs1NdIzrMwUddk
         Z9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737572; x=1750342372;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+m7vYBsU85tLjESg73MFdmLBCg20+wdtbP1Z8Mu9gw=;
        b=YVURZWZBdrVqWeokyuTj7IbW1uKz+5hL+gL4dEk3+g7YJBBhDpYraVCwhloMn5WZ7e
         Nr5EM7q4PphTIeq0sWFexNSNLC++mpQ2GKrHqF3wl2/9DX6JQbc0t8DgUehSYbI8Bqah
         VrNHcnW8XrjUPOEU3FDjzrk67mgn/roAkACHpWfVnKmqpp0xquuqJWWuEIAdfQ6RJtlN
         9MhFsRtcM0meknOhfK7rqhilh3WgHsHCOlLJ8U12G+BXIB22scSXaggOdcbdL6EIo89O
         gtLgRdVdrebx99o66iOLXGsDouqKF3foX8Fjuo3HhCD5Eocv1cI5zCsxkCviuHUiO2gq
         wRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYVl56l9j9a97suKy6wOAbcx+pQnCgAzEgR/msDLWajl+Ga6Umggzvaq+4NSnC7JoDgQtRrnW3YuTLW+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57ojPdhrARchM2dmDU0tXPWEfTXODfMnaqXRRmcRDgSRi0Phh
	Kl+DMc6HyCA1ROrYJ6A8Hjaj/rN8+kIEfhT4Ie3Z+hDoMf++p0o+nShR6X4c0tUi+0g=
X-Gm-Gg: ASbGncv64jtfw8XDdbwu/Okoev27d0qAKx/ATBr+zk1SKBvbG8yc4GRuUegIkkEGE99
	QgcLZEPG+U8BtLI49bEJeSwE03YQLFAhKvwT+MJzhOHIU4gPNcZgVFJ1PHf1dx9UjdgHRsMm9+Q
	waDZtk2oDe+tR//9lInLLdNNDfuWDG6smiWoNKWcuRzHujM2IqcD7y8tXS9vh5C4bmytO7CAo5j
	IZGyoxOwvmqOWIu9Rwhobi3YxdSAXt3v/TMV9ZXeVsLh5TuEn9zP/p6zy05JSPxEzKujPCqZtaV
	WB1nkUeEM55/HjZmM5xMoPNs3W4EqEBXjIKxJuJQao1lsm8P2LD32GumLm+SXgFei5A=
X-Google-Smtp-Source: AGHT+IE6AmCf5V9oHfWOt9dYuSHqj1qzlXCkWSsFnnG7NUfV5Z5SKBuMKwud/rOH6HANsQ0sthmKhw==
X-Received: by 2002:a05:6000:178d:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a5608135aemr3279107f8f.23.1749737571906;
        Thu, 12 Jun 2025 07:12:51 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2446b0sm21538585e9.21.2025.06.12.07.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:12:51 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:12:48 +0300
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH net-next 1/2] netdevsim: migrate to dstats stats
 collection
Message-ID: <aErgYLGwLjoHxCLv@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
References: <20250611-netdevsim_stat-v1-0-c11b657d96bf@debian.org>
 <20250611-netdevsim_stat-v1-1-c11b657d96bf@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-netdevsim_stat-v1-1-c11b657d96bf@debian.org>

On Wed, Jun 11, 2025 at 08:06:19AM -0700, Breno Leitao wrote:
> Replace custom statistics tracking with the kernel's dstats infrastructure
> to simplify code and improve consistency with other network drivers.
> 
> This change:
> - Sets dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS for automatic
>   automatic allocation and deallocation.

Ignorable minor nits: "automatic" repeated twice in the list item above and the
other items in the list below do not end with periods.

> - Removes manual stats fields and their update
> - Replaces custom nsim_get_stats64() with dev_get_stats()
> - Uses dev_dstats_tx_add() and dev_dstats_tx_dropped() helpers
> - Eliminates the need for manual synchronization primitives
> 
> The dstats framework provides the same functionality with less code.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netdevsim/netdev.c    | 33 ++++++---------------------------
>  drivers/net/netdevsim/netdevsim.h |  5 -----
>  2 files changed, 6 insertions(+), 32 deletions(-)


Reviewed-by: Joe Damato <joe@dama.to>
