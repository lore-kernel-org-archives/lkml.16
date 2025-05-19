Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC2288508
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675982; cv=none; b=m/0gYPi4VDri5xmGYLEFsUpuGo+M//xVRfoEZzBxofoKg/jCHESop+our6bGdp00CeVkF7IngFfRMGlnKp3lyKVGp7MtH9gBprZ8BHzfhmlANCu9TX8Z9aywH+eyvxwkcsLV3l8cNiWAv0DmMpAd/vxgzKG13xcapJ0RxbUAEdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675982; c=relaxed/simple;
	bh=f4dgfRMtTYcBFr3isa3AuROYQqzp0vO9ur0rnexY61Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8XKKcMjsHmpXL0dESxnfVonZr03VDD421S5pG4NRpASnT1Y9hJvEov7Xk7WdIGp/rrS2zApdPvjoznceQOLV6nEtkmpUu3SZVMIbV9YP1KOb/Ef7zXkqs/L9zcOWhVELNq4mabXbEVK8OEXst5MSEi4QxtbgHt1yABG1HT1lFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cuUXCyV6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cuUXCyV6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231f6c0b692so394565ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747675980; x=1748280780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tcAaZdGQpMjictMPYKyIxyCcVwEKuNN7fh7v7Ym22Y=;
        b=cuUXCyV6qGzXDJwr8AmMAaz21olJquI5M1uyQ1f/7A7gm2nPUPCkNbQh3LwpF11oXE
         FCLsEvNJUG4BLkE+1rjLBOPdjVNGnPUK2dt441bVCKd1PKCCjWelKMUkdORNDsEWP+6z
         gsIJzRaMFoKsiNzVbCe6LFye2nbqA5F9FfkpA646R2Kw5vOiXoJs6l0BJpe10imC0Jpb
         kweDtqVoGP59O+aS992VPEeDsu+lFwwlaAEq5Ol2RTV4LycyRC3sc86uRobpWh86V2o1
         h14JIig+QVjyuB95w0blVG0XSATEBKoj7EnvL4aj+w3NNLudUoJhL8A/a/vueZQbCwg4
         ZjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675980; x=1748280780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tcAaZdGQpMjictMPYKyIxyCcVwEKuNN7fh7v7Ym22Y=;
        b=g9qF57Y1hOaTkPSCl7fyB/4KOfVmdZGLWF6YBokoiTpM3JqLGs95xfZyVpaHFVP/Eu
         1zlkNoFsfLznM4fGN+pmta8tvRaRpYkcrp1j8ZSrNHlX+vNlBA5KptrjzR/ztTuB+nhT
         irk/+PDiEYUVKhq3DW+YA5SP0RspoSU7i5oj5rpxBt62M4S2NVo72hmeWGLWVfOqHRqa
         2919dBezM2cIKyG10eRdOpbIIukX6XQq38SK8Q67J5MK39lQwVBIFGDYyGZnD5JhTAHg
         N2Ci1d4I9NzKVOXJLQSpwJiBkh6fz4rQs+qMcNkd+7zTVfTGHIx/mFlwB6T0ttWDZx8q
         pOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpd0fCW/CiWiN0yPWgqz06NCn8EwaK6F4a1aFBpKP/YpkIBpPY4iY9fUY9jqicM8ukOMYmgPE9DmqNOjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp912Bzp++JMmz/NVjbQpNZg413LVV2DrRGPfCDwlxKAgpTxsT
	c9H+8iE16sF12/L55m9EdWpU3lozdYOTnlOc9SvTJs3xmmvWATYpU0XVZBZBfl9ei9YCEId8bPG
	34Ep3isIKtr/3Rf6jO3d1QX6hUTksvFGP58JYHtkN
X-Gm-Gg: ASbGncufN//HMRL0ZBoTf1OH9+EkTxBdHCJ6c/zrA4u6cXQ7hHxGTUDeveUvTLormx1
	ZThly9MabWMAyxWZ8bm+oQCAmdnm7QZvj+TTG2McVLqzaRJ0TAPV3apBBRIe+p9DotOYl7IsIqy
	t1C8AzZL8+MaB+zCgUhZWvm3fvTSAmq5cmWhjEI5R6EXZH
X-Google-Smtp-Source: AGHT+IGs+elfCZbGySGmARwysKiN5p4pA5ucWH3hrD3Nt/Z1HRaqMpOBAmn2/ArPLy46knYKJuvBPtRwFmnKGvjEYGw=
X-Received: by 2002:a17:902:d48c:b0:22e:766f:d66e with SMTP id
 d9443c01a7336-231ffd1ac56mr5590675ad.12.1747675979944; Mon, 19 May 2025
 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
 <20250519023517.4062941-8-almasrymina@google.com> <aCtQIK-vFm6j6o9w@mini-arch>
In-Reply-To: <aCtQIK-vFm6j6o9w@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 May 2025 10:32:47 -0700
X-Gm-Features: AX0GCFt0iOE7Rccr5An255yF4CJvW76_sgtAE7JjibiHwryZmUnfjp-kmbjPgrI
Message-ID: <CAHS8izOKZBtDQT7zjd81v8X5sAXB0NAsL8iXYg3_0zurwF1WhA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 7/9] net: devmem: ksft: add 5 tuple FS support
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:37=E2=80=AFAM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 05/19, Mina Almasry wrote:
> > ncdevmem supports drivers that are limited to either 3-tuple or 5-tuple
> > FS support, but the ksft is currently 3-tuple only. Support drivers tha=
t
> > have 5-tuple FS supported by adding a ksft arg.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >  .../testing/selftests/drivers/net/hw/devmem.py  | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/t=
esting/selftests/drivers/net/hw/devmem.py
> > index 39b5241463aa..40fe5b525d51 100755
> > --- a/tools/testing/selftests/drivers/net/hw/devmem.py
> > +++ b/tools/testing/selftests/drivers/net/hw/devmem.py
> > @@ -21,14 +21,27 @@ def require_devmem(cfg):
> >  def check_rx(cfg, ipver) -> None:
> >      require_devmem(cfg)
> >
> > +    fs_5_tuple =3D False
> > +    if "FLOW_STEERING_5_TUPLE" in cfg.env:
> > +        fs_5_tuple =3D cfg.env["FLOW_STEERING_5_TUPLE"]
>
> I wonder if we can transparently handle it in ncdevmem: if -c is passed,
> try installing 3-tuple rule, and if it fails, try 5-tuple one. This
> should work without any user input / extra environment variable.
>

This seems like a good idea, yes, but I think install a 5-tuple one
first, and if that fails, try a 3-tuple one? 5-tuple rules are more
specific and should take precedence when the driver supports both. It
doesn't really matter but the 3-tuple one can match unintended flows.

--=20
Thanks,
Mina
