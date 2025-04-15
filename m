Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFEE2C2AA5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757789; cv=none; b=jnrtsX0bpBQkOWE221aF10wjtZA2ZTlVQczkrzV1iYMLTSgxuyPf7bRz3jFRhP6jagOfyubJk4Bkv43aOObEUn167GcOryt0GkqApBCqmmDWcNDICaPRo+xOqe+GLb8VS95CKxHPB1Cxb9yE6pN0k2KwFEWacIdsFQ/Rb99dmew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757789; c=relaxed/simple;
	bh=Dtp0Ew2WwF87zrlIvt5mmaxscC1Uwtx809PYwDWVHcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LB0uJWNAOznh+vrVUVAu7yyciMFDHE1wP9kI/qUJRkrtDMi3720sti5UKirqM1fosTmEpwOQQBSFnrvNhGve5oljA67goowKlaOVopWdkAUgz/2uTBAW+hFcAan2aIQNE4HcdZVjMtbZqLRUyMMKW1A/0sUc7ZQj6EQHwu1SFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ib376paP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ib376paP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3577516f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744757786; x=1745362586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3If7k3RyO/I6fUflyAfIyqgexoXUQ5iUnIIFxgXyydo=;
        b=Ib376paPEoN4uLNZWghMaZ7yJTG1qyz6GuUGWrc7XggxFh+CSCd9oxnSAozuP9WPta
         rBw5XP/qwHNTIe9N2Hdar8UsElM2eSoKY7bF68eKbmX2XQoJB+FnHHuB98Vg7IdfXUf5
         p6e6BQ7/mnEOKPmhgG210bPEmIqioHFUxNzT5mFv4oCylJtkxyeaJx/kQAUHwXmgaXYh
         zDrD9FvKjZGS/+k4ULwjVAyJcOPZBywi52/kSqKPQ2e/HDo+3Oppt5kiIU674XViCLcs
         s3i00MjcoV4FUCe/W/7bqjEL6zFSieUPU7LY4JquG4fMJvtuUFzkkPdg/VCcpBY36L8k
         s9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757786; x=1745362586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3If7k3RyO/I6fUflyAfIyqgexoXUQ5iUnIIFxgXyydo=;
        b=iuSlhhjBdBqV2e1aIrcgWqtOToYyQQfY81m7iwJXzL8hD/1H6HhFCBqoC34cRyIzFN
         zUgKqZ4b8MiTE0mOo+7nFbW1R+4t4p9jknC4BeKjWhmtpoI+PWninw9TUCtg1HeoGbBM
         0z09eP8KVoniXvTKKYly15lUIg9qpVhq8ZdeHfw++7zmbVwtLagN0mKURpVnRrwjryOC
         ntcKY15/a1nBp5Jx1RrrB4uF8afHDm/9N2coqg+hvcRPnsB8T1XI7iwFelFxUTCV9ujb
         faSBwfWDssey6zKHjxUdkSz7zvitpXUxefmn63VlU5iPwxpTt2gn1aDCSKXraVdIEqCP
         0AQw==
X-Forwarded-Encrypted: i=1; AJvYcCXVWYF/bOTiv6XvOityj1zh+H7qYHS1YC8RyMfen1onvJtcZ3jwWGC0UrXVHP6d50dcy9I1bSMwBfz+o/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Pzz3WUFQsn3iePWeC12Pj7C3fs1zC3A5zFQZuTRetLhtfLum
	mSP6ZxYRpi2eX6J16fNbinRYlSGEtAKgcSJHk/oeImW5Hmma1jJ03FZdpYCvnNJKd+Y4YY7Ej4s
	OFeCdRh30RAT33imHpp2DPLg3m8JLDVTGZWzV2w==
X-Gm-Gg: ASbGnctwryXgyBN+r6ZKLrm2NrVcXfS05pqlOcxWogsVWCQADncd0quJdd03Isb7+Ig
	TbTwI4BnNYT/8Q/LO4lZSP9ybQ8f4L1efrCArJvBBWwLedEFzdizn7/EsNdqXdgP5036waXO2mr
	1C0d5KzGiutICoPvMPZbdRH7c=
X-Google-Smtp-Source: AGHT+IFcNDsrcNCH8Q24yY3mTpK4pth7d9TvsL/u1zESgnK/ipjfg+Ehr9cGOY5H3d0S1WGllQ5zEyr+jMS27JqPzKk=
X-Received: by 2002:a5d:5985:0:b0:391:3988:1c97 with SMTP id
 ffacd0b85a97d-39ee2735d90mr864563f8f.17.1744757785711; Tue, 15 Apr 2025
 15:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org> <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com> <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
In-Reply-To: <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
From: Randy Jennings <randyj@purestorage.com>
Date: Tue, 15 Apr 2025 15:56:13 -0700
X-Gm-Features: ATxdqUGuHiF5Y1y-MoFercqMi-QmRef-lccw-wWNHKmkyEwcQpl5D1wFsIX8bvU
Message-ID: <CAPpK+O3QXTEe0BV5M+P644Xs-0rFvxg8w2MR51kwG7_7374Emw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Daniel Wagner <dwagner@suse.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>, Daniel Wagner <wagi@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, 
	Hannes Reinecke <hare@suse.de>, John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 5:17=E2=80=AFAM Daniel Wagner <dwagner@suse.de> wro=
te:
> On Thu, Apr 10, 2025 at 01:51:37AM -0700, Mohamed Khalfella wrote:
> > > +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
> > > +   if (ctrl->cqt)
> > > +           delay =3D msecs_to_jiffies(ctrl->cqt);
> > > +   else
> > > +           delay =3D ctrl->kato * HZ;
> >
> > I thought that delay =3D m * ctrl->kato + ctrl->cqt
> > where m =3D ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
> > no?
>
> The failover schedule delay is the additional amount of time we have to
> wait for the target to cleanup (CQT). If the CTQ is not valid I thought
> the spec said to wait for a KATO. Possible I got that wrong.
This is correct (according to the spec, if CQT is 0, wait for KATO
instead of 0).  I would treat that as a suggestion, though.

> The factor 3 or 2 is relavant for the timeout value for the KATO command
> we schedule. The failover schedule timeout is ontop of the command
> timeout value.
3 or 2 is not related to the timeout value of the KATO command.  The
timeout value of the KATO command is whatever the host wants it to be
(with some values being more productive than others).  The target is
supposed to respond to the KATO command as soon as the target receives
it (roughly).  The host timeout value should account for network
delays and getting-around-to-it delays on the target.

2*/3*KATO is from when the host has detected a loss of communication
to when the host knows (given some assumptions) that the target has
detected a loss of communication.  A command timeout on the host is a
fine time for the host to decide that it has lost communication with
the target, but there are other events.  At the time the host has
detected a loss of communication, it needs to tear down the
association (which includes stopping KATO & starting disconnect on
_all_ the connections in the association).  CQT does not start until
the host knows that the target has detected a loss of communication.
So, Mohamed's delay is correct.

> > - What about requests that do not go through nvme_failover_req(), like
> >   passthrough requests, do we not want to hold these requests until it
> >   is safe for them to be retried?
>
> Pasthrough commands should fail immediately. Userland is in charge here,
> not the kernel. At least this what should happen here.
This is not correct according to the spec, and, I believe, not a good
implementation choice.  The driver (in the spec) is instructed _not_
to return an error for any request until it knows (given some
assumptions) that the target is no longer processing the request (or
that processing does not matter; as in the case of a READ).

Sincerely,
Randy Jennings
