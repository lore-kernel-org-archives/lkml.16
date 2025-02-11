Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F01E885A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261159; cv=none; b=lcVuCsXczDB5Y2XLd/LSb76j3V+jwdEl7V2VVCmNY5IKLwTTUAp7p9/Nz4JcPWYWCPSrcYjNNEYvnIAvw8EeS7WpHetyFvaLdZesxx/BG2ChVMwzzdfQQvhHGUqPq3ixuRDW5LcqzLTHcSglTFQ28hkB1UtanwQN/ps2ZBYLNwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261159; c=relaxed/simple;
	bh=oZul2d/wKFmYJJHdQwxELki+d2o5+CW8gJ8R+CmprR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyOGTktE/B69LeSJ4/pgv/ZKPjU9b8ZcUCsCZfT/1R66oB6iayhPj/otDjVQAlfzQTHfehb8uOcYVSjh3G5JcYu4KJoHCpbpa/1RzAU+eWFkmBCwhkzVgl+BcM9Ze6eoj/nzzeD2dUs+c/ZBCBh3wz0/X0W8uKL82tGyeRMSHA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=K4wyEUEk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="K4wyEUEk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaec111762bso1260515666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1739261155; x=1739865955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJrOUp+F89GFnzwAsaIErFuCcKPjmLvk5s9hg9IRNZc=;
        b=K4wyEUEkD1EmMy5T2wBjcdSdS3491zZV0bOXg0j6PIHJFsnR0+dO1V+JewGd/4Qx87
         wMLCDL/WOLOR2aXEnBfw8YSX9hj0j7hKq+RsZqRWO22J5iCihdRDgF6doQYDn3xIOffm
         UCRNrSXNiOaQRNw+bVwUKcbpuHA6iHlQgAuPJKZSlkVIZwSbbJkAMaRQSS7lJD+LbR23
         QHNiWxKd+9Q59/7uMYBm+8ZsJpWOT9qBmxInOCK6lI3yhqHUboFprkkvf8xR/rfvXy5G
         tcJ3lzFzNBagjFW4RONrkCEfjCY2wWtaVUMwYM0WJr0cW8Wb2x/DwkLZU16c71OWCLDG
         Yw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261155; x=1739865955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJrOUp+F89GFnzwAsaIErFuCcKPjmLvk5s9hg9IRNZc=;
        b=E8qE7mY/AHF1cvEHxCocNnvxKKCUyrH/qry4DbSrkCa2eWT4tvPyDCN9lhgjnrHG95
         cO7FtQn/veRjbPLEwz7/hKUtl0PzrAktDVPi4D8myVET+T7kgl7DUFjbCdOgpGu+VW6z
         7td8aH3SCcoiBOG21+x5pycE/jW/vXF9GGU21grFzNtCLAX1S689tsq0ehjH0gABqbup
         wYhpa/ME2kUfhxev+CUb8kWkiSssWbfqXgw/FOVeuIWIwUjueVToUlMp+/Nv6EsF7zBI
         dSjhC/drgB3hwUqegQwiCaKYtvNGwIns3pLnOQ5Q3T/OqUW4dni3OtjVV01cHi8Lp2mm
         JNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnWRP9ypKPKd4ZFKJme3noLFm9a43T6j3ij6JY0+V8LXdjWMHBRWO25MWSyCGp2or7Q3GQK8n8cqHGmUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylrJpl4zc6n9OpjJ4aCzAWCM7Qu3pZo5bsiR4N0J/tdnO9PAp8
	8qRzlFUbORKPqbQT6CLoJb4Da9qZaYkfbr7+O7+zJNM1TmNEAlkxo0ZfU1AA3C9ZcQK14JFXrJ0
	AKmY9u60Qbp/xdwzzsvjj/h4+Eanjmlh0a+mbzQ==
X-Gm-Gg: ASbGncuo13Vaz5LRIxHl+0JINuJD6P0cptj5qQc2ZErxBdy4usIXp4KFgbA4mE9/QN+
	il9vxs+JI5DmCYPt88ckPzXSNFB8yyjAv7tOdWEVltAUZtU+K8ZPJtIQdlblQWbmM31ECYfi29Z
	Q/hdHofp+UgWWPz/INvPhAU3yPFQ==
X-Google-Smtp-Source: AGHT+IEvCt8BeOXdJg8lh6Pl0LfjKQqELNkqQazSvkXvBC8ZT59e0sRDOAAy7KvIr0fZcwzxkMFleImklwBwEspDSj8=
X-Received: by 2002:a17:906:6a29:b0:aa6:a572:49fd with SMTP id
 a640c23a62f3a-ab789ca2972mr1452330266b.54.1739261155397; Tue, 11 Feb 2025
 00:05:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210223144.3481766-1-max.kellermann@ionos.com> <2025021138-track-liberty-f5d9@gregkh>
In-Reply-To: <2025021138-track-liberty-f5d9@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 11 Feb 2025 09:05:44 +0100
X-Gm-Features: AWEUYZn8IYtLkGvSdhSF9RacLZqPPLjjSSgyWsPBEwf3ckYtzh6gc1WMb8IYbZw
Message-ID: <CAKPOu+-Mi1oCNvk3SJnui3484wpfru3fE1gA72XVcX77PFOjVA@mail.gmail.com>
Subject: Re: [PATCH v6.13] fs/netfs/read_pgpriv2: skip folio queues without `marks3`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dhowells@redhat.com, netfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:30=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> > Note this patch doesn't apply to v6.14 as it was obsoleted by commit
> > e2d46f2ec332 ("netfs: Change the read result collector to only use one
> > work item").
>
> Why can't we just take what is upstream instead?
>
> Diverging from that ALWAYS ends up being more work and problems in the
> end.  Only do so if you have no other choice.

Usually I agree with that, and I trust that you will make the right decisio=
n.

Before you decide, let me point out that netfs has been extremely
unstable since 6.10 (July 2024), ever since commit 2e9d7e4b984a ("mm:
Remove the PG_fscache alias for PG_private_2). All of our web servers
have been crashing since 6.10 all the time (see
https://lore.kernel.org/netfs/CAKPOu+_DA8XiMAA2ApMj7Pyshve_YWknw8Hdt1=3DzCy=
9Y87R1qw@mail.gmail.com/
for one of several bug reports I posted), and I went through
considerable trouble by resisting the pressure from people asking me
to downgrade to 6.6. (I want the bugs fixed, I don't want to go back.)
For several months, 6.12 had been crashing instantly on boot due to
yet another netfs regression
(https://lore.kernel.org/netfs/CAKPOu+_4m80thNy5_fvROoxBm689YtA0dZ-=3Dgcmkz=
wYSY4syqw@mail.gmail.com/)
which wasn't fixed until 6.12.11, so our production servers are still
on 6.11.11 today.
Before these bugs got ironed out, v6.11 commit ee4cdf7ba857 ("netfs:
Speed up buffered reading") wreaked more havoc, leading to 8 "Fixes"
commits so far, plus the 2 I posted yesterday.

I wrote that e2d46f2ec332 has obsoleted my patch (actually both
patches), but I don't know if it really fixes both bugs. The code that
was buggy does not exist anymore in the form that my patch addresses,
but I don't know if it was just refactored and the bugs were kept (or
maybe yet more bugs sneaked in).


Max
