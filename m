Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735F1ADFFB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738966917; cv=none; b=cSZMnjf14Sn+QQYRv/EVvBpI6F9M9ZTunc0QGQvosGplYMPC2NSDlFPZBFu1momzxy58t1QSITDIj/2MMJkdVvxiH/Xoz0vuBL53QU54e44E0fmO53WPSTl6QCVTc6yYoiZijJpzCNGIicvfKzCo0XhmwxCk2jf+ry0TvbZzP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738966917; c=relaxed/simple;
	bh=tK3rfULmuKjq5ZkQcPkvEUu0wfRoYfeMb1VFEZvdmi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx9hzsB5gVa8tSyYqpO1427cOCQwBQ5x1pkpbHV8jtObFColwGD8aQfFkb5eG71mVtv/Wr+Boa9bijP4WaKigIiYOcStJ5rJgD7AhMiVR6fdwT6YgFGOF9nQFuW5LMGHGIjR6ud+l6fOzEgD6+BmzjFhZMNQyEgXy8JQdJz4yVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=SvhxL5Vf; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="SvhxL5Vf"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f972c031efso32062337b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 14:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738966912; x=1739571712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEPaswESS1PjI7HNTDsrPk0/PCf34GKT+5GZnVwgZXY=;
        b=SvhxL5VfunWjdcxlzGG8u4EHGFeoE7Hsd7VSpFB7mWXw538cZ6lDN4xCKYTXb/F+ny
         JbRof8Ynh2JOOl8IEVEzxfhATq8HT3CWC6o87hI1Dl3UZ3xrmnLWMIGhmVi/pE05I+rY
         wXAW8Gxfq1MDGFgixyMSTZ7C6RkY/wCTbtpQY/iUWB4Px9eYadHPzV5zmwu0p1ba1Fls
         KqkW5/VjK9BGXv1fuP1CZ9vmL9Az40NU67ezIiqr+Ds75KxDZMG7loRBZdD1GTsngRdi
         tzNxoG0aRQBGjAxlrwK8Jz8epBG8jx9S+R7TsMHL4XvmInAhe0rtltaxBlCKY3sgmmVa
         lQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966912; x=1739571712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEPaswESS1PjI7HNTDsrPk0/PCf34GKT+5GZnVwgZXY=;
        b=Xboc7v5LSLhYcLRYEpeVhocJJdTCCX/fRBlccexhni4Rj8f5NCgQ6aGHUVX9WU0DIp
         G+TKamSQbCPbOLcT5BB4KBy37QWz+B9wAcWbwLdtNqOkf/tjIaifv5ZjK+1VslTdYIRB
         iTXoQZfI4Yl1b0Z22F8r3lypiIyIR6AlFcWMgKuNor5Kh29sO8YBT3LhKjzExVu/qhyO
         yzT+QpxLbrbgbeyRjfGdpNAacf3KJ+sD7gG2vD3x+mJEs0Wf+qcQs4dNQS+O+D2jpNcr
         H7UofyDy6DvAWszTas2r8EXpeOMaeT1D4hDNC0M6bjgd2y+ZKYqTWNhmC3/hM3Wrc7S1
         DAsg==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZTueLjZL3vJ03LABiZ4okJ44EciXOHzsi7jpJfYRaMsR4JSkQjLLevaPQ2ljIxvrikw4Hoi/JOvJpS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFC7QdpRnlnhN3dre2ahQ9nUziNAEAxIXZ5xzzoO3EReIHiue
	nlW1ih3CYg6mMBfYfhYOWDgIF0iyEZ0dS3qTCsJxYeMmjFpG2raDLrqmkuyaaCDYUX/PPvcR1y6
	Nipn/CEb86/I9HBcraSWqCo2sz3d3CL3RxB0h
X-Gm-Gg: ASbGncu0G12whx3lAb7cvsxVYBNMjr1SF5KmPGpKvP/Qgkz29z1KPhZxd8v132CfJth
	gJltl24UCWCZDA+li4FKr7U3qfIbHcNbgogx2Kv+AflPzJR+JCfHWlXMbXORtzB1lkDBIoTY=
X-Google-Smtp-Source: AGHT+IHBRA127lA39kegDN775o8sxuc/2TfRWjm6n/rOOXgCq5OxY/YTyMkihpXgx3uBbbWMJZ1NIqaD8HwuOOVN9kc=
X-Received: by 2002:a05:690c:730a:b0:6f9:c6e2:89a8 with SMTP id
 00721157ae682-6f9c6e2c8b3mr21691667b3.6.1738966912666; Fri, 07 Feb 2025
 14:21:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127155723.67711-1-hamzamahfooz@linux.microsoft.com>
 <8743aa5049b129982f7784ad24b2ec48@paul-moore.com> <f4efd956-ebe9-4a02-8b98-b80e16db95af@kernel.dk>
In-Reply-To: <f4efd956-ebe9-4a02-8b98-b80e16db95af@kernel.dk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 7 Feb 2025 17:21:42 -0500
X-Gm-Features: AWEUYZm96FCzr6LWRjIh3Nuf8FgTiXEW22PFLZ07c4RqLniYHD_Dg4aIbl2L02M
Message-ID: <CAHC9VhQDMSw9VNzd1pLRv1a3v8y2wz9rM4k0wa1t-Wq8KO6kFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] io_uring: refactor io_uring_allowed()
To: Jens Axboe <axboe@kernel.dk>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	=?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org, 
	io-uring@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:54=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
> On 2/7/25 2:42 PM, Paul Moore wrote:
> > On Jan 27, 2025 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> wrote:
> >>
> >> Have io_uring_allowed() return an error code directly instead of
> >> true/false. This is needed for follow-up work to guard io_uring_setup(=
)
> >> with LSM.
> >>
> >> Cc: Jens Axboe <axboe@kernel.dk>
> >> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> >> ---
> >>  io_uring/io_uring.c | 21 ++++++++++++++-------
> >>  1 file changed, 14 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> >> index 7bfbc7c22367..c2d8bd4c2cfc 100644
> >> --- a/io_uring/io_uring.c
> >> +++ b/io_uring/io_uring.c
> >> @@ -3789,29 +3789,36 @@ static long io_uring_setup(u32 entries, struct=
 io_uring_params __user *params)
> >>      return io_uring_create(entries, &p, params);
> >>  }
> >>
> >> -static inline bool io_uring_allowed(void)
> >> +static inline int io_uring_allowed(void)
> >>  {
> >>      int disabled =3D READ_ONCE(sysctl_io_uring_disabled);
> >>      kgid_t io_uring_group;
> >>
> >>      if (disabled =3D=3D 2)
> >> -            return false;
> >> +            return -EPERM;
> >>
> >>      if (disabled =3D=3D 0 || capable(CAP_SYS_ADMIN))
> >> -            return true;
> >> +            goto allowed_lsm;
> >
> > I'd probably just 'return 0;' here as the "allowed_lsm" goto label
> > doesn't make a lot of sense until patch 2/2, but otherwise this
> > looks okay to me.
>
> Agree, get rid of this unnecessary goto.

Done.  Converted to return in patch 1/2 and brought the goto/label
back in patch 2/2.

> > Jens, are you okay with this patch?  If yes, can we get an ACK from you=
?
>
> With that change, yep I'm fine with both of these and you can add my
> acked-by to them.

Great.  Both patches have now been merged into lsm/dev, thanks everyone!

--=20
paul-moore.com
