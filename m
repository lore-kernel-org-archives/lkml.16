Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE477257443;
	Thu,  1 May 2025 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137824; cv=none; b=npq5avYebltwTwaZm0ZXxdlU6zlcBL/0+yKA6R+9oT2Bazyj8lx7h1tjcxXnRo86eeus7ZMKvZbsprk7a87PwcN3LWxXgtsTYbDI1IK+bx4YM09qstRsh3IwKxz3Lec9lXOheP7e9tqBjWxJcQ83JSWHGaBJRLcCeqsSGtSzFEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137824; c=relaxed/simple;
	bh=Itg065LhDRorZA0J2NZH60yb7a1hVcb/Bdr1CPrif8o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kv5FmT2IXmkvTY2zQ3zJyUKYgRoyJbtDGr9ifdW6vqVQaujHJHyFDfeluvYVi3pVI9sIndIkED5uH2NxVRsLC4nlrfKDC2aYbKK2kCiOBUWH4MYymW6CqzwCiCnA55o/Unx/sAbHdOE0GBgorDRv7VAxOtSLTn5axMLimZ8NYzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVYY4Wq/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVYY4Wq/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF444C4CEE3;
	Thu,  1 May 2025 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746137824;
	bh=Itg065LhDRorZA0J2NZH60yb7a1hVcb/Bdr1CPrif8o=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=uVYY4Wq/Jpjp51lQc9DMyTjTYvlMlbqDuLsTWw/GRWDqn0ovLeyr6KypSDqiJopYo
	 GT1r51Fpd604DW6Zs9CsY1Ix9pJ2PTIgfagSHTSaQCpVEvuN0gRuC11nANTPYp3IhG
	 nHUIfr4iIhQXmFUW/3ilX9v7kXVdbSkjT9E3h6gakyJ9JOcMb7XzZfc5p69fVXETWi
	 lwKqixu6BNSWUjqBiwe/7/7GqznWlPVjMkhvQ3LG/AnrSlCxo+jFUQ+TQXa/i0peAf
	 35y/uMRs2J00kq7cIlKpMkR7Kvh2/J2QRUKyZyqUIzGJ++XQu3iR+F63g5f4OTOaA4
	 tJyWxhStvmsdQ==
Message-ID: <3ba81b7f7859de8ac64e4cf07cc5aa21c3850ae9.camel@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp
 resume path
From: Niklas Schnelle <niks@kernel.org>
Reply-To: niks@kernel.org
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
	broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com,  Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>, Greg KH
 <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."	
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 02 May 2025 00:16:59 +0200
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-25 at 11:31 +0530, Venkata Prasad Potturu wrote:
> update chip data using dev_get_drvdata(dev->parent) instead of
> dev_get_platdata(dev).
>=20
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Call Trace:
>  <TASK>
>  ? __pfx_platform_pm_resume+0x10/0x10
>  platform_pm_resume+0x28/0x60
>  dpm_run_callback+0x51/0x1a0
>  device_resume+0x1a6/0x2b0
>  dpm_resume+0x168/0x230
>=20
> Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data struc=
ture")
>=20
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

This is the first time I see an empty line between the Fixes and the
Signed-off-by tags. I checked checkpatch.pl --strict and that doesn't
complain, but I'm curious now, is that a subsystem thing since you have
it in all 3 patches?

> ---
>  sound/soc/amd/acp/acp-rembrandt.c | 2 +-
>  sound/soc/amd/acp/acp-renoir.c    | 2 +-
>  sound/soc/amd/acp/acp63.c         | 2 +-
>  sound/soc/amd/acp/acp70.c         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
--- snip ---
> index 6d5f5ade075c..217b717e9beb 100644
> --- a/sound/soc/amd/acp/acp70.c
> +++ b/sound/soc/amd/acp/acp70.c
> @@ -182,7 +182,7 @@ static void acp_acp70_audio_remove(struct platform_de=
vice *pdev)
> =20
>  static int acp70_pcm_resume(struct device *dev)
>  {
> -	struct acp_chip_info *chip =3D dev_get_platdata(dev);
> +	struct acp_chip_info *chip =3D dev_get_drvdata(dev->parent);
>  	struct acp_stream *stream;
>  	struct snd_pcm_substream *substream;
>  	snd_pcm_uframes_t buf_in_frames;

Hi Venkata,

Yesterday I ran into what I believe is the issue fixed by this patch on
my very recently acquired Framework 13 with a Ryzen AI 340. While I was
still bisecting this I found a thread[0] of Jacek Luczak having
bisected this and the revert at least solved the suspend issue for me
too, though I was still getting a sound subsystem related crash[2] that
looked related so was waiting for a proper fix. As a side note you
might want to consider adding a Reported-by tag from Jacek.

I had mentioned this on the Framework forums[1] where Mario Limonciello
helpfully pointed me at this series. I just tried your series on top of
v6.15-rc4 and suspend now works. I also haven't seen the other crash I
was still getting with just the revert from the previous thread. And
sound still works too. So feel free to add, or ignore, my:

Tested-by: Niklas Schnelle <niks@kernel.org>

Thanks,
Niklas


[0] https://lore.kernel.org/lkml/CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cn=
qPTgV_Z8w@mail.gmail.com/
[1] https://community.frame.work/t/regression-framework-13-ryzen-340-doesnt=
-wake-from-suspend-on-v6-15-rc4-works-fine-on-v6-14-4/68514
[2] https://pastebin.com/pR54sve3
