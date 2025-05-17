Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3A24B26
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443082; cv=none; b=RcfX90II6Mu/W1RFtvPNf6G8sdpSxi16zdeq6USfcV3Sd9gK+69316MB+qqXC4R1RxVEo0Summpzbca/gOtrebg5qbFiUmzm0W5jRYeVmKoxGbXOPR6yrHoFlWcDqjq812Hlkzob3fsS77KAn3gKVP/tnUdcuMFQZrIwR9Lyve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443082; c=relaxed/simple;
	bh=emC6wSHOX4jBo4J4vC1MTSFuL796KQqnFvFmFmQPylQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTQh3nD0uso/K+IAlg+eyOcvtqdSSDNzXvXk01wyBx50i/UJSC3rNPOeRpvyHP+cU3V7DdBIwOzhXO052u/5vSEUVy03rD4UqlePXQucACAFvT77Qoze8tWkIqB2w/N9JIYwZOUkFlmvm8B5X/qN0hl8ZYjoiHOSL0juJ4yiGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zXOhNWrI; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zXOhNWrI"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c559b3eb0bso180732885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747443077; x=1748047877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emC6wSHOX4jBo4J4vC1MTSFuL796KQqnFvFmFmQPylQ=;
        b=zXOhNWrI11GT10Bh4kxx4kCSg3VAsMzRPUz98zMpV9Ss3q4Z9pJLHIHWW7pmcAX83F
         VekrirhP/qvpq2p20xX9l7vwOywjfStni3yRJyObbmY7qztEdHq3OW//tx0eVHQGwdJZ
         kOpVRYh0YLjf2gkWJbLjhezBUA6fBM4MIdolum13tKY+lWVzJ/1GS5uPzsvEgDuSczwo
         3nIM0DvIyRMwStFjxHA2I2x3NY6rmlBJuEd8KhJ0+NAxM0OYSPzIf0k2XYsbbNJ4BrT5
         3/xlwyPuY5cYGXboQG2+H/fahw0gqWj7ZxT4GDt3WdpE3ol5Bu5eu7l+fQEfZRM3FU/H
         ZX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747443077; x=1748047877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emC6wSHOX4jBo4J4vC1MTSFuL796KQqnFvFmFmQPylQ=;
        b=csetjIVIefw55yZmRrMTbXdCXX1Jr8G6zWTpSDzwHPh6DEF/OK9IaKfsH1kOdcZ63j
         CzG6nDhTkfpoJTYypJS1lw5vtvEpXzgdsNZ/4tCJJav/aY2KG+VLyUmz1ljT17q1paNS
         wIU7tRcn3hQBAhexjPwnbZoNsuExhgAcukTCUK9SUoC7JguI/+Y7aGEPhcZrAL5YAa8Z
         lL3oR2BhPYBsJAbM5xbhFHaLPCNPZOtq2+g3S04TL7rWD94g0bOfxeHVRP4xhAfAICZd
         0cXeCFP/bdPOVuJOwWLV8ZQ5zVaaqICjZSeBqp5w2JU4xXlnOGxux6mWcf6dtvqjfnE/
         u7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWqtaw6s0BhLe0vj3tB1gg+T0+n/zMdWyxpZZsfthqFXJgWULCOfDkVAH0JcBiAC9IoHvuUijhGdkzG7Us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14Uc3mNEWlFsbdUkzg4Y3O4d2rlZ0vNmwCtmt2axepG+OjQtf
	zAdzmmQwkeK9WWqorop+VMqFn4CqaiGWjP48JIpxIKLNjZYtLhlzVoXsboQDCf3aTltNyxXmeY9
	cTYsPlLstUulx5gd+KXCXBeuYk9eSeepO8+nH2N4g
X-Gm-Gg: ASbGncvcetNVYVzZ/SmOJC/qhhmaAbKViZ6I/Sm5zkccTg8X/a1EOb0+zT9HXomvM9G
	7pJv28vOEnKch9yM0I8r66u0bnoP1e0H+1aCwtCSw6bElla23Q0BHg4aQ0caXJ4lFxrrc9eEGl9
	uHaEuU+gdRM3+R3zKtBrY4PwSy4xTdkMQ=
X-Google-Smtp-Source: AGHT+IHXgLhz/4da2oxNryMroYxlfO28K6AlaQIZ/V6cHkp8D4WGQ0LNLoPyvKqahrIjnRVpFmFmoPkjQ5XtiMH7NRg=
X-Received: by 2002:a05:620a:298e:b0:7c5:6375:144c with SMTP id
 af79cd13be357-7cd467237f3mr739080285a.23.1747443077283; Fri, 16 May 2025
 17:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515185227.1507363-1-royluo@google.com> <20250515185227.1507363-2-royluo@google.com>
 <20250515234244.tpqp375x77jh53fl@synopsys.com> <20250516083328.228813ec@foxbook>
 <CA+zupgwSVRNyf40JiDi6ugSLHX_rXkyS2=pwc9_VHsSXj4AV5g@mail.gmail.com> <20250516233829.ibffgnicnxgchbim@synopsys.com>
In-Reply-To: <20250516233829.ibffgnicnxgchbim@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 16 May 2025 17:50:40 -0700
X-Gm-Features: AX0GCFvBBIJ0tJYmNiwSeGuTL7XoFar4ZXbR5vD-1gComRSZi_wkKqrH1wZJz5I
Message-ID: <CA+zupgz=z8A3agOh0P3Q9U=nnjys7FPhYbMt3sdV+P2v_xpXgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] xhci: Add a quirk for full reset on removal
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
	"quic_ugoswami@quicinc.com" <quic_ugoswami@quicinc.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 4:38=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> Hi Roy, Micha=C5=82,
>
> On Fri, May 16, 2025, Roy Luo wrote:
> > > There's no state 0. Checking against that is odd. Couldn't we just us=
e
> > > xhci_handshake() equivalent instead?
> >
> > Ok, I will change it in the next version.
> >
> > On Thu, May 15, 2025 at 11:33=E2=80=AFPM Micha=C5=82 Pecio <michal.peci=
o@gmail.com> wrote:
> > >
> > > On Thu, 15 May 2025 23:42:50 +0000, Thinh Nguyen wrote:
> > > > In any case, this is basically a revert of this change:
> > > > 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
> > > > helper")
> > > >
> > > > Can't we just revert or fix the above patch that causes a regressio=
n?
> > >
> > > Also note that 6ccb83d6c497 claimed to fix actual problems, so
> > > disabling it on selected hardware could bring the old bug back:
> > >
> > > > In some situations where xhci removal happens parallel to
> > > > xhci_handshake, we encounter a scenario where the xhci_handshake
> > > > can't succeed, and it polls until timeout.
> > > >
> > > > If xhci_handshake runs until timeout it can on some platforms resul=
t
> > > > in a long wait which might lead to a watchdog timeout.
> >
> > On top of this, xhci_handshake_check_state(XHCI_STATE_REMOVING)
> > is also used elsewhere like xhci_abort_cmd_ring(), so a simple revert i=
s
> > off the table. Commit 6ccb83d6c497 did not specify which platform and
> > in what circumstance would xhci handshake timeout, adding a quirk for
> > DWC3 seems to be the better option here.
> >
>
> Regarding the commit 6ccb83d6c497, I'm assuming Udipto made the change
> for Qcom platforms. Hi @Udipto, if you're reading this, please confirm.
>
> Many of the Qcom platforms are using dwc3 controller. The change you
> made here are affecting all the dwc3 DRD controllers, which has a good
> chance to also impact the Qcom platforms.
>
> > >
> > > But on the other hand, xhci_handshake() has long timeouts because
> > > the handshakes themselves can take a surprisingly long time (and
> > > sometimes still succeed), so any reliance on handshake completing
> > > before timeout is frankly a bug in itself.
> >
> > This patch simply honors the contract between the software and
> > hardware, allowing the handshake to complete. It doesn't assume the
> > handshake will finish on time. If it times out, then it times out and
> > returns a failure.
> >
>
> As Micha=C5=82 pointed out, disregarding the xhci handshake timeout is no=
t
> proper. The change 6ccb83d6c497 seems to workaround some different
> watchdog warning timeout instead of resolving the actual issue. The
> watchdog timeout should not be less than the handshake timeout here.
>
This makes sense, I will send out a revert of 6ccb83d6c497 then.

Thanks,
Roy
