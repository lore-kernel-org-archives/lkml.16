Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E51C695
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551457; cv=none; b=i9QA7d4iklT0m4Z47kFOheJCujSmXlWCP2kZC00Mm4EnjXirX2TysA8Ws04IydW+KD2W/Y3o1C5w7D4vPPG14jR9QNs8v+xU12yQWaXTUl7FVB6AGK4gDTRbHWDd1fPsg8PQLzOimP+b6sa0qzmTTiHHlHxIDh0nd2AfX0EtyjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551457; c=relaxed/simple;
	bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhPoqVc/2NKjqRtCt8Bx39fMvibGAVfsvtxObkiESyGQnmoybZcZj4EtY3UJi6hhE1/7MVPnw+fZgvbVb3PCZK7uk56gl3ogoPXcuwYwHYUoKavm098CHDXnolcabuFC+0m3igSGsRw+P2Kw0Ux7hRK5JKBLhWZbHNLZ4o7ld34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LiHhL4C1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LiHhL4C1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so7480a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738551454; x=1739156254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
        b=LiHhL4C1xEtPLUL2L8pFkxwTc+m0bdUz+efikqYCcJpzZhdr770N+oO4ZQFEb6mf1E
         JFynIOYiYXunfH1C9/sLv9xT9Me9Mw0xDFIcZUxZ2JRMqB5Me8ArxX6/3ctdmr+VC+WS
         eI8upoP+YGYN0o41SsI79+mTek96ddiqbz+pWi41BOrdlagW+Kj7sHHmOHRjXLVMXCic
         wfkNrNSOqNgrWaAM9DiXYMKP12/EYceQY3ikZfm1GcVfXDAG1DLueAGpg/6g49pAzP7X
         jR/BI9uysI9pI3CMJRFCU2xKzRfZNHksQp4geKS67D4Fy95+u4tPnzhNeCsfvrkQG84A
         N47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551454; x=1739156254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
        b=thNd7j0hQF5lESTIeLRoMhPkRbdoJkl5JEl66gkLoH9rDpe1A6hlI0qC8lSs0fIbE1
         NrUL+ktRvLeJrE6rkGLuPJvHPHMsODKQxcmYkUmjDXAnCWYJmC9r9U3S6HiVYUnn7Ue8
         AQhKt2zcoPwbmYvHqrz6AOpXbjgODDyqtHyuGfU6H7slCulYpBX6iWQbgBSqGevyGbzM
         IBXqXmAruwTUkxmWWEbJwJKmM9CtTxNosBwsHN7EoSrhViqo9EJEiXt5BRfP3auh53Pw
         YGlsci5KzpZgAKYINtKloOo859KVK28Yx7yUwxr9eV1A0gtBNOIwT15lNLZqW2O+h6I7
         4mSg==
X-Forwarded-Encrypted: i=1; AJvYcCW+/yDe4G3iVq93KiQal5xAye43ebMVpTf5jdGAWdX9wGHu/KkccErVDJMykcmMrW0TVFlrsyQTj6lwrwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbBH2p70RCftyxQuYgWA0oMKcKPqNLmkvBTTWIVX0WFmGOqlz
	iAVkGtF6Vqb2TxX+4DYdRSezWESO4NuoGO52cDCcKTPiXl/0OND3eLe9ypIDZRmeuDtdSJ8PW45
	ThMXERYUPLqVv7D8BmX5vhPqNmIOPG0+o0l3+
X-Gm-Gg: ASbGncvvCt3GAPLcZRxueZAMra5gqpOzabqzMI7RKoz86n5Ge2yWs9W0Doq4DMNT8/Y
	TUBe2jzi8GvUaj3zKdgOroIWwL9aoqJHrmj31cRxDE+Vzsh3NmGRLIx8kiQrPZALI1LVQjmkli7
	Rah4SOXpOVTV5yAPzf7xQyAMBNujA=
X-Google-Smtp-Source: AGHT+IF7JrZuT9VadDGHDwYrpNWOiZxVM7fVQSarJ5BK/L8psYHiK1IzNqfvJ3STqS/R022ep8JftZGoUuEqEBxsRbg=
X-Received: by 2002:a50:d79c:0:b0:5d4:428e:e99f with SMTP id
 4fb4d7f45d1cf-5dc91ce776emr89869a12.3.1738551453987; Sun, 02 Feb 2025
 18:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev> <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
In-Reply-To: <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 3 Feb 2025 10:57:00 +0800
X-Gm-Features: AWEUYZmglGYEOfj-nWE4mZnVnlY9CRf3vG5h3Gw3rFrIW4r9R0jI5e-8yCDJ_6o
Message-ID: <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 11:22=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> I am not following, sorry.
>
> Is the desired outcome to
>
> a) prevent the system from entering S3 if there is an active USB audio of=
floaded stream?
>
> or b) allow offloaded transactions even when the system is in S3?
>
>
> which is it?
>
> a) would be rather interesting, but currently we don't have any such beha=
vior supported. When the system enters S3 all audio stops. The stream will =
resume when the system goes back to S0. Do we really want the battery to dr=
ain in S3?
>
> b) seems rather complicated, once the on-going DMA transfers complete the=
n who's going to refill buffers for the USB offloaded streams? Allowing the=
 lowest level to operate even in S3 is only a small part of the puzzle, som=
eone's got to provide data at some point. Unless the data is generated also=
 by a side DSP having access to mass storage or wireless interfaces?

Thanks for the question, the intent of our proposal should be (b), to
allow offloaded transactions even when the system is in S3.
In our design, the DSP wakes the system before the buffers are fully
drained. This patchset enables the USB controller for offloaded
transfers during system suspend (S3). To be precise, this patchset
focuses solely on enabling the USB controller in S3 and does not
include other necessary components for continuous offloaded USB
transfers. I'll revise the commit message/cover letter to reflect
this.Thanks for highlighting the potential ambiguity.

Regards,
Guan-Yu
