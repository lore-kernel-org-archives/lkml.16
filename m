Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221F010E0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467907; cv=none; b=IjkJgGbOTYAwvi5Z2KSWiF+LXPAGQkBrLEoRcmsbfi1W7ligm+mIUUjZmD/I0x0iJURLsROlrsh1Awg1eAQhO7EqjxdWbp0aDvSvG323qO6gce7ExrpGBWkQ2AEZEn04dU3im+JNQz8PCtDp3cyWPdaNeRSHGvOUnVOMrVOawXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467907; c=relaxed/simple;
	bh=RQlxcJTz6FLqAEEcdtD3+m9OT4QVAwMNwBb0Qwo73oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhj35a5waTTDiaqYtmRVO5VtETude0SisxzPKvtEWVFkI/ZwGQGw044qXsAlzJ4BQ8p4vEjCvm3IiELMhrFsSh+00qtpHkwCLUMTb7sbynW6of0TvDvjAG/6eiwLM8GUydr82kTMmjTswXL/qUaGrwGEhfxUxIE2ij5PsE5CsRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TJ+R0uBi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ljUE3xbR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TJ+R0uBi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ljUE3xbR"
Date: Wed, 28 May 2025 23:31:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748467904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tp4ba8JmiJXQnAjgWht/WMwnlbGYMjEc5WUFMjibFtc=;
	b=TJ+R0uBiGaTjq1IXIimJG6H8Y+ux7rzq7WMtuPUzj7Ltp7AC6WzagtsWTNzOrpU4PwxS/U
	zGlvDaPHXYfaRHSf9U/IR84YBQj0c+2INih5xPfhrKZjggDM/greMXvgvPeTfyB/Oc/aVe
	BufzX6vK0nPB+0MsUavV4UrC2RBr7T1FLmNJ2redTGCo1+chWInURy4U2lHp6dPUI8sc3K
	52jXjxXnbTVxraNMSXWl0DuESSNWlxqP5Wah1hy2W6w+L4G9/ZW95yiX8azK67XcXJUP+q
	YIU+XMlP0CqxpILVk2wt135LgREX4HHEbWEsRcAI62+MJ8yrlwuDIv6bK4IGDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748467904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tp4ba8JmiJXQnAjgWht/WMwnlbGYMjEc5WUFMjibFtc=;
	b=ljUE3xbRO4EoneWlqvz0YzwOQKzxe8iRR4tSHbzg2afAxH6dgnYkwB5Q5fZp2b9IZBvUxM
	Mnb7tlWO4WcyzKCg==
From: Nam Cao <namcao@linutronix.de>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <20250528213139.QHPG7Pf1@linutronix.de>
References: <20250527004327.3627-1-donnyturizo13@gmail.com>
 <20250528211533.DIM_zxnE@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528211533.DIM_zxnE@linutronix.de>

On Wed, May 28, 2025 at 11:15:44PM +0200, Nam Cao wrote:
> On Tue, May 27, 2025 at 12:43:27AM +0000, Donny Turizo wrote:
> > Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
> > the kernel coding style (snake_case). This fixes checkpatch warnings
> > related to naming conventions.
> > 
> > Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> > 
> > ---
> > v8:
> > Actually rebased on top of the latest gregkh/staging-testing.
> > In v7 I mentioned a rebase, but I had forgotten to run
> > `git fetch gregkh`, so the patch was not properly rebased.
> > No code changes from v7. Only the base of the patch is updated.
> 
> I still cannot apply the patch. Are you sure you rebased correctly? You
> mentioned that the patch didn't change, so I think no :(

I think I know what's wrong. This patch is created on top of another patch
of yours:
https://lore.kernel.org/linux-staging/20250525064426.9662-1-donnyturizo13@gmail.com/

Please mention any dependency in your patch. But I suggest waiting for the
dependency patch to be applied first, before you resend this one.

> I couldn't apply it to verify the build, but I seriously doubt that this
> patch doesn't break the build. Are you sure you built the driver? Make sure
> you have CONFIG_RTL8723BS=y in your .config file. Also double check that
> there is a drivers/staging/rtl8723bs/core/rtw_cmd.o object file after the
> build.

I can verify the build now, and yes it breaks the build :(

Best regards,
Nam
