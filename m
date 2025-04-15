Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC22309B6;
	Tue, 15 Apr 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716899; cv=none; b=LkQMJQU+7f6Z/52PEnrIsPmoZpHQ4Hjki2s7KuTrD1XtXpd9iAl+pfdrscBmPNGCewBVxENtAfHuCUuDvtfaMFjH+tNBlkVBWSvRSMrgY+EvW+KAvf/hluZXcnCOrYQmXr96eYpJ5WQQrkg4KY99vp5EtBlXryLev8dI6w3J6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716899; c=relaxed/simple;
	bh=VvbYNPXEIAjf/KeE1NBkd5nqIQJfNLJU5dIe4vPAdpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oOPJCkI+yGIKBrKHto+yQC4S4d2QUG2fNasGISBPkEYNv6HCL3E28WaAkQbCA4MBGDeqg6XHn4ljJ+I+N76WVV8hrWDiBxG1EiDlIo6LpkJlMy6Lp+2sDQnccz7VAP8I8FVzdhcALNsfvj/wWjGAJv81nF+90q3JIv2GLGFOQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdzr+ERL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdzr+ERL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB14C4CEDD;
	Tue, 15 Apr 2025 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744716899;
	bh=VvbYNPXEIAjf/KeE1NBkd5nqIQJfNLJU5dIe4vPAdpA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gdzr+ERLwT6QEhOUvS3fsZ7QWkUZzv085l4z2ghp1KkrJ0B709wwuviidG+L9ulPm
	 vqBCzNNsgAqIjbQIco4HMhYyn3tDinVenaqsXHQRmcmrGhg5pdOW5GdU/GLz20AADW
	 nxOYIk+fnSQ4HGUlIkkUfFaJwIhgFSxVi098XPTRcvTxRJ8tky2WOHvnNhJqmWxbcB
	 Abm0TbxIksXPqJMwiPU9jiTmnjX84Da/xWR4m6reihLifEIzyUW+gFTgSYCEKm37I0
	 e0aVHR7eAwJUmdb80ZzBDMpePIvFL1gN542U1fpivpW3g9qzUd3xy/oKhskK4Vchjx
	 tO6cNEtD1htdw==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250414114528.355204-2-thorsten.blum@linux.dev>
References: <20250414114528.355204-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] ASoC: cs-amp-lib: Replace offsetof() with
 struct_size()
Message-Id: <174471689730.19628.17211699174764357615.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 12:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 13:45:28 +0200, Thorsten Blum wrote:
> Use struct_size() to calculate the number of bytes to allocate and used
> by 'cirrus_amp_efi_data'. Compared to offsetof(), struct_size() provides
> additional compile-time checks (e.g., __must_be_array()).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib: Replace offsetof() with struct_size()
      commit: 46e7ea05bf5d9fe4d05e173c824ae173c956cb5f

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

