Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F752DFA3B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744664345; cv=none; b=AB7hs7Y39rZTkvnszcYCORuM0mVFKAS32KtDw49JedRCaENPQJ5hujloZX0rMdUKhNe+sikKWUxXFOhNQ5Cri+1h0mnzgRnudWUOj3HwnA6CYm4OMryafOOHIjz03RzREK+Bhyxd0piRgvIVi40v6bErpy7YuGWFcTpjTcfIdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744664345; c=relaxed/simple;
	bh=9ejjMn07q3wk5DOpmKww1OzOGy5oLn8w/R7DTprpKGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZY6Nat82M1GHqGKUNnibWkNhI7z7ym7lmXuu9DG957UAQRDksu9epeEkJTG4JnOtk+gk/WdopNa2EgX0XS/GxDynHJnSEc3Zj8H3LqL0oJF8LIjUYJEhKjNHRCw5CNYC3Um4+xOCopWy9GgOmLwuGtVi/pT3wVRcAuTL+6Ks3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B3BJX9nD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B3BJX9nD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso6495e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744664342; x=1745269142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ejjMn07q3wk5DOpmKww1OzOGy5oLn8w/R7DTprpKGI=;
        b=B3BJX9nDYwoX+6DTieZc7lwMPltDZbfXvp9/XFJYonqv4+NYI4ash1/ZW1arJjfzJf
         KCBPYycwocsiA+Nw1YJX2R8tyl+tcGMeihLIA1RPm8R3CeFneF8PqbbwpVuDsOPqQ4Fi
         F040e+rfRjL0D7vLSo5ONPV6K9w4DZHGAeupuqPqfNZXa84p+wz/s2VGBboMCpwJxaIz
         Z7fHgBcUPS/9mEEnCouaU/OtRbOpfBBZHSo9GN3oVpAC4VY5b6wZyWdNpjcy9STl/xgQ
         p5PC2D2Nf6HFsIkjIJTw6wpsVEyRv/9f2o1l6ssvn9QNdv8E5ewPJv79rNheNsiauhFU
         eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664342; x=1745269142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ejjMn07q3wk5DOpmKww1OzOGy5oLn8w/R7DTprpKGI=;
        b=DOfSvdxu+ZtRzdQ/OQIjRFkCJIoq1T9Q7LBWIjj7NvQq6KwFnBqPL3z6QTC7NAp49H
         r5f0iNlJD8+fCMSxVlHONezq3dKeKNvBzYjKYXIb7koQzGbC/rPlkqKCzXZfGtNVAA6A
         9lNC08D5dwNrxr8SGZ7lcBD2okV37VAMtpEXhe2yvYRwSBLdRAG9uqHl0+i6ShhQHLg4
         t4CSmkgOx15JHtq3WDZ4sVxfOrZnUFXK7swBpepWmtqJ7V3b/Cy5QctHdyZw7QRgqNlI
         rAgnLYUhNJXEJdopjY/fClSoRL/nnuOVtGaAqS55P8Cna6rnFvW2YzEIPKf6xLAwjziD
         wQxg==
X-Forwarded-Encrypted: i=1; AJvYcCVECT9tlPkA4FfyDBOn4dUxJlMFN4lRXRsVm5qo4RfVxE+K3y8GToLdVdmGbJ907Y4ExQBhSe3giLrtDvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeCS4oxOy6nj7+Zv4CgT5tf+tVamYtSGMz6JuooI5oc7eXRS4
	wdY3bF2I52ufrUAMpLlzrdfLhZzYyvzu2iMXCDvop29CynMkMXeFytQQhzulDRcHjD+2OT0YBnE
	Nta/nhu8CtofCIvGqDHY/ik4WsQGaq/2cu06K
X-Gm-Gg: ASbGncuPPFBC8cCA3hHkgG95lG38Yd6TH+kAoHmNiPDlsTRWAbGVWzzm3Ou0+cz6BUj
	3wosMSfhmueUiZU9hdJGeKiHN7zBGdbXXZIfjQP/zxITjYx6rusxLauEC4zP9U7dpL3/fLQGNPn
	Uwn5nPeE1Xhj11rvOW6mvn
X-Google-Smtp-Source: AGHT+IH7/tHz61BTtVznTXE39ajUC59qQLOsJyegs8OyBm3GQR24klNXs7iqiSmYTd23qYN9tIZXtLkatallEk/5pSU=
X-Received: by 2002:a05:600c:1c82:b0:439:4a76:c246 with SMTP id
 5b1f17b1804b1-43ffe57ea31mr173715e9.6.1744664342022; Mon, 14 Apr 2025
 13:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414162842.3407796-1-tjmercier@google.com>
 <ysc4oguaisa7s5qvdevxyiqoerhmcvywhvfnmnpryaeookmjzc@667ethp4kp4p> <8ba51391-d4fc-41e7-8d71-cebc0feb6399@redhat.com>
In-Reply-To: <8ba51391-d4fc-41e7-8d71-cebc0feb6399@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Apr 2025 13:58:49 -0700
X-Gm-Features: ATxdqUG00dp4x6Hri-Ods4PnDq3H-MWCK06nxn5fJWlwVPoVUZpSPZP1VYhzlsI
Message-ID: <CABdmKX2CX_S_bTc11SBJELmGRS=gwiC1gFbTGHk_GTndTYFa+A@mail.gmail.com>
Subject: Re: [PATCH] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
To: Waiman Long <llong@redhat.com>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 1:11=E2=80=AFPM Waiman Long <llong@redhat.com> wrot=
e:
>
>
> On 4/14/25 2:26 PM, Michal Koutn=C3=BD wrote:
> > Hello.
> >
> > On Mon, Apr 14, 2025 at 04:28:41PM +0000, "T.J. Mercier" <tjmercier@goo=
gle.com> wrote:
> >> Add cgroup v1 parameter parsing to the cpuset filesystem type so that =
it
> >> works like the cgroup filesystem type:
> > Nothing against 'cpuset_v2_mode' for the cpuset_fs_type (when it's
> > available on cgroup v1) but isn't it too benevolent reusing all of
> > cgroup1_fs_parameters? AFAICS, this would allow overriding release agen=
t
> > also for cpuset fs hierarchies among other options from
> > cgroup1_fs_parameters.
> >
> > (This would likely end up with a separate .parse_param callback but I
> > think that's better than adding so many extra features to cpuset fs.)
>
> I concur. It should be a separate cpuset_fs_parameters() to handle it
> instead of reusing cgroup1_fs_parameters() to allow so many other maybe
> irrelevant cgroup1 parameters.
>
> Cheers,
> Longman

Hi Michal and Longman,

Yes, that's fair. I'll send a v2 tomorrow.

Thanks,
T.J.
