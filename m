Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61F42A9B;
	Mon,  3 Feb 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738550695; cv=none; b=CPM3IzIOvsNK2G52EhlkNIaNHnwuCtT1c/s8N7xqTm6csBAYL52USljyeZ5bWbbpwUf5yLxAEaI9lmrgMR0l0KQ9LZb6m7oiexz+v11nj82Ab61Pwk4fnwTvwLNaDVzLar4L3rLQ0ywEo2VBmRFTeadw5Lcgw9kccFMWBcmS6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738550695; c=relaxed/simple;
	bh=cySK8G9EVFAAnxnVgaVbOvVRWTyqDDH8bzm5uGH73Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4vVKLE3JYMvojEBKXyJGY4V6UDutoN1iJhtfUEYHF/3REAxOvUGNrFExgWX7ZY/Qvkw9H7Rsrv3C6YBgk/5CBlfRB4unjxQksxSpg+S0hO5giVCOSjsPgnUi3OxIxL2Hn8Sf1nCFzG4H6AabgWQ/ti1l+drzSmO7UuQbn6ovBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moKYR16G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moKYR16G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B6FC4CED1;
	Mon,  3 Feb 2025 02:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738550694;
	bh=cySK8G9EVFAAnxnVgaVbOvVRWTyqDDH8bzm5uGH73Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moKYR16G2hwg6ekixrRI+UVC6oXmy/yyKBNRJBDZisAj22ehz96/Dke41a+kizEjr
	 8ana7v5X+PhhMDzaAftqTvB9tNbR0t+Tl2U4V937OsPZiw5bMNeEX6Og2rNoH1zxvX
	 VZZBAm94R2iYK0yHZdM35KuLhIfpzYo3iWQi7ixVe9gLhvD10ZI9F75FQuzHiHtNjt
	 CkU8UDfFb0/w8S8kSNHDeudBY9Nf73uQ5APEtwPfI2wgV+yIm4Tb/35rEI/4bjDX9j
	 W50NZ7lgHywF27PKQyDcT0+YdEWQlXztHnH+q8cW20aQY6/1LYTyzphiWoANkXRSX6
	 e3assX67D8Enw==
Date: Mon, 3 Feb 2025 02:44:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	bleung@google.com, jthies@google.com, akuchynski@chromium.org,
	ukaszb@chromium.org, pmalani@chromium.org,
	abhishekpandit@chromium.org
Subject: Re: [PATCH] MAINTAINERS: cros_ec_typec, cros_ec_ucsi,
 cros_usbpd_notify: Update maintainers
Message-ID: <Z6Ato1_-sbWG0U7L@google.com>
References: <Z5raIM_qhCF7oOB8@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5raIM_qhCF7oOB8@google.com>

On Thu, Jan 30, 2025 at 01:47:12AM +0000, Benson Leung wrote:
> Add a few new members of ChromeOS USB team for the USB Type-C related
> drivers for ChromeOS: cros_ec_typec, cros_ec_ucsi, and cros_usbpd_notify.
> 
>  Łukasz Bartosik <ukaszb@chromium.org>
>  Jameson Thies <jthies@google.com>
>  Andrei Kuchynski <akuchynski@chromium.org>
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] MAINTAINERS: Update maintainers for ChromeOS USBC related drivers
      commit: 57b38c3c69da1369228b5fda656947cbf29c5a43

Thanks!
