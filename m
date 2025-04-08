Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E03B264A85
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104528; cv=none; b=nOLh/oEF/uumUwFepy7zRW5K/aFftmtQt7xaYayitB+4gUm4FDEXmnpqTWlF7HLcrUOhav/IznXafsvna0x0aJkH2fu4Xj+NmF0BF26zfLJTuGKfnt3MVauIzSsLmrWrfg4vYJ24cb2nHQk8anfsuFgc/f7tZJTYdUU8SBoB2oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104528; c=relaxed/simple;
	bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlpch3DTIJ9d2Dd04geenhZphI9+JIROHo8DNgRfIh7V8mRQ8zaGLfcAfaBEfGHmbLTc+MbUhmxCcV07+LmzyOTNWxOWoEgq14IrjeMVLdzydL7EtSlMGP6mtztgHnEFuHFinrtPwVDAOTICfmRZbktgpBooMEyfawTlOczW70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAXgZz0D; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAXgZz0D"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51eb18130f9so2850742e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104526; x=1744709326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
        b=PAXgZz0DCFipR3gWvGFO++6dhadDl+svBC3+SERCgb9PA/3Fs+W8Z3+GtSPu4Vt/P2
         nFANCcG1crs80z0BdQf9TzNHHQ1pe8e3Ljop6PP6cz0HcSLcUR9bn0AF1dfNIzBSuUs6
         0IoLyu17xlc7dkUfehkJZR18FqJcdQLRrWv+803+/OzwjQY3aX3OfJBhRT/ilQ1HxkFD
         12oW5jg/aO7CW0d9CIVlpR+T9uSh/OKkKNo82YbxwEhtEum3xrWIAeLHMuym5oQOX/q9
         4LdbrNcz1FCbK9/m66xoQxbAR22EdWsJMio7qNsj0OftPhYUPPy5dq1VGAM4eQ7eabM4
         BEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104526; x=1744709326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QREvVegGtLVwMmCogS+RQMa5V8VJDGpsljqMOl9/II=;
        b=PkI6bqJRGxlQjDjFmrdYp1ny7gRc71de5q+2OmZ7Y9+JJ4E6otMbnBwuJ953pJqkAv
         Rycv3f9AM4BNAhdwEtotNEZAOfhT/MUvDAcf0UqqxDLgXiq77xjXebLHvblA16uuMdk9
         l0sBrB78VHmPzdipIrrtWtIJWuMy/cFTq6mp2g31zu4xt9aL5fgn0NygCVK7IctZJIjY
         qwnDw/xIjmHxOQGumHFL+gg0N/xtyH+Rnfl36YUDm4fNMfAhPT6OYwEQ/0xxtvbjWV1y
         CUhgNJsF+RM+gY1rnKsbYfuXSTq+QUA2Xh9IfP6/Ex7m/AVPwE11Giq/wvEgObld5mPS
         DG+w==
X-Forwarded-Encrypted: i=1; AJvYcCUc/buXcNb/71klN7QQEyqD6G5pcpAj7/J3ej4LMluhElfmz4nyLlCodLGHYN/gNHnT9pZEMWtVMxtNcIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbydmyf1kk9KykxZIpVeFs1SQR0WZE9aJ0RlLyzGc6jXN4JQ6
	prPC+1/NgSW8YCa5+edYrzrk5DFtaxHWMcpX++HJ4XTQsOprX+adlxNbelAlruSB3sLKvrEtmkn
	fhE6h+hVljMp2JuKQ1x1pl3bnI84=
X-Gm-Gg: ASbGnctmU8K2uifYaVvuX+arsZK1ZTjhc0n1PVG5RTu+lfFmVUOYxnMNYXJTdNyrBZ2
	v6bkVJ1WfKKOS94qfKGFqQB0mY8pj9C14wfPRGsDUSlG0QuGmpXUJmQxfTIrhR/nC9wofItU9pf
	Dmxc9ildma6K+IxffPLk97JFWR7ekSTBjjz5XDUQ==
X-Google-Smtp-Source: AGHT+IE1pMeyij0XousxaMOs5MKTqgFNxflsqi+ScekU2Op5JGsVojJssflaxc9WwJgVeZJ3ws+MQNc/NpODWZidWlI=
X-Received: by 2002:a05:6122:130b:b0:520:af9c:c058 with SMTP id
 71dfb90a1353d-5276447946cmr12219148e0c.5.1744104525916; Tue, 08 Apr 2025
 02:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com> <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
In-Reply-To: <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 10:28:36 +0100
X-Gm-Features: ATxdqUFtuUdz2ArHfLMq3iu-Ctptj3cfrYHWhp-iqzKVcn30xuO40CFlbchF8zM
Message-ID: <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:21=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > Tha patchset adds spaces around binary operators and also
> > provides clarity on sequence number wrapping by using a modulo operatio=
n
> > % 4096u, in place of the bitwise AND(&) operation & 0xfff.
> > The patches are required to be applied in sequence.
>
> ...
>
> > Changes in v5:
>
> This is v6. Are there any changes in comparison to v5?

I added a cover letter and named it v6 to show it's a continuation
from v5 and to show I added a
new patch for spaces.
I was not sure where would be best to add the change log so I put it
in the cover letter.
But as it concerns the patch for the % operation, there is no change
between v5 and v6

Thanks

Adekunle.
