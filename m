Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3E26057F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883177; cv=none; b=oqL+zWT4//ewvOxBjdG7W6pJvOEHvJlJtL2/8ja44b9YCm9wp/4rXZdUwPvIsbWaNmJbmd5K1VQ+RpOhIZNPvaX4rvfZvmz5VbgCZ/pT7XJPsW7HvTEFs9U6zijrtHP3wziRRxoXNVqY621J0nYapcDtiPOcsmTSiCDN7vNVGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883177; c=relaxed/simple;
	bh=fGfiG/j3zqTYwlMYG6HVon3q3GGuYEiQgw/y/YoGr/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUUdmlG8VukML3l7FxXhwq2CQ4iGgCTVmpLG2BQLSVPp2HwVyUlcujqcEAuqS3xWvHkk1fiLKt8CRfYdpj3Mul73RwdnA9jkqYDtUjBtepJGVb8hUsJaqZITCMjzUycPXmFAlcxcxYK2LMP2nmP2mwFb0icLNGCfFgzpeAopCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbMspW1Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbMspW1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B67C4CEF6;
	Mon,  7 Jul 2025 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751883176;
	bh=fGfiG/j3zqTYwlMYG6HVon3q3GGuYEiQgw/y/YoGr/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbMspW1ZEbLbp8BChhp2S/7qqmDApuXDU5g5W77B2nO1QTdnw7CtoYNIBShomgHb2
	 ysBVRmuwloPBCGocevIyOXVWQeB6Ia84UNswaGDq90wbIo1d/WV+p35VTkUXvvO/i1
	 IEDKHqRUxR5prTLI4feUD6XkXSY4s9knFrWMbqaiLk3gNWejocsohZW/YBaqplXvSv
	 osArul27QLSKNxhZ4qwPkDIcHvjNLzxm9fsjj81IozIJZpWwaT4TC7P+9W4aJBB0gm
	 W1PxzRC4LNKoiDAY/whUBpmptOSqp4asjFyKc+M+fFWgH2JqVppr0Pm7wPpCqolJZS
	 ZR2kwTLgbVBog==
Date: Mon, 7 Jul 2025 12:12:54 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 1/7] timers: Rename tmigr 'online' bit to 'available'
Message-ID: <aGudpkpZIsbNhBvr@localhost.localdomain>
References: <20250626114900.106061-1-gmonaco@redhat.com>
 <20250626114900.106061-2-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626114900.106061-2-gmonaco@redhat.com>

Le Thu, Jun 26, 2025 at 01:48:54PM +0200, Gabriele Monaco a écrit :
> The timer migration hierarchy excludes offline CPUs via the
> tmigr_is_not_available function, which is essentially checking the
> online bit for the CPU.
> 
> Rename the online bit to available and all references in function names
> and tracepoint to generalise the concept of available CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
