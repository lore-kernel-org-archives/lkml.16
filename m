Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B07D42AB4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848184; cv=none; b=G8YzSpZLzba7UsB/Mdm1gQMYHSIRbHIytzpmfpy2tRl99JGnPZWLYD5W1ATegx0v3otbwxn8B0KGulP9j0KGWvW9SFyAwwVCQ8tRgUWwSYbY/L1cnffnqjibBgEGEnohr0sJDb2thMIhn3vY+wzSTC4EgutZjqdFLMohwJ8vwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848184; c=relaxed/simple;
	bh=0HDB1mZctYwt/1x+gyO8mvirWFsYyU7+iUgWF/+t5Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVT/fy8Y3aBBKPe828KBG21jzSKfAWlXRf+QfTlxnp9fND2sCxE4E0ywQ03hPmw9V43Foc+OcfLZMweXoGr+53B9I2lmjMyTWlSjKNxLt4aL4f3/BJWZayBPmeUQIIT03Eq1cKqYo05HgcRQns0LajuJAKjd5OEgEZzHanm1gPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bT6KtZdl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bT6KtZdl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231f6c0b692so805525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747848182; x=1748452982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpxEducQ/ZX5Sur11fICgrAYM05G9MHT3sn7Odt8Gss=;
        b=bT6KtZdlogdw+hII7BKLq5rKf1R4Ai+5o5IoHoRw2VY46RdZ5wBbuvESBUAA9s4Bx8
         C1ryyfAMUFb4DlXRmMFsVPqGIt7ibHz0IzMlyIDdePiwCC/1cjSVx+Vo+Fv7XD8qqGhi
         eHLhmmJZKtZ5zxjfhJziLJIGj8k5Y4JHxFO1QbUXHckzBEHMqUDi4RVF/Xp7EwACwnyr
         EodBoB4cjAgHGFo+KoWuxcgVSjbXPgdY/9iVEMou5SeHpK6FC8omQBTe4dd/Z3rD/eWg
         v9HntJY0W+MGlar4PraEHCC/GTbXuFPA99lECHnKoEOX9+UoAZ3Ws0aLhz/qRupjVWDc
         SqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848182; x=1748452982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpxEducQ/ZX5Sur11fICgrAYM05G9MHT3sn7Odt8Gss=;
        b=upVbuI5ZQdHOhJMViEgThUCLUpnJ5dEaB6stjdNoc1kZgFoj6PL49TExsin/WfEXO2
         VwdSsl1634nJHOYIYqRZoKxoYuJzANIPgCBtnzljeEV7wb7ILWwTKTRp4drE1knJjLvh
         RdnpF4evPLyJB7qf9AGLuZerjnsGb9vQ3aGmykVYBPGz1tSfJroDUvpD/ivW9T8cdg7t
         IA8Rw+TUqQfNKTEuSFsBiDRaZrBL+vszYbki+j0AnvdnFZycWMlTVG+V8gdqZgJVV0WT
         9vJpVd5MjRUA2fezSMxD+wgFmTMy6kNOt7QAvjuM1XSkvQZ5dAi3mVEcCDCtcA4qQme8
         lnng==
X-Forwarded-Encrypted: i=1; AJvYcCWCXLweKeQc1lejvW5NN3640DFFwz2UnKLdOBBZmHQhFIeIu07jDpxdSY5q1+dp0+tM/aUq+qmBU3Qc2ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMqx4Zj0VvrzAHscpnBHJYB7O+7YMVe4O+Iq1ztBdeah2OWJa
	Yd4CSA+WRaK94SdAfiGXdgestywLl1fj/koGD+kzy2HinYu9JDMJZDgk5tZpcNN1Y2PijOVxMGJ
	2gn+PYFIrkY1L8PUk0m7yQaQ36LbXctzpnaA1fQEa
X-Gm-Gg: ASbGncs0tKamg6AL87JlmDmgUbl33XhdkgSLWdhFTNX8YKawdBGdd4ml0pVeMluXbk7
	HnYPf0o1wuRixHSe74BAjPT3nYgKTVdzgkgOo8xRJvIWNkKJYcOYBirjLfTffwc0SBhO1SQhunc
	k3Fi+mm8i41u0lL15N4qexGA+cqtvQwI4NsEkGK20GTbgus4D/6TUwihpT+ncrHGStdQxYocOd
X-Google-Smtp-Source: AGHT+IHQy1y1txowNTVDdNmkO0yuk9mOPneAGMpXbtWyrWGlg5kTnUBe78IqwiCm7Zm3DXAq7Gz4CkE2rtLd1AuzPOY=
X-Received: by 2002:a17:903:3508:b0:231:f3a3:17c6 with SMTP id
 d9443c01a7336-231ffdd4a29mr11949205ad.20.1747848182102; Wed, 21 May 2025
 10:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520203044.2689904-1-stfomichev@gmail.com> <20250520203044.2689904-3-stfomichev@gmail.com>
In-Reply-To: <20250520203044.2689904-3-stfomichev@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 May 2025 10:22:49 -0700
X-Gm-Features: AX0GCFvBiMczQ9BTZi5IZOJlKyDYL8gD7ekvpiMI_rciZyfjmZfwhxoKPDFEucg
Message-ID: <CAHS8izMEaPUDnoQaYTaTMY719FJ_-Rb-Ui7ika_yZGQ70VWiVQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] selftests: ncdevmem: add tx test with
 multiple IOVs
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, viro@zeniv.linux.org.uk, horms@kernel.org, 
	andrew+netdev@lunn.ch, shuah@kernel.org, sagi@grimberg.me, willemb@google.com, 
	asml.silence@gmail.com, jdamato@fastly.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:30=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> Use prime 3 for length to make offset slowly drift away.
>
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>
> ---
>  .../testing/selftests/drivers/net/hw/devmem.py  | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/tes=
ting/selftests/drivers/net/hw/devmem.py
> index 7fc686cf47a2..d7f6a76eb2b7 100755
> --- a/tools/testing/selftests/drivers/net/hw/devmem.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem.py
> @@ -49,12 +49,27 @@ from lib.py import ksft_disruptive
>      ksft_eq(socat.stdout.strip(), "hello\nworld")
>
>
> +@ksft_disruptive
> +def check_tx_chunks(cfg) -> None:
> +    cfg.require_ipver("6")
> +    require_devmem(cfg)
> +
> +    port =3D rand_port()
> +    listen_cmd =3D f"socat -U - TCP6-LISTEN:{port}"
> +
> +    with bkg(listen_cmd, exit_wait=3DTrue) as socat:
> +        wait_port_listen(port)
> +        cmd(f"echo -e \"hello\\nworld\"| {cfg.bin_remote} -f {cfg.ifname=
} -s {cfg.addr_v['6']} -p {port} -z 3", host=3Dcfg.remote, shell=3DTrue)
> +
> +    ksft_eq(socat.stdout.strip(), "hello\nworld")
> +
> +
>  def main() -> None:
>      with NetDrvEpEnv(__file__) as cfg:
>          cfg.bin_local =3D path.abspath(path.dirname(__file__) + "/ncdevm=
em")
>          cfg.bin_remote =3D cfg.remote.deploy(cfg.bin_local)
>
> -        ksft_run([check_rx, check_tx],
> +        ksft_run([check_rx, check_tx, check_tx_chunks],
>                   args=3D(cfg, ))
>      ksft_exit()
>
> --
> 2.49.0
>

I was hoping we'd add the test coverage without the need to add test
cases to the ksft. I was thinking maybe ncdevmem can do rand() each
sendmsg loop and send a different set of chunks, so that we don't need
a flag.

But it may be too hacky to have the test be non-deterministic, so up to you

Acked-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina
